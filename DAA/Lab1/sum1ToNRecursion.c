#include<stdio.h>
int sum(int n);
void main(){
    int num;
    printf("Enter a number: ");
    scanf("%d",&num);
    int summetion = sum(num);
    printf("Summetion : %d",summetion);
}

int sum(int n){
    if(n==0){
        return 0;
    }
    else{
        return sum(n-1)+n;
    }
}