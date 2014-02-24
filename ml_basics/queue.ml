(*
Functions to 
	->add to 
	->delete from
	->print the contents 
of a queue
*)

let enqueue q l = q::l;;

let ret = fun x -> x;;

let notempty li = if (li = []) then false else true;;

let rec dequeue q = if((notempty q) && notempty(List.tl q)) then ((List.hd q) :: (dequeue (List.tl q))) else [];;

let print q = List.map ret q;;


