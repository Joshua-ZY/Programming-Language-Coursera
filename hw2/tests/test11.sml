val test1 = officiate ([(Hearts, Num 2),(Clubs, Num 4),(Spades, Num 8),(Diamonds, Queen),(Spades, Ace)],[Draw], 15) = 6
val test2 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6
val test3 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[], 15) = 7
val test4 = officiate ([(Hearts, Num 2),(Clubs, Num 4),(Spades, Num 8),(Diamonds, Queen),(Spades, Ace)],[Draw, Draw, Discard (Hearts, Num 2)], 15) = 5
val test5 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw,Draw,Draw,Draw], 15) = 9
val test6 = officiate ([(Hearts, Num 2),(Clubs, Num 4),(Spades, Num 8),(Diamonds, Queen),(Spades, Ace)],[Draw, Draw, Draw, Draw,Draw], 30) = 15
val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)