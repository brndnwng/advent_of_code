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
    curr = set()
    for answers in i:
        for q in list(answers):
            curr.add(q)
    print(len(curr))
    sum += len(curr)

print(sum)
