#include<stdio.h>
#include<time.h>
#define N 100000

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

int readFromFile(const char *filename , int arr[] , int n){
    FILE *f = fopen(filename , "r");
    if(!f){
        printf("Cannot open file %s\n" , filename);
        return 0;
    }

    for(int i=0;i<n;i++){
        fscanf(f, "%d" , &arr[i]);
    }
    fclose(f);
    return 1;
}

void main(){
    int arr[N];
    clock_t start , end;
    double time_taken;

    //best case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_100000.txt" , arr , N)){
        start = clock();
        binarySearch(arr , arr[0] , N );
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("Best case Time complexity: %.2f ms\n", time_taken);
    }

    //average case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_100000.txt" , arr , N)){
        start = clock();
        binarySearch(arr , arr[N/2] , N );
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("average case Time complexity: %.2f ms\n", time_taken);
    }

     //worst case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_100000.txt" , arr , N)){
        start = clock();
        binarySearch(arr , arr[N-1] , N );
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("worst case Time complexity: %.2f ms\n", time_taken);
    }
}