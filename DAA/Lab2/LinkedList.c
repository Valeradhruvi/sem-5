#include<stdio.h>
#include<stdlib.h>
void insert(int element);
void delete();
void display();
void main(){

    int choice, num;
    int flag = 1; 
    while(flag != 0){
        printf("Enter 1 for Insertion in Linked List \n Enter 2 for Deletion in Linked List \n 3 for Display Linked List and 4 to exit Menu: ");
        scanf("%d",&choice);

        switch(choice){
            case 1: printf("Enter Number You want to Insert: ");
                    scanf("%d",&choice);
                    insert(choice);
                    printf("========================\n");
                    break;
            case 2: delete();
                    break;
            case 3: printf("========================\n");
                    display();
                    break;
            case 4: flag = 0;
                    break;
            default:printf("Enter Valid Choice: ");
                    break;
        }
    }
}

struct Node{
    int data;
    struct Node *link;
} *head = NULL;

void insert(int element){
    struct Node *newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = element;

    if(head == NULL){
        head = newNode;
        head->link = NULL;
        return;
    }
    else{
        struct Node *temp = head;
        while(temp->link != NULL){
            temp = temp->link;
        }

        temp->link = newNode;
        newNode->link = NULL;
    }

}

void delete(){
    struct Node *last = head;
    struct Node *prev = last;

    if(last == NULL){
       printf("Linked List is Empty");
    }

    while(last->link != NULL ){
        prev = last;
        last = last->link;
    }

    prev->link = NULL;
    free(last);
}

void display(){
    struct Node *current = head;

    if(current == NULL){
        printf("Linked List is empty");
        return;
    }
    else{
        while(current != NULL){
            printf("%d \n",current->data);
            current = current->link;
        }
    }

}