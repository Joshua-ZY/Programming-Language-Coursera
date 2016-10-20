val test1 = check_pat (Variable("x")) = true
val test2 = check_pat (TupleP [Wildcard, Wildcard, Wildcard, Variable "123123", Variable "123123", ConstP 123, ConstructorP ("123", Wildcard)]) = false
val test3 = check_pat (TupleP [Variable("x"),TupleP[Variable("x"),Variable("xu"),Variable("xyz")],Variable("xdd")]) = false
val test4 = check_pat (TupleP [Variable("x"),TupleP[Variable("x23"),Variable("xu"),Variable("xyz")],Variable("xdd")]) = true
