puts 'Enter the first side of triangle '
a = gets.to_i
puts "A = #{a} "

puts 'Enter the second side of triangle '
b = gets.to_i
puts "B = #{b} "

puts 'Enter the thirth side of triangle '
c = gets.to_i
puts "C = #{c} "

a, b, hypo = [a, b, c].sort

rect = hypo**2 == (a**2) + (b**2)
puts rect

if rect
	puts 'Triangle is rectangular '
else 
  puts 'Triangle is not rectangular '
end 

if a == b && b == c
  puts "It's isosceles triangle"
else
  puts "It's not isosceles triangle"
end