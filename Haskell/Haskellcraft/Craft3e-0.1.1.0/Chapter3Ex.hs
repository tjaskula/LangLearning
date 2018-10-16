module Chapter3Ex where
import Prelude hiding (and, or, (||), (&&))
import Test.QuickCheck

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
    x   y   |   x `nAnd1` y
    -----------------------
    T   T   |       F
    T   F   |       T
    F   T   |       T
    F   F   |       T
-}

{-
    3.6 Give line-by-line calculations of
    
    nAnd True True
    nAnd True False
    
    for eadch of your definitions of nAnd in the previous exercice.
-}

{-
    nAnd1 True True   = False
    nAnd1 True False  = True
    nAnd1 False True  = True
    nAnd1 False False = True

    nAnd2 True True   = False
    nAnd2 True False  = True
    nAnd2 False True  = True
    nAnd2 False False = True
-}

{-
    3.7 Write QuickCheck properties to test the functions you have written in the earlier
    exercices. You might be able to check one version of a function against another,
    or perhaps think up different properties for your functions.
-}

-- Test exOrs
exOr1 True  x = not x
exOr1 False x = x

prop_exOrs :: Bool -> Bool -> Bool

prop_exOrs x y =
    exOr x y == exOr1 x y

prop_exOr2 :: Bool -> Bool -> Bool

prop_exOr2 x y =
    exOr x y == (x /= y)

-- Test &&
prop_And :: Bool -> Bool -> Bool

and True True   = True
and _ _         = False

prop_And x y =
    x && y == and x y

-- Test ||
prop_Or :: Bool -> Bool -> Bool

or False y   = y
or x False   = x
or _ _       = True

prop_Or x y =
    x || y == or x y

-- Test nAnd1
prop_nAnd1 :: Bool -> Bool -> Bool

prop_nAnd1 x y =
    x `nAnd1` y == x `nAnd2` y

-- Test nAnd2
prop_nAnd2 :: Bool -> Bool -> Bool

prop_nAnd2 x y =
    x `nAnd2` y == x `nAnd1` y

{-
    3.8 Explain the effect of the function defined here:

    mystery :: Integer -> Integer -> Integer -> Bool
    mystery m n p = not ((m==n) && (n==p))
-}

mystery :: Integer -> Integer -> Integer -> Bool
mystery m n p = not ((m==n) && (n==p))

{-
    A: returns false if all arguments are equal
-}