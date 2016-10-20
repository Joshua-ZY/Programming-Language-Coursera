val test9a1 = count_wildcards Wildcard = 1
val test9a2 = count_wildcards (Variable "123123") = 0
val test9a3 = count_wildcards UnitP = 0
val test9a4 = count_wildcards (ConstP 123) = 0
val test9a5 = count_wildcards (TupleP [Wildcard, Wildcard, Wildcard, Variable "123123", UnitP, ConstP 123, ConstructorP ("123", Wildcard)]) = 4
val test9a6 = count_wildcards (ConstructorP ("123", ConstructorP ("123", Wildcard))) = 1

val test9b1 = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b2 = count_wild_and_variable_lengths Wildcard = 1
val test9b3 = count_wild_and_variable_lengths (Variable "123123") = 6
val test9b4 = count_wild_and_variable_lengths UnitP = 0
val test9b5 = count_wild_and_variable_lengths (ConstP 123) = 0
val test9b6 = count_wild_and_variable_lengths (TupleP [Wildcard, Wildcard, Wildcard, Variable "123123", UnitP, ConstP 123, ConstructorP ("123", Wildcard)]) = 10
val test9b7 = count_wild_and_variable_lengths (ConstructorP ("123", ConstructorP ("123", Wildcard))) = 1

val test91 = count_some_var ("x", Wildcard) = 0
val test92 = count_some_var ("123123", Variable "123123") = 1
val test93 = count_some_var ("123", TupleP [Wildcard, Wildcard, Wildcard, Variable "123", UnitP, ConstP 123, ConstructorP ("123", Wildcard)]) = 1
val test94 = count_some_var ("x", Variable("x")) = 1
val test95 = count_some_var ("x",ConstructorP ("123", ConstructorP ("123", Wildcard)))= 0
val test96 = count_some_var ("123", TupleP [Wildcard, TupleP [Variable "123", Variable "123"], Wildcard, Variable "123", UnitP, ConstP 123, ConstructorP ("123", Wildcard)]) = 3
