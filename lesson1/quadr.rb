puts "Enter the a "
a = gets.chomp.to_i
print "a = #{a} "

puts "\nEnter the b "
b = gets.chomp.to_i
print "b = #{b} "

puts "\nEnter the c "
c = gets.chomp.to_i
print "c = #{c} "

d = (b**2) - 4 * a * c
print "\nD = #{Math.sqrt(d)} "

if d < 0 
    print "\nNo rules "
elsif d == 0
    root = (-b) / 2 * a
    print "D = #{d} and Root = #{root}"
else d > 0
    disc = Math.sqrt(d)
    root1 = (-b + disc) / 2 * a
    root2 = (-b - disc) / 2 * a
    print "D = #{d}, Root 1 = #{root1}, Root 2 = #{root2}"
end