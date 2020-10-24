puts "Enter the first side of triangle "
a = gets.chomp.to_i
print "A = #{a} "

puts "\nEnter the second side of triangle "
b = gets.chomp.to_i
print "B = #{b} "

puts "\nEnter the thirth side of triangle "
c = gets.chomp.to_i
print "C = #{c} "

if a > b && a > c 
    rect = a**2 == (b**2) + (c**2)
  elsif b > a && b > c 
    rect = b**2 == (a**2) + (c**2)
  else
    rect = c**2 == (a**2) + (b**2)
  end

if rect
	print "\nTriangle is rectangular "
else 
	print "\nTriangle is not rectangular "
end 

if a == b && b == c
    print "\nIt's isosceles triangle"
else
    print "\nIt's not isosceles triangle"
end
