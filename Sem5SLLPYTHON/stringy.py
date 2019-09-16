str2 = ["Hello 123!","This","is","Nimish"]
strrev = []
for i in range(0,4):
    if(i%2==0):
        print("Even pos: ",str2[i])

    if(i%3==0):
        print("Index div 3: ",str2[i].upper())

for i in str2:
    strrev.append(i[::-1])

print(strrev)

for i in str2:
    if i.isdigit():
        for j in i:
            if j.isdigit():
                print(j)
    print()



