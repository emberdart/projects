module Main (main) where

{-
Index Start = 1
Last Int = n (4)
Take [1..n]
Randomly permute/shuffle
Starting at natural index Start, count until either
index = n, then remove that card and start counting from Index Start again
there are no cards left (win)
the largest card is less than n

What can we infer?

Smallest 1 = always win

2 = 1/2
2 = [1,2] (win because you remove 1 and start again at 1, so that you count 2 again at 2?) or [2,1] (loss because you'd count i=1,n=2, i=2,n=1, i=3,HIGHEST<3, fail)
...
What happens to the rest?

3 (2/6 = 1/3)
[1,2,3] -> [1:2,3] -> loss
[1,3,2] -> [1:3,2] -> [3] -> win
[2,1,3] -> [1:2,1] -> loss
[2,3,1] -> loss
[3,1,2] -> loss
[3,2,1] -> [3,1:1] -> [2:3] -> [3:3] -> win

it appears this will lose upon a derangement


-}