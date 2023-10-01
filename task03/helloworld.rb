def is_prime?(num)
  return false if num <= 1
  return true if num == 2

  return false if num % 2 == 0

  i = 3
  while i * i <= num
    return false if num % i == 0
    i += 2
  end

  return true
end

def find_primes_up_to_n(n)
  primes = []
  (2..n).each do |num|
    primes << num if is_prime?(num)
  end
  primes
end

# Input the value of 'n'
print "Enter the value of n: "
n = gets.chomp.to_i

if n < 2
  puts "There are no prime numbers in the specified range."
else
  prime_numbers = find_primes_up_to_n(n)
  puts "Prime numbers between 1 and #{n}: #{prime_numbers.join(', ')}"
end


