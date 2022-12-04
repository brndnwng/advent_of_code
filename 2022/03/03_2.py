import difflib
import string
from itertools import islice


priority = 0


def grouped(iterator, size):
    yield tuple(next(iterator) for _ in range(size))


with open("./input.txt") as f:
    while True:
        lines = list(islice(f, 3))
        if not lines:
            break
        diff = "".join(
            set(lines[0].strip())
            .intersection(lines[1].strip())
            .intersection(lines[2].strip())
        )
        if diff.isupper():
            priority += ord(diff) - ord("A") + 27
        if diff.islower():
            priority += ord(diff) - ord("a") + 1
        print(priority)


print(priority)
