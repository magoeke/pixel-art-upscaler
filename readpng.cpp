#include <iostream>

#include <string.h>
#include <stdlib.h>

#include <png.h>
#include <zlib.h>

int main() {
	std::cout << "Start to read png" << std::endl;

	png_image image;
	char const *file = "image.png";
	char const *result_file = "image2.png";

	memset(&image, 0, (sizeof image));
	image.version = PNG_IMAGE_VERSION;

	if(png_image_begin_read_from_file(&image, file)) {
		std::cout << "Can read image: " << file << std::endl;
		std::cout << "Width: " << image.width << std::endl;
		std::cout << "Height: " << image.height << std::endl;
		std::cout << "Size: " << PNG_IMAGE_SIZE(image) << std::endl; // not correct size

		png_bytep buffer;

		// format in which to read png
		image.format = PNG_FORMAT_RGBA;

		buffer = (png_bytep)malloc(PNG_IMAGE_SIZE(image));
		if(buffer != NULL && png_image_finish_read(&image, NULL, buffer, 0, NULL) != 0) {
			std::cout << "Almost ready to save image as a new image." << std::endl;
			if(png_image_write_to_file(&image, result_file, 0, buffer, 0, NULL) != 0) {
				std::cout << "Therotically new image should be saved." << std::endl;
				return 0;
			}
		} else { 
			free(buffer);
		}
		
	} else {
		std::cout << "Can't read image." << std::endl;
	}

	return 0;
}
