import re

input = []
with open("./input.txt") as f:
    curr_input = []
    for line in f:
        if line != "\n":
            curr_input.append(line.rstrip())
        else:
            input.append(curr_input)
            curr_input = []
    input.append(curr_input)


def validate_byr(x):
    int_x = int(x)
    if 1920 <= int_x <= 2002:
        return True
    return False


def validate_eyr(x):
    int_x = int(x)
    if 2020 <= int_x <= 2030:
        return True
    return False


def validate_iyr(x):
    int_x = int(x)
    if 2010 <= int_x <= 2020:
        return True
    return False


def validate_hcl(x):
    return re.search("#[a-f0-9]{6}$", x)


def validate_ecl(x):
    eye_color = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']
    return x in eye_color


def validate_pid(x):
    return re.search("^\d{9}$", x)


def validate_hgt(x):
    if "cm" in x and len(x) == 5:
        ht = int(x[0:3])
        return 150 <= ht <= 193
    if "in" in x and len(x) == 4:
        ht = int(x[0:2])
        return 59 <= ht <= 76
    return False


def validate_cid(x):
    return True


validation_rules = {
    'byr': validate_byr,
    'iyr': validate_iyr,
    'eyr': validate_eyr,
    'hgt': validate_hgt,
    'hcl': validate_hcl,
    'ecl': validate_ecl,
    'pid': validate_pid,
    'cid': validate_cid

}


def valid(passport):
    values = {}
    for line in passport:
        split_line = line.split(" ")
        for entry in split_line:
            split_entry = entry.split(":")
            values[split_entry[0]] = split_entry[1]
    # print(values)
    # print(len(values))
    # print("cid" not in values)
    if len(values) == 8 or (len(values) == 7 and "cid" not in values):

        for key, value in values.items():
            if not validation_rules[key](value):
                # print(f"key: {key} value: {value}")
                return False

        return True

    return False


valid_count = 0
for i in input:
    if valid(i):
        valid_count += 1

print(valid_count)
