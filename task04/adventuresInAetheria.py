n = int(input())

travelTime = list(map(int,input().split()))

minTravelTime = min(travelTime)

if travelTime.count(minTravelTime) > 1:
    print("Still Aetheria")
else:
    minIndex = travelTime.index(minTravelTime)
    print(minIndex + 1)