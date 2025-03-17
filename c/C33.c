#include <stdio.h>

void test(int* a){
    for(int i=0; i<10; i++){
        scanf("%d", &a[i]);
    }
}

int main(){
    int arr[10];
    test(arr);

    return 0;
}
