class Person:
    def __init__(self, name, height, weight):
        self.name = name
        self.height = height
        self.weight = weight

    def speed(self):
        return (self.height / self.weight) * 5

    def print(self):
        print(f"나는 {self.name}이고, 키는 {self.height}cm, 몸무게는 {self.weight}kg 이다.")
p1 = Person("Tom", 170, 100)
p2 = Person("Kim", 180, 85)

print(type(p1))

print(p1.name)

print(p1.speed())
print(p2.speed())

p1.print()