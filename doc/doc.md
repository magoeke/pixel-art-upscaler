# Transfer of hq4x and nearest neighbor interpolation to the GPU

![Shows nearest neighbor interpolation](image_nn.png)
![Shows hq4x](image_hq4x.png)

Figure 1: The left image was scaled with nearest neighbor interpolation and the right one was scaled with the hq4x algorithm  

# ABSTRACT

# 1 Introduction
The Times in which graphic cards are only used for representation are over. Due to a large number of cores on the GPU, it provides a big advantage for data parallel computing. If you're using the GPU for computing besides the main task of the GPU it's called General Purpose Computation on Graphics Processing Unit(GPGPU). Though you should note that the cores on the GPU are slower than the ones on the CPU. That's why the computation on the GPU doesn't suits to all problems. If you're optimizing a program that executes on the GPU you should increase the throughput.
At the moment exists two library to transfer calculations on the GPU. One of them is OpenCL(Open Computing Language) and it isn't limited to only GPU programming. The second one is CUDA. CUDA is developed by nVidia. The big advantage of OpenCL is that it can be executed on every GPU meanwhile CUDA Code can only be executed on nVidia GPUs. If you're using OpenCL and the host system has a nVidia GPU it uses CUDA internal but you're programming with the OpenCL syntax. Although OpenCL maps on CUDA for nVidia GPUs it's slower than native CUDA Code and that's the advantage of CUDA. Because CUDA only supports nVidia GPUs and it's developed by nVidia it's faster than OpenCL.
