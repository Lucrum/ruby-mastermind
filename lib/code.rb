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

  def reveal
    print "#{@secret}\n"
  end

  def check(guess)
    compare_res = compare(guess)
    @victory = compare_res == [4, 0]
    compare_res
  end

  # compares guess with secret, returning an array
  # [correct, correct but wrong position]
  def compare(guess)
    temp_secret = @secret.dup
    res = [0, 0]
    res[0] = direct_compare_all(guess, temp_secret)
    res[1] = search_compare_all(guess, temp_secret)
    res
  end

  # direct compare first, then search compare

  def direct_compare_all(guess, temp_secret)
    res = 0
    (guess.length - 1).times do |ind|
      res += 1 if direct_compare(guess, temp_secret, ind)
    end
    res
  end

  def search_compare_all(guess, temp_secret)
    res = 0
    (guess.length - 1).times do |ind|
      res += 1 if search_compare(guess, temp_secret, ind)
    end
    res
  end

  def direct_compare(guess, ans, ind)
    return unless guess[ind] == ans[ind]

    ans[ind] = 0
    true
  end

  # searches through the secret; if there's a matching value
  # returns true and changes that index
  def search_compare(guess, ans, ind)
    res = ans.index guess[ind]
    return unless res

    ans[res] = 0
    true
  end
end
