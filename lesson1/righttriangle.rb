puts 'Enter the first side of triangle '
a = gets.to_i
puts 'A = #{a} '

puts 'Enter the second side of triangle '
b = gets.to_i
puts 'B = #{b} '

puts 'Enter the thirth side of triangle '
c = gets.to_i
puts 'C = #{c} '

if a > b && a > c 
  rect = a**2 == (b**2) + (c**2)
elsif b > a && b > c 
  rect = b**2 == (a**2) + (c**2)
else
  rect = c**2 == (a**2) + (b**2)
end

if rect
	puts 'Triangle is rectangular '
else 
  puts 'Triangle is not rectangular '
end 

if a == b && b == c
  puts "It's isosceles triangle"
else
  puts "It's not isosceles triangle"