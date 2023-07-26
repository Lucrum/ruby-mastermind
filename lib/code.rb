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
    (guess.length - 1).times do |ind|
      if direct_compare(guess, temp_secret, ind)
        res[0] += 1
      elsif search_compare(guess, temp_secret, ind)
        res[1] += 1
      end
    end
    res
  end

  # wrong response in the case of 5,2,3,2 and guess 5,2,2,2

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
