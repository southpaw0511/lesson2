order = Hash.new
product = ' '


loop do
  puts 'Название товара - '
  product = gets.chomp
  break if product == 'стоп'

  puts 'Цена за 1 - '
  price = gets.to_i

  puts 'Кол-во товаров - '
  quantity = gets.to_i

  order[product] = { final_cost: price, products_quantity: quantity }
end

all_sum = 0.0
order.each do |k, v|
  sum = v[:final_cost] * v[:products_quantity]
  all_sum += sum
  puts "#{k} = #{sum}"
end

puts "Общая стоимость: #{all_sum}"