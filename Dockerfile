# Use the official NGINX base image
FROM nginx:latest

# Copy custom configuration file from host to container (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
