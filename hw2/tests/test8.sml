val test1 = all_same_color [(Hearts, Ace)] = true
val test2 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val test3 = all_same_color [(Hearts, Ace), (Diamonds, Ace),(Diamonds,Num 8),(Diamonds,Num 5),(Diamonds,Num 10)] = true
val test4 = all_same_color [(Spades, Ace), (Clubs, Ace),(Clubs, Queen),(Clubs, King),(Clubs, Jack),(Clubs, Num 10)] = true
val test5 = all_same_color [(Hearts, Ace), (Spades, Ace), (Clubs, Ace),(Clubs, Queen),(Clubs, King),(Clubs, Jack),(Clubs, Num 10)] = false
val test6 = all_same_color [(Hearts, Ace), (Diamonds, Ace),(Diamonds,Num 8),(Spades, Ace), (Diamonds,Num 5),(Diamonds,Num 10)] = false
