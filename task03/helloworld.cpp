#include <iostream>

int main() {
    int n;
    std::cin >> n;

    for (int i = 2; i < n; ++i) {
        bool isPrime = true;
        
        for (int b = 2; b < i; ++b) {
            if (i % b == 0) {
                isPrime = false;
                break;
            }
        }
        
        if (isPrime) {
            std::cout << i << std::endl;
        }
    }

    return 0;
}
