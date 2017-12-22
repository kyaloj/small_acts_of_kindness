#
class StringCalculator
  def self.add(value)
    value.split(',').inject(0) { |mem, num| mem + num.to_i }
  end
end
