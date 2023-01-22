#include <stdio.h>
#include <string.h>
//#include<stdlib.h>

char buf[1222222];

int shape(unsigned char *source_bitmap);

void openbmpfile(unsigned char *name_of_file);

int main(void)
{
    int length;
    unsigned char *filename;
    printf("Please enter name of the file: \n");
    scanf("%hhu", filename);
    printf("%hhu", filename);
    //length = strlen(&filename);
    //printf("%d", length);
    //openbmpfile(filename);
    //shape(buf + 123);
    return 0;    
}

void openbmpfile(unsigned char *name_of_file){
    FILE *fp = fopen("shape11.bmp", "rb");

    fclose(fp);
}