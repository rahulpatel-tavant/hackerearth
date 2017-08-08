# Secret Handshake in Ruby
class SecretHandshake
  def initialize(decimal)
    @decimal = decimal
    return if @decimal =~ /[^0-9]+/
    @commands_array = ['wink', 'double blink', 'close your eyes', 'jump']
    @binary_string = decimal.to_s(2).reverse.slice(0, 4)
  end

  def commands
    return [] if @decimal =~ /[^0-9]+/
    return result.reverse if @decimal.to_s(2)[4] == '1'
    result
  end

  def result
    (0...@binary_string.length).each_with_object([]) do |i, output|
      output << @commands_array[i] if @binary_string[i] == '1'
    end
  end
end
