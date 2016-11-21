# Pixel Art Scaler

This projects aims to implement two different algorithms that scale up pixel art images. One algorithm is a simple nearest neighbor and the other 
is hq4x. Both algorithms will be parallized on a GPU.

## Usage

You need a system that has gcc, make, imagemagick and later CUDA preinstalled or you use our Dockerfile.

### Build porject without docker
1. Build container => docker build -t imagemagick .
2. Run container => docker run -v $PWD:/files imagemagick

### Build project without docker
1. make
2. ./readpng
