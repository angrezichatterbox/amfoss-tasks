cases = int(input())

for _ in range(cases):
    n = int(input())
    a = [1, 2]
    num = a[-1]

    sum_even = 2

    while num <= n:
        length = len(a)
        num = a[length - 1] + a[length - 2]

        if num <= n:
            if num % 2 == 0:
                sum_even += num

        a.append(num)  

    print(sum_even)

