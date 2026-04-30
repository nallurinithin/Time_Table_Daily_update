# ============================================================
# Dockerfile — Weekly Study Dashboard (Static Site)
# Base image: nginx:alpine (lightweight, production-ready)
# ============================================================

# Stage 1: Use official Nginx Alpine image
FROM nginx:alpine

# Set metadata labels
LABEL maintainer="Nithin"
LABEL description="Weekly Study Timetable Dashboard - Containerized with Nginx"
LABEL version="1.0"

# Remove the default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy our static site into the Nginx web root
COPY index.html /usr/share/nginx/html/index.html

# Copy custom Nginx configuration (optional — uses default if not present)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 (HTTP)
EXPOSE 80

# Nginx runs in foreground (daemon off) by default in the official image
CMD ["nginx", "-g", "daemon off;"]
