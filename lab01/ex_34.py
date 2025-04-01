nums = [10, 4, 5, -1, 6, 12, 40]

total = 0
for num in nums[1::2]:
    total += num

# print(total)


# 리스트에서 최대 최소값 구하기
mini = nums[0]
for num in nums:
    if mini > num:
        mini = num

print(f"min : {mini}")

maxi = nums[0]
for num in nums:
    if maxi < num:
        maxi = num

print(f"max : {maxi}")

# print(max(nums))
# print(min(nums))
# print()

# print()
# print(sum(nums[1::2]))