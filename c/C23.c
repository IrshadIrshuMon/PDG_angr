#include <stdio.h>

int main(){
    char arr[100];
    for(int i=0; i<100; i++){
        scanf("%c", &arr[i]);
    }
    printf("%s", arr);

    return 0;
}
