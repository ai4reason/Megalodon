open Syntax

let lineno : int ref = ref 1
let charno : int ref = ref 0

let hexitp c =
  c = '0' || c = '1' || c = '2' || c = '3' || c = '4' || c = '5' || c = '6' || c = '7' || c = '8' || c = '9'
  || c = 'A' || c = 'B' || c = 'C' || c = 'D' || c = 'E' || c = 'F'
  || c = 'a' || c = 'b' || c = 'c' || c = 'd' || c = 'e' || c = 'f'

let hexval c =
  let cc = Char.code c in
  if cc < 58 then
    cc - 48
  else if cc < 71 then
    cc - 55
  else 
    cc - 87

(*** Assume no newlines ***)
let update_char_pos s =
  charno := !charno + String.length s

(*** May have newlines ***)
let rec update_pos_rec s i =
  try
    let i = String.index_from s (i + 1) '\n' in
    incr lineno;
    charno := 0;
    update_pos_rec s i
  with Not_found ->
    charno := String.length s - i

let update_pos s =
  try
    let i = String.index s '\n' in
    incr lineno;
    update_pos_rec s i
  with Not_found ->
    update_char_pos s

exception ParsingError of string * int * int * int * int

type token =
  | STRING of string
  | QUESTIONSTRING of string
  | NAM of string
  | NUM of bool * string * string option * string option
  | LPAREN
  | RPAREN
  | COMMA
  | COLON
  | DARR
  | DEQ
  | IN
  | MEM
  | SUBEQ
  | VBAR
  | LCBRACE
  | RCBRACE
  | LBRACK
  | RBRACK
  | AT
  | IF
  | THEN
  | ELSE
  | SEMICOLON
  | BACKSLASH
  | DOLLAR
  | DOT
  | OPENCOM
  | CLOSECOM
  | SALT
  | TREASURE
  | TITLE
  | AUTHOR
  | ADMITTED
  | ADMIT
  | SECTION
  | END
  | LETDEC
  | STYPE
  | INDTYPE
  | PROPTYPE
  | VAR
  | HYP
  | PARAM
  | AXIOM
  | PREFIX
  | POSTFIX
  | INFIX
  | BINDER
  | BINDERPLUS
  | NOTATION
  | UNICODE
  | SUPERSCRIPT
  | SUBSCRIPT
  | DEF
  | THEOREM of string
  | CONJECTURE
  | LET
  | ASSUME
  | APPLY
  | CLAIM
  | PROVE
  | EXACT
  | QED
  | TEXT
  | SPECCOMM of string

let tok_to_str tok =
  match tok with
  | STRING(x) -> "STR:" ^ x
  | QUESTIONSTRING(x) -> "QSTR:" ^ x
  | NAM(x) -> "NAM:" ^ x
  | NUM(false,n,None,None) -> "NUM:" ^ n
  | NUM(true,n,None,None) -> "NUM:-" ^ n
  | NUM(false,n,Some(m),None) -> "NUM:" ^ n ^ ":" ^ m
  | NUM(true,n,Some(m),None) -> "NUM:-" ^ n ^ ":" ^ m
  | NUM(false,n,None,Some(k)) -> "NUM:" ^ n ^ "::" ^ k
  | NUM(true,n,None,Some(k)) -> "NUM:-" ^ n ^ "::" ^ k
  | NUM(false,n,Some(m),Some(k)) -> "NUM:" ^ n ^ ":" ^ m ^ ":" ^ k
  | NUM(true,n,Some(m),Some(k)) -> "NUM:-" ^ n ^ ":" ^ m ^ ":" ^ k
  | LPAREN -> "("
  | RPAREN -> ")"
  | COMMA -> ","
  | COLON -> ":"
  | DARR -> "=>"
  | DEQ -> ":="
  | IN -> "in"
  | MEM -> ":e"
  | SUBEQ -> "c="
  | VBAR -> "|"
  | LCBRACE -> "{"
  | RCBRACE -> "}"
  | LBRACK -> "["
  | RBRACK -> "]"
  | AT -> "at"
  | IF -> "if"
  | THEN -> "then"
  | ELSE -> "else"
  | SEMICOLON -> ";"
  | BACKSLASH -> "\\"
  | DOLLAR -> "$"
  | DOT -> "."
  | OPENCOM -> "(*"
  | CLOSECOM -> "*)"
  | SALT -> "Salt"
  | TREASURE -> "Treasure"
  | TITLE -> "Title"
  | AUTHOR -> "Author"
  | ADMITTED -> "Admitted"
  | ADMIT -> "admit"
  | SECTION -> "Section"
  | END -> "End"
  | LETDEC -> "Let"
  | STYPE -> "SType"
  | INDTYPE -> "set"
  | PROPTYPE -> "prop"
  | VAR -> "Variable"
  | HYP -> "Hypothesis"
  | PARAM -> "Parameter"
  | AXIOM -> "Axiom"
  | PREFIX -> "Prefix"
  | POSTFIX -> "Postfix"
  | INFIX -> "Infix"
  | BINDER -> "Binder"
  | BINDERPLUS -> "Binder+"
  | NOTATION -> "Notation"
  | UNICODE -> "Unicode"
  | SUBSCRIPT -> "Subscript"
  | SUPERSCRIPT -> "Superscript"
  | DEF -> "Definition"
  | THEOREM(x) -> "Theorem:" ^ x
  | CONJECTURE -> "Conjecture"
  | LET -> "let"
  | ASSUME -> "assume"
  | APPLY -> "apply"
  | CLAIM -> "claim"
  | PROVE -> "prove"
  | EXACT -> "exact"
  | QED -> "Qed"
  | TEXT -> "TEXT"
  | SPECCOMM(x) -> "SPECCOMM:" ^ x

let rec whole_of_string x i l n =
  if i < l then
    match x.[i] with
    | '0' -> whole_of_string x (i+1) l (Int64.mul 10L n)
    | '1' -> whole_of_string x (i+1) l (Int64.add 1L (Int64.mul 10L n))
    | '2' -> whole_of_string x (i+1) l (Int64.add 2L (Int64.mul 10L n))
    | '3' -> whole_of_string x (i+1) l (Int64.add 3L (Int64.mul 10L n))
    | '4' -> whole_of_string x (i+1) l (Int64.add 4L (Int64.mul 10L n))
    | '5' -> whole_of_string x (i+1) l (Int64.add 5L (Int64.mul 10L n))
    | '6' -> whole_of_string x (i+1) l (Int64.add 6L (Int64.mul 10L n))
    | '7' -> whole_of_string x (i+1) l (Int64.add 7L (Int64.mul 10L n))
    | '8' -> whole_of_string x (i+1) l (Int64.add 8L (Int64.mul 10L n))
    | '9' -> whole_of_string x (i+1) l (Int64.add 9L (Int64.mul 10L n))
    | _ -> (i,n)
  else
    (i,n)

let rec dec_of_string x i l n e =
  if i < l then
    match x.[i] with
    | '0' -> dec_of_string x (i+1) l (Int64.mul 10L n) (e-1)
    | '1' -> dec_of_string x (i+1) l (Int64.add 1L (Int64.mul 10L n)) (e-1)
    | '2' -> dec_of_string x (i+1) l (Int64.add 2L (Int64.mul 10L n)) (e-1)
    | '3' -> dec_of_string x (i+1) l (Int64.add 3L (Int64.mul 10L n)) (e-1)
    | '4' -> dec_of_string x (i+1) l (Int64.add 4L (Int64.mul 10L n)) (e-1)
    | '5' -> dec_of_string x (i+1) l (Int64.add 5L (Int64.mul 10L n)) (e-1)
    | '6' -> dec_of_string x (i+1) l (Int64.add 6L (Int64.mul 10L n)) (e-1)
    | '7' -> dec_of_string x (i+1) l (Int64.add 7L (Int64.mul 10L n)) (e-1)
    | '8' -> dec_of_string x (i+1) l (Int64.add 8L (Int64.mul 10L n)) (e-1)
    | '9' -> dec_of_string x (i+1) l (Int64.add 9L (Int64.mul 10L n)) (e-1)
    | _ -> (i,n,e)
  else
    (i,n,e)

