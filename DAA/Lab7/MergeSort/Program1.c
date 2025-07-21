#include <stdio.h>
#include<time.h>
#define N 100

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

void Merge(int arr[],int low, int mid, int high)
{
    int h = low;
    int i = 0;
    int j = mid + 1;
    
    int b[high - low + 1];
    while (h <= mid && j <= high)
    {
        if (arr[h] <= arr[j])
        {
            b[i] = arr[h];
            h++;
        }
        else
        {
            b[i] = arr[j];
            j++;
        }
        i++;
    }
    if (h > mid)
    {
        for (int k = j; k <= high; k++)
        {
            b[i] = arr[k];
            i++;
        }   
    }
    else
    {
        for (int k = h; k <= mid; k++)
        {
            b[i] = arr[k];
            i++;
        }
    }
    for (int k = 0; k < i; k++)
    {
        arr[low + k] = b[k];
    }
}

void MergeSort(int arr[],int low, int high)
{
    int mid = 0;
    if (low < high)
    {
        mid = (low + high) / 2;
        MergeSort(arr,low, mid);
        MergeSort(arr,mid + 1, high);
        Merge(arr,low, mid, high);
    }
}

int main()
{
  int arr[N];
    clock_t start , end;
    double time_taken;

    //best case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_100.txt" , arr , N)){
        start = clock();
        MergeSort(arr , 0 , N-1 );
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("Best case Time complexity: %.2f ms\n", time_taken);
    }

    //average case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_100.txt" , arr , N)){
        start = clock();
        MergeSort(arr , 0 , N-1 );
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("average case Time complexity: %.2f ms\n", time_taken);
    }

     //worst case
    if(readFromFile("C:/lab practice/sem 5/DAA/Array/best_case_100.txt" , arr , N)){
        start = clock();
        MergeSort(arr , 0 , N-1 );
        end = clock();
        time_taken = ((double)end-start) /  CLOCKS_PER_SEC  * 1000;
        printf("worst case Time complexity: %.2f ms\n", time_taken);
    }
}
