# 🎯 Python Number Guessing Game (Sayı Tahmin Oyunu)

A simple, interactive command-line number guessing game built with Python. The program generates a random number between 1 and 100, and the player tries to find it with the help of high/low hints and a guess counter.

---

## 🚀 Features

* **Interactive CLI Interface:** Clean, formatted command-line menu with visual separators and emojis.
* **Input Validation:** Handles non-numeric inputs gracefully using `try-except` blocks without crashing the program.
* **Range Checking:** Ensures player guesses stay within the valid 1–100 range.
* **Attempt Counter:** Tracks and displays the total number of attempts it takes to win.

---

## 🛠️ Requirements

* **Python 3.x** (No external libraries or packages required; uses Python's built-in `random` module).

---

## 🎮 How to Run

1. Clone or download the repository to your local machine.
2. Open your terminal or command prompt in the project directory.
3. Run the script using Python:
   ```bash
   python GuessTheNumber.py

# How to play 🎮
1.The game will randomly pick a secret number between 1 and 100.
2.Enter your guess when prompted.
3.The game will guide you:
```
📉 lower $\rightarrow$ The secret number is smaller than your guess.
📈 Upper $\rightarrow$ The secret number is greater than your guess.
Keep guessing until you find the correct number and see your total score!