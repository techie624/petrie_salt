install_nginx:
  pkg.installed:
    - name: nginx

configure_nginx:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://webserver/srv/index.html

data_file:
  file.managed:
    - name: /var/www/html/data.txt
    - source: salt://webserver/srv/data.txt

get_data_script:
  file.managed:
    - name: /usr/local/bin/get_data.sh
    - source: salt://webserver/srv/get_data.sh
    - mode: 755
