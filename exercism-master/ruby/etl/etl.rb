# Etl in Ruby
class ETL
  def self.transform(old)
    output = {}
    old.each do |key, value|
      value.each do |i|
        output[i.downcase] = key
      end
    end
    output
  end
end
