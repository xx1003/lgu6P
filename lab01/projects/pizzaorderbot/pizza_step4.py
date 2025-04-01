def main():
    print("빅데이터 피자 가게에 오신 것을 환영합니다.")
    
    menus = {
        '피자': ['페퍼로니 피자', '스테이크 피자', '시푸드 피자'],
        '토핑': ['햄', '페퍼로니', '트러플', '올리브', '새우'],
        '사이드': ['치즈오븐스파게티', '리조또', '치킨윙'],
        '음료': ['콜라', '스프라이트', '오렌지쥬스']
    }
    prices = {
        '피자': [29000, 32000, 32000],
        '토핑': [500, 500, 800, 300, 800],
        '사이드': [9900, 8900, 8900],
        '음료': [1000, 1000, 1000]
    }
    order = {'피자': [], '토핑': [], '사이드': [], '음료': []}
    categories = ['피자', '토핑', '사이드', '음료']
    i = 0
    current_category = categories[i]

    while True:
        current_category = categories[i]
        print(f"\n{current_category}를 선택하세요. 수량 추가를 위해 여러번 선택 가능합니다.\n")

        for idx, item in enumerate(menus[current_category]):
            print(f"{idx+1}. {item} ({prices[current_category][idx]}원)")
        choice = input("번호를 입력하고 Enter를 누르세요. (다음단계: n, 이전단계: p, 주문완료: f): ")

        if choice.isdigit():
            menu_num = int(choice) - 1
            
            if 0 <= menu_num < len(menus[current_category]):
                order[current_category].append(menus[current_category][menu_num])
                print(f"선택된 메뉴: {menus[current_category][menu_num]}") 
            else:
                print("잘못된 입력입니다. 다시 입력하세요.")
                continue  
        elif choice == 'f':
            print(f"\n주문 내역: {order}")
            break
        elif choice == 'n':
            if i < len(categories) - 1:
                i += 1
        elif choice == 'p':
            if i >= 1:
                i -= 1
        else:
            print("잘못된 입력입니다. 다시 입력하세요.")
        
            
main()