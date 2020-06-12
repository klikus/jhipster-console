FROM nginx:1.18.0-alpine-perl
RUN apk add apache2-utils

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT htpasswd -bc /etc/nginx/.htpasswd $USERNAME $PASSWORD && nginx -g "daemon off;"
