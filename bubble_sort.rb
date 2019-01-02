def bubble_sort(arr)
  steps = 0
  current_iteration = 1
  arr.length.times do
    index = 0
    swapped = false
    arr.length.times do
      if index == arr.length - 1
        index = 0
        break
      end
      if arr[index] > arr[index.next]
        arr[index], arr[index.next] = arr[index.next], arr[index]
        swapped = true
      end
      index += 1
      steps += 1
    end
    p steps
    break unless swapped
    current_iteration += 1
  end
  arr
end

p bubble_sort([1, 2, 3, 5, 6, 7, 8, 9, 100])
