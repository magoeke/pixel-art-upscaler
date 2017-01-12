#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <cstdio>
#include <iostream>
#include <IL/il.h>
#include "image.h"
#include "gputimer.h"

#define FACTOR 4

__global__ void nearest_neighbor(uint32_t *dp, uint32_t *sp, ILuint height, ILuint width, int factor)
{
	for (int row = 0; row < height; ++row) {
		for (int col = 0; col < width; ++col) {
			dp[(row * width + col)] = sp[((row / factor) * width/factor + (col / factor))];
		}
	}
}


int main()
{
	ILuint handle;
	ilInit();
	ilEnable(IL_ORIGIN_SET);
	ilGenImages(1, &handle);
	ilBindImage(handle);
	cudaError_t cudaStatus;


	std::cout << "Read images" << std::endl;
	Image *org = new Image("image.png");
	Image *res = new Image("image2.png", org->getWidth() * FACTOR, org->getHeight() * FACTOR);

	std::cout << "Execute nearest neighbor algorithm" << std::endl;
	
	uint32_t *input, *out, *temp;
	
	// take first device
	cudaStatus = cudaSetDevice(0);

	// alloc memory
	cudaMalloc(&input, org->getHeight() * org->getWidth() * sizeof(uint32_t));
	cudaMalloc(&out, res->getHeight() * res->getWidth() * sizeof(uint32_t));
	
	// copy original image to GPU
	cudaMemcpy(input, org->getData(), org->getHeight() * org->getWidth() * sizeof(uint32_t), cudaMemcpyHostToDevice);
	
	// Execute Kernel and measure time
	GpuTimer timer;

	timer.Start();
	nearest_neighbor<<<1,1>>>(out, input, res->getHeight(), res->getWidth(), 4);
	
	// Check for any errors launching the kernel
	cudaStatus = cudaGetLastError();
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "addKernel launch failed: %s\n", cudaGetErrorString(cudaStatus));
	}

	// wait that all kernels finish
	cudaStatus = cudaDeviceSynchronize();
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaDeviceSynchronize returned error code %d after launching addKernel!\n", cudaStatus);
	}
	timer.Stop();

	std::cout << "Kernel time: " << timer.Elapsed() << std::endl;

	// copy new image to host
	cudaStatus = cudaMemcpy(res->getData(), out, res->getHeight() * res->getWidth() * sizeof(uint32_t), cudaMemcpyDeviceToHost);
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaMalloc failed!");
	}

	std::cout << "Save new image" << std::endl;
	res->saveImage();

	std::cout << "Free space" << std::endl;
	delete org;
	delete res;
	ilDeleteImages(1, &handle);

	cudaFree(input);
	cudaFree(out);

    return 0;
}
