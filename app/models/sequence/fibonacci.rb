class Sequence::Fibonacci
  attr_reader :n, :nth_term

  def initialize(n)
    @n = n - 1
  end

  def sequence
    @sequence ||= if n == -1
      [0]
    elsif n < -1
      raise 'n must be greater than or equal to zero'
    else
      n.times.inject([0, 1]) do |memo, num|
        memo + [memo[-2] + memo[-1]]
      end
    end
  end
end
