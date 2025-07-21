#include<stdio.h>
#include<time.h>
#define N 10

void linearSearch(int array[] , int element , int n){
    int index = 0;
    for(int i=0;i<n;i++){
        if(array[i] == element){
            index = i;
        }
    }

    printf("element found at %d", index);
}

void main(){
    int array[] = {1,2,3,4,5,6,7,8,9,10};

    linearSearch(array , 5 , N);
}