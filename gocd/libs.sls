install_java:
  pkg.installed:
    - name:  openjdk-7-jdk
java_home:
  environ.setenv:
    - name: JAVA_HOME
	- value: /usr/bin/java
	
install_maven:
  pkg.installed:
    - name: maven