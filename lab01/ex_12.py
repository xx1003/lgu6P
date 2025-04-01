name = input("너의 이름: ")
kor = int(input("국어 점수: "))
eng = int(input("영어 점수: "))
math = int(input("수학 점수: "))
sci = int(input("과학 점수: "))

# sum이라는 기능이 이미 있어서 변수이름으로 쓰지 말아라.
total = kor + eng + math + sci
avg = total / 4
# print(type(avg))

print()
print(f"{name}의 총점은 {total}이고 평균은 {avg}입니다.")