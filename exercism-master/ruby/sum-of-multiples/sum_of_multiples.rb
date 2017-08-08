# Program to find sum of multipliers
class SumOfMultiples
  def initialize(*args)
    @agrs = args
  end

  def to(num)
    (0..num - 1).inject { |a, e| a += e if @agrs.any? { |data| e % data == 0 }; a }
  end

  def self.to(num)
    (0..num - 1).inject { |a, e| a += e if e % 3 == 0 || e % 5 == 0; a }
  end
end
