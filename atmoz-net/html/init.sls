git-repo:
  git.latest:
      - name: https://github.com/atmoz/atmoz-net
      - target: /root/atmoz-net

git-repo-config:
  git.config_set:
      - name: receive.denyCurrentBranch
      - value: ignore
      - repo: /root/atmoz-net

/root/atmoz-net/.git/hooks/post-receive:
  file.managed:
    - source: salt://atmoz-net/html/files/post-receive
    - user: root
    - group: root
    - mode: 700
    - require:
      - git: git-repo
