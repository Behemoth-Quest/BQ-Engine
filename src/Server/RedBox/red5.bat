@echo off
"..\..\jre\bin\java.exe" -Djava.security.manager -Djava.security.policy=conf/red5.policy -cp red5.jar;conf;bin;%CLASSPATH% org.red5.server.Standalone
pause