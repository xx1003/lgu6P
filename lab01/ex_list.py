# shoplist = ['apple', 'mango', 'carrot', 'banana']
# print(shoplist)
# print(type(shoplist))

# for i in (list(range(5))):
#     print(i)


# #######################
# # 자주쓰는 기능
# #######################

# # 가변 자료형 
# shoplist[0] = 'melon'
# print(shoplist)

# # 마지막에 요소 추가
# shoplist.append('lego')
# print(shoplist)

# print(shoplist + ['chicken', 'beef'])

# shoplist.extend(['chicken', 'beef'])
# print(shoplist)

# shoplist.remove('beef')
# print(shoplist)

# del shoplist[1]
# print(shoplist)

# i = shoplist.index('banana')
# print(i)

# print(len(shoplist))

# L = []
# L = [3,5,2,1,0,4]
# L.sort(reverse=True)
# print(L)


# L = [3,5,2,1,0,4]
# L_sorted = sorted(L)
# print(L, L_sorted)



#######################################

# L = [1,2,3,4,5,6,7,8]
# print(L[3])

# # print(L[8])

# print(L[-1])
# print(L[::])
# print(L[::-1])
# print(L[::2])

# print(L[-3:])
# print(L[-7:-4:1])

# L = [1, 'foo', True, 3.14, (1,2)]
# print(L)
# print(L[4][1])

L = [[1,2,3],
     [4,5,6]]
print(L[0][2])