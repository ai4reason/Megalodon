(* Copyright (c) 2021 CIIRC (Czech Institute of Informatics, Robotics and Cybernetics) / CTU (Czech Technical University) *)

open Syntax

val fal : string ref
val fale : string ref
val eqPoly : string ref
val eqsymPoly : string ref
val eqsymPolyknown : bool ref
val eqSet : string ref
val conj : string ref
val disj : string ref
val expoly : string ref
val expolyI : string ref
val expolyIknown : bool ref
val setIn : string option ref
val setSubeq : string option ref
val setPow : string option ref
val setimplop : string option ref
val setlam : string option ref (** notation version, could vary **)
val setlambda : string option ref (** always the Aczel lam **)
val setap : string option ref
val setPi : string option ref
val setexp : string option ref
val setprod : string option ref
val setsum : string option ref
val set0 : string option ref
val setordsucc : string option ref
val set1 : string option ref
val set2 : string option ref
val replop : string option ref
val sepop : string option ref
val replsepop : string option ref
val nat0 : string option ref
val natS : string option ref

val ifop : string option ref
val ifopset : string option ref

val setenuml : string option list ref
val setenumadj : string option ref
val set_setenuml_n : int -> string -> unit

val seqcons : string option ref

val known_In_0_2 : string option ref
val known_In_1_2 : string option ref
val known_tuple0_setsum : string option ref
val known_tuple1_setsum : string option ref
val known_tupleI0 : string option ref
val known_tupleI1 : string option ref
val known_tuple_2_Sigma : string option ref
val known_tuple_2_setprod : string option ref
val known_tuple_2_eta : string option ref
val known_tuple_2_0_eq : string option ref
val known_tuple_2_1_eq : string option ref
val known_ap0_Sigma : string option ref
val known_ap1_Sigma : string option ref
val known_tuple_Sigma_eta : string option ref
val known_lam_ext : string option ref
val known_lam_Pi : string option ref
val known_ap_Pi : string option ref
val known_beta : string option ref
val known_Pi_cod_ext : string option ref
val known_Pi_ext : string option ref
val known_Pi_eta : string option ref
val known_tupleE_impred : string option ref

val megacontra : string option ref

val megaautosaltlimit : int ref
exception SearchLimit

val megasgof : (string,ptp) Hashtbl.t ref
val megasgdelta : (string,ptm) Hashtbl.t ref

val megaauto : string -> string -> tp list -> tm list -> tm -> pf
