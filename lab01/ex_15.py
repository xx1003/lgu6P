x = float(input("x: "))
mu = float(input("μ: "))
sigma = float(input("𝜎: "))

e = 2.718
sqrt_2pi = 2.506

y = (1 / (sigma * sqrt_2pi)) * e**(-(((x - mu)**2) / (2 * sigma**2)))
print(f"f(x) = {round(y, 3)}")