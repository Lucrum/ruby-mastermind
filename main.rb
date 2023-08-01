# frozen_string_literal: true

require_relative 'lib/code'
require_relative 'lib/mastermind'
require_relative 'lib/computer'

max_rounds = 12
game = Mastermind.new(max_rounds)

game.play
