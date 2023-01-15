#include <stdio.h>
#include <stdlib.h>

const int BMP_FILE_SIZE = 90122;

int encode128(unsigned char *dest_bitmap, int bar_width, char *text);
// dest_bitmap - pointer to generated image (header and pixel data)
// bar_width - the width of the narrowest bar in pixels
// text – text to be encoded
// The function should return a 0 (OK) or a positive number indicating an error
// (e.g. barcode does not fit in bitmap of given size, text contains characters
// which can not be encoded).

int main(int argc, char *argv[]) {
    unsigned char *dest_bitmap = (unsigned char *)calloc(BMP_FILE_SIZE, sizeof(unsigned char));
    int narrowest_bar_width = 1;
    char text_to_encode[40] = "213700";
    int res = encode128(dest_bitmap, narrowest_bar_width, text_to_encode);
    printf("Digits: \n");
    printf("%d \n", res);
    // printf("%d \n", *(res+1));
    // printf("%d \n", *(res+2));


    // // Read the width in pixels of narrowest bar
    // int narrowest_bar_width = 1;
    // // printf("Enter the width of the narrowest bar (in pixels): ");
    // // int read_result = scanf("%d", &narrowest_bar_width);
    // // if (!read_result) return 1;

    // // Read the text to encode
    // char text_to_encode[40] = "33";
    // // printf("Enter the text that you want to encode: ");
    // // scanf("%40s", text_to_encode);

    // printf("--- \n");

    // printf("Narrowest bar width: %d \n", narrowest_bar_width);
    // printf("Text to encode: %s \n", text_to_encode);

    // printf("--- \n");

    // unsigned char *dest_bitmap = (unsigned char *)calloc(BMP_FILE_SIZE, sizeof(unsigned char));
    // int res = encode128(dest_bitmap, narrowest_bar_width, text_to_encode);
    // printf("%d \n", res);

    // free(dest_bitmap);


    // Output: 
    // BMP file containing the barcode image: 
    // Sub format: 24 bits RGB – no compression, 
    // Image size: 600x50 px, 
    // Colors: bars – black, background – white. 
    // file name: “output.bmp”

    // Remarks: 
    // 1. Do not store bars and spaces patterns in coding table as character strings. 
    // 2. File I/O, memory allocation, displaying of messages should be done in C/C++ 
    // program. 

}
