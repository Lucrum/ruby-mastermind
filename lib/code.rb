# frozen_string_literal: true

# class for secret code
class Code
  attr_reader :victory

  def initialize
    @secret = generate
    @victory = false
  end

  def generate
    c = []
    4.times do
      c.append(rand(1..6))
    end
    c
  end

  def check(guess)
    guess
  end

  # compares guess with secret, returning an array
  # [correct, correct but wrong position]
  def compare(guess)
    guess.each_with_index do |x, ind|
      # TODO: comparing function
    end
  end
end
