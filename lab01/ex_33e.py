scores = [[90, 85, 93],
          [78, 92, 89]]


# 과목별 총점
total = []
for sb in range(len(scores[0])):
    total_score = 0
    for st in range(len(scores)):
        total_score += scores[st][sb]
    total.append(total_score)
    
for i in range(len(total)):
    print(f"{i+1}번 과목 총점 : {total[i]}")

print()


# 학생별 총점
student_total = []
for st in range(len(scores)):
    total_score = 0
    for sb in range(len(scores[st])):
        total_score += scores[st][sb]
    student_total.append(total_score)

# print(student_total)

for i in range(len(student_total)):
    print(f"{i+1}번 학생 총점 : {student_total[i]}")



###########################################

total_by_students = [0, 0]
total_by_subjects = [0, 0, 0]

for st in range(len(scores)):
    for sb in range(len(scores[st])):
        total_by_students[st] += scores[st][sb]
        total_by_subjects[sb] += scores[st][sb]

print(total_by_students)
print(total_by_subjects)