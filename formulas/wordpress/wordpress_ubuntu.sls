mysql-server:
  pkg.installed
libssh2-php:
  pkg.installed
php5:
  pkg.installed
php5-mysql:
  pkg.installed
php5-gd:
  pkg.installed
apache2:
  pkg.installed

get-wordpress:
  cmd.run:
    - name: wget http://wordpress.org/latest.tar.gz -P /tmp/fapra/
extract-wordpress:
  cmd.run:
    - name: tar -xzvf /tmp/fapra/latest.tar.gz -C /var/www/html/
delete-tar:
  cmd.run:
    - name: rm /tmp/fapra/latest.tar.gz

# Deploy wp-config
/var/www/html/wordpress/wp-config.php:
  file.managed:
    - source: salt://fapra/configs/wp-config.php
    - template: jinja
    - user: root
    - group: root
    - mode: 644

apache_start:
  cmd.run:
    - name: service apache2 restart
