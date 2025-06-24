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
    if(n==0){
        return 1;
    }
    else{
        return fact(n-1)*n;
    }
}