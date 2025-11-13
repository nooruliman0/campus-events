# Use nginx as the base image
FROM nginx:alpine

# Copy your project files into nginx's HTML directory
COPY src /usr/share/nginx/html/src
COPY styles /usr/share/nginx/html/styles

# Expose port 80 for web access
EXPOSE 80
