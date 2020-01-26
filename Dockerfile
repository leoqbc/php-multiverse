FROM webdevops/php-apache-dev:7.2

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql unixodbc unixodbc-dev mssql-tools

RUN pecl install pdo_sqlsrv

RUN echo extension=pdo_sqlsrv.so >> /opt/docker/etc/php/php.webdevops.ini

RUN chown -R 1000:1000 /app

WORKDIR /app

EXPOSE 80
