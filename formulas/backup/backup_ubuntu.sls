curl:
  pkg.installed

mkdir -p /salt/backup:
  cmd.run

mysqldump -u root -proot --all-databases > /salt/backup/tmp.sql:
  cmd.run

curl -T /salt/backup/tmp.sql ftp://{{ pillar['backup']['ftp_server_hostname'] }}{{ pillar['backup']['ftp_absolute_file_name'] }} --user {{ pillar['backup']['ftp_auth'] }}:
  cmd.run
