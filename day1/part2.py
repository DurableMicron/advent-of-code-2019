# mass, divide by 3, floor and subtract 2
def calculate_fuel_2(mass):
    fuel = (mass // 3) - 2
    if fuel > 0:
        return fuel + calculate_fuel_2(fuel)
    return 0

f = open("./day1/input.txt","r")
contents = f.readlines()
f.close()

sum = 0
for i in contents:
    sum+=calculate_fuel_2(int(i))

print(sum)
calculate_fuel_2(14)
def test_cases():
    assert 2==calculate_fuel_2(14)
    assert 966==calculate_fuel_2(1969)
    assert 50346==calculate_fuel_2(100756)

test_cases()