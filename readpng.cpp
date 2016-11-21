#include <iostream>

#include <Magick++.h>

#include <math.h>

#define FACTOR 2

int main() {
	std::cout << "Start to read png" << std::endl;

	Magick::Image* old = new Magick::Image();

	try {
		old->read("image.png");
		Magick::Geometry old_geo = old->size();
		//old->type( Magick::GrayscaleType );
		
		ssize_t number_of_channels = MagickCore::GetPixelChannels(old->constImage());

		Magick::Geometry new_geo(old_geo.width() * FACTOR, old_geo.height() * FACTOR);
		Magick::Image* result = new Magick::Image(new_geo, Magick::Color("white"));
		result->type( old->type() );

		// modify pixels
		result->modifyImage();

		Magick::Quantum *old_pixels = old->getPixels(0, 0, old_geo.width(), old_geo.height());
		Magick::Quantum *new_pixels = result->getPixels(0, 0, new_geo.width(), new_geo.height());

		int idx = 0;
		int idy = 0;
		//for(ssize_t y = 0; y < new_geo.height() * number_of_channels; ++y) {
		for(ssize_t y = 0; y < result->rows(); ++y) {
			idy = y / FACTOR;
			for(ssize_t x = 0; x < result->columns() * number_of_channels; ++x) {				
				idx = x / FACTOR;
				new_pixels[( y * new_geo.width() * number_of_channels) + x] = old_pixels[(idy * old_geo.width() * number_of_channels)+idx];
			}
		}

		result->syncPixels();
		result->write("image2.png");
		delete old;
		delete result;
	} catch(Magick::Exception &error_) {
		std::cout << "An error encountered. " << error_.what() << std::endl;
	}

	std::cout << "Finished to process image" << std::endl;

	return 0;
}
