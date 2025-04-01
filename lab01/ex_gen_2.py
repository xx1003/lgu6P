def fibonacci_dp(n):
    if n == 0:
        return [0]
    fib = [0] * (n + 1)
    
    fib[0] = 0
    fib[1] = 1

    for i in range(2, n+1):
        fib[i] = fib[i-2] + fib[i-1]

    return fib


def gen_fibonacci_dp(n):
    a, b = 0, 1
    
    for _ in range(n+1):
        yield a
        a, b = b, a+b

n = 5
print(fibonacci_dp(n))
print(list(gen_fibonacci_dp(n)))