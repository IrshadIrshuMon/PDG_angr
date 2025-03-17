#include <stdio.h>

int test(int i[5]){
    i[0] = 2;
    i[3] = 6;
    i[6] = 9;
    return 0;
}

int main(){
    int i[5];

    printf("%d", test(i));

    return 0;
}
