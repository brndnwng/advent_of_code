inputs = []
with open("./input.txt") as f:
    for line in f:
        inputs.append(int(line.strip()))

sorted_input = sorted(inputs)

sorted_input.insert(0, 0)
sorted_input.append(sorted_input[len(sorted_input) - 1] + 3)
print(sorted_input)
count_1 = 0
count_3 = 0

for i in range(1, len(sorted_input)):
    if sorted_input[i] - sorted_input[i - 1] == 1:
        count_1 += 1

for i in range(1, len(sorted_input)):
    if sorted_input[i] - sorted_input[i - 1] == 3:
        print(f"i {i} sorte_input {sorted_input[i]}")
        count_3 += 1
    else:
        j = i - 1
        # while j >= 0 and sorted_input[i] - sorted_input[j] <= 3:
        #     if sorted_input[i] - sorted_input[j] == 3:
        #         print(i)
        #         count_3 += 1
        #         break;
        #     else:
        #         j -= 1
print(count_1)
print(count_3)
print(count_1 * count_3)
