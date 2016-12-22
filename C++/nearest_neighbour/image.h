#ifndef IMAGE_H
#define IMAGE_H
#include <stdint.h>
#include <stdlib.h>
#include <IL/il.h>

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
#endif
