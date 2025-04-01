ID = "python"
PWD = "1234"

if input("id : ") == ID:
    if input("password : ") == PWD:
        print("로그인 성공")
    else:
        print("잘못된 비밀번호\n로그인 실패")
else:
    print("그런 아이디는 존재하지 않습니다.\n로그인 실패")