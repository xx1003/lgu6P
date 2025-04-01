import pandas as pd

df = pd.read_excel("./data/scores.xlsx")
print(df, type(df))

print(df.to_dict())

df = df.T.to_dict()

data = [v for k, v in df.items()]
print(data)

student_dict = {}

for d in data:
    total = 0
    count = 0
    for k, v in d.items():
        if k != 'name':
            total += v
            count += 1
    avg = round(total/count, 3)

    student_dict[d['name']] = [total, avg]

print(student_dict)