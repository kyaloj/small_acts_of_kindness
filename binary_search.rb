def binary_search(arr, target)
  max_index = arr.length - 1
  min_index = 0
  required_index = -1

  while max_index >= min_index
    medium_index = (max_index + min_index) / 2
    if arr[medium_index] == target
      required_index = medium_index
      break
    elsif arr[medium_index] > target
      max_index = medium_index - 1
    else
      min_index = medium_index + 1
    end
  end

  required_index
end

p binary_search(%w[1 2 3 4 me 8 10].sort, 'me')
