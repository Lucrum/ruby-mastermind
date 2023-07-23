# frozen_string_literal: true

# class for secret code
class Code
  def initialize
    @secret = generate
  end

  def generate
    c = []
    4.times do
      c.append(rand(1..6))
    end
    c
  end

  # compares guess with secret, returning an array
  # [correct, correct but wrong position]
  def compare(guess)
    [guess - 4, 1]
  end
end
