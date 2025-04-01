import random

class Linear:
    def __init__(self, in_feature, out_feature):
        self.weight = [] # in_feature 행 out_feature 열이 되도록
        for i in range(in_feature):
            row = []
            for j in range(out_feature):
                row.append(random.random())
            self.weight.append(row)

        self.bias = [] # out_feature개
        for i in range(out_feature):
            self.bias.append(random.random())

        # print(self.weight, self.bias)
    

    def matmul(self, A, B):
        # 행렬곱 A * B  return 결과 행렬
        C = []

        for i in range(len(A)):
            row = []
            for j in range(len(B[0])):
                temp_total = 0
                for k in range(len(B)):
                    temp_total += (A[i][k] * B[k][j])
                row.append(temp_total)
            C.append(row)
            
        # print(C)
        return C       
        


    def forward(self, x):
        # x * self.weight + self.bias
        temp = self.matmul(x, self.weight)
        
        # print(temp)

        for i in range(len(temp)):
            for j in range(len(self.bias)):
                temp[i][j] += self.bias[j]

        return temp



linear = Linear(3, 2)
x = [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]]

print(linear.forward(x))    # 결과는 2행 2열

import numpy as np

x_np = np.array(x)
w_np = np.array(linear.weight)
b_np = np.array(linear.bias)

y_np = np.dot(x_np, w_np) + b_np
print(y_np)
