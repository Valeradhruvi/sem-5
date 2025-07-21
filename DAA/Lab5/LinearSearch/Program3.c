#include<stdio.h>
#include<time.h>
#define N 10000

void linearSearch(int array[] , int element , int n){
    int index = 0;
    for(int i=0;i<n;i++){
        if(array[i] == element){
            index = i;
            break;
        }
    }

    printf("element found at %d \n", index);
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
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_10000.txt" , arr , N)){
        start = clock();
        linearSearch(arr , arr[0] , N );
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("Best case Time complexity: %.2f ms\n", time_taken);
    }

    //average case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_10000.txt" , arr , N)){
        start = clock();
        linearSearch(arr , arr[N/2] , N );
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("average case Time complexity: %.2f ms\n", time_taken);
    }

     //worst case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_10000.txt" , arr , N)){
        start = clock();
        linearSearch(arr , arr[N-1] , N );
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("worst case Time complexity: %.2f ms\n", time_taken);
    }
}