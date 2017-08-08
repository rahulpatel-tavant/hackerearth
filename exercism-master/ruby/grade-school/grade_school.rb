# Program for grade management
class School
  VERSION = 1
  def initialize
    @students = {}
  end

  def to_h
    output = {}
    @students.each do |_key, val|
      output[val] = @students.inject([]) { |key, value| key << value[0] if value[1] == val; key }.sort
    end
    Hash[output.sort]
  end

  def add(name, grade)
    @students[name] = grade
  end

  def grade(grade)
    @students.inject([]) { |key, value| key << value[0] if value[1] == grade; key }.sort
  end
end
