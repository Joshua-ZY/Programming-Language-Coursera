(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
  s1 = s2
	  
fun all_except_option (str, strs) =
  case strs of
      [] => NONE
    | head::tail => if same_string(head, str)
		    then SOME(tail)
		    else
			let val remainopt = all_except_option (str, tail)
			in
			    case remainopt of
				NONE => NONE
			      | SOME remainlist => SOME(head::remainlist)
			end
			    
fun get_substitutions1 (strss, str) =
  case strss of
      [] => []
    | hdlis::restlis => case all_except_option(str, hdlis) of
			    NONE => get_substitutions1(restlis, str)
			  | SOME lis => lis @ get_substitutions1(restlis, str)

fun get_substitutions2 (strss, str) =
  let fun rest_list (strs, str, acc) =
	case strs of
	    [] => []
	  | head::tail => if same_string(head, str)
			  then acc @ tail
			  else rest_list (tail, str, head::acc)
  in
      case strss of
	  [] => []
	| headlis::restlis => rest_list(headlis, str, []) @ get_substitutions2(restlis, str)
  end

fun similar_names (strss, {first = x1, middle = x2, last = x3}) =
  let fun form_names (strs, {first = x1, middle = x2, last = x3}) =
	case strs of
	    [] => []
	  | head::tail => {first = head, middle = x2, last = x3} :: form_names (tail, {first = x1, middle = x2, last = x3})
  in {first = x1, middle = x2, last = x3} :: form_names (get_substitutions1(strss, x1), {first = x1, middle = x2, last = x3})
  end

      
(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun card_color (s, r) =
  case s of
      Clubs => Black
    | Spades => Black
    | _ => Red

fun card_value (suit,rank) =
  case rank of
      Num i => i
    | Ace => 11
    | _ => 10

fun remove_card (cs, c, e) =
  case cs of
      [] => raise e
    | head::tail => if head = c then tail else head::remove_card(tail, c, e)
								
fun all_same_color (cards) =
  case cards of
      [] => true
    | _ :: [] => true
    | first :: second :: rest => card_color(first)= card_color(second) andalso all_same_color(second::rest)

fun sum_cards (cards) =
  let fun aux (cards, acc) =
	case cards of
	    [] => acc
	  | head::tail => aux (tail, acc + card_value(head))
  in
      aux (cards, 0)
  end
      
fun score (cards, goal) =
  let val pre_score =
      let val sum = sum_cards(cards) in
	  if sum > goal then 3*(sum - goal) else goal - sum
      end
  in
      if all_same_color(cards)
      then pre_score div 2
      else pre_score
  end

fun officiate (cards, moves, goal) =
  let fun officiate_helper (cardlis, movelis, goal, holdlis) =
      case movelis of
	  [] => score (holdlis, goal)
	| head1::tail1 => case head1 of
			    Discard c => officiate_helper (cardlis, tail1, goal, remove_card(holdlis, c, IllegalMove))
			  | Draw => case cardlis of
					[] => score (holdlis, goal)
				      | head2::tail2 => let val sum = sum_cards(head2::holdlis) in
							    if sum > goal
							    then score (head2::holdlis, goal)
							    else officiate_helper (tail2, tail1, goal, head2::holdlis)
							end
  in
      officiate_helper (cards, moves, goal, [])
  end
      
fun score_challenge (cards, goal) =
  let fun pre_score (cards, goal, sum) =
	case cards of
	    [] =>  if sum > goal then 3*(sum - goal) else goal - sum
	  | (r, s)::tail => if s = Ace
			    then let val score1 = pre_score (tail, goal, sum - 10); val score2 = pre_score (tail, goal, sum)
				 in
				     if score1 < score2
				     then score1
				     else score2
				 end
			    else pre_score (tail, goal, sum)					 
  in
      if all_same_color(cards)
      then pre_score (cards, goal, sum_cards (cards)) div 2
      else pre_score (cards, goal, sum_cards (cards)) 
  end
												    
fun officiate_challenge (cards, moves, goal) =
  let fun officiate_helper (cardlis, movelis, goal, holdlis) =
      case movelis of
	  [] => score (holdlis, goal)
	| head1::tail1 => case head1 of
			    Discard c => officiate_helper (cardlis, tail1, goal, remove_card(holdlis, c, IllegalMove))
			  | Draw => case cardlis of
					[] => score_challenge (holdlis, goal)
				      | head2::tail2 => let val sum = sum_cards(head2::holdlis) in
							    if sum > goal
							    then score (head2::holdlis, goal)
							    else officiate_helper (tail2, tail1, goal, head2::holdlis)
							end
  in
      officiate_helper (cards, moves, goal, [])
  end


fun careful_player (cards, goal) =
  let fun careful_player_helper (cards, goal, holds, moves) =
	case cards of
	    [] => moves
	  | head::tail => let fun card_of_value (holdlist, value) =
				case holdlist of
				    [] => NONE
				  | head::tail => if card_value(head) = value 
						  then SOME(head)
						  else card_of_value (tail, value)
			  in
			      let val sumhold = sum_cards(holds)
			      in
				  
				  if card_value(head) + sumhold > goal
				  then case card_of_value (holds, sumhold + card_value(head) - goal) of
					   NONE => moves
					 | SOME card => moves @ [Discard card, Draw]
				  else if card_value(head) + sumhold = goal
				  then moves @ [Draw]
				  else if sumhold + 10 < goal
				  then careful_player_helper (tail, goal, head::holds, moves@[Draw])						   
				  else moves @ [Draw]					      
			      end
			  end			      
  in
      careful_player_helper (cards, goal, [], [])
  end
      
				   
				     

						      


      
			      
		  
