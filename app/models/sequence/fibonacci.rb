class Sequence::Fibonacci
  attr_reader :n, :nth_term

  def initialize(n)
    # We'll be building an array containing the Fibonacci sequence.
    # Since we start with the 0th and 1st elements already in place,
    # we need to iterate 1 less time than n. Just do that here rather than
    # in the loop
    @n = n - 1
  end

  def sequence
    @sequence ||= if n == -1
      [0]
    elsif n < -1
      raise 'n must be greater than or equal to zero'
    else
      n.times.inject([0, 1]) do |memo, num|
        # Could have just as easily done memo + [memo[-2] + memo[-1]]
        memo << (memo[-2] + memo[-1])
      end
    end
  end
end
