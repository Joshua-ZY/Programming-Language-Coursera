lis = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
show = []
for key in range(1, len(lis) + 1):
    show += [key]*lis[key - 1]
print show