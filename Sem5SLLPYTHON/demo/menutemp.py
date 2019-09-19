def celtofah(t):
    return t*(9/5)+32

def fahtocel(t):
    return (t-32)*(5/9)

n='y'
while(True):
    if(n=='y'):
        c=int(input("1. Celcius to Fahrenheit\n2. Fahrenheit to Celcius\n"))
        num=int(input("Enter the temperature: "))
        if(c==1):
            print(celtofah(num))
        elif(c==2):
            print(fahtocel(num))
        else:
            print("Wrong choice")
    else:
        break

    n=input("Continue? (y/n)")



