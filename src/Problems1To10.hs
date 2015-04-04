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

-- | Problem 6
-- Find out whether a list is a palindrome.
--
-- >>> isPalindrome [1,2,3]
-- False
--
-- >>> isPalindrome "madamimadam"
-- True
--
-- >>> isPalindrome [1,2,4,8,16,8,4,2,1]
-- True
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs

-- | Problem 7
-- Flatten a nested list structure.
--
-- >>> myFlatten (List [])
-- []
--
-- >>> myFlatten (Elem 5)
-- [5]
--
-- >>> myFlatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
-- [1,2,3,4,5]
myFlatten :: NestedList a -> [a]
myFlatten (Elem x) = [x]
myFlatten (List xs) = concatMap myFlatten xs

data NestedList a = Elem a | List [NestedList a]

-- | Problem 8
-- Eliminate consecutive duplicates of list elements.
--
-- >>> myCompress "aaaabccaadeeee"
-- "abcade"
myCompress :: (Eq a) => [a] -> [a]
myCompress = map head . myGroup

-- | Problem 9
-- Pack consecutive duplicates of list elements into sublists.
--
-- >>> myGroup ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
-- ["aaaa","b","cc","aa","d","eeee"]
myGroup :: (Eq a) => [a] -> [[a]]
myGroup [] = []
myGroup (x:xs) = (x:first) : myGroup rest
                 where (first, rest) = span (== x) xs

-- | Problem 10
-- Run-length encoding of a list.
--
-- >>> myEncode "aaaabccaadeeee"
-- [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
{-# ANN myEncode "HLint: ignore Use &&&" #-}
myEncode :: (Eq a) => [a] -> [(Int, a)]
myEncode = map (\x -> (length x, head x)) . myGroup
