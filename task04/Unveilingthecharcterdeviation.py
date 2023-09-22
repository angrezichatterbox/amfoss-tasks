cases = int(input())

for i in range(cases):
    a = list("amfoss")
    string = input("")
    b = list(string)
    count = 0
    min_length = min(len("amfoss"),len(string))
    for c in range(min_length):
        if a[c] != b[c]:
            count+=1
    print(count)
     
        
    
    
