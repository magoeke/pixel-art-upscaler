#include <iostream>
#include <CL/cl.hpp>
#include<conio.h>
#include <time.h>
#include <stdint.h>
#include <stdio.h>
#include <cstdio>
#include "image.h"
#include <IL/il.h>

#define SIZE 1000000
#define FACTOR 4

int main() {
	ILuint handle;
	ilInit();
	ilEnable(IL_ORIGIN_SET);
	ilGenImages(1, &handle);
	ilBindImage(handle);

	time_t start, finish;

	// Platform
	std::vector<cl::Platform> all_platforms;
	cl::Platform::get(&all_platforms);
	if (all_platforms.size() == 0) {
		std::cout << "No Platforms found.\n";
		exit(1);
	}
	cl::Platform default_platform = all_platforms[0];
	std::cout << "Using Platform: " << default_platform.getInfo<CL_PLATFORM_NAME>() << "\n";

	// Device
	std::vector<cl::Device> all_devices;
	default_platform.getDevices(CL_DEVICE_TYPE_GPU, &all_devices);
	if (all_devices.size() == 0) {
		std::cout << "No GPUs found.\n";
		exit(1);
	}
	cl::Device default_device = all_devices[0];
	std::cout << "Using GPU: " << default_device.getInfo<CL_DEVICE_NAME>() << "\n";

	// Context
	cl::Context context({ default_device });

	// CommandQueue
	cl::CommandQueue queue(context, default_device, 0, NULL);

	//kernle
	std::string kernel_code =
		"__kernel "
		"void nearestNeighbor( __global uint * destination, __global uint * sp, const int width) { "
		//"int i = get_local_id(0) + get_local_size(0) * get_group_id(0);"
		"int i = get_global_id(0);"
		"int row = i / width;"
		"int col = i % width;"
		"destination[ i ] = sp[((row / 4) * width / 4 + (col / 4))];"
		"}";


	//programm
	cl::Program::Sources sources;
	sources.push_back({ kernel_code.c_str(), kernel_code.length() });

	cl::Program program(context, sources);
	if (program.build({ default_device }) != CL_SUCCESS) {
		std::cout << "Error building: " << program.getBuildInfo<CL_PROGRAM_BUILD_LOG>(default_device) << "\n";
		std::getchar();
		exit(1);
	}

	cl::Kernel kernel(program, "nearestNeighbor");

	Image *org = new Image("image.png");
	Image *res = new Image("image2.png", org->getWidth() * FACTOR, org->getHeight() * FACTOR);

	// Buffer for arguments
	cl::Buffer buffer_A(context, CL_MEM_WRITE_ONLY, sizeof(uint32_t) * res->getHeight() * res->getWidth());
	cl::Buffer buffer_B(context, CL_MEM_READ_ONLY, sizeof(uint32_t) * org->getHeight() * org->getWidth());
	cl::Buffer buffer_C(context, CL_MEM_READ_ONLY, sizeof(int));

	// write arrays to device
	queue.enqueueWriteBuffer(buffer_B, CL_TRUE, 0, sizeof(uint32_t) * org->getHeight() * org->getWidth(), org->getData());

	//set arguments for kernel
	kernel.setArg(0, buffer_A);
	kernel.setArg(1, buffer_B);
	kernel.setArg(2, res->getWidth());

	// measure start time
	time(&start);

	// calculate values
	int blockdimension = (res->getHeight() * res->getWidth()) / 1024;

	std::cout << blockdimension << std::endl;

	// setup queue
	queue.enqueueNDRangeKernel(kernel, cl::NullRange, cl::NDRange(res->getHeight() * res->getWidth()), cl::NDRange(1024));
	queue.finish();

	// measure finish time
	time(&finish);

	std::cout << "Time: " << difftime(finish, start) << "\n";

	// get result
	queue.enqueueReadBuffer(buffer_A, CL_TRUE, 0, sizeof(uint32_t) * res->getHeight() * res->getWidth(), res->getData());
	res->saveImage();

	std::cout << "Free space" << std::endl;
	delete org;
	delete res;
	ilDeleteImages(1, &handle);

	// keeps console open
	_getch();

	return 0;
}