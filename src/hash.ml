(* Copyright (c) 2015 The Qeditas developers *)
(* Distributed under the MIT software license, see the accompanying
   file COPYING or http://www.opensource.org/licenses/mit-license.php. *)

open Hashaux
open Sha256
open Ser

type hashval = md256

let getcurrhashval () = getcurrmd256()

(*** x:int32 ***)
let hashint32 x =
  sha256init();
  currblock.(0) <- 1l;
  currblock.(1) <- x;
  currblock.(2) <- 0x80000000l;
  currblock.(3) <- 0l;
  currblock.(4) <- 0l;
  currblock.(5) <- 0l;
  currblock.(6) <- 0l;
  currblock.(7) <- 0l;
  currblock.(8) <- 0l;
  currblock.(9) <- 0l;
  currblock.(10) <- 0l;
  currblock.(11) <- 0l;
  currblock.(12) <- 0l;
  currblock.(13) <- 0l;
  currblock.(14) <- 0l;
  currblock.(15) <- 64l;
  sha256round();
  getcurrhashval()

(*** x:int64 ***)
let hashint64 x =
  sha256init();
  currblock.(0) <- 2l;
  currblock.(1) <- Int64.to_int32 (Int64.shift_right_logical x 32);
  currblock.(2) <- Int64.to_int32 x;
  currblock.(3) <- 0x80000000l;
  currblock.(4) <- 0l;
  currblock.(5) <- 0l;
  currblock.(6) <- 0l;
  currblock.(7) <- 0l;
  currblock.(8) <- 0l;
  currblock.(9) <- 0l;
  currblock.(10) <- 0l;
  currblock.(11) <- 0l;
  currblock.(12) <- 0l;
  currblock.(13) <- 0l;
  currblock.(14) <- 0l;
  currblock.(15) <- 96l;
  sha256round();
  getcurrhashval()

(*** x and y are hashvals ***)
let hashpair x y =
  let (x0,x1,x2,x3,x4,x5,x6,x7) = x in
  let (y0,y1,y2,y3,y4,y5,y6,y7) = y in
  sha256init();
  currblock.(0) <- 7l;
  currblock.(1) <- x0;
  currblock.(2) <- x1;
  currblock.(3) <- x2;
  currblock.(4) <- x3;
  currblock.(5) <- x4;
  currblock.(6) <- x5;
  currblock.(7) <- x6;
  currblock.(8) <- x7;
  currblock.(9) <- y0;
  currblock.(10) <- y1;
  currblock.(11) <- y2;
  currblock.(12) <- y3;
  currblock.(13) <- y4;
  currblock.(14) <- y5;
  currblock.(15) <- y6;
  sha256round();
  currblock.(0) <- y7;
  currblock.(1) <- 0x80000000l;
  currblock.(2) <- 0l;
  currblock.(3) <- 0l;
  currblock.(4) <- 0l;
  currblock.(5) <- 0l;
  currblock.(6) <- 0l;
  currblock.(7) <- 0l;
  currblock.(8) <- 0l;
  currblock.(9) <- 0l;
  currblock.(10) <- 0l;
  currblock.(11) <- 0l;
  currblock.(12) <- 0l;
  currblock.(13) <- 0l;
  currblock.(14) <- 0l;
  currblock.(15) <- 544l;
  sha256round();
  getcurrhashval()

let hashtag x tg =
  let (x0,x1,x2,x3,x4,x5,x6,x7) = x in
  sha256init();
  currblock.(0) <- 8l;
  currblock.(1) <- tg;
  currblock.(2) <- x0;
  currblock.(3) <- x1;
  currblock.(4) <- x2;
  currblock.(5) <- x3;
  currblock.(6) <- x4;
  currblock.(7) <- x5;
  currblock.(8) <- x6;
  currblock.(9) <- x7;
  currblock.(10) <- 0x80000000l;
  currblock.(11) <- 0l;
  currblock.(12) <- 0l;
  currblock.(13) <- 0l;
  currblock.(14) <- 0l;
  currblock.(15) <- 320l;
  sha256round();
  getcurrhashval()

let hashlist hl =
  let l = List.length hl in
  if l >= 8388576 then raise (Failure "hashlist overflow");
  let bl = Int32.of_int (l * 160 + 64) in
  sha256init();
  currblock.(0) <- 9l;
  currblock.(1) <- Int32.of_int l;
  let i = ref 2 in
  List.iter
    (fun x ->
      let (x0,x1,x2,x3,x4,x5,x6,x7) = x in
      currblock.(!i) <- x0;
      incr i;
      if !i = 16 then (i := 0; sha256round());
      currblock.(!i) <- x1;
      incr i;
      if !i = 16 then (i := 0; sha256round());
      currblock.(!i) <- x2;
      incr i;
      if !i = 16 then (i := 0; sha256round());
      currblock.(!i) <- x3;
      incr i;
      if !i = 16 then (i := 0; sha256round());
      currblock.(!i) <- x4;
      incr i;
      if !i = 16 then (i := 0; sha256round());
      currblock.(!i) <- x5;
      incr i;
      if !i = 16 then (i := 0; sha256round());
      currblock.(!i) <- x6;
      incr i;
      if !i = 16 then (i := 0; sha256round());
      currblock.(!i) <- x7;
      incr i;
      if !i = 16 then (i := 0; sha256round());
    ) hl;
  if !i < 15 then
    begin
      currblock.(!i) <- 0x80000000l;
      incr i;
      while !i < 15 do
	currblock.(!i) <- 0l;
	incr i;
      done
    end
  else
    begin
      currblock.(15) <- 0x80000000l;
      sha256round();
      for j = 0 to 14 do
	currblock.(j) <- 0l;
      done
    end;
  currblock.(15) <- bl;
  sha256round();
  getcurrhashval()

let rec ohashlist hl =
  begin
    match hl with
    | [] -> None
    | h::hr ->
	begin
	  match ohashlist hr with
	  | None -> Some(hashtag h 3l)
	  | Some(k) -> Some(hashtag (hashpair h k) 4l)
	end
  end
    
(*** hashopair, x and y are hashval options ***)
let hashopair x y =
  match x,y with
  | Some x,Some y -> Some(hashpair x y)
  | Some x,None -> Some(hashtag x 0l)
  | None,Some y -> Some(hashtag y 1l)
  | None,None -> None

let hashopair2 x y =
  match x with
  | Some x -> hashpair x y
  | None -> hashtag y 1l

let hashval_hexstring h =
  let b = Buffer.create 64 in
  let (x0,x1,x2,x3,x4,x5,x6,x7) = h in
  int32_hexstring b x0;
  int32_hexstring b x1;
  int32_hexstring b x2;
  int32_hexstring b x3;
  int32_hexstring b x4;
  int32_hexstring b x5;
  int32_hexstring b x6;
  int32_hexstring b x7;
  Buffer.contents b

let hexstring_hashval h =
  (hexsubstring_int32 h 0,hexsubstring_int32 h 8,hexsubstring_int32 h 16,hexsubstring_int32 h 24,hexsubstring_int32 h 32,hexsubstring_int32 h 40,hexsubstring_int32 h 48,hexsubstring_int32 h 56)

let printhashval h =
  Printf.printf "%s\n" (hashval_hexstring h)

let seo_hashval o h c =
  let (x0,x1,x2,x3,x4,x5,x6,x7) = h in
  let c = seo_int32 o x0 c in
  let c = seo_int32 o x1 c in
  let c = seo_int32 o x2 c in
  let c = seo_int32 o x3 c in
  let c = seo_int32 o x4 c in
  let c = seo_int32 o x5 c in
  let c = seo_int32 o x6 c in
  let c = seo_int32 o x7 c in
  c

let sei_hashval i c =
  let (h0,c) = sei_int32 i c in
  let (h1,c) = sei_int32 i c in
  let (h2,c) = sei_int32 i c in
  let (h3,c) = sei_int32 i c in
  let (h4,c) = sei_int32 i c in
  let (h5,c) = sei_int32 i c in
  let (h6,c) = sei_int32 i c in
  let (h7,c) = sei_int32 i c in
  ((h0,h1,h2,h3,h4,h5,h6,h7),c)

