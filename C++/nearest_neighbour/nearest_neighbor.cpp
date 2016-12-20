#include <iostream>
#include <math.h>

#define FACTOR 4

int main() {
	std::cout << "Start to read png" << std::endl;
 		
/*		for(ssize_t y = 0; y < result->rows(); ++y) {
			idy = y / FACTOR;
			for(ssize_t x = 0; x < result->columns(); ++x) {				
				idx = x / FACTOR;
				for(ssize_t z = 0; z < number_of_channels; ++z) {
					Magick::Quantum old = old_pixels[(idy * old_geo.width() * number_of_channels)+ (idx * number_of_channels) + z];
					new_pixels[( y * new_geo.width() * number_of_channels) + (x * number_of_channels) + z] = old;
				}
			}
		}*/
	std::cout << "Finished to process image" << std::endl;

	return 0;
}
