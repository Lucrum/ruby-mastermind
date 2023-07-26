# frozen_string_literal: true

require_relative 'lib/code'
require_relative 'lib/mastermind'

max_rounds = 12
game = Mastermind.new(max_rounds)

puts "Welcome to Mastermind! In this game, you may choose
between the numbers 1-6 to form a 4 digit code. You have #{max_rounds} guesses
to guess the secret code."
game.play