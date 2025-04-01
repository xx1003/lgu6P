data=[
    {'name':'철수', 'math':85, 'eng':90, 'sci':75},
    {'name':'준호', 'math':73, 'eng':85, 'sci':93},
    {'name':'영희', 'math':92, 'eng':88, 'sci':90}
]

student_dict = {}

# key값으로 그냥 접근하기
# for d in data:
#     total = d['math'] + d['eng'] + d['sci']
#     avg = round(total/3, 3)

#     student_dict[d['name']] = [total, avg]

# print(student_dict)


###############################################
# 사전도 for문 돌리기
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


###############################################
# 사전 for문 돌릴 때 type 함수로 걸러내기
for d in data:
    total = 0
    count = 0
    name = ''
    for k,v in d.items():
        if type(v) == type('aaa'):
            name = v
        else:
            total += v
            count += 1
    avg = round(total/count, 3)
    student_dict[name] = [total, avg]

print(student_dict)    