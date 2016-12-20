#include <iostream>
#include <unistd.h>
#include <stdint.h>
#include <stdlib.h>
#include <IL/il.h>
#include <stdint.h>

#define FACTOR 4

/*
 * Copyright (C) 2010 Cameron Zemek ( grom@zeminvaders.net)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

int main() {
    std::cout << "Start to read png" << std::endl;
    
    ILuint handle, width, height;

    const char *szFilenameIn = "image.png";
    const char *szFilenameOut = "image2.png";
	
    ilInit();
    ilEnable(IL_ORIGIN_SET);
    ilGenImages(1, &handle);
    ilBindImage(handle);

    // Load image
    ILboolean loaded = ilLoadImage(szFilenameIn);
    if (loaded == IL_FALSE) {
        fprintf(stderr, "ERROR: can't load '%s'\n", szFilenameIn);
        return 1;
    }
    width = ilGetInteger(IL_IMAGE_WIDTH);
    height = ilGetInteger(IL_IMAGE_HEIGHT);

    // Allocate memory for image data
    size_t srcSize = width * height * sizeof(uint32_t);
    uint8_t *srcData = (uint8_t *) malloc(srcSize);
    size_t destSize = width * FACTOR * height * FACTOR * sizeof(uint32_t);
    uint8_t *destData = (uint8_t *) malloc(destSize);

    // Init srcData from loaded image
    // We want the pixels in BGRA format so that when converting to uint32_t
    // we get a RGB value due to little-endianness.
    ilCopyPixels(0, 0, 0, width, height, 1, IL_BGRA, IL_UNSIGNED_BYTE, srcData);

    uint32_t *sp = (uint32_t *) srcData;
    uint32_t *dp = (uint32_t *) destData;

    // If big endian we have to swap the byte order to get RGB values
    #ifdef WORDS_BIGENDIAN
    uint32_t *spTemp = sp;
    for (i = 0; i < srcSize >> 2; i++) {
        spTemp[i] = swapByteOrder(spTemp[i]);
    }
    #endif


    // -------------------------------------------------------------- nearest neighbor
    for(int row = 0; row < height * FACTOR; ++row) {
        for(int col = 0; col < width * FACTOR; ++col) {
            dp[(row * width * FACTOR + col)] = sp[((row / FACTOR) * width + (col / FACTOR))];
        }
    }
    // --------------------------------------------------------------


    // If big endian we have to swap byte order of destData to get BGRA format
    #ifdef WORDS_BIGENDIAN
    uint32_t *dpTemp = dp;
    for (i = 0; i < destSize >> 2; i++) {
        dpTemp[i] = swapByteOrder(dpTemp[i]);
    }
    #endif

    // Copy destData into image
    ilTexImage(width * FACTOR, height * FACTOR, 0, 4, IL_BGRA, IL_UNSIGNED_BYTE, destData);

    // Free image data
    free(srcData);
    free(destData);

    // Save image
    ilConvertImage(IL_BGRA, IL_UNSIGNED_BYTE); // No alpha channel
    ilHint(IL_COMPRESSION_HINT, IL_USE_COMPRESSION);
    ilEnable(IL_FILE_OVERWRITE);
    ILboolean saved = ilSaveImage(szFilenameOut);

    ilDeleteImages(1, &handle);

    if (saved == IL_FALSE) {
        fprintf(stderr, "ERROR: can't save '%s'\n", szFilenameOut);
        return 1;
    }

	std::cout << "Finished to process image" << std::endl;
	return 0;
}
