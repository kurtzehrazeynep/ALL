import random
count = 0
number = random.randrange(1,101)
while True:
    print(f"{"-"*55}\nI've picked a number between 1 and 100! 🎯\nLet's see how many guesses it will take you to find it.\nWhat is your first guess?\n{"-"*55}")
    try:
        guess = int(input())
        count+=1
    except ValueError:
        print("⚠️ please enter number between 1-100\n")
        continue
    else:
        if ( guess > 100 ) | (guess < 1):
            print("⚠️ please enter number between 1-100\n")
            continue
        else:
            if guess > number:
                print("📉 lower\n")
                continue
            elif guess < number:
                print("📈 Upper\n")
                continue
            else:
                print(f"🎉 CONGRATULATIONS 🎯 | {number} | you tried {count} times.\n")
                break

    