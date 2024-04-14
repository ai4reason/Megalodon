open Syntax

val lineno : int ref
val charno : int ref
val update_char_pos : string -> unit
val update_pos : string -> unit
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
  | OPAQUE
  | TRANSPARENT
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

val num_of_string : string -> token

val infixsem : (string,atree) Hashtbl.t
val postfixsem : (string,atree) Hashtbl.t
val prefixsem : (string,atree) Hashtbl.t
val bindersem : (string,bool * atree * atree option) Hashtbl.t

type parseenv = string -> int option * (int * picase) option * token option

type tokenstream =
  | TokStrBuff of token * tokenstream
  | TokStrRest of (Lexing.lexbuf -> token) * Lexing.lexbuf

val destr_ts : tokenstream -> token * tokenstream

val parse_S_ : int -> tokenstream -> ltree * tokenstream

type indexitem =
  | IndexTm of string * ltree
  | IndexKnown of string

val parse_indexitem : tokenstream -> indexitem * tokenstream
val parse_docitem : tokenstream -> docitem * tokenstream
val parse_pftacitem : tokenstream -> pftacitem * tokenstream

val atree_to_ltree : atree -> ltree

val declare_postinfix : string -> atree -> int -> picase -> (unit -> unit) -> (unit -> unit)

val declare_prefix : string -> atree -> int -> (unit -> unit) -> (unit -> unit)

val declare_binder : bool -> bool -> string -> atree -> atree option -> (unit -> unit) -> (unit -> unit)

