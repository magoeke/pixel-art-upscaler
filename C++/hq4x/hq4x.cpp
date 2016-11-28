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

		// convert color space
		old->colorSpace(MagickCore::YUVColorspace);
		result->colorSpace(MagickCore::YUVColorspace);

		// modify pixels
		result->modifyImage();

		Magick::Quantum *old_pixels = old->getPixels(0, 0, old->columns(), old->rows());
		Magick::Quantum *new_pixels = result->getPixels(0, 0, result->columns(), result->rows());

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
