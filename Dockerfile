FROM php:8.2-apache

# Copy project into Apache web directory
COPY . /var/www/html/

# Enable Apache rewrite (needed for routing)
RUN a2enmod rewrite

# Set Apache document root to public folder
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# Fix storage permissions
RUN mkdir -p /var/www/html/storage && chown -R www-data:www-data /var/www/html/storage
