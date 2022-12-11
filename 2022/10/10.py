x = 1

thresholds = [20, 60, 100, 140, 180, 220]
curr_threshold = 0
with open("./input.txt") as f:
    cycle = 1
    x = 1
    signal_strength = 0
    for line in f:
        curr = line.strip()
        instructions = curr.split(" ")
        if instructions[0] == "noop":
            if cycle == thresholds[curr_threshold]:
                print(
                    f"crossed threshold {thresholds[curr_threshold]} with ss {thresholds[curr_threshold] * x}"
                )
                signal_strength += thresholds[curr_threshold] * x
                curr_threshold += 1
            cycle += 1
        if instructions[0] == "addx":
            if (
                cycle <= thresholds[curr_threshold]
                and cycle + 2 > thresholds[curr_threshold]
            ):
                print(
                    f"crossed threshold {thresholds[curr_threshold]} with ss {thresholds[curr_threshold] * x}"
                )

                signal_strength += thresholds[curr_threshold] * x
                curr_threshold += 1
            cycle += 2
            x += int(instructions[1])
        if curr_threshold == len(thresholds):
            break
    print(signal_strength)
