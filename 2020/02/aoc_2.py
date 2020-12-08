inputs = []

class Rule:
    def __init__(self, min, max, letter, password):
        self.min = min
        self.max = max
        self.letter = letter
        self.password = password

    def validate(self):
        count = 0
        for i in list(self.password):
            if i == self.letter:
                count += 1

        if self.min <= count <= self.max:
            return True
        return False

    def validate_2(self):
        count = 0
        list_password = list(self.password)
        for i in [self.min,self.max]:
            if i - 1 < 0:
                return False
            if list_password[i-1] == self.letter:
                count += 1
        return count == 1


count = 0
count_2 = 0
with open("./input.txt") as f:
    for line in f:
        line_split = line.rstrip().split(" ")
        (min, max)  = line_split[0].split("-")
        curr_rule = Rule(int(min),int(max),line_split[1][0], line_split[2])
        if curr_rule.validate():
            count += 1
        if curr_rule.validate_2():
            count_2 += 1

print(count)
print(count_2)