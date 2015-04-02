module Problems1To10 where

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
