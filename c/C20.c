#include <stdio.h>

int main(){
    char arr[10];
    for(int i=0; i<10; i++){
        scanf("%c", &arr[i]);
    }
    printf("%s", arr);

    return 0;
}
