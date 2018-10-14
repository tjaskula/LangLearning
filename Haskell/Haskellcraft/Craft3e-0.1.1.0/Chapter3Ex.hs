module Chapter3Ex where
import Prelude hiding ((||), (&&))

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

{-
    3.3 Using literals on the left-hand side we can make the truth table for a function into its Haskell definition.
    Complete the following definition of exOr in this style.

    exOr True True  = ...
    exOr True False = ...
-}

{-
    exOr True True   = False
    exOr True False  = True
    exOr False True  = True
    exOr False False = False
-}

{-
    3.4 Give your own definition of the built-in && and ||. If you want to use the same operator for &&, say, you will
    to make sure you hide its import. You can do this by adding it to the list of what is hidden, thus:

    import Prelude hiding (max, (&&))

    after the module declaration at the start of the Chapter3Ex module.
-}

(&&) :: Bool -> Bool -> Bool
(&&) True y     = y
(&&) False _    = False

(||) :: Bool -> Bool -> Bool
(||) True _     = True
(||) False y    = y

{-
    3.5 Give two different definitions of the nAnd function

    nAnd :: Bool -> Bool -> Bool

    which returns the result True except when both its arguments are True. Give a diagram illustrating one of your
    definitions.
-}

nAnd1 :: Bool -> Bool -> Bool
nAnd1 True y    = True `exOr` y
nAnd1 False _   = True

nAnd2 :: Bool -> Bool -> Bool
nAnd2 x y = not (x && y)

{-
    nAnd2 True True   = False
    nAnd2 True False  = True
    nAnd2 False True  = True
    nAnd2 False False = True
-}