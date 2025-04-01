a = int(input("나눠질 수를 입력하세요: "))
b = int(input("나눌 수를 입력하세요: "))

# def Qr(x, y):
#     q = 0
#     while x > 0:
#         x -= y
#         if x < 0:
#             x += y
#             break
#         q += 1
        
#     r = x

#     return (q, r)

def Qr(x, y):
    q = 0
    while x >= y:
        x -= y
        q += 1
    r = x

    return (q, r)

ret = Qr(a, b)
print(ret[0], ret[1])