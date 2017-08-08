# Lunch In Ruby
class Luhn
  def initialize(num)
    @number = num.to_s
    @reverse_number = @number.reverse
  end

  def addends
    (0...@reverse_number.length).each_with_object([]) do |index, output|
      if index.odd?
        temp = @reverse_number[index].to_i * 2
        temp -= 9 if temp >= 10
        output << temp
      else
        output << @reverse_number[index].to_i
      end
    end.reverse
  end

  def checksum
    addends.inject(0) { |a, e| a + e }
  end

  def valid?
    0 == checksum % 10
  end

  def self.create(num)
    num *= 10
    return num if new(num).valid?
    num + (10 - new(num).checksum % 10)
  end
end
