module Chapter3Ex where

{-
    3.1 Give another version of the definition of 'exclusive or' which works informally like this:
    'exclusive or of x and y will be True if either x is True and y is False or x is False and y is True'.
-}

exOr :: Bool -> Bool -> Bool
exOr x y
    | x && not y = True
    | not x && y = True
    | otherwise = False

{-
    3.2 Give the 'box and line' diagram corresponding to your answer to the previous question
-}

{-
    x   y   |   x `exOr` y
    -----------------------
    T   T   |       F
    T   F   |       T
    F   T   |       T
    F   F   |       F
-}