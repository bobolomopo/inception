FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

COPY ./conf/default /etc/nginx/sites-enabled/default

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/nginx.pem \
        -keyout /etc/nginx/ssl/nginx.key \
        -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19/OU=jandre/CN=jandre/"

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
