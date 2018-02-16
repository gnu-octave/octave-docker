FROM debian:jessie-slim

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential gcc g++ make\
  libpcre3-dev gfortran libtool\
  libblas-dev liblapack-dev libarpack2-dev libcurl4-gnutls-dev\
  libglpk-dev libreadline-dev libqhull-dev libqrupdate-dev libsuitesparse-dev\
  wget lzip

RUN apt-get install -y bzip2

## Download Octave 3.6.4 release, unpack, build
RUN wget https://ftp.gnu.org/gnu/octave/octave-3.6.4.tar.bz2
RUN tar -xjvf octave-3.6.4.tar.bz2
    
RUN mkdir octave-3.6.4-build &&\
    cd octave-3.6.4-build &&\
    ../octave-3.6.4/configure --disable-java --disable-docs --without-qt --without-fftw3 --without-fltk
    
RUN cd octave-3.6.4-build && make 
RUN cd octave-3.6.4-build && make install

CMD ["/bin/bash"]
