# Convert to ints next time...

fully_contained = 0
with open("./input.txt") as f:

    for line in f:
        curr = line.strip()

        #  = curr.split(",").split("-")
        # assignments = sorted(
        #     sorted(
        #         [x.split("-") for x in curr.split(",")],
        #         key=lambda x: x[1],
        #         reverse=True,
        #     ),
        #     key=lambda x: x[0],
        # )
        assignments = [x.split("-") for x in curr.split(",")]
        l1, l2 = assignments[0]
        r1, r2 = assignments[1]
        print(assignments)

        if int(l1) >= int(r1) and int(l1) <= int(r2):
            print("matched")
            fully_contained += 1
        elif int(r1) >= int(l1) and int(r1) <= int(l2):
            print("matched")
            fully_contained += 1

print(fully_contained)
