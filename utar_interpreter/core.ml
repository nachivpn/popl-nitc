open Format
open Syntax
open Support.Error
open Support.Pervasive

(* ------------------------   EVALUATION  ------------------------ *)

exception NoRuleApplies

let rec isnumericval t = match t with
    TmZero(_) -> true
  | TmSucc(_,t1) -> isnumericval t1
  | _ -> false


let rec isval t = match t with
    TmTrue(_)  -> true
  | TmFalse(_) -> true
  | t when isnumericval t  -> true
  | _ -> false

let rec eval1 t = match t with
    TmIf(_,TmTrue(_),t2,t3) ->
      t2
  | TmIf(_,TmFalse(_),t2,t3) ->
      t3
  | TmIf(fi,t1,t2,t3) ->
      let t1' = eval1 t1 in
      TmIf(fi, t1', t2, t3)
  | TmSucc(fi,t1) ->
      let t1' = eval1 t1 in
      TmSucc(fi, t1')
  | TmPred(_,TmZero(_)) ->
      TmZero(dummyinfo)
  | TmPred(_,TmSucc(_,nv1)) when (isnumericval nv1) ->
      nv1
  | TmPred(fi,t1) ->
      let t1' = eval1 t1 in
      TmPred(fi, t1')
  | TmIsZero(_,TmZero(_)) ->
      TmTrue(dummyinfo)
  | TmIsZero(_,TmSucc(_,nv1)) when (isnumericval nv1) ->
      TmFalse(dummyinfo)
  | TmIsZero(fi,t1) ->
      let t1' = eval1 t1 in
      TmIsZero(fi, t1')
  | TmNot(_,TmTrue(_)) ->
	TmFalse(dummyinfo)
  | TmNot(_,TmFalse(_)) ->
	TmTrue(dummyinfo)
  | TmNot(fi,t1) ->
	let t1' = eval1 t1 in
	TmNot(fi,t1')
  | TmAnd(_,TmTrue(_),TmFalse(_)) ->
	TmFalse(dummyinfo)
  | TmAnd(_,TmFalse(_),TmTrue(_)) ->
	TmFalse(dummyinfo)
  | TmAnd(_,TmFalse(_),TmFalse(_)) ->
	TmFalse(dummyinfo)
  | TmAnd(_,TmTrue(_),TmTrue(_)) ->
	TmTrue(dummyinfo)
  | TmAnd(fi,nv1,t2) when (isval nv1) ->
	let t2' = eval1 t2 in
	TmAnd(fi,nv1,t2')
  | TmAnd(fi,t1,t2) ->
	let t1' = eval1 t1 in
	TmAnd(fi,t1',t2)
  | TmOr(_,TmTrue(_),TmFalse(_)) ->
	TmTrue(dummyinfo)
  | TmOr(_,TmFalse(_),TmTrue(_)) ->
	TmTrue(dummyinfo)
  | TmOr(_,TmFalse(_),TmFalse(_)) ->
	TmFalse(dummyinfo)
  | TmOr(_,TmTrue(_),TmTrue(_)) ->
	TmTrue(dummyinfo)
  | TmOr(fi,nv1,t2) when (isval nv1) ->
	let t2' = eval1 t2 in
	TmOr(fi,nv1,t2')  
  | TmOr(fi,t1,t2) ->
	let t1' = eval1 t1 in
	TmOr(fi,t1',t2)
  | _ -> 
      raise NoRuleApplies

let rec eval t =
  try let t' = eval1 t
      in eval t'
  with NoRuleApplies -> t
