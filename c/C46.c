#include <stdio.h>

int test(long long i[5]){
    i[0] = 25;
    i[3] = 65;
    i[6] = 95;
    return 0;
}

int main(){
    long long i[5];

    printf("%d", test(i));

    return 0;
}
