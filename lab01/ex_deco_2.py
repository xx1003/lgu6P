AUTH = False
user_id = "python-master"
user_pwd = "p1234"

def login():
    global AUTH

    if AUTH:
        print("로그아웃 되었습니다.")
        AUTH = False
        return
    
    while True:
        Id = input("ID: ")
        pwd = input("PW: ")
        
        if Id == user_id and pwd == user_pwd:
            print("로그인 성공")
            AUTH = True
            break
        else:
            print("로그인 실패. 재시도")
            

# 사용 승인 체크 데코레이터
def auth_required(func):
    def wrapper(*args, **kwargs):
        if AUTH:
            print("접근 승인")
            # check = func(*args, **kwargs)
            func(*args, **kwargs)
        else:
            print("접근 권한이 없습니다.")
        # return check <- 이건 굳이 필요없대
    return wrapper

# def login( ):
#     Id = input("ID: ")
#     pwd = input("PW: ")
    
#     if Id == user_id and pwd == user_pwd:
#         AUTH = True
#         print("로그인 성공")
#     else:
#         AUTH = False
#         print("로그인 실패")

@auth_required
def order_list():
    print("*********************")
    print("구매 리스트 출력")
    print("만두, 아이스크림, 콜라")
    print("*********************")

@auth_required
def return_list():
    print("*********************")
    print("반품 리스트 출력")
    print("커피, 책")
    print("*********************")

# 이 함수에는 데코레이터를 적용하지 마세요.
def recommend_list():
    print("*********************")
    print("추천 목록 출력")
    print("참치, 라면, 피자")
    print("*********************")

while True:
    print("============================")
    if AUTH:
        print("[0] : 로그아웃")
    else:
        print("[0] : 로그인")
    
    print("[1] : 구매 리스트")
    print("[2] : 교환 반품 리스트")
    print("[3] : 오늘의 추천 상품")
    c = input("메뉴 선택: ")
    
    if c == "0":
        login()
    elif c == "1":
        order_list()
    elif c == "2":
        return_list()
    elif c == "3":
        recommend_list()
    else:
        break


