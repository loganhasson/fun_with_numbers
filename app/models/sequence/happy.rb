require 'set'

class Sequence::Happy
  attr_reader :n, :nth_term, :already_seen, :happy_nums

  def initialize(n)
    @n = n
    # Thank you google. Sets are cray cray fast
    @already_seen = Set.new
    @happy_nums = Set.new
  end

  def sequence
    @sequence ||= if n < 0
      raise 'n must be greater than or equal to zero'
    else
      seq = []
      i = 1
      while seq.length < n + 1
        seq << i if happy_num?(i)
        i += 1
      end

      seq
    end
  end

  private

  def happy_num?(num)
    if num == 1
      return true
    elsif already_seen.include?(num)
      # If we've already seen this number, we can just check to see if it
      # already exists in the happy_nums set (also, breaks us out of a non-
      # ending cycle)
      return happy_nums.include?(num)
    end

    already_seen << num

    sum = get_sum_of_squared_digits(num)

    if happy_num?(sum)
      happy_nums << num
      true
    else
      false
    end
  end

  def get_sum_of_squared_digits(num)
    num.to_s.each_char.inject(0) do |sum, digit|
      sum + digit.to_i**2
    end
  end
end
