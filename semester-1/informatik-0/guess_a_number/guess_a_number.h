#ifndef PROJECT_H
#define PROJECT_H


// NOTE: You cannot change this file. It "only" contains declarations and
// short descriptions of the functionality we provided to you.


// This function outputs the number of attempts that are left.
//
// Example: the function call print_attempts_left(3) results in the output
// "You have 3 attempt(s) left".
void print_attempts_left(int attempts_left);

// This function outputs the winning message.
//
// Example: the function call print_you_won(9) results in the output
// "Congratulations, you correctly guessed 9!".
void print_you_won(int correct_guess);

// This function outputs a message telling the user that their guess was wrong.
//
// Example: the function call print_wrong_guess(1) results in the output
// "Sorry, but 1 is wrong.".
void print_wrong_guess(int wrong_guess);

// This function outputs the losing message.
//
// Example: the function call print_you_lost(2, 5) results in the output
// "You lost after 5 attempts :-( The number to guess was 2.".
void print_you_lost(int number_to_guess, int attempts);


// This function returns a randomly chosen integer from the interval [0, max].
int randomly_choose_a_number(int max);

// This function returns a number from the interval [1, max].
// The number is randomly chosen if we're in interactive mode and parameter
// choose_randomly is true, and read from the keyboard (std::cin) otherwise.
int choose_a_number(int max);


// Master implementation for part 1: reads the next guess from the keyboard
// and stores it in the passed variable.
//
// Example: given the function call PART1_read_next_guess(my_guess) and
// assuming that the player enters 1, variable my_guess will afterwards
// have the value 1.
void PART1_read_next_guess(int& guess);

// Master implementation for part 2: compares guess to number_to_guess,
// outputs a result-depending message (correct/wrong) and updates
// variable play to false if the guess was correct.
//
// Example: given the function call
// PART2_handle_guess(1, 2, continue_playing), a wrong-guess message
// will be outputted.
//
// Example: given the function call
// PART2_handle_guess(2, 2, continue_playing), a correct-guess message
// will be output and variable continue_playing will be set to false.
void PART2_handle_guess(int guess, int number_to_guess, bool& play);

// Master implementation for part 3: increments the number of guessing
// attempts the player made (variable attempts), and if the maximum
// number of guesses has been made, outputs a corresponding message and
// sets variable play to false.
//
// Example: given the function call
// PART3_finish_round(2, 10, performed_attempts, continue_playing), and
// assuming that performed_attempts has a value of 5, then the only
// effect of the function call is that performed_attempts will be updated
// to 6.
//
// Example: given the function call
// PART3_finish_round(2, 10, performed_attempts, continue_playing), and
// assuming that performed_attempts has a value of 9, then
// performed_attempts will be incremented to 10, a you-lost message will
// be output and continue_playing will be set to false.
void PART3_finish_round(int number_to_guess, int max_attempts, int& attempts, bool& play);

#endif
