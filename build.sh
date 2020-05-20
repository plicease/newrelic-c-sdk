#!/bin/sh

set -ex

# sudo apt-get update && sudo apt-get install libpcre3-dev
#make dynamic daemon

export NR_ROOT=`pwd`/ffpm-root
export NR_LIB=$NR_ROOT/usr/lib/x86_64-linux-gnu
export NR_BIN=$NR_ROOT/usr/bin

mkdir -p $NR_LIB $NR_BIN

cp libnewrelic.so  $NR_LIB
cp newrelic-daemon $NR_BIN

/opt/fst-ffpm/bin/ffpm -t deb -s dir -C $NR_ROOT -p fst-newrelic-csdk.deb -n fst-newrelic-csdk -v 0.3.0 --description 'NewRelic C-SDK' usr
