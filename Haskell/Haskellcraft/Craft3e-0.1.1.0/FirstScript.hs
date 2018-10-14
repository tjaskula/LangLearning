{- #########################################################

        FirstScript.hs
        Simon Thompson, August 2010.

######################################################### -}

module FirstScript where

--      The value size is an integer (Integer), defined to be 
--      the sum of twelve and thirteen.

size :: Integer
size = 12+13

--      The function to square an integer.

square :: Integer -> Integer
square n = n*n

--      The function to double an integer.
        
double :: Integer -> Integer
double n = 2*n

--      An example using double, square and size.
         
example :: Integer
example = double (size - square (2+2))

--      Doubles its input and squares the result of that

doubleSquare :: Integer -> Integer
doubleSquare n = square (double n)

--      Square its input and doubles the result of that

squareDouble :: Integer -> Integer
squareDouble n = double (square n)