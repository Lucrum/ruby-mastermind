# frozen_string_literal: true

require_relative 'checker'

# class for secret code
class Code
  attr_reader :victory, :secret_code

  def initialize
    @secret_code = generate_code
    @victory = false
  end

  def generate_code
    c = []
    4.times do
      c.append(rand(1..6))
    end
    c
  end

  def check(guess)
    compare_res = compare(guess, @secret_code)
    @victory = compare_res == [4, 0]
    compare_res
  end
end
