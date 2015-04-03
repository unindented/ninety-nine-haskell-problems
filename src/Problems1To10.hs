module Problems1To10 where

import Data.List (foldl')

-- | Problem 1
-- Find the last element of a list.
--
-- >>> myLast [1,2,3,4]
-- 4
--
-- >>> myLast ['x','y','z']
-- 'z'
{-# ANN myLast "HLint: ignore Use last" #-}
myLast :: [a] -> a
myLast = head . reverse

-- | Problem 2
-- Find the last but one element of a list.
--
-- >>> myButLast [1,2,3,4]
-- 3
--
-- >>> myButLast ['x','y','z']
-- 'y'
myButLast :: [a] -> a
myButLast = last . init

-- | Problem 3
-- Find the K'th element of a list. The first element in the list is number 1.
--
-- >>> elementAt [1,2,3] 2
-- 2
--
-- >>> elementAt "haskell" 5
-- 'e'
elementAt :: [a] -> Int -> a
elementAt xs n = head $ drop (n-1) xs

-- | Problem 4
-- Find the number of elements of a list.
--
-- >>> myLength [123, 456, 789]
-- 3
--
-- >>> myLength "Hello, world!"
-- 13
myLength :: [a] -> Int
myLength = foldl' (\n -> const (n+1)) 0

-- | Problem 5
-- Reverse a list.
--
-- >>> myReverse [1,2,3,4]
-- [4,3,2,1]
--
-- >>> myReverse "A man, a plan, a canal, panama!"
-- "!amanap ,lanac a ,nalp a ,nam A"
myReverse :: [a] -> [a]
myReverse = foldl' (flip (:)) []
