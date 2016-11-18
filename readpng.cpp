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

		//image.type( Magick::GrayscaleType );
		

		// modify pixels
		image.modifyImage();

		Magick::Pixels view(image);

		Magick::Color green("green");

		Magick::Quantum *pixels = view.get(0, 0, view.columns(), view.rows());
		std::cout << "Number of channels: " << image.channels() << std::endl;
		for(ssize_t x = 0; x < size.height() ; ++x) {
			//Magick::Quantum quantum = pixels[i];
			//pixels[i] = 255.0;
			for(ssize_t y = 0; y < size.width(); ++y) {
				Magick::Color pixelcolor = image.pixelColor(x, y);

std::cout << pixelcolor.quantumRed() << " of " << QuantumRange << std::endl;
std::cout << pixelcolor.quantumGreen() << " of " << QuantumRange << std::endl;
std::cout << pixelcolor.quantumBlue() << " of " << QuantumRange << std::endl;
				//std::cout << "Pixel color: " <<  << std::endl;
			}
			//std::cout << " " << i << std::endl;
			//std::cout << " " << quantum.red << std::endl;
			//*(pixels+i) = green;
		}


		view.sync();

		image.write("image2.png");

	} catch(Magick::Exception &error_) {
		std::cout << "An error encountered. " << error_.what() << std::endl;
	}

	return 0;
}
