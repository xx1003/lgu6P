a = [1,2,3,4]
b = [4,5,6,7]

result = 0
for i in range(len(a)):
    result += a[i] * b[i]

# print(result)

A = [[1,0,1], [0,2,0], [1,2,1]]
B = [[2,3,1], [0,1,1], [1,1,1]]
C = [[0,0,0], [0,0,0], [0,0,0]]

for i in range(3):
    for j in range(3):
        for k in range(len(B)):
            C[i][j] += A[i][k] * B[k][j]

print(C)

# # len(A[i]) == len(B)

# A = [[1,0,1], [0,2,0], [1,2,1]]
# B = [[2,3,1], [0,1,1], [1,1,1]]
# C = [[0,0,0], [0,0,0], [0,0,0]]

# for i in range(len(A)):
#     for j in range(len(A[i])):
#         for k in range(len(B)):
#             C[i][j] += A[i][k] * B[k][j]

# print(C)

####################################
# 0으로 된 행렬 만들어놓고 내적 추가
####################################
A = [[1,0,1], 
     [0,2,0], 
     [1,2,1]]
B = [[2,3], 
     [0,1], 
     [1,1]]
C = []

for i in range(len(A)):
    row = []
    for j in range(len(B[i])):
        row.append(0)
    C.append(row)
print(C)

for i in range(len(A)):
    for j in range(len(B[i])):
        for k in range(len(B)):
            C[i][j] += A[i][k] * B[k][j]
print(C)


####################################
# 빈 리스트에 바로 내적 추가
####################################
A = [[1,0,1,2], 
     [0,2,0,3], 
     [1,2,1,7]]
B = [[2,3,1], 
     [0,1,1], 
     [1,1,1], 
     [3,2,6]]
C = []

for i in range(len(A)):
    row = []
    for j in range(len(B[i])):
        total = 0
        for k in range(len(B)):
            total += A[i][k] * B[k][j]
        row.append(total)
    C.append(row)
print(C)