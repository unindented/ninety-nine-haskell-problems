module Run where

-- |
-- Compute Fibonacci numbers.
--
-- >>> fib 5
-- 5
--
-- >>> fib 10
-- 55
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
