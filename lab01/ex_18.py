num = int(input("insert number : "))

if num < 0 :
    print("wrong insert")
else :
    count = 0
    # print(f"while 이전 : {num}, count : {count}")
    while num > 0 :
        print("현재 숫자 :", num)
        num -= 1
        count += 1
        # print(f"while 안 : {num}, count : {count}")

    print(f"\n반복 번수 : {count}")