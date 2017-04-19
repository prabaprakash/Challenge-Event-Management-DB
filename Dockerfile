FROM nginx 
COPY . /usr/share/nginx/html 
WORKDIR /usr/share/nginx/html
EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
