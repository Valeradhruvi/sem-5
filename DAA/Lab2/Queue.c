#include<stdio.h>
#define size 100
int queue[size];
int r=-1, f=-1;

void enqueue(int element){
    if(r>=size){
        printf("Queue Overflow");
        return;
    }

    r = r+1;
    queue[r] = element;

    if(f == -1){
        f = 0;
    }
}

void dequeue(){
    int y = queue[f];
    if(r<-1){
        printf("Queue Underflow");
        return;
    }

    if(f==r){
        f=-1;
        r=-1;
        // return y;
    }

    f++;
    // return y;

}
void display(){
    if(r <= -1){
        printf("Queue is empty");
        return;
    }

    for(int i=f;i<=r;i++){
        printf("%d ",queue[i]);
    }
}
void main(){
    enqueue(10);
    enqueue(20);
    enqueue(30);
    display();
    printf("\n==================\n");
    dequeue();
    display();
}