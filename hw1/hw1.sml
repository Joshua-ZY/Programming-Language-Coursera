fun is_older (d1 : int * int * int, d2 : int * int * int) =
  if (#1 d1) <> (#1 d2)
  then (#1 d1) < (#1 d2)
  else if (#2 d1) <> (#2 d2)
  then (#2 d1) < (#2 d2)
  else if (#3 d1) <> (#3 d2)
  then (#3 d1) < (#3 d2)
  else false
	     
fun number_in_month (dates : (int * int * int) list, month : int) =
  if null dates
  then 0
  else
      if (#2 (hd dates)) = month
      then 1 + number_in_month (tl dates, month)
      else number_in_month (tl dates, month)

fun number_in_months (dates : (int * int * int) list, months : int list) =
  if null months
  then 0
  else number_in_month (dates, hd months) + number_in_months (dates, tl months)
     
fun dates_in_month (dates : (int * int * int) list, month : int) =
  if null dates
  then []
  else
      if #2 (hd dates) = month
      then (hd dates) :: dates_in_month (tl dates,month)
      else dates_in_month (tl dates,month)
			 
fun dates_in_months (dates : (int * int * int) list, months : int list) =
  if null months
  then []
  else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth (strs : string list, n : int) =
  if n = 1
  then hd strs
  else get_nth(tl strs, n - 1)
	      
fun date_to_string (date : int*int*int) =
  get_nth(["January", "February", "March", "April","May", "June", "July", "August", "September", "October", "November", "December"],#2 date)
  ^ " " ^  Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)

fun number_before_reaching_sum (sum : int, nums : int list) =
  if hd nums < sum
  then 1 +  number_before_reaching_sum (sum - hd nums, tl nums)
  else 0

fun what_month (day : int) =
  number_before_reaching_sum(day, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) + 1
      
fun month_range(day1 : int, day2 : int) =
  if day1 > day2
  then []
  else what_month(day1) :: month_range(day1 + 1, day2)

fun oldest1 (dates : (int * int * int) list) =
    if null dates
    then (0,0,0)
    else
	let val ans = oldest1(tl dates)
	in
	    if is_older(hd dates, ans)
	    then ans
	    else hd dates
	end
		
		   
fun oldest (dates : (int * int * int) list) =
    if null dates
    then NONE
    else
	let val ans = oldest(tl dates)
	in
	    if isSome ans
	    then if is_older(hd dates, valOf(ans))
		 then SOME(hd dates)
		 else ans			  
	    else SOME(hd dates)
	end

fun number_in_months_challenge (dates : (int * int * int) list, months : int list) =
  let
      fun months_reduce (monthlist : int list) =
	let
	    fun if_exist (mon : int, monlist : int list) =
	    (*decide if a number exist in a list*)
	      if null monlist
	      then false
	      else
		  if mon = hd monlist
		  then true
		  else if_exist(mon, tl monlist)
	in
	    if null monthlist
	    then []
	    else
		let val ans = months_reduce(tl monthlist)
		in
		    if if_exist (hd monthlist, ans)
		    then ans
		    else (hd monthlist) :: ans
		end
	end
  in
      number_in_months(dates, months_reduce(months))
  end
		      
fun dates_in_months_challenge (dates : (int * int * int) list, months : int list) =
  let
      fun months_reduce (monthlist : int list) =
	let
	    fun if_exist (mon : int, monlist : int list) =
	    (*decide if a number exist in a list*)
	      if null monlist
	      then false
	      else
		  if mon = hd monlist
		  then true
		  else if_exist(mon, tl monlist)
	in
	    if null monthlist
	    then []
	    else
		let val ans = months_reduce(tl monthlist)
		in
		    if if_exist (hd monthlist, ans)
		    then ans
		    else (hd monthlist) :: ans
		end
	end
  in
      dates_in_months(dates, months_reduce(months))
  end

fun reasonable_date (date : int * int * int) =
  let
      fun get_nth_int (nums : int list, n : int) =
	if n = 1
	then hd nums
	else get_nth_int(tl nums, n - 1)
  in
      if #1 date > 0
      then
	  if #2 date >= 1 andalso #2 date <= 12
	  then
	      if #1 date mod 400 = 0 orelse (#1 date mod 4 = 0 andalso #1 date mod 100 <> 0)
						(* leap year *)
	      then #3 date <= get_nth_int ([31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], #2 date) andalso #3 date > 0
 	      else #3 date <= get_nth_int ([31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], #2 date) andalso #3 date > 0
	  else false
      else false
  end
      
	   
					  
		  
