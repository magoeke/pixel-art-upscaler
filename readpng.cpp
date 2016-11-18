#include <iostream>

#include <Magick++.h>

#include <math.h>

#define FACTOR 4

int main() {
	std::cout << "Start to read png" << std::endl;

	Magick::Image old;

	try {
		old.read("image.png");
		Magick::Geometry old_geo = old.size();
		old.type( Magick::GrayscaleType );
		
		Magick::Geometry new_geo(old_geo.width() * FACTOR, old_geo.height() * FACTOR);
		Magick::Image result(new_geo, Magick::Color("black"));
		result.type( Magick::GrayscaleType );

		// modify pixels
		result.modifyImage();

		Magick::Quantum *old_pixels = old.getPixels(0, 0, old_geo.width(), old_geo.height());
		Magick::Quantum *new_pixels = result.getPixels(0, 0, new_geo.width(), new_geo.height());

		int idx = 0;
		int idy = 0;
		for(ssize_t y = 0; y < new_geo.height(); ++y) {
			idy = y / FACTOR;
			for(ssize_t x = 0; x < new_geo.width(); ++x) {
				idx = x / FACTOR;
				new_pixels[( y * new_geo.width()) + x] = old_pixels[(idy * old_geo.width())+idx];
			}
		}

		result.syncPixels();
		result.write("image2.png");
	} catch(Magick::Exception &error_) {
		std::cout << "An error encountered. " << error_.what() << std::endl;
	}

	return 0;
}
