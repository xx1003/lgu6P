def get_number_generator(n):
    for i in range(n):
        print("before yield")
        yield i
        print("after yield")

number = get_number_generator(3)
# print(next(number, 'end'))
# print()

# print(next(number, 'end'))
# print()

# print(next(number, 'end'))
# print()


def generator_infinite():
    i = 1
    while True:
        yield i
        i += 1

g = generator_infinite()

print(type(g))
print(next(g))
print(next(g))
print(next(g))
print(next(g))
print(next(g))