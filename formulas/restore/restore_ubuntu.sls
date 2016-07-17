mkdir -p /salt/restore:
  cmd.run

/salt/restore/tmp.sql:
  file.managed:
    - source: salt://fapra/tmp/{{ pillar['restore']['backup_filename'] }}
    - user: root
    - group: root
    - mode: 644

mysqldump -u root -proot {{ pillar['restore']['db_name'] }} < /salt/restore/tmp.sql:
  cmd.run
