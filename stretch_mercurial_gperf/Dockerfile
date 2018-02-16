FROM debian:stretch-slim

WORKDIR /app

RUN apt-get update && apt-get install -y gcc g++ \
  libpcre3-dev make build-essential git mercurial gfortran bison flex gperf libtool\
  libblas-dev liblapack-dev libarpack2-dev libcurl4-gnutls-dev\
  libglpk-dev libreadline-dev libqhull-dev libqrupdate-dev libsuitesparse-dev\
  wget lzip xz-utils automake librsvg2-bin texinfo icoutils

RUN hg clone http://hg.savannah.gnu.org/hgweb/octave octave-src

ARG rev_id

RUN cd octave-src &&\
    hg checkout $rev_id &&\
    ./bootstrap

RUN mkdir octave-build && cd octave-build &&\
    ../octave-src/configure CFLAGS="-O2 -pg -no-pie" CXXFLAGS="-O2 -pg -no-pie" --disable-java --disable-docs --without-qt --without-fftw3 --without-fltk --enable-static --disable-dl --disable-shared

RUN cd octave-build && make -j4

CMD ["/bin/bash"]
