class BankAccount:
    def __init__(self, owner, balance, pwd):
        self.owner = owner
        self.balance = balance
        # self.access = False
        self.pwd = pwd

        print(f"{owner}님의 계좌가 잔액 {balance}원으로 개설되었습니다.")
    
    # def login(self):
    #     pwd = input("비밀번호를 입력하세요: ")
    #     if pwd != self.pwd:
    #         print("비밀번호가 틀렸습니다.")
    #     else:
    #         print("")
    #         self.access = True

    def deposit(self, amount):
        # self.login()
        # if self.access:
            if amount > 0:
                self.balance += amount
                print(f"{amount}원이 입금되었습니다.")
                # print(f"총 잔액: {self.balance}원")
            else:
                print("0보다 큰 금액을 입력해주세요.")

    def withdraw(self, amount):
        # self.login()
        # if self.access:
            if amount <= self.balance:
                self.balance -= amount
                print(f"{amount}원이 출금되었습니다.")
                # print(f"총 잔액: {self.balance}원")
            elif amount < 0 :
                print("0보다 큰 금액을 입력해주세요.")
            else:
                print("잔액이 부족합니다.")

    def wire(self, amount, account):
        self.withdraw(amount)
        account.deposit(amount)
    
    def get_balance(self):
        # self.login()
        # if self.access:
            pwd = input("비밀번호를 입력하세요: ")
            if pwd == self.pwd:
                print(f"계좌의 현재 잔액은 {self.balance}원입니다.")
       

    
    
account1 = BankAccount('홍길동', 10000, '1234')
# account1.deposit(5000)
# account1.get_balance()
# account1.withdraw(30000)
# account1.get_balance()

account2 = BankAccount('김길동', 1000000, '1234')

account2.get_balance()
account1.wire(1000, account2)
account2.get_balance()