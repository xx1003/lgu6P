height = float(input("키(m) : "))
weight = float(input("몸무게(kg) : "))

bmi = weight / height**2
print(f"BMI : {round(bmi, 3)}")

if bmi >= 25 :
    print("비만")
elif bmi >= 23 :
    print("과체중")
elif bmi >= 18.5 :
    print("정상")
else :
    print("저체중")

# 18.5 <= bmi < 23 : 이것도 가능


#  a = 0

# if a > 0 :
#     print("positive")
# elif a < 0 :
#     print("negative")
# else :
#     print("zero")