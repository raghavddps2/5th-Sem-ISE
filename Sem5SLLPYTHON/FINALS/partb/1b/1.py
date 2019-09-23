def remdup(a):
	return list(set(a))
l=[]
for i in range(0,5):
	l.append(input())
print(l)
rev = l[::-1]
print(rev)
print(remdup(l))	
print([i for i in range(0,10) if i%2==0])
