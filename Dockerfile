FROM httpd:latest

RUN apt-get update && \
    apt-get -y install unzip curl php-mf2 libphp-simplepie && \
    cd /usr/local/apache2/htdocs/ && \
    curl -kL -o master.zip https://github.com/bigbenaugust/feedreader-gcp-backup/archive/master.zip && \
    unzip master.zip

EXPOSE 8080
