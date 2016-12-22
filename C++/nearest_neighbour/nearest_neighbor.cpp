#include <iostream>
#include <IL/il.h>
#include "image.h"

#define FACTOR 4

void nearest_neighbor(Image *org, Image *res, int factor) {
    uint32_t *dp = res->getData();
    uint32_t *sp = org->getData();
    for(int row = 0; row < res->getHeight(); ++row) {
        for(int col = 0; col < res->getWidth(); ++col) {
            dp[(row * res->getWidth() + col)] = sp[((row / factor) * org->getWidth() + (col / factor))];
        }
    }
};


int main() {

    // intialize devIL
    ILuint handle;
    ilInit();
    ilEnable(IL_ORIGIN_SET);
    ilGenImages(1, &handle);
    ilBindImage(handle);
    
    
    std::cout << "Read images" << std::endl;
    Image *org = new Image("image.png");
    Image *res = new Image("image2.png", org->getWidth() * FACTOR, org->getHeight() * FACTOR);
    
	std::cout << "Execute nearest neighbor algorithm" << std::endl;
    nearest_neighbor(org, res, FACTOR);
    
	std::cout << "Save new image" << std::endl;
    res->saveImage();

	std::cout << "Free space" << std::endl;    
    delete org;
    delete res;
    ilDeleteImages(1, &handle);


	return 0;
}
