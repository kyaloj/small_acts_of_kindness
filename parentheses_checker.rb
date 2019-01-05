def parentheses_balanced?(parentheses)
  braces = { '(' => ')', '[' => ']', '{' => '}' }

  stack = []

  parentheses.split('').each do |char|
    if braces.key?(char)
      stack << char
    elsif stack.pop != braces.key(char)
      return false
    end
  end
  stack.empty?
end

p parentheses_balanced? ARGV[0]
