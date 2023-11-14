# Use uma imagem do PHP com Apache
FROM php:7.4-apache

# Atualize os pacotes e instale as extensões do PHP necessárias
RUN apt-get update && \
    apt-get install -y libpq-dev && \
    docker-php-ext-install pdo pdo_mysql mysqli && \
    a2enmod rewrite

# Instale o Composer
RUN apt-get install -y unzip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configure o Apache
RUN chown -R www-data:www-data /var/www/html

# Copie os arquivos do seu aplicativo para o contêiner
COPY . /var/www/html

# Expõe a porta 80 do contêiner
EXPOSE 80

# Comando para iniciar o Apache quando o contêiner for iniciado
CMD ["apache2-foreground"]



