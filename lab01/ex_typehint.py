# def add(a, b):
#     """
#     두 수 a, b를 더하는 함수
#     """
#     return a+b

# help(add)

# 함수에 typehinting 하는 경우는 많고 변수까지는 아니래
def mul(a : int, b : int) -> int:   # : int 이런 게 걍 주석처럼 작동
    return a*b

print(mul(3, 4))
print(mul('3', 4))  # 잘 돌아감

# 타입을 강제할 수 있는 라이브러리 : mypy 라이브러리