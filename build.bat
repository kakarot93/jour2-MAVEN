

@echo on

SET mypath=%~dp0
SET userprofil=%systemdrive%%homepath%
SET CATALINA_HOME=%userprofil%\Documents\tomcat\apache-tomcat-8.5.81
SET tomcatpath=%userprofil%\Documents\tomcat\apache-tomcat-8.5.81\bin

echo %tomcatpath%

call mvn scm:checkout  -DconnectionUrl=scm:git:https://github.com/kakarot93/jour2-MAVEN -DcheckoutDirectory=testMonappli -DscmVersionType=branch -DscmVersion=main

cd %mypath%\testMonappli\monappli

call mvn clean package

SET src=%userprofil%\Documents\jour2-MAVEN\testMonappli\monappli\monappli-web\target\monappli-web.war
SET dest=%userprofil%\Documents\tomcat\apache-tomcat-8.5.81\webapps

copy %src% %dest%

call %tomcatpath%\startup.bat

start chrome http://localhost:8080/monappli-web
