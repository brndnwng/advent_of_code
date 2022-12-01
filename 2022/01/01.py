elves = []
max_so_far = 0

with open("./input.txt") as f:
    curr = 0
    for line in f:
        if line.strip() == "":
            elves.append(curr)
            curr = 0
        else:
            curr += int(line.strip())

print(sum(sorted(elves, reverse=True)[:3]))
