import random
import pprint

N = int(input("몇 게임?: "))

def lottery_game():
    lottery = []
    while len(lottery) < 6:
        n = random.randrange(1, 46)
        if n not in lottery:
            lottery.append(n)
    
    return lottery

total_lottery = [lottery_game() for i in range(N)]
pprint.pprint(total_lottery, width=50)