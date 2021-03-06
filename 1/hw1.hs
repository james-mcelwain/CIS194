{-# OPTIONS_GHC -Wall #-}
module HW01 where

-- Exercise 1 -----------------------------------------

-- Get the last digit from a number
lastDigit :: Integer -> Integer
lastDigit x = mod x 10


-- Drop the last digit from a number
dropLastDigit :: Integer -> Integer
dropLastDigit x = div (x - mod x 10) 10

toDigits :: Integer -> [Integer]
toDigits x
  | x <= 0    = []
  | otherwise = toDigits (div x 10) ++ [dropLastDigit x]

-- Exercise 2 -----------------------------------------

toRevDigits :: Integer -> [Integer]
toRevDigits x
  | x <= 0    = []
  | otherwise = lastDigit x : toDigits (dropLastDigit x)

-- Exercise 3 -----------------------------------------

-- Double every second number in a list starting on the left.
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther (x : y : xs) = x : y * 2 : doubleEveryOther xs
doubleEveryOther x = x

-- Exercise 4 -----------------------------------------

-- Calculate the sum of all the digits in every Integer.
sumDigits :: [Integer] -> Integer
sumDigits []            = 0
sumDigits (x : xs)      = x + sumDigits xs
{- OR
sumDigits xs            = foldr (+) 0  xs
sumDigis  xs            = sum xs
-}



-- Exercise 5 -----------------------------------------

-- Validate a credit card number using the above functions.
luhn :: Integer -> Bool
luhn x =
  let isValid = lastDigit . sumDigits . doubleEveryOther . toRevDigits
  in isValid x == 0

-- Exercise 6 -----------------------------------------

-- Towers of Hanoi for three pegs
type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi = undefined
