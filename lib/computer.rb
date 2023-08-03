# frozen_string_literal: true

require_relative 'checker'

# computer ai class
class Computer
  attr_reader :victory

  def initialize
    @token_pool = []
    generate_pool
    @victory = nil
    @guess = []
  end

  def generate_pool
    (1..6).each do |x|
      (1..6).each do |y|
        (1..6).each do |j|
          (1..6).each do |k|
            @token_pool.append([x, y, j, k])
          end
        end
      end
    end
  end

  def reveal
    print "#{@token_pool}\n"
  end

  def guess
    @guess = @token_pool.delete_at(rand(@token_pool.length))
    @guess
  end

  def feedback(resp)
    if resp == [4, 0]
      @victory = true
    else
      remove_all_tokens(resp)
      @victory = false if @token_pool.empty?
    end
  end

  def remove_all_tokens(resp)
    fresh_pool = []
    @token_pool.each do |x|
      fresh_pool.append(x) if compare(x, @guess) == resp
    end
    @token_pool = fresh_pool
  end
end
