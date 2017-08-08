# Program to Implement the accumulate operation
class Array
  def accumulate
    self.inject([]) { |a, e| a << yield(e) }
  end
end
