use std::io;

fn is_prime(num: u32) -> bool {
    if num <= 1 {
        return false;
    }
    if num <= 3 {
        return true;
    }
    if num % 2 == 0 || num % 3 == 0 {
        return false;
    }

    let mut i = 5;
    while i * i <= num {
        if num % i == 0 || num % (i + 2) == 0 {
            return false;
        }
        i += 6;
    }

    true
}

fn find_primes_up_to_n(n: u32) -> Vec<u32> {
    let mut primes = Vec::new();
    for num in 2..=n {
        if is_prime(num) {
            primes.push(num);
        }
    }
    primes
}

fn main() {
    println!("Enter a value for n:");
    
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    
    let n: u32 = input.trim().parse().expect("Invalid input. Please enter a positive integer.");
    
    let primes = find_primes_up_to_n(n);

    println!("Prime numbers up to {}: {:?}", n, primes);
}

