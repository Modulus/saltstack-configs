install_required_tools:
  pkg.installed:
    - pkgs: 
	  - unzip
	  - nginx
	
install_gocd:
  archive.extracted:
    - name: /srv/
    - source: salt://files/go-server-15.3.0-2771.zip
    - source_hash: sha1=662a277067220be1c06d39c98760c62d94e0f571
    - archive_format: zip
    - if_missing: /srv/go-server-15.3.0/

/srv/go-server-15.3.0/server.sh:
  cmd.wait:
    - watch:
      - archive: install_gocd
  file.managed:
    - mode: 744
    - source: /srv/go-server-15.3.0/server.sh


