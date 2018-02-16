FROM debian:jessie-slim

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential gcc g++ make\
  libpcre3-dev gfortran libtool\
  libblas-dev liblapack-dev libarpack2-dev libcurl4-gnutls-dev\
  libglpk-dev libreadline-dev libqhull-dev libqrupdate-dev libsuitesparse-dev\
  wget lzip

## Download Octave 4.2.1 release, unpack, build
COPY octave.sha1 /app
RUN wget https://ftp.gnu.org/gnu/octave/octave-4.2.1.tar.lz &&\
    sha1sum -c octave.sha1 &&\
    tar --lzip -xvf octave-4.2.1.tar.lz
    
RUN mkdir octave-4.2.1-build &&\
    cd octave-4.2.1-build &&\
    ../octave-4.2.1/configure --disable-java --disable-docs --without-qt --without-fftw3 --without-fltk &&\
    make 

RUN cd octave-4.2.1-build && make install

CMD ["/bin/bash"]
