val test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test2 = only_capitals ["AbcadESD","BDfdfe","CDFEEFD"] = ["AbcadESD","BDfdfe","CDFEEFD"]
val test3 = only_capitals ["aaAEed","Bdfefv","AsdC"] = ["Bdfefv","AsdC"]
val test4 = only_capitals [] = []
val test5 = only_capitals ["23432A","sdfeB","CsdfeEF"] = ["CsdfeEF"]
val test6 = only_capitals ["dsfefA","Befe","sadfCasdf"] = ["Befe"]

