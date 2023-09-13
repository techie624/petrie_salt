install_nginx:
  pkg.installed:
    - name: nginx

website_files:
  file.recurse:
    - name: /var/www/html
    - source: salt://webserver/srv

install_postgresql:
  pkg.installed:
    - names:
      - postgresql
      - postgresql-client

postgresql_service:
  service.running:
    - name: postgresql
    - enable: True
    - require:
      - pkg: install_postgresql

configure_pg_auth:
  cmd.script:
    - source: salt://webserver/configure_pg_auth.sh
    - user: root

deploy_db_init_script:
  file.managed:
    - name: /usr/local/bin/init_pg.sh
    - source: salt://webserver/init_pg.sh
    - mode: 755
    - require:
      - pkg: install_postgresql

init_database:
  cmd.run:
    - name: /usr/local/bin/init_pg.sh
    - require:
      - file: deploy_db_init_script

replace_nginx_default_config:
  file.managed:
    - name: /etc/nginx/sites-available/default
    - source: salt://webserver/nginx_default.conf  
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - require:
      - pkg: nginx

nginx_service:
  service.running:
    - name: nginx
    - enable: True  # This ensures the service starts on boot.
    - watch:
      - file: replace_nginx_default_config

install_php:
  pkg.installed:
    - names:
      - php-fpm
      - php-pgsql

php_service:
  service.running:
    - name: php7.2-fpm
    - enable: True
    - require:
      - pkg: install_php
