val test1 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val test2 = get_substitutions2 ([["foo"],["there","foo"]], "foo") = ["there"]
val test3 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") = ["Fredrick","Freddie","F"]
val test4 = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"]
val test5 = get_substitutions2 ([["foo"],["there"]], "foo123") = []

