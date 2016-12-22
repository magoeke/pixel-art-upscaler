#include <iostream>
#include <unistd.h>
#include <stdint.h>
#include <stdlib.h>
#include <IL/il.h>
#include <stdint.h>

#define FACTOR 4

class Image {
    private:
        const char *name;
        ILuint width;
        ILuint height;
        uint32_t *data;
    public:
        ILuint getWidth() { return width; }
        ILuint getHeight() { return height; }
        uint32_t* getData() { return data; }
        
        Image(const char* name) {
            this->name = name;
            
            ILboolean loaded = ilLoadImage(name);
            if (loaded == IL_FALSE) {
                fprintf(stderr, "ERROR: can't load '%s'\n", name);
                //return null;
            }
            
            this->width = ilGetInteger(IL_IMAGE_WIDTH);
            this->height = ilGetInteger(IL_IMAGE_HEIGHT);
            
            uint8_t *srcData = (uint8_t *) malloc(width * height * sizeof(uint32_t));
            ilCopyPixels(0, 0, 0, width, height, 1, IL_BGRA, IL_UNSIGNED_BYTE, srcData);
            this->data = (uint32_t *) srcData;
        };
        
        Image(const char* name, ILuint width, ILuint height) {
            this->name = name;
            this->width = width;
            this->height = height;
            uint8_t *srcData = (uint8_t *) malloc(width * height * sizeof(uint32_t));
            this->data = (uint32_t *) srcData;
        };
        
        void saveImage() {
            ilTexImage(width, height, 0, 4, IL_BGRA, IL_UNSIGNED_BYTE, this->data);
            ilConvertImage(IL_BGRA, IL_UNSIGNED_BYTE); // No alpha channel
            ilHint(IL_COMPRESSION_HINT, IL_USE_COMPRESSION);
            ilEnable(IL_FILE_OVERWRITE);
            ILboolean saved = ilSaveImage(this->name);
            if (saved == IL_FALSE) {
                fprintf(stderr, "ERROR: can't save '%s'\n", this->name);
                //return 1;
            }
        }
        
        ~Image(){ free(this->data); };
};

void nearest_neighbor(Image *org, Image *res, int factor) {
    // -------------------------------------------------------------- nearest neighbor
    uint32_t *dp = res->getData();
    uint32_t *sp = org->getData();
    for(int row = 0; row < res->getHeight(); ++row) {
        for(int col = 0; col < res->getWidth(); ++col) {
            dp[(row * res->getWidth() + col)] = sp[((row / factor) * org->getWidth() + (col / factor))];
        }
    }
    // --------------------------------------------------------------
};


int main() {
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
