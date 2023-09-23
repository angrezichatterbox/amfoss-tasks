n = int(input())
for i in range(2,n):
    for b in range(2,i):
        if (i%b==0):
            break
    else:
        print(i)