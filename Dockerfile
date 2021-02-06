FROM debian:latest

RUN apt-get update && \
    apt-get -y install unzip curl apache2 libapache2-mod-php7.3 php7.3-xml php-cgi php-mf2 libphp-simplepie 

RUN cd /var/www/html/ && \
    curl -kL -o master.zip https://github.com/bigbenaugust/feedreader-gcp-backup/archive/master.zip && \
    unzip master.zip && \
    chown www-data:www-data /var/www/html/feedreader-gcp-backup-master/php/cache && \
    chmod 755 /var/www/html/feedreader-gcp-backup-master/php/cache

CMD /usr/sbin/apache2ctl -D FOREGROUND

EXPOSE 80
