(* Copyright (c) 2020 The Proofgold developers *)
(* Copyright (c) 2016 The Qeditas developers *)
(* Copyright (c) 2017-2018 The Dalilcoin developers *)
(* Distributed under the MIT software license, see the accompanying
   file COPYING or http://www.opensource.org/licenses/mit-license.php. *)

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

(** * serialization code ***)

val seo_tp : (int -> int -> 'a -> 'a) -> stp -> 'a -> 'a
val sei_tp : (int -> 'a -> int * 'a) -> 'a -> stp * 'a

val hashtp : stp -> hashval

val seo_tm : (int -> int -> 'a -> 'a) -> trm -> 'a -> 'a
val sei_tm : (int -> 'a -> int * 'a) -> 'a -> trm * 'a

val tm_hashroot : trm -> hashval

val uptrm : trm -> int -> int -> trm
val beta_eta_norm : trm -> int -> trm * bool

val trm_str : trm -> string
