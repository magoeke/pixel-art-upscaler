#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdint.h>
#include <stdlib.h>
#include <IL/il.h>
#include <stdint.h>
#include "common.cuh"
#include "pixel_functions.cuh"
#include "image.h"
#include <cstdio>
#include <iostream>
#include "gputimer.h"

#define FACTOR 4

#include <stdio.h>

uint32_t   RGBtoYUV[16777216];

void hqxInit();
void hq4x_32(uint32_t * sp, uint32_t * dp, int Xres, int Yres, uint32_t*, uint32_t*, uint32_t*);
__global__ void hq4x(uint32_t*, uint32_t*, int, int, uint32_t*, FunctionPointer*);
__global__ void ConvertRGBtoYUV(uint32_t*, uint32_t*, uint32_t*, int);

int main()
{
	ILuint handle;
	ilInit();
	ilEnable(IL_ORIGIN_SET);
	ilGenImages(1, &handle);
	ilBindImage(handle);
	cudaError_t cudaStatus;
	cudaDeviceProp deviceProp;
	cudaGetDeviceProperties(&deviceProp, 0);

	std::cout << "Read images" << std::endl;
	Image *org = new Image("image.png");
	Image *orgy = new Image("image.png");
	uint32_t *input, *out, *yuv;
	
	hqxInit();
	
	cudaMalloc(&input, org->getHeight() * org->getWidth() * sizeof(uint32_t));
	cudaMalloc(&out, org->getHeight() * org->getWidth() * sizeof(uint32_t));
	cudaMalloc(&yuv, 16777216 * sizeof(uint32_t));

	cudaMemcpy(input, org->getData(), org->getHeight() * org->getWidth() * sizeof(uint32_t), cudaMemcpyHostToDevice);
	cudaMemcpy(yuv, RGBtoYUV, 16777216 * sizeof(uint32_t), cudaMemcpyHostToDevice);
	
	ConvertRGBtoYUV <<<((org->getHeight() * org->getWidth()) / deviceProp.maxThreadsPerBlock)+1, deviceProp.maxThreadsPerBlock >>>(input, out, yuv, deviceProp.maxThreadsPerBlock);
	
	// Check for any errors launching the kernel
	cudaStatus = cudaGetLastError();
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "addKernel launch failed: %s\n", cudaGetErrorString(cudaStatus));
	}
	cudaStatus = cudaDeviceSynchronize();
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaDeviceSynchronize returned error code %d after launching addKernel!\n", cudaStatus);
	}
	cudaStatus = cudaMemcpy(orgy->getData(), out, orgy->getHeight() * orgy->getWidth() * sizeof(uint32_t), cudaMemcpyDeviceToHost);
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaMalloc failed!");
	}
	cudaFree(yuv);
	Image *res = new Image("image2.png", org->getWidth() * FACTOR, org->getHeight() * FACTOR);
	
	hq4x_32(org->getData(), res->getData(), org->getWidth(), org->getHeight(), orgy->getData(), input, out);
	
	std::cout << "Save new image" << std::endl;
	res->saveImage();
	
	std::cout << "Free space" << std::endl;
	delete org;
	delete res;
	ilDeleteImages(1, &handle);
	cudaStatus = cudaDeviceReset();
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaDeviceReset failed!");
		return 1;
	}
    
	return 0;
}

__global__ void ConvertRGBtoYUV(uint32_t *sp, uint32_t *br, uint32_t *array, int maxThreads) {
	int i = threadIdx.x + maxThreads * blockIdx.x;
	br[i] = rgb_to_yuv(sp[i],array);
}

void hqxInit(void)
{
	/* Initalize RGB to YUV lookup table */
	uint32_t c, r, g, b, y, u, v;
	for (c = 0; c < 16777215; c++) {
		r = (c & 0xFF0000) >> 16;
		g = (c & 0x00FF00) >> 8;
		b = c & 0x0000FF;
		y = (uint32_t)(0.299*r + 0.587*g + 0.114*b);
		u = (uint32_t)(-0.169*r - 0.331*g + 0.5*b) + 128;
		v = (uint32_t)(0.5*r - 0.419*g - 0.081*b) + 128;
		RGBtoYUV[c] = (y << 16) + (u << 8) + v;
	}
}

