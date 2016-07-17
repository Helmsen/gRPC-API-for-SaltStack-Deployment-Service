mysql-server:
  pkg.installed

php5-mysql:
  pkg.installed

server_pkgs:
  pkg:
  - installed
  - name: python-dev
  - refresh: true

mysql_python_pkgs:
  pkg.installed:
    - pkgs:
      - libmysqlclient-dev
      - mysql-client
      - python-mysqldb

service mysql restart:
  cmd.run

# Set root password if not already set
mysql_root_password:
  cmd.run:
    - name: mysqladmin --user root password root
    - unless: mysql --user root --password='root' --execute="SELECT 1;"

mysql_user:
  mysql_user.present:
  - host: '%'
  - name: {{ pillar['db']['user_present_name'] }}
  - password: {{ pillar['db']['user_present_pw'] }}
  - connection_user: root
  - connection_pass: root
  - connection_charset: utf8
  - saltenv:
    - LC_ALL: "en_US.utf8"
  mysql_grants.present:
  - host: '%' 
  - connection_user: root
  - connection_pass: root
  - connection_charset: utf8
  - saltenv:
    - LC_ALL: "en_US.utf8"
  - grant: all privileges
  - name: privileges{{ pillar['db']['user_present_name'] }}
  - user: {{ pillar['db']['user_present_name'] }}
  - database: "*.*"

mysql_database:
  mysql_database.present:
    - host: '%'
    - connection_user: root
    - connection_pass: root
    - connection_charset : utf8
    - saltenv:
      - LC_ALL: "en_US.utf8"
    - name: {{ pillar['db']['db_name'] }}

/etc/mysql/my.cnf:
  file.managed:
    - source: salt://fapra/configs/my.cnf
    - user: root
    - group: root
    - mode: 644

# Restart mysql to realize new config
restart_mysql:
  cmd.run:
    - name: service mysql restart 
