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
