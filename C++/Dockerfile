FROM ubuntu:16.04

RUN apt-get update && apt-get install -y build-essential pkg-config libpng-dev libdevil-dev && rm -rf /var/lib/apt/lists/*
RUN mkdir files
RUN apt-get update && apt-get install -y valgrind && rm -rf /var/lib/apt/lists/*

WORKDIR "files"
CMD make 
