import time

def timing_decorator(func):
    def wrapper(*args, **kwargs):
        before = time.time()
        result = func(*args, **kwargs)
        after = time.time()

        print(f"{func.__name__} 실행 시간: {after - before:.10f}초")
        
        return result
    return wrapper

# fibonacci_dp = timing_decorater(fibonacci_dp)
@timing_decorator
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

@timing_decorator
def fibonacci_deco(n):  # 이렇게 해야지 fibonacci_dp랑 공평하게 시간비교가 가능하대...뭐래
    return [_ for _ in gen_fibonacci_dp(n)]

# fibonacci_dp = timing_decorator(fibonacci_dp)
fibonacci_dp(10000)  # wrapper함수임
print()

# gen_fibonacci_dp = timing_decorator(gen_fibonacci_dp)
fibonacci_deco(10000)

# timing_decorator(gen_fibonacci_dp)
