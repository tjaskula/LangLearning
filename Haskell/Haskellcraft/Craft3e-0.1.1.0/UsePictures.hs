module UsePictuers where
import Pictures

whiteHorse :: Picture
whiteHorse = invertColour horse

rotateHorse :: Picture
rotateHorse = rotate horse

-- white black above black white
ex1 :: Picture
ex1 = (white `beside` black) `above` (black `beside` white)

ex2 :: Picture
ex2 = (white ++ black) `beside` (black ++ white)

-- board
board :: Picture
board = ((ex2 `beside` ex2 `beside` ex2 `beside` ex2) ++ (ex2 `beside` ex2 `beside` ex2 `beside` ex2))
        ++ ((ex2 `beside` ex2 `beside` ex2 `beside` ex2) ++ (ex2 `beside` ex2 `beside` ex2 `beside` ex2))

-- Horse variants
h1 :: Picture
h1 = ((flipV horse) `beside` (flipV whiteHorse)) ++ ((flipV whiteHorse) `beside` (flipV horse))

h2 :: Picture
h2 = ((flipV horse) `beside` (flipV whiteHorse)) ++ (whiteHorse `beside` horse)

h3 :: Picture
h3 = ((flipV horse) `beside` (flipV whiteHorse)) ++ ((rotate (flipV whiteHorse)) `beside` (rotate (flipV horse)))

-- another variant
variant :: Picture
variant = ((flipV horse) `beside` (flipV whiteHorse)) ++ ((rotate  whiteHorse) `beside` (rotate horse))