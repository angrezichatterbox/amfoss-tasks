""" Given any number n, find all the prime numbers 
up to n and print them out to the terminal. 
The number n must be taken as input from the user """


n = int(input())
for i in range(2,n):
    for b in range(2,i):
        if (i%b==0):
            break
    else:
        print(i)