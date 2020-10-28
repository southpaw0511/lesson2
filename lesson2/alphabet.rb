letters = ('а'..'я').to_a

vowels = ['а', 'е', 'ё', 'и', 'о', 'у', 'ы', 'э', 'ю', 'я',]
hash = Hash.new
letters.each.with_index do |v, i|
  hash[v] = i if vowels.include?(v)
end
puts hash