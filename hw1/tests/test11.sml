val test1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test2 = oldest([]) = NONE
val test3 = oldest([(2010,2,28),(2011,3,31),(2011,4,28)]) = SOME (2010,2,28)
val test4 = oldest([(2012,2,28),(2010,3,31),(2011,4,28)]) = SOME (2010,3,31)
val test5 = oldest([(2012,2,28),(2011,3,31),(2010,4,28)]) = SOME (2010,4,28)
val test6 = oldest([(2012,2,28),(2012,3,28),(2012,3,29)]) = SOME (2012,2,28)