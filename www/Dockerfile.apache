FROM php:7.0-apache
WORKDIR /var/www/html/
COPY upload.php .
RUN mkdir uploads
COPY htaccess uploads/.htaccess
RUN chown www-data uploads
EXPOSE 80

