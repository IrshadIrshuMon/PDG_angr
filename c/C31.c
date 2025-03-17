#include <stdio.h>

void test(char* a){
    for(int i=0; i<10; i++){
        scanf("%c", &a[i]);
    }
    printf("%s", a);
}

int main(){
    char arr[10];
    test(arr);

    return 0;
}
