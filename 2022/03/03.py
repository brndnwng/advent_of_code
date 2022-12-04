import difflib
import string

priority = 0
with open("./input.txt") as f:
    for line in f:
        curr = line.strip()
        left = curr[0 : int(len(curr) / 2)]
        right = curr[int(len(curr) / 2) :]
        print(f"l {left} r {right}")
        diff = "".join(set(left).intersection(right))

        if diff.isupper():
            priority += ord(diff) - ord("A") + 27
        if diff.islower():
            priority += ord(diff) - ord("a") + 1
        print(priority)


print(priority)
