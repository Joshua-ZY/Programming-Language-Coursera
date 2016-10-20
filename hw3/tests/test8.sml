val test6 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8 = all_answers (fn x => if x = 2 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test10 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [2,3,4,5,6,7]
