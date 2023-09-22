#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);

    for (int i = 2; i < n; ++i) {
        int isPrime = 1;
        
        for (int b = 2; b < i; ++b) {
            if (i % b == 0) {
                isPrime = 0; 
                break;
            }
        }
        
        if (isPrime) {
            printf("%d\n", i);
        }
    }

    return 0;
}
