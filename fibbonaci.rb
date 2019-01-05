def fibbonaci(val)
  nth = val.to_i
  return 1 if nth < 2
  nums = [1, 1]

  nums << (nums.last + nums[-2]) while nums.size < nth
  nums.last
end

p fibbonaci(ARGV[0])
