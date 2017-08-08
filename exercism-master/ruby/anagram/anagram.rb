# Anagram in Ruby
class Anagram
  def initialize(word)
    @anagram = word.downcase
    @word = @anagram.chars.sort.join
  end

  def match(list_of_anagrams)
    list_of_anagrams.each_with_object([]) do |val, obj|
      obj << val if @word == val.downcase.chars.sort.join && @anagram != val.downcase
    end
  end
end
