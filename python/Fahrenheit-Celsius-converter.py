while True:
    print(f"{"-"*40}\n{'press F for Fahrenheit to Celsius':^40}\n{'press C for Celsius to Fahrenheit':^40}\n{"-"*40}\n{'press Q for quit':^40}\n{"-"*40}")
    print(f"{'select the action you want to perform.':^40}") #içeride tek tırnak (')
    action = input().strip().lower()
    match action:
        case "f":
            print("Enter the Fahrenheit temperature to convert to Celsius.")
            try:
                fahrenheit = float(input())
            except ValueError:
                print("⚠️please enter number!")
            else:
                celsius = ((fahrenheit-32)*(5)/9)
                print(f"{fahrenheit:.2f}°F = {celsius:.2f}°C")
        case "c":
            print("Enter the Celsius temperature to convert to Fahrenheit.")
            try:
                celsius = float(input())
            except ValueError:
                print("⚠️please enter number!")
            else:
                fahrenheit = (celsius)*(9)/(5)+32
                print(f"{celsius:.2f}°C = {fahrenheit:.2f}°F")
        case "q":
            print("Exiting program. Goodbye!👋🏻")
            break
        case _:
            print("⚠️This command is not valid.Please select a valid action!")
            continue
    
    