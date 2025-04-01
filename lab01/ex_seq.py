S = "python"
print(S[0])

# TypeError
# i = 123
# print(i[0])

for s in S:
    print(s, end=' ')

print()

# 불변 자료형이라 TypeError 발생
# S[0] = 'P'


################################
# tuple
################################
zoo = ('python', 'elephant', 'penguin')
print(zoo)
print(zoo[2])

# out of range index error
# print(zoo[3])

singleton = ('lion')
print(type(singleton))  # 이건 튜플이 아님 그냥 문자열

singleton = ('lion', )
print(type(singleton))

# 패킹, 언패킹
numbers = 1,2,3
print(numbers)

a, b, c = numbers
print(a, b, c)
