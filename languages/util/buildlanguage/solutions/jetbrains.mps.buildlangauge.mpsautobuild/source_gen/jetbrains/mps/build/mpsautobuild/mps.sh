#!/bin/sh

UNAME=`uname`
SCRIPT_PATH="$0"
if [ "${UNAME}" = "Linux" ]; then
  # readlink resolves symbolic links, but on linux only
  SCRIPT_PATH=`readlink -f "$0"`
fi
PROJECT_HOME=`dirname "${SCRIPT_PATH}"`
PROJECT_HOME_FROM_STARTUP_DIR=..

if [ -z "${JDK_HOME}" ]; then
  JAVA=java
else
  JAVA="${JDK_HOME}/bin/java"
  echo "$0 info: Using jdk located in ${JDK_HOME}."
fi

MAIN_CLASS=jetbrains.mps.Launcher

if [ -z "${MPS_VM_OPTIONS}" ]; then
  MPS_VM_OPTIONS="${PROJECT_HOME}/bin/mps.vmoptions"
else
  echo "$0 info: Using vmoptions defined in ${MPS_VM_OPTIONS}."
fi
JVM_ARGS=`cat "${MPS_VM_OPTIONS}" | tr '\n' ' ' | tr '\r' ' '`
# ADDITIONAL_JVM_ARGS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"

CLASSPATH=""
CLASSPATH=${CLASSPATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/lib/branding.jar
CLASSPATH=${CLASSPATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/lib/mpsboot.jar
CLASSPATH=${CLASSPATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/lib/boot.jar
CLASSPATH=${CLASSPATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/lib/bootstrap.jar
CLASSPATH=${CLASSPATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/lib/util.jar
CLASSPATH=${CLASSPATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/lib/jdom.jar
CLASSPATH=${CLASSPATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/lib/log4j.jar
CLASSPATH=${CLASSPATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/lib/extensions.jar
CLASSPATH=${CLASSPATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/lib/trove4j.jar

cd "${PROJECT_HOME}"
cd bin
if [ "${UNAME}" = "Darwin" ]; then
  if [ -z ${DYLD_LIBRARY_PATH} ]; then
    DYLD_LIBRARY_PATH=${PWD}
  else
    DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:${PWD}
  fi
  export DYLD_LIBRARY_PATH
elif [ "${UNAME}" = "Linux" ]; then
  if [ -z ${LD_LIBRARY_PATH} ]; then
    LD_LIBRARY_PATH=${PWD}
  else
    LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${PWD}
  fi
  export LD_LIBRARY_PATH
else
  echo "$0 warning: Unknown operating system ${UNAME}. Do not know how to add PWD to libraries path."
fi
${JAVA} ${JVM_ARGS} ${ADDITIONAL_JVM_ARGS} -classpath ${CLASSPATH} ${MAIN_CLASS} $*
