#include<stdio.h>

int countDigit(int n);
void main(){
    int num , count = 0;
    printf("Enter a number: ");
    scanf("%d",&num);
    if(num == 0){
        count = 1;
    }
    else{
        count = countDigit(num);
    }
    printf("Digit count: %d",count);
}

int countDigit(int n){
    int temp = 0;
    if(n==0){
        return 0;
    }
    else{
       return 1+countDigit(n/10);
    }
}