def selection_sort(arr)
  index = 0
  arr.length.times do
    min_value = arr[index]
    min_value_index = index
    arr[index..-1].each.with_index do |e, steps|
      if min_value > e
        min_value = e
        min_value_index = index + steps
      end
    end

    arr[index], arr[min_value_index] = arr[min_value_index], arr[index]
    index += 1
  end
  arr
end

p selection_sort([1, 1, 10, 10, 3, 2,9, 9])
