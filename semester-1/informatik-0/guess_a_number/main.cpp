#include "guess_a_number.h"
#include <algorithm>
#include <iostream>

int main() {
  int number_to_guess; // The number to guess
  int max_attempts;    // The guessed number

  std::cout << "Number to guess: ";
  number_to_guess =
      choose_a_number(10); // Randomly choose a number from the interval [1, 10]

  std::cout << "Number of attempts: ";
  std::cin >> max_attempts;

  // Make sure that the player has at least one attempt
  if (max_attempts < 1)
    max_attempts = 1;

  int attempts = 0; // Attempts made so far

  while (attempts < max_attempts) {
    std::cout << "You have " << max_attempts - attempts
              << " attempt(s) left.\n";
    attempts++;

    int guess; // The user's guess
    std::cout << "Your guess: ";
    std::cin >> guess;

    if (guess == number_to_guess) {
      std::cout << "Congratulations, you correctly guessed " << number_to_guess
                << "!";
      return 0;
    } else {
      std::cout << "Sorry, but " << guess << " is wrong.\n";
    }
  }

  std::cout << "You lost after " << attempts
            << " attempt(s) :-( The number to guess was " << number_to_guess
            << ".";
}
