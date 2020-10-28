# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89

arr = []

fibo_1 = 1
fibo_2 = 0

loop do
  fibo_sum = fibo_1 + fibo_2
  fibo_1 = fibo_2
    break if fibo_1 > 100
  fibo_2 = fibo_sum
  arr << fibo_1 
end
puts arr