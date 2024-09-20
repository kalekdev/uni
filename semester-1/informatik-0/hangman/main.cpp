#include "hangman.h"
#include <iostream>
#include <string>

using std::string;

int main() {
  // Word the player needs to guess (randomly selected)
  string word = chooseWord();

  // Initialise the "uncovered" word that is shown to the player: the uncovered
  // word is obtained by replacing each letter from the original word (variable
  // word) with an underscore (i.e. _).
  string workingCopy = createWorkingCopy(word);

  int wrongGuesses = 0;    // Number of wrong guesses
  int maxWrongGuesses = 6; // Maximum number of wrong guesses (don't change)

  // Draw the empty gallow
  showHangman(0);

  // Game loop (each iteration is a round of the game)
  while (wrongGuesses < maxWrongGuesses) {
    printGameState(maxWrongGuesses, wrongGuesses);
    printWorkingCopy(workingCopy);

    if (workingCopy == word) {
      printYouWon(word);
      return 0;
    }

    char guess = '\0';
    std::cin >> guess;

    bool found = false;
    for (int i = 0; i < word.length(); i++) {
      if (word.at(i) == guess) {
        workingCopy.at(i) = guess;
        found = true;
      }
    }

    if (!found) {
      wrongGuesses++;
      showHangman(wrongGuesses);
    }
  }

  printYouLost(word);

  return 0;
}
