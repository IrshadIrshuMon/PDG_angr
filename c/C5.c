#include <stdio.h>

void printString(char *str){
    printf("%s", str);
}

int main(){
    char arr[10] = "Hello";
    printString(arr);

    return 0;
}
