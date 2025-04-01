A = [[1,0,1], [0,2,0], [1,2,1]]
B = [[2,3,1], [0,1,1], [1,1,1]]
C = [[0,0,0], [0,0,0], [0,0,0]]

for i in range(len(C)):
    for j in range(len(C[i])):
        C[i][j] = A[i][j] + B[i][j]

print(C)