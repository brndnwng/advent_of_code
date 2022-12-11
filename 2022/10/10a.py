x = 1

# thresholds = [20, 60, 100, 140, 180, 220]
curr_threshold = 0
lit_pixels = []
screen = [[0 for _ in range(0, 40)] for _ in range(0, 6)]
row = 0

with open("./input.txt") as f:
    cycle = 1
    x = 1
    draw_pos = 0
    signal_strength = 0
    for line in f:
        curr = line.strip()
        instructions = curr.split(" ")
        if instructions[0] == "noop":
            if draw_pos >= x - 1 and draw_pos <= x + 1:
                lit_pixels.append(draw_pos)
                screen[row][draw_pos] = 1

            cycle += 1
            draw_pos += 1
            if cycle == 41:
                cycle = 1
                draw_pos = 0
                row += 1
        if instructions[0] == "addx":
            if draw_pos >= x - 1 and draw_pos <= x + 1:
                lit_pixels.append(draw_pos)
                screen[row][draw_pos] = 1

            draw_pos += 1
            cycle += 1
            if cycle == 41:
                cycle = 1
                draw_pos = 0
                row += 1
            if draw_pos >= x - 1 and draw_pos <= x + 1:
                lit_pixels.append(draw_pos)
                screen[row][draw_pos] = 1

            cycle += 1
            draw_pos += 1
            if cycle == 41:
                cycle = 1
                draw_pos = 0
                row += 1
            x += int(instructions[1])
        print(x)
        print(lit_pixels)

print(screen)

for i in range(0, len(screen)):
    for j in range(0, len(screen[i])):
        sym = "░░"
        # sym = "."
        if screen[i][j] == 1:
            sym = "██"
            # sym = "#"
        print(sym, end="")
    print("\n")
