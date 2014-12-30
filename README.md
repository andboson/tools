docker dev image
=====

Ubuntu 12.04
php 5.3, mysql-client, xdebug etc

Inner web-root is /var/www. It mapped to local host dir when image started

* to work with DB-server, just point 127..0.0.1[:DB_PORT] as database host
* run in project dir, it will be site root
* edit conf/apache2.conf, php.ini, etc ifyopu need custom ports, dirs settings