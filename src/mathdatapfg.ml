(* Copyright (c) 2020-2023 CIIRC (Czech Institute of Informatics, Robotics and Cybernetics) / CTU (Czech Technical University) *)
(* Copyright (c) 2020 The Proofgold developers *)
(* Copyright (c) 2016 The Qeditas developers *)
(* Copyright (c) 2017-2018 The Dalilcoin developers *)
(* Distributed under the MIT software license, see the accompanying
   file COPYING or http://www.opensource.org/licenses/mit-license.php. *)

open Ser
open Sha256
open Hash

type stp =
| Base of int
| TpArr of stp * stp
| Prop

type trm =
| DB of int
| TmH of hashval
| Prim of int
| Ap of trm * trm
| Lam of stp * trm
| Imp of trm * trm
| All of stp * trm
| Ex of stp * trm
| Eq of stp * trm * trm

(** ** tp serialization ***)
let rec seo_tp o m c =
  match m with
  | TpArr(m0,m1) -> (*** 0 0 ***)
    let c = o 2 0 c in
    let c = seo_tp o m0 c in
    let c = seo_tp o m1 c in
    c
  | Prop -> (*** 0 1 ***)
    o 2 2 c
  | Base(x) when x < 65536 -> (*** 1 ***)
    let c = o 1 1 c in
    seo_varintb o x c
  | Base(_) -> raise (Failure("Invalid base type"))

let tp_to_str m =
  let c = Buffer.create 1000 in
  seosbf (seo_tp seosb m (c,None));
  Buffer.contents c

let hashtp m = hashtag (sha256str (tp_to_str m)) 64l

let rec sei_tp i c =
  let (b,c) = i 1 c in
  if b = 0 then
    let (b,c) = i 1 c in
    if b = 0 then
      let (m0,c) = sei_tp i c in
      let (m1,c) = sei_tp i c in
      (TpArr(m0,m1),c)
    else
      (Prop,c)
  else
    let (x,c) = sei_varintb i c in
    (Base(x),c)

(** ** tp list serialization ***)
let seo_tpl o al c = seo_list seo_tp o al c
let sei_tpl i c = sei_list sei_tp i c

let tpl_to_str al =
  let c = Buffer.create 1000 in
  seosbf (seo_tpl seosb al (c,None));
  Buffer.contents c

let hashtpl al =
  if al = [] then
    None
  else
    Some(hashtag (sha256str (tpl_to_str al)) 65l)

(** ** tm serialization ***)
let rec seo_tm o m c =
  match m with
  | TmH(h) -> (*** 000 ***)
    let c = o 3 0 c in
    let c = seo_hashval o h c in
    c
  | DB(x) when x >= 0 && x <= 65535 -> (*** 001 ***)
    let c = o 3 1 c in
    seo_varintb o x c
  | DB(x) ->
    raise (Failure "seo_tm - de Bruijn out of bounds");
  | Prim(x) when x >= 0 && x <= 65535 -> (*** 010 ***)
    let c = o 3 2 c in
    let c = seo_varintb o x c in
    c
  | Prim(x) ->
    raise (Failure "seo_tm - Prim out of bounds");
  | Ap(m0,m1) -> (*** 011 ***)
    let c = o 3 3 c in
    let c = seo_tm o m0 c in
    let c = seo_tm o m1 c in
    c
  | Lam(m0,m1) -> (*** 100 ***)
    let c = o 3 4 c in
    let c = seo_tp o m0 c in
    let c = seo_tm o m1 c in
    c
  | Imp(m0,m1) -> (*** 101 ***)
    let c = o 3 5 c in
    let c = seo_tm o m0 c in
    let c = seo_tm o m1 c in
    c
  | All(m0,m1) -> (*** 110 ***)
    let c = o 3 6 c in
    let c = seo_tp o m0 c in
    let c = seo_tm o m1 c in
    c
  | Ex(a,m1) -> (*** 111 0 ***)
    let c = o 4 7 c in
    let c = seo_tp o a c in
    let c = seo_tm o m1 c in
    c
  | Eq(a,m1,m2) -> (*** 111 1 ***)
    let c = o 4 15 c in
    let c = seo_tp o a c in
    let c = seo_tm o m1 c in
    let c = seo_tm o m2 c in
    c

let tm_to_str m =
  let c = Buffer.create 1000 in
  seosbf (seo_tm seosb m (c,None));
  Buffer.contents c

let hashtm m = hashtag (sha256str (tm_to_str m)) 66l

let rec sei_tm i c =
  let (x,c) = i 3 c in
  if x = 0 then
    let (h,c) = sei_hashval i c in
    (TmH(h),c)
  else if x = 1 then
    let (z,c) = sei_varintb i c in
    (DB(z),c)
  else if x = 2 then
    let (z,c) = sei_varintb i c in
    (Prim(z),c)
  else if x = 3 then
    let (m0,c) = sei_tm i c in
    let (m1,c) = sei_tm i c in
    (Ap(m0,m1),c)
  else if x = 4 then
    let (m0,c) = sei_tp i c in
    let (m1,c) = sei_tm i c in
    (Lam(m0,m1),c)
  else if x = 5 then
    let (m0,c) = sei_tm i c in
    let (m1,c) = sei_tm i c in
    (Imp(m0,m1),c)
  else if x = 6 then
    let (m0,c) = sei_tp i c in
    let (m1,c) = sei_tm i c in
    (All(m0,m1),c)
  else
    let (y,c) = i 1 c in
    if y = 0 then
      let (a,c) = sei_tp i c in
      let (m0,c) = sei_tm i c in
      (Ex(a,m0),c)
    else
      let (a,c) = sei_tp i c in
      let (m0,c) = sei_tm i c in
      let (m1,c) = sei_tm i c in
      (Eq(a,m0,m1),c)

(** * computation of hash roots ***)
let rec tm_hashroot m =
  match m with
  | TmH(h) -> h
  | Prim(x) -> hashtag (hashint32 (Int32.of_int x)) 96l
  | DB(x) -> hashtag (hashint32 (Int32.of_int x)) 97l
  | Ap(m,n) -> hashtag (hashpair (tm_hashroot m) (tm_hashroot n)) 98l
  | Lam(a,m) -> hashtag (hashpair (hashtp a) (tm_hashroot m)) 99l
  | Imp(m,n) -> hashtag (hashpair (tm_hashroot m) (tm_hashroot n)) 100l
  | All(a,m) -> hashtag (hashpair (hashtp a) (tm_hashroot m)) 101l
  | Ex(a,m) -> hashtag (hashpair (hashtp a) (tm_hashroot m)) 102l
  | Eq(a,m,n) -> hashtag (hashpair (hashpair (hashtp a) (tm_hashroot m)) (tm_hashroot n)) 103l

exception NotEta
exception RedexMax

(** val uptrm : trm -> int -> int -> trm **)

let rec uptrm t i j =
  match t with
  | DB k -> if (<) k i then DB k else let k2 = ((+) k j) in if k2 < 0 then raise NotEta else DB k2
  | Ap (t1, t2) -> Ap ((uptrm t1 i j), (uptrm t2 i j))
  | Lam (a1, t1) -> Lam (a1, (uptrm t1 ((+) i 1) j))
  | Imp (t1, t2) -> Imp ((uptrm t1 i j), (uptrm t2 i j))
  | All (b, t1) -> All (b, (uptrm t1 ((+) i 1) j))
  | Ex (b, t1) -> Ex (b, (uptrm t1 ((+) i 1) j))
  | Eq (b, t1, t2) -> Eq (b, (uptrm t1 i j), (uptrm t2 i j))
  | _ -> t

(** val subst_trmtrm : trm -> int -> trm -> trm **)

let rec subst_trmtrm t j s =
  match t with
  | DB k ->
    if (=) k j then uptrm s 0 j else if (<) j k then DB ((-) k 1) else DB k
  | Ap (t1, t2) -> Ap ((subst_trmtrm t1 j s), (subst_trmtrm t2 j s))
  | Lam (a1, t1) -> Lam (a1, (subst_trmtrm t1 ((+) j 1) s))
  | Imp (t1, t2) -> Imp ((subst_trmtrm t1 j s), (subst_trmtrm t2 j s))
  | All (b, t1) -> All (b, (subst_trmtrm t1 ((+) j 1) s))
  | Ex (b, t1) -> Ex (b, (subst_trmtrm t1 ((+) j 1) s))
  | Eq (b, t1, t2) -> Eq (b, (subst_trmtrm t1 j s), (subst_trmtrm t2 j s))
  | _ -> t

(** val beta_eta_norm1 : trm -> trm * bool **)

let rec beta_eta_norm1 t1 = match t1 with
| Ap (m1, m2) ->
  let (t2, r1) = beta_eta_norm1 m1 in
  let (t3, r2) = beta_eta_norm1 m2 in
  (match t2 with
   | Lam (_, m) -> ((subst_trmtrm m 0 t3), false)
   | _ -> ((Ap (t2, t3)), ((&&) r1 r2)))
| Lam (a, m1) ->
  let (t2, r1) = beta_eta_norm1 m1 in
  (match t2 with
   | Ap (m, t) ->
     (match t with
      | DB z when z = 0 ->
	  begin
	    try
	      (uptrm m 0 ((~-) 1), false)
	    with NotEta ->
	      ((Lam (a, t2)), r1)
	  end
      | _ -> ((Lam (a, t2)), r1))
   | _ -> ((Lam (a, t2)), r1))
| Imp (m1, m2) ->
  let (t2, r1) = beta_eta_norm1 m1 in
  let (t3, r2) = beta_eta_norm1 m2 in ((Imp (t2, t3)), ((&&) r1 r2))
| All (a, m1) -> let (t2, r1) = beta_eta_norm1 m1 in ((All (a, t2)), r1)
| Ex (a, m1) ->
   let (n1, _) = beta_eta_norm1 m1 in
   let n1b = uptrm n1 1 1 in
   (All(Prop,Imp(All(a,Imp(n1b,DB(1))),DB(0))),false)
| Eq (a, m1, m2) ->
   let (n1, _) = beta_eta_norm1 m1 in
   let (n2, _) = beta_eta_norm1 m2 in
   let n1b = uptrm n1 0 1 in
   let n2b = uptrm n2 0 1 in
   (All(TpArr(a,TpArr(a,Prop)),Imp(Ap(Ap(DB(0),n1b),n2b),Ap(Ap(DB(0),n2b),n1b))), false)
| _ -> (t1, true)

(** val beta_eta_norm : trm -> int -> trm * bool **)

let rec beta_eta_norm t1 count =
  if count > 0 then
    let (s, b) = beta_eta_norm1 t1 in
    if b then
      (s, true)
    else
      beta_eta_norm s (count-1)
  else
    raise RedexMax

let rec stp_str a =
  match a with
  | Base(i) -> Printf.sprintf "^%d" i
  | TpArr(a1,a2) -> Printf.sprintf "(%s -> %s)" (stp_str a1) (stp_str a2)
  | Prop -> "Prop"

let rec trm_str m =
  match m with
  | DB(i) -> Printf.sprintf "?%d" i
  | TmH(h) -> Printf.sprintf "#%s" (hashval_hexstring h)
  | Prim(i) -> Printf.sprintf "_%d" i
  | Ap(m1,m2) -> Printf.sprintf "(%s %s)" (trm_str m1) (trm_str m2)
  | Lam(a,m1) -> Printf.sprintf "(fun _:%s => %s)" (stp_str a) (trm_str m1)
  | Imp(m1,m2) -> Printf.sprintf "(%s -> %s)" (trm_str m1) (trm_str m2)
  | All(a,m1) -> Printf.sprintf "(forall _:%s => %s)" (stp_str a) (trm_str m1)
  | Ex(a,m1) -> Printf.sprintf "(exists _:%s => %s)" (stp_str a) (trm_str m1)
  | Eq(a,m1,m2) -> Printf.sprintf "(eq:%s %s %s)" (stp_str a) (trm_str m1) (trm_str m2)

