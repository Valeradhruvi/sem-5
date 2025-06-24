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
    int i=1;
   if(y==0){
    return 1;
   }
   else{
    return x*power(x,y-1);
   }
}