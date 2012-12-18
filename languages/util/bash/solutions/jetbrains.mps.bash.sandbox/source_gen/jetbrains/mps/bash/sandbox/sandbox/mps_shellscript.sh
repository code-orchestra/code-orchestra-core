#!/bin/sh


PROJECT_HOME=`dirname "${0}"`
PROJECT_HOME_FROM_STARTUP_DIR=..

if [ -z "${JDK_HOME}" ]; then
  JAVA=java
else
  JAVA="${JDK_HOME}/bin/java"
fi

MAIN_CLASS=some.main.class

if [ -z "${MPS_VM_OPTIONS}" ]; then
  MPS_VM_OPTIONS="${PROJECT_HOME}/pathToVMOptionsFile"
fi

JVM_ARGS=`tr '\n' ' ' <${MPS_VM_OPTIONS} | tr '\r' ' '`
JVM_ARGS="vmoptions"

ADDITIONAL_JVM_ARGS="aditional_args"

CLASS_PATH=""
CLASS_PATH=${CLASS_PATH}:${PROJECT_HOME_FROM_STARTUP_DIR}/path

cd ${PROJECT_HOME}
cd basedir

LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${PWD}
export LD_LIBRARY_PATH

${JAVA} ${JVM_ARGS} -classpath ${CLASS_PATH} ${MAIN_CLASS}
