install_gocd:
  archive.extracted:
    - name: /srv/
    - source: salt://files/go-server-15.3.0-2771.zip
    - source_hash: sha1=662a277067220be1c06d39c98760c62d94e0f571
    - archive_format: zip

/srv/go-server-15.3.0/server.sh:
  cmd.wait:
    - watch:
      - pkg: install_gocd
  file.managed:
    - source: /srv/go-server-15.3.0/server.sh
