#include<stdio.h>

int fact(int n);
void main(){
    int num;
    printf("Enter a number: ");
    scanf("%d",&num);
    int fac = fact(num);
    printf("Factorial : %d",fac);
}

int fact(int n){
    int sum = 1;
    int i=n;
    while(i>0){
        sum *= i--;
    }

    return sum;
}