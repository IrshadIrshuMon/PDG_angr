#include <stdio.h>

void test(char* a, int i){
    for(int i=0; i<10; i++){
        scanf("%c", &a[i]);
    }
    printf("%s", a);
}

int main(){
    int i = 10;
    char arr[10];
    test(arr, i);

    return 0;
}
