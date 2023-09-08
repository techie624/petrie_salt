install_nginx:
  pkg.installed:
    - name: nginx

website_files:
  file.recurse:
    - name: /var/www/html
    - source: salt://webserver/srv

data_file:
  file.managed:
    - name: /var/www/html/data.txt
    - source: salt://webserver/srv/data.txt

get_data_script:
  file.managed:
    - name: /usr/local/bin/get_data.sh
    - source: salt://webserver/srv/get_data.sh
    - mode: 755
