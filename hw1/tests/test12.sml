val test1 = number_in_months_challenge ([(2012,3,28),(2013,12,1)],[2,2,2,2,2]) = 0
val test2 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1)],[2,2,2,2]) = 5
val test3 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2013,6,1),(2014,6,1),(2015,6,22)],[6,6,6]) = 3
val test4 = number_in_months_challenge ([(2012,2,28),(2013,12,1)],[10]) = 0
val test5 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2013,11,1),(2011,12,11)],[11,11]) = 1
val test6 = number_in_months_challenge ([(2012,2,28),(2013,12,1)],[12]) = 1
val test7 = number_in_months_challenge ([],[12,12]) = 0
val test8 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,3,4]) = 3
val test9 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1)],[12,2,12,12]) = 10
val test10 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1),(2012,2,28),(2013,12,1)],[2,12,5,12,8]) = 10
val test11 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2013,11,1),(2011,12,11)],[12,2,2,2,2]) = 3