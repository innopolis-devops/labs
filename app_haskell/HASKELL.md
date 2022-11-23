# General
Some useful guidlines are given in the language [wiki](https://wiki.haskell.org/Programming_guidelines)

Other than that,
1. Use [hlint](https://github.com/ndmitchell/hlint)
2. Add even unnacessary type annotation as means of documentation
3. Use *newtype* wrappers to make functions more specific and reduce risk of possible mistakes (e.g. Fahrenheit to Celsius instead of Integer to Integer)

# Framework
Advantages:
1. Safety and efficience
2. Ease of use
