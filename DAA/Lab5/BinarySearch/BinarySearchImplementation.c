#include<stdio.h>
#include<time.h>
#define N 10

void binarySearch(int array[] , int element , int n){
    int first = 0 ;
    int last = n-1;
    int mid = (first+last)/2;
    int isFound = 0;

    while (last>=first) {
            mid = (first+last)/2;
            
            if(element<array[mid]){
                last = mid-1;
            }
            else if(element == array[mid]){
                printf("element found at %d" , mid);
                isFound = 1;
                break;
            }
            else{
               first = mid+1;
            }
        }

         if(isFound == 0){
            printf("element does not exist");
        }
}

void main(){
    int array[] = {1,2,3,4,5,6,7,8,9,10};

    binarySearch(array , 7 , N);
}