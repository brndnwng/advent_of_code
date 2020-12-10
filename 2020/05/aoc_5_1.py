inputs = []
with open("./input.txt") as f:
    for line in f:
        inputs.append(line.strip())
max_val = 0

seat_ids = []
for i in inputs:
    min_row = 0
    max_row = 127
    min_col = 0
    max_col = 8
    halves = list(i)
    for d in halves:
        if d == 'F':
            max_row = (max_row + min_row) // 2
        if d == 'B':
            min_row = (max_row + min_row) // 2 + 1
        if d == 'L':
            max_col = (max_col + min_col) // 2
        if d == 'R':
            min_col = (max_col + min_col) // 2
    seat_ids.append(min_row * 8 + min_col)

seated = sorted(seat_ids)

i = seated[0]
for j in seated[1:]:
    i += 1
    if i != j:
        print(i)
        break
