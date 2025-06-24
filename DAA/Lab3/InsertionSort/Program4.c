#include<stdio.h>
#include<stdlib.h>
#include<time.h>

#define N 100000

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

void insertionSort(int arr[], int n){
       for (int i = 1; i < n; ++i) {
        int key = arr[i];
        int j = i - 1;

        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}

void main(){
    int arr[N];
    clock_t start , end;
    double time_taken;

    //best case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_100000.txt" , arr , N)){
        start = clock();
        insertionSort(arr,N);
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("Best case Time complexity: %.2f ms\n", time_taken);
    }
    
    //average case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/average_case_100000.txt" , arr , N)){
        start = clock();
        insertionSort(arr,N);
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("Average case Time complexity: %.2f ms\n" ,time_taken);
    }

    //worst case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/worst_case_100000.txt", arr , N)){
        start = clock();
        insertionSort(arr,N);
        end = clock();
        time_taken = ((double)(end-start)) /  CLOCKS_PER_SEC  * 1000;
        printf("Worst case Time complexity: %.2f ms\n" ,time_taken);
    }
}