X = [[78, 80, 95, 55, 67, 43], 
     [45, 67, 90, 87, 88, 93]]

def mean(l):
    S = 0
    for k in range(len(l)):
        x_k = l[k]
        S += x_k

    N = len(l)
    m = S / N
    
    return round(m, 2)


# 리스트 컴프리헨션
L = [mean(x) for x in X]
print(L)

# for 문
L = []
for x in X:
    L.append(mean(x))
print(L)