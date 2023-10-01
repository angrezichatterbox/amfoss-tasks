import System.IO

isPrime :: Int -> Bool
isPrime n
    | n <= 1 = False
    | n <= 3 = True
    | n `mod` 2 == 0 || n `mod` 3 == 0 = False
    | otherwise = checkPrime n 5
    where
        checkPrime num divisor
            | divisor * divisor > num = True
            | num `mod` divisor == 0 || num `mod` (divisor + 2) == 0 = False
            | otherwise = checkPrime num (divisor + 6)
findPrimesUpToN :: Int -> [Int]
findPrimesUpToN n = filter isPrime [2..n]

main :: IO ()
main = do
    putStr "Enter a value for n: "
    hFlush stdout
    input <- getLine
    let n = read input :: Int
    let primes = findPrimesUpToN n
    putStrLn $ "Prime numbers up to " ++ show n ++ ": " ++ show primes

