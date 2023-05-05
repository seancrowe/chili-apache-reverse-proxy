FROM ubuntu/apache2

RUN rm /var/www/html/index.html && \
    a2enmod ssl && \
    a2enmod proxy && \
    a2enmod proxy_http && \
    a2enmod proxy_connect && \
    a2enmod headers && \
    a2enmod actions