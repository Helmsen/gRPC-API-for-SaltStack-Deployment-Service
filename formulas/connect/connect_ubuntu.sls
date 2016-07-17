# Deploy wp-config
/var/www/html/wordpress/wp-config.php:
  file.managed:
    - source: salt://fapra/configs/wp-config.php
    - template: jinja
    - user: root
    - group: root
    - mode: 644

service apache2 restart:
  cmd.run
