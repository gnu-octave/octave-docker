FROM debian:jessie-slim

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential gcc g++ make\
  libpcre3-dev gfortran libtool\
  libblas-dev liblapack-dev libarpack2-dev libcurl4-gnutls-dev\
  libglpk-dev libreadline-dev libqhull-dev libqrupdate-dev libsuitesparse-dev\
  wget lzip

RUN apt-get install -y xz-utils

## Download Octave 4.0.3 release, unpack, build
RUN wget https://ftp.gnu.org/gnu/octave/octave-4.0.3.tar.xz
RUN tar -xJvf octave-4.0.3.tar.xz
    
RUN mkdir octave-4.0.3-build &&\
    cd octave-4.0.3-build &&\
    ../octave-4.0.3/configure --disable-java --disable-docs --without-qt --without-fftw3 --without-fltk
    
RUN cd octave-4.0.3-build && make 
RUN cd octave-4.0.3-build && make install

CMD ["/bin/bash"]
