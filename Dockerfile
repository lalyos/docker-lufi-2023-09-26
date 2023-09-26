FROM ubuntu
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y nginx
RUN echo lunchtine > /var/www/html/index.html
CMD ["nginx", "-g", "daemon off;"]
