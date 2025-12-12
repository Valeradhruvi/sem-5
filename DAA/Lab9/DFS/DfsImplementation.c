#include <stdio.h>
#include <stdlib.h>

#define V 100

int stack[V], top = -1;

void push(int v) {
    stack[++top] = v;
}

int pop() {
    return stack[top--];
}

int isEmpty() {
    return top == -1;
}

void DFS_iterative(int graph[V][V], int n, int start) {
    int visited[V] = {0};

    push(start);
    while (!isEmpty()) {
        int vertex = pop();
        if (!visited[vertex]) {
            printf("%d ", vertex);
            visited[vertex] = 1;

            for (int i = n - 1; i >= 0; i--) {
                if (graph[vertex][i] && !visited[i]) {
                    push(i);
                }
            }
        }
    }
}

void main() {
    int n = 5;
    int graph[V][V] = {
        {0, 1, 1, 0, 0},
        {1, 0, 0, 1, 1},
        {1, 0, 0, 0, 0},
        {0, 1, 0, 0, 0},
        {0, 1, 0, 0, 0}
    };

    printf("DFS Traversal : ");
    DFS_iterative(graph, n, 0);

}
