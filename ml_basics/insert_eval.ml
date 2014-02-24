let rec insert x li = match li with
	[] -> x::[]
	| hd::tl -> if x < (List.hd li) then x::li else List.hd li :: insert x (List.tl li);;
