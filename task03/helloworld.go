package main

import "fmt"

func main() {
    var n int
    fmt.Scan(&n)
    for i := 2; i < n; i++ {
        prime := true
        for b := 2; b < i; b++ {
            if i%b == 0 {
                prime = false
                break
            }
        }
        if prime {
            fmt.Println(i)
        }
    }
}
