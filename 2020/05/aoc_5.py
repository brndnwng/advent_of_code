inputs = []
with open("./input.txt") as f:
    for line in f:
        inputs.append(line.strip())

print(inputs)

max_val = 0

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
        print(f"min_row: {min_row} max_row: {max_row} min_col: {min_col} max_col:{max_col}")
    print(min_row * 8 + min_col)
    max_val = max(max_val, min_row * 8 + min_col)

print(max_val)
