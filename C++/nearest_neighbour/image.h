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
        void saveImage();

        Image(const char* name);
        Image(const char* name, ILuint width, ILuint height);

        ~Image();
};
#endif
