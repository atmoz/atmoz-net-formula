dep:
  file.managed:
    - name: /usr/local/bin/dep
    - source: https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64
    - source_hash: 287b08291e14f1fae8ba44374b26a2b12eb941af3497ed0ca649253e21ba2f83
    - user: root
    - group: root
    - mode: 755

golang:
  pkg.installed

ply:
  git.latest:
    - name: https://github.com/atmoz/ply
    - target: /root/go/src/github.com/atmoz/ply
  cmd.run:
    - name: dep ensure && go install
    - cwd: /root/go/src/github.com/atmoz/ply
    - require:
      - pkg: golang
      - file: dep
    - onchanges:
      - git: ply

