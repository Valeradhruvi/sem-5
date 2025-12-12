#include <stdio.h>

#define V 100

// Queue structure
struct Queue {
    int items[100];
    int front;
    int rear;
};

// Enqueue operation
void enqueue(struct Queue *q, int value) {
    if (q->rear == V) {
        printf("Queue overflow\n");
        return;
    }
    q->items[q->rear++] = value;
}

// Dequeue operation
int dequeue(struct Queue *q) {
    if (q->front == q->rear) {
        printf("Queue underflow\n");
        return -1;
    }
    return q->items[q->front++];
}

// Check if queue is empty
int isEmpty(struct Queue *q) {
    return q->front == q->rear;
}

void BFS(int graph[V][V], int n, int start) {
    struct Queue q = {{0}, 0, 0}; // Direct initialization

    int visited[V] = {0};

    visited[start] = 1;
    enqueue(&q, start);

    while (!isEmpty(&q)) {
        int vertex = dequeue(&q);
        printf("%d ", vertex);

        for (int i = 0; i < n; i++) {
            if (graph[vertex][i] && !visited[i]) {
                visited[i] = 1;
                enqueue(&q, i);
            }
        }
    }
}

int main() {
    int n = 5;
    int graph[V][V] = {
        {0, 1, 1, 0, 0},
        {1, 0, 0, 1, 1},
        {1, 0, 0, 0, 0},
        {0, 1, 0, 0, 0},
        {0, 1, 0, 0, 0}
    };

    printf("BFS Traversal: ");
    BFS(graph, n, 0);

    return 0;
}
