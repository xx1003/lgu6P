def main():
    print("빅데이터 피자 가게에 오신 것을 환영합니다.\n")
    
    menus=['페퍼로니 피자', '스테이크 피자', '시푸드 피자']
    price=[29000, 32000, 32000]
    order=[]
    
    while True:
        print("피자를 선택하세요. 수량 추가를 위해 여러번 선택 가능합니다.")
        for i in range(len(menus)):
            print(f"{i+1}. {menus[i]} ({price[i]}원)")
        choice = input("번호를 입력하고 Enter를 누르세요. (주문완료는 f를 누르세요.): ")

        if choice.isdigit():
            menu_num = int(choice) - 1
            order.append(menus[menu_num])
            print(f"선택된 메뉴: {menus[menu_num]}\n")
        elif choice == 'f':
            print("\n주문 내역: ")
            print(order)
            break
        else:
            print("잘못된 입력입니다. 다시 입력하세요.\n")
            
main()