inputs = []
with open("./input.txt") as f:
    for line in f:
        inputs.append(int(line.strip()))


def twoSum(nums, target):
    visited = set()
    for i in inputs:
        if target - i in visited:
            return (i * (target - i))
        else:
            visited.add(i)
    return None


for index, i in enumerate(inputs):
    result = twoSum(inputs[index:], 2020 - i)
    if result is not None:
        print(i * result)
