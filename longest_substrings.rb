a = %w[B A C B A D]
b = %w[A B A Z D C]

def longest_substring(string1, string2)
  results = Array.new(string2.length, 0) { Array.new(string1.length, 0) }
  string2.each_with_index do |row_e, row_i|
    string1.each_with_index do |col_e, col_i|
      if col_e == row_e
        results[row_i][col_i] =
          1 + lookup_values(results, (row_i - 1), (col_i - 1))
      else
        results[row_i][col_i] =
          [
            lookup_values(results, row_i, (col_i - 1)),
            lookup_values(results, (row_i - 1), col_i)
          ].max
      end
    end
  end
  results
end

def lookup_values(results, row, col)
  results[row][col]
rescue StandardError
  0
end

p longest_substring(a, b)
