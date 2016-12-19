#include <iostream>

#include <Magick++.h>

#include <math.h>

#define FACTOR 4

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


		// some verbose output

		std::cout << "Original image channels: " << number_of_channels << std::endl;
		std::cout << "New image channels: " << MagickCore::GetPixelChannels(result->constImage()) << std::endl;
		std::cout << "Images have the same ImageMagick type? " << (old->type() == result->type()) << std::endl;
		// -------------------

		// modify pixels
		result->modifyImage();

		Magick::Quantum *old_pixels = old->getPixels(0, 0, old->columns(), old->rows());
		Magick::Quantum *new_pixels = result->getPixels(0, 0, result->columns(), result->rows());

		int idx = 0;
		int idy = 0; 		
		for(ssize_t y = 0; y < result->rows(); ++y) {
			idy = y / FACTOR;
			for(ssize_t x = 0; x < result->columns(); ++x) {				
				idx = x / FACTOR;
				for(ssize_t z = 0; z < number_of_channels; ++z) {
					Magick::Quantum old = old_pixels[(idy * old_geo.width() * number_of_channels)+ (idx * number_of_channels) + z];
					new_pixels[( y * new_geo.width() * number_of_channels) + (x * number_of_channels) + z] = old;
				}
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