# input: first_three[], 5
# Output: 0 0 1 1 2

def tribonacci(signature, num)
  return signature.take(num) if num < 4

  4.upto(num) do
    signature << signature.last(3).inject(:+)
  end

  signature
end

p tribonacci([0, 0, 1], ARGV[0].to_i)
