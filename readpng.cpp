#include <iostream>

#include <string.h>

#include <png.h>
#include <zlib.h>

int main() {
	std::cout << "Start to read png" << std::endl;

	png_image image;
	char const *file = "image.png";

	memset(&image, 0, (sizeof image));
	image.version = PNG_IMAGE_VERSION;

	if(png_image_begin_read_from_file(&image, file)) {
		std::cout << "Can read image: " << file << std::endl;
		std::cout << "Width: " << image.width << std::endl;
		std::cout << "Height: " << image.height << std::endl;

	} else {
		std::cout << "Can't read image." << std::endl;
	}

	return 0;
}
