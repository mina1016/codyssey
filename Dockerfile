FROM nginx:alpine

LABEL maintainer="student"
LABEL description="Custom NGINX image for Docker practice"

COPY app/ /usr/share/nginx/html/

EXPOSE 80
