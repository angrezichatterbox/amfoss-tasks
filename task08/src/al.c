#include <stdio.h>

void swap(int *p, int *q) {
    int tmp = *p;
    *p = *q;
    *q = tmp;
}

void customSort(int data[], int size) {
    int i, j;
    for (i = 0; i < size - 1; i++) {
        for (j = 0; j < size - i - 1; j++) {
            if (data[j] > data[j + 1]) {
                swap(&data[j], &data[j + 1]);
            }
        }
    }
}

int main() {
    int n;
    scanf("%d", &n);
    
    int numbers[n];
    for (int i = 0; i < n; i++) {
        scanf("%d", &numbers[i]);
    }
    
    customSort(numbers, n);
    
    printf("Sorted Array: ");
    for (int i = 0; i < n; i++) {
        printf("%d ", numbers[i]);
    }
    
    return 0;
}
