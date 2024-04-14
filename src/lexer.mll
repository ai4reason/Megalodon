(* File: lexer.mll *)
(* Author: Chad E Brown *)
(* Created: September 2011 (Scavanaged from holitmus; Changed to Coq syntax) *)

{
open Parser        (* The type token is defined in parser.mli *)
exception Eof
}
rule token = parse
| [' ' '\t' '\r']     { incr charno; token lexbuf }     (* skip white space *)
| ['\n']         { incr lineno; charno := 0; token lexbuf }     (* skip white space *)
| ['(']['*']['*']['*']*[^'*']*['*']+[')'] as lxm { update_pos lxm; token lexbuf }     (* skip comments *)
| "(*" as lxm          { update_char_pos lxm; OPENCOM }
| "*)" as lxm          { update_char_pos lxm; CLOSECOM }
| ['"'][^'"']*['"'] as lxm           { update_char_pos lxm; STRING(String.sub lxm 1 (String.length lxm - 2)) }
| ['?'][^'?']*['?'] as lxm           { update_char_pos lxm; QUESTIONSTRING(String.sub lxm 1 (String.length lxm - 2)) }
| '('           { incr charno; LPAREN }
| ')'           { incr charno; RPAREN }
| '['           { incr charno; LBRACK }
| ']'           { incr charno; RBRACK }
| '{'           { incr charno; LCBRACE }
| '}'           { incr charno; RCBRACE }
| '|'           { incr charno; VBAR }
| '.'           { incr charno; DOT }
| ':'           { incr charno; COLON }
| '\\'          { incr charno; BACKSLASH }
| "="           { incr charno; NAM("=") }
| "<>" as lxm           { update_char_pos lxm; NAM(lxm) }
| ":e" as lxm           { update_char_pos lxm; MEM }
| "/:e" as lxm           { update_char_pos lxm; NAM(lxm) }
| "c=" as lxm           { update_char_pos lxm; SUBEQ }
| "/c=" as lxm           { update_char_pos lxm; NAM(lxm) }
| '~'           { incr charno; NAM("~") }
| '+'           { incr charno; NAM("+") }
| '*'           { incr charno; NAM("*") }
| '^'          { incr charno; NAM("^") }
| '-'           { incr charno; NAM("-") }
| ';'            { incr charno; SEMICOLON }
| ','            { incr charno; COMMA }
| '!'                     { incr charno; NAM("!") }
| "at" as lxm          { update_char_pos lxm; AT }
| "if" as lxm          { update_char_pos lxm; IF }
| "then" as lxm        { update_char_pos lxm; THEN }
| "else" as lxm        { update_char_pos lxm; ELSE }
| "let" as lxm         { update_char_pos lxm; LET }
| "assume" as lxm         { update_char_pos lxm; ASSUME }
| "apply" as lxm         { update_char_pos lxm; APPLY }
| "claim" as lxm         { update_char_pos lxm; CLAIM }
| "prove" as lxm         { update_char_pos lxm; PROVE }
| ":=" as lxm          { update_char_pos lxm; DEQ }
| "in" as lxm         { update_char_pos lxm; IN }
| "=>" as lxm          { update_char_pos lxm; DARR }
| "exists!" as lxm           { update_char_pos lxm; NAM("exists!") }
| "some" as lxm           { update_char_pos lxm; NAM("some") }
| "/\\" as lxm         { update_char_pos lxm; NAM(lxm) }
| "\\/" as lxm           { update_char_pos lxm; NAM(lxm) }
| "/\\_" as lxm         { update_char_pos lxm; NAM(lxm) }
| "\\/_" as lxm           { update_char_pos lxm; NAM(lxm) }
| "<->" as lxm           { update_char_pos lxm; NAM(lxm) }
| "<=>" as lxm           { update_char_pos lxm; NAM(lxm) }
| "fun" as lxm         { update_char_pos lxm; NAM(lxm) }
| "->" as lxm          { update_char_pos lxm; NAM(lxm) }
| "<-" as lxm          { update_char_pos lxm; NAM(lxm) }
| '>'          { incr charno; NAM(">") }
| '<'          { incr charno; NAM("<") }
| ">=" as lxm          { update_char_pos lxm; NAM(lxm) }
| "<=" as lxm          { update_char_pos lxm; NAM(lxm) }
| "'"          { incr charno; NAM("'") }
| "Section" as lxm         { update_char_pos lxm; SECTION }
| "End" as lxm         { update_char_pos lxm; END }
| "Let" as lxm         { update_char_pos lxm; LETDEC }
| "Variable" as lxm         { update_char_pos lxm; VAR }
| "Hypothesis" as lxm         { update_char_pos lxm; HYP }
| "Parameter" as lxm       { update_char_pos lxm; PARAM }
| "Axiom" as lxm       { update_char_pos lxm; AXIOM }
| "Lemma" as lxm       { update_char_pos lxm; THEOREM(lxm) }
| "Theorem" as lxm       { update_char_pos lxm; THEOREM(lxm) }
| "Example" as lxm       { update_char_pos lxm; THEOREM(lxm) }
| "Fact" as lxm       { update_char_pos lxm; THEOREM(lxm) }
| "Remark" as lxm       { update_char_pos lxm; THEOREM(lxm) }
| "Corollary" as lxm       { update_char_pos lxm; THEOREM(lxm) }
| "Proposition" as lxm       { update_char_pos lxm; THEOREM(lxm) }
| "Property" as lxm       { update_char_pos lxm; THEOREM(lxm) }
| "exact" as lxm       { update_char_pos lxm; EXACT }
| "Qed" as lxm       { update_char_pos lxm; QED }
| "Axiom" as lxm       { update_char_pos lxm; AXIOM }
| "Conjecture" as lxm       { update_char_pos lxm; CONJECTURE }
| "Definition" as lxm         { update_char_pos lxm; DEF }
| "Infix" as lxm         { update_char_pos lxm; INFIX }
| "Postfix" as lxm         { update_char_pos lxm; POSTFIX }
| "Prefix" as lxm         { update_char_pos lxm; PREFIX }
| "Binder" as lxm         { update_char_pos lxm; BINDER }
| "Binder+" as lxm         { update_char_pos lxm; BINDERPLUS }
| "Notation" as lxm         { update_char_pos lxm; NOTATION }
| "Unicode" as lxm         { update_char_pos lxm; UNICODE }
| "Subscript" as lxm       { update_char_pos lxm; SUBSCRIPT }
| "Superscript" as lxm       { update_char_pos lxm; SUPERSCRIPT }
| "ShowProofTerms" as lxm         { update_char_pos lxm; SPECCOMM(lxm) }
| "HideProofTerms" as lxm         { update_char_pos lxm; SPECCOMM(lxm) }
| "Verbose" as lxm { update_char_pos lxm; SPECCOMM(lxm) }
| "Salt" as lxm { update_char_pos lxm; SALT }
| "Opaque" as lxm { update_char_pos lxm; OPAQUE }
| "Transparent" as lxm { update_char_pos lxm; TRANSPARENT }
| "Treasure" as lxm { update_char_pos lxm; TREASURE }
| "Title" as lxm { update_char_pos lxm; TITLE }
| "Author" as lxm { update_char_pos lxm; AUTHOR }
| "Admitted" as lxm { update_char_pos lxm; ADMITTED }
| "admit" as lxm { update_char_pos lxm; ADMIT }
| "TEXT" as lxm { update_char_pos lxm; TEXT }
| ['\'']['_''+''-''*''^''~''=''<''>''/''\\']*['\''] as lxm { update_char_pos lxm; NAM(lxm) }
| [':']['_''+''-''*''^''~''=''<''>''/''\\']*[':'] as lxm { update_char_pos lxm; NAM(lxm) }
| ['0'-'9']+ as lxm { update_char_pos lxm; num_of_string lxm }
| ['0'-'9']+['e''E']['0'-'9']+ as lxm { update_char_pos lxm; num_of_string lxm }
| ['-']['0'-'9']+ as lxm { update_char_pos lxm; num_of_string lxm }
| ['-']['0'-'9']+['e''E']['0'-'9']+ as lxm { update_char_pos lxm; num_of_string lxm }
| ['0'-'9']+['.']['0'-'9']+ as lxm { update_char_pos lxm; num_of_string lxm }
| ['0'-'9']+['.']['0'-'9']+['e''E']['0'-'9']+ as lxm { update_char_pos lxm; num_of_string lxm }
| ['-']['0'-'9']+['.']['0'-'9']+ as lxm { update_char_pos lxm; num_of_string lxm }
| ['-']['0'-'9']+['.']['0'-'9']+['e''E']['0'-'9']+ as lxm { update_char_pos lxm; num_of_string lxm }
| ['_''a'-'z''A'-'Z']['_''\'''0'-'9''a'-'z''A'-'Z']* as lxm { update_char_pos lxm; NAM(lxm) }
| eof            { raise Eof }
