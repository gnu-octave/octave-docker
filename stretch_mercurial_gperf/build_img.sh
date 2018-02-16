#!/bin/bash -e

sudo docker build --build-arg rev_id=$1 -t stretch_octave_$1_gperf .
