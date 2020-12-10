input = []
with open("./input.txt") as f:
    for line in f:
        input.append(list(line.rstrip()))

height = len(input)
width = len(input[0])

def calc_tree(input, height, width, right_inc, down_inc):
    curr_width =0
    tree = 0
    for i in range(0,height, down_inc):
        if input[i][curr_width] == '#':
            tree += 1
        curr_width += right_inc
        curr_width %= width
    return tree

print(calc_tree(input, height, width, 1, 1) *calc_tree(input, height, width, 3, 1) *calc_tree(input, height, width, 5, 1) * calc_tree(input, height, width, 7, 1) * calc_tree(input, height, width, 1, 2))
