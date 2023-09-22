a = int(input())
up = []

for i in range(a):
    x, y, z = map(int, input().split())
    up.append((x, y, z))


sumx = sum([up[i][0] for i in range(a)])
sumy = sum([up[i][1] for i in range(a)])
sumz = sum([up[i][2] for i in range(a)])

if sumx == sumy == sumz == 0:
    print("YES")
else:
    print("NO")


