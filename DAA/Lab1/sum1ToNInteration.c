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
    int temp = 0 , i=0;
    while(i<=n){
        temp += i;
        i++;
    }
    return temp;
}