void hq4x_32(uint32_t * sp, uint32_t * dp, int Xres, int Yres, uint32_t * orgy, uint32_t *input, uint32_t *yuv)
{
	cudaError_t cudaStatus;
	uint32_t *out;
	FunctionPointer *fpo;
	cudaDeviceProp deviceProp;
	cudaGetDeviceProperties(&deviceProp, 0);
	cudaStatus = cudaSetDevice(0);
	//cudaMalloc(&input, Xres * Yres * sizeof(uint32_t));
	cudaMalloc(&out, Xres * FACTOR * Yres * FACTOR * sizeof(uint32_t));
	cudaMalloc(&fpo, 256 * sizeof(FunctionPointer));
	initFunctions << <1, 1 >> > (fpo);
	cudaStatus = cudaDeviceSynchronize();
	cudaMemcpy(input, sp, Xres * Yres * sizeof(uint32_t), cudaMemcpyHostToDevice);
	cudaMemcpy(yuv, orgy, Xres * Yres * sizeof(uint32_t), cudaMemcpyHostToDevice);
	int blockdimension = (Xres*Yres) > deviceProp.maxThreadsPerBlock ? (Xres*Yres) / deviceProp.maxThreadsPerBlock : 1;
	
	GpuTimer timer;
	timer.Start();
	hq4x<<<blockdimension, deviceProp.maxThreadsPerBlock>>>(input, out, Xres, Yres, yuv, fpo);
	
	cudaStatus = cudaGetLastError();
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "addKernel launch failed: %s\n", cudaGetErrorString(cudaStatus));
	}
	cudaStatus = cudaDeviceSynchronize();
	timer.Stop();
	std::cout << "Timer:g" << timer.Elapsed() << std::endl;
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaDeviceSynchronize returned error code %d after launching addKernel!\n", cudaStatus);
	}
	cudaStatus = cudaMemcpy(dp, out,Xres *FACTOR * Yres * FACTOR * sizeof(uint32_t), cudaMemcpyDeviceToHost);
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaMalloc failed!");
	}
	cudaFree(input);
	cudaFree(out);
	cudaFree(yuv);
	cudaFree(fpo);
}

__global__ void hq4x(uint32_t * sp, uint32_t * dp, int Xres, int Yres, uint32_t *yuv, FunctionPointer *functions)
{
	int  k;
	int  prevline, nextline;
	uint32_t w[10];
	uint32_t y[10];
	uint32_t yuv1, yuv2;
	int index = threadIdx.x + blockDim.x * blockIdx.x;
	int row = index / Xres;
	int col = index % Xres;
	int dpL = Xres*FACTOR;
	int spL = Xres;
	if (index < Xres) prevline = 0; else prevline = index - spL;
	if (index > Xres*(Yres - 1)) nextline = 0; else nextline = index + spL;
	int indexVier = (row * Xres * FACTOR + col) * FACTOR;
	w[2] = sp[prevline];
	w[5] = sp[index];
	w[8] = sp[nextline];
	y[2] = yuv[prevline];
	y[5] = yuv[index];
	y[8] = yuv[nextline];
	if ((index%Xres)>0)
	{
		w[1] = sp[prevline - 1];
		w[4] = sp[index - 1];
		w[7] = sp[nextline - 1];
		y[1] = yuv[prevline - 1];
		y[4] = yuv[index - 1];
		y[7] = yuv[nextline - 1];
	}
	else
	{
		w[1] = w[2];
		w[4] = w[5];
		w[7] = w[8];
		y[1] = y[2];
		y[4] = y[5];
		y[7] = y[8];
	}
	if ((index%Xres)<Xres - 1)
	{
		w[3] = sp[prevline + 1];
		w[6] = sp[index + 1];
		w[9] = sp[nextline + 1];
		y[3] = yuv[prevline + 1];
		y[6] = yuv[index + 1];
		y[9] = yuv[nextline + 1];
	}
	else
	{
		w[3] = w[2];
		w[6] = w[5];
		w[9] = w[8];
		y[3] = y[2];
		y[6] = y[5];
		y[9] = y[8];
	}
	int pattern = 0;
	int flag = 1;
	yuv1 = y[5];
	for (k = 1; k <= 9; k++)
	{
		if (k == 5) continue;
		if (w[k] != w[5])
		{
			yuv2 = y[k];
			if (yuv_diff(yuv1, yuv2))
				pattern |= flag;
		}
		flag <<= 1;
	}
	functions[pattern](dp, indexVier, dpL, w, y);
	
}