# Program to Find No OF Grains
class Grains
  def self.square(num)
    2**(num - 1)
  end

  def self.total
    (1..64).inject { |a, e| a + 2**(e - 1) }
  end
end
