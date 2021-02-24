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
    printf("var b address:%p\n", &b);
    printf("var pointer value:%p\n", pointer);
    printf("\n"); //換行
    
    *pointer = 100;
    printf("*pointer point value:%d\n", *pointer);
    printf("var b value:%d\n", b);
    printf("var b address:%p\n", &b);
    printf("var pointer value:%p\n", pointer);
    //pointer 會和 &b(b address)一樣
    //*pointer  和 b 一樣

    int** pointer2 = &pointer;
    printf("var **pointer2 double point value:%d\n", **pointer2);
    //**pointer2 是雙重指標
    // pointer2 會和 pointer address一樣
    //*pointer2 會和 pointer 以及 &b一樣
    //**pointer2 和 *pointer 以及 b 一樣
    
 return 0;

}