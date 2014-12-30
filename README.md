docker dev image
=====

Ubuntu 12.04
php 5.3, mysql-client, xdebug, mc, phpmyadmin etc

Inner web-root is /var/www. It mapped to local host dir when image started.
Network mapped to host interfaces.

* to work with DB-server, just point 127.0.0.1[:DB_PORT] as database host
* run in project dir, it will be site root
* edit conf/apache2.conf, php.ini, etc if you need custom ports, dirs settings
* image running with tail apache-error.log, ctrl+c and exit to exit image
* go to http://localhost:8888/phpmyadmin to access PhpMyAdmin
