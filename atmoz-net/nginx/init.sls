epel-release:
  pkg:
    - installed

nginx:
  pkg:
    - installed
    - require:
      - pkg: epel-release
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
    - require:
      - pkg: nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://atmoz-net/nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 640
