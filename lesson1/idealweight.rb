puts "What's your name? "
name = gets.chomp

puts "What's your height? "
height = Integer(gets.chomp)

ideal_weight = (height - 110) * 1.15
puts '#{name}, your ideal weight is #{ideal_weight}'

if ideal_weight < 0
  puts '#{name}, your weight is ideal now!'
end

