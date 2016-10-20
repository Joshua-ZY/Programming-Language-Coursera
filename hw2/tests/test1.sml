val test1 = all_except_option ("string", ["string"]) = SOME []
val test2 = all_except_option ("abc", ["123","string","abc","xyz"]) = SOME ["123","string","xyz"]
val test3 = all_except_option ("abc", ["123","string","xyz"]) = NONE
