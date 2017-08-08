# Hexadecimal to Decimal Conversion
class Hexadecimal
  def initialize(hexadecimal_number)
    @dec_str = hexadecimal_number.reverse!
  end

  def to_decimal
    return 0 if @dec_str =~ /[^abcdef0-9]/
    (0...@dec_str.length).inject(0) do |decimal, i|
      decimal + get_hash_gata(i) * (16**i)
    end
  end

  def hex_table
    { 'a' => 10, 'b' => 11, 'c' => 12,
      'd' => 13, 'e' => 14, 'f' => 15 }
  end

  def get_hash_gata(key)
    return hex_table[@dec_str[key]].to_i if hex_table.key?(@dec_str[key])
    @dec_str[key].to_i
  end
end
