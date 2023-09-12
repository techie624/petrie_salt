install_nginx:
  pkg.installed:
    - name: nginx

website_files:
  file.recurse:
    - name: /var/www/html
    - source: salt://webserver/srv

install_mariadb:
  pkg.installed:
    - name: mariadb-server

mariadb_service:
  service.running:
    - name: mariadb
    - enable: True
    - require:
      - pkg: install_mariadb

deploy_schema:
  cmd.run:
    - name: mysql < /vagrant/salt/webserver/schema.sql
    - require:
      - pkg: install_mariadb

# Adjusting for .php index file
adjust_nginx_for_php:
  file.replace:
    - name: /etc/nginx/sites-available/default
    - pattern: "index index.html;"
    - repl: "index index.php index.html;"
    - append_if_not_found: True

install_php:
  pkg.installed:
    - names:
      - php-fpm
      - php-mysqli

php_service:
  service.running:
    - name: php7.2-fpm
    - enable: True
    - require:
      - pkg: install_php
