import ex_45

s = input("평균을 구할 숫자를 입력하세요(콤마 또는 공백): ")

# s = s.replace(',', ' ')
# temp = s.split()
print(
    ex_45.mean([int(i) for i in s.replace(',',' ').split()])
)
# for i in range(len(temp)):
#     temp[i] = int(temp[i])

# print(ex_45.mean(temp))