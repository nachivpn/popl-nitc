/* Examples for testing */

pair unit unit; 
fst pair (lambda x:Bool.x) (lambda y:Bool.y) ;
let x = pair false true in fst x ;
let x = pair false true in snd x ;
