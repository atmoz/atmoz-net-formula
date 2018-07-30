git-repo:
  git.latest:
      - name: https://github.com/atmoz/atmoz-net
      - target: /root/atmoz-net.git
      - bare: True

/root/atmoz-net.git/hooks/post-receive:
  file.managed:
    - source: salt://atmoz-net/html/files/post-receive
    - user: root
    - group: root
    - mode: 700
    - require:
      - git: git-repo
