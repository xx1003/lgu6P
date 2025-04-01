# def dummy():
#     print("I am dummy function.")

# print(dummy())


# def dummy2():
#     print("I am dummy function2")
#     return 10

# # dummy2()
# r = dummy2()

# print(r)

def add(a, b):
    c = a + b
    print(c)

c = add(1, 2)

print(c)



# x = 'global variable'

# def print_x():
#     print(x)    # global
#     x = 'local variable'    # local 위의 전역변수와 충돌해서 error
#     print(x)

# print_x()
# print(x)


##########################
# 기본 인자
def greet(name, greeting = "Hello"):
    print(f"{greeting}, {name}")

greet('홍길동', '안녕')
greet('홍길동')
