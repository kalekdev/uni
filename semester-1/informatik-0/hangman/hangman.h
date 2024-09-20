#ifndef HANGMAN_H
#define HANGMAN_H

#include <iostream>
#include <string>

using std::string;

// NOTE: You cannot change this file. It "only" contains declarations and
// short descriptions of the functionality we provided to you.

/**
 * This function returns a random english word. Use this to generate a new
 * word to guess. It is imperative that you use this function to get a word,
 * otherwise, the auto-grader will not work properly when testing or
 * submitting your project.
 */
string chooseWord();

/**
 * This function creates a "working copy" based on a given word. It returns a
 * string with the same amount of characters than the word, but all of them
 * are initially set to "_" (underscore)
 */
string createWorkingCopy(string word);

/**
 * You may call this function to render a little hangman figure in the HTML
 * view. This is completely optional, the tests don't rely on this function
 * being called. As argument, the function takes the number of wrong guesses and
 * selects the correct hangman picture to show.
 */
void showHangman(int wrongGuesses);

/**
 * This function prints the number of remaining attempts (based on the provided
 * number of wrong guesses. Call this method before each attempt.
 *
 * Example: The call 'printGameState(2)' will output: "Attempts left: 4"
 * because MAX_WRONG_GUESSES is 6, and 6 - 2 = 4
 */
void printGameState(int maxWrongGuesses, int wrongGuesses);

/**
 * This function prints the partly uncovered word (the working copy) in the
 * desired format.
 *
 * Example: If workingCopy is "_xp_rt", a call to printWorkingCopy(workingCopy)
 * will print "[ _ x p _ r t ]" - this is the format that is expected by the
 * autograder.
 */
void printWorkingCopy(string workingCopy);

/**
 * This function must be called if the game was lost (that is, on the 6th
 * wrong guess).
 *
 * Example: If the correct word was "expert", its outputs
 * "The word was: expert
 *  You lost!"
 */
void printYouLost(string word);

/**
 * This function must be called if the game was won (that is, the word was
 * guessed with less than 6 wrong guesses).
 *
 * Example: If the correct word was "expert", its outputs
 * "[ e x p e r t ]
 *  You won!"
 */
void printYouWon(string word);

#endif
