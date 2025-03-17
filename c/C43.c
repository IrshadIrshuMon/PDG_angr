#include <stdio.h>

int test(char i[5]){
    i[0] = 'a';
    i[3] = '7';
    i[6] = 'g';
    return 0;
}

int main(){
    char i[5];

    printf("%d", test(i));

    return 0;
}
