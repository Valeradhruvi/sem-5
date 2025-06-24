#include<stdio.h>

int power(int x , int y);
void main(){
    int x , y;
    printf("Enter a number: ");
    scanf("%d",&x);
    printf("Enter power: ");
    scanf("%d",&y);

    int pow = power(x,y);
    printf("Power : %d", pow);
}

int power(int x , int y){
    int i=1 , ans = 1;
    while(i<=y){
        ans = ans*x;
        i++;
    }
    return ans;
}