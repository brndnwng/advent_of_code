with open("./input.txt") as f:
    score = 0

    for line in f:
        left, right = line.strip().split(" ")
        if left == "A":
            if right == "X":
                score += 3
            elif right == "Y":
                score += 4
            elif right == "Z":
                score += 8
        elif left == "B":
            if right == "X":
                score += 1
            elif right == "Y":
                score += 5
            elif right == "Z":
                score += 9
        elif left == "C":
            if right == "X":
                score += 2
            elif right == "Y":
                score += 6
            elif right == "Z":
                score += 7
    print(score)


# A Rock
# B Paper
# C Scissor
# X ROCK
# y PAPER
# Z SCISSOR
