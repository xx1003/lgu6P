pwd = "1234"
check = False

for i in range(5):
    if input("password : ") == pwd:
        print("로그인 성공!")
        check = True
        break
    print("다시 시도하세요!")

if not check:
    print("비밀번호 5번 오류. 로그인이 잠깁니다.")


# for i in range(5):
#     if input("password : ") == pwd:
#         print("login success!")
#         check = True
#         break
# else:
#     print("login lock!")