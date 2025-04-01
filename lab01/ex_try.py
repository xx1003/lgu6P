operations = {
    '+' : lambda x, y : x + y,
    '-' : lambda x, y : x - y,
    '*' : lambda x, y : x * y,
    '/' : lambda x, y : x / y
}
try:
    x = float(input("첫 번째 숫자를 입력하세요 : "))
    y = float(input("두 번째 숫자를 입력하세요 : "))
    o = input("연산자를 입력하세요 (+, -, *, /): ")

    print(f"{x:.1f} {o} {y:.1f} = {operations[o](x, y)}")

except ZeroDivisionError as e:
    print("zero division error!")
    print(e)
except ValueError as e:
    print("value error!")
    print(e)
except KeyError as e:
    print("key error!")
    print(e)


# if o in ['+', '-', '*', '/']:
#     print(f"{x:.1f} {o} {y:.1f} = {operations[o](x, y)}")
# else:
#     print("올바른 연산이 아닙니다.")