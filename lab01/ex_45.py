import math
# import ex_41

def mean(l):
    S = 0
    for k in range(len(l)):
        x_k = l[k]
        S += x_k

    N = len(l)
    m = S / N
    
    return m


def std(l):
    m = mean(l)

    temp = [(x_k - m)**2 for x_k in l]
    var = mean(temp)

    std = math.sqrt(var)
    
    return std

if __name__ == '__main__':  # 얘가 모듈로 돌아갈 때는 테스트 코드 돌아가지 않는다!
    print("TEST CODE")
    print(std([1,2,3,4,5,6,7,8,9,10]))

