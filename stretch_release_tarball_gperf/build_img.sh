#!/bin/bash -e

if [ -z "$1" ];
then
  echo "USAGE: $0 REVISION"
  echo "       where REVISION = 3.4.3 | 3.6.4 | 3.8.2 | 4.0.3"
else
  docker build --build-arg rev_id=$1 -t stretch_octave_$1_gperf .
fi




