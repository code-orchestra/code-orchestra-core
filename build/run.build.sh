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
export ANT_OPTS=-Xmx1024m
#ant -f MPS-external-dist.xml -Dmps_home=$mps_home -Dbuild.number=28 -Dversion=EAP -Dbuild.vcs.number=222 -Dteamcity.buildConfName=Local universal.single
ant -f MPS-external.xml -Dmps_home=$mps_home -Dversion="2.0 Beta" -Dbuild.vcs.number=555 -Dteamcity.buildConfName=CodeOrchestra
