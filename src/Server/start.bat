@echo off
"..\jre\bin\java.exe" -server -cp "./;lib/*" -Dfile.encoding=UTF-8 -Djava.util.logging.config.file=logging.properties -Dgui=true it.gotoandplay.smartfoxserver.SmartFoxServer
@pause