def maxi(l2):
    if len(l2) == 1:
        return l2[0]
    else:
        return max(l2[0],maxi(l2[1:]))

l1 = []
for i in range(5):
    l1.append(int(input()))

print(maxi(l1))