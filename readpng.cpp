#include <iostream>

#include <Magick++.h>

int main() {
	std::cout << "Start to read png" << std::endl;

	Magick::Image image;

	try {
		image.read("image.png");

		std::cout << "File name: " << image.fileName() << std::endl;
		Magick::Geometry size = image.size();
		std::cout << "Width: " << size.width() << std::endl;
		std::cout << "Height: " << size.height() << std::endl;

		image.type( Magick::GrayscaleType );
		image.write("image2.png");

	} catch(Magick::Exception &error_) {
		std::cout << "An error encountered. " << error_.what() << std::endl;
	}

	return 0;
}
