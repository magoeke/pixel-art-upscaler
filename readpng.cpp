#include <iostream>

#include <Magick++.h>

#include <math.h>

#define FACTOR 4

int main() {
	std::cout << "Start to read png" << std::endl;

	Magick::Image old;

	try {
		old.read("image.png");

		//std::cout << "File name: " << image.fileName() << std::endl;
		Magick::Geometry old_geo = old.size();
		//std::cout << "Width: " << size.width() << std::endl;
		//std::cout << "Height: " << size.height() << std::endl;

		old.type( Magick::GrayscaleType );
		
		Magick::Geometry new_geo(old_geo.width() * FACTOR, old_geo.height() * FACTOR);
		Magick::Image result(new_geo, Magick::Color("black"));
		//std::cout << "new " << result.size().width() << std::endl;

		// modify pixels
		result.modifyImage();

		Magick::Quantum *old_pixels = old.getPixels(0, 0, old_geo.width(), old_geo.height());
		Magick::Quantum *new_pixels = result.getPixels(0, 0, new_geo.width(), new_geo.height());

		//Magick::Quantum *old_pixels = old.getPixels(0, 0, old_geo.height(), old_geo.width());
                //Magick::Quantum *new_pixels = result.getPixels(0, 0, new_geo.height(), new_geo.width());

		int idx = 0;
		int idy = 0;
		for(ssize_t y = 0; y < new_geo.height(); ++y) {
			idy = y / FACTOR;
			for(ssize_t x = 0; x < new_geo.width(); ++x) {
				idx = x / FACTOR;
				new_pixels[( y * new_geo.width()) + x] = old_pixels[(idy * old_geo.width())+idx];
				std::cout << ((y * new_geo.width()) + x) << " " << ((idy * old_geo.width())+idx) << std::endl;
			}
		}

		result.syncPixels();

		result.write("image2.png");

	} catch(Magick::Exception &error_) {
		std::cout << "An error encountered. " << error_.what() << std::endl;
	}

	return 0;
}
