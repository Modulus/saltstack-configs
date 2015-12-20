install_java:
  pkg.installed:
    - name:  openjdk-7-jdk
java_home:
  environ.setenv:
    - name: JAVA_HOME
	- value: /usr/lib/jvm/java-1.7.0-openjdk-amd64
	- update_minion: True
	
install_maven:
  pkg.installed:
    - name: maven