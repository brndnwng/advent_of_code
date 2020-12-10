inputs = []
with open("./input.txt") as f:
    for line in f:
        inputs.append(int(line.strip()))

visited = set()

for i in inputs:
    if 2020 - i in visited:
        print(i * (2020 - i))
    else:
        visited.add(i)
