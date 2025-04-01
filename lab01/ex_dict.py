# 가변 자료형
d = {}

d = {
    'foo' : 'foo@naver.com',
    'bar' : 'bar@gmail.com',
    'egg' : 'egg@kakao.com'
}

print(d)

# 인덱스로 접근 불가능, key로 접근!
# d[0]

print(d['foo'])

del(d['foo'])
d.pop('bar')
print(d)

# 키 없음을 방지하는 방법
# 'bar' in d.keys()
print(d.get('bar', None))

# d['foo'] = 'foo@naver.com'
# print(d)

# d['foo'] = 'foo@inha.edu'
# print(d)

# d['list'] = [1,2,3,4,5]
# print(d)

# print(d.keys())

# #keys()는 생략가능
# for key in d.keys():
#     print(d[key])

# # 사전은 기본적으로 키를 순환???
# for key in d:
#     print(d[key])

# for value in d.values():
#     print(value)

# for key, value in d.items():
#     print(key, value)

from collections import defaultdict
dd = defaultdict(list)  # 없는 키를 조회하면 자료형 반환???
print(dd)
print(dd['a'])  # []

dd['a'].append('a')
print(dd)

