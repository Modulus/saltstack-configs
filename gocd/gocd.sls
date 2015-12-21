Total run time: 791.611 ms
[root@cookiemaster salt]# vim gocd.sls
include:
  - mtools
  - libs
  
install_required_tools:
  pkg.installed:
    - pkgs:
      - unzip
      - nginx
    - require:
      - sls: libs

install_gocd:
  archive.extracted:
    - name: /srv/
    - user: root
    - group: root
    - source: salt://files/go-server-15.3.0-2771.zip
    - source_hash: sha1=662a277067220be1c06d39c98760c62d94e0f571
    - archive_format: zip
    - if_missing: /srv/go-server-15.3.0/
    - require:
      - pkg: install_required_tools

/srv/go-server-15.3.0/server.sh:
  file.managed:
    - mode: 777
    - source: /srv/go-server-15.3.0/server.sh
    - require:
      - archive: install_gocd

run_gocd:
  cmd.wait:
    - name: /srv/go-server-15.3.0/server.sh
    - watch:
      - archive: install_gocd
    - require:
      - pkg: install_required_tools
      - file: /srv/go-server-15.3.0/server.sh
