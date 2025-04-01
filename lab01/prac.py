def fibo(x) :
    if x == 0 or x == 1 :
        return x
    else :
        return fibo(x - 2) + fibo(x - 1)
    

while True :
    num = int(input("insert : "))
    if num < 0 :
        break
    else :
        print(fibo(num))