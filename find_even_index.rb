def find_even_index(arr)
  target = -1
  0.upto(arr.length - 1) do |index|
    left_arr = index.zero? ? [0] : arr[0..(index - 1)]
    right_arr = index == (arr.length - 1) ? [0] : arr[(index + 1)..-1]
    return index if left_arr.inject(:+) == right_arr.inject(:+)
  end
  target
end

p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]).zero?
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]).zero?
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1