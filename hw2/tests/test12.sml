val test1 =  score_challenge([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], 42) =  3 
val test2 =  score_challenge([(Diamonds,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], 42) =  6 
val test3 =  score_challenge([(Diamonds,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], 5) =  1 
val test4 =  score_challenge([(Diamonds,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], 25) =  1 
val test5 =  score_challenge([(Diamonds,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], 35) =  1
val test6 =  score_challenge([(Diamonds,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], 41) =  7 

val test7 = officiate_challenge ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3