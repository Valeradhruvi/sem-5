#include <stdio.h>
#include <time.h>

#define size 100

int readArrayFromFile(const char *filename, int arr[], int n) {
    FILE *f = fopen(filename, "r");
    if (!f) {
        printf("Can't open file %s\n", filename);
        return 0;
    }
    for (int i = 0; i < n; i++) {
        fscanf(f, "%d", &arr[i]);
    }
    fclose(f);
    return 1;
}


int partition(int arr[], int low, int high) {
    int pivot = arr[high]; 
    int i = low - 1;       

    for (int j = low; j < high; j++) {
        if (arr[j] <= pivot) {
            i++;
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }

    int temp = arr[i + 1];
    arr[i + 1] = arr[high];
    arr[high] = temp;

    return i + 1;
}


void quickSort(int arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);

        quickSort(arr, low, pi - 1);  
        quickSort(arr, pi + 1, high); 
    }
}


int main() {
    int arr[size];
    clock_t start, end;
    double time_taken;

    if (readArrayFromFile("C:/lab practice/sem 5/DAA/Array/best_case_100.txt", arr, size)) {
        start = clock();
        quickSort(arr, 0, size - 1);
        end = clock();

        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC;
        printf("Time taken for Quick Sort on average case (100 elements): %lf seconds\n", time_taken);
    }

    return 0;
}