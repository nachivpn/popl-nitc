(*
Insert and search operation on a binary search tree
*)

type btree= Empty | Node of int*btree*btree;;

let bst = ref Empty;;

let rec search_bst x t = match t with
	Empty -> "Not present"
	| Node(y,left,right) -> if x=y then "Present" else if x<y then (search_bst x left) else (search_bst x right) ;; 

let rec insert x t = match t with
	Empty -> Node(x, Empty, Empty)
	| Node(y,left,right) -> if x<y then Node(y,insert x left,right) else Node(y,left,insert x right);;

