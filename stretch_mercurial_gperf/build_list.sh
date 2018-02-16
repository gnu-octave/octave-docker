#!/bin/bash -e

# works only >= 4.2.1 because previous releases needs patching for gcc 6
# (which is default in debian stretch)
# see folder ../stretch_release_tarball_gperf

./build_img.sh default
./build_img.sh release-4-2-1
