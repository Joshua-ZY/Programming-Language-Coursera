val test1 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test2 = score ([(Hearts, Num 2),(Clubs, Num 4),(Spades, King)],10) = 18
val test3 = score ([(Hearts, Num 2),(Clubs, Num 4),(Spades, King),(Spades, Ace)],10) = 51
val test4 = score ([(Hearts, Num 2),(Hearts, Num 4),(Hearts, King),(Hearts, Ace)],10) = 25
val test5 = score ([(Hearts, Num 2),(Hearts, Num 4)],10) = 2
val test6 = score ([],10) = 5
val test7 = score ([(Hearts, Ace),(Hearts, Num 4)],16) = 0
val test8 = score ([(Hearts, Ace),(Hearts, Num 4)],17) = 1
