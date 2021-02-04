FROM debian:latest

RUN apt-get update && \
    apt-get -y install unzip curl apache2 libapache2-mod-php7.3 php-cgi php-mf2 libphp-simplepie 

RUN cd /var/www/html/ && \
    curl -kL -o master.zip https://github.com/bigbenaugust/feedreader-gcp-backup/archive/master.zip && \
    unzip master.zip

CMD /usr/sbin/apache2ctl -D FOREGROUND

EXPOSE 80
