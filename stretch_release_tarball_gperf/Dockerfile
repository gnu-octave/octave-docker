FROM debian:stretch-slim

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential gcc g++ make\
  libpcre3-dev gfortran libtool\
  libblas-dev liblapack-dev libarpack2-dev libcurl4-gnutls-dev\
  libglpk-dev libreadline-dev libqhull-dev libqrupdate-dev libsuitesparse-dev\
  wget lzip xz-utils gzip

ARG rev_id

RUN wget https://ftp.gnu.org/gnu/octave/octave-$rev_id.tar.gz

RUN tar -xzvf octave-$rev_id.tar.gz

COPY octave-$rev_id-port-to-gcc-6.patch octave-$rev_id/
RUN cd octave-$rev_id &&\
    patch -p1 < octave-$rev_id-port-to-gcc-6.patch
    
RUN mkdir octave-build &&\
    cd octave-build &&\
    ../octave-$rev_id/configure CFLAGS="-O2 -pg -no-pie" CXXFLAGS="-O2 -pg -no-pie" --disable-java --disable-docs --without-qt --without-fftw3 --without-fltk --without-amd --without-camd --without-colamd --without-ccolamd --without-cholmod --enable-static --disable-dl --disable-shared

RUN apt-get install -y zlib1g-dev
    
RUN cd octave-build && make -j4

CMD ["/bin/bash"]
