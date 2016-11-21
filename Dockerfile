FROM ubuntu:16.04

RUN apt-get update && apt-get install -y build-essential wget pkg-config && rm -rf /var/lib/apt/lists/*
RUN wget https://www.imagemagick.org/download/ImageMagick.tar.gz && tar xvzf ImageMagick.tar.gz

RUN cd ImageMagick-7.0.3-7 && ./configure && make && make install && ldconfig /usr/local/lib
RUN mkdir files

WORKDIR "files"

CMD make && ./readpng
