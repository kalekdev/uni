#include "hangman.h"
#include "termcolor.h"

// NOTE: You cannot change this file, and you don't need to understand its
// content in order to solve your task. Feel free to look around, however,
// in case you're interested.

const string action = std::getenv("ACTION");
const string words[] = {
#include "words.csv"
    "sentinel"};

string color(string c) { return action == "run" ? c : ""; }

string chooseWord() {
  string word;
  if (action == "test" || action == "submit") {
    std::cin >> word;
  } else {
    int i = rand() % (sizeof(words) / sizeof(*words) -
                      1); // don't take the last word (which is 'sentinel')
    word = words[i];
    std::cout << "A random (english) word with " << word.length()
              << " characters has been chosen." << std::endl;
    return word;
  }
  return word;
}

string createWorkingCopy(string word) {
  string result = word;
  for (unsigned int i = 0; i < result.length(); ++i) {
    result.at(i) = '_';
  }
  return result;
}

void showHangman(int wrongGuesses) {
  std::cout << "<cx:html>\n"
            //    << "<p>Attempts left: " << maxWrongGuesses - wrongGuesses <<
            //    "</p>\n"
            << "<img alt='' "
               "src='https://lec.inf.ethz.ch/mavt/et/2019/img/hangman/hang_"
            << wrongGuesses + 1 << ".gif'/>\n"
            << "</cx:html>" << std::endl;
}

void printGameState(int maxWrongGuesses, int wrongGuesses) {
  std::cout << color(gray)
            << "\nAttempts left: " << (maxWrongGuesses - wrongGuesses)
            << color(reset) << "\n";
}

void printWorkingCopy(string workingCopy) {
  std::cout << color(blue) << "[ ";
  for (unsigned int i = 0; i < workingCopy.length(); ++i) {
    std::cout << workingCopy.at(i) << " ";
  }
  std::cout << "]\n" << color(reset);
}

void printYouLost(string word) {
  std::cout << "The word was: " << color(white) << word << color(red)
            << "\nYou lost!\n"
            << color(reset);
}

void printYouWon(string word) {
  std::cout << "\n";
  printWorkingCopy(word);
  std::cout << color(green) << "You won!\n" << color(reset);
}
