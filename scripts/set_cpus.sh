#!/usr/bin/env bash

function set-cpus() {
  core_ct=`cat /proc/cpuinfo | grep 'processor' | tail -n 1 | awk '{print $NF}'`
  stub=`cat stub/cpu.line`

  while [ $core_ct -ge 0 ]
  do
    readable=$(($core_ct + 1))
    line=`echo "$stub" | sed "s/X/$readable/g" | sed "s/Y/$core_ct/g"`

    sed -e '/History/a\' -e "$line" -i the-raven.conf

    core_ct=$(($core_ct - 1))
  done
}

set-cpus
