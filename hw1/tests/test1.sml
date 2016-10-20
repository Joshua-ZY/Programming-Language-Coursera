val test1 = is_older ((1,2,3),(2,3,4)) = true
val test2 = is_older ((2016,3,5),(2016,5,1)) = true
val test3 = is_older ((2017,3,5),(2016,5,1)) = false
val test4 = is_older ((2016,3,5),(2016,3,1)) = false
val test5 = is_older ((2016,3,5),(2016,3,5)) = false
val test6 = is_older ((2016,3,5),(2017,1,1)) = true
