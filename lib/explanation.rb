# frozen_string_literal: true

def introduction
  print "Welcome to Mastermind! In this game, the code breaker must figure out
a four digit code, consisting of the numbers one through six. On the other hand,
the code maker must give the breaker feedback on its guesses.

The code breaker has #{@max_rounds} guesses to guess the code.
Every guess yields feedback, in the form [X, Y].
X denotes the number of correct digits in the correct position, and
Y denotes the number of correct digits in the wrong position.\n"
end

def code_maker_intro
  puts "--------------------------
Welcome, code maker.
Your job is to provide feedback to the computer's guesses, using two digits, separated by a space.

The first digit will be the number of correct numbers in the correct position,
and the second digit will be the number of correct numbers in the wrong position.

For example, if your code is [5216], and the guess is [5613], the correct
feedback would be [1,2]. The 5 is in the correct position, but 6 and 1 are not.
Without further ado, please write down a code, and let's begin.\n"
end

def code_breaker_intro
  puts 'Generating code...'
  sleep 2
end
