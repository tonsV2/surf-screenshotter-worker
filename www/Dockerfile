FROM php:7.0-apache
COPY upload.php /var/www/html/
RUN mkdir /var/www/html/uploads
COPY htaccess /var/www/html/uploads/.htaccess
RUN chown www-data /var/www/html/uploads
EXPOSE 80

