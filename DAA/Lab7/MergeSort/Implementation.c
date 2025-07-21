#include <stdio.h>
#define N 100

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
    int n;

    printf("Enter number of elements: ");
    scanf("%d", &n);
    int arr[n];

    printf("Enter elements : \n");
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &arr[i]);
    }
    MergeSort(arr,0, n - 1);
    printf("Sorted Array : \n");
    for (int i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
}
