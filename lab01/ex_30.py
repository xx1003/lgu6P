n = 5

for i in range(n):
    for j in range(n - (i + 1)):
        print(" ", end='')
    for j in range(i * 2 + 1):
        print("*", end='')
    print()

print()

# f-string 이용
for i in range(n):
    star = "*" * (i*2 + 1)
    print(f"{star:^9s}")