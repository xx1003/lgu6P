operations = {
    '+' : lambda x, y : x + y,
    '-' : lambda x, y : x - y,
    '*' : lambda x, y : x * y,
    '/' : lambda x, y : x / y if y != 0 else "오류: 0으로 나눌 수 없습니다"
}

x = float(input("첫 번째 숫자를 입력하세요 : "))
y = float(input("두 번째 숫자를 입력하세요 : "))
o = input("연산자를 입력하세요 (+, -, *, /): ")

if o in ['+', '-', '*', '/']:
    print(f"{x:.1f} {o} {y:.1f} = {operations[o](x, y)}")
else:
    print("올바른 연산이 아닙니다.")