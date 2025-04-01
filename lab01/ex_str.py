# ex_str.py

# s = "Hello Python"
# print(s)

# s = 'Hello Python'
# print(s)

# s = "Hello \"Easy\" Python"
# print(s)

# s = 'Hello "Easy" Python'
# print(s)

# s = "Hello 'Easy' Python"
# print(s)

# s = 'Hello,\n "Easy" Python'
# print(s)

# print(type(s))

# s = """Hello,
# "EASY" Python
# """
# print(s)

# a = 10
# b = 20
# c = a * b
# # print('c: ', c, 'SUCCESS')
# print(f"c: {c} SUCCESS")

# print(f"{a:5.2f} x {b:5.2f} = {c:.3f}")

# d = 5.2
# e = 21.234
# f = d * e
# print(f"{d:5.2f} x {e:5.2f} = {f:.3f}")

# a = "Hello"
# print(f"{a:_^11}")

s = "python, python"
print(s.split(',')) # 기본값은 ' '
print(s.split())

L = ['python', 'java', 'c++']

print(','.join(L))

s = "@<python>!"
print(f"|{s.strip('<>@!')}|")


s = "123a"
print(s.isdigit())

print(s.isalpha())

print(s.isalnum())