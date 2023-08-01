# frozen_string_literal: true

require_relative 'explanation'

# game logic class
class Mastermind
  def initialize(max_rounds)
    @rounds = 1
    @max_rounds = max_rounds
    @game_type = 1
  end

  def play
    introduction
    mode
    enter_game_loop
  end

  def enter_game_loop
    code_breaker_play if @game_type == 1
    code_master_play
  end

  # game loop if player is code breaker
  def code_breaker_play
    # debug purposes
    # @secret.reveal
    secret = Code.new
    code_breaker_intro
    until secret.victory || @rounds > @max_rounds
      input = prompt_user_guess
      print "#{secret.check(input)}\n"
      @rounds += 1
    end
    game_end
  end

  def prompt_user_guess
    puts "Please enter your guess (#{@rounds}/#{@max_rounds}):"
    user_input = gets

    until verify_input(user_input, /^[1-6]{4}$/)
      puts 'Invalid guess. Please guess a 4 digit number, with digits 1-6:'
      user_input = gets
    end

    user_input.split('').map(&:to_i)
  end

  # game loop if player is code master
  def code_master_play
    code_master_intro
    comp = Computer.new

    until comp.victory || @rounds > @max_rounds
      puts "Round #{@rounds} | The computer has guessed: #{comp.guess}"
      comp.feedback(prompt_user_feedback)
      @rounds += 1
    end
  end

  def prompt_user_feedback
    print 'What is your response? '
    user_input = gets
    until verify_feedback(user_input)
      puts "Invalid feedback. Please enter feedback in the form 'X,Y', with a single comma between."
      user_input = gets
    end
  end

  def verify_input(input, reg)
    reg.match(input)
  end

  def verify_feedback(input)
    return false unless /^[0-4],[0-4]$/.match(input)
    return false unless input[0].to_i + input[2].to_i <= 4

    true
  end

  def game_end
    if @secret.victory
      puts 'You win!'
    else
      puts 'You lose!'
    end
  end

  def mode
    print "Would you like to be the code breaker or code master?
1 for breaker, 2 for master: "
    user_input = gets
    until verify_input(user_input, /^[1-2]{1}$/)
      print 'Invalid choice. Please enter 1 for breaker, 2 for master: '
      user_input = gets
    end

    @game_type = user_input.to_i
  end
end
