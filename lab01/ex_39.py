n = int(input("n: "))

# L = [ i for i in range(1, n+1) if i % 2 == 1]
# print(L)

L = [i for i in range(1, n+1) if i % 2 == 0]
print(L)