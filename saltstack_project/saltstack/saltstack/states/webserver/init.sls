# saltstack/states/webserver/init.sls

install_nginx:
  pkg.installed:
    - name: nginx

deploy_web_content:
  file.recurse:
    - name: /var/www/html
    - source: salt://webserver/files

start_nginx:
  service.running:
    - name: nginx
