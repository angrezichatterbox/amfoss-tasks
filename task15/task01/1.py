cases = int(input())
for i in range(cases):
    n = int(input())
    n -= 1  
    sum_3 = (3 * (n // 3) * ((n // 3) + 1)) // 2
    sum_5 = (5 * (n // 5) * ((n // 5) + 1)) // 2
    sum_15 = (15 * (n // 15) * ((n // 15) + 1)) // 2
    print(sum_3 + sum_5 - sum_15)
