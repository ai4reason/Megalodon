(* Copyright (c) 2015 The Qeditas developers *)
(* Distributed under the MIT software license, see the accompanying
   file COPYING or http://www.opensource.org/licenses/mit-license.php. *)

val string_hexstring : string -> string
val hexstring_string : string -> string
val hexsubstring_int32 : string -> int -> int32
val int32_hexstring : Buffer.t -> int32 -> unit
val int32_rev : int32 -> int32