let rec e_of_string x i l n e =
  let (i,m) = whole_of_string x i l 0L in
  (i,n,e+Int64.to_int m)

let rec digit_substring x i l =
  if i < l then
    match x.[i] with
    | '0' -> let (j,r) = digit_substring x (i+1) l in (j,"0" ^ r)
    | '1' -> let (j,r) = digit_substring x (i+1) l in (j,"1" ^ r)
    | '2' -> let (j,r) = digit_substring x (i+1) l in (j,"2" ^ r)
    | '3' -> let (j,r) = digit_substring x (i+1) l in (j,"3" ^ r)
    | '4' -> let (j,r) = digit_substring x (i+1) l in (j,"4" ^ r)
    | '5' -> let (j,r) = digit_substring x (i+1) l in (j,"5" ^ r)
    | '6' -> let (j,r) = digit_substring x (i+1) l in (j,"6" ^ r)
    | '7' -> let (j,r) = digit_substring x (i+1) l in (j,"7" ^ r)
    | '8' -> let (j,r) = digit_substring x (i+1) l in (j,"8" ^ r)
    | '9' -> let (j,r) = digit_substring x (i+1) l in (j,"9" ^ r)
    | _ -> (i,"")
  else
    (i,"")

let int_substring x i l =
  if i < l then
    if x.[0] = '-' then
      let (j,r) = digit_substring x (i+1) l in
      (j,"-" ^ r)
    else
      digit_substring x i l
  else
    digit_substring x i l

let num_of_string x =
  let l = String.length x in
  if l > 0 then
    let (neg,i) = if x.[0] = '-' then (true,1) else (false,0) in
    let (j,n) = digit_substring x i l in
    if j < l then
      if x.[j] = '.' then
	let (k,m) = digit_substring x (j+1) l in
	if k < l then
	  if x.[k] = 'e' || x.[k] = 'E' then
	    let (z,p) = int_substring x (k+1) l in
	    if z < l then
	      raise (Failure "Ill-formed Number")
	    else
	      NUM(neg,n,Some m,Some p)
	  else
	    raise (Failure "Ill-formed Number")
	else
	  NUM(neg,n,Some m,None)
      else if x.[j] = 'e' || x.[j] = 'E' then
	let (z,p) = int_substring x (j+1) l in
	  NUM(neg,n,None,Some p)
      else
	raise (Failure "Ill-formed Number")
    else
      NUM(neg,n,None,None)
  else
    raise (Failure "Ill-formed Number")

type parseenv = string -> int option * (int * picase) option * token option

let proj_name x =
  let l = String.length x in
  if l > 1 then
    if x.[0] = '_' then
      let (i,n) = whole_of_string x 1 l 0L in
      if i < l then
	raise Not_found
      else
	Int64.to_int n
    else
      raise Not_found
  else
    raise Not_found

let prefixpriorities : (int,unit) Hashtbl.t = Hashtbl.create 100
let disallowedprefixpriorities : (int,unit) Hashtbl.t = Hashtbl.create 100
let rightinfixpriorities : (int,unit) Hashtbl.t = Hashtbl.create 100
let disallowedrightinfixpriorities : (int,unit) Hashtbl.t = Hashtbl.create 100
let infixsem : (string,atree) Hashtbl.t = Hashtbl.create 100
let postfixsem : (string,atree) Hashtbl.t = Hashtbl.create 100
let prefixsem : (string,atree) Hashtbl.t = Hashtbl.create 100
let bindersem : (string,bool * atree * atree option) Hashtbl.t = Hashtbl.create 100

let penv_preop : (string,int) Hashtbl.t = Hashtbl.create 100
let penv_postinfop : (string,int * picase) Hashtbl.t = Hashtbl.create 100
let penv_binder : (string,token) Hashtbl.t = Hashtbl.create 100;;

Hashtbl.add penv_binder "fun" DARR;;
Hashtbl.add penv_binder "forall" COMMA;;
Hashtbl.add penv_postinfop "->" (800,InfixRight);;
Hashtbl.add penv_postinfop "^" (790,InfixNone);;
Hashtbl.add rightinfixpriorities 800 ();;
Hashtbl.add rightinfixpriorities 790 ();;
Hashtbl.add disallowedprefixpriorities 800 ();;
Hashtbl.add disallowedprefixpriorities 790 ();;

let penv : parseenv =
  fun x ->
    let p =
      try
	Some(Hashtbl.find penv_preop x)
      with Not_found -> None
    in
    let q =
      try
	let _ = proj_name x in (*** _0, _1, _2, etc. are the names of postfix operators for projections of metatuples ***)
	Some(1,Postfix)
      with Not_found ->
	try
	  Some(Hashtbl.find penv_postinfop x)
	with Not_found -> None
    in
    let r =
      try
	Some(Hashtbl.find penv_binder x)
      with Not_found -> None
    in
    (p,q,r)

type tokenstream =
  | TokStrBuff of token * tokenstream
  | TokStrRest of (Lexing.lexbuf -> token) * Lexing.lexbuf

let destr_ts (tl : tokenstream) : token * tokenstream =
  match tl with
  | TokStrBuff(tok,tr) -> (tok,tr)
  | TokStrRest(lf,lb) -> (lf lb,TokStrRest(lf,lb))

(*** parse_Comma_Names was not part of the formalized Coq version and is included to handle let [x,...,y] := S in S. - Feb 25 2014 ***)
let rec parse_Comma_Names (tl : tokenstream) : string list * tokenstream =
  match destr_ts tl with
  | (COMMA,tr) ->
      begin
	match destr_ts tr with
	| (NAM x,ts) ->
	    begin
	      match penv x with
	      | (None,None,None) ->
		  let (yl,tu) = parse_Comma_Names ts in
		  (x::yl,tu)
	      | _ -> raise (ParsingError("The name " ^ x ^ " cannot be used here since it has a special meaning.",!lineno,!charno,!lineno,!charno))
	    end
	| _ -> raise (ParsingError("Expected a name here.",!lineno,!charno,!lineno,!charno))
      end
  | (tok,tr) -> ([],TokStrBuff(tok,tr))

let rec parse_Names (tl : tokenstream) : string list * tokenstream =
  match destr_ts tl with
  | (NAM x,tr) ->
      begin
	match penv x with
	| (None,None,None) ->
	    let (yl,tu) = parse_Names tr in
	    (x::yl,tu)
	| _ -> ([],TokStrBuff(NAM x,tr))
      end
  | (tok,tr) -> ([],TokStrBuff(tok,tr))

let namorasctokb (tok : token) : bool =
  match tok with
  | NAM _ -> true
  | COLON -> true
  | MEM -> true
  | SUBEQ -> true
  | _ -> false

let parse_S'_Infix q p pr i a tl tr fS' fS =
  if q <= p then
    (a,tl)
  else
    let (b,ts) = fS pr tr in
    if binderishp b then
      (InfoL(i,a,b),ts)
    else
      fS' q (InfoL(i,a,b)) ts

let parse_TVs_ascr lpli lpch xl akd ts fS fTVs =
  let (b,tu0) = fS ts in
  match destr_ts tu0 with
  | (RPAREN,tu) ->
      let (vll,tv) = fTVs tu in
      ((xl,Some(akd,b))::vll,tv)
  | _ -> raise (ParsingError("Unmatched ( in bound variable declaration",lpli,lpch,!lineno,!charno))

let parse_Binder_ascr li ch x xl mtok akd ts fS =
  let (b,tu0) = fS ts in
  let (tok1,tu) = destr_ts tu0 in
  if tok1 = mtok then
    let (a,tv) = fS tu in
    (BiL(x,(if mtok = COMMA then "," else "=>"),[(xl,Some(akd,b))],a),tv)
  else
    raise (ParsingError("Ill-formed Binder " ^ x,li,ch,!lineno,!charno))

let parse_Let_ascr li ch x akd tr fS =
  let (b,ts0) = fS tr in
  match destr_ts ts0 with
  | (DEQ,ts) ->
      begin
	let (a,tu0) = fS ts in
	match destr_ts tu0 with
	| (IN,tu) ->
	    let (c,tv) = fS tu in
	    (LeL(x,Some(akd,b),a,c),tv)
	| _ -> raise (ParsingError("Ill-formed let",li,ch,!lineno,!charno))
      end
  | _ -> raise (ParsingError("Ill-formed let",li,ch,!lineno,!charno))

let parse_S_SetBraces lpli lpch q tr g fS' fS fN : ltree * tokenstream =
  let (a,ts0) = fS 1023 tr in
  let (tok1,ts1) = destr_ts ts0 in
  if tok1 = VBAR then
    begin
      match a with
      | InfoL(InfSet i,NaL x,a) -> (*** Sep ***)
	  begin
	    let (b,tu0) = fS 1023 ts1 in
	    match destr_ts tu0 with
	    | (RCBRACE,tu) -> fS' q (g (SepL(x,i,a,b))) tu
	    | _ -> raise (ParsingError("Missing } at the end of set formed by separation",lpli,lpch,!lineno,!charno))
	  end
      | _ ->
	  let (tok2,ts2) = destr_ts ts1 in
	  let (tok3,ts3) = destr_ts ts2 in
	  begin
	    match (tok2,tok3) with
	    | (NAM x,MEM) -> (*** Rep or SepRep ***)
		let (b,tu0) = fS 1023 ts3 in
		begin
		  match destr_ts tu0 with
		  | (RCBRACE,tu) -> fS' q (g (RepL(x,InfMem,a,b))) tu
		  | (COMMA,tu) ->
		      begin
			let (c,tv0) = fS 1023 tu in
			match destr_ts tv0 with
			| (RCBRACE,tv) -> fS' q (g (SepRepL(x,InfMem,a,b,c))) tv
			| _ -> raise (ParsingError("Missing } at the end of set formed by replacement and separation",lpli,lpch,!lineno,!charno))
		      end
		  | _ -> raise (ParsingError("Expected , or }",lpli,lpch,!lineno,!charno))
		end
	    | (NAM x,SUBEQ) -> (*** Rep or SepRep ***)
		let (b,tu0) = fS 1023 ts3 in
		begin
		  match destr_ts tu0 with
		  | (RCBRACE,tu) -> fS' q (g (RepL(x,InfSubq,a,b))) tu
		  | (COMMA,tu) ->
		      begin
			let (c,tv0) = fS 1023 tu in
			match destr_ts tv0 with
			| (RCBRACE,tv) -> fS' q (g (SepRepL(x,InfSubq,a,b,c))) tv
			| _ -> raise (ParsingError("Missing } at the end of set formed by replacement and separation",lpli,lpch,!lineno,!charno))
		      end
		  | _ -> raise (ParsingError("Expected , or }",lpli,lpch,!lineno,!charno))
		end
	    | _ -> (*** This is an error, because since there's a VBAR it can't be a set enum. ***)
		raise (ParsingError("Missing bound on set formed by replacement",lpli,lpch,!lineno,!charno))
	  end
    end
  else (*** otherwise, assume it's a set enum ***)
    let ts = TokStrBuff(tok1,ts1) in
    let (bl,tu0) = fN ts in
    match destr_ts tu0 with
    | (RCBRACE,tu) -> fS' q (g (SetEnumL(a::bl))) tu
    | _ -> raise (ParsingError("Unmatched {",lpli,lpch,!lineno,!charno))

let rec parse_S'_ (q : int) (a : ltree) (tl : tokenstream) : ltree * tokenstream =
  if q = 0 then
    (a,tl)
  else
    let (tok,tr) = destr_ts tl in
    let tl = TokStrBuff(tok,tr) in (*** Put it back together in case we need it below ***)
    match tok with
    | MEM ->
      parse_S'_Infix q 500 500 (InfSet InfMem) a tl tr parse_S'_ parse_S_
    | SUBEQ ->
       parse_S'_Infix q 500 500 (InfSet InfSubq) a tl tr parse_S'_ parse_S_
    | BACKSLASH ->
       begin
         match destr_ts tr with
         | (NAM x,ts) ->
            if String.length x = 3 && x.[0] = 'x' && hexitp x.[1] && hexitp x.[2] then
              parse_S'_ q (ImplopL(a,ByteL((hexval x.[1]) * 16 + (hexval x.[2])))) ts
            else
              raise (ParsingError("Expected \\x followed by two hexits",!lineno,!charno,!lineno,!charno))
         | _ -> raise (ParsingError("Expected \\x followed by two hexits",!lineno,!charno,!lineno,!charno))
       end
    | STRING x -> parse_S'_ q (ImplopL(a,StringL x)) tr
    | QUESTIONSTRING x -> parse_S'_ q (ImplopL(a,QStringL x)) tr
    | NAM x ->
	begin
	  match penv x with
	  | (_,Some(p,Postfix),_) ->
	      if q <= p then
		(a,tl)
	      else
		parse_S'_ q (PostoL(x,a)) tr
	  | (_,Some(p,InfixNone),_) ->
	      parse_S'_Infix q p p (InfNam x) a tl tr parse_S'_ parse_S_
	  | (_,Some(p,InfixLeft),_) ->
	      parse_S'_Infix q p p (InfNam x) a tl tr parse_S'_ parse_S_
	  | (_,Some(p,InfixRight),_) ->
	      parse_S'_Infix q p (p+1) (InfNam x) a tl tr parse_S'_ parse_S_
	  | (None,None,None) ->
	      parse_S'_ q (ImplopL(a,NaL x)) tr
	  | (_,_,_) -> (a,tl)
	end
    | NUM(b,n,m,e) -> parse_S'_ q (ImplopL(a,NuL(b,n,m,e))) tr
    | LPAREN ->
	let lpli = !lineno in
	let lpch = !charno in
	begin
	  let (b,ts) = parse_S_ 1023 tr in
	  let (cl,tv) = parse_N ts in
	  match destr_ts tv with
	  | (RPAREN,tu) -> parse_S'_ q (ImplopL(a,ParenL(b,cl))) tu
	  | _ -> raise (ParsingError("Unmatched (",lpli,lpch,!lineno,!charno))
	end
    | LCBRACE ->
	begin
	  match destr_ts tr with
	  | (RCBRACE,ts) -> parse_S'_ q (ImplopL(a,SetEnumL([]))) ts
	  | (tok,trr) ->
	      parse_S_SetBraces !lineno !charno q (TokStrBuff(tok,trr)) (fun b -> ImplopL(a,b)) parse_S'_ parse_S_ parse_N
	end
    | LBRACK ->
	let lpli = !lineno in
	let lpch = !charno in
	begin
	  let (c,ts) = parse_S_ 1023 tr in
	  let (bl,tv) = parse_N ts in
	  match destr_ts tv with
	  | (RBRACK,tu) ->
	      parse_S'_ q (ImplopL(a,MTupleL(c,bl))) tu
	  | _ -> raise (ParsingError("Unmatched [",lpli,lpch,!lineno,!charno))
	end
    | _ -> (a,tl)
and parse_S_ (q : int) (tl : tokenstream) : ltree * tokenstream =
  match destr_ts tl with
  | (BACKSLASH,tr) ->
     begin
       match destr_ts tr with
       | (NAM x,ts) ->
          if String.length x = 3 && x.[0] = 'x' && hexitp x.[1] && hexitp x.[2] then
            parse_S'_ q (ByteL((hexval x.[1]) * 16 + (hexval x.[2]))) ts
          else
            raise (ParsingError("Expected \\x followed by two hexits",!lineno,!charno,!lineno,!charno))
       | _ -> raise (ParsingError("Expected \\x followed by two hexits",!lineno,!charno,!lineno,!charno))
     end
  | (STRING x,tr) -> parse_S'_ q (StringL(x)) tr
  | (QUESTIONSTRING x,tr) -> parse_S'_ q (QStringL(x)) tr
  | (NAM x,tr) ->
      begin
	match penv x with
	| (None,None,None) -> (*** Ordinary Name ***)
	    parse_S'_ q (NaL x) tr
	| (Some p,_,_) -> (*** Prefix Operator ***)
	    if q <= p
	    then raise(ParsingError("Prefix operator " ^ x ^ " needs parenthesis here",!lineno,!charno,!lineno,!charno))
	    else
	      let (a,ts) = parse_S_ (p+1) tr in
	      if binderishp a
	      then (PreoL(x,a),ts)
	      else parse_S'_ q (PreoL(x,a)) ts
	| (_,_,Some mtok) -> (*** Binder ***)
	    let li = !lineno in
	    let ch = !charno in
	    begin
	      match destr_ts tr with
	      | (tok0,tr1) when namorasctokb tok0 ->
		  let tr = TokStrBuff(tok0,tr1) in
		  begin
		    let (xl,ts0) = parse_Names tr in
		    match destr_ts ts0 with
		    | (COLON,ts) ->
			parse_Binder_ascr li ch x xl mtok AscTp ts (parse_S_ 1010)
		    | (MEM,ts) ->
			parse_Binder_ascr li ch x xl mtok AscSet ts (parse_S_ 1010)
		    | (SUBEQ,ts) ->
			parse_Binder_ascr li ch x xl mtok AscSubeq ts (parse_S_ 1010)
		    | (tok1,ts) ->
			if tok1 = mtok then
			  let (a,tu) = parse_S_ 1010 ts in
			  (BiL(x,(if mtok = COMMA then "," else "=>"),[(xl,None)],a),tu)
			else
			  raise (ParsingError("Ill-formed Binder " ^ x,li,ch,!lineno,!charno))
		  end
	      | (tok0,tr1) ->
		  let (vll,ts0) = parse_TVs (TokStrBuff(tok0,tr1)) in
	          let (tok1,ts) = destr_ts ts0 in
		  if tok1 = mtok then
		    let (a,tu) = parse_S_ 1010 ts in
		    (BiL(x,(if mtok = COMMA then "," else "=>"),vll,a),tu)
		  else
		    raise (ParsingError("Ill-formed Binder " ^ x,li,ch,!lineno,!charno))
	    end
	| _ -> (*** Infix operator: error ***)
	    raise (ParsingError("Unexpected infix operator " ^ x,!lineno,!charno,!lineno,!charno))
      end
  | (LET,tr0) ->
      let li = !lineno in
      let ch = !charno in
      begin
	let (tok0,tr1) = destr_ts tr0 in
	let (tok1,tr) = destr_ts tr1 in
	match (tok0,tok1) with
	| (NAM x,DEQ) ->
	    begin
	      let (a,tu0) = parse_S_ 1010 tr in
	      match destr_ts tu0 with
	      | (IN,tu) ->
		  let (c,tv) = parse_S_ 1010 tu in
		  (LeL(x,None,a,c),tv)
	      | _ -> raise (ParsingError("Ill-formed let",li,ch,!lineno,!charno))
	    end
	| (NAM x,COLON) ->
	    parse_Let_ascr li ch x AscTp tr (parse_S_ 1010)
	| (NAM x,MEM) ->
	    parse_Let_ascr li ch x AscSet tr (parse_S_ 1010)
	| (NAM x,SUBEQ) ->
	    parse_Let_ascr li ch x AscSubeq tr (parse_S_ 1010)
	| (LBRACK,NAM x) ->
	    (*** This is for "let [x,...,y] := S in S" which was not included in the formalized Coq version. - Feb 25 2014 ***)
          begin
            let (xl,tu) = parse_Comma_Names tr in
            match destr_ts tu with
            | (RBRACK,tv) ->
              begin
                match destr_ts tv with
                | (DEQ,tw) ->
                  let (a,tx) = parse_S_ 1010 tw in
                  begin
                    match destr_ts tx with
                    | (IN,ty) ->
                      let (b,tz) = parse_S_ 1010 ty in
                      (LeML(x,xl,a,b),tz)
                    | _ -> raise (ParsingError("Ill-formed let, expected 'in' here",li,ch,!lineno,!charno))
                  end
                | _ -> raise (ParsingError("Ill-formed let, expected := here",li,ch,!lineno,!charno))
              end
            | _ -> raise (ParsingError("Ill-formed let, expected ] here",li,ch,!lineno,!charno))
          end
	| _ -> raise (ParsingError("Ill-formed let",li,ch,!lineno,!charno))
      end
  | (LPAREN,tr) ->
      let lpli = !lineno in
      let lpch = !charno in
      begin
	let (a,ts) = parse_S_ 1023 tr in
	let (bl,tu0) = parse_N ts in
	match destr_ts tu0 with
	| (RPAREN,tu) -> parse_S'_ q (ParenL(a,bl)) tu
	| _ -> raise (ParsingError("Unmatched (",lpli,lpch,!lineno,!charno))
      end
  | (NUM(b,n,m,e),tr) ->
      parse_S'_ q (NuL(b,n,m,e)) tr
  | (LBRACK,tr) ->
      let lpli = !lineno in
      let lpch = !charno in
      begin
	let (a,ts) = parse_S_ 1023 tr in
	let (bl,tu0) = parse_N ts in
	match destr_ts tu0 with
	| (RBRACK,tu) -> parse_S'_ q (MTupleL(a,bl)) tu
	| _ -> raise (ParsingError("Unmatched [",lpli,lpch,!lineno,!charno))
      end
  | (LCBRACE,tr0) ->
      let lpli = !lineno in
      let lpch = !charno in
      begin
	match destr_ts tr0 with
	| (RCBRACE,tr) ->
	    parse_S'_ q (SetEnumL([])) tr
	| (tok,tr) ->
	    parse_S_SetBraces lpli lpch q (TokStrBuff(tok,tr)) (fun a -> a) parse_S'_ parse_S_ parse_N
      end
  | (IF,tr) ->
      let li = !lineno in
      let ch = !charno in
      begin
	let (a,ts0) = parse_S_ 1010 tr in
	match destr_ts ts0 with
	| (THEN,ts) ->
	    begin
	      let (b,tu0) = parse_S_ 1010 ts in
	      match destr_ts tu0 with
	      | (ELSE,tu) ->
		  let (c,tv) = parse_S_ 1010 tu in
		  (IfThenElseL(a,b,c),tv)
	      | _ -> raise (ParsingError("Missing else for if",li,ch,!lineno,!charno))
	    end
	| _ -> raise (ParsingError("Missing then for if",li,ch,!lineno,!charno))
      end
  | _ -> raise (ParsingError("Unwritten case",!lineno,!charno,!lineno,!charno))
and parse_TVs (tl : tokenstream) : (string list * (asckind * ltree) option) list * tokenstream =
  match destr_ts tl with
  | (LPAREN,tr) ->
      let lpli = !lineno in
      let lpch = !charno in
      begin
	let (xl,ts0) = parse_Names tr in
	match destr_ts ts0 with
	| (RPAREN,ts) ->
	    let (vll,tu) = parse_TVs ts in
	    ((xl,None)::vll,tu)
	| (COLON,ts) ->
	    parse_TVs_ascr lpli lpch xl AscTp ts (parse_S_ 1010) parse_TVs
	| (MEM,ts) ->
	    parse_TVs_ascr lpli lpch xl AscSet ts (parse_S_ 1010) parse_TVs
	| (SUBEQ,ts) ->
	    parse_TVs_ascr lpli lpch xl AscSubeq ts (parse_S_ 1010) parse_TVs
	| _ -> raise (ParsingError("Unmatched ( in bound variable declaration",lpli,lpch,!lineno,!charno))
      end
  | (tok,tr) -> ([],TokStrBuff(tok,tr))
and parse_N (tl : tokenstream) : ltree list * tokenstream =
  match destr_ts tl with
  | (COMMA,tr) ->
      let (a,ts) = parse_S_ 1023 tr in
      let (bl,tu) = parse_N ts in
      (a::bl,tu)
  | (tok,tr) -> ([],TokStrBuff(tok,tr))

let read_name_ts tl =
  match destr_ts tl with
  | (NAM x,tr) -> (x,tr)
  | _ -> raise (ParsingError("Name expected",!lineno,!charno,!lineno,!charno))

let read_string_ts tl =
  match destr_ts tl with
  | (STRING x,tr) -> (x,tr)
  | _ -> raise (ParsingError("String (in double quotes) expected",!lineno,!charno,!lineno,!charno))

let rec read_strings_ts tl =
  match destr_ts tl with
  | (STRING x,tr) ->
      let (xl,ts) = read_strings_ts tr in
      (x::xl,ts)
  | (tok,tr) -> ([],TokStrBuff(tok,tr))

let read_int_ts tl : int * tokenstream =
  match destr_ts tl with
  | (NUM(b,x,None,None),tr) ->
      let i = int_of_string x in (*** This could generally be a big_int, but if I've called read_int_ts, then it should be an int. ***)
      ((if b then (- i) else i),tr)
  | _ -> raise (ParsingError("Integer expected",!lineno,!charno,!lineno,!charno))

let rec read_expected_ts tokl tl =
  match tokl with
  | (tok::tokr) ->
      begin
	match destr_ts tl with
	| (tok1,tr) when tok = tok1 -> read_expected_ts tokr tr
	| _ -> raise (ParsingError("Syntax error: unexpected token, expected " ^ (tok_to_str tok),!lineno,!charno,!lineno,!charno))
      end
  | [] -> tl

let parse_ltree tl =
  let (a,tr) = parse_S_ 1023 tl in
  (a,tr)

type indexitem =
  | IndexTm of string * ltree
  | IndexKnown of string

let parse_indexitem tl =
  let li = !lineno in
  let ch = !charno in
  match destr_ts tl with
  | (NAM x,tr) when x = "Known" ->
    begin
      let (y,ts) = read_string_ts tr in
      let tu = read_expected_ts [DOT] ts in
      (IndexKnown(y),tu)
    end
  | (STRING x,tr) ->
    begin
      let (a,ts) = parse_ltree tr in
      let tu = read_expected_ts [DOT] ts in
      (IndexTm(x,a),tu)
    end
  | _ -> raise (ParsingError("Expected string or Known",li,ch,!lineno,!charno))

let parse_docitem tl =
  let li = !lineno in
  let ch = !charno in
  match destr_ts tl with
  | (OPENCOM,tr) ->
      begin
	match destr_ts tr with
	| (PARAM,ts) ->
	    let (x,tu) = read_name_ts ts in
	    let (y,tv) = read_string_ts tu in
            begin
              match destr_ts tv with
              | (CLOSECOM,tw) -> (ParamHash(x,y,None),tw)
              | (STRING z,tw) ->
	         let tw = read_expected_ts [CLOSECOM] tw in
                 (ParamHash(x,y,Some(z)),tw)
              | _ -> raise (ParsingError("Syntax error: expected *) or string",!lineno,!charno,!lineno,!charno))
            end
	| (UNICODE,ts) ->
	    let (x,tu) = read_name_ts ts in
	    let (yl,tv) = read_strings_ts tu in
	    let tw = read_expected_ts [CLOSECOM] tv in
	    (UnicodeDecl(x,yl),tw)
	| (SUBSCRIPT,ts) ->
	    let (x,tu) = read_name_ts ts in
	    let tv = read_expected_ts [CLOSECOM] tu in
	    (SubscriptDecl(x),tv)
	| (SUPERSCRIPT,ts) ->
	    let (x,tu) = read_name_ts ts in
	    let tv = read_expected_ts [CLOSECOM] tu in
	    (SuperscriptDecl(x),tv)
	| (AUTHOR,ts) ->
	    let (x,tu) = read_string_ts ts in
	    let (yl,tv) = read_strings_ts tu in
	    let tw = read_expected_ts [CLOSECOM] tv in
	    (Author(x,yl),tw)
	| (TITLE,ts) ->
	    let (x,tu) = read_string_ts ts in
	    let tv = read_expected_ts [CLOSECOM] tu in
	    (Title(x),tv)
	| (SPECCOMM("ShowProofTerms"),ts) ->
	    let tu = read_expected_ts [CLOSECOM] ts in
	    (ShowProofTerms true,tu)
	| (SPECCOMM("HideProofTerms"),ts) ->
	    let tu = read_expected_ts [CLOSECOM] ts in
	    (ShowProofTerms false,tu)
	| (SALT,ts) ->
	    let (x,tu) = read_string_ts ts in
	    let tv = read_expected_ts [CLOSECOM] tu in
	    (Salt(x),tv)
	| (TREASURE,ts) ->
	    let (x,tu) = read_string_ts ts in
	    let tv = read_expected_ts [CLOSECOM] tu in
	    (Treasure(x),tv)
	| _ -> raise (ParsingError("Syntax error",li,ch,!lineno,!charno))
      end
  | (PARAM,tr) ->
      begin
	let (x,ts) = read_name_ts tr in
	let tu = read_expected_ts [COLON] ts in
	let (a,tv) = parse_ltree tu in
	let tw = read_expected_ts [DOT] tv in
	(ParamDecl(x,a),tw)
      end
  | (DEF,tr) ->
      begin
	let (x,ts) = read_name_ts tr in
	match destr_ts ts with
	| (COLON,tu) ->
	    let (a,tv) = parse_ltree tu in
	    let tw = read_expected_ts [DEQ] tv in
	    let (b,tx) = parse_ltree tw in
	    let ty = read_expected_ts [DOT] tx in
	    (DefDecl(x,Some(a),b),ty)
	| (DEQ,tu) ->
	    let (b,tv) = parse_ltree tu in
	    let tw = read_expected_ts [DOT] tv in
	    (DefDecl(x,None,b),tw)
	| _ -> raise (ParsingError("Syntax error in definition declaration",li,ch,!lineno,!charno))
      end
  | (INFIX,tr) ->
      begin
	let (x,ts) = read_name_ts tr in
	let (p,tu) = read_int_ts ts in
	if (p <= 0 || p >= 1000) then
	  raise (ParsingError("Infix operator priority must be an positive integer < 1000",li,ch,!lineno,!charno))
	else
	  match destr_ts tu with
	  | (NAM y,tv) ->
	      let pic = if y = "left" then InfixLeft else if y = "right" then InfixRight else raise (ParsingError("Infix operator priority can have declared associativity left or right, not " ^ y,li,ch,!lineno,!charno))
	      in
	      if (pic = InfixRight && p = 500) then raise (ParsingError("Right associative infix operators cannot have priority 500.",li,ch,!lineno,!charno));
	      let tw = read_expected_ts [DEQ] tv in
	      let (a,tx) = parse_ltree tw in
	      let ty = read_expected_ts [DOT] tx in
	      (PostInfixDecl(x,a,p,pic),ty)
	  | (DEQ,tw) ->
	      let (a,tx) = parse_ltree tw in
	      let ty = read_expected_ts [DOT] tx in
	      (PostInfixDecl(x,a,p,InfixNone),ty)
	  | _ ->
	      raise (ParsingError("Syntax error in infix declaration. Expected Infix <name> <priority> [left|right] := <term>.",li,ch,!lineno,!charno))
      end
  | (POSTFIX,tr) ->
      begin
	let (x,ts) = read_name_ts tr in
	let (p,tu) = read_int_ts ts in
	if (p <= 0 || p >= 1000) then
	  raise (ParsingError("Postfix operator priority must be an positive integer < 1000",li,ch,!lineno,!charno))
	else
	  begin
	    let tv = read_expected_ts [DEQ] tu in
	    let (a,tx) = parse_ltree tv in
	    let ty = read_expected_ts [DOT] tx in
	    (PostInfixDecl(x,a,p,Postfix),ty)
	  end
      end
  | (PREFIX,tr) ->
      begin
	let (x,ts) = read_name_ts tr in
	let (p,tu) = read_int_ts ts in
	if (p <= 0 || p >= 1000 || p = 500) then
	  raise (ParsingError("Prefix operator priority must be an positive integer, not 500, and < 1000",li,ch,!lineno,!charno))
	else
	  begin
	    let tv = read_expected_ts [DEQ] tu in
	    let (a,tx) = parse_ltree tv in
	    let ty = read_expected_ts [DOT] tx in
	    (PrefixDecl(x,a,p),ty)
	  end
      end
  | (BINDER,tr) ->
      let (x,ts) = read_name_ts tr in
      let (comma,tu) =
	begin
	  match destr_ts ts with
	  | (COMMA,tu) -> (true,tu)
	  | (DARR,tu) -> (false,tu)
	  | _ -> raise (ParsingError("The token (either , or =>) separating the bound variables from the body is expected here.",li,ch,!lineno,!charno))
	end
      in
      let tv = read_expected_ts [DEQ] tu in
      let (a,tx) = parse_ltree tv in
      begin
	  match destr_ts tx with
	  | (DOT,ty) -> (BinderDecl(false,comma,x,a,None),ty)
	  | (SEMICOLON,ty) ->
	      let (b,tz) = parse_ltree ty in
	      let tzs = read_expected_ts [DOT] tz in
	      (BinderDecl(false,comma,x,a,Some(b)),tzs)
	  | _ -> raise (ParsingError("Expected . or ; here.",li,ch,!lineno,!charno))
      end
  | (BINDERPLUS,tr) ->
      let (x,ts) = read_name_ts tr in
      let (comma,tu) =
	begin
	  match destr_ts ts with
	  | (COMMA,tu) -> (true,tu)
	  | (DARR,tu) -> (false,tu)
	  | _ -> raise (ParsingError("The token (either , or =>) separating the bound variables from the body is expected here.",li,ch,!lineno,!charno))
	end
      in
      let tv = read_expected_ts [DEQ] tu in
      let (a,tx) = parse_ltree tv in
      begin
	  match destr_ts tx with
	  | (DOT,ty) -> (BinderDecl(true,comma,x,a,None),ty)
	  | (SEMICOLON,ty) ->
	      let (b,tz) = parse_ltree ty in
	      let tzs = read_expected_ts [DOT] tz in
	      (BinderDecl(true,comma,x,a,Some(b)),tzs)
	  | _ -> raise (ParsingError("Expected . or ; here.",li,ch,!lineno,!charno))
      end
  | (NOTATION,tr) ->
      let (x,ts) = read_name_ts tr in
      let (yl,tu) = parse_Names ts in
      let tv = read_expected_ts [DOT] tu in
      (NotationDecl(x,yl),tv)
  | (SECTION,tr) ->
      let (x,ts) = read_name_ts tr in
      let tu = read_expected_ts [DOT] ts in
      (Section(x),tu)
  | (END,tr) ->
      let (x,ts) = read_name_ts tr in
      let tu = read_expected_ts [DOT] ts in
      (End(x),tu)
  | (VAR,tr) ->
      let (xl,ts) = parse_Names tr in
      let (ak,tu) =
	begin
	  match destr_ts ts with
	  | (COLON,tu) -> (AscTp,tu)
	  | (MEM,tu) -> (AscSet,tu)
	  | (SUBEQ,tu) -> (AscSubeq,tu)
	  | _ -> raise (ParsingError("Missing ascription in Variable declaration.",li,ch,!lineno,!charno))
	end
      in
      let (a,tv) = parse_ltree tu in
      let tw = read_expected_ts [DOT] tv in
      (VarDecl(xl,ak,a),tw)
  | (HYP,tr) ->
      let (x,ts) = read_name_ts tr in
      let tu = read_expected_ts [COLON] ts in
      let (a,tv) = parse_ltree tu in
      let tw = read_expected_ts [DOT] tv in
      (HypDecl(x,a),tw)
  | (LETDEC,tr) ->
      let (x,ts) = read_name_ts tr in
      let (ako,tu) =
	begin
	  match destr_ts ts with
	  | (COLON,tu) -> (Some AscTp,tu)
	  | (MEM,tu) -> (Some AscSet,tu)
	  | (SUBEQ,tu) -> (Some AscSubeq,tu)
	  | (DEQ,tu) -> (None,tu)
	  | _ -> raise (ParsingError("Syntax error in Let declaration.",li,ch,!lineno,!charno))
	end
      in
      let (a,tv) = parse_ltree tu in
      begin
	match ako with
	| Some ak ->
	    let tw = read_expected_ts [DEQ] tv in
	    let (b,tx) = parse_ltree tw in
	    let ty = read_expected_ts [DOT] tx in
	    (LetDecl(x,Some(ak,a),b),ty)
	| None ->
	    let tw = read_expected_ts [DOT] tv in
	    (LetDecl(x,None,a),tw)
      end
  | (AXIOM,tr) ->
      let (x,ts) = read_name_ts tr in
      let tu = read_expected_ts [COLON] ts in
      let (a,tv) = parse_ltree tu in
      let tw = read_expected_ts [DOT] tv in
      (AxDecl(x,a),tw)
  | (THEOREM(c),tr) ->
      let (x,ts) = read_name_ts tr in
      let tu = read_expected_ts [COLON] ts in
      let (a,tv) = parse_ltree tu in
      let tw = read_expected_ts [DOT] tv in
      (ThmDecl(c,x,a),tw)
  | _ -> raise (ParsingError("Expected a Document Item",li,ch,!lineno,!charno))

let rec read_case tl =
  let (x,tr) = read_name_ts tl in
  let ts = read_expected_ts [COLON] tr in
  let (b,tu) = parse_ltree ts in
  match destr_ts tu with
  | (COMMA,tv) ->
      let (xbl,tok,tw) = read_case tv in
      ((x,b)::xbl,tok,tw)
  | (tok,tv) ->
      ([],tok,tv)

let rec read_cases tl =
  let (xbl,tok,tr) = read_case tl in
  match tok with
  | VBAR ->
      let (xbll,tu) = read_cases tr in
      (xbl::xbll,tu)
  | DOT ->
      ([],tr)
  | _ -> raise (ParsingError("Expected | or .",!lineno,!charno,!lineno,!charno))

let parse_pftacitem tl =
  let li = !lineno in
  let ch = !charno in
  match destr_ts tl with
  | (NAM "-",tr) -> (PfStruct 1,tr)
  | (NAM "+",tr) -> (PfStruct 2,tr)
  | (NAM "*",tr) -> (PfStruct 3,tr)
  | (LCBRACE,tr) -> (PfStruct 4,tr)
  | (RCBRACE,tr) -> (PfStruct 5,tr)
  | (QED,tr) -> let tu = read_expected_ts [DOT] tr in (Qed,tu)
  | (ADMITTED,tr) -> let tu = read_expected_ts [DOT] tr in (Admitted,tu)
  | (ADMIT,tr) -> let tu = read_expected_ts [DOT] tr in (Admit,tu)
  | (EXACT,tr) ->
      let (a,tu) = parse_ltree tr in
      let tv = read_expected_ts [DOT] tu in
      (Exact(a),tv)
  | (LET,tr) ->
      let (xl,ts) = parse_Names tr in
      begin
	match destr_ts ts with
	| (COLON,tu) ->
	    let (a,tv) = parse_ltree tu in
	    let tw = read_expected_ts [DOT] tv in
	    (LetTac(xl,Some(a)),tw)
	| (DOT,tu) ->
	    (LetTac(xl,None),tu)
	| _ ->
	    raise (ParsingError("Expected let <names> [: <tp>]",li,ch,!lineno,!charno))
      end
  | (ASSUME,tr) ->
      let (xl,ts) = parse_Names tr in
      begin
	match destr_ts ts with
	| (COLON,tu) ->
	    let (a,tv) = parse_ltree tu in
	    let tw = read_expected_ts [DOT] tv in
	    (AssumeTac(xl,Some(a)),tw)
	| (DOT,tu) ->
	    (AssumeTac(xl,None),tu)
	| (MEM,tu) ->
	    raise (ParsingError("Confused by :e after assume; probably need a space between : and e. Expected assume <names> [: <prop>]",li,ch,!lineno,!charno))
	| _ ->
	    raise (ParsingError("Expected assume <names> [: <prop>]",li,ch,!lineno,!charno))
      end
  | (NAM "set",tr) ->
      let (x,ts) = read_name_ts tr in
      begin
	match destr_ts ts with
	| (COLON,tu) ->
	    let (a,tv) = parse_ltree tu in
	    let tw = read_expected_ts [DEQ] tv in
	    let (b,tx) = parse_ltree tw in
	    let ty = read_expected_ts [DOT] tx in
	    (SetTac(x,Some(a),b),ty)
	| (DEQ,tu) ->
	    let (b,tv) = parse_ltree tu in
	    let tw = read_expected_ts [DOT] tv in
	    (SetTac(x,None,b),tw)
	| _ ->
	    raise (ParsingError("Expected set <name> [: <tp>] := <tm>",li,ch,!lineno,!charno))
      end
  | (APPLY,tr) ->
      let (a,ts) = parse_ltree tr in
      let tu = read_expected_ts [DOT] ts in
      (ApplyTac(a),tu)
  | (PROVE,tr) ->
      let (a,ts) = parse_ltree tr in
      let (bl,tu) = parse_N ts in
      let tv = read_expected_ts [DOT] tu in
      (ProveTac(a,bl),tv)
  | (CLAIM,tr) ->
      let (x,ts) = read_name_ts tr in
      let tu = read_expected_ts [COLON] ts in
      let (a,tv) = parse_ltree tu in
      let tw = read_expected_ts [DOT] tv in
      (ClaimTac(x,a),tw)
  | (NAM "cases",tr) ->
      let (a,ts) = parse_ltree tr in
      let tu = read_expected_ts [COLON] ts in
      let (xbll,tv) = read_cases tu in
      (CasesTac(a,xbll),tv)
  | (NAM "witness",tr) ->
      let (a,ts) = parse_ltree tr in
      let tu = read_expected_ts [DOT] ts in
      (WitnessTac(a),tu)
  | (NAM "rewrite",tr) ->
      begin
	match destr_ts tr with
	| (NAM "<-",ts) ->
	    begin
	      let (a,tu) = parse_ltree ts in
	      match destr_ts tu with
	      | (DOT,tv) ->
		  (RewriteTac(true,a,[]),tv)
	      | (AT,tv) ->
		  let (tok,tw) = destr_ts tv in
		  let tokr = ref tok in
		  let twr = ref tw in
		  let il = ref [] in
		  while (match !tokr with NUM(_,_,_,_) -> true | _ -> false) do
		    match !tokr with
		    | NUM(false,i,None,None) ->
			let (_,i2) = whole_of_string i 0 (String.length i) 0L in
			let i3 = Int64.to_int i2 in
			if i3 = 0 then raise (ParsingError("Syntax error: expected rewrite <- <pftrm> at <posints>.",li,ch,!lineno,!charno));
			il := i3::!il;
			let (tok,tw) = destr_ts !twr in
			tokr := tok;
			twr := tw
		    | _ -> raise (ParsingError("Syntax error: expected rewrite <- <pftrm> at <posints>.",li,ch,!lineno,!charno))
		  done;
		  begin
		    match !tokr with
		    | DOT -> (RewriteTac(true,a,List.rev !il),!twr)
		    | _ -> raise (ParsingError("Syntax error: expected rewrite <- <pftrm> at <posints>.",li,ch,!lineno,!charno))
		  end
	      | _  -> raise (ParsingError("Syntax error: expected rewrite <- <pftrm> [at <posints>].",li,ch,!lineno,!charno))
	    end
	| (tok,ts) ->
	    begin
	      let (a,tu) = parse_ltree (TokStrBuff(tok,ts)) in
	      match destr_ts tu with
	      | (DOT,tv) ->
		  (RewriteTac(false,a,[]),tv)
	      | (AT,tv) ->
		  let (tok,tw) = destr_ts tv in
		  let tokr = ref tok in
		  let twr = ref tw in
		  let il = ref [] in
		  while (match !tokr with NUM(_,_,_,_) -> true | _ -> false) do
		    match !tokr with
		    | NUM(false,i,None,None) ->
			let (_,i2) = whole_of_string i 0 (String.length i) 0L in
			let i3 = Int64.to_int i2 in
			if i3 = 0 then raise (ParsingError("Syntax error: expected rewrite <- <pftrm> at <posints>.",li,ch,!lineno,!charno));
			il := i3::!il;
			let (tok,tw) = destr_ts !twr in
			tokr := tok;
			twr := tw
		    | _ -> raise (ParsingError("Syntax error: expected rewrite <pftrm> at <posints>.",li,ch,!lineno,!charno))
		  done;
		  begin
		    match !tokr with
		    | DOT -> (RewriteTac(false,a,List.rev !il),!twr)
		    | _ -> raise (ParsingError("Syntax error: expected rewrite <pftrm> at <posints>.",li,ch,!lineno,!charno))
		  end;
	      | _  -> raise (ParsingError("Syntax error: expected rewrite <pftrm> [at <posints>].",li,ch,!lineno,!charno))
	    end
      end
  | (NAM "distinct",tr) ->
     let tu = read_expected_ts [DOT] tr in
     (SpecialTac("distinct",[]),tu)
  | (NAM "reflexivity",tr) ->
     let tu = read_expected_ts [DOT] tr in
     (SpecialTac("reflexivity",[]),tu)
  | (NAM "symmetry",tr) ->
     let tu = read_expected_ts [DOT] tr in
     (SpecialTac("symmetry",[]),tu)
  | (NAM "transitivity",tr) ->
     let (a,ts) = parse_S_ 1023 tr in
     let (bl,tu) = parse_N ts in
     let tv = read_expected_ts [DOT] tu in
     (SpecialTac("transitivity",(a::bl)),tv)
  | (NAM "f_equal",tr) ->
     let tu = read_expected_ts [DOT] tr in
     (SpecialTac("f_equal",[]),tu)
  | _ -> raise (ParsingError("Expected a Proof Tactic",li,ch,!lineno,!charno))

(*** Given a popfn for how to undo everything when the current section ends,
     return a new popfn that will also undo what I'm doing here. ***)
let declare_postinfix x a p pic popfn =
  if (p <= 0 || p >= 1000) then
    raise (Failure("Priorities must be an positive integer and < 1000"))
  else if (p = 500 && pic = InfixRight) then
    raise (Failure("Right infix operators cannot have priority 500."))
  else if (Hashtbl.mem prefixpriorities p) then
    raise (Failure(x ^ " cannot be given priority " ^ (string_of_int p) ^ " since a prefix has this priority already."))
  else if (pic = InfixRight && Hashtbl.mem disallowedrightinfixpriorities p) then
    raise (Failure(x ^ " cannot be given priority " ^ (string_of_int p) ^ " since a nonright infix operator or postfix operator has this priority already."))
  else if (pic <> InfixRight && Hashtbl.mem rightinfixpriorities p) then
    raise (Failure(x ^ " cannot be given priority " ^ (string_of_int p) ^ " since a right infix operator has this priority already."))
  else
    let f = ref (fun () -> Hashtbl.remove disallowedprefixpriorities p; popfn ()) in
    begin
      Hashtbl.add penv_postinfop x (p,pic);
      let fnow = !f in
      f := (fun () -> Hashtbl.remove penv_postinfop x; fnow ());
      Hashtbl.add disallowedprefixpriorities p ();
      if (pic = InfixRight) then
	begin
	  Hashtbl.add rightinfixpriorities p ();
	  let fnow = !f in
	  f := (fun () -> Hashtbl.remove rightinfixpriorities p; fnow ())
	end
      else
	begin
	  Hashtbl.add disallowedrightinfixpriorities p ();
	  let fnow = !f in
	  f := (fun () -> Hashtbl.remove disallowedrightinfixpriorities p; fnow ())
	end;
      begin
	match pic with
	| Postfix ->
	    Hashtbl.add postfixsem x a;
	    let fnow = !f in
	    f := (fun () -> Hashtbl.remove postfixsem x; fnow ())
	| _ ->
	    Hashtbl.add infixsem x a;
	    let fnow = !f in
	    f := (fun () -> Hashtbl.remove infixsem x; fnow ())
      end;
      !f
    end

(*** Given a popfn for how to undo everything when the current section ends,
     return a new popfn that will also undo what I'm doing here. ***)
let declare_prefix x a p popfn =
  if (p <= 0 || p >= 1000 || p = 500) then
    raise (Failure("Priorities must be an positive integer, not 500, and < 1000"))
  else
    if (Hashtbl.mem disallowedprefixpriorities p) then
      raise (Failure(x ^ " cannot be given priority " ^ (string_of_int p) ^ " since an infix or postfix operator has this priority already."))
    else
      begin
	begin
	    match penv x with
	  | (_,_,Some _) -> raise (Failure(x ^ " is already a binder and cannot be used as a prefix operator."))
	  | _ -> ()
	end;
	Hashtbl.add prefixpriorities p ();
	Hashtbl.add disallowedrightinfixpriorities p ();
	Hashtbl.add penv_preop x p;
	Hashtbl.add prefixsem x a;
	(fun () ->
	  Hashtbl.remove prefixpriorities p;
	  Hashtbl.remove disallowedrightinfixpriorities p;
	  Hashtbl.remove penv_preop x;
	  Hashtbl.remove prefixsem x;
	  popfn ())
      end

let declare_binder plus comma x a bo popfn =
  begin
    begin
      match penv x with
      | (Some _,_,_) -> raise (Failure(x ^ " is already a prefix operator and cannot be used as a binder."))
      | _ -> ()
    end;
    let midtok = if comma then COMMA else DARR in
    Hashtbl.add penv_binder x midtok;
    Hashtbl.add bindersem x (plus,a,bo);
    (fun () ->
      Hashtbl.remove penv_binder x;
      Hashtbl.remove bindersem x;
      popfn ())
  end
  
(*** auxiliary function to add parens if needed ***)
let a2l_paren q (a,p) : ltree =
  if p <= q then
    a
  else
    ParenL(a,[])

(***
    convert an atree to an ltree (using penv info);
    return a level to determine where parens are needed
 ***)
let rec atree_to_ltree_level (a:atree) : ltree * int =
  match a with
  | Byte(x) -> (ByteL(x),0)
  | String(x) -> (StringL(x),0)
  | QString(x) -> (QStringL(x),0)
  | Na(x) -> (NaL(x),0)
  | Nu(b,x,y,z) -> (NuL(b,x,y,z),0)
  | Le(x,None,a,c) ->
      let al = a2l_paren 1010 (atree_to_ltree_level a) in
      let cl = a2l_paren 1010 (atree_to_ltree_level c) in
      (LeL(x,None,al,cl),1)
  | Le(x,Some(i,b),a,c) ->
      let al = a2l_paren 1010 (atree_to_ltree_level a) in
      let bl = a2l_paren 1010 (atree_to_ltree_level b) in
      let cl = a2l_paren 1010 (atree_to_ltree_level c) in
      (LeL(x,Some(i,bl),al,cl),1)
  | LeM(x,xl,a,c) ->
      let al = a2l_paren 1010 (atree_to_ltree_level a) in
      let cl = a2l_paren 1010 (atree_to_ltree_level c) in
      (LeML(x,xl,al,cl),1)
  | Bi(x,vll,a) ->
      begin
	match penv x with
	| (_,_,Some mtok) ->
	    let mtokstr =
	      match mtok with
	      | COMMA -> ","
	      | DARR -> "=>"
	      | _ -> raise (Failure ("Bad mid token for an " ^ x ^ " binder"))
	    in
	    let vlll = List.map (fun (xl,o) ->
	      match o with
	      | Some(i,b) -> (xl,Some(i,a2l_paren 1010 (atree_to_ltree_level b)))
	      | None -> (xl,None)
		  ) vll
	    in
	    let al = a2l_paren 1010 (atree_to_ltree_level a) in
	    (BiL(x,mtokstr,vlll,al),1)
	| (_,_,None) -> raise (Failure ("Undeclared binder " ^ x))
      end
  | Preo(x,a) ->
      begin
	match penv x with
	| (Some p,_,_) ->
	    (PreoL(x,a2l_paren (p+1) (atree_to_ltree_level a)),p+1)
	| (None,_,_) -> raise (Failure ("Undeclared prefix operator " ^ x))
      end
  | Posto(x,a) -> (*** if binderishp al ... ***)
      begin
	match penv x with
	| (_,Some(p,Postfix),_) ->
	    let al = a2l_paren (p+1) (atree_to_ltree_level a) in
	    if binderishp al then
	      (PostoL(x,ParenL(al,[])),p+1)
	    else
	      (PostoL(x,al),p+1)
	| (_,_,_) -> raise (Failure ("Undeclared postfix operator " ^ x))
      end
  | Info(InfSet i,a,b) -> (*** if binderishp al ... ***)
      let al = a2l_paren 500 (atree_to_ltree_level a) in
      let bl = a2l_paren 500 (atree_to_ltree_level b) in
      if binderishp al then
	(InfoL(InfSet i,ParenL(al,[]),bl),501)
      else
	(InfoL(InfSet i,al,bl),501)
  | Info(InfNam x,a,b) -> (*** if binderishp al ... ***)
      begin
	match penv x with
	| (_,Some(p,InfixNone),_) ->
	    let al = a2l_paren p (atree_to_ltree_level a) in
	    let bl = a2l_paren p (atree_to_ltree_level b) in
	    if binderishp al then
	      (InfoL(InfNam x,ParenL(al,[]),bl),p+1)
	    else
	      (InfoL(InfNam x,al,bl),p+1)
	| (_,Some(p,InfixLeft),_) ->
	    let al = a2l_paren (p+1) (atree_to_ltree_level a) in
	    let bl = a2l_paren p (atree_to_ltree_level b) in
	    if binderishp al then
	      (InfoL(InfNam x,ParenL(al,[]),bl),p+1)
	    else
	      (InfoL(InfNam x,al,bl),p+1)
	| (_,Some(p,InfixRight),_) ->
	    let al = a2l_paren p (atree_to_ltree_level a) in
	    let bl = a2l_paren (p+1) (atree_to_ltree_level b) in
	    if binderishp al then
	      (InfoL(InfNam x,ParenL(al,[]),bl),p+1)
	    else
	      (InfoL(InfNam x,al,bl),p+1)
	| (_,_,_) -> raise (Failure ("Undeclared infix operator " ^ x))
      end
  | Implop(a,b) ->
      let al = a2l_paren 1 (atree_to_ltree_level a) in
      let bl = a2l_paren 0 (atree_to_ltree_level b) in
      if (binderishp al) then
	(ImplopL(ParenL(al,[]),bl),1)
      else
	(ImplopL(al,bl),1)
  | Sep(x,i,a,b) ->
      let al = a2l_paren 500 (atree_to_ltree_level a) in
      let bl = a2l_paren 1010 (atree_to_ltree_level b) in
      (SepL(x,i,al,bl),0)
  | Rep(x,i,a,b) ->
      let al = a2l_paren 1010 (atree_to_ltree_level a) in
      let bl = a2l_paren 500 (atree_to_ltree_level b) in
      (RepL(x,i,al,bl),0)
  | SepRep(x,i,a,b,c) ->
      let al = a2l_paren 1010 (atree_to_ltree_level a) in
      let bl = a2l_paren 500 (atree_to_ltree_level b) in
      let cl = a2l_paren 1010 (atree_to_ltree_level c) in
      (SepRepL(x,i,al,bl,cl),0)
  | SetEnum(al) ->
      (SetEnumL(List.map
		  (fun a ->
		    let (l,_) = atree_to_ltree_level a in
		    l)
		  al),0)
  | MTuple(a,cl) ->
      let (al,_) = atree_to_ltree_level a in
      (MTupleL(al,List.map
		(fun a ->
		  let (l,_) = atree_to_ltree_level a in
		  l)
		cl),0)
  | Tuple(a,b,cl) ->
      let (al,_) = atree_to_ltree_level a in
      let (bl,_) = atree_to_ltree_level b in
      (ParenL(al,bl::List.map
		       (fun a ->
			 let (l,_) = atree_to_ltree_level a in
			 l)
		       cl),0)
  | IfThenElse(a,b,c) ->
      let al = a2l_paren 1010 (atree_to_ltree_level a) in
      let bl = a2l_paren 1010 (atree_to_ltree_level b) in
      let cl = a2l_paren 1010 (atree_to_ltree_level c) in
      (IfThenElseL(al,bl,cl),1)

let atree_to_ltree (a:atree) : ltree =
  let (l,_) = atree_to_ltree_level a in
  l
