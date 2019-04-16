class Abbreviator

  def self.abbreviate(string)
    string.split(' ').map do |word|
      word.length <= 3 ? word : abbrev(word)
    end.join(' ')
  end
  
  def self.abbrev(word)
    word.split('-').map do |w|
      w.chars.first + (w.length - 2).to_s + w.chars.last
    end.join('-')
  end
  
end

p Abbreviator.abbreviate("banana")