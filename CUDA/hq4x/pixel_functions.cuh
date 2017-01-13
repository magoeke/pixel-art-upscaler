#ifndef __PIXEL_FUNCTIONS_H_
#define __PIXEL_FUNCTIONS_H_

#include <stdlib.h>
#include <stdint.h>
#include "common.cuh"

//Lookup gedöns
#define PIXEL00_0     *(dp+indexVier) = w[5];
#define PIXEL00_11    *(dp+indexVier) = Interp1(w[5], w[4]);
#define PIXEL00_12    *(dp+indexVier) = Interp1(w[5], w[2]);
#define PIXEL00_20    *(dp+indexVier) = Interp2(w[5], w[2], w[4]);
#define PIXEL00_50    *(dp+indexVier) = Interp5(w[2], w[4]);
#define PIXEL00_80    *(dp+indexVier) = Interp8(w[5], w[1]);
#define PIXEL00_81    *(dp+indexVier) = Interp8(w[5], w[4]);
#define PIXEL00_82    *(dp+indexVier) = Interp8(w[5], w[2]);
#define PIXEL01_0     *(dp+indexVier+1) = w[5];
#define PIXEL01_10    *(dp+indexVier+1) = Interp1(w[5], w[1]);
#define PIXEL01_12    *(dp+indexVier+1) = Interp1(w[5], w[2]);
#define PIXEL01_14    *(dp+indexVier+1) = Interp1(w[2], w[5]);
#define PIXEL01_21    *(dp+indexVier+1) = Interp2(w[2], w[5], w[4]);
#define PIXEL01_31    *(dp+indexVier+1) = Interp3(w[5], w[4]);
#define PIXEL01_50    *(dp+indexVier+1) = Interp5(w[2], w[5]);
#define PIXEL01_60    *(dp+indexVier+1) = Interp6(w[5], w[2], w[4]);
#define PIXEL01_61    *(dp+indexVier+1) = Interp6(w[5], w[2], w[1]);
#define PIXEL01_82    *(dp+indexVier+1) = Interp8(w[5], w[2]);
#define PIXEL01_83    *(dp+indexVier+1) = Interp8(w[2], w[4]);
#define PIXEL02_0     *(dp+indexVier+2) = w[5];
#define PIXEL02_10    *(dp+indexVier+2) = Interp1(w[5], w[3]);
#define PIXEL02_11    *(dp+indexVier+2) = Interp1(w[5], w[2]);
#define PIXEL02_13    *(dp+indexVier+2) = Interp1(w[2], w[5]);
#define PIXEL02_21    *(dp+indexVier+2) = Interp2(w[2], w[5], w[6]);
#define PIXEL02_32    *(dp+indexVier+2) = Interp3(w[5], w[6]);
#define PIXEL02_50    *(dp+indexVier+2) = Interp5(w[2], w[5]);
#define PIXEL02_60    *(dp+indexVier+2) = Interp6(w[5], w[2], w[6]);
#define PIXEL02_61    *(dp+indexVier+2) = Interp6(w[5], w[2], w[3]);
#define PIXEL02_81    *(dp+indexVier+2) = Interp8(w[5], w[2]);
#define PIXEL02_83    *(dp+indexVier+2) = Interp8(w[2], w[6]);
#define PIXEL03_0     *(dp+indexVier+3) = w[5];
#define PIXEL03_11    *(dp+indexVier+3) = Interp1(w[5], w[2]);
#define PIXEL03_12    *(dp+indexVier+3) = Interp1(w[5], w[6]);
#define PIXEL03_20    *(dp+indexVier+3) = Interp2(w[5], w[2], w[6]);
#define PIXEL03_50    *(dp+indexVier+3) = Interp5(w[2], w[6]);
#define PIXEL03_80    *(dp+indexVier+3) = Interp8(w[5], w[3]);
#define PIXEL03_81    *(dp+indexVier+3) = Interp8(w[5], w[2]);
#define PIXEL03_82    *(dp+indexVier+3) = Interp8(w[5], w[6]);
#define PIXEL10_0     *(dp+indexVier+dpL) = w[5];
#define PIXEL10_10    *(dp+indexVier+dpL) = Interp1(w[5], w[1]);
#define PIXEL10_11    *(dp+indexVier+dpL) = Interp1(w[5], w[4]);
#define PIXEL10_13    *(dp+indexVier+dpL) = Interp1(w[4], w[5]);
#define PIXEL10_21    *(dp+indexVier+dpL) = Interp2(w[4], w[5], w[2]);
#define PIXEL10_32    *(dp+indexVier+dpL) = Interp3(w[5], w[2]);
#define PIXEL10_50    *(dp+indexVier+dpL) = Interp5(w[4], w[5]);
#define PIXEL10_60    *(dp+indexVier+dpL) = Interp6(w[5], w[4], w[2]);
#define PIXEL10_61    *(dp+indexVier+dpL) = Interp6(w[5], w[4], w[1]);
#define PIXEL10_81    *(dp+indexVier+dpL) = Interp8(w[5], w[4]);
#define PIXEL10_83    *(dp+indexVier+dpL) = Interp8(w[4], w[2]);
#define PIXEL11_0     *(dp+indexVier+dpL+1) = w[5];
#define PIXEL11_30    *(dp+indexVier+dpL+1) = Interp3(w[5], w[1]);
#define PIXEL11_31    *(dp+indexVier+dpL+1) = Interp3(w[5], w[4]);
#define PIXEL11_32    *(dp+indexVier+dpL+1) = Interp3(w[5], w[2]);
#define PIXEL11_70    *(dp+indexVier+dpL+1) = Interp7(w[5], w[4], w[2]);
#define PIXEL12_0     *(dp+indexVier+dpL+2) = w[5];
#define PIXEL12_30    *(dp+indexVier+dpL+2) = Interp3(w[5], w[3]);
#define PIXEL12_31    *(dp+indexVier+dpL+2) = Interp3(w[5], w[2]);
#define PIXEL12_32    *(dp+indexVier+dpL+2) = Interp3(w[5], w[6]);
#define PIXEL12_70    *(dp+indexVier+dpL+2) = Interp7(w[5], w[6], w[2]);
#define PIXEL13_0     *(dp+indexVier+dpL+3) = w[5];
#define PIXEL13_10    *(dp+indexVier+dpL+3) = Interp1(w[5], w[3]);
#define PIXEL13_12    *(dp+indexVier+dpL+3) = Interp1(w[5], w[6]);
#define PIXEL13_14    *(dp+indexVier+dpL+3) = Interp1(w[6], w[5]);
#define PIXEL13_21    *(dp+indexVier+dpL+3) = Interp2(w[6], w[5], w[2]);
#define PIXEL13_31    *(dp+indexVier+dpL+3) = Interp3(w[5], w[2]);
#define PIXEL13_50    *(dp+indexVier+dpL+3) = Interp5(w[6], w[5]);
#define PIXEL13_60    *(dp+indexVier+dpL+3) = Interp6(w[5], w[6], w[2]);
#define PIXEL13_61    *(dp+indexVier+dpL+3) = Interp6(w[5], w[6], w[3]);
#define PIXEL13_82    *(dp+indexVier+dpL+3) = Interp8(w[5], w[6]);
#define PIXEL13_83    *(dp+indexVier+dpL+3) = Interp8(w[6], w[2]);
#define PIXEL20_0     *(dp+indexVier+dpL+dpL) = w[5];
#define PIXEL20_10    *(dp+indexVier+dpL+dpL) = Interp1(w[5], w[7]);
#define PIXEL20_12    *(dp+indexVier+dpL+dpL) = Interp1(w[5], w[4]);
#define PIXEL20_14    *(dp+indexVier+dpL+dpL) = Interp1(w[4], w[5]);
#define PIXEL20_21    *(dp+indexVier+dpL+dpL) = Interp2(w[4], w[5], w[8]);
#define PIXEL20_31    *(dp+indexVier+dpL+dpL) = Interp3(w[5], w[8]);
#define PIXEL20_50    *(dp+indexVier+dpL+dpL) = Interp5(w[4], w[5]);
#define PIXEL20_60    *(dp+indexVier+dpL+dpL) = Interp6(w[5], w[4], w[8]);
#define PIXEL20_61    *(dp+indexVier+dpL+dpL) = Interp6(w[5], w[4], w[7]);
#define PIXEL20_82    *(dp+indexVier+dpL+dpL) = Interp8(w[5], w[4]);
#define PIXEL20_83    *(dp+indexVier+dpL+dpL) = Interp8(w[4], w[8]);
#define PIXEL21_0     *(dp+indexVier+dpL+dpL+1) = w[5];
#define PIXEL21_30    *(dp+indexVier+dpL+dpL+1) = Interp3(w[5], w[7]);
#define PIXEL21_31    *(dp+indexVier+dpL+dpL+1) = Interp3(w[5], w[8]);
#define PIXEL21_32    *(dp+indexVier+dpL+dpL+1) = Interp3(w[5], w[4]);
#define PIXEL21_70    *(dp+indexVier+dpL+dpL+1) = Interp7(w[5], w[4], w[8]);
#define PIXEL22_0     *(dp+indexVier+dpL+dpL+2) = w[5];
#define PIXEL22_30    *(dp+indexVier+dpL+dpL+2) = Interp3(w[5], w[9]);
#define PIXEL22_31    *(dp+indexVier+dpL+dpL+2) = Interp3(w[5], w[6]);
#define PIXEL22_32    *(dp+indexVier+dpL+dpL+2) = Interp3(w[5], w[8]);
#define PIXEL22_70    *(dp+indexVier+dpL+dpL+2) = Interp7(w[5], w[6], w[8]);
#define PIXEL23_0     *(dp+indexVier+dpL+dpL+3) = w[5];
#define PIXEL23_10    *(dp+indexVier+dpL+dpL+3) = Interp1(w[5], w[9]);
#define PIXEL23_11    *(dp+indexVier+dpL+dpL+3) = Interp1(w[5], w[6]);
#define PIXEL23_13    *(dp+indexVier+dpL+dpL+3) = Interp1(w[6], w[5]);
#define PIXEL23_21    *(dp+indexVier+dpL+dpL+3) = Interp2(w[6], w[5], w[8]);
#define PIXEL23_32    *(dp+indexVier+dpL+dpL+3) = Interp3(w[5], w[8]);
#define PIXEL23_50    *(dp+indexVier+dpL+dpL+3) = Interp5(w[6], w[5]);
#define PIXEL23_60    *(dp+indexVier+dpL+dpL+3) = Interp6(w[5], w[6], w[8]);
#define PIXEL23_61    *(dp+indexVier+dpL+dpL+3) = Interp6(w[5], w[6], w[9]);
#define PIXEL23_81    *(dp+indexVier+dpL+dpL+3) = Interp8(w[5], w[6]);
#define PIXEL23_83    *(dp+indexVier+dpL+dpL+3) = Interp8(w[6], w[8]);
#define PIXEL30_0     *(dp+indexVier+dpL+dpL+dpL) = w[5];
#define PIXEL30_11    *(dp+indexVier+dpL+dpL+dpL) = Interp1(w[5], w[8]);
#define PIXEL30_12    *(dp+indexVier+dpL+dpL+dpL) = Interp1(w[5], w[4]);
#define PIXEL30_20    *(dp+indexVier+dpL+dpL+dpL) = Interp2(w[5], w[8], w[4]);
#define PIXEL30_50    *(dp+indexVier+dpL+dpL+dpL) = Interp5(w[8], w[4]);
#define PIXEL30_80    *(dp+indexVier+dpL+dpL+dpL) = Interp8(w[5], w[7]);
#define PIXEL30_81    *(dp+indexVier+dpL+dpL+dpL) = Interp8(w[5], w[8]);
#define PIXEL30_82    *(dp+indexVier+dpL+dpL+dpL) = Interp8(w[5], w[4]);
#define PIXEL31_0     *(dp+indexVier+dpL+dpL+dpL+1) = w[5];
#define PIXEL31_10    *(dp+indexVier+dpL+dpL+dpL+1) = Interp1(w[5], w[7]);
#define PIXEL31_11    *(dp+indexVier+dpL+dpL+dpL+1) = Interp1(w[5], w[8]);
#define PIXEL31_13    *(dp+indexVier+dpL+dpL+dpL+1) = Interp1(w[8], w[5]);
#define PIXEL31_21    *(dp+indexVier+dpL+dpL+dpL+1) = Interp2(w[8], w[5], w[4]);
#define PIXEL31_32    *(dp+indexVier+dpL+dpL+dpL+1) = Interp3(w[5], w[4]);
#define PIXEL31_50    *(dp+indexVier+dpL+dpL+dpL+1) = Interp5(w[8], w[5]);
#define PIXEL31_60    *(dp+indexVier+dpL+dpL+dpL+1) = Interp6(w[5], w[8], w[4]);
#define PIXEL31_61    *(dp+indexVier+dpL+dpL+dpL+1) = Interp6(w[5], w[8], w[7]);
#define PIXEL31_81    *(dp+indexVier+dpL+dpL+dpL+1) = Interp8(w[5], w[8]);
#define PIXEL31_83    *(dp+indexVier+dpL+dpL+dpL+1) = Interp8(w[8], w[4]);
#define PIXEL32_0     *(dp+indexVier+dpL+dpL+dpL+2) = w[5];
#define PIXEL32_10    *(dp+indexVier+dpL+dpL+dpL+2) = Interp1(w[5], w[9]);
#define PIXEL32_12    *(dp+indexVier+dpL+dpL+dpL+2) = Interp1(w[5], w[8]);
#define PIXEL32_14    *(dp+indexVier+dpL+dpL+dpL+2) = Interp1(w[8], w[5]);
#define PIXEL32_21    *(dp+indexVier+dpL+dpL+dpL+2) = Interp2(w[8], w[5], w[6]);
#define PIXEL32_31    *(dp+indexVier+dpL+dpL+dpL+2) = Interp3(w[5], w[6]);
#define PIXEL32_50    *(dp+indexVier+dpL+dpL+dpL+2) = Interp5(w[8], w[5]);
#define PIXEL32_60    *(dp+indexVier+dpL+dpL+dpL+2) = Interp6(w[5], w[8], w[6]);
#define PIXEL32_61    *(dp+indexVier+dpL+dpL+dpL+2) = Interp6(w[5], w[8], w[9]);
#define PIXEL32_82    *(dp+indexVier+dpL+dpL+dpL+2) = Interp8(w[5], w[8]);
#define PIXEL32_83    *(dp+indexVier+dpL+dpL+dpL+2) = Interp8(w[8], w[6]);
#define PIXEL33_0     *(dp+indexVier+dpL+dpL+dpL+3) = w[5];
#define PIXEL33_11    *(dp+indexVier+dpL+dpL+dpL+3) = Interp1(w[5], w[6]);
#define PIXEL33_80    *(dp+indexVier+dpL+dpL+dpL+3) = Interp8(w[5], w[9]);
#define PIXEL33_12    *(dp+indexVier+dpL+dpL+dpL+3) = Interp1(w[5], w[8]);
#define PIXEL33_20    *(dp+indexVier+dpL+dpL+dpL+3) = Interp2(w[5], w[8], w[6]);
#define PIXEL33_50    *(dp+indexVier+dpL+dpL+dpL+3) = Interp5(w[8], w[6]);
#define PIXEL33_81    *(dp+indexVier+dpL+dpL+dpL+3) = Interp8(w[5], w[6]);
#define PIXEL33_82    *(dp+indexVier+dpL+dpL+dpL+3) = Interp8(w[5], w[8]);


  __device__ void pixelFunction0(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction1(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction2(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction3(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction4(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction5(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction6(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction7(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		PIXEL03_81
		PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL13_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction8(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL23_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction9(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction10(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction11(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		PIXEL20_31
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL30_81
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction12(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL10_32
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction13(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL12_0
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction14(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_61
		PIXEL21_30
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction15(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_50
				PIXEL21_0
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction16(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
			PIXEL11_0
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_61
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction17(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction18(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction19(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction20(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		PIXEL03_81
		PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL13_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL23_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction21(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction22(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL10_32
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL20_31
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL30_81
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction23(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL12_0
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction24(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_61
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction25(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction26(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_61
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction27(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[2], y[6]))
	{
		PIXEL00_81
			PIXEL01_31
			PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL00_12
			PIXEL01_14
			PIXEL02_83
			PIXEL03_50
			PIXEL12_70
			PIXEL13_21
	}
	PIXEL10_81
		PIXEL11_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction28(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
				PIXEL23_32
				PIXEL33_82
		}
		else
		{
			PIXEL02_21
				PIXEL03_50
				PIXEL12_70
				PIXEL13_83
				PIXEL23_13
				PIXEL33_11
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82

}


  __device__ void pixelFunction29(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		if (Diff(y[6], y[8]))
		{
			PIXEL03_81
				PIXEL13_31
				PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL03_12
				PIXEL13_14
				PIXEL22_70
				PIXEL23_83
				PIXEL32_21
				PIXEL33_50
		}
	PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL20_61
		PIXEL21_30
		PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction30(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_82
		PIXEL21_32
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL30_82
				PIXEL31_32
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_70
				PIXEL23_21
				PIXEL30_11
				PIXEL31_13
				PIXEL32_83
				PIXEL33_50
		}

}


  __device__ void pixelFunction31(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
				PIXEL32_31
				PIXEL33_81
		}
		else
		{
			PIXEL20_21
				PIXEL21_70
				PIXEL30_50
				PIXEL31_83
				PIXEL32_14
				PIXEL33_12
		}
	PIXEL22_31
		PIXEL23_81

}


  __device__ void pixelFunction32(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[8], y[4]))
	{
		PIXEL00_82
			PIXEL10_32
			PIXEL20_10
			PIXEL21_30
			PIXEL30_80
			PIXEL31_10
	}
	else
	{
		PIXEL00_11
			PIXEL10_13
			PIXEL20_83
			PIXEL21_70
			PIXEL30_50
			PIXEL31_21
	}
	PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction33(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
			PIXEL20_31
			PIXEL30_81
	}
	else
	{
		PIXEL00_50
			PIXEL01_21
			PIXEL10_83
			PIXEL11_70
			PIXEL20_14
			PIXEL30_12
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_61
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction34(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL02_32
			PIXEL03_82
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_50
			PIXEL01_83
			PIXEL02_13
			PIXEL03_11
			PIXEL10_21
			PIXEL11_70
	}
	PIXEL12_32
		PIXEL13_82
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction35(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction36(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction37(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction38(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction39(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction40(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction41(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction42(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction43(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_0
			PIXEL03_0
			PIXEL13_0
	}
	else
	{
		PIXEL02_50
			PIXEL03_50
			PIXEL13_50
	}
	PIXEL11_0
		PIXEL12_0
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction44(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL12_0
		PIXEL20_61
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction45(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}

}


  __device__ void pixelFunction46(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_61
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction47(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction48(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL12_0
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction49(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction50(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction51(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_10
		PIXEL11_30
		PIXEL12_0
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction52(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_61
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction53(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction54(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_61
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction55(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction56(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction57(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction58(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction59(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction60(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction61(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction62(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction63(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction64(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction65(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction66(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction67(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction68(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
		}
		else
		{
			PIXEL02_11
				PIXEL03_20
				PIXEL12_0
				PIXEL13_12
		}
	PIXEL10_81
		PIXEL11_31
		PIXEL20_61
		PIXEL21_30
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_11
				PIXEL32_12
				PIXEL33_20
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction69(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	if (Diff(y[6], y[8]))
	{
		PIXEL22_30
			PIXEL23_10
			PIXEL32_10
			PIXEL33_80
	}
	else
	{
		PIXEL22_0
			PIXEL23_11
			PIXEL32_12
			PIXEL33_20
	}

}


  __device__ void pixelFunction70(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_61
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	PIXEL22_31
		PIXEL23_81
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction71(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	PIXEL02_32
		PIXEL03_82
		PIXEL12_32
		PIXEL13_82
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction72(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction73(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
		}
		else
		{
			PIXEL02_11
				PIXEL03_20
				PIXEL12_0
				PIXEL13_12
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL20_82
		PIXEL21_32
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_11
				PIXEL32_12
				PIXEL33_20
		}
	PIXEL30_82
		PIXEL31_32

}


  __device__ void pixelFunction74(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	if (Diff(y[6], y[8]))
	{
		PIXEL22_30
			PIXEL23_10
			PIXEL32_10
			PIXEL33_80
	}
	else
	{
		PIXEL22_0
			PIXEL23_11
			PIXEL32_12
			PIXEL33_20
	}

}


  __device__ void pixelFunction75(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	if (Diff(y[8], y[4]))
	{
		PIXEL20_10
			PIXEL21_30
			PIXEL30_80
			PIXEL31_10
	}
	else
	{
		PIXEL20_12
			PIXEL21_0
			PIXEL30_20
			PIXEL31_11
	}
	if (Diff(y[6], y[8]))
	{
		PIXEL22_30
			PIXEL23_10
			PIXEL32_10
			PIXEL33_80
	}
	else
	{
		PIXEL22_0
			PIXEL23_11
			PIXEL32_12
			PIXEL33_20
	}

}


  __device__ void pixelFunction76(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[2], y[6]))
	{
		PIXEL00_81
			PIXEL01_31
			PIXEL02_0
			PIXEL03_0
			PIXEL12_0
			PIXEL13_0
	}
	else
	{
		PIXEL00_12
			PIXEL01_14
			PIXEL02_83
			PIXEL03_50
			PIXEL12_70
			PIXEL13_21
	}
	PIXEL10_81
		PIXEL11_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction77(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL12_0
				PIXEL13_0
				PIXEL23_32
				PIXEL33_82
		}
		else
		{
			PIXEL02_21
				PIXEL03_50
				PIXEL12_70
				PIXEL13_83
				PIXEL23_13
				PIXEL33_11
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82

}


  __device__ void pixelFunction78(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		if (Diff(y[6], y[8]))
		{
			PIXEL03_81
				PIXEL13_31
				PIXEL22_0
				PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL03_12
				PIXEL13_14
				PIXEL22_70
				PIXEL23_83
				PIXEL32_21
				PIXEL33_50
		}
	PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL20_61
		PIXEL21_30
		PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction79(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_82
		PIXEL21_32
		if (Diff(y[6], y[8]))
		{
			PIXEL22_0
				PIXEL23_0
				PIXEL30_82
				PIXEL31_32
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL22_70
				PIXEL23_21
				PIXEL30_11
				PIXEL31_13
				PIXEL32_83
				PIXEL33_50
		}

}


  __device__ void pixelFunction80(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL21_0
				PIXEL30_0
				PIXEL31_0
				PIXEL32_31
				PIXEL33_81
		}
		else
		{
			PIXEL20_21
				PIXEL21_70
				PIXEL30_50
				PIXEL31_83
				PIXEL32_14
				PIXEL33_12
		}
	PIXEL22_31
		PIXEL23_81

}


  __device__ void pixelFunction81(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[8], y[4]))
	{
		PIXEL00_82
			PIXEL10_32
			PIXEL20_0
			PIXEL21_0
			PIXEL30_0
			PIXEL31_0
	}
	else
	{
		PIXEL00_11
			PIXEL10_13
			PIXEL20_83
			PIXEL21_70
			PIXEL30_50
			PIXEL31_21
	}
	PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction82(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
			PIXEL11_0
			PIXEL20_31
			PIXEL30_81
	}
	else
	{
		PIXEL00_50
			PIXEL01_21
			PIXEL10_83
			PIXEL11_70
			PIXEL20_14
			PIXEL30_12
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_61
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction83(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL02_32
			PIXEL03_82
			PIXEL10_0
			PIXEL11_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_83
			PIXEL02_13
			PIXEL03_11
			PIXEL10_21
			PIXEL11_70
	}
	PIXEL12_32
		PIXEL13_82
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction84(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction85(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_61
		PIXEL20_10
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction86(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_10
		PIXEL11_30
		PIXEL12_0
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction87(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_10
		PIXEL20_61
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction88(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL12_0
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_10
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction89(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction90(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_10
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction91(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction92(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction93(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction94(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction95(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction96(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction97(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction98(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction99(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction100(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}

}


  __device__ void pixelFunction101(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_0
			PIXEL03_0
			PIXEL13_0
	}
	else
	{
		PIXEL02_50
			PIXEL03_50
			PIXEL13_50
	}
	PIXEL12_0
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction102(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_61
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_31
		PIXEL23_81
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction103(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
		}
		else
		{
			PIXEL02_11
				PIXEL03_20
				PIXEL12_0
				PIXEL13_12
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL20_82
		PIXEL21_32
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_82
		PIXEL31_32

}


  __device__ void pixelFunction104(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	PIXEL11_0
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction105(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_11
				PIXEL32_12
				PIXEL33_20
		}

}


  __device__ void pixelFunction106(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_81
		PIXEL11_31
		PIXEL12_0
		PIXEL20_61
		PIXEL21_30
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_11
				PIXEL32_12
				PIXEL33_20
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction107(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_32
		PIXEL03_82
		PIXEL11_0
		PIXEL12_32
		PIXEL13_82
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction108(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	if (Diff(y[8], y[4]))
	{
		PIXEL20_0
			PIXEL30_0
			PIXEL31_0
	}
	else
	{
		PIXEL20_50
			PIXEL30_50
			PIXEL31_50
	}
	PIXEL21_0
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_11
				PIXEL32_12
				PIXEL33_20
		}

}


  __device__ void pixelFunction109(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_0
			PIXEL03_0
			PIXEL13_0
	}
	else
	{
		PIXEL02_50
			PIXEL03_50
			PIXEL13_50
	}
	PIXEL12_0
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	if (Diff(y[6], y[8]))
	{
		PIXEL22_30
			PIXEL23_10
			PIXEL32_10
			PIXEL33_80
	}
	else
	{
		PIXEL22_0
			PIXEL23_11
			PIXEL32_12
			PIXEL33_20
	}

}


  __device__ void pixelFunction110(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	if (Diff(y[8], y[4]))
	{
		PIXEL20_10
			PIXEL21_30
			PIXEL30_80
			PIXEL31_10
	}
	else
	{
		PIXEL20_12
			PIXEL21_0
			PIXEL30_20
			PIXEL31_11
	}
	PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}

}


  __device__ void pixelFunction111(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	PIXEL11_0
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	if (Diff(y[6], y[8]))
	{
		PIXEL22_30
			PIXEL23_10
			PIXEL32_10
			PIXEL33_80
	}
	else
	{
		PIXEL22_0
			PIXEL23_11
			PIXEL32_12
			PIXEL33_20
	}

}


  __device__ void pixelFunction112(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction113(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction114(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL10_32
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL20_31
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL30_81
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction115(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		PIXEL03_81
		PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL13_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL23_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction116(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction117(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
		}
		else
		{
			PIXEL02_11
				PIXEL03_20
				PIXEL12_0
				PIXEL13_12
		}
	PIXEL10_81
		PIXEL11_31
		PIXEL20_82
		PIXEL21_32
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_11
				PIXEL32_12
				PIXEL33_20
		}
	PIXEL30_82
		PIXEL31_32

}


  __device__ void pixelFunction118(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	if (Diff(y[6], y[8]))
	{
		PIXEL22_30
			PIXEL23_10
			PIXEL32_10
			PIXEL33_80
	}
	else
	{
		PIXEL22_0
			PIXEL23_11
			PIXEL32_12
			PIXEL33_20
	}

}


  __device__ void pixelFunction119(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	PIXEL02_32
		PIXEL03_82
		PIXEL12_32
		PIXEL13_82
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	PIXEL22_31
		PIXEL23_81
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction120(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL10_32
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	PIXEL22_31
		PIXEL23_81
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction121(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	PIXEL02_32
		PIXEL03_82
		PIXEL12_32
		PIXEL13_82
		PIXEL20_31
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL30_81
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction122(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
		}
		else
		{
			PIXEL02_11
				PIXEL03_20
				PIXEL12_0
				PIXEL13_12
		}
	PIXEL10_81
		PIXEL11_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL23_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction123(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		PIXEL03_81
		PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL13_31
		PIXEL20_82
		PIXEL21_32
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_11
				PIXEL32_12
				PIXEL33_20
		}
	PIXEL30_82
		PIXEL31_32

}


  __device__ void pixelFunction124(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction125(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction126(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_10
		PIXEL11_30
		PIXEL12_0
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction127(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction128(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[8], y[4]))
	{
		PIXEL00_82
			PIXEL10_32
			PIXEL20_0
			PIXEL21_0
			PIXEL30_0
			PIXEL31_0
	}
	else
	{
		PIXEL00_11
			PIXEL10_13
			PIXEL20_83
			PIXEL21_70
			PIXEL30_50
			PIXEL31_21
	}
	PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		PIXEL22_30
		PIXEL23_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction129(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		if (Diff(y[6], y[8]))
		{
			PIXEL03_81
				PIXEL13_31
				PIXEL22_0
				PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL03_12
				PIXEL13_14
				PIXEL22_70
				PIXEL23_83
				PIXEL32_21
				PIXEL33_50
		}
	PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL20_10
		PIXEL21_30
		PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction130(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL02_32
			PIXEL03_82
			PIXEL10_0
			PIXEL11_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_83
			PIXEL02_13
			PIXEL03_11
			PIXEL10_21
			PIXEL11_70
	}
	PIXEL12_32
		PIXEL13_82
		PIXEL20_10
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction131(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_10
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL21_0
				PIXEL30_0
				PIXEL31_0
				PIXEL32_31
				PIXEL33_81
		}
		else
		{
			PIXEL20_21
				PIXEL21_70
				PIXEL30_50
				PIXEL31_83
				PIXEL32_14
				PIXEL33_12
		}
	PIXEL22_31
		PIXEL23_81

}


  __device__ void pixelFunction132(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL12_0
				PIXEL13_0
				PIXEL23_32
				PIXEL33_82
		}
		else
		{
			PIXEL02_21
				PIXEL03_50
				PIXEL12_70
				PIXEL13_83
				PIXEL23_13
				PIXEL33_11
		}
	PIXEL10_10
		PIXEL11_30
		PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82

}


  __device__ void pixelFunction133(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
			PIXEL11_0
			PIXEL20_31
			PIXEL30_81
	}
	else
	{
		PIXEL00_50
			PIXEL01_21
			PIXEL10_83
			PIXEL11_70
			PIXEL20_14
			PIXEL30_12
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_10
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction134(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_10
		PIXEL20_82
		PIXEL21_32
		if (Diff(y[6], y[8]))
		{
			PIXEL22_0
				PIXEL23_0
				PIXEL30_82
				PIXEL31_32
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL22_70
				PIXEL23_21
				PIXEL30_11
				PIXEL31_13
				PIXEL32_83
				PIXEL33_50
		}

}


  __device__ void pixelFunction135(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[2], y[6]))
	{
		PIXEL00_81
			PIXEL01_31
			PIXEL02_0
			PIXEL03_0
			PIXEL12_0
			PIXEL13_0
	}
	else
	{
		PIXEL00_12
			PIXEL01_14
			PIXEL02_83
			PIXEL03_50
			PIXEL12_70
			PIXEL13_21
	}
	PIXEL10_81
		PIXEL11_31
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_10
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction136(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL10_32
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL20_0
		PIXEL21_0
		PIXEL22_31
		PIXEL23_81
		if (Diff(y[8], y[4]))
		{
			PIXEL30_0
		}
		else
		{
			PIXEL30_20
		}
	PIXEL31_0
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction137(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
	}
	else
	{
		PIXEL00_20
	}
	PIXEL01_0
		PIXEL02_32
		PIXEL03_82
		PIXEL10_0
		PIXEL11_0
		PIXEL12_32
		PIXEL13_82
		PIXEL20_31
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL30_81
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20

}


  __device__ void pixelFunction138(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_0
		if (Diff(y[2], y[6]))
		{
			PIXEL03_0
		}
		else
		{
			PIXEL03_20
		}
	PIXEL10_81
		PIXEL11_31
		PIXEL12_0
		PIXEL13_0
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL23_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction139(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		PIXEL03_81
		PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL13_31
		PIXEL20_82
		PIXEL21_32
		PIXEL22_0
		PIXEL23_0
		PIXEL30_82
		PIXEL31_32
		PIXEL32_0
		if (Diff(y[6], y[8]))
		{
			PIXEL33_0
		}
		else
		{
			PIXEL33_20
		}

}


  __device__ void pixelFunction140(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}

}


  __device__ void pixelFunction141(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_10
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction142(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_0
			PIXEL03_0
			PIXEL13_0
	}
	else
	{
		PIXEL02_50
			PIXEL03_50
			PIXEL13_50
	}
	PIXEL11_0
		PIXEL12_0
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction143(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_10
		PIXEL11_30
		PIXEL12_0
		PIXEL20_10
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction144(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_0
		PIXEL23_0
		PIXEL32_0
		if (Diff(y[6], y[8]))
		{
			PIXEL33_0
		}
		else
		{
			PIXEL33_20
		}

}


  __device__ void pixelFunction145(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_0
		PIXEL21_0
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	if (Diff(y[8], y[4]))
	{
		PIXEL30_0
	}
	else
	{
		PIXEL30_20
	}
	PIXEL31_0

}


  __device__ void pixelFunction146(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_61
		PIXEL20_0
		PIXEL21_0
		PIXEL22_31
		PIXEL23_81
		if (Diff(y[8], y[4]))
		{
			PIXEL30_0
		}
		else
		{
			PIXEL30_20
		}
	PIXEL31_0
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction147(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
	}
	else
	{
		PIXEL00_20
	}
	PIXEL01_0
		PIXEL02_32
		PIXEL03_82
		PIXEL10_0
		PIXEL11_0
		PIXEL12_32
		PIXEL13_82
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction148(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
	}
	else
	{
		PIXEL00_20
	}
	PIXEL01_0
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_0
		PIXEL11_0
		PIXEL12_0
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80

}


  __device__ void pixelFunction149(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_0
		if (Diff(y[2], y[6]))
		{
			PIXEL03_0
		}
		else
		{
			PIXEL03_20
		}
	PIXEL11_0
		PIXEL12_0
		PIXEL13_0
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction150(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_0
		if (Diff(y[2], y[6]))
		{
			PIXEL03_0
		}
		else
		{
			PIXEL03_20
		}
	PIXEL10_81
		PIXEL11_31
		PIXEL12_0
		PIXEL13_0
		PIXEL20_61
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction151(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL12_0
		PIXEL20_82
		PIXEL21_32
		PIXEL22_0
		PIXEL23_0
		PIXEL30_82
		PIXEL31_32
		PIXEL32_0
		if (Diff(y[6], y[8]))
		{
			PIXEL33_0
		}
		else
		{
			PIXEL33_20
		}

}


  __device__ void pixelFunction152(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_10
		PIXEL11_30
		PIXEL12_0
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_0
		PIXEL23_0
		PIXEL32_0
		if (Diff(y[6], y[8]))
		{
			PIXEL33_0
		}
		else
		{
			PIXEL33_20
		}

}


  __device__ void pixelFunction153(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		PIXEL20_0
		PIXEL21_0
		PIXEL22_0
		PIXEL23_0
		if (Diff(y[8], y[4]))
		{
			PIXEL30_0
		}
		else
		{
			PIXEL30_20
		}
	PIXEL31_0
		PIXEL32_0
		if (Diff(y[6], y[8]))
		{
			PIXEL33_0
		}
		else
		{
			PIXEL33_20
		}

}


  __device__ void pixelFunction154(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_10
		PIXEL20_0
		PIXEL21_0
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	if (Diff(y[8], y[4]))
	{
		PIXEL30_0
	}
	else
	{
		PIXEL30_20
	}
	PIXEL31_0

}


  __device__ void pixelFunction155(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
	}
	else
	{
		PIXEL00_20
	}
	PIXEL01_0
		PIXEL02_32
		PIXEL03_82
		PIXEL10_0
		PIXEL11_0
		PIXEL12_32
		PIXEL13_82
		PIXEL20_0
		PIXEL21_0
		PIXEL22_31
		PIXEL23_81
		if (Diff(y[8], y[4]))
		{
			PIXEL30_0
		}
		else
		{
			PIXEL30_20
		}
	PIXEL31_0
		PIXEL32_31
		PIXEL33_81

}


  __device__ void pixelFunction156(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
	}
	else
	{
		PIXEL00_20
	}
	PIXEL01_0
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_0
		PIXEL11_0
		PIXEL12_0
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_10
		PIXEL32_10
		PIXEL33_80

}


  __device__ void pixelFunction157(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
	}
	else
	{
		PIXEL00_20
	}
	PIXEL01_0
		PIXEL02_0
		if (Diff(y[2], y[6]))
		{
			PIXEL03_0
		}
		else
		{
			PIXEL03_20
		}
	PIXEL10_0
		PIXEL11_0
		PIXEL12_0
		PIXEL13_0
		PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82

}


  __device__ void pixelFunction158(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_0
		if (Diff(y[2], y[6]))
		{
			PIXEL03_0
		}
		else
		{
			PIXEL03_20
		}
	PIXEL11_0
		PIXEL12_0
		PIXEL13_0
		PIXEL20_10
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10

}


  __device__ void pixelFunction159(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	PIXEL00_81
		PIXEL01_31
		PIXEL02_0
		if (Diff(y[2], y[6]))
		{
			PIXEL03_0
		}
		else
		{
			PIXEL03_20
		}
	PIXEL10_81
		PIXEL11_31
		PIXEL12_0
		PIXEL13_0
		PIXEL20_82
		PIXEL21_32
		PIXEL22_0
		PIXEL23_0
		PIXEL30_82
		PIXEL31_32
		PIXEL32_0
		if (Diff(y[6], y[8]))
		{
			PIXEL33_0
		}
		else
		{
			PIXEL33_20
		}

}


  __device__ void pixelFunction160(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y)
{
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
	}
	else
	{
		PIXEL00_20
	}
	PIXEL01_0
		PIXEL02_0
		if (Diff(y[2], y[6]))
		{
			PIXEL03_0
		}
		else
		{
			PIXEL03_20
		}
	PIXEL10_0
		PIXEL11_0
		PIXEL12_0
		PIXEL13_0
		PIXEL20_0
		PIXEL21_0
		PIXEL22_0
		PIXEL23_0
		if (Diff(y[8], y[4]))
		{
			PIXEL30_0
		}
		else
		{
			PIXEL30_20
		}
	PIXEL31_0
		PIXEL32_0
		if (Diff(y[6], y[8]))
		{
			PIXEL33_0
		}
		else
		{
			PIXEL33_20
		}
}

typedef void(*FunctionPointer)(uint32_t *, int, int, uint32_t *, uint32_t *);

__global__ void initFunctions(FunctionPointer *FunctionPointers) {
	FunctionPointers[0] = pixelFunction0;
	FunctionPointers[1] = pixelFunction0;
	FunctionPointers[4] = pixelFunction0;
	FunctionPointers[32] = pixelFunction0;
	FunctionPointers[128] = pixelFunction0;
	FunctionPointers[5] = pixelFunction0;
	FunctionPointers[132] = pixelFunction0;
	FunctionPointers[160] = pixelFunction0;
	FunctionPointers[33] = pixelFunction0;
	FunctionPointers[129] = pixelFunction0;
	FunctionPointers[36] = pixelFunction0;
	FunctionPointers[133] = pixelFunction0;
	FunctionPointers[164] = pixelFunction0;
	FunctionPointers[161] = pixelFunction0;
	FunctionPointers[37] = pixelFunction0;
	FunctionPointers[165] = pixelFunction0;
	FunctionPointers[2] = pixelFunction1;
	FunctionPointers[34] = pixelFunction1;
	FunctionPointers[130] = pixelFunction1;
	FunctionPointers[162] = pixelFunction1;
	FunctionPointers[16] = pixelFunction2;
	FunctionPointers[17] = pixelFunction2;
	FunctionPointers[48] = pixelFunction2;
	FunctionPointers[49] = pixelFunction2;
	FunctionPointers[64] = pixelFunction3;
	FunctionPointers[65] = pixelFunction3;
	FunctionPointers[68] = pixelFunction3;
	FunctionPointers[69] = pixelFunction3;
	FunctionPointers[8] = pixelFunction4;
	FunctionPointers[12] = pixelFunction4;
	FunctionPointers[136] = pixelFunction4;
	FunctionPointers[140] = pixelFunction4;
	FunctionPointers[3] = pixelFunction5;
	FunctionPointers[35] = pixelFunction5;
	FunctionPointers[131] = pixelFunction5;
	FunctionPointers[163] = pixelFunction5;
	FunctionPointers[6] = pixelFunction6;
	FunctionPointers[38] = pixelFunction6;
	FunctionPointers[134] = pixelFunction6;
	FunctionPointers[166] = pixelFunction6;
	FunctionPointers[20] = pixelFunction7;
	FunctionPointers[21] = pixelFunction7;
	FunctionPointers[52] = pixelFunction7;
	FunctionPointers[53] = pixelFunction7;
	FunctionPointers[144] = pixelFunction8;
	FunctionPointers[145] = pixelFunction8;
	FunctionPointers[176] = pixelFunction8;
	FunctionPointers[177] = pixelFunction8;
	FunctionPointers[192] = pixelFunction9;
	FunctionPointers[193] = pixelFunction9;
	FunctionPointers[196] = pixelFunction9;
	FunctionPointers[197] = pixelFunction9;
	FunctionPointers[96] = pixelFunction10;
	FunctionPointers[97] = pixelFunction10;
	FunctionPointers[100] = pixelFunction10;
	FunctionPointers[101] = pixelFunction10;
	FunctionPointers[40] = pixelFunction11;
	FunctionPointers[44] = pixelFunction11;
	FunctionPointers[168] = pixelFunction11;
	FunctionPointers[172] = pixelFunction11;
	FunctionPointers[9] = pixelFunction12;
	FunctionPointers[13] = pixelFunction12;
	FunctionPointers[137] = pixelFunction12;
	FunctionPointers[141] = pixelFunction12;
	FunctionPointers[18] = pixelFunction13;
	FunctionPointers[50] = pixelFunction13;
	FunctionPointers[80] = pixelFunction14;
	FunctionPointers[81] = pixelFunction14;
	FunctionPointers[72] = pixelFunction15;
	FunctionPointers[76] = pixelFunction15;
	FunctionPointers[10] = pixelFunction16;
	FunctionPointers[138] = pixelFunction16;
	FunctionPointers[66] = pixelFunction17;
	FunctionPointers[24] = pixelFunction18;
	FunctionPointers[7] = pixelFunction19;
	FunctionPointers[39] = pixelFunction19;
	FunctionPointers[135] = pixelFunction19;
	FunctionPointers[148] = pixelFunction20;
	FunctionPointers[149] = pixelFunction20;
	FunctionPointers[180] = pixelFunction20;
	FunctionPointers[224] = pixelFunction21;
	FunctionPointers[228] = pixelFunction21;
	FunctionPointers[225] = pixelFunction21;
	FunctionPointers[41] = pixelFunction22;
	FunctionPointers[169] = pixelFunction22;
	FunctionPointers[45] = pixelFunction22;
	FunctionPointers[22] = pixelFunction23;
	FunctionPointers[54] = pixelFunction23;
	FunctionPointers[208] = pixelFunction24;
	FunctionPointers[209] = pixelFunction24;
	FunctionPointers[104] = pixelFunction25;
	FunctionPointers[108] = pixelFunction25;
	FunctionPointers[11] = pixelFunction26;
	FunctionPointers[139] = pixelFunction26;
	FunctionPointers[19] = pixelFunction27;
	FunctionPointers[51] = pixelFunction27;
	FunctionPointers[146] = pixelFunction28;
	FunctionPointers[178] = pixelFunction28;
	FunctionPointers[84] = pixelFunction29;
	FunctionPointers[85] = pixelFunction29;
	FunctionPointers[112] = pixelFunction30;
	FunctionPointers[113] = pixelFunction30;
	FunctionPointers[200] = pixelFunction31;
	FunctionPointers[204] = pixelFunction31;
	FunctionPointers[73] = pixelFunction32;
	FunctionPointers[77] = pixelFunction32;
	FunctionPointers[42] = pixelFunction33;
	FunctionPointers[170] = pixelFunction33;
	FunctionPointers[14] = pixelFunction34;
	FunctionPointers[142] = pixelFunction34;
	FunctionPointers[67] = pixelFunction35;
	FunctionPointers[70] = pixelFunction36;
	FunctionPointers[28] = pixelFunction37;
	FunctionPointers[152] = pixelFunction38;
	FunctionPointers[194] = pixelFunction39;
	FunctionPointers[98] = pixelFunction40;
	FunctionPointers[56] = pixelFunction41;
	FunctionPointers[25] = pixelFunction42;
	FunctionPointers[26] = pixelFunction43;
	FunctionPointers[31] = pixelFunction43;
	FunctionPointers[82] = pixelFunction44;
	FunctionPointers[214] = pixelFunction44;
	FunctionPointers[88] = pixelFunction45;
	FunctionPointers[248] = pixelFunction45;
	FunctionPointers[74] = pixelFunction46;
	FunctionPointers[107] = pixelFunction46;
	FunctionPointers[27] = pixelFunction47;
	FunctionPointers[86] = pixelFunction48;
	FunctionPointers[216] = pixelFunction49;
	FunctionPointers[106] = pixelFunction50;
	FunctionPointers[30] = pixelFunction51;
	FunctionPointers[210] = pixelFunction52;
	FunctionPointers[120] = pixelFunction53;
	FunctionPointers[75] = pixelFunction54;
	FunctionPointers[29] = pixelFunction55;
	FunctionPointers[198] = pixelFunction56;
	FunctionPointers[184] = pixelFunction57;
	FunctionPointers[99] = pixelFunction58;
	FunctionPointers[57] = pixelFunction59;
	FunctionPointers[71] = pixelFunction60;
	FunctionPointers[156] = pixelFunction61;
	FunctionPointers[226] = pixelFunction62;
	FunctionPointers[60] = pixelFunction63;
	FunctionPointers[195] = pixelFunction64;
	FunctionPointers[102] = pixelFunction65;
	FunctionPointers[153] = pixelFunction66;
	FunctionPointers[58] = pixelFunction67;
	FunctionPointers[83] = pixelFunction68;
	FunctionPointers[92] = pixelFunction69;
	FunctionPointers[202] = pixelFunction70;
	FunctionPointers[78] = pixelFunction71;
	FunctionPointers[154] = pixelFunction72;
	FunctionPointers[114] = pixelFunction73;
	FunctionPointers[89] = pixelFunction74;
	FunctionPointers[90] = pixelFunction75;
	FunctionPointers[55] = pixelFunction76;
	FunctionPointers[23] = pixelFunction76;
	FunctionPointers[182] = pixelFunction77;
	FunctionPointers[150] = pixelFunction77;
	FunctionPointers[213] = pixelFunction78;
	FunctionPointers[212] = pixelFunction78;
	FunctionPointers[241] = pixelFunction79;
	FunctionPointers[240] = pixelFunction79;
	FunctionPointers[236] = pixelFunction80;
	FunctionPointers[232] = pixelFunction80;
	FunctionPointers[109] = pixelFunction81;
	FunctionPointers[105] = pixelFunction81;
	FunctionPointers[171] = pixelFunction82;
	FunctionPointers[43] = pixelFunction82;
	FunctionPointers[143] = pixelFunction83;
	FunctionPointers[15] = pixelFunction83;
	FunctionPointers[124] = pixelFunction84;
	FunctionPointers[203] = pixelFunction85;
	FunctionPointers[62] = pixelFunction86;
	FunctionPointers[211] = pixelFunction87;
	FunctionPointers[118] = pixelFunction88;
	FunctionPointers[217] = pixelFunction89;
	FunctionPointers[110] = pixelFunction90;
	FunctionPointers[155] = pixelFunction91;
	FunctionPointers[188] = pixelFunction92;
	FunctionPointers[185] = pixelFunction93;
	FunctionPointers[61] = pixelFunction94;
	FunctionPointers[157] = pixelFunction95;
	FunctionPointers[103] = pixelFunction96;
	FunctionPointers[227] = pixelFunction97;
	FunctionPointers[230] = pixelFunction98;
	FunctionPointers[199] = pixelFunction99;
	FunctionPointers[220] = pixelFunction100;
	FunctionPointers[158] = pixelFunction101;
	FunctionPointers[234] = pixelFunction102;
	FunctionPointers[242] = pixelFunction103;
	FunctionPointers[59] = pixelFunction104;
	FunctionPointers[121] = pixelFunction105;
	FunctionPointers[87] = pixelFunction106;
	FunctionPointers[79] = pixelFunction107;
	FunctionPointers[122] = pixelFunction108;
	FunctionPointers[94] = pixelFunction109;
	FunctionPointers[218] = pixelFunction110;
	FunctionPointers[91] = pixelFunction111;
	FunctionPointers[229] = pixelFunction112;
	FunctionPointers[167] = pixelFunction113;
	FunctionPointers[173] = pixelFunction114;
	FunctionPointers[181] = pixelFunction115;
	FunctionPointers[186] = pixelFunction116;
	FunctionPointers[115] = pixelFunction117;
	FunctionPointers[93] = pixelFunction118;
	FunctionPointers[206] = pixelFunction119;
	FunctionPointers[205] = pixelFunction120;
	FunctionPointers[201] = pixelFunction120;
	FunctionPointers[174] = pixelFunction121;
	FunctionPointers[46] = pixelFunction121;
	FunctionPointers[179] = pixelFunction122;
	FunctionPointers[147] = pixelFunction122;
	FunctionPointers[117] = pixelFunction123;
	FunctionPointers[116] = pixelFunction123;
	FunctionPointers[189] = pixelFunction124;
	FunctionPointers[231] = pixelFunction125;
	FunctionPointers[126] = pixelFunction126;
	FunctionPointers[219] = pixelFunction127;
	FunctionPointers[125] = pixelFunction128;
	FunctionPointers[221] = pixelFunction129;
	FunctionPointers[207] = pixelFunction130;
	FunctionPointers[238] = pixelFunction131;
	FunctionPointers[190] = pixelFunction132;
	FunctionPointers[187] = pixelFunction133;
	FunctionPointers[243] = pixelFunction134;
	FunctionPointers[119] = pixelFunction135;
	FunctionPointers[237] = pixelFunction136;
	FunctionPointers[233] = pixelFunction136;
	FunctionPointers[175] = pixelFunction137;
	FunctionPointers[47] = pixelFunction137;
	FunctionPointers[183] = pixelFunction138;
	FunctionPointers[151] = pixelFunction138;
	FunctionPointers[245] = pixelFunction139;
	FunctionPointers[244] = pixelFunction139;
	FunctionPointers[250] = pixelFunction140;
	FunctionPointers[123] = pixelFunction141;
	FunctionPointers[95] = pixelFunction142;
	FunctionPointers[222] = pixelFunction143;
	FunctionPointers[252] = pixelFunction144;
	FunctionPointers[249] = pixelFunction145;
	FunctionPointers[235] = pixelFunction146;
	FunctionPointers[111] = pixelFunction147;
	FunctionPointers[63] = pixelFunction148;
	FunctionPointers[159] = pixelFunction149;
	FunctionPointers[215] = pixelFunction150;
	FunctionPointers[246] = pixelFunction151;
	FunctionPointers[254] = pixelFunction152;
	FunctionPointers[253] = pixelFunction153;
	FunctionPointers[251] = pixelFunction154;
	FunctionPointers[239] = pixelFunction155;
	FunctionPointers[127] = pixelFunction156;
	FunctionPointers[191] = pixelFunction157;
	FunctionPointers[223] = pixelFunction158;
	FunctionPointers[247] = pixelFunction159;
	FunctionPointers[255] = pixelFunction160;
}

#endif