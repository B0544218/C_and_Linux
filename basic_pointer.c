#include<stdio.h>
#include<stdlib.h>
// 注意C語言 printf要印出數字時要用 整數:%d ,福點數:%f ,16進位整數:%p ...
int main(void){
    int b = 2;
    int* pointer = &b;
    // int* pointer 宣告pointer為整數 內容值為&b
    // &b 取得b的變數位址
    // pointer 取得pointer內容值(&b位址)
    // *pointer 告訴程式，這是一個變數位址，並去找對應的變數位址的值
    // *&b 和 b 是等價的
    printf("var b value:%d\n", b);
    printf("var b value:%p\n", &b);
    printf("pointer value:%p\n", pointer);
    printf("\n"); //換行
    
    *pointer = 100;
    printf("*pointer value:%d\n", *pointer);
    printf("var b value:%d\n", b);
    printf("var pointer address:%p\n", pointer);
    printf("var b address:%p\n", &b);

 return 0;

}