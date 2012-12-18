@echo off

set PROJECT_HOME=%~dp0
set JAVA=javaw
IF EXIST "%PROJECT_HOME%jre" set JAVA="%PROJECT_HOME%jre\bin\%JAVA%"
set MAIN_CLASS=jetbrains.mps.Launcher
IF "%MPS_VM_OPTIONS%" == "" (
SET MPS_VM_OPTIONS="%PROJECT_HOME%bin\mps.exe.vmoptions"
)
set ACC=
FOR /F "delims=" %%i in ('TYPE %MPS_VM_OPTIONS%') DO call :parse_vmoptions "%%i"
set JVM_ARGS=%ACC%
::set ADDITIONAL_JVM_ARGS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005
set CLASSPATH="%PROJECT_HOME%lib\branding.jar"
set CLASSPATH=%CLASSPATH%;"%PROJECT_HOME%lib\mpsboot.jar"
set CLASSPATH=%CLASSPATH%;"%PROJECT_HOME%lib\boot.jar"
set CLASSPATH=%CLASSPATH%;"%PROJECT_HOME%lib\bootstrap.jar"
set CLASSPATH=%CLASSPATH%;"%PROJECT_HOME%lib\util.jar"
set CLASSPATH=%CLASSPATH%;"%PROJECT_HOME%lib\jdom.jar"
set CLASSPATH=%CLASSPATH%;"%PROJECT_HOME%lib\log4j.jar"
set CLASSPATH=%CLASSPATH%;"%PROJECT_HOME%lib\extensions.jar"
set CLASSPATH=%CLASSPATH%;"%PROJECT_HOME%lib\trove4j.jar"

pushd bin
start "" %JAVA% %JVM_ARGS% %ADDITIONAL_JVM_ARGS% -classpath %CLASSPATH% %MAIN_CLASS% %*
popd

exit

:parse_vmoptions
if not defined ACC goto emptyacc
if "%SEPARATOR%" == "" goto noseparator
set ACC=%ACC%%SEPARATOR%%1
goto :eof

:noseparator
set ACC=%ACC% %1
goto :eof

:emptyacc
set ACC=%1
goto :eof

