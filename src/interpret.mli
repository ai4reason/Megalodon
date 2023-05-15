(*** File: interpret.mli ***)
(*** Chad E Brown ***)
(*** Feb 2014 ***)

open Syntax

val verbosity : int ref
val tpabbrev : (string,tp) Hashtbl.t
val proving : (string * int * tm * string * Hash.hashval) option ref
val prooffun :  (pf list -> pf) ref
val deltaset : string list ref
type pfstatetype =
  | PfStateGoal of tm * (string * (tp * tm option)) list * (string * tm) list
  | PfStateSep of int * bool
val pfstate : pfstatetype list ref

val extract_tp : atree -> string list -> tp
val extract_tm : atree
 -> ((string * int) * tp) list -> (string, ptp) Hashtbl.t -> (string * (string list -> (string * (tp * tm option)) list -> tm)) list -> string list -> (string * (tp * tm option)) list
 -> tm * tp
val check_tm : atree -> tp
 -> ((string * int) * tp) list -> (string, ptp) Hashtbl.t -> (string * (string list -> (string * (tp * tm option)) list -> tm)) list -> string list -> (string * (tp * tm option)) list
 -> tm
val extract_pf : atree
 -> ((string * int) * tp) list -> ((string * int) * tm) list
 -> (string, ptp) Hashtbl.t -> (string,ptm) Hashtbl.t
 -> (string * (string list -> (string * (tp * tm option)) list -> tm)) list
 -> (string * (string list -> (string * (tp * tm option)) list -> (string * tm) list -> pf)) list
 -> string list -> (string * (tp * tm option)) list -> (string * tm) list
 -> pf * tm
val check_pf : atree -> tm
 -> ((string * int) * tp) list -> ((string * int) * tm) list
 -> (string, ptp) Hashtbl.t -> (string,ptm) Hashtbl.t
 -> (string * (string list -> (string * (tp * tm option)) list -> tm)) list
 -> (string * (string list -> (string * (tp * tm option)) list -> (string * tm) list -> pf)) list
 -> string list -> (string * (tp * tm option)) list -> (string * tm) list
 -> pf
