input = []
with open("./input.txt") as f:
    curr_input = []
    for line in f:
        if line != "\n":
            curr_input.append(line.rstrip())
        else:
            input.append(curr_input)
            curr_input = []
    input.append(curr_input)

print(input)

sum = 0

for i in input:
    people = len(i)
    counts = {}
    for answers in i:
        for q in list(answers):
            counts[q] = counts.get(q, 0) + 1

    for x, y in counts.items():
        if y == people:
            sum += 1

print(sum)
