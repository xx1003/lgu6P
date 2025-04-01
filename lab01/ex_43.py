# def op(x, z, y):
#     return (x+y) * z
# x = 2
# y = 3
# z = 4

# # 위치 인자
# print(op(x, z, y))
# print(op(x, y, z))

# # 키워드 인자 (변수 이름을 알고 있어야 함)
# print(op(x=x, y=y, z=z))

# # 위치 키워드 혼합 방식
# print(op(x, y=y, z=z))

# # 혼합할 때 순서 잘못 (위치가 앞에 있어야 함)
# print(op(x, y=y, z=z))

# def my_print(*args, **kwargs):
#     print(args, kwargs)

# # *args : tuple, **kwargs : dict
# my_print('a', 'b', 'c', d='d', e='e')


def print_all(*args, **kwargs):
    print(args)
    print(kwargs)

print_all(1,2,3,4,5,6, x=100, y=300, z=400)

# error 위치인자가 앞!!
# print_all(x=100, y=300, z=400, 1,2,3,4,5,6)