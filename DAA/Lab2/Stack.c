#include<stdio.h>
#define size 100

int arr[size];
int top = -1;

void pop(){
    if(top == -1){
        printf("Stack is empty");
        return;
    }

    top = top-1;
}

void push(int element){
    if(top > size-1){
        printf("Stack Overflow");
        return;
    }

    top = top+1;
    arr[top] = element;
}

void display(){
    if(top == -1){
        printf("Stack is empty");
        return;
    }

    for(int i=top;i>=0;i--){
        printf("%d ",arr[i]);
    }
}
void main(){
    push(10);
    push(20);
    push(30);
    push(40);
    push(50);
    display();
    printf("\n=======================\n");
    pop();
    display();
}