def outer_func(msg):
    def inner_func():
        # print(f"메세지: {msg}")
        print("메세지")
    return inner_func

closure = outer_func("안녕하세요!")
# closure 안에는 inner func이 있다

# 내부함수가 외부함수의 지역변수를 캡쳐한다??
closure()
