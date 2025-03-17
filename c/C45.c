#include <stdio.h>

int test(double i[]){
    i[0] = 2.5;
    i[3] = 6.5;
    i[6] = 9.5;
    return 0;
}

int main(){
    double i[5];

    printf("%d", test(i));

    return 0;
}
