radius = float(input("원의 반지름을 입력하세요: "))

pi = 3.14
dia = radius * 2
cir = 2 * pi * radius
area = radius**2 * pi

print(f"반지름이 {radius}인 원의 면적은 {area}입니다.")
print(f"이 원의 둘레는 {cir}입니다.")
print(f"이 원의 지름은 {dia}입니다.")