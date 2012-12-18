#!/bin/bash
# runs build

UNAME=`uname`
if [ "${UNAME}" = "Linux" ]; then
    current_script=`readlink -f "$0"`
    mps_home=`dirname "$current_script"`
    mps_home=`dirname "$mps_home"`
elif [ "${UNAME}" = "Darwin" ]; then
    mps_home=`pwd`
    mps_home=`dirname "$mps_home"`
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
else 
    echo "Unknown OS: ${UNAME}"
    exit;
fi

mkdir $mps_home/help
ant -f test.xml -Dmps_home=$mps_home -Dbuild.number=28 -Djava.io.tmpdir=/Volumes/SSD/MPS.artifacts
