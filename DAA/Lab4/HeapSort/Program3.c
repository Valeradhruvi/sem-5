#include<stdio.h>
#include<time.h>

#define N 10000

void heapify(int array[] , int i , int n){
    int left = 2*i+1;
    int right = 2*i+2;

    int largest = i;
    if(left < n && array[left] > array[largest]){
        largest = left;
    }
    if(right < n && array[right] > array[largest]){
        largest = right;
    }

    if(i != largest){
        int temp = array[i];
        array[i] = array[largest];
        array[largest] = temp;

        heapify(array , largest , n);
    }
}

void buildMaxHeap(int array[] , int n){
    // int length = sizeOf(array[0]);
    for(int i=n/2-1 ; i>=0 ; i--){
        heapify(array , i , n);
    }
}

void heapSort(int array[] , int n){
    buildMaxHeap(array , N);
    for(int i=n/2-1;i>=0;i--){
        int temp = array[0];
        array[0] = array[i];
        array[i] = temp;

        heapify(array , i , 0 );
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
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_10000.txt" , arr , N)){
        start = clock();
        heapSort(arr , N);
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("Best case Time complexity: %.2f ms\n", time_taken);
    }
    
     //average case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/average_case_10000.txt" , arr , N)){
        start = clock();
        heapSort(arr , N);
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("Average case Time complexity: %.2f ms\n" ,time_taken);
    }

    //worst case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/worst_case_10000.txt", arr , N)){
        start = clock();
        heapSort(arr , N);
        end = clock();
        time_taken = ((double)(end-start)) /  CLOCKS_PER_SEC  * 1000;
        printf("Worst case Time complexity: %.2f ms\n" ,time_taken);
    }
}