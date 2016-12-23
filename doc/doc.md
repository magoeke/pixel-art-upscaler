# Transfer of hq4x and nearest neighbor interpolation to the GPU

![Shows nearest neighbor interpolation](image_nn.png)
![Shows hq4x](image_hq4x.png)

Figure 1: The left image was scaled with nearest neighbor interpolation and the right one was scaled with the hq4x algorithm  

# ABSTRACT

# 1 Instruction
The Times in which graphic cards are only used for representation are over. Due to the large number of cores on the GPU, it provides an big advantage for dataparallel computing. Computing problems on the GPU besides it's main task is called General Purpose Computation on Graphics Processing Unit(GPGPU). Though you should note that the cores on the GPU are slower than the ones on the CPU. That's why the computation on the GPU doesn't suits to all problems. If you're optimizing a program that executes on the GPU you should increase the throughput.
