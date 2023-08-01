# frozen_string_literal: true

# compares guess with secret, returning an array
# [correct, correct but wrong position]
def compare(guess, ans)
  temp_secret = ans.dup
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
