val test1 = number_in_month ([(2012,3,28),(2013,12,1)],2) = 0
val test2 = number_in_month ([(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1)],2) = 5
val test3 = number_in_month ([(2012,2,28),(2013,12,1),(2013,6,1),(2014,6,1),(2015,6,22)],6) = 3
val test4 = number_in_month ([(2012,2,28),(2013,12,1)],10) = 0
val test5 = number_in_month ([(2012,2,28),(2013,12,1),(2013,11,1),(2011,12,11)],11) = 1
val test6 = number_in_month ([(2012,2,28),(2013,12,1)],12) = 1
val test7 = number_in_month ([],12) = 0