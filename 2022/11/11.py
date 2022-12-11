from itertools import islice

prime_num_sum = 9699690


class Monkey:
    def __init__(self):
        self.items = []
        self.inspected = 0

    def process_and_select_new_monkey(self):
        result = []
        for item in sorted(self.items):
            new_worry = self.calc_new_worry(item) % prime_num_sum
            if new_worry % self.test == 0:
                new_monkey = self.true_result
            else:
                new_monkey = self.false_result
            result.append((new_worry, new_monkey))
            monkeys[new_monkey].items.append(new_worry)
            self.inspected += 1
        self.items = []
        return result

    def calc_new_worry(self, item):
        # print(self.operations)
        if self.operations[2] == "old":
            operand = item
        else:
            operand = int(self.operations[2])
        if self.operations[1] == "+":
            return item + operand
        else:
            return item * operand


monkeys = []
with open("./input.txt") as f:
    while True:
        lines = list(islice(f, 7))
        if not lines:
            break
        # line 0
        monkey = Monkey()
        # line 1
        items = map(int, lines[1].strip().split(": ")[1].split(", "))
        monkey.items = sorted(items)
        # line 2
        operations = lines[2].strip().split("= ")[1].split(" ")
        monkey.operations = operations
        # lines 3
        test = lines[3].strip().split("by ")[1]
        monkey.test = int(test)
        # lines 4
        true_result = lines[4].strip().split("monkey ")[1]
        monkey.true_result = int(true_result)
        # lines 5
        false_result = lines[5].strip().split("monkey ")[1]
        monkey.false_result = int(false_result)
        print(
            f"Monkey with {monkey.items} operations {operations[1]} {operations[2]} test {test} True {true_result} False {false_result}"
        )
        monkeys.append(monkey)

round = 1
while round <= 10000:
    for monkey in monkeys:
        result = monkey.process_and_select_new_monkey()
    round += 1

for i in monkeys:
    print(f"monkey {i} inspected {i.inspected}")
