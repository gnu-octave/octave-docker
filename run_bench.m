#!/bin/bash -e

for dir in */
do
  echo octave_${dir}
  sudo docker run -it octave_${dir%/} octave -q --eval "a = 1; b = 1; tic; for i=1:1000; for j=1:1000; a = a + b + 123.0; end; end; t1=toc(); t1"
  sudo docker run -it octave_${dir%/} octave -q --eval "a = 1; b = 1; tic; for i=1:1000; for j=1:1000; a = a + b + 123.0; end; end; t1=toc(); t1"
done
