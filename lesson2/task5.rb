puts 'Введите число: '
day = gets.chomp.to_i
puts 'Введите месяц: '
month = gets.chomp.to_i - 1 
puts 'Введите год: '
year = gets.chomp.to_i

# Months array
arr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
#високосный год
if year % 4 == 0 || (year % 100 != 0 && year % 400 == 0)
  arr[1] = 29
end
day += arr.take(month).sum
puts day
