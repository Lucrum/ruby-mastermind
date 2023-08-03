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
    @game_type == 1 ? code_breaker_play : code_maker_play
  end

  # game loop if player is code breaker
  def code_breaker_play
    # debug purposes
    # @secret.reveal
    secret = Code.new
    code_breaker_intro
    until secret.victory || @rounds > @max_rounds
      input = prompt_user_guess
      print "Code maker says: #{secret.check(input)}\n"
      @rounds += 1
    end
    game_end_message(secret.victory)
  end

  def prompt_user_guess
    print "\nPlease enter your guess (#{@rounds}/#{@max_rounds}): "
    user_input = gets

    until verify_input(user_input, /^[1-6]{4}$/)
      print 'Invalid guess. Please guess a 4 digit number, with digits 1-6: '
      user_input = gets
    end

    user_input.strip.split('').map(&:to_i)
  end

  # game loop if player is code master
  def code_maker_play
    code_master_intro
    comp = Computer.new

    until comp.victory || @rounds > @max_rounds || comp.victory == false
      puts "\nRound #{@rounds} | The computer has guessed: #{comp.guess}"
      comp.feedback(prompt_user_feedback)
      @rounds += 1
    end

    game_end_message(!comp.victory)
  end

  def prompt_user_feedback
    print 'Enter your response: '
    user_input = gets
    until verify_feedback(user_input)
      puts "Invalid feedback. Please enter feedback in the form 'X,Y', with a single comma between.
The digits should not add to more than 4."
      print 'Enter your response: '
      user_input = gets
    end
    [user_input[0].to_i, user_input[2].to_i]
  end

  def verify_input(input, reg)
    reg.match(input)
  end

  def verify_feedback(input)
    return false unless /^[0-4],[0-4]$/.match(input)
    return false unless input[0].to_i + input[2].to_i <= 4

    true
  end

  def game_end_message(victory)
    if victory && @game_type == 1
      puts "\nYou broke the code!"
    elsif victory
      puts "\nThe computer surrenders! Your code was too strong!"
    elsif @game_type == 1
      puts "\nYou took too long to break the code!"
    else
      puts "\nThe computer guessed your code!"
    end
  end

  def mode
    print "Would you like to be the code breaker or code maker?
1 for breaker, 2 for master: "
    user_input = gets
    until verify_input(user_input, /^[1-2]{1}$/)
      print 'Invalid choice. Please enter 1 for breaker, 2 for maker: '
      user_input = gets
    end

    @game_type = user_input.to_i
  end
end
