FROM debian:latest

WORKDIR /var/www/html/

RUN apt-get update && \
    apt-get -y install unzip curl apache2 libapache2-mod-php php-xml php-cgi php-mf2 libphp-simplepie && \
    curl -kL -o master.zip https://github.com/bigbenaugust/feedreader-gcp-backup/archive/master.zip && \
    unzip master.zip && \
    chown www-data:www-data /var/www/html/feedreader-gcp-backup-master/php/cache && \
    chmod 755 /var/www/html/feedreader-gcp-backup-master/php/cache && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
