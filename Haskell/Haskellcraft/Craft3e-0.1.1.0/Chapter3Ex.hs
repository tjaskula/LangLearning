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

{-
    3.9 Define a function

    threeDifferent :: Integer -> Integer -> Integer -> Bool

    so that the result of threeDifferent m n p is True if all three of numbers m, n and p are different.

    What is your answer for ThreeDifferent 3 4 3? Explain why you get the answer that you do.
-}

threeDifferent :: Integer -> Integer -> Integer -> Bool
threeDifferent m n p = (m /= n) && (m /= p) && (n /= p)

{-
    A: Compares each pair of parameters to find if they are different and returns True if this is the case.
-}

{-
    3.10 This question is about the function

    fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool
    
    which returns the value True only if all four of its arguments are equal.

    Give a definition of fourEqual modelled on the definition of threeEqual above.
    Now give a definition of fourEqual which uses the function threeEqual in its definition. Compare your two answers.
-}

threeEqual :: Integer -> Integer -> Integer -> Bool
threeEqual m n p = (m == n) && (n == p)

fourEqual1 :: Integer -> Integer -> Integer -> Integer -> Bool
fourEqual1 m n p o = (m == n) && (n == p) && (p == o)

fourEqual2 :: Integer -> Integer -> Integer -> Integer -> Bool
fourEqual2 m n p o = (threeEqual m n p) && (threeEqual n p o)

{-
    3.11 Give line-by-line calculations of

    threeEqual (2 + 3) 5 (11 `div` 2)
    mystery (2 + 4) 5 (11 `div` 2)
    threeDifferent (2 + 4) 5 (11 `div` 2)
    fourEqual (2 + 3) 5 (11 `div` 2) (21 `mod` 11)
-}

{-
    A:

    threeEqual: True
    mystery: True
    threeDifferent: False
    fourEqual: False
-}

{-
    3.12 Define QuickCheck tests for the functions that you have defined here.
-}

-- mystery
prop_mystery :: Integer -> Integer -> Integer -> Bool

prop_mystery m n p =
    (mystery m n p) == not (threeEqual m n p)

-- threeDifferent
prop_threeDifferent :: Integer -> Integer -> Integer -> Bool

prop_threeDifferent m n p =
    (threeDifferent m n p) == (m /= n) && (n /= p) && (p /= m)

-- fourEqual
prop_fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool

prop_fourEqual m n p o =
    (fourEqual1 m n p o) == (fourEqual2 o p n m)