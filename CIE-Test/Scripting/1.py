l1 = []

#1a)
def create_list():
    for i in range(5):
        l1.append(input())

def remdup():
    return list(set(l1))

create_list()
print(remdup())

#1b)
print([ i for i in range(28) if i%2 == 0])

#1c)
l3 = ["This","is","XYZ","Here"]
print(l3[::-1])