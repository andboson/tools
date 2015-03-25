FROM ubuntu:12.04
RUN apt-get update && apt-get install -y \
  git \
  mc \
  net-tools \
  mysql-client \
  apache2 \
  php5 \
  php5-mysql \
  curl \
  php5-xdebug php5-gd php5-mcrypt php5-curl libapache2-mod-php5 php-pear php5-mysql php5-xcache \
  zsh \
  phpmyadmin \
  apt-utils \
  libapache2-mod-proxy-html libapache2-mod-gnutls

RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN locale-gen en_US.UTF-8
RUN apt-get install -y htop software-properties-common unzip wget

ADD conf/ /var/conf/
RUN mv /etc/apache2/sites-available/default /var/conf/apache.conf.back
RUN ln -s /var/conf/apache.conf /etc/apache2/sites-available/default
RUN mv /etc/apache2/ports.conf /var/conf/ports.conf.back
RUN ln -s /var/conf/ports.conf /etc/apache2/ports.conf
RUN mv /etc/php5/apache2/php.ini /var/conf/conf.php.ini.back
RUN ln -s /var/conf/php.ini /etc/php5/apache2/php.ini

ADD phpmyadmin/ /etc/phpmyadmin
RUN ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/apache2.conf

VOLUME ["/var/conf"]
RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN echo "service apache2 start" >> /root/.bashrc
RUN echo "tail -f /var/log/apache2/error.log" >> /root/.bashrc

WORKDIR /var/www

CMD /bin/bash
