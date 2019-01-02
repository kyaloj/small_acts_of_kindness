def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  first_arr = merge_sort(arr[0...mid])
  last_arr = merge_sort(arr[mid..-1])

  results = []
  while [first_arr, last_arr].none?(&:empty?)
    p "stuff"
    p first_arr
    p last_arr
    results << (first_arr[0] <= last_arr[0] ? first_arr.shift : last_arr.shift)
    p 'results'
    p results
  end

  results + first_arr + last_arr
end

p merge_sort [1,3,7,2,8,9,11,23,12,5]