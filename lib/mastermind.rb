# frozen_string_literal: true

# game logic class
class Mastermind
  def initialize(max_rounds)
    @secret = Code.new
    @rounds = 1
    @max_rounds = max_rounds
  end

  def play
    @secret.reveal
    until @secret.victory || @rounds > @max_rounds
      input = prompt_user
      print "#{@secret.check(input)}\n"
      @rounds += 1
    end
    game_end
  end

  def prompt_user
    puts "Please enter your guess (#{@rounds}/#{@max_rounds}):"
    user_input = gets

    until verify_input(user_input)
      puts 'Invalid guess. Please guess a 4 digit number, with digits 1-6:'
      user_input = gets
    end

    user_input.split('').map(&:to_i)
  end

  def verify_input(input)
    /^[1-6]{4}$/.match(input)
  end

  def game_end
    if @secret.victory
      puts 'You win!'
    else
      puts 'You lose!'
    end
  end
end
