teams = ['타이거즈', '라이온즈', '트윈스', '베어스', '위즈',
         '랜더스', '자이언츠', '이글스', '다이노스즈', '히어로즈']


for team in teams:
    print(f"{teams.index(team) + 1}위 : {team}")

print()

for i in range(len(teams)):
    print(f"{i+1}위 : {teams[i]}")

