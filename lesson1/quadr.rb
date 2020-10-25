puts 'Enter the a '
a = gets.to_i
puts 'a = #{a} '

puts 'Enter the b '
b = gets.to_i
puts 'b = #{b} '

puts 'Enter the c '
c = gets.to_i
puts 'c = #{c} '

d = (b**2) - 4 * a * c
puts 'D = #{Math.sqrt(d)} '

if d < 0 
  puts 'No rules '
elsif d == 0
  root = (-b) / 2 * a
  puts 'D = #{d} and Root = #{root}'
else d > 0
  disc = Math.sqrt(d)
  root1 = (-b + disc) / 2 * a
  root2 = (-b - disc) / 2 * a
  puts 'D = #{d}, Root 1 = #{root1}, Root 2 = #{root2}'
end