# Use nginx as the base image
FROM nginx:alpine

# Copy your project files into nginx's HTML directory
COPY src /usr/share/nginx/html/src
COPY styles /usr/share/nginx/html/styles

# Expose port 80 for web access
EXPOSE 80
FROM node:25-alpine AS builder
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npx parcel build "./src/index.html" --dist-dir "./dist" --public-url "./"

FROM nginx:alpine
COPY --from=builder /app/dist/ /usr/share/nginx/html
