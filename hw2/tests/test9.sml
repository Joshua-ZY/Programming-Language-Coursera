val test1 = sum_cards [(Clubs, Num 2),(Spades, Num 2)] = 4
val test2 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val test3 = sum_cards [(Clubs, Num 2),(Clubs, Num 2),(Hearts, Queen),(Diamonds, King)] = 24
val test4 = sum_cards [(Clubs, Num 2),(Clubs, Num 2),(Hearts, Ace),(Diamonds, King)] = 25
val test5 = sum_cards [(Hearts, Queen),(Diamonds, King),(Hearts, Ace)] = 31
val test6 = sum_cards [(Hearts, Ace),(Diamonds, Ace),(Clubs, Ace),(Spades, Ace)] = 44
val test7 = sum_cards [] = 0
val test8 = sum_cards [(Clubs, Num 5),(Spades, Num 9),(Spades, Num 6),(Spades, Ace)] = 31
