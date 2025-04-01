pwd = "1234"

while input("password : ") != pwd:
    print("retry!")
else:
    print("login success")


# while True:
#     user_pwd = input("password : ")
#     if user_pwd == pwd:
#         print("login success!")
#         break
#     else:
#         print("wrong password!")    