val test1 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test2 = remove_card ([(Hearts, Ace),(Hearts, Ace),(Hearts, Ace),(Spades, Num 5)], (Hearts, Ace), IllegalMove) = [(Hearts, Ace),(Hearts, Ace),(Spades,Num 5)]
val test4 = remove_card ([(Hearts, Ace),(Diamonds, Queen),(Clubs, King),(Spades,Num 5)], (Clubs, King), IllegalMove) = [(Hearts, Ace),(Diamonds, Queen),(Spades,Num 5)]
val test6 = remove_card ([(Hearts, Ace),(Diamonds, Queen),(Clubs, King),(Spades,Num 5)], (Diamonds, Queen), IllegalMove) = [(Hearts, Ace),(Clubs, King),(Spades,Num 5)]
