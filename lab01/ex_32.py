teams = ['타이거즈', '라이온즈', '트윈스', '베어스', '위즈',
         '랜더스', '자이언츠', '이글스', '다이노스즈', '히어로즈']

rank = 1
for team in teams:
    print(f"{rank:>2}위  : {team}")
    rank += 1

print()

# 리스트의 인덱스와 값을 모두 불러오는 enumerate
for i, team in enumerate(teams):
    print(f"{i+1:>2}위 : {team}")