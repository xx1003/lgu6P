# with open("file_w.txt", "a", encoding="utf-8") as f:
#     f.write("Hello Python!\n")
#     f.write("안녕 파이썬!\n")
#     # f.close   필요없음 with 쓰면 됨

# with open("file_w.txt", "r", encoding="utf-8") as f:
#     lines = f.readlines()
#     for line in lines:
#         print(line, end='')

import ex_45
import os

students = os.listdir('./data')

# student_scores = []
# names = []
with open("ex_48.txt", "w", encoding="utf-8") as fw:
    for student in students:
        if student[-3:] == "txt":
            name = student[0:-4]
            student_score = []
            with open('./data/'+student, "r", encoding="utf-8") as f:
                lines = f.readlines()
                for line in lines:
                    student_score.append(float(line))
                print(student_score)
                # student_scores.append(student_score)
            fw.write(f"{name:>6}: {ex_45.mean(student_score):.2f}, {ex_45.std(student_score):.2f}\n")


# cnt = 0
# with open("ex_48.txt", "w", encoding="utf-8") as f:
#     for student_score in student_scores:
#         f.write(f"{names[cnt]}: {ex_45.mean(student_score):.2f}, {ex_45.std(student_score):.2f}\n")
#         cnt += 1