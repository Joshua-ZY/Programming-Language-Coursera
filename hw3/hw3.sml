(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals strs =
  List.filter (fn x => Char.isUpper(String.sub(x,0))) strs

fun longest_string1 strs =
  foldl (fn (new, old) => if String.size(new) > String.size(old) then new else old) "" strs
	
fun longest_string2 strs =
  foldl (fn (new, old) => if String.size(new) >= String.size(old) then new else old) "" strs
	
fun longest_string_helper f strs =
  foldl (fn (new, old) => if f (String.size(new), String.size(old)) then new else old) "" strs

val longest_string3 = longest_string_helper (fn (x, y) => x > y)
val longest_string4 = longest_string_helper (fn (x, y) => x >= y)
val longest_capitalized = longest_string1 o only_capitals

fun rev_string str =
  (String.implode o List.rev o String.explode) str
					     
fun first_answer f ls =
  case ls of
      [] => raise (NoAnswer)
    | head::tail => case f head of
			NONE => first_answer f tail
		      | SOME v => v

fun all_answers f ls =
  let fun aux (f, ls, acc) =
	case ls of
	    [] => SOME acc
	  | head::tail => case f head of
			      NONE => NONE
			    | SOME v => aux(f, tail, acc@v)
  in
      aux(f, ls, [])
  end

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

fun count_wildcards pat =
  g (fn _ => 1) (fn _ => 0) pat
    
fun count_wild_and_variable_lengths pat =
  g (fn _ => 1) (fn x => String.size(x)) pat

fun count_some_var (str, pat) =
  g (fn _=> 0) (fn x => if x = str then 1 else 0) pat

fun check_pat pat =
  let fun all_str pat = 
	case pat of
	    Wildcard => []
	  | Variable x => [x]
	  | TupleP ps => List.foldl (fn (p, lisacc) => lisacc@(all_str p)) [] ps
	  | ConstructorP (_,p) => all_str p
	  | _ => []
      fun same_str str =
	case str of
	    [] => true
	  | head::tail => if List.exists (fn x => x = head) tail then false else same_str tail
  in
      same_str(all_str pat)
  end
      
fun match vp_pair =
  case vp_pair of
      (_, Wildcard) => SOME []
    | (v, Variable s) => SOME [(s,v)]
    | (Unit, UnitP) => SOME []
    | (Const i, ConstP j) => if i = j then SOME [] else NONE
    | (Tuple vs, TupleP ps) => if List.length(vs) = List.length(ps) then all_answers match (ListPair.zip(vs,ps)) else NONE
    | (Constructor (s2,v), ConstructorP(s1,p)) => if s1 = s2 then match(v,p) else NONE
    | _ => NONE

fun first_match value lis_pat =
  SOME(first_answer (fn x => match (value, x)) lis_pat) handle NoAnswer => NONE
