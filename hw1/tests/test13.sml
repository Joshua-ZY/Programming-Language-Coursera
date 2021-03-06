val test1 = dates_in_months_challenge ([(2012,2,28),(2013,12,1)],[2,2,2,2]) = [(2012,2,28)]
val test2 = dates_in_months_challenge ([(2012,2,28),(2013,12,1)],[1,1]) = []
val test3 = dates_in_months_challenge ([(2012,2,28),(2013,12,1)],[12]) = [(2013,12,1)]
val test4 = dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2013,12,2),(2013,12,3),(2014,12,1),(2813,12,1)],[12]) = [(2013,12,1),(2013,12,2),(2013,12,3),(2014,12,1),(2813,12,1)]
val test5 = dates_in_months_challenge ([],[2,2,2]) = []
val test6 = dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,2,2,2,2,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test7 = dates_in_months_challenge ([(2018,2,25),(2014,2,5),(2024,2,1),(2012,2,10),(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[4,4,2,4,3,4,3,3]) = [(2018,2,25),(2014,2,5),(2024,2,1),(2012,2,10),(2012,2,28),(2011,3,31),(2011,4,28)]
val test8 = dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[7,8,9,7,8,9,9,8,7]) = []
val test9 = dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[12,12,12]) = [(2013,12,1)]