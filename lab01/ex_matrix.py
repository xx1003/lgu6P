A = [[1,2,3],
     [4,5,6],
     [7,8,9]]

B = []

# for i in range(len(A)):
#     row = []
#     for j in range(len(A[i])):
#         row.append(A[i][j] * 2)
#     B.append(row)

# print(B)

for a in A:
    row = []
    for i in a:
        row.append(i * 2)
    B.append(row)

print(B)