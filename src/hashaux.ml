(* Copyright (c) 2015 The Qeditas developers *)
(* Distributed under the MIT software license, see the accompanying
   file COPYING or http://www.opensource.org/licenses/mit-license.php. *)

let hexchar i =
  match i with
  | 0l -> '0'
  | 1l -> '1'
  | 2l -> '2'
  | 3l -> '3'
  | 4l -> '4'
  | 5l -> '5'
  | 6l -> '6'
  | 7l -> '7'
  | 8l -> '8'
  | 9l -> '9'
  | 10l -> 'a'
  | 11l -> 'b'
  | 12l -> 'c'
  | 13l -> 'd'
  | 14l -> 'e'
  | 15l -> 'f'
  | _ -> raise (Failure("Not a hexit"))

let hexchar_inv x =
  match x with
  | '0' -> 0l
  | '1' -> 1l
  | '2' -> 2l
  | '3' -> 3l
  | '4' -> 4l
  | '5' -> 5l
  | '6' -> 6l
  | '7' -> 7l
  | '8' -> 8l
  | '9' -> 9l
  | 'A' -> 10l
  | 'B' -> 11l
  | 'C' -> 12l
  | 'D' -> 13l
  | 'E' -> 14l
  | 'F' -> 15l
  | 'a' -> 10l
  | 'b' -> 11l
  | 'c' -> 12l
  | 'd' -> 13l
  | 'e' -> 14l
  | 'f' -> 15l
  | _ -> raise (Failure("not a hexit: " ^ (string_of_int (Char.code x))))

let hexsubstring_int8 h i =
  Int32.to_int
    (Int32.logor
       (Int32.shift_left (hexchar_inv h.[i]) 4)
       (hexchar_inv h.[i+1]))

let hexstring_string s =
  let l = String.length s in
  let l2 = l/2 in
  let strb = Buffer.create l2 in
  let i = ref 1 in
  while (!i < l) do
    Buffer.add_char strb (Char.chr (hexsubstring_int8 s (!i-1)));
    i := !i + 2;
  done;
  Buffer.contents strb

let string_hexstring s =
  let l = String.length s in
  let l2 = l*2 in
  let strb = Buffer.create l2 in
  for i = 0 to l-1 do
    let x = Char.code s.[i] in
    Buffer.add_char strb (hexchar (Int32.of_int ((x lsr 4) land 15)));
    Buffer.add_char strb (hexchar (Int32.of_int (x land 15)));
  done;
  Buffer.contents strb

let hexsubstring_int32 h i =
  Int32.logor (Int32.shift_left (hexchar_inv h.[i]) 28)
    (Int32.logor (Int32.shift_left (hexchar_inv h.[i+1]) 24)
       (Int32.logor (Int32.shift_left (hexchar_inv h.[i+2]) 20)
	  (Int32.logor (Int32.shift_left (hexchar_inv h.[i+3]) 16)
	     (Int32.logor (Int32.shift_left (hexchar_inv h.[i+4]) 12)
		(Int32.logor (Int32.shift_left (hexchar_inv h.[i+5]) 8)
		   (Int32.logor (Int32.shift_left (hexchar_inv h.[i+6]) 4)
		      (hexchar_inv h.[i+7])))))))
  
let int32_hexstring b x =
  Buffer.add_char b (hexchar (Int32.shift_right_logical x 28));
  Buffer.add_char b (hexchar (Int32.logand (Int32.shift_right_logical x 24) 15l));
  Buffer.add_char b (hexchar (Int32.logand (Int32.shift_right_logical x 20) 15l));
  Buffer.add_char b (hexchar (Int32.logand (Int32.shift_right_logical x 16) 15l));
  Buffer.add_char b (hexchar (Int32.logand (Int32.shift_right_logical x 12) 15l));
  Buffer.add_char b (hexchar (Int32.logand (Int32.shift_right_logical x 8) 15l));
  Buffer.add_char b (hexchar (Int32.logand (Int32.shift_right_logical x 4) 15l));
  Buffer.add_char b (hexchar (Int32.logand x 15l))

let int32_rev x =
  Int32.logor
    (Int32.shift_left (Int32.logand x 0xffl) 24)
    (Int32.logor
       (Int32.shift_left (Int32.logand (Int32.shift_right_logical x 8) 0xffl) 16)
       (Int32.logor
	  (Int32.shift_left (Int32.logand (Int32.shift_right_logical x 16) 0xffl) 8)
	  (Int32.logand (Int32.shift_right_logical x 24) 0xffl)))
