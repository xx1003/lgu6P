# def mean(a, b):
#     return (a + b) / 2

# avg = mean(1,2)
# print(avg)

# def mean(l):
#     return (sum(l) / len(l))

# def mean(l):
#     total = 0
#     for num in l:
#         if type(num) != type(1):
#             num = int(num)    
#         total += num
    
#     return total / len(l)

# print(mean([1,2,3]))


def mean(l):
    S = 0
    for k in range(len(l)):
        x_k = l[k]
        S += x_k

    N = len(l)
    m = S / N
    
    return m

