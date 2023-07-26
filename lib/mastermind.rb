# frozen_string_literal: true

# game logic class
class Mastermind
  def initialize(max_rounds)
    @secret = Code.new
    @rounds = 1
    @max_rounds = max_rounds
  end

  def play
    until @secret.victory || @rounds > @max_rounds
      input = prompt_user
      @secret.compare(input)
      @rounds += 1
    end
    game_end
  end

  def prompt_user
    puts "Please enter your guess (#{@rounds}/#{@max_rounds}):"
    gets.split('')
  end

  def game_end
    if @secret.victory
      puts 'You win!'
    else
      puts 'You lose!'
    end
  end
end
