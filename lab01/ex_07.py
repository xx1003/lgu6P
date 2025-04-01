line = "#"*25

python = "Python"
pythonAuthor = "Guido van Rossum"

cpp = "C++"
cppAuthor = "Bjarne Stroustrup"

java = "Java"
javaAuthor = "Jame Gosling"

pascal = "Pascal"
pascalAuthor = "Niklaus Wirth"

langs = ['Python', 'C++', 'Java', 'Pascal']
authors = ['Guido van Rossum', "Bjarne Stroustrup", "Jame Gosling", "Niklaus Wirth"]

# 수정이 편하도록
sep = " : "

idx = 0
while idx < len(langs):
    print(f"{langs[idx]:>6}{sep}{authors[idx]}")
    idx = idx + 1

# print(line)
# print(python, pythonAuthor, sep=sep)
# print(f"{cpp} : {cppAuthor}")
# print(f"{java} : {javaAuthor}")
# print(f"{pascal} : {pascalAuthor}")
# print(line)

# print()

# print(line)
# print(f"{python:>6}{sep}{pythonAuthor}")
# print(f"{cpp:>6}{sep}{cppAuthor}")
# print(f"{java:>6}{sep}{javaAuthor}")
# print(f"{pascal:>6}{sep}{pascalAuthor}")
# print(line)