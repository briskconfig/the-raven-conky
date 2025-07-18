#!/usr/bin/env bash

function set-cpus() {
  core_ct=$(( `nproc` - 1 ))  # CPU cores (zero-indexed)
  stub=`cat stub/cpu.line`    # CPU display template

  while [ $core_ct -gt 0 ]
  do
    left=$(( core_ct - 1 ))                             # The number of the left-display
    line=`echo "$stub" | sed "s/X/$left/g" | sed "s/Y/$core_ct/g"`

    sed -e '/cpugraph/a\' -e "$line" -i the-raven.conf  # Add the adjusted line to the config

    core_ct=$(( core_ct - 2 ))                          # Decrement by 2 (each row displays status of 2 rows)
  done
}

set-cpus
