#include <cstdlib>
#include <iostream>
#include <string>
#include "guess_a_number.h"

// NOTE: You cannot change this file, and you don't need to understand its
// content in order to solve your task. Feel free to look around, however,
// in case you're interested.

const std::string action = std::getenv("ACTION");

void print_attempts_left(int attempts_left) {
  std::cout << "You have " << attempts_left << " attempt(s) left.\n";
}

void print_you_won(int correct_guess) {
  std::cout << "Congratulations, you correctly guessed " << correct_guess << "!\n";
}

void print_wrong_guess(int wrong_guess) {
  std::cout << "Sorry, but " << wrong_guess << " is wrong.\n";
}

void print_you_lost(int number_to_guess, int attempts) {
  std::cout << "You lost after " << attempts << " attempt(s) :-( The number to guess was " << number_to_guess << ".\n";
}

// This function returns a randomly chosen integer from the interval [1, max].
int randomly_choose_a_number(int max) {
  return std::rand() % max + 1;
}

int choose_a_number(int max) {
  if (action == "run") {
    std::cout << "?\n";
      // Just here to achieve the same output behaviour, in terms of newlines,
      // when a user replaces 
      //   std::cin >> number_to_guess;
      // by
      //   number_to_guess = choose_a_number(MAX);
    
    return randomly_choose_a_number(max);
  } else {
    int guess;
    std::cin >> guess;

    return guess;
  }
}
