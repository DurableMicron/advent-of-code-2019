# mass, divide by 3, floor and subtract 2
def calculate_fuel(mass):
    fuel = (mass // 3) - 2
    return fuel

f = open("./day1/input.txt","r")
contents = f.readlines()
f.close()

sum = 0
for i in contents:
    sum+=calculate_fuel(int(i))

print(sum)
