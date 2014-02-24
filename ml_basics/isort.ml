let notempty li = if (li = []) then false else true;;

let rec last li = if (List.tl li)=[] then List.hd li else last (List.tl li);;

let rec insert x li = match li with
	[] -> [x]
	| hd::tl -> if x < (List.hd li) then x::li else (List.hd li) :: insert x (List.tl li);;

let rec dequeue q = if((notempty q) && notempty(List.tl q)) then ((List.hd q) :: (dequeue (List.tl q))) else [];;
 
let rec sort q = if notempty q then (insert (last q) (sort (dequeue q))) else [];;   
