def bubble_sort(arr)
  arr.length.times do
    swapped = false
    0.upto(arr.length - 2) do |index| # last elm and 2nd last already swapped
      if arr[index] > arr[index.next]
        arr[index], arr[index.next] = arr[index.next], arr[index]
        swapped = true
      end
    end
    break unless swapped
  end
  arr
end

p bubble_sort([1, 3, 3, 2, 1, 3, 5, 7, 8, 9])
