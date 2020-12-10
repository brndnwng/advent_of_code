valid = 0
with open("./input.txt") as f:
    curr_input = []
    curr_set = set()
    for line in f:
        if line != "\n":
            split_line = line.rstrip().split(" ")
            for i in split_line:
                split_field = i.split(":")
                curr_set.add(split_field[0])
        else:
            print(curr_set)
            if len(curr_set) == 8 or (len(curr_set) == 7 and 'cid' not in curr_set):
                valid += 1
            curr_set = set()
    print(curr_set)
    if len(curr_set) == 8 or (len(curr_set) == 7 and 'cid' not in curr_set):
        valid += 1

print(valid)
