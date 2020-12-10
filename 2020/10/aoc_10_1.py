inputs = []
with open("./input.txt") as f:
    for line in f:
        inputs.append(int(line.strip()))

sorted_input = sorted(inputs)

sorted_input.insert(0, 0)
sorted_input.append(sorted_input[len(sorted_input) - 1] + 3)
print(sorted_input)

dp = [1] * (sorted_input[-1] + 1)

if 1 in sorted_input:
    dp[1] = 1
else:
    dp[1] = 0

if 2 in sorted_input:
    dp[2] = dp[1] + dp[0]
else:
    dp[2] = 0

for i in range(3, len(dp)):
    if i in sorted_input:
        dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
    else:
        dp[i] = 0
print(dp)
print(dp[-1])
