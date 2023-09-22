n = gets.chomp.to_i
(2...n).each do |i|
  prime = true
  (2...i).each do |b|
    if i % b == 0
      prime = false
      break
    end
  end
  puts i if prime
end
