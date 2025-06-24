#include<stdio.h>

int countDigit(int n);
void main(){
    int num;
    printf("Enter a number: ");
    scanf("%d",&num);
    int count = countDigit(num);
    printf("Digit count: %d",count);
}

int countDigit(int n){
    int temp = 0;
    if(n==0){
        return 1;
    }
    else{
        while(n!=0){
        n = n/10;
        temp++;
        }
    }
    return temp;
}