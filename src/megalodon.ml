(* Copyright (c) 2020-2022 CIIRC (Czech Institute of Informatics, Robotics and Cybernetics) / CTU (Czech Technical University) *)

open Syntax
open Parser
open Megaauto
open Interpret

let doublecheckpf = ref true;;
let bushy = ref false;;
let bushykdeps : (string,unit) Hashtbl.t = Hashtbl.create 10;;
let bushyhdeps : (int,unit) Hashtbl.t = Hashtbl.create 10;;
let fofskip : (string,unit) Hashtbl.t = Hashtbl.create 10;;
let th0skip : (string,unit) Hashtbl.t = Hashtbl.create 10;;
Hashtbl.add th0skip "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" ();;
Hashtbl.add th0skip "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" ();;
Hashtbl.add th0skip "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" ();;
Hashtbl.add th0skip "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" ();;
Hashtbl.add th0skip "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" ();;
Hashtbl.add th0skip "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" ();;
Hashtbl.add th0skip "8c71cf7ec1276527982a30a7e0cf59ab0066fe232b08a93bde0e96f04bd3c61e" ();;
Hashtbl.add th0skip "294aa57cc6984370c318cea497711321b40c0f0b05ee524a6d5aa73e794e39ea" ();;
Hashtbl.add th0skip "b20fe08e4deecde7da240694359a1d03879d693ecedd05b8558b7c8f97a27068" ();;
Hashtbl.add th0skip "7f6246d08629eeb16eab93529ffe4f929f43344833ab88c7786393693520e82b" ();;
Hashtbl.add th0skip "eb8814e5b67181dcc2fdd7f757e9f1e3c90bcd9b3117f2bb9aa7650cdaac5b42" ();;
Hashtbl.add th0skip "fec5ab340a042c8361bb0564ac980cfe10dabcf5c4aeacb0746c0daa4ac55417" ();;
Hashtbl.add th0skip "d5fdb4f6cfb82cab64716bee0629544da9b7530752eb0873529def98362fd6b4" ();;
Hashtbl.add th0skip "5ee4a4103f04cabe781fcdc73566d7dd74b33cb621a83145e1fcff8855469827" ();;
Hashtbl.add th0skip "22deae75a52553214777cb58d8b2125e35bc3126ecd8ebda4ac09b1d2797aa65" ();;
Hashtbl.add th0skip "bf8d387a1cdc4c9dea0b7e95765cc5b16227b88778c3fb3744c9fbc25117af2b" ();;
Hashtbl.add th0skip "ae12f3d888f0852224b7800963449ca794c37e1ea961e7055db83b51de0c6cc9" ();;
Hashtbl.add th0skip "bfd151f806ea28dc7a1dc0837502b7ceb6f8c9d6f8ca53206a01a29e23c88acf" ();;
Hashtbl.add th0skip "5a4bbc1e6228cfca5f449799d8b79de665c1a48f3d2119d65f9309c4242d2cf7" ();;

Hashtbl.add fofskip "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" ();;
Hashtbl.add fofskip "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" ();;
Hashtbl.add fofskip "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" ();;
Hashtbl.add fofskip "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" ();;
Hashtbl.add fofskip "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" ();;
Hashtbl.add fofskip "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" ();;
Hashtbl.add fofskip "8c71cf7ec1276527982a30a7e0cf59ab0066fe232b08a93bde0e96f04bd3c61e" ();;
Hashtbl.add fofskip "294aa57cc6984370c318cea497711321b40c0f0b05ee524a6d5aa73e794e39ea" ();;
Hashtbl.add fofskip "b20fe08e4deecde7da240694359a1d03879d693ecedd05b8558b7c8f97a27068" ();;
Hashtbl.add fofskip "7f6246d08629eeb16eab93529ffe4f929f43344833ab88c7786393693520e82b" ();;
Hashtbl.add fofskip "eb8814e5b67181dcc2fdd7f757e9f1e3c90bcd9b3117f2bb9aa7650cdaac5b42" ();;
Hashtbl.add fofskip "fec5ab340a042c8361bb0564ac980cfe10dabcf5c4aeacb0746c0daa4ac55417" ();;
Hashtbl.add fofskip "d5fdb4f6cfb82cab64716bee0629544da9b7530752eb0873529def98362fd6b4" ();;
Hashtbl.add fofskip "5ee4a4103f04cabe781fcdc73566d7dd74b33cb621a83145e1fcff8855469827" ();;
Hashtbl.add fofskip "22deae75a52553214777cb58d8b2125e35bc3126ecd8ebda4ac09b1d2797aa65" ();;
Hashtbl.add fofskip "bf8d387a1cdc4c9dea0b7e95765cc5b16227b88778c3fb3744c9fbc25117af2b" ();;
Hashtbl.add fofskip "ae12f3d888f0852224b7800963449ca794c37e1ea961e7055db83b51de0c6cc9" ();;
Hashtbl.add fofskip "bfd151f806ea28dc7a1dc0837502b7ceb6f8c9d6f8ca53206a01a29e23c88acf" ();;
Hashtbl.add fofskip "5a4bbc1e6228cfca5f449799d8b79de665c1a48f3d2119d65f9309c4242d2cf7" ();;

let fof : string option ref = ref None
let th0 : string option ref = ref None
let th0ps1 : bool ref = ref false
let th0allsubgoals : bool ref = ref false
let th0subgoalcnt : int ref = ref 0
let sexprallsubgoals_inclfile : out_channel option ref = ref None
let sexprallsubgoals : (string * string * int) option ref = ref None
let normalizepf : bool ref = ref false
let optimizepf1 : bool ref = ref false
let optimizepf2 : bool ref = ref false
let optimizepf2tc : int ref = ref 99
let optimizepf2pc : int ref = ref 99
let reporteachitem : bool ref = ref false
let reportids : bool ref = ref true
let reportpfcomplexity : bool ref = ref false
let webout : bool ref = ref false
let ajax : bool ref = ref false
let ajaxactive : bool ref = ref false
let ajaxpffile : string ref = ref ""
let sqlout : bool ref = ref false
let sqltermout : bool ref = ref false
let presentationonly : bool ref = ref false
let mainfilehash : string option ref = ref None
let solvesproblemfile : string option ref = ref None

let thmsasexercises : bool ref = ref false
let exercises : string list ref = ref []

let admits : bool ref = ref false

let indoutfile : string option ref = ref None;;
let indextms : (string,tp) Hashtbl.t = Hashtbl.create 1000;;
let indexknowns : (string,unit) Hashtbl.t = Hashtbl.create 1000;;
let ownedoutfile : string option ref = ref None;;
let ownedobj : (Hash.hashval,unit) Hashtbl.t = Hashtbl.create 1000;;
let ownedprop : (Hash.hashval,unit) Hashtbl.t = Hashtbl.create 1000;;

let combsigtm sgtmloc secstack =
  (List.concat
     (List.map (fun l -> List.map (fun (x,m,a,n,b) -> (x,(n,b))) l)
	(sgtmloc::(List.map (fun (_,_,_,stl,_) -> stl) secstack))))

exception AdmittedPf

let admitlinecnt : (int,int) Hashtbl.t = Hashtbl.create 10

let getadmitnumlineno () =
  try
    let n = Hashtbl.find admitlinecnt !lineno in
    Hashtbl.add admitlinecnt !lineno (n+1);
    n+1
  with Not_found ->
    Hashtbl.add admitlinecnt !lineno 0;
    0

let fofsg = ref []
let th0sg = ref []
let th0sgps1 = ref []

let fofp () = not (!fof = None)
let th0p () = not (!th0 = None)

let rec tptpizecxtm cxtm =
  match cxtm with
  | [] -> []
  | (x,(a,Some(_)))::cxtmr -> tptpizecxtm cxtmr
  | (x,(a,None))::cxmtr -> (tptpize_name x,a)::tptpizecxtm cxmtr

let admitpfstateatp pfst =
  if !pfgtheory = Egal then
    match pfst with
    | PfStateGoal(atm,cxtm,cxpf) ->
       begin
         begin
           match !fof with
           | Some(c) ->
              begin
                try
                  let z = fof_prop_str atm (tptpizecxtm cxtm) in (** only if the conclusion is FO **)
                  let n = getadmitnumlineno() in
                  let fn =
                    if n = 0 then
                      Printf.sprintf "%s.%d.fof.p" c !lineno
                    else
                      Printf.sprintf "%s.%d.%d.fof.p" c !lineno n
                  in
                  let conjn =
                    if n = 0 then
                      Printf.sprintf "%s_%d" c !lineno
                    else
                      Printf.sprintf "%s_%d_%d" c !lineno n
                  in
                  let ch = open_out fn in
                  List.iter
                    (fun a -> Printf.fprintf ch "%s\n" a)
                    (List.rev !fofsg);
                  List.iter
                    (fun (x,p) ->
                      try
                        let a = fof_prop_str p (tptpizecxtm cxtm) in
                        Printf.fprintf ch "fof(%s,axiom,%s).\n" (tptpize_name x) a
                      with NotFO -> ())
                    (List.rev cxpf);
                  Printf.fprintf ch "fof(conj_%s,conjecture,%s).\n" conjn z;
                  close_out ch
                with NotFO -> ()
              end
           | None -> ()
         end;
         begin
           match !th0 with
           | Some(c) ->
              begin
                let n = getadmitnumlineno() in
                let fn =
                  if n = 0 then
                    Printf.sprintf "%s.%d.th0.p" c !lineno
                  else
                    Printf.sprintf "%s.%d.%d.th0.p" c !lineno n
                in
                let conjn =
                  if n = 0 then
                    Printf.sprintf "%s_%d" c !lineno
                  else
                    Printf.sprintf "%s_%d_%d" c !lineno n
                in
                if !th0ps1 then
                  begin
                    let inconj : (tm,unit) Hashtbl.t = Hashtbl.create 100 in
                    let rec trm_ps1 m =
                      match m with
                      | Prim(_) -> Hashtbl.replace inconj m ()
                      | TmH(h) when not (Hashtbl.mem logicop h) -> Hashtbl.replace inconj m ()
                      | Ap(m1,m2) -> trm_ps1 m1; trm_ps1 m2
                      | Lam(_,m1) -> trm_ps1 m1
                      | Imp(m1,m2) -> trm_ps1 m1; trm_ps1 m2
                      | All(_,m1) -> trm_ps1 m1
                      | _ -> ()
                    in
                    let rec th0_cx_ps1 cxtm =
                      match cxtm with
                      | [] -> ()
                      | (x,(a,d))::cxtmr ->
                         th0_cx_ps1 cxtmr;
                         match d with
                         | Some(d) -> trm_ps1 d
                         | None -> ()
                    in
                    th0_cx_ps1 cxtm;
                    List.iter
                      (fun (_,p) -> trm_ps1 p)
                      cxpf;
                    trm_ps1 atm;
                    let ch = open_out fn in
                    let rec th0_cx cxtm =
                      match cxtm with
                      | [] -> ()
                      | (x,(a,d))::cxtmr ->
                         th0_cx cxtmr;
                         Printf.fprintf ch "thf(%s_tp,type,(%s : %s)).\n" (tptpize_name x) (tptpize_name x) (th0_stp_str a);
                         match d with
                         | Some(d) ->
                            Printf.fprintf ch "thf(%s_def,definition,(%s = %s)).\n" (tptpize_name x) (tptpize_name x) (th0_str d (tptpizecxtm cxtmr))
                         | None -> ()
                    in
                    th0_cx cxtm;
                    List.iter
                      (fun (deps,a) ->
                        match deps with
                        | None -> Printf.fprintf ch "%s\n" a
                        | Some(hl) ->
                           if List.exists (fun h -> Hashtbl.mem inconj h) hl then
                             Printf.fprintf ch "%s\n" a)
                      (List.rev !th0sgps1);
                    let cnt = ref 0 in
                    List.iter
                      (fun (x,p) ->
                        incr cnt;
                        if not !bushy || Hashtbl.mem bushyhdeps !cnt then
                          let a = th0_str p (tptpizecxtm cxtm) in
                          Printf.fprintf ch "thf(%s,axiom,%s).\n" (tptpize_name x) a)
                      (List.rev cxpf);
                    Printf.fprintf ch "thf(conj_%s,conjecture,%s).\n" conjn (th0_str atm (tptpizecxtm cxtm));
                    close_out ch
                  end
                else
                  begin
                    let ch = open_out fn in
                    List.iter
                      (fun a -> Printf.fprintf ch "%s\n" a)
                      (List.rev !th0sg);
                    let rec th0_cx cxtm =
                      match cxtm with
                      | [] -> ()
                      | (x,(a,d))::cxtmr ->
                         th0_cx cxtmr;
                         Printf.fprintf ch "thf(%s_tp,type,(%s : %s)).\n" (tptpize_name x) (tptpize_name x) (th0_stp_str a);
                         match d with
                         | Some(d) ->
                            Printf.fprintf ch "thf(%s_def,definition,(%s = %s)).\n" (tptpize_name x) (tptpize_name x) (th0_str d (tptpizecxtm cxtmr))
                         | None -> ()
                    in
                    th0_cx cxtm;
                    let cnt = ref 0 in
                    List.iter
                      (fun (x,p) ->
                        incr cnt;
                        if not !bushy || Hashtbl.mem bushyhdeps !cnt then
                          let a = th0_str p (tptpizecxtm cxtm) in
                          Printf.fprintf ch "thf(%s,axiom,%s).\n" (tptpize_name x) a)
                      (List.rev cxpf);
                    Printf.fprintf ch "thf(conj_%s,conjecture,%s).\n" conjn (th0_str atm (tptpizecxtm cxtm));
                    close_out ch
                  end
              end
           | None -> ()
         end;
       end
    | _ -> ()
             
let rec map_for f i n =
  if i <= n then
    (f i::map_for f (i+1) n)
  else
    [];;

let rec split_list n l =
  if n > 0 then
    match l with
    | (a::r) ->
      let (l1,l2) = split_list (n-1) r in
      (a::l1,l2)
    | [] -> ([],[])
  else
    ([],l)

let extract_pfg_id l =
  let ll = String.length l in
  let i = ref 0 in
  let spc = ref 0 in
  let rv = ref None in
  while !i < ll && !rv = None do
    let c = l.[!i] in
    incr i;
    if c = ' ' then incr spc;
    if !spc = 3 then rv := Some(String.sub l !i 64)
  done;
  begin
    match !rv with
    | Some(r) -> Hash.hexstring_hashval r
    | None -> raise (Failure "bad owned file line")
  end

let read_ownedfile c =
  try
    while true do
      let l = input_line c in
      if String.length l >= 68 && String.sub l 0 4 = "Obj " then
        Hashtbl.add ownedobj (extract_pfg_id l) ()
      else if String.length l >= 69 && String.sub l 0 5 = "Prop " then
        Hashtbl.add ownedprop (extract_pfg_id l) ()
    done
  with End_of_file -> ()

let read_indexfile c =
  let tl = ref (TokStrRest(Lexer.token,Lexing.from_channel c)) in
  lineno := 1;
  charno := 0;
  try
    while true do
      let (iitem,tr) = parse_indexitem !tl in
      tl := tr;
      match iitem with
      | IndexTm(h,a) ->
	  if not (valid_id_p h) then raise (Failure(h ^ " in index file is not a valid id"));
	  let a = ltree_to_atree a in
	  let atp = extract_tp a [] in
          if !verbosity > 10 then Printf.printf "  Hashtbl.add indextms \"%s\" (%s);\n" h (tp_ocaml atp);
	  begin
	    try
	      let itp = Hashtbl.find indextms h in
	      if itp <> atp then raise (Failure("Mismatch in indexed type assignment for " ^ h))
	    with Not_found ->
	      Hashtbl.add indextms h atp
	  end
      | IndexKnown(h) ->
	  if not (valid_id_p h) then raise (Failure(h ^ " in index file is not a valid id"));
          if !verbosity > 10 then Printf.printf "  Hashtbl.add indexknowns \"%s\" ();\n" h;
	  if not (Hashtbl.mem indexknowns h) then
	    Hashtbl.add indexknowns h ()
    done
  with
  | Lexer.Eof ->
      ()
  | Failure(x) ->
      if !webout then
	begin
          Printf.printf "AF%d:%d\n"  !lineno !charno;
	  Printf.printf "<div class='documentfail'>Failure reading index file at line %d char %d: %s</div>" !lineno !charno x; flush stdout;
	  exit 1
	end
      else if !ajax then
	begin
	  Printf.printf "f\n" (*** this indicates a fundamental problem, not a problem with the ajax input ***)
	end
      else
	begin
	  Printf.printf "Failure reading index file at line %d char %d: %s\n" !lineno !charno x; flush stdout;
	  exit 1
	end

let latex = ref None;;
let html = ref None;;
let inchan = ref None;; (*** This is a possible second channel for reading the input file currently used to record a literal copy of the text of proofs ***)
let inchanline = ref 1;;
let inchanchar = ref 0;;
let includingsigfile = ref false;;
let includedsigfiles = ref [];;
let sigoutfile = ref None;;
let pfgout = ref false;;
type pfgitem = PfgParam of string * string * tp | PfgDef of string * string * tp * tm | PfgKnown of string * string * tm | PfgThm of string * string * tm * pf | PfgConj of string * string * tm
let pfgmain : pfgitem list ref = ref [];;
let pfgdelta : (string,unit) Hashtbl.t = Hashtbl.create 100;;
let pfgtmph : (string,string * tp * (tm option)) Hashtbl.t = Hashtbl.create 100;;
let pfgknph : (string,tm) Hashtbl.t = Hashtbl.create 100;;
let sigtmh : (string,string) Hashtbl.t  = Hashtbl.create 1000;;
let sigknh : (string,string) Hashtbl.t  = Hashtbl.create 1000;;
let sigtmof : (string,ptp) Hashtbl.t  = Hashtbl.create 1000;;
let sigdelta : (string,ptm) Hashtbl.t = Hashtbl.create 1000;;
let sigtm = ref [];;
let sigpf = ref [];;
let polytm = ref [];;
let polypf = ref [];;
let futurepolytm = ref [];;
let futurepolypf = ref [];;
let handlepolysnow () =
  polytm := !futurepolytm @ !polytm;
  polypf := !futurepolypf @ !polypf;
  futurepolytm := [];
  futurepolypf := [];;
let pushpolytm a = futurepolytm := a::!futurepolytm;;
let pushpolypf a = futurepolypf := a::!futurepolypf;;
(*** special cases so that the certain tactics get activated ***)
let activate_special_knowns h =
  if h = !expolyI then
    begin
      expolyIknown := true;
      if !verbosity > 50 then (Printf.printf "Activated expolyI, so that witness tactic can now be used.\n"; flush stdout);
    end;;

(*** I could make this more general, but I won't for now. ***)
let extract_exclaim m =
  match m with
  | Ap(TpAp(TmH(e),etp),ep) when e = !expoly -> (etp,ep)
  | _ -> raise Not_found

let add_sigdelta h (i,m) =
  let m = tm_beta_eta_norm m in
  match m with
  | TmH(_) -> ()
  | TpAp(TmH(_),TpVar(0)) -> ()
  | TpAp(TpAp(TmH(_),TpVar(0)),TpVar(1)) -> ()
  | TpAp(TpAp(TpAp(TmH(_),TpVar(0)),TpVar(1)),TpVar(2)) -> ()
  | _ -> Hashtbl.add sigdelta h (i,m)

(*** Output docitems to the signature file, changing theorems to axioms ***)
let outtosigfile soc ditem =
  let outc s = output_char soc s in
  let outs s = output_string soc s in
  let outi i = Printf.fprintf soc "%d" i in
  let outl a = output_ltree soc a in
  let outasckd asck =
    begin
      match asck with
      | AscTp -> outs " : ";
      | AscSet -> outs " :e ";
      | AscSubeq -> outs " c= ";
    end;		    
  in
  begin
    match ditem with
    | Section(x) ->
	outs ("Section " ^ x ^ ".\n")
    | End(x) ->
	outs ("End " ^ x ^ ".\n")
    | VarDecl(xl,asck,a) ->
	outs "Variable";
	List.iter (fun x -> outc ' '; outs x) xl;
	outasckd asck;
	outl a;
	outc '.';
	outc '\n';
    | HypDecl(x,a) ->
	outs ("Hypothesis " ^ x ^ " : ");
	outl a;
	outc '.';
	outc '\n';
    | LetDecl(x,None,b) ->
	outs ("Let " ^ x ^ " := ");
	outl b;
	outc '.';
	outc '\n';
    | LetDecl(x,Some(asck,a),b) ->
	outs "Let ";
	outs x;
	outasckd asck;
	outl a;
	outs " := ";
	outl b;
	outc '.';
	outc '\n';
    | PostInfixDecl(x,a,p,Postfix) ->
	outs "Postfix ";
	outs x;
	outc ' ';
	outi p;
	outs " := ";
	outl a;
	outs ".\n";
    | PostInfixDecl(x,a,p,InfixNone) ->
	outs "Infix ";
	outs x;
	outc ' ';
	outi p;
	outs " := ";
	outl a;
	outs ".\n";
    | PostInfixDecl(x,a,p,InfixLeft) ->
	outs "Infix ";
	outs x;
	outc ' ';
	outi p;
	outs " left ";
	outs " := ";
	outl a;
	outs ".\n";
    | PostInfixDecl(x,a,p,InfixRight) ->
	outs "Infix ";
	outs x;
	outc ' ';
	outi p;
	outs " right ";
	outs " := ";
	outl a;
	outs ".\n";
    | PrefixDecl(x,a,p) ->
	outs "Prefix ";
	outs x;
	outc ' ';
	outi p;
	outs " := ";
	outl a;
	outs ".\n";
    | BinderDecl(plus,comma,x,a,bo) ->
	outs "Binder";
	if plus then outs "+ " else outc ' ';
	outs x;
	if comma then outs " , := " else outs " => := ";
	outl a;
	begin
	  match bo with
	  | Some(b) -> outs " ; "; outl b
	  | None -> ()
	end;
	outs ".\n"
    | UnicodeDecl(x,yl) ->
	outs "(* Unicode ";
	outs x;
	List.iter (fun y ->
	  outs " \"";
	  outs y;
	  outs "\"")
	  yl;
	outs " *)\n"
    | SubscriptDecl(x) ->
	outs "(* Subscript ";
	outs x;
	outs " *)\n"
    | SuperscriptDecl(x) ->
	outs "(* Superscript ";
	outs x;
	outs " *)\n"
    | NotationDecl(x,yl) ->
	outs "Notation ";
	outs x;
	List.iter (fun y -> outc ' '; outs y) yl;
	outs ".\n";
    | ParamHash(x,h,None) ->
	outs "(* Parameter ";
	outs x;
	outc ' ';
	outc '"';
	outs h;
	outc '"';
	outc ' ';
	outs "*)\n";
    | ParamHash(x,h,Some(k)) ->
	outs "(* Parameter ";
	outs x;
	outc ' ';
	outc '"';
	outs h;
	outc '"';
	outc ' ';
	outc '"';
	outs k;
	outc '"';
	outc ' ';
	outs "*)\n";
    | ParamDecl(x,a) ->
	outs "Parameter ";
	outs x;
	outs " : ";
	outl a;
	outs ".\n";
    | DefDecl(x,None,b) ->
	outs "Definition ";
	outs x;
	outs " := ";
	outl b;
	outs ".\n";
    | DefDecl(x,Some a,b) ->
	outs "Definition ";
	outs x;
	outs " : ";
	outl a;
	outs " := ";
	outl b;
	outs ".\n";
    | AxDecl(x,a) ->
	outs "Axiom ";
	outs x;
	outs " : ";
	outl a;
	outs ".\n";
    | ThmDecl(_,x,a) -> (*** Theorems are axioms in the signature. ***)
	outs "Axiom ";
	outs x;
	outs " : ";
	outl a;
	outs ".\n";
    | _ -> ()
  end

let skip_to_line_char c li1 ch1 li2 ch2 =
  try
    while (!li1 < li2) do
      ch1 := 0;
      let z = input_char c in
      if z = '\n' then incr li1;
    done;
    while (!ch1 < ch2) do
      ignore (input_char c);
      incr ch1
    done
  with End_of_file -> () (*** this probably shouldn't happen, but if it does, just stop reading the file ***)

let buffer_to_line_char c b li1 ch1 li2 ch2 =
  try
    while (!li1 < li2) do
      ch1 := 0;
      let z = input_char c in
      Buffer.add_char b z;
      if z = '\n' then incr li1;
    done;
    while (!ch1 < ch2) do
      let z = input_char c in
      Buffer.add_char b z;
      incr ch1
    done
  with End_of_file -> () (*** this probably shouldn't happen, but if it does, just stop reading the file ***)

let ctxtp = ref []
let ctxtm = ref []
let ctxpf = ref []
let tparclos = ref (fun a -> a)
let tmallclos = ref (fun m -> m)
let tmlamclos = ref (fun m -> m)
let pflamclos = ref (fun d -> d)
let aptmloc = ref (fun m cxtp cxtm -> m)
let appfloc = ref (fun d cxtp cxtm cxpf -> d)
let secstack = ref []
let popfn = ref (fun () -> ())

let laststructaction = ref 0;;

let megaauto_set_item h d =
  if h = "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" then (** ordsucc **)
    begin
      setordsucc := Some(h);
      let h1 = tm_id (Ap(TmH(h),Prim(2))) sigtmof sigdelta in
      set1 := Some(h1);
      let h2 = tm_id (Ap(TmH(h),TmH(h1))) sigtmof sigdelta in
      set2 := Some(h2)
    end
  else if h = "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" then (** setsum/pair **)
    setsum := Some(h)
  else if h = "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" then (** lam/Sigma **)
    setlambda := Some(h)
  else if h = "ecef5cea93b11859a42b1ea5e8a89184202761217017f3a5cdce1b91d10b34a7" && d then (** setprod **)
    setprod := Some(h)
  else if h = "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" then (** ap **)
    setap := Some(h)
  else if h = "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" then (** Pi **)
    setPi := Some(h)
  else if h = "fcd77a77362d494f90954f299ee3eb7d4273ae93d2d776186c885fc95baa40dc" && d then (** setexp **)
    setexp := Some(h)

let megaauto_set_known h =
  if h = "4dcf737d976ab59871f178ab4227edffb26181c236613caeb68c84de8f2e6aa1" then
    known_In_0_2 := Some(h)
  else if h = "b28b8818076ea2727fe37ccdc19db7910186e7991e3cd809d9bd88239f294936" then
    known_In_1_2 := Some(h)
  else if h = "037887d4c129ed2b2fa3e5f38118106ab9d3677e677e927197774264a221a83e" then
    known_tupleI0 := Some(h)
  else if h = "4b42b19620bd13f38596de6607fccc7b23ef8c6ed2a71e396055f290a6d75265" then
    known_tupleI1 := Some(h)
  else if h = "30940631e6ea9dd2e197436d1254b1a8d7d9087b0d6df24ed44090a81c91efef" then
    known_tuple0_setsum := Some(h)
  else if h = "02c877b50d6e337679aa91261e3c90c651ccef333d0318a0d5dd2735af5f37ba" then
    known_tuple1_setsum := Some(h)
  else if h = "8ad8ee9f2a2cceb15dc4d629f57caaf70a3ef361eb59f77fe6523c202000d9e8" then
    known_tuple_2_0_eq := Some(h)
  else if h = "494f183d032dc85055f2fcc389f025ec799bf85f978311eac319162a5c3c1ae8" then
    known_tuple_2_1_eq := Some(h)
  else if h = "2553ebe05147c51d42ad34303cd2b9bcfe20abd60f990923124e40051ba30fbf" then
    known_tuple_2_Sigma := Some(h)
  else if h = "5385a6f08cba961a8f90f2e36a2f7d49681349aec6db4e85249a481e5be48899" then
    known_tuple_2_setprod := Some(h)
  else if h = "ebb9bad843b554c6cd9c373bd2fb7dd8b30c1a3fbb10a4018fafd80db6caaaee" then
    known_tuple_2_eta := Some(h)
  else if h = "73d7865ec772f43295363850120c05f9e72b0466bd3af5828a60b87caf35f70a" then
    known_ap0_Sigma := Some(h)
  else if h = "d4c92acb68a5b835371527eab3ea8ddb1c122948915729172786e2d04b552ad3" then
    known_ap1_Sigma := Some(h)
  else if h = "a00be5d41e8522ab870b586366e81c4fd66f8fb2ca0a74e27018431d280a7fbb" then
    known_tuple_Sigma_eta := Some(h)
  else if h = "c98183df697f6c43af2633457df05e325bcd6e757b0eef980ed1fa53febad476" then
    known_lam_ext := Some(h)
  else if h = "7ab4c6697df228e0723c27c62bb05e611b05b2215b151c2507aab35b4ee34676" then
    known_lam_Pi := Some(h)
  else if h = "0fc03e3865b6f7cd7e469e8661923dc1edd845b81ec12c9dd8728082d51ed83b" then
    known_ap_Pi := Some(h)
  else if h = "3b9b4b76541e3d742c0ccd9247bf93c028026783cdf1360b09677bdbfd191f7c" then
    known_beta := Some(h)
  else if h = "73fa526ffdb4fe1b47297609c1b8558ce7ee058c64e17b285de72ae0a78e2103" then
    known_Pi_ext := Some(h)
  else if h = "a87285d54bb15d7ad174232d02bcf414291aa8cf12bdae3ba6a7d97fcfef591f" then
    known_Pi_eta := Some(h)
  else if h = "c1253491187dd3685e59eca2206b98305093ded6398e1deec69a95b81adc2515" then
    known_Pi_cod_ext := Some(h)

let evaluate_docitem_1 ditem =
  begin
    match !sigoutfile with
    | Some soc -> outtosigfile soc ditem
    | None -> ()
  end;
  match ditem with
  | Author(x,yl) ->
      authors := !authors @ (x::yl);
      begin
	List.iter
	  (fun z ->
	    if !sqlout then
	      begin
		match !mainfilehash with
		| Some docsha ->
		    if not !presentationonly then (Printf.printf "INSERT INTO `docauthor` (`docsha`,`docauthorname`) VALUES ('%s',\"%s\");\n" docsha (String.escaped z));
		| None -> ()
	      end)
	  (x::yl);
      end
  | Title(x) ->
      begin
	match !title with
	| None -> title := Some(x);
	    if !sqlout then
	      begin
		match !mainfilehash with
		| Some docsha ->
		    if not !presentationonly then (Printf.printf "INSERT INTO `doc` (`docsha`,`docname`,`doctitle`,`dockind`,`docreleaseorder`,`docreleasedate`,`docstatus`) VALUES ('%s','%s',\"%s\",'putkind',1,'putrdate','s');\n" docsha Sys.argv.((Array.length Sys.argv) - 1) (String.escaped x));
		| None -> ()
	      end;
	| Some _ -> raise (Failure("Title can only be declared once"))
      end
  | ShowProofTerms(b) -> showproofterms := b
  | Salt(x) -> salt := Some x
  | Treasure(x) ->
      treasure := Some x;
  | Section(x) ->
     begin
       secstack := (x,!popfn,!aptmloc,!appfloc,!sigtm,!sigpf)::!secstack;
       popfn := (fun () -> ());
     end
  | End(x) ->
      begin
	match !secstack with
	| ((y,f,atl,apl,st,sp)::cs) when x = y ->
	    begin
	      !popfn ();
	      popfn := f;
	      aptmloc := atl;
	      appfloc := apl;
	      sigtm := st;
	      sigpf := sp;
	      secstack := cs
	    end
	| ((y,f,atl,apl,stl,spl)::_) -> raise (Failure("Section " ^ y ^ " cannot be ended with End " ^ x))
	| [] -> raise (Failure("No Section To End"))
      end
  | VarDecl(xl,AscTp,NaL "SType") -> (** Type variable **)
      begin
	match (!ctxtp,!ctxtm,!ctxpf) with
	| ([],[],[]) ->
	    ctxtp := xl;
	    if (List.length !ctxtp > 6) then raise (Failure "More than 6 type variables are not allowed.");
	    List.iter (fun x ->
	      let prevaptmloc = !aptmloc in
	      let prevappfloc = !appfloc in
	      aptmloc := (fun m cxtp cxtm -> TpAp(prevaptmloc m cxtp cxtm,tplookup cxtp x));
	      appfloc := (fun d cxtp cxtm cxpf -> PTpAp(prevappfloc d cxtp cxtm cxpf,tplookup cxtp x)))
	      xl;
	    let popfnnow = !popfn in
	    popfn := (fun () -> handlepolysnow (); ctxtp := []; popfnnow ())
	| _ ->
	    raise (Failure "Type variables can only be declared when the context is empty.")
      end
  | VarDecl(xl,AscTp,a) -> (** Ordinary variable **)
      let a = ltree_to_atree a in
      let atp = extract_tp a !ctxtp in
      let prevctxtm = !ctxtm in
      let prevctxpf = !ctxpf in
      let prevtparclos = !tparclos in
      let prevtmallclos = !tmallclos in
      let prevtmlamclos = !tmlamclos in
      let prevpflamclos = !pflamclos in
      ctxtm := (List.map (fun x -> (x,(atp,None))) (List.rev xl)) @ prevctxtm;
      let xln = List.length xl in
      ctxpf := (List.map (fun (y,p) -> (y,tmshift 0 xln p)) prevctxpf); (*** shift the hyp context to account for the fresh vars on the var context ***)
      List.iter (fun x ->
	let prevaptmloc = !aptmloc in
	let prevappfloc = !appfloc in
	aptmloc := (fun m cxtp cxtm -> Ap(prevaptmloc m cxtp cxtm,tmlookup cxtm x));
	appfloc := (fun d cxtp cxtm cxpf -> PTmAp(prevappfloc d cxtp cxtm cxpf,tmlookup cxtm x)))
	xl;
      tparclos := (fun a -> prevtparclos (List.fold_right (fun x b -> Ar(atp,b)) xl a));
      tmallclos := (fun m -> prevtmallclos (List.fold_right (fun x n -> All(atp,n)) xl m));
      tmlamclos := (fun m -> prevtmlamclos (List.fold_right (fun x n -> Lam(atp,n)) xl m));
      pflamclos := (fun d -> prevpflamclos (List.fold_right (fun x e -> TLam(atp,e)) xl d));
      let popfnnow = !popfn in
      popfn := (fun () -> ctxtm := prevctxtm; ctxpf := prevctxpf; tparclos := prevtparclos; tmallclos := prevtmallclos; tmlamclos := prevtmlamclos; pflamclos := prevpflamclos; popfnnow ())
  | VarDecl(xl,AscSet,a) -> (** Variable/Hyp combo, I might allow this later **)
      raise (Failure("Variables must be ascribed a type, not a set"))
  | VarDecl(xl,AscSubeq,a) -> (** Variable/Hyp combo, I might allow this later **)
      raise (Failure("Variables must be ascribed a type, not a set"))
  | HypDecl(x,a) -> (** declare a hypothesis, put into ctxpf, add removal to popfn, update appfloc **)
      let a = ltree_to_atree a in
      let atm = check_tm a Prop !polytm sigtmof !sigtm !ctxtp !ctxtm in
      let prevappfloc = !appfloc in
      let prevtmallclos = !tmallclos in
      let prevpflamclos = !pflamclos in
      let prevctxpf = !ctxpf in
      ctxpf := (x,atm)::prevctxpf;
      appfloc := (fun d cxtp cxtm cxpf -> PPfAp(prevappfloc d cxtp cxtm cxpf,pflookup cxpf x));
      tmallclos := (fun m -> prevtmallclos (Imp(atm,m)));
      pflamclos := (fun d -> prevpflamclos (PLam(atm,d)));
      let popfnnow = !popfn in
      popfn := (fun () -> ctxpf := prevctxpf; tmallclos := prevtmallclos; pflamclos := prevpflamclos; popfnnow ())
  | LetDecl(x,None,b) -> (** add (x,atp[extracted from btm],btm) to ctxtm, add removal to popfn **)
      (*** Note: Let variables do not correspond to de Bruijn indices. There need be no shifting of hypotheses. ***)
      let b = ltree_to_atree b in
      let (btm,btp) = extract_tm b !polytm sigtmof !sigtm !ctxtp !ctxtm in
      let prevctxtm = !ctxtm in
      ctxtm := (x,(btp,Some btm))::prevctxtm;
      let popfnnow = !popfn in
      popfn := (fun () -> ctxtm := prevctxtm; popfnnow ())
  | LetDecl(x,Some (AscTp,a),b) when a = NaL "Type" ->
     let b = ltree_to_atree b in
     let btp = extract_tp b !ctxtp in
     Hashtbl.add tpabbrev x btp
  | LetDecl(x,Some (AscTp,a),b) -> (** add (x,atp,btm) to ctxtm, add removal to popfn **)
      let a = ltree_to_atree a in
      let b = ltree_to_atree b in
      let btp = extract_tp a !ctxtp in
      let btm = check_tm b btp !polytm sigtmof !sigtm !ctxtp !ctxtm in
      let prevctxtm = !ctxtm in
      ctxtm := (x,(btp,Some btm))::prevctxtm;
      let popfnnow = !popfn in
      popfn := (fun () -> ctxtm := prevctxtm; popfnnow ())
  | LetDecl(x,Some (_,a),b) -> (*** I doubt I will allow this later since it would require finding a proof that b is in the set a ***)
      raise (Failure("Lets must be ascribed a type, not a set"))
  | PostInfixDecl(x,a,p,pic) ->
      let a = ltree_to_atree a in
      popfn := declare_postinfix x a p pic !popfn
  | PrefixDecl(x,a,p) ->
      let a = ltree_to_atree a in
      popfn := declare_prefix x a p !popfn
  | BinderDecl(plus,comma,x,a,bo) ->
      let a = ltree_to_atree a in
      let bo = (match bo with Some(b) -> Some(ltree_to_atree b) | None -> None) in
      popfn := declare_binder plus comma x a bo !popfn
  | UnicodeDecl(x,ul) ->
      Hashtbl.add unicode x ul; (*** just associate x with ul forever - not contained within a section ***)
  | SubscriptDecl(x) -> Hashtbl.add subscript x () (*** escapes sections, only use this when it should be permanent ***)
  | SuperscriptDecl(x) -> Hashtbl.add superscript x () (*** escapes sections, only use this when it should be permanent ***)
  | NotationDecl(x,yl) ->
      begin
	match x with
	| "IfThenElse" ->
	    begin
	      match yl with
	      | [y] ->
		  begin
		    try
		      let h = Hashtbl.find sigtmh y in
		      match Hashtbl.find sigtmof h with
		      | (1,Ar(Prop,Ar(TpVar(0),Ar(TpVar(0),TpVar(0))))) ->
			 ifop := Some(h)
                      | (0,Ar(Prop,Ar(Set,Ar(Set,Set)))) ->
                         ifopset := Some(h)
		      | _ -> raise (Failure("IfThenElse Notation should be given a polymorphic name of type prop->?0->?0->?0 or prop->set->set->set"))
		    with Not_found -> raise (Failure("IfThenElse Notation should be given a polymorphic name of type prop->?0->?0->?0 or prop->set->set->set"))
		  end
  	      | _ -> raise (Failure("IfThenElse Notation should be given a polymorphic name of type prop->?0->?0->?0 or prop->set->set->set"))
	    end
	| "Repl" ->
	    begin
	      match yl with
	      | [y] ->
		  begin
		    try
		      let h = Hashtbl.find sigtmh y in
		      match Hashtbl.find sigtmof h with
		      | (0,Ar(Set,Ar(Ar(Set,Set),Set))) ->
			  replop := Some(h)
		      | _ -> raise (Failure("Repl Notation should be given a parameter or definition name of type set->(set->set)->set"))
		    with Not_found -> raise (Failure("Repl Notation should be given a parameter or definition name of type set->(set->set)->set"))
		  end
  	      | _ -> raise (Failure("Repl Notation should be given a parameter or definition name of type set->(set->set)->set"))
	    end
	| "Sep" ->
	    begin
	      match yl with
	      | [y] ->
		  begin
		    try
		      let h = Hashtbl.find sigtmh y in
		      match Hashtbl.find sigtmof h with
		      | (0,Ar(Set,Ar(Ar(Set,Prop),Set))) ->
			  sepop := Some(h)
		      | _ -> raise (Failure("Repl Notation should be given a parameter or definition name of type set->(set->set)->set"))
		    with Not_found -> raise (Failure("Repl Notation should be given a parameter or definition name of type set->(set->set)->set"))
		  end
  	      | _ -> raise (Failure("Repl Notation should be given a parameter or definition name of type set->(set->set)->set"))
	    end
	| "ReplSep" ->
	    begin
	      match yl with
	      | [y] ->
		  begin
		    try
		      let h = Hashtbl.find sigtmh y in
		      match Hashtbl.find sigtmof h with
		      | (0,Ar(Set,Ar(Ar(Set,Prop),Ar(Ar(Set,Set),Set)))) ->
			  replsepop := Some(h)
		      | _ -> raise (Failure("ReplSep Notation should be given a parameter or definition name of type set->(set->prop)->(set->set)->set"))
		    with Not_found -> raise (Failure("ReplSep Notation should be given a parameter or definition name of type set->(set->prop)->(set->set)->set"))
		  end
  	      | _ -> raise (Failure("ReplSep Notation should be given a parameter or definition name of type set->(set->prop)->(set->set)->set"))
	    end
	| "SetEnum" ->
	    begin
	      if List.length yl <= 1 then
		raise (Failure("SetEnum should be given at least n>=2 names: constructors for the first n-1 cases and finally constructor for adjoining to a set"))
	      else
		let rec f i yl ztp =
		  match yl with
		  | [y] ->
		      begin
			try
			  let h = Hashtbl.find sigtmh y in
			  match Hashtbl.find sigtmof h with
			  | (0,Ar(Set,Ar(Set,Set))) ->
			      setenumadj := Some(h)
			  | _ -> raise (Failure("The last name in the SetEnum Notation should be given a parameter or definition name of type set->set->set"))
			with Not_found -> raise (Failure("The last name in the SetEnum Notation should be given a parameter or definition name of type set->set->set"))
		      end
		  | (y::yr) ->
		      begin
			try
			  let h = Hashtbl.find sigtmh y in
			  match Hashtbl.find sigtmof h with
			  | (0,htp) ->
			      if htp = ztp then
				setenuml := Some(h)::!setenuml
			      else
				begin
				  Printf.printf "y = %s h = %s\nhtp = %s\nztp = %s\n" y h (tp_to_str htp) (tp_to_str ztp); flush stdout;
				  raise (Failure("Name " ^ string_of_int i ^ " in the SetEnum Notation should be given a parameter or definition name of type " ^ tp_to_str ztp))
				end
			  | _ -> raise (Failure("Name " ^ string_of_int i ^ " in the SetEnum Notation should be given a parameter or definition name of type " ^ tp_to_str ztp))
			with Not_found -> raise (Failure("Name " ^ string_of_int i ^ " in the SetEnum Notation should be given a parameter or definition name of type " ^ tp_to_str ztp))
		      end;
		      f (i+1) yr (Ar(Set,ztp))
		  | [] -> raise (Failure("SetEnum should be given at least n>=2 names: constructors for the first n-1 cases and finally constructor for adjoining to a set"))
		in
		setenuml := [];
		f 0 yl Set;
		setenuml := List.rev !setenuml
	    end
	| "SetEnum0" ->
	    begin
	      match yl with
	      | [y] ->
		  begin
		    try
		      let h = Hashtbl.find sigtmh y in
		      match Hashtbl.find sigtmof h with
		      | (0,Set) ->
			  set_setenuml_n 0 h
		      | _ -> raise (Failure("SetEnum0 Notation should be given a parameter or definition name of type set"))
		    with Not_found -> raise (Failure("SetEnum0 Notation should be given a parameter or definition name of type set"))
		  end
  	      | _ -> raise (Failure("SetEnum0 Notation should be given a parameter or definition name of type set"))
	    end
	| "SetEnum1" ->
	    begin
	      match yl with
	      | [y] ->
		  begin
		    try
		      let h = Hashtbl.find sigtmh y in
		      match Hashtbl.find sigtmof h with
		      | (0,Ar(Set,Set)) ->
			  set_setenuml_n 1 h
		      | _ -> raise (Failure("SetEnum1 Notation should be given a parameter or definition name of type set->set"))
		    with Not_found -> raise (Failure("SetEnum1 Notation should be given a parameter or definition name of type set->set"))
		  end
  	      | _ -> raise (Failure("SetEnum1 Notation should be given a parameter or definition name of type set->set"))
	    end
	| "SetEnum2" ->
	    begin
	      match yl with
	      | [y] ->
		  begin
		    try
		      let h = Hashtbl.find sigtmh y in
		      match Hashtbl.find sigtmof h with
		      | (0,Ar(Set,Ar(Set,Set))) ->
			  set_setenuml_n 2 h;
		      | _ -> raise (Failure("SetEnum2 Notation should be given a parameter or definition name of type set->set->set"))
		    with Not_found -> raise (Failure("SetEnum2 Notation should be given a parameter or definition name of type set->set->set"))
		  end
  	      | _ -> raise (Failure("SetEnum2 Notation should be given a parameter or definition name of type set->set->set"))
	    end
	| "Nat" ->
	    begin
	      match yl with
	      | [y0;yS] ->
		  begin
		    try
		      let h0 = Hashtbl.find sigtmh y0 in
		      let hS = Hashtbl.find sigtmh yS in
		      match (Hashtbl.find sigtmof h0,Hashtbl.find sigtmof hS) with
		      | ((0,Set),(0,Ar(Set,Set))) ->
			  nat0 := Some(h0);
			  natS := Some(hS)
		      | _ -> raise (Failure("Nat Notation should be given a name of type set (for 0) and a name of type set->set (for successor)"))
		    with Not_found -> raise (Failure("Nat Notation should be given a name of type set (for 0) and a name of type set->set (for successor)"))
		  end
	      | _ -> raise (Failure("Nat Notation should be given a name of type set (for 0) and a name of type set->set (for successor)"))
	    end
	| "SetLam" ->
	    begin
	      match yl with
	      | [y] ->
		  begin
		    try
		      let h = Hashtbl.find sigtmh y in
		      match Hashtbl.find sigtmof h with
		      | (0,Ar(Set,Ar(Ar(Set,Set),Set))) ->
			  setlam := Some h
		      | _ -> raise (Failure("SetLam Notation should be given a name of type set->(set->set)->set"))
		    with Not_found -> raise (Failure("SetLam Notation should be given a name of type set->(set->set)->set"))
		  end
	      | _ -> raise (Failure("SetLam Notation should be given a name of type set->(set->set)->set"))
	    end
	| "SetImplicitOp" ->
	    begin
	      match yl with
	      | [y] ->
		  begin
		    try
		      let h = Hashtbl.find sigtmh y in
		      match Hashtbl.find sigtmof h with
		      | (0,Ar(Set,Ar(Set,Set))) ->
			  setimplop := Some h
		      | _ -> raise (Failure("SetAp Notation should be given a name of type set->set->set"))
		    with Not_found -> raise (Failure("SetAp Notation should be given a name of type set->set->set"))
		  end
	      | _ -> raise (Failure("SetAp Notation should be given a name of type set->set->set"))
	    end
	| _ -> raise (Failure("Unknown Notation " ^ x))
      end
  | ParamHash(x,h,ok) ->
      if (!verbosity > 9) then (Printf.printf "ParamHash %s %s\n" x h; flush stdout);
      begin
	try
	  let (xj,(xi,_)) = primname x in
	  let xh = ptm_lam_id (xi,Prim xj) sigtmof sigdelta in
	  if (h <> xh) then raise (Failure(x ^ " is the name of a built-in primitive and must have the id " ^ xh))
	with
        | Not_found ->
           if Hashtbl.mem sigtmh x then raise (Failure(x ^ " is already assigned an id"));
           Hashtbl.add sigtmh x h;
           match ok with (** proofgold id **)
           | None -> ()
           | Some(k) -> Hashtbl.add pfgtmhh h (Hash.hexstring_hashval k)
      end
  | ParamDecl(x,a) ->
      if !reporteachitem then (Printf.printf "++ %s\n" x; flush stdout);
      let a = ltree_to_atree a in
      if List.mem_assoc x !sigtm || List.mem_assoc x !sigpf || List.mem x !ctxtp || List.mem_assoc x !ctxtm || List.mem_assoc x !ctxpf then
	raise (Failure(x ^ " has already been used."));
      if (!verbosity > 9) then (Printf.printf "Param %s : " x; output_ltree stdout (atree_to_ltree a); Printf.printf "\n"; flush stdout);
      let i = List.length !ctxtp in
      let atp = extract_tp a !ctxtp in
      if (!verbosity > 19) then Printf.printf "i = %d\natp = %s\n" i (tp_to_str atp);
      let agtp = !tparclos atp in
      begin
	try
	  let (xj,(xi,xtp)) = primname x in
	  if (xi,xtp) <> (i,agtp) then raise (Failure(x ^ " is the name of a built-in primitive which does not have the given type."));
	  if i > 6 then raise (Failure("It is forbidden to have more than 6 type variables."));
	  let xhv = tm_id (Prim(xj)) sigtmof sigdelta in
	  if x = "Empty" then set0 := Some(xhv);
	  add_sigdelta xhv (0,Prim(xj));
	  if !pfgtheory = Egal then megaauto_set_item xhv false;
          if fofp() && i = 0 && not (Hashtbl.mem fofskip xhv) then Hashtbl.add tptp_id_name xhv (tptpize_name x,agtp);
          if th0p() && i = 0 && not (Hashtbl.mem th0skip xhv) then
            begin
              Hashtbl.add tptp_id_name xhv (tptpize_name x,agtp);
              if !th0ps1 then
                th0sgps1 := (None,Printf.sprintf "thf(%s,type,(%s : %s)). %% %s" (tptpize_name x) (tptpize_name x) (th0_stp_str agtp) xhv)::!th0sgps1
              else
                th0sg := Printf.sprintf "thf(%s,type,(%s : %s)). %% %s" (tptpize_name x) (tptpize_name x) (th0_stp_str agtp) xhv::!th0sg
            end;
          begin
            match !sexprallsubgoals_inclfile with
            | None -> ()
            | Some(f) ->
               Printf.fprintf f "(PRIM %d \"%s\" \"%s\" %s)\n" xj x xhv (tp_to_sexpr agtp)
          end;
	  begin
	    if !sqlout then
	      begin
		match !mainfilehash with
		| Some docsha ->
		    if !sqltermout then Printf.printf "INSERT INTO `term` (`termid`,`termtp`,`termpoly`,`termprimitive`) VALUES ('%s','%s',%d,true);\n" xhv (stp_html_string agtp) i;
		    if not !presentationonly then (Printf.printf "INSERT INTO `termdoc` (`termid`,`docsha`,`termdocname`,`termdockind`) VALUES ('%s','%s',\"%s\",'p');\n" xhv docsha (String.escaped x));
		| None -> ()
	      end
	  end;
	  if !verbosity > 3 then (Printf.printf "%s has id %s\n" x xhv; flush stdout);
	  if (x = "Power") then setPow := Some xhv;
	  if (x = "In") then (*** As soon as In is declared, declare the id's corresponding to :e and c= ***)
	    begin
	      setIn := Some xhv;
	      let subhv = ptm_lam_id (0,Lam(Set,Lam(Set,All(Set,Imp(Ap(Ap(TmH(xhv),DB(0)),DB(2)),Ap(Ap(TmH(xhv),DB(0)),DB(1))))))) sigtmof sigdelta in
	      setSubeq := Some subhv
	    end;
	  Hashtbl.add sigtmh x xhv;
	  Hashtbl.add sigtmof xhv (i,agtp);
	  if i > 0 then (*** x will look polymorphic with i types after the appropriate section is ended ***)
	    pushpolytm ((x,i),agtp);
	  if i = 0 && not (Hashtbl.mem indextms xhv) then Hashtbl.add indextms xhv xtp; (*** since this is a primitive, it doesn't really need to be indexed. However, indexing it will allow me to use parameters with different names for the primitives if I want. ***)
	  let m = TmH xhv in
	  sigtm := (x,!aptmloc m)::!sigtm;
	  secstack := List.map (fun (y,f,atl,apl,st,sp) -> (y,f,atl,apl,(x,atl m)::st,sp)) !secstack
	with Not_found ->
	  begin
	    if (i > 0) then raise (Failure(x ^ " must be defined. The only polymorphic parameter allowed are built-in primitives."));
	    if List.mem_assoc x !sigtm || List.mem_assoc x !sigpf || List.mem x !ctxtp || List.mem_assoc x !ctxtm || List.mem_assoc x !ctxpf then
	      raise (Failure(x ^ " has already been used."))
	    else
	      try
		let xhv = Hashtbl.find sigtmh x in
		if !pfgtheory = Egal then megaauto_set_item xhv false;
                if !pfgtheory = Egal && xhv = "7a7fd30507c2156eeace3d2784ada104fee81316a9d6f02db384ad7f0a180e26" then seqcons := Some(xhv);
                if fofp() && i = 0 && not (Hashtbl.mem fofskip xhv) then Hashtbl.add tptp_id_name xhv (tptpize_name x,agtp);
                if th0p() && i = 0 && not (Hashtbl.mem th0skip xhv) then
                  begin
                    Hashtbl.add tptp_id_name xhv (tptpize_name x,agtp);
                    if !th0ps1 then
                      th0sgps1 := (None,Printf.sprintf "thf(%s,type,(%s : %s)). %% %s" (tptpize_name x) (tptpize_name x) (th0_stp_str agtp) xhv)::!th0sgps1
                    else
                      th0sg := Printf.sprintf "thf(%s,type,(%s : %s)). %% %s" (tptpize_name x) (tptpize_name x) (th0_stp_str agtp) xhv::!th0sg;
                  end;
                begin
                  match !sexprallsubgoals_inclfile with
                  | None -> ()
                  | Some(f) ->
                     Printf.fprintf f "(PARAM \"%s\" \"%s\" %d %s)\n" x xhv i (tp_to_sexpr agtp)
                end;
		begin
                  if i = 0 then Hashtbl.add pfgtmph xhv (x,agtp,None);
		  if !pfgout && i = 0 then pfgmain := PfgParam(xhv,x,agtp)::!pfgmain;
		end;
		begin
		  if !sqlout then
		    begin
		      match !mainfilehash with
		      | Some docsha ->
			  if !sqltermout then Printf.printf "INSERT INTO `term` (`termid`,`termtp`,`termpoly`) VALUES ('%s','%s',%d);\n" xhv (stp_html_string agtp) i;
			  if not !presentationonly then (Printf.printf "INSERT INTO `termdoc` (`termid`,`docsha`,`termdocname`,`termdockind`) VALUES ('%s','%s',\"%s\",'p');\n" xhv docsha (String.escaped x));
		      | None -> ()
		    end
		end;
		begin
		  try
		    if (x = "Subq") then
		      begin
			match !setSubeq with
			| Some subhv ->
			    if xhv <> subhv then
			      raise (Failure("Subq can only be used to mean fun X Y:set => forall x:set, x :e X -> x :e Y"))
			| None ->
			    raise (Failure("Subq can only be used after In is declared and then only to mean fun X Y:set => forall x:set, x :e X -> x :e Y"))
		      end;
		    let itp = Hashtbl.find indextms xhv in (** megalodon knows it **)
		    if agtp <> itp then raise (Failure("The id " ^ xhv ^ " associated with the parameter " ^ x ^ " has is indexed to have the type " ^ tp_to_str itp ^ " not " ^ tp_to_str agtp));
		    Hashtbl.add sigtmof xhv (i,agtp);
		    let m = TmH xhv in
		    sigtm := (x,!aptmloc m)::!sigtm;
		    secstack := List.map (fun (y,f,atl,apl,st,sp) -> (y,f,atl,apl,(x,atl m)::st,sp)) !secstack
		  with
                  | Not_found ->
                     try
                       if i > 0 then raise Not_found;
                       let pfghpure = Hashtbl.find pfgtmhh xhv in
                       let pfghthy = pfg_objid_pure_to_thy pfghpure agtp in
                       if not (Hashtbl.mem ownedobj pfghthy) then raise Not_found; (** proofgold knows it **)
		       Hashtbl.add sigtmof xhv (i,agtp);
		       let m = TmH xhv in
		       sigtm := (x,!aptmloc m)::!sigtm;
		       secstack := List.map (fun (y,f,atl,apl,st,sp) -> (y,f,atl,apl,(x,atl m)::st,sp)) !secstack
		     with
                     | Not_found ->
		        raise (Failure("The given id " ^ xhv ^ " for " ^ x ^ " is not a known index for a term."))
		end
   	      with Not_found ->
		raise (Failure("Unknown id for " ^ x))
	  end
      end
  | DefDecl(x,None,b) ->
      if !reporteachitem then (Printf.printf "++ %s\n" x; flush stdout);
      let b = ltree_to_atree b in
      if List.mem_assoc x !sigtm || List.mem_assoc x !sigpf || List.mem x !ctxtp || List.mem_assoc x !ctxtm || List.mem_assoc x !ctxpf then
	raise (Failure(x ^ " has already been used."))
      else
	begin
	  if (!verbosity > 9) then (Printf.printf "Def %s := " x; output_ltree stdout (atree_to_ltree b); Printf.printf "\n"; flush stdout);
	  let i = List.length !ctxtp in
	  let (btm,btp) = extract_tm b !polytm sigtmof !sigtm !ctxtp !ctxtm in
	  if (!verbosity > 9) then (Printf.printf "Def %s := " x; output_ltree stdout (atree_to_ltree b); Printf.printf "\n"; flush stdout);
	  let bgtm = !tmlamclos btm in
	  let bgtp = !tparclos btp in
	  let xhv = ptm_lam_id (i,bgtm) sigtmof sigdelta in
	  if !pfgtheory = Egal then megaauto_set_item xhv true;
          if !pfgtheory = Egal && xhv = "7a7fd30507c2156eeace3d2784ada104fee81316a9d6f02db384ad7f0a180e26" then seqcons := Some(xhv);
          if fofp() && i = 0 && not (Hashtbl.mem fofskip xhv) then
            begin
              try
                Hashtbl.add tptp_id_name xhv (tptpize_name x,bgtp);
                fofsg := Printf.sprintf "fof(%s,axiom,%s). %% %s" (tptpize_name x) (fof_def_str bgtp xhv bgtm) xhv::!fofsg;
              with NotFO -> ()
            end;
          if th0p() && i = 0 && not (Hashtbl.mem th0skip xhv) then
            begin
              Hashtbl.add tptp_id_name xhv (tptpize_name x,bgtp);
              if !th0ps1 then
                begin
                  th0sgps1 := (None,Printf.sprintf "thf(%s,type,(%s : %s))." (tptpize_name x) (tptpize_name x) (th0_stp_str bgtp))::!th0sgps1;
                  if not !bushy || Hashtbl.mem bushykdeps xhv then
                    th0sgps1 := (Some(tm_deps bgtm),Printf.sprintf "thf(%s,axiom,%s). %% %s" (tptpize_name x) (th0_def_str bgtp xhv bgtm) xhv)::!th0sgps1
                end
              else
                begin
                  th0sg := Printf.sprintf "thf(%s,type,(%s : %s))." (tptpize_name x) (tptpize_name x) (th0_stp_str bgtp)::!th0sg;
                  th0sg := Printf.sprintf "thf(%s_def,definition,%s). %% %s" (tptpize_name x) (th0_def_str bgtp xhv bgtm) xhv::!th0sg
                end
            end;
          begin
            match !sexprallsubgoals_inclfile with
            | None -> ()
            | Some(f) ->
               Printf.fprintf f "(DEF \"%s\" \"%s\" %d %s %s)\n" x xhv i (tp_to_sexpr bgtp) (tm_to_sexpr bgtm)
          end;
          if !verbosity > 5 then Printf.printf "(MGID \"%s\" \"%s\")\n" x xhv;
          begin
            if i = 0 then
              let (pure,pfghv) = pfg_objid bgtm bgtp in
              if !includingsigfile && not (Hashtbl.mem ownedobj pfghv) then Printf.printf "WARNING: The pfg id %s for the object %s is not owned.\n" (Hash.hashval_hexstring pfghv) x;
	      if (!verbosity > 3) then (Printf.printf "%s was assigned pfg obj pure id %s and theory id %s\n" x (Hash.hashval_hexstring pure) (Hash.hashval_hexstring pfghv); flush stdout);
              Hashtbl.add ownedobj pfghv ();
              if (!verbosity > 3) then (Printf.printf "(* Parameter %s \"%s\" \"%s\" *)\n" x xhv (Hash.hashval_hexstring pure));
              Hashtbl.add pfgtmhh xhv pure;
          end;
	  add_sigdelta xhv (i,bgtm);
	  begin
            if i = 0 then Hashtbl.add pfgtmph xhv (x,bgtp,Some(bgtm));
	    if !pfgout && i = 0 then pfgmain := PfgDef(xhv,x,bgtp,bgtm)::!pfgmain;
	  end;
	  begin
	    if !sqlout then
	      begin
		match !mainfilehash with
		| Some docsha ->
		    if !sqltermout then Printf.printf "INSERT INTO `term` (`termid`,`termtp`,`termpoly`) VALUES ('%s','%s',%d);\n" xhv (stp_html_string bgtp) i;
		    if not !presentationonly then (Printf.printf "INSERT INTO `termdoc` (`termid`,`docsha`,`termdocname`,`termdockind`) VALUES ('%s','%s',\"%s\",'d');\n" xhv docsha (String.escaped x));
		| None -> ()
	      end
	  end;
	  if (x = "Subq") then
	    begin
	      match !setSubeq with
	      | Some subhv ->
		  if xhv <> subhv then
		    raise (Failure("Subq can only be used to mean fun X Y:set => forall x:set, x :e X -> x :e Y"))
	      | None ->
		  raise (Failure("Subq can only be used after In is declared and then only to mean fun X Y:set => forall x:set, x :e X -> x :e Y"))
	    end;
	  if (!verbosity > 3) then (Printf.printf "%s := %s was assigned id %s\n" x (tm_to_str bgtm) xhv; flush stdout);
	  if i > 0 then (*** x will look polymorphic with i types after the appropriate section is ended ***)
	    pushpolytm ((x,i),bgtp);
	  begin
	    try
	      let xhv2 = Hashtbl.find sigtmh x in
	      if xhv <> xhv2 then raise (Failure(x ^ " was explicitly assigned id " ^ xhv2 ^ " but this does not match its computed id " ^ xhv))
	    with Not_found -> ()
	  end;
	  Hashtbl.add sigtmh x xhv;
	  Hashtbl.add sigtmof xhv (i,bgtp);
	  if i = 0 then
	    begin
	      try
		let itp = Hashtbl.find indextms xhv in
		if bgtp <> itp then raise (Failure("The id " ^ xhv ^ " associated with the definition of " ^ x ^ " has is indexed to have the type " ^ tp_to_str itp ^ " not " ^ tp_to_str bgtp ^ ". This indicates some fundamental bug since it would presumably imply a hash collision."));
	      with Not_found ->
		Hashtbl.add indextms xhv bgtp
	    end;
	  let m = TmH xhv in
	  sigtm := (x,!aptmloc m)::!sigtm;
	  secstack := List.map (fun (y,f,atl,apl,st,sp) -> (y,f,atl,apl,(x,atl m)::st,sp)) !secstack;
	  if (!verbosity > 19) then (Printf.printf "i = %d\nbtm = %s\nbtp = %s\n" i (tm_to_str btm) (tp_to_str btp); flush stdout);
	end
  | DefDecl(x,Some a,b) ->
      if !reporteachitem then (Printf.printf "++ %s\n" x; flush stdout);
      let a = ltree_to_atree a in
      let b = ltree_to_atree b in
      if List.mem_assoc x !sigtm || List.mem_assoc x !sigpf || List.mem x !ctxtp || List.mem_assoc x !ctxtm || List.mem_assoc x !ctxpf then
	raise (Failure(x ^ " has already been used."))
      else
	begin
	  if (!verbosity > 9) then (Printf.printf "Def %s : " x; output_ltree stdout (atree_to_ltree a); Printf.printf "\n := "; output_ltree stdout (atree_to_ltree b); Printf.printf "\n"; flush stdout);
	  let i = List.length !ctxtp in
	  let atp = extract_tp a !ctxtp in
	  let btm = check_tm b atp !polytm sigtmof !sigtm !ctxtp !ctxtm in
	  if (!verbosity > 9) then (Printf.printf "Def %s := " x; output_ltree stdout (atree_to_ltree b); Printf.printf "\n"; flush stdout);
	  let bgtm = !tmlamclos btm in
	  let agtp = !tparclos atp in
	  let xhv = ptm_lam_id (i,bgtm) sigtmof sigdelta in
	  if !pfgtheory = Egal then megaauto_set_item xhv true;
          if !pfgtheory = Egal && xhv = "7a7fd30507c2156eeace3d2784ada104fee81316a9d6f02db384ad7f0a180e26" then seqcons := Some(xhv);
          if fofp() && i = 0 && not (Hashtbl.mem fofskip xhv) then
            begin
              try
                Hashtbl.add tptp_id_name xhv (tptpize_name x,agtp);
                fofsg := Printf.sprintf "fof(%s,axiom,%s). %% %s" (tptpize_name x) (fof_def_str agtp xhv bgtm) xhv::!fofsg;
              with NotFO -> ()
            end;
          if th0p() && i = 0 && not (Hashtbl.mem th0skip xhv) then
            begin
              Hashtbl.add tptp_id_name xhv (tptpize_name x,agtp);
              if !th0ps1 then
                begin
                  th0sgps1 := (None,Printf.sprintf "thf(%s,type,(%s : %s))." (tptpize_name x) (tptpize_name x) (th0_stp_str agtp))::!th0sgps1;
                  if not !bushy || Hashtbl.mem bushykdeps xhv then
                    th0sgps1 := (Some(tm_deps bgtm),Printf.sprintf "thf(%s,axiom,%s). %% %s" (tptpize_name x) (th0_def_str agtp xhv bgtm) xhv)::!th0sgps1
                end
              else
                begin
                  th0sg := Printf.sprintf "thf(%s,type,(%s : %s))." (tptpize_name x) (tptpize_name x) (th0_stp_str agtp)::!th0sg;
                  th0sg := Printf.sprintf "thf(%s_def,definition,%s). %% %s" (tptpize_name x) (th0_def_str agtp xhv bgtm) xhv::!th0sg;
                end
            end;
          begin
            match !sexprallsubgoals_inclfile with
            | None -> ()
            | Some(f) ->
               Printf.fprintf f "(DEF \"%s\" \"%s\" %d %s %s)\n" x xhv i (tp_to_sexpr agtp) (tm_to_sexpr bgtm)
          end;
          if !verbosity > 5 then Printf.printf "(MGID \"%s\" \"%s\")\n" x xhv;
          begin
            if i = 0 then
              let (pure,pfghv) = pfg_objid bgtm agtp in
              if !includingsigfile && not (Hashtbl.mem ownedobj pfghv) then Printf.printf "WARNING: The pfg id %s for the object %s is not owned.\n" (Hash.hashval_hexstring pfghv) x;
	      if (!verbosity > 3) then (Printf.printf "%s was assigned pfg obj id %s\n" x (Hash.hashval_hexstring pfghv); flush stdout);
              Hashtbl.add ownedobj pfghv ();
              if (!verbosity > 3) then (Printf.printf "(* Parameter %s \"%s\" \"%s\" *)\n" x xhv (Hash.hashval_hexstring pure));
              Hashtbl.add pfgtmhh xhv pure;
          end;
	  add_sigdelta xhv (i,bgtm);
	  begin
            if i = 0 then Hashtbl.add pfgtmph xhv (x,agtp,Some(bgtm));
	    if !pfgout && i = 0 then pfgmain := PfgDef(xhv,x,agtp,bgtm)::!pfgmain;
	  end;
	  begin
	    if !sqlout then
	      begin
		match !mainfilehash with
		| Some docsha ->
		    if !sqltermout then Printf.printf "INSERT INTO `term` (`termid`,`termtp`,`termpoly`) VALUES ('%s','%s',%d);\n" xhv (stp_html_string agtp) i;
		    if not !presentationonly then (Printf.printf "INSERT INTO `termdoc` (`termid`,`docsha`,`termdocname`,`termdockind`) VALUES ('%s','%s',\"%s\",'d');\n" xhv docsha (String.escaped x));
		| None -> ()
	      end
	  end;
	  if (x = "Subq") then
	    begin
	      match !setSubeq with
	      | Some subhv ->
		  if xhv <> subhv then
		    raise (Failure("Subq can only be used to mean fun X Y:set => forall x:set, x :e X -> x :e Y"))
	      | None ->
		  raise (Failure("Subq can only be used after In is declared and then only to mean fun X Y:set => forall x:set, x :e X -> x :e Y"))
	    end;
	  if (!verbosity > 3) then (Printf.printf "%s := %s was assigned id %s\n" x (tm_to_str bgtm) xhv; flush stdout);
	  if i > 0 then (*** x will look polymorphic with i types after the appropriate section is ended ***)
	    pushpolytm ((x,i),agtp);
	  begin
	    try
	      let xhv2 = Hashtbl.find sigtmh x in
	      if xhv <> xhv2 then raise (Failure(x ^ " was explicitly assigned id " ^ xhv2 ^ " but this does not match its computed id " ^ xhv))
	    with Not_found -> ()
	  end;
	  Hashtbl.add sigtmh x xhv;
	  Hashtbl.add sigtmof xhv (i,agtp);
	  if i = 0 then
	    begin
	      try
		let itp = Hashtbl.find indextms xhv in
		if agtp <> itp then raise (Failure("The id " ^ xhv ^ " associated with the definition of " ^ x ^ " has is indexed to have the type " ^ tp_to_str itp ^ " not " ^ tp_to_str agtp ^ ". This indicates some fundamental bug since it would presumably imply a hash collision."));
	      with Not_found ->
		Hashtbl.add indextms xhv agtp
	    end;
	  let m = TmH xhv in
	  sigtm := (x,!aptmloc m)::!sigtm;
	  secstack := List.map (fun (y,f,atl,apl,st,sp) -> (y,f,atl,apl,(x,atl m)::st,sp)) !secstack;
	  if (!verbosity > 19) then (Printf.printf "i = %d\nbtm = %s\nbtp = %s\n" i (tm_to_str btm) (tp_to_str atp); flush stdout);
	end
  | AxDecl(x,a) ->
      if !reporteachitem then (Printf.printf "++ %s\n" x; flush stdout);
      let a = ltree_to_atree a in
      if List.mem_assoc x !sigtm || List.mem_assoc x !sigpf || List.mem x !ctxtp || List.mem_assoc x !ctxtm || List.mem_assoc x !ctxpf then
	raise (Failure(x ^ " has already been used."));
      let i = List.length !ctxtp in
      let atm = check_tm a Prop !polytm sigtmof !sigtm !ctxtp !ctxtm in
      let agtm = !tmallclos atm in
      let ahv = ptm_all_id (i,agtm) sigtmof sigdelta in
      if !pfgtheory = Egal then megaauto_set_known ahv;
      if fofp() && i = 0 && not (Hashtbl.mem fofskip ahv) then (try fofsg := Printf.sprintf "fof(%s,axiom,%s). %% %s" (tptpize_name x) (fof_prop_str agtm []) ahv::!fofsg with NotFO -> ());
      if th0p() && i = 0 && not (Hashtbl.mem th0skip ahv) then
        begin
          if not !bushy || Hashtbl.mem bushykdeps ahv then
            if !th0ps1 then
              th0sgps1 := (Some(tm_deps agtm),Printf.sprintf "thf(%s,axiom,%s). %% %s" (tptpize_name x) (th0_str agtm []) ahv)::!th0sgps1
            else
              th0sg := Printf.sprintf "thf(%s,axiom,%s). %% %s" (tptpize_name x) (th0_str agtm []) ahv::!th0sg
        end;
      begin
        match !sexprallsubgoals_inclfile with
        | None -> ()
        | Some(f) ->
           Printf.fprintf f "(AXIOM \"%s\" \"%s\" %d %s)\n" x ahv i (tm_to_sexpr agtm)
      end;
      if !verbosity > 5 then Printf.printf "(MGPROPID \"%s\" \"%s\")\n" x ahv;
      add_sigdelta ahv (i,agtm);
      Hashtbl.add sigknh x ahv;
      begin
        if i = 0 then
          begin
            Hashtbl.add pfgknph ahv agtm;
          end;
	if !pfgout && i = 0 then pfgmain := PfgKnown(ahv,x,agtm)::!pfgmain
      end;
      activate_special_knowns ahv;
      begin
	if !sqlout then
	  begin
	    match !mainfilehash with
	    | Some docsha ->
		if !sqltermout then Printf.printf "INSERT INTO `term` (`termid`,`termtp`,`termpoly`) VALUES ('%s','%s',%d);\n" ahv (stp_html_string Prop) i;
		if not !presentationonly then (Printf.printf "INSERT INTO `termdoc` (`termid`,`docsha`,`termdocname`,`termdockind`) VALUES ('%s','%s',\"%s\",'a');\n" ahv docsha (String.escaped x));
	    | None -> ()
	  end
      end;
      sigpf := (x,!appfloc (Known(ahv)))::!sigpf;
      if i > 0 then (*** x will look polymorphic with i types after the appropriate section is ended ***)
	pushpolypf ((x,i),agtm);
      if not (Hashtbl.mem indexknowns ahv) &&
           begin
             if i = 0 then
               let pfgahv = pfg_propid agtm in
               not (Hashtbl.mem ownedprop pfgahv)
             else
               false
           end
      then
        begin
          Printf.printf "WARNING: The id %s for the proposition for axiom %s [pfg %s] is not indexed as previously known.\n" ahv x (Hash.hashval_hexstring (pfg_propid agtm));
        end;
      Hashtbl.add indexknowns ahv ();
      secstack := List.map (fun (y,f,atl,apl,st,sp) -> (y,f,atl,apl,st,(x,apl (Known(ahv)))::sp)) !secstack;
      if (!verbosity > 3) then (Printf.printf "Proposition of Axiom %s : %s was assigned id %s\n" x (tm_to_str agtm) ahv; flush stdout);
      ()
  | ThmDecl(c,x,a) ->
      let a = ltree_to_atree a in
      if List.mem_assoc x !sigtm || List.mem_assoc x !sigpf || List.mem x !ctxtp || List.mem_assoc x !ctxtm || List.mem_assoc x !ctxpf then
	raise (Failure(x ^ " has already been used."));
      if !includingsigfile then raise (Failure("Included signature file includes a theorem (" ^ x ^ "), but should only include axioms."));
      let i = List.length !ctxtp in
      let atm = check_tm a Prop !polytm sigtmof !sigtm !ctxtp !ctxtm in
      let agtm = !tmallclos atm in
      let ahv = ptm_all_id (i,agtm) sigtmof sigdelta in
      if !verbosity > 5 then Printf.printf "(MGPROPID \"%s\" \"%s\")\n" x ahv;
      let pfgahv = pfg_propid agtm in
      if !verbosity > 5 && (Hashtbl.mem indexknowns ahv || Hashtbl.mem ownedprop pfgahv) then (Printf.printf "Warning: The id %s for the proposition for theorem %s is already known.\n" ahv x; flush stdout);
      Hashtbl.add sigknh x ahv;
      Hashtbl.add ownedprop pfgahv ();
      add_sigdelta ahv (i,agtm);
      if !reporteachitem then (Printf.printf "++ %s\nHASH %s\n" x ahv; flush stdout);
      if !sqlout then
	begin
	  match !treasure with
	  | Some(traddr) ->
	      begin
		match !mainfilehash with
		| Some docsha ->
		    if not !presentationonly then (Printf.printf "INSERT INTO `treasuretermdoc` (`treasureaddress`,`propid`,`docsha`,`thmdocname`) VALUES ('%s','%s','%s','%s');\n" traddr ahv docsha x);
		| None -> ()
	      end
	  | None -> ()
	end;
      if (!verbosity > 3) then (Printf.printf "Proposition of %s %s : %s was assigned id %s\n" c x (tm_to_str agtm) ahv; flush stdout);
      begin
        match !sexprallsubgoals_inclfile with
        | None -> ()
        | Some(f) -> close_out f; sexprallsubgoals_inclfile := None
      end;
      let currpflamclos = !pflamclos in
      deltaset := [];
      proving := Some (x,i,agtm,ahv,pfgahv);
      prooffun := (fun dl -> match dl with [d] -> currpflamclos d | _ -> raise (Failure("Bug with proof construction")));
      pfstate := [PfStateGoal(atm,!ctxtm,!ctxpf)];
      laststructaction := -1

let evaluate_docitem ditem =
  evaluate_docitem_1 ditem;
  begin
    match !html with
    | Some hc ->
       begin
	 output_docitem_html hc ditem sigtmh sigknh;
	 match ditem with
	 | ThmDecl(_,x,_) ->
	    begin
	      match !inchan with
	      | Some(c) ->
		 begin
		   try
		     let h = Hashtbl.find sigknh x in
		     currtmid := h
		   with Not_found -> ()
		 end;
		 pflinestart := !lineno;
		 pfcharstart := !charno;
		 skip_to_line_char c inchanline inchanchar !lineno !charno;
	      | None -> ()
	    end
	 | _ -> ()
       end
    | None -> ()
  end;
  match !latex with
  | Some hc ->
      begin
	if !thmsasexercises then
	  begin
	    match ditem with
	    | ThmDecl(_,x,_) ->
		begin
		  try
		    let h = Hashtbl.find sigknh x in
		    Printf.fprintf hc "\n$x%s\n" h
		  with Not_found -> ()
		end
	    | _ -> ()
	  end;
	output_docitem_latex hc ditem sigtmh sigknh;
	match ditem with
	| ThmDecl(_,x,_) ->
	    begin
	      match !inchan with
	      | Some(c) ->
		  begin
		    try
		      let h = Hashtbl.find sigknh x in
		      currtmid := h
		    with Not_found -> ()
		  end;
		  pflinestart := !lineno;
		  pfcharstart := !charno;
		  skip_to_line_char c inchanline inchanchar !lineno !charno;
	      | None -> ()
	    end
	| _ -> ()
      end
  | None -> ()

let rec structure_pfstate i goal1 pfstl =
  match pfstl with
  | (PfStateGoal(claim2,cxtm2,cxpf2)::pfstr) ->
      (PfStateSep(i,true)::goal1::structure_pfstate i (PfStateGoal(claim2,cxtm2,cxpf2)) pfstr)
  | pfstr ->
      (PfStateSep(i,true)::goal1::PfStateSep(i,false)::pfstr)

let print_pfstate () =
  List.iter
    (fun p ->
      match p with
      | PfStateSep(j,true) -> Printf.printf "PfStateSep(%d,true)\n" j
      | PfStateSep(j,false) -> Printf.printf "PfStateSep(%d,false)\n" j
      | PfStateGoal(claim1,_,_) -> Printf.printf "PfStateGoal(%s,_,_)\n" (tm_to_str claim1)
      )
    !pfstate

let evaluate_pftac_1 pitem thmname i gpgtm gphv pfggphv =
  if !th0allsubgoals && th0p() then
    begin
      match !pfstate with
      | PfStateGoal(atm,cxtm,cxpf)::_ ->
         begin
           match !th0 with
           | Some(c) ->
              begin
                let n = !th0subgoalcnt in
                incr th0subgoalcnt;
                let fn =
                  Printf.sprintf "%s.sg%d.th0.p" c n
                in
                let conjn =
                  Printf.sprintf "%s_sg%d" c n
                in
                let ch = open_out fn in
                List.iter
                  (fun a -> Printf.fprintf ch "%s\n" a)
                  (List.rev !th0sg);
                let rec th0_cx cxtm =
                  match cxtm with
                  | [] -> ()
                  | (x,(a,d))::cxtmr ->
                     th0_cx cxtmr;
                     Printf.fprintf ch "thf(%s_tp,type,(%s : %s)).\n" (tptpize_name x) (tptpize_name x) (th0_stp_str a);
                     match d with
                     | Some(d) ->
                        Printf.fprintf ch "thf(%s_def,definition,(%s = %s)).\n" (tptpize_name x) (tptpize_name x) (th0_str d (tptpizecxtm cxtmr))
                     | None -> ()
                in
                th0_cx cxtm;
                let cnt = ref 0 in
                List.iter
                  (fun (x,p) ->
                    incr cnt;
                    if not !bushy || Hashtbl.mem bushyhdeps !cnt then
                      let a = th0_str p (tptpizecxtm cxtm) in
                      Printf.fprintf ch "thf(%s,axiom,%s).\n" (tptpize_name x) a)
                  (List.rev cxpf);
                Printf.fprintf ch "thf(conj_%s,conjecture,%s).\n" conjn (th0_str atm (tptpizecxtm cxtm));
                close_out ch
              end
           | None -> ()
         end
      | _ -> ()
    end;
  match pitem with
  | PfStruct i when i < 4 ->
      if !verbosity > 19 then (Printf.printf "pfstruct %d\nLength of pfstate stack: %d\n" i (List.length !pfstate); print_pfstate (); flush stdout);
      begin
	match !pfstate with
	| PfStateSep(j,true)::pfstr ->
	    if i = j then
	      begin
		laststructaction := 2;
		pfstate := pfstr;
		if !verbosity > 19 then (Printf.printf "pfstruct %d pop\nLength of pfstate stack: %d\n" i (List.length !pfstate); flush stdout);
	      end
	    else
	      raise (Failure("Previous subproof not completed"))
	| PfStateSep(j,false)::pfstr ->
	    raise (Failure("Proof structuring bug"))
	| [] ->
	    raise (Failure("No claim to prove here"))
	| PfStateGoal(claim1,cxtm1,cxpf1)::PfStateGoal(claim2,cxtm2,cxpf2)::pfstr ->
	    laststructaction := 1;
	    pfstate := PfStateGoal(claim1,cxtm1,cxpf1)::structure_pfstate i (PfStateGoal(claim2,cxtm2,cxpf2)) pfstr;
	    if !verbosity > 19 then (Printf.printf "pfstruct %d push\nLength of pfstate stack: %d\n" i (List.length !pfstate); flush stdout);
	| PfStateGoal(claim1,cxtm1,cxpf1)::pfstr ->
	    raise (Failure("Inappropriate place for this proof structuring symbol since there is only one goal"))
      end
  | PfStruct 4 ->
      begin
	match !pfstate with
	| PfStateSep _::pfstr ->
	    raise (Failure("A subproof cannot be started here"))
	| [] ->
	    raise (Failure("No claim to prove here"))
	| PfStateGoal(claim1,cxtm1,cxpf1)::pfstr ->
	    pfstate := PfStateGoal(claim1,cxtm1,cxpf1)::PfStateSep(5,true)::pfstr
      end
  | PfStruct 5 ->
      begin
	match !pfstate with
	| PfStateSep(j,_)::pfstr ->
	    if j = 5 then
	      pfstate := pfstr
	    else
	      raise (Failure("Previous subproof not completed"))
	| [] ->
	    raise (Failure("Not proving a goal"))
	| _ -> raise (Failure("Subproof not completed"))
      end
  | Exact(d) ->
      laststructaction := 0;
      let d = ltree_to_atree d in
      begin
	match !pfstate with
	| (PfStateGoal(claimtm,cxtm,cxpf) as pfst)::pfstr ->
           begin
             try
	       let dpf = check_pf d claimtm !polytm !polypf sigtmof sigdelta !sigtm !sigpf !ctxtp cxtm cxpf in
	       let currprooffun = !prooffun in
	       prooffun := (fun dl -> currprooffun (dpf::dl));
	       pfstate := pfstr
             with SearchLimit ->
               admitpfstateatp pfst;
	       pfstate := pfstr;
	       admits := true;
	       prooffun := (fun _ -> raise AdmittedPf)               
           end
	| _ ->
	    raise (Failure("No current claim"))
      end
  | LetTac(xl,None) ->
      laststructaction := 0;
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let rec let_tac_None_r xs claimtm cxtm cxpf =
	      match xs with
	      | [] ->
		  pfstate := PfStateGoal(claimtm,cxtm,cxpf)::pfstr
	      | (x::xr) ->
		  match claimtm with
		  | All(a,body) -> (*** If it's already an All, then don't call headnorm since headnorm will at least beta eta normalize and change the structure. ***)
		      let currprooffun = !prooffun in
		      prooffun := (fun dl -> match dl with d::dr -> currprooffun (TLam(a,d)::dr) | _ -> raise (Failure("proof reconstruction problem")));
		      let_tac_None_r xr body ((x,(a,None))::cxtm) (List.map (fun (y,q) -> (y,tmshift 0 1 q)) cxpf)
		  | _ -> (*** If it's not an All, then call headnorm and try to expose an All. ***)
		      let (p,dl) = headnorm claimtm sigdelta !deltaset in
		      match p with
		      | All(a,body) ->
			  let currprooffun = !prooffun in
			  prooffun := (fun dl -> match dl with d::dr -> currprooffun (TLam(a,d)::dr) | _ -> raise (Failure("proof reconstruction problem")));
			  let_tac_None_r xr body ((x,(a,None))::cxtm) (List.map (fun (y,q) -> (y,tmshift 0 1 q)) cxpf)
		      | _ ->
			  raise (Failure("let tactic used with " ^ x ^ " when claim is not a universal quantifier"))
	    in
	    let_tac_None_r xl claimtm cxtm cxpf
	| _ ->
	    raise (Failure("No current claim"))
      end
  | LetTac(xl,Some b) ->
      laststructaction := 0;
      let b = ltree_to_atree b in
      let btp = extract_tp b !ctxtp in
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let rec let_tac_Some_r xs claimtm cxtm cxpf =
	      match xs with
	      | [] ->
		  pfstate := PfStateGoal(claimtm,cxtm,cxpf)::pfstr
	      | (x::xr) ->
		  match claimtm with
		  | All(a,body) -> (*** If it's already an All, then don't call headnorm since headnorm will at least beta eta normalize and change the structure. ***)
		      if a = btp then
			let currprooffun = !prooffun in
			prooffun := (fun dl -> match dl with d::dr -> currprooffun (TLam(a,d)::dr) | _ -> raise (Failure("proof reconstruction problem")));
			let_tac_Some_r xr body ((x,(a,None))::cxtm) (List.map (fun (y,q) -> (y,tmshift 0 1 q)) cxpf)
		      else
			raise (Failure(x ^ " ascribe type " ^ (tp_to_str btp) ^ " but the claim is universally quantified over type " ^ (tp_to_str a)))
		  | _ -> (*** If it's not an All, then call headnorm and try to expose an All. ***)
		      let (p,dl) = headnorm claimtm sigdelta !deltaset in
		      match p with
		      | All(a,body) ->
			  if a = btp then
			    let currprooffun = !prooffun in
			    prooffun := (fun dl -> match dl with d::dr -> currprooffun (TLam(a,d)::dr) | _ -> raise (Failure("proof reconstruction problem")));
			    let_tac_Some_r xr body ((x,(a,None))::cxtm) (List.map (fun (y,q) -> (y,tmshift 0 1 q)) cxpf)
			  else
			    raise (Failure(x ^ " ascribe type " ^ (tp_to_str btp) ^ " but the claim is universally quantified over type " ^ (tp_to_str a)))
		      | _ ->
			  raise (Failure("let tactic used with " ^ x ^ " when claim is not a universal quantifier"))
	    in
	    let_tac_Some_r xl claimtm cxtm cxpf
	| _ ->
	    raise (Failure("No current claim"))
      end
  | AssumeTac(xl,None) ->
      laststructaction := 0;
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let rec assume_tac_None_r xs claimtm cxtm cxpf =
	      match xs with
	      | [] ->
		  pfstate := PfStateGoal(claimtm,cxtm,cxpf)::pfstr
	      | (x::xr) ->
		  match claimtm with
		  | Imp(p1,p2) -> (*** If it's already an Imp, then don't call headnorm since headnorm will at least beta eta normalize and change the structure. ***)
		      let currprooffun = !prooffun in
		      prooffun := (fun dl -> match dl with d::dr -> currprooffun (PLam(p1,d)::dr) | _ -> raise (Failure("proof reconstruction problem")));
		      assume_tac_None_r xr p2 cxtm ((x,p1)::cxpf)
		  | _ -> (*** If it's not an All, then call headnorm and try to expose an All. ***)
		      let (p,dl) = headnorm claimtm sigdelta !deltaset in
		      match p with
		      | Imp(p1,p2) ->
			  let currprooffun = !prooffun in
			  prooffun := (fun dl -> match dl with d::dr -> currprooffun (PLam(p1,d)::dr) | _ -> raise (Failure("proof reconstruction problem")));
			  assume_tac_None_r xr p2 cxtm ((x,p1)::cxpf)
		      | _ ->
			  raise (Failure("assume tactic used with " ^ x ^ " when claim is not an implication"))
	    in
	    assume_tac_None_r xl claimtm cxtm cxpf
	| _ ->
	    raise (Failure("No current claim"))
      end
  | AssumeTac(xl,Some b) ->
      laststructaction := 0;
      let b = ltree_to_atree b in
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let btm = check_tm b Prop !polytm sigtmof !sigtm !ctxtp cxtm in
	    let rec assume_tac_Some_r xs claimtm cxtm cxpf =
	      match xs with
	      | [] ->
		  pfstate := PfStateGoal(claimtm,cxtm,cxpf)::pfstr
	      | (x::xr) ->
		  match claimtm with
		  | Imp(p1,p2) -> (*** If it's already an Imp, then don't call headnorm since headnorm will at least beta eta normalize and change the structure. ***)
		      begin
			match conv p1 btm sigdelta !deltaset with
			| Some(dl) ->
			    deltaset := dl;
			    let currprooffun = !prooffun in
			    prooffun := (fun dl -> match dl with d::dr -> currprooffun (PLam(btm,d)::dr) | _ -> raise (Failure("proof reconstruction problem")));
			    assume_tac_Some_r xr p2 cxtm ((x,btm)::cxpf)
			| None ->
			    raise (Failure(x ^ " ascribed prop " ^ (tm_to_str btm) ^ " but the antecendent of the claim is " ^ (tm_to_str p1)))
		      end
		  | _ -> (*** If it's not an Imp, then call headnorm and try to expose an Imp. ***)
		      let (p,dl) = headnorm claimtm sigdelta !deltaset in
		      match p with
		      | Imp(p1,p2) ->
			  begin
			    match conv p1 btm sigdelta !deltaset with
			    | Some(dl) ->
				deltaset := dl;
				let currprooffun = !prooffun in
				prooffun := (fun dl -> match dl with d::dr -> currprooffun (PLam(btm,d)::dr) | _ -> raise (Failure("proof reconstruction problem")));
				assume_tac_Some_r xr p2 cxtm ((x,btm)::cxpf)
			    | None ->
				raise (Failure(x ^ " ascribed prop " ^ (tm_to_str btm) ^ " but the antecendent of the claim is " ^ (tm_to_str p1)))
			  end
		      | _ ->
			  raise (Failure("assume tactic used with " ^ x ^ " when claim is not an implication"))
	    in
	    assume_tac_Some_r xl claimtm cxtm cxpf
	| _ ->
	    raise (Failure("No current claim"))
      end
  | SetTac(x,None,b) ->
      laststructaction := 0;
      let b = ltree_to_atree b in
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let (btm,btp) = extract_tm b !polytm sigtmof !sigtm !ctxtp cxtm in
	    pfstate := (PfStateGoal(claimtm,(x,(btp,Some(btm)))::cxtm,cxpf))::pfstr
	| _ ->
	    raise (Failure("set tactic cannot be used when there is no claim"))
      end
  | SetTac(x,Some(a),b) ->
      let a = ltree_to_atree a in
      let b = ltree_to_atree b in
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let atp = extract_tp a !ctxtp in
	    let btm = check_tm b atp !polytm sigtmof !sigtm !ctxtp cxtm in
	    pfstate := (PfStateGoal(claimtm,(x,(atp,Some(btm)))::cxtm,cxpf))::pfstr
	| _ ->
	    raise (Failure("set tactic cannot be used when there is no claim"))
      end
  | ApplyTac(a) ->
      laststructaction := 0;
      let a = ltree_to_atree a in
      if !verbosity > 19 then (Printf.printf "apply tactic begin\nLength of pfstate stack: %d\n" (List.length !pfstate); flush stdout);
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let (apf,atm) = extract_pf a !polytm !polypf sigtmof sigdelta !sigtm !sigpf !ctxtp cxtm cxpf in
	    let sigma =
	      begin
		let i = ref 0 in
		List.iter (fun (_,(_,d)) -> match d with None -> incr i | _ -> ()) cxtm;
		map_for (fun j -> MDB j) 0 (!i-1)
	      end
	    in
	    let rec foapplyf p n margs subclaims apff =
	      try
		if !verbosity > 19 then (Printf.printf "about to call pattern_match with %s\n" (mtm_to_str p); flush stdout);
		let theta = pattern_match sigdelta p claimtm (fun _ -> raise Not_found) in
		if !verbosity > 19 then (Printf.printf "after pattern_match\n"; flush stdout);
		let ml = List.map (fun m -> mtm_to_tm (mtm_msub theta m)) margs in
		(*** The next code reverses the subclaims (so earliest arguments are to be proven first) and also grounds them from mtm to tm simultaneously ***)
		let subclaimtms = ref [] in
		List.iter
		  (fun c ->
		    let c1 = mtm_msub theta c in
		    let c2 = mtm_to_tm c1 in
		    subclaimtms := c2::!subclaimtms)
		  subclaims;
		(!subclaimtms,apff ml)
	      with MatchFail ->
		match p with
		| MImp(p1,p2) ->
		    foapplyf p2 n margs (p1::subclaims) (fun ml dl -> match dl with d::dr -> PPfAp(apff ml dr,d) | _ -> raise (Failure("proof reconstruction problem")))
		| MAll(a1,p2) ->
		    begin
		      match mtm_minap_db p2 0 with
		      | None -> (*** special case: no occurrence, use Eps _:a1, False ***)
			  let defelt = Ap(TpAp(Prim(0),a1),Lam(a1,All(Prop,DB(0)))) in
			  foapplyf p2 n margs subclaims (fun ml dl -> match dl with d::dr -> PTmAp(apff ml dr,defelt) | _ -> raise (Failure("proof reconstruction problem")))
		      | Some(l) when l = 0 -> (*** simple case, like a FO var ***)
			  foapplyf (mtm_ssub (MVar(n,sigma)::sigma) p2) (n+1) (MVar(n,sigma)::margs) subclaims (fun ml dl -> match ml with m::mr -> PTmAp(apff mr dl,m) | _ -> raise (Failure("proof reconstruction problem")))
		      | Some(l) -> (*** otherwise, move l arguments into the context of the metavar so that the higher-order pattern case is handled ***)
			  let sigmal = (map_for (fun j -> MDB j) 0 (l-1)) @ (List.map (mtm_shift 0 l) sigma) in
			  let rec lmvnr l a m =
			    if l > 0 then
			      begin
				match a with
				| Ar(a1,a2) -> MLam(a1,lmvnr (l-1) a2 m)
				| _ -> raise (Failure("Type Error found while attempting apply tactic"))
			      end
			    else
			      m
			  in
			  let lmvn = lmvnr l a1 (MVar(n,sigmal)) in
			  let p3 = mtm_ssub (lmvn::sigma) p2 in
			  let p4 = mtm_betared_if p3 (fun q _ -> mtm_lammvar_p q) in
			  foapplyf p4 (n+1) (lmvn::margs) subclaims (fun ml dl -> match ml with m::mr -> PTmAp(apff mr dl,m) | _ -> raise (Failure("proof reconstruction problem")))
		    end
		| _ ->
		    begin
		      let p1 = mtm_betared_if p (fun _ _ -> true) in (*** try to beta reduce ***)
		      if p = p1 then (*** there were no beta reductions ***)
			let (p2,del) = mheadnorm p sigdelta !deltaset in (*** try to delta expand some heads ***)
			if p = p2 then (*** no delta expansions ***)
			  raise Not_found (*** give up and fail ***)
			else
			  begin
			    deltaset := del;
			    foapplyf p2 n margs subclaims apff
			  end
		      else
			foapplyf p1 n margs subclaims apff
		    end
	    in
	    begin
	      try
		if !verbosity > 19 then (Printf.printf "Proof term given with apply proves %s\n" (tm_to_str atm); flush stdout);
		let (subclaims,apff) = foapplyf (tm_to_mtm atm) 0 [] [] (fun ml dl -> apf) in
		let nsubs = List.length subclaims in
		let currprooffun = !prooffun in
		prooffun := (fun dl -> let (dl1,dl2) = split_list nsubs dl in currprooffun (apff (List.rev dl1)::dl2));
		pfstate := (List.map (fun c -> PfStateGoal(c,cxtm,cxpf)) subclaims) @ pfstr;
		if !verbosity > 19 then (Printf.printf "here nach apply\nLength of pfstate stack: %d\n" (List.length !pfstate); flush stdout);
	      with Not_found ->
		raise (Failure("apply does not match the current claim"))
	    end
	| _ ->
	    raise (Failure("apply tactic cannot be used when there is no claim"))
      end
  | ClaimTac(x,a) ->
      laststructaction := 0;
      let a = ltree_to_atree a in
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let atm = check_tm a Prop !polytm sigtmof !sigtm !ctxtp cxtm in
	    pfstate := (PfStateGoal(atm,cxtm,cxpf))::(PfStateGoal(claimtm,cxtm,(x,atm)::cxpf))::pfstr;
	    let currprooffun = !prooffun in
	    prooffun := (fun dl -> match dl with d1::d2::dr -> currprooffun (PPfAp(PLam(atm,d2),d1)::dr) | _ -> raise (Failure("proof reconstruction problem")))
	| _ ->
	    raise (Failure("claim tactic cannot be used when there is no claim"))
      end
  | ProveTac(a,[]) ->
      laststructaction := 0;
      let a = ltree_to_atree a in
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let atm = check_tm a Prop !polytm sigtmof !sigtm !ctxtp cxtm in
	    begin
	      match conv claimtm atm sigdelta !deltaset with
	      | Some(dl) ->
		  deltaset := dl;
		  pfstate := (PfStateGoal(atm,cxtm,cxpf))::pfstr
	      | None ->
		  match conv (TmH(!fal)) atm sigdelta !deltaset with (*** or if prove False, then use FalseE ***)
                  | Some(del) ->
		     deltaset := del;
		     let currprooffun = !prooffun in
		     prooffun := (fun dl -> match dl with d1::dr -> currprooffun (PTmAp(PPfAp(Known(!fale),d1),claimtm)::dr) | _ -> raise (Failure("proof reconstruction problem")));
		     pfstate := (PfStateGoal(atm,cxtm,cxpf))::pfstr
                  | None ->
		     match conv (All(Prop,DB(0))) atm sigdelta !deltaset with (*** or if prove False, then use old FalseE ***)
		     | Some(del) ->
		        deltaset := del;
		        let currprooffun = !prooffun in
		        prooffun := (fun dl -> match dl with d1::dr -> currprooffun (PTmAp(d1,claimtm)::dr) | _ -> raise (Failure("proof reconstruction problem")));
		        pfstate := (PfStateGoal(atm,cxtm,cxpf))::pfstr
		     | None ->
		        raise (Failure("Proposition given with prove tactic does not match the current claim.\n" ^ tm_to_str claimtm ^ "\n" ^ tm_to_str atm))
	    end
	| _ ->
	    raise (Failure("prove tactic cannot be used when there is no claim"))
      end
  | ProveTac(a,bl) ->
      laststructaction := 0;
      raise (Failure("prove tactic can currently only be used with one proposition"))
  | CasesTac(a,xbll) ->
      laststructaction := 0;
      raise (Failure("cases tactic is not yet implemented"))
  | WitnessTac(a) ->
      laststructaction := 0;
      let a = ltree_to_atree a in
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	   begin
	     try
	       let (etp,ep) = extract_exclaim claimtm in
	       let atm = check_tm a etp !polytm sigtmof !sigtm !ctxtp cxtm in
	       let epatm =
		 begin
		   match ep with
		   | Lam(_,epbody) -> tmsubst epbody 0 atm
		   | _ -> Ap(ep,atm)
		 end
	       in
	       if !verbosity > 50 then (Printf.printf "witness tactic with etp = %s\n and ep = %s\n and atm = %s\n and epatm = %s\n" (tp_to_str etp) (tm_to_str ep) (tm_to_str atm) (tm_to_str epatm); flush stdout);
	       pfstate := (PfStateGoal(epatm,cxtm,cxpf)::pfstr);
	       let currprooffun = !prooffun in
               if !expolyIknown then
	         prooffun := (fun dl -> match dl with d1::dr -> currprooffun (PPfAp(PTmAp(PTmAp(PTpAp(Known(!expolyI),etp),ep),atm),d1)::dr) | _ -> raise (Failure("proof reconstruction problem")))
               else
	         prooffun :=
                   (fun dl ->
                     match dl with
                       d1::dr ->
                       currprooffun (TLam(Prop,PLam(All(etp,Imp(gen_lam_body(tmshift 0 1 ep),DB(1))),PPfAp(PTmAp(Hyp(0),tmshift 0 1 atm),pftmshift 0 1 (pfshift 0 1 d1))))::dr)
                     | _ -> raise (Failure("proof reconstruction problem")))
	     with Not_found ->
	       raise (Failure("witness tactic can only be used when claim is existential"))
	   end
	| _ ->
	   raise (Failure("witness tactic cannot be used when there is no claim"))
      end
  | RewriteTac(sym,a,posl) -> (*** rewrite from right to left if not sym or left to right if sym ***)
      laststructaction := 0;
      let a = ltree_to_atree a in
      if !verbosity > 19 then (Printf.printf "rewrite tactic begin\nLength of pfstate stack: %d\n" (List.length !pfstate); flush stdout);
      begin
	match !pfstate with
	| PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
	    let (apf,atm) = extract_pf a !polytm !polypf sigtmof sigdelta !sigtm !sigpf !ctxtp cxtm cxpf in
	    let sigma =
	      begin
		let i = ref 0 in
		List.iter (fun (_,(_,d)) -> match d with None -> incr i | _ -> ()) cxtm;
		map_for (fun j -> MDB j) 0 (!i-1)
	      end
	    in
	    let inpos i = match posl with [] -> true | _ -> List.mem i posl in
	    let posr = ref 0 in
	    let rec forewritef4 z etmi mtm =
	      if !verbosity > 79 then (Printf.printf "forewritef4: %d\n etmi: %s\n mtm: %s\n" z (tm_to_str etmi) (tm_to_str mtm); flush stdout);
	      if mtm = etmi then
		begin
		  incr posr;
		  if inpos !posr then
		    DB(z)
		  else
		    forewritef5 z etmi mtm
		end
	      else
		forewritef5 z etmi mtm
	    and forewritef5 z etmi mtm =
	      if !verbosity > 79 then (Printf.printf "forewritef5: %d\n etmi: %s\n mtm: %s\n" z (tm_to_str etmi) (tm_to_str mtm); flush stdout);
	      match mtm with
	      | Ap(m1,m2) ->
		  let m1b = forewritef4 z etmi m1 in
		  let m2b = forewritef4 z etmi m2 in
		  Ap(m1b,m2b)
	      | Imp(m1,m2) ->
		  let m1b = forewritef4 z etmi m1 in
		  let m2b = forewritef4 z etmi m2 in
		  Imp(m1b,m2b)
	      | Lam(a1,m1) -> Lam(a1,forewritef4 (z+1) (tmshift 0 1 etmi) m1)
	      | All(a1,m1) -> All(a1,forewritef4 (z+1) (tmshift 0 1 etmi) m1)
	      | DB(j) when j >= z -> DB(j+1)
	      | _ -> mtm
	    in
	    let rec forewritef2 z n etp etm mtm =
	      if !verbosity > 79 then (Printf.printf "forewritef2: %d %d\n etm: %s\n mtm: %s\n" z n (mtm_to_str etm) (tm_to_str mtm); flush stdout);
	      begin
		try
		  begin
		    if !verbosity > 19 then (Printf.printf "rewrite: about to call pattern_match with\n    %s\n =? %s\n" (mtm_to_str etm) (tm_to_str mtm); flush stdout);
		    let theta = pattern_match sigdelta etm mtm (fun _ -> raise Not_found) in
		    if !verbosity > 19 then (Printf.printf "after pattern_match %d\n" !posr; flush stdout);
		    try
		      begin
			for i = 0 to n-1 do
			  let _ = theta i in ()
			done;
			incr posr;
			if inpos !posr then
			  begin
			    (*** the instantiation to use ***)
			    (DB(z),theta)
			  end
			else
			  forewritef3 z n etp etm mtm
		      end
		    with Not_found ->
		      forewritef3 z n etp etm mtm
		  end
		with MatchFail ->
		  forewritef3 z n etp etm mtm
	      end
	    and forewritef3 z n etp etm mtm =
	      if !verbosity > 79 then (Printf.printf "forewritef3: %d %d\n etm: %s\n mtm: %s\n" z n (mtm_to_str etm) (tm_to_str mtm); flush stdout);
	      match mtm with
	      | Ap(m1,m2) ->
		  begin
		    try
		      let (leibp1,theta) = forewritef2 z n etp etm m1 in
		      let leibp2 = forewritef4 z (mtm_to_tm (mtm_msub theta etm)) m2 in
		      (Ap(leibp1,leibp2),theta)
		    with Not_found ->
		      let (leibp2,theta) = forewritef2 z n etp etm m2 in
		      (Ap(tmshift z 1 m1,leibp2),theta)
		  end
	      | Imp(m1,m2) ->
		  begin
		    try
		      let (leibp1,theta) = forewritef2 z n etp etm m1 in
		      let leibp2 = forewritef4 z (mtm_to_tm (mtm_msub theta etm)) m2 in
		      (Imp(leibp1,leibp2),theta)
		    with Not_found ->
		      let (leibp2,theta) = forewritef2 z n etp etm m2 in
		      (Imp(tmshift z 1 m1,leibp2),theta)
		  end
	      | Lam(a1,m1) ->
		  let (leibp1,theta) = forewritef2 (z+1) n etp (mtm_shift 0 1 etm) m1 in
		  (Lam(a1,leibp1),theta)
	      | All(a1,m1) ->
		  let (leibp1,theta) = forewritef2 (z+1) n etp (mtm_shift 0 1 etm) m1 in
		  (All(a1,leibp1),theta)
	      | _ -> raise Not_found
	    in
	    let destruct_leibeq p =
	      match p with
	      | MAp(MAp(MTpAp(MTmH(e),etp),ltm),rtm) when e = !eqPoly -> (etp,ltm,rtm) (*** recognize it before delta expanding ***)
	      | MAll(Ar(etp,Prop),MImp(MAp(MDB(0),shltm),MAp(MDB(0),shrtm))) -> (*** also need to recognize delta expanded version to avoid confusion ***)
		  begin
		    try
		      let ltm = mtm_shift 0 (-1) shltm in
		      let rtm = mtm_shift 0 (-1) shrtm in
		      (etp,ltm,rtm)
		    with NegDB -> raise Not_found
		  end
	      | _ ->
		  raise Not_found
	    in
	    let rec forewritef p n margs subclaims apff =
	      if !verbosity > 19 then (Printf.printf "forewritef p : %s\n" (mtm_to_str p); flush stdout);
	      begin
		try
		  let (etp,ltm,rtm) = destruct_leibeq p in
		  begin
		    try
		      let tm1 = if sym then rtm else ltm in
		      let tm2 = if sym then ltm else rtm in
		      let (leibq,theta) = forewritef2 0 n etp tm1 claimtm in
		      if !verbosity > 90 then (Printf.printf "leibq: %s\n" (tm_to_str leibq); flush stdout);
		      let tm2i = mtm_to_tm (mtm_msub theta tm2) in
		      let ml = List.map (fun m -> mtm_to_tm (mtm_msub theta m)) margs in
		      let subclaimtms = ref [] in
		      List.iter
			(fun c ->
			  let c1 = mtm_msub theta c in
			  let c2 = mtm_to_tm c1 in
			  subclaimtms := c2::!subclaimtms)
			subclaims;
		      let apffm =
			if sym then
			  (fun dl ->
			    match dl with
			      d::dr ->
				let epf = apff ml dr in
				PPfAp(PTmAp(epf,Lam(etp,Lam(etp,tmshift 0 1 leibq))),d)
			    | _ -> raise (Failure("proof reconstruction problem")))
			else
			  (fun dl ->
			    match dl with
			      d::dr ->
				let epf = apff ml dr in
				PPfAp(PTmAp(epf,Lam(etp,Lam(etp,tmshift 1 1 leibq))),d)
			    | _ -> raise (Failure("proof reconstruction problem")))
		      in
		      (tmsubst leibq 0 tm2i::!subclaimtms,apffm)
		    with Not_found ->
		      raise (Failure("rewrite tactic failed"))
		  end
		with Not_found ->
		  match p with
		  | MImp(p1,p2) ->
		      forewritef p2 n margs (p1::subclaims) (fun ml dl -> match dl with d::dr -> PPfAp(apff ml dr,d) | _ -> raise (Failure("proof reconstruction problem")))
		  | MAll(a1,p2) ->
		      begin
			match mtm_minap_db p2 0 with
			| None -> (*** special case: no occurrence, use Eps _:a1, False ***)
			    let defelt = Ap(TpAp(Prim(0),a1),Lam(a1,All(Prop,DB(0)))) in
			    forewritef p2 n margs subclaims (fun ml dl -> match dl with d::dr -> PTmAp(apff ml dr,defelt) | _ -> raise (Failure("proof reconstruction problem")))
			| Some(l) when l = 0 -> (*** simple case, like a FO var ***)
			    forewritef (mtm_ssub (MVar(n,sigma)::sigma) p2) (n+1) (MVar(n,sigma)::margs) subclaims (fun ml dl -> match ml with m::mr -> PTmAp(apff mr dl,m) | _ -> raise (Failure("proof reconstruction problem")))
			| Some(l) -> (*** otherwise, move l arguments into the context of the metavar so that the higher-order pattern case is handled ***)
			    let sigmal = (map_for (fun j -> MDB j) 0 (l-1)) @ (List.map (mtm_shift 0 l) sigma) in
			    let rec lmvnr l a m =
			      if l > 0 then
				begin
				  match a with
				  | Ar(a1,a2) -> MLam(a1,lmvnr (l-1) a2 m)
				  | _ -> raise (Failure("Type Error found while attempting apply tactic"))
				end
			      else
				m
			    in
			    let lmvn = lmvnr l a1 (MVar(n,sigmal)) in
			    let p3 = mtm_ssub (lmvn::sigma) p2 in
			    let p4 = mtm_betared_if p3 (fun q _ -> mtm_lammvar_p q) in
			    forewritef p4 (n+1) (lmvn::margs) subclaims (fun ml dl -> match ml with m::mr -> PTmAp(apff mr dl,m) | _ -> raise (Failure("proof reconstruction problem")))
		      end
		  | _ ->
		      begin
			let p1 = mtm_betared_if p (fun _ _ -> true) in (*** try to beta reduce ***)
			if p = p1 then (*** there were no beta reductions ***)
			  let (p2,del) = mheadnorm p sigdelta !deltaset in (*** try to delta expand some heads ***)
			  if p = p2 then
			    begin
			      if !verbosity > 19 then (Printf.printf "p : %s\n" (mtm_to_str p); flush stdout);
			      raise (Failure("rewrite tactic given a proof of a non-equation"))
			    end
			  else
			    begin
			      deltaset := del;
			      forewritef p2 n margs subclaims apff
			    end
			else
			  forewritef p1 n margs subclaims apff
		      end
	      end
	    in
	    begin
	      try
		if !verbosity > 19 then (Printf.printf "Proof term given with rewrite proves %s\n" (tm_to_str atm); flush stdout);
		let (subclaims,apff) = forewritef (tm_to_mtm atm) 0 [] [] (fun ml dl -> apf) in
		let nsubs = List.length subclaims in
		let currprooffun = !prooffun in
		prooffun := (fun dl -> match dl with d::dr -> let (dl1,dl2) = split_list (nsubs-1) dr in currprooffun (apff (d::(List.rev dl1))::dl2) | [] -> raise (Failure("proof reconstruction problem")));
		pfstate := (List.map (fun c -> PfStateGoal(c,cxtm,cxpf)) subclaims) @ pfstr;
		if !verbosity > 19 then (Printf.printf "here nach apply\nLength of pfstate stack: %d\n" (List.length !pfstate); flush stdout);
	      with Not_found ->
		raise (Failure("rewrite tactic failed"))
	    end
	| _ ->
	    raise (Failure("rewrite tactic cannot be used when there is no claim"))
      end
  | Qed ->
      begin
	if !pfstate = [] then
	  begin
	    try
	      if !verbosity > 19 then (Printf.printf "Qed start\n"; flush stdout);
	      if not (Hashtbl.mem indexknowns gphv) then Hashtbl.add indexknowns gphv ();
	      if not (Hashtbl.mem ownedprop pfggphv) then Hashtbl.add ownedprop pfggphv ();
	      activate_special_knowns gphv;
	      if !pfgtheory = Egal then megaauto_set_known gphv;
              if fofp() && i = 0 && not (Hashtbl.mem fofskip gphv) then (try fofsg := Printf.sprintf "fof(%s,axiom,%s). %% %s" (tptpize_name thmname) (fof_prop_str gpgtm []) gphv::!fofsg with NotFO -> ());
              if th0p() && i = 0 && not (Hashtbl.mem th0skip gphv) then
                begin
                  if not !bushy || Hashtbl.mem bushykdeps gphv then
                    if !th0ps1 then
                      (th0sgps1 := (Some(tm_deps gpgtm),Printf.sprintf "thf(%s,axiom,%s). %% %s" (tptpize_name thmname) (th0_str gpgtm []) gphv)::!th0sgps1)
                    else
                      (th0sg := Printf.sprintf "thf(%s,axiom,%s). %% %s" (tptpize_name thmname) (th0_str gpgtm []) gphv::!th0sg)
                end;
              begin
                match !sexprallsubgoals with
                | None -> ()
                | Some(seaspre,seasincl,i) ->
                   let fn = Printf.sprintf "%s_incl_%d.lisp" seaspre i in
                   let f = open_out fn in
                   if not (seasincl = "") then Printf.fprintf f "(INCLUDE \"%s\")\n" seasincl;
                   Printf.fprintf f "(THM \"%s\" \"%s\" %d %s)\n" thmname gphv i (tm_to_sexpr gpgtm);
                   sexprallsubgoals_inclfile := Some(f);
                   sexprallsubgoals := Some(seaspre,fn,i+1)
              end;
	      sigpf := (thmname,!appfloc (Known(gphv)))::!sigpf;
	      if i > 0 then (*** x will look polymorphic with i types after the appropriate section is ended ***)
		pushpolypf ((thmname,i),gpgtm);
	      secstack := List.map (fun (y,f,atl,apl,st,sp) -> (y,f,atl,apl,st,(thmname,apl (Known(gphv)))::sp)) !secstack;
	      proving := None;
	      let dgpf = !prooffun [] in
              let dgpf = if !optimizepf1 then optimize_pf_1 dgpf else dgpf in
              let dgpf = if !optimizepf2 then optimize_pf_2 sigdelta sigtmof dgpf !optimizepf2tc !optimizepf2pc else dgpf in
              let dgpf = if !normalizepf then normalize_pf dgpf else dgpf in
	      begin
                if i = 0 then
                  begin
                    Hashtbl.add pfgknph gphv gpgtm;
                  end;
	        if !pfgout && i = 0 then
	          pfgmain := PfgThm(gphv,thmname,gpgtm,dgpf)::!pfgmain
	      end;
	      if (!verbosity > 19) then (Printf.printf "Double checking:\n%s\n%s\n" (pf_to_str dgpf) (tm_to_str gpgtm); flush stdout);
	      match
                if !doublecheckpf then
                  check_propofpf sigdelta sigtmof [] [] dgpf gpgtm !deltaset
                else
                  Some(!deltaset)
              with
	      | None ->
		  if (!verbosity > 19) then (Printf.printf "Proof doesn't doublecheck!\n%s\n" (pf_to_str dgpf); flush stdout);
		  raise (Failure("Proof doesn't prove the proposition."))
	      | Some(dl) ->
		  deltaset := dl;
                  if !pfgout then List.iter (fun d -> Hashtbl.add pfgdelta d ()) !deltaset;
		  if (!verbosity > 19) then (Printf.printf "Delta Set:"; List.iter (fun h -> Printf.printf " %s" h) dl; Printf.printf "\n"; flush stdout);
		  let dhv = ppf_id (i,dgpf) sigtmof sigdelta in
		  if (!verbosity > 3) then (Printf.printf "Proof %s\n of %s was assigned id %s\n" (pf_to_str dgpf) thmname dhv; flush stdout);
		  if (!reportpfcomplexity) then (Printf.printf "(PFCOMPLEXITY \"%s\" \"%s\" \"%s\" %d)\n" thmname gphv dhv (pf_complexity dgpf); flush stdout);
		  begin
		    if !sqlout then
		      begin
			match !mainfilehash with
			| Some docsha ->
			    if !sqltermout then Printf.printf "INSERT INTO `term` (`termid`,`termtp`,`termpoly`) VALUES ('%s','%s',%d);\n" gphv (stp_html_string Prop) i;
			    if not !presentationonly then (Printf.printf "INSERT INTO `termdoc` (`termid`,`docsha`,`termdocname`,`termdockind`) VALUES ('%s','%s',\"%s\",'T');\n" gphv docsha (String.escaped thmname));
			    if !sqltermout then Printf.printf "INSERT INTO `proppf` (`propid`,`pfid`) VALUES ('%s','%s');\n" gphv dhv;
			    if not !presentationonly then
			      begin
				Printf.printf "INSERT INTO `proppfdoc` (`propid`,`pfid`,`docsha`) VALUES ('%s','%s',\"%s\");\n" gphv dhv docsha;
				List.iter
				  (fun d ->
				    Printf.printf "INSERT INTO `proppfdocdelta` (`propid`,`pfid`,`docsha`,`termid`) VALUES ('%s','%s','%s','%s');\n" gphv dhv docsha d)
				  !deltaset
			      end
			| None -> ()
		      end
		  end;
	    with AdmittedPf ->
	      if (!verbosity > 9) then (Printf.printf "Theorem %s admitted\n" thmname; flush stdout);
              if !pfgout && i = 0 then pfgmain := PfgConj(gphv,thmname,gpgtm)::!pfgmain;
	      if (!ajax && !ajaxactive) then (Printf.printf "I$"; exit 1);
	      begin
		if !sqlout then
		  begin
		    match !mainfilehash with
		    | Some docsha ->
			if !sqltermout then Printf.printf "INSERT INTO `term` (`termid`,`termtp`,`termpoly`) VALUES ('%s','%s',%d);\n" gphv (stp_html_string Prop) i;
			if not !presentationonly then (Printf.printf "INSERT INTO `termdoc` (`termid`,`docsha`,`termdocname`,`termdockind`) VALUES ('%s','%s',\"%s\",'t');\n" gphv docsha (String.escaped thmname));
		    | None -> ()
		  end
	      end;
	      treasure := None;
	  end
	else
	  raise (Failure("Proof of " ^ thmname ^ " is incomplete"))
      end
  | Admitted ->
      begin
        if !pfgout && i = 0 then pfgmain := PfgConj(gphv,thmname,gpgtm)::!pfgmain;
	if i > 0 then (*** x will look polymorphic with i types after the appropriate section is ended ***)
	  pushpolypf ((thmname,i),gpgtm);
	activate_special_knowns gphv;
	sigpf := (thmname,!appfloc (Known(gphv)))::!sigpf;
	secstack := List.map (fun (y,f,atl,apl,st,sp) -> (y,f,atl,apl,st,(thmname,apl (Known(gphv)))::sp)) !secstack;
	proving := None;
        List.iter admitpfstateatp !pfstate;
        if fofp() && i = 0 && not (Hashtbl.mem fofskip gphv) then (try fofsg := Printf.sprintf "fof(%s,axiom,%s). %% %s" (tptpize_name thmname) (fof_prop_str gpgtm []) gphv::!fofsg with NotFO -> ());
        if th0p() && i = 0 && not (Hashtbl.mem th0skip gphv) then
          begin
            if not !bushy || Hashtbl.mem bushykdeps gphv then
              if !th0ps1 then
                (th0sgps1 := (Some(tm_deps gpgtm),Printf.sprintf "thf(%s,axiom,%s). %% %s" (tptpize_name thmname) (th0_str gpgtm []) gphv)::!th0sgps1)
              else
                (th0sg := Printf.sprintf "thf(%s,axiom,%s). %% %s" (tptpize_name thmname) (th0_str gpgtm []) gphv::!th0sg)
          end;
	pfstate := [];
	treasure := None;
	admits := true;
	begin
	  if !sqlout then
	    begin
	      match !mainfilehash with
	      | Some docsha ->
		  if !sqltermout then Printf.printf "INSERT INTO `term` (`termid`,`termtp`,`termpoly`) VALUES ('%s','%s',%d);\n" gphv (stp_html_string Prop) i;
		  if not !presentationonly then (Printf.printf "INSERT INTO `termdoc` (`termid`,`docsha`,`termdocname`,`termdockind`) VALUES ('%s','%s',\"%s\",'t');\n" gphv docsha (String.escaped thmname));
	      | None -> ()
	    end
	end;
      end
  | Admit ->
      begin
	match !pfstate with
	| (pfst::pfstr) ->
           admitpfstateatp pfst;
	   pfstate := pfstr;
	   admits := true;
	   prooffun := (fun _ -> raise AdmittedPf)
	| [] -> raise (Failure("No goal to admit"))
      end
  | SpecialTac(x,[]) when x = "distinct" ->
     begin
       if !pfgtheory = HOAS then
         begin
           match !pfstate with
           | PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
              begin
                let pair_p h = h = "d58762d200971dcc7f1850726d9f2328403127deeba124fc3ba2d2d9f7c3cb8c" in
                let bind_p h = h = "73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5" in
                let nil_p h = h = "f2f23aaed49035f6a02316839e024937b84f34a64984a739b9926cab5a542a5f" in
                let pair_inj_1 = "457b940661b14b2f6c55f4e7605ad9a08b93a9b227b7e4878ddffc6e57df03a2" in
                let pair_inj_2 = "73f4a4caf8cee16dce31f48373fcde8d22191ae8296b2b2bf68179080d71a009" in
                let bind_inj_ap = "8fdd8c4b6d2d33c21317e9fc8ac0f977b3b46107d8cc02f74d0fed4687b9c56d" in
                let pair_not_bind = "a23f2c1f208ea6ea3b76e405265b31ec3200243c72060d4f98bb444454185d06" in
                let bind_not_pair = "fcdac3008d43d05308faafb376db2dfeb46eab33d92fa74e62cb0e1cd7c2ebdb" in
                let neq_nil_pair = "1bc9e5a6bb4b9fc4bcea4014f16d6bce1e24d81a4ac53f43308fd4fc2341d7b2" in
                let neq_pair_nil = "b607690c256cba399c9e93b5e9eba9ff5076b96d3db0cdd3d5a7d7265d94153e" in
                let neq_nil_bind_bind = "f345e493f800501229a81468d5fa1d95d06a9553d7e0fcf7224a17b5bd031df7" in
                let neq_nil_bind_pair = "cd9ce7241c739c03b20b982846667c257ce793909e22508b22eccd7c6cb6299c" in
                let neq_bind_bind_nil = "40c1e7e6df27ccc363e7453d25a4e162fc682a1302e1a1fa0e80d81335f1f8b9" in
                let neq_bind_pair_nil = "aff40b8394f4b562125e5dd663ac533a7b5cb32141da97ac07aba16892910c66" in
                let neq_bind_nil_nil = "b0d0dea69aaf4f5154a19e1dc220feb9ff274d1be96686a1dd935b52d206c5e4" in
                let neq_nil_bind_nil = "b3f848b81475c0ad6324c86de54a34b2c73046e7317705a6ded788fdae822e2d" in
                let nil = TmH("f2f23aaed49035f6a02316839e024937b84f34a64984a739b9926cab5a542a5f") in
                let nil2 = Ap(Ap(TmH("d58762d200971dcc7f1850726d9f2328403127deeba124fc3ba2d2d9f7c3cb8c"),nil),nil) in
                let rec distinct_hoas_2 m n d =
                  match m with
                  | TmH(h) when nil_p h ->
                     begin
                       match n with
                       | Ap(Ap(TmH(h),n1),n2) when pair_p h ->
                          PPfAp(PTmAp(PTmAp(Known(neq_nil_pair),n1),n2),d)
                       | Ap(TmH(h),Lam(Set,TmH(k))) when bind_p h && nil_p k ->
                          PPfAp(Known(neq_nil_bind_nil),d)
                       | Ap(TmH(h),Lam(Set,Ap(Ap(TmH(k),n1),n2))) when bind_p h && pair_p k ->
                          PPfAp(PTmAp(PTmAp(Known(neq_nil_bind_pair),Lam(Set,n1)),Lam(Set,n2)),d)
                       | Ap(TmH(h),Lam(Set,Ap(TmH(k),n1))) when bind_p h && bind_p k ->
                          PPfAp(PTmAp(Known(neq_nil_bind_bind),Lam(Set,n1)),d)
                       | _ -> raise (Failure "distinct failed nil vs ?")
                     end
                  | Ap(Ap(TmH(h),m1),m2) when pair_p h ->
                     begin
                       match n with
                       | TmH(h) when nil_p h ->
                          PPfAp(PTmAp(PTmAp(Known(neq_pair_nil),m1),m2),d)
                       | Ap(Ap(TmH(h),n1),n2) when pair_p h ->
                          if m1 = n1 then
                            distinct_hoas_2 m2 n2 (PPfAp(PTmAp(PTmAp(PTmAp(PTmAp(Known(pair_inj_2),m1),m2),n1),n2),d))
                          else
                            distinct_hoas_2 m1 n1 (PPfAp(PTmAp(PTmAp(PTmAp(PTmAp(Known(pair_inj_1),m1),m2),n1),n2),d))
                       | Ap(TmH(h),n1) when bind_p h ->
                          PPfAp(PTmAp(PTmAp(PTmAp(Known(pair_not_bind),m1),m2),n1),d)
                       | _ -> raise (Failure "distinct failed pair vs ?")
                     end
                  | Ap(TmH(h),(Lam(Set,m1b) as m1)) when bind_p h ->
                     begin
                       match n with
                       | TmH(h) when nil_p h ->
                          begin
                            match m1b with
                            | TmH(h) when nil_p h ->
                               PPfAp(Known(neq_bind_nil_nil),d)
                            | Ap(Ap(TmH(h),m2),m3) when pair_p h ->
                               PPfAp(PTmAp(PTmAp(Known(neq_bind_pair_nil),Lam(Set,m2)),Lam(Set,m3)),d)
                            | Ap(TmH(h),m2) when bind_p h ->
                               PPfAp(PTmAp(Known(neq_bind_bind_nil),Lam(Set,m2)),d)
                            | _ -> raise (Failure "distinct failed bind ? vs nil")
                          end
                       | Ap(Ap(TmH(h),n1),n2) when pair_p h ->
                          PPfAp(PTmAp(PTmAp(PTmAp(Known(bind_not_pair),m1),n1),n2),d)
                       | Ap(TmH(h),(Lam(Set,n1b) as n1)) when bind_p h ->
                          let m1c = tmsubst m1b 0 nil in
                          let n1c = tmsubst n1b 0 nil in
                          if m1c = n1c then
                            let m1c = tmsubst m1b 0 nil2 in
                            let n1c = tmsubst n1b 0 nil2 in
                            if m1c = n1c then
                              raise (Failure "distinct failed in an impossible way")
                            else
                              distinct_hoas_2 m1c n1c
                                (PPfAp(PTmAp(PTmAp(PTmAp(Known(bind_inj_ap),m1),n1),nil2),d))
                          else
                            distinct_hoas_2 m1c n1c
                              (PPfAp(PTmAp(PTmAp(PTmAp(Known(bind_inj_ap),m1),n1),nil),d))
                       | _ -> raise (Failure "distinct failed bind vs ?")
                     end
                  | _ -> raise (Failure "distinct failed ? vs _")
                in
                let distinct_hoas m n =
                  let d = PLam(Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),m),n),distinct_hoas_2 m n (Hyp(0))) in
                  let currprooffun = !prooffun in
                  prooffun := (fun dl -> currprooffun (d::dl));
                  pfstate := pfstr
                in
                match claimtm with
                | Ap(Ap(TpAp(TmH(h),Set),m),n) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" && not (m = n) ->
                   distinct_hoas m n
                | Imp(Ap(Ap(TpAp(TmH(h),Set),m),n),TmH(k)) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" && k = !fal && not (m = n) ->
                   distinct_hoas m n
                | Imp(Ap(Ap(TpAp(TmH(h),Set),m),n),All(Prop,DB(0))) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" && not (m = n) ->
                   distinct_hoas m n
                | _ -> raise (Failure "distinct tactic requires goal to be diseqn")
              end
           | _ -> raise (Failure "distinct tactic requires a goal")
         end
       else if !pfgtheory = Egal then
         begin
           match !pfstate with
           | PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
              begin
                let empty = "e2a83319facad3a3d8ff453f4ef821d9da495e56a623695546bb7d7ac333f3fe" in
                let ordsucc = "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" in
                let ap = "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" in
                let seqcons = "7a7fd30507c2156eeace3d2784ada104fee81316a9d6f02db384ad7f0a180e26" in
                let ordsucc_inj_contra = "c14fd6fe2e5850baa4c1ccd03bdaba358bff7548a20bfc48adeaa2b0e25f954a" in
                let omega_0 = "bbcf0e220bcdf977752b81f9870f771a8f4c40280650ea2d6db27815db42a076" in
                let omega_1 = "e72d3a03fe620df3b005cd8f14e3371c74198d7831c51a5aa8fe55579b3b27e1" in
                let omega_2 = "1debfa007905ce354ac9ae49484625ee7b38559c01f9dde9f65da732bd66c17c" in
                let omega_3 = "16487b74fc6769a27b41420352ff54c3910af996d931abd293e56e9052adce24" in
                let omega_4 = "c7e3e0042f8c0b1465a73053ba5334d188c2c5b5788b5d62176e5253855105ff" in
                let omega_5 = "3aef5fcf45d766379ba44b1d68757bb530afad3889f68f958f3c75e691d6ac1c" in
                let omega_6 = "776254dacdcd5305a2d088e32f35349284ac9469a48d75d6c42c0ca30b0f41a8" in
                let omega_7 = "dab4795d867a70ec3aeb2e69527fd0c5a2b046f2e0651b0bc81ace97b9223a78" in
                let omega_8 = "9ed3fe2c43815cc21075da094e596727c1075e6cd0d9837197cf5f9fd8362b76" in
                let omega_9 = "440819f34c1019a1ea2d5a73690079ffe9a34e9bd2bfb22fcbbf3d0e8ac014c8" in
                let neq_0_1 = "2a012236fc59f277a006afea6589576917b98079dfa3b365b27050d0e9d91f80" in
                let neq_1_0 = "a96636a83cef72bedda13177ba1f197ac6b6dab4613cc8062584e25c143b84fa" in
                let neq_2_0 = "76555b2fee92c2ef5efd3b1992a67dc11fd63bdea9e5147e490c7e1ae4ee037b" in
                let neq_2_1 = "135568bce4957f8ff275fe7875a26c3a288753a68ac4c21f361d110205b652b1" in
                let neq_3_0 = "6bc86ccb84fb960ec861595b19cca0513d4d04fa60f52d048d03bf4db383b0b9" in
                let neq_3_1 = "bbf0a972daf94de44ca9e6714156288860c0ee07faddced2a33a85d436ce3a85" in
                let neq_3_2 = "ddf0ba7e2399c5fdeb0b501ea721f58182b15ac29fdf19dfe797bb25c4b9d419" in
                let neq_4_0 = "45b3a962a198a7091fb2788ad6766dee9ff53d745ce48abdc56a15a3205bcd09" in
                let neq_4_1 = "78b075d44317f00feb434db7dd5d19ad03a97cc90231e81c2bb7c6e392ceff0e" in
                let neq_4_2 = "9728fc1c149dfd2b4011120ea562b36537741ea5e113b683baaae09b8f631c15" in
                let neq_4_3 = "2a2127eee38e3aea9338de549dbabe0bdbdc1313ca911e3a4fa85ad4692976e4" in
                let neq_5_0 = "659c883887b5b2348a98be074c4f7198381d197b7976fa7f4401683d65ee328f" in
                let neq_5_1 = "3fafec5ee2d00ed3e6dbd318e58d8f869d482a57bc398bc941ffa3ee7d9b4482" in
                let neq_5_2 = "ac3a8a725a92461e10265875c0dd4faa6ac70a45646a02a43c26ef9602edb367" in
                let neq_5_3 = "b57ba763b444014afea17778d853859c8bc75d2c82396d2de346e491c7f0942e" in
                let neq_5_4 = "70bc8cbf0960ef0a1d6db3bd2f26a3815844a96214810b428fb78503bd686b4f" in
                let neq_6_0 = "bfad1824a78e812e31f842faa26d565c7aa43da9fc3a955812cf51a8ecec21bc" in
                let neq_6_1 = "26640fd5441a57a61669bc1ae992569b73e739e9214215a28039aa5d04cd1cad" in
                let neq_6_2 = "41fa60d271f99cad3c1cb11c0430cddbb657c03a3c9dcb7facc96d0137fac8c8" in
                let neq_6_3 = "ff0841068e1303a6ee65eed594b7f9f8c22d5fc19da35436fba58b8d8bd16ad6" in
                let neq_6_4 = "7135026aaf75491aad27a55a73486ca9db35da4d97b1f152d26dd4866624e1df" in
                let neq_6_5 = "ee2feea2a607ac27e097cf82c74c2ac3239ebe9b39d1ca4841b108680ec60bdd" in
                let neq_7_0 = "036f041c0fa6749260db7745cd709fb3641acbed368f22cd76a2343d587bc049" in
                let neq_7_1 = "4df9782c7ce6454e4b5b8c6916468843ce1f45b87831c521fabd85057e7a4da7" in
                let neq_7_2 = "6d1921aea0ca49ec01a2e2b83bb9fed901466d18eb4aafc4217f64508474808a" in
                let neq_7_3 = "16130c0707547c532c8bde3a5f9333d003707b9c05f8fb2bb987447c6fe6df0f" in
                let neq_7_4 = "d21557722bb427617660a8620a34c204e7f35ba10d69d3bcb5f76b2867c126eb" in
                let neq_7_5 = "6a50d61b0a6a158130d45abfd1d3f55b910591868ba88b6dcda3e099693422b2" in
                let neq_7_6 = "50e31bdb74debec57e94dbfd0e2b3d9c10adc76d6db45470e7d600f319bd098f" in
                let neq_8_0 = "58432f5a9025e83c0e98a97fdac4250f42c78ca43fd4e5a3f5ba935f740fb07d" in
                let neq_8_1 = "4fef6b56e6a29a11789695843cd65d75589e723894d09024730575403a385066" in
                let neq_8_2 = "4a3f78215e3ab72f328439a7a3aa0638de35309642508ee69891e8828f594e30" in
                let neq_8_3 = "42e18bc47b79fdd696990d53f07c8f936465d0a9cb9bc2a9118971e3994fdbef" in
                let neq_8_4 = "3fcba92db38e6b18020633e43a169bc0ff5a7a98bd01a0e042ed65b9e3177423" in
                let neq_8_5 = "12a63db797bf7dc38ebcc8182c323495e47839c8f56c53c3a96f4e61fa2f356c" in
                let neq_8_6 = "3c1c85cfb0a576724c0fd7548fa2ed36e5b747f4e51357a041bb6f6d3fcf4b59" in
                let neq_8_7 = "4f278419d05a30316178e195b67eba36793a0c3b0f5f215288bfd9bfac34086e" in
                let neq_9_0 = "7023756fd839c4b7ebf30b02c856f5ad1fc3c359701f79904bff48841ddadf38" in
                let neq_9_1 = "2c30786dd7e2b3eb7a8b816bd7b28f8398817fe880fa18bde3cff8efc4aa57af" in
                let neq_9_2 = "72898cc3b39b91929f3a6e08863d33547bd20d213b6a6e55dae72803c156a44d" in
                let neq_9_3 = "9c36f33d36433469e3f69e512396362343c2492967143dfb16eab54d7d20afd5" in
                let neq_9_4 = "1983e8af533cd22d8688a303f19a7557a6024a0e20ef7a380fbceafd85f24b71" in
                let neq_9_5 = "5a746a843ef271ad2dd35d629d1a24a38497b1fc29dc3458edec02ad672490db" in
                let neq_9_6 = "bbe50369f94f084e124f71804a36dcfd3428283c447f07e42d955800bdd13ce0" in
                let neq_9_7 = "b6be74e8405fd99ec9fe15fca804e40902963bbf03738c5c0b0ba79cafc289bd" in
                let neq_9_8 = "9afd8e465b5919eeac913849640e4e8192964f11e9b31f59d2c8966910c2d262" in
                let neq_0_ordsucc = "cd16045e375d4af84d5e4935492f9372af2c1df516250653f67f2eabce3e1a96" in
                let neq_ordsucc_0 = "10d9661442ca65e01bc41935f4cb9aa6a33342df51d9e7dd2fd94e6c575e9dda" in
                let neq_i_sym = "5975ea0d667ef81890db1136e825d1bda7a0dec6bacfabb8f8c03bae6c9d6bde" in
                let ap_const_0 = "af2119ddb02d9f2271a6b2b76c6f50827be8080ea4aa8e4f3c6a91c17dd873a3" in
		let neq0_ap0 = "4803f585e97b1d8fdd5d35d0ad0e9a3a2bb64a7a3e3d79ce9f5c45f8a99cdca8" in
                let seq_cons_0 = "194a4a83e17384dc5acafa81e964161d02bd5bff0e2b087e0f02d19431dfde61" in
                let seq_cons_S_tra = "7e021728a91828d3f12899d2d7ed342ae7db555450d2138904d8a2ab21d9401d" in
                let omega_ordsucc = "f88efc1bceb13c969121ead8cc2c43f0ce2f1c2aeeab14ec80e7cbae241b81b8" in
                let rec unary_nat m =
                  if m > 0 then
                    Ap(TmH(ordsucc),unary_nat (m-1))
                  else
                    TmH(empty)
                in
                let rec omega_nat m =
                  if m > 9 then
                    PPfAp(PTmAp(Known(omega_ordsucc),unary_nat (m-1)),omega_nat (m-1))
                  else if m = 0 then
                    Known(omega_0)
                  else if m = 1 then
                    Known(omega_1)
                  else if m = 2 then
                    Known(omega_2)
                  else if m = 3 then
                    Known(omega_3)
                  else if m = 4 then
                    Known(omega_4)
                  else if m = 5 then
                    Known(omega_5)
                  else if m = 6 then
                    Known(omega_6)
                  else if m = 7 then
                    Known(omega_7)
                  else if m = 8 then
                    Known(omega_8)
                  else if m = 9 then
                    Known(omega_9)
                  else
                    raise (Failure "distinct failed")
                in
                let rec unary_nat_p m =
                  match m with
                  | TmH(h) when h = empty -> true
                  | Ap(TmH(h),m1) when h = ordsucc -> unary_nat_p m1
                  | _ -> false
                in
                let rec seq_over_p p m = (** this includes bytes when p = unary_nat_p and includes strings when p = seq_over_p unary_nat_p **)
                  match m with
                  | TmH(h) when h = empty -> true
                  | Ap(Ap(TmH(h),x),s) when h = seqcons -> p x && seq_over_p p s
                  | _ -> false
                in
                let rec eval_unary_nat m =
                  match m with
                  | TmH(h) when h = empty -> 0
                  | Ap(TmH(h),m1) when h = ordsucc -> 1+eval_unary_nat m1
                  | _ -> raise (Failure "distinct failed")
                in
                let unary_nat_special_case m n =
                  if m = 1 && n = 0 then
                    neq_1_0
                  else if m = 2 && n = 0 then
                    neq_2_0
                  else if m = 2 && n = 1 then
                    neq_2_1
                  else if m = 3 && n = 0 then
                    neq_3_0
                  else if m = 3 && n = 1 then
                    neq_3_1
                  else if m = 3 && n = 2 then
                    neq_3_2
                  else if m = 4 && n = 0 then
                    neq_4_0
                  else if m = 4 && n = 1 then
                    neq_4_1
                  else if m = 4 && n = 2 then
                    neq_4_2
                  else if m = 4 && n = 3 then
                    neq_4_3
                  else if m = 5 && n = 0 then
                    neq_5_0
                  else if m = 5 && n = 1 then
                    neq_5_1
                  else if m = 5 && n = 2 then
                    neq_5_2
                  else if m = 5 && n = 3 then
                    neq_5_3
                  else if m = 5 && n = 4 then
                    neq_5_4
                  else if m = 6 && n = 0 then
                    neq_6_0
                  else if m = 6 && n = 1 then
                    neq_6_1
                  else if m = 6 && n = 2 then
                    neq_6_2
                  else if m = 6 && n = 3 then
                    neq_6_3
                  else if m = 6 && n = 4 then
                    neq_6_4
                  else if m = 6 && n = 5 then
                    neq_6_5
                  else if m = 7 && n = 0 then
                    neq_7_0
                  else if m = 7 && n = 1 then
                    neq_7_1
                  else if m = 7 && n = 2 then
                    neq_7_2
                  else if m = 7 && n = 3 then
                    neq_7_3
                  else if m = 7 && n = 4 then
                    neq_7_4
                  else if m = 7 && n = 5 then
                    neq_7_5
                  else if m = 7 && n = 6 then
                    neq_7_6
                  else if m = 8 && n = 0 then
                    neq_8_0
                  else if m = 8 && n = 1 then
                    neq_8_1
                  else if m = 8 && n = 2 then
                    neq_8_2
                  else if m = 8 && n = 3 then
                    neq_8_3
                  else if m = 8 && n = 4 then
                    neq_8_4
                  else if m = 8 && n = 5 then
                    neq_8_5
                  else if m = 8 && n = 6 then
                    neq_8_6
                  else if m = 8 && n = 7 then
                    neq_8_7
                  else if m = 9 && n = 0 then
                    neq_9_0
                  else if m = 9 && n = 1 then
                    neq_9_1
                  else if m = 9 && n = 2 then
                    neq_9_2
                  else if m = 9 && n = 3 then
                    neq_9_3
                  else if m = 9 && n = 4 then
                    neq_9_4
                  else if m = 9 && n = 5 then
                    neq_9_5
                  else if m = 9 && n = 6 then
                    neq_9_6
                  else if m = 9 && n = 7 then
                    neq_9_7
                  else if m = 9 && n = 8 then
                    neq_9_8
                  else
                    raise (Failure "distinct failed")
                in
                let rec distinct_egal_unary_nat_r m m1 n n1 =
                  if m1 = 0 && n1 = 1 then
                    Known(neq_0_1)
                  else if m1 > n1 && m1 < 10 then
                    Known(unary_nat_special_case m1 n1)
                  else if n1 > m1 && n1 < 10 then
                    PPfAp(PTmAp(PTmAp(Known(neq_i_sym),n),m),Known(unary_nat_special_case n1 m1))
                  else
                    match (m,n) with
                    | (Ap(_,mp),Ap(_,np)) ->
                       PPfAp(PTmAp(PTmAp(Known(ordsucc_inj_contra),mp),np),distinct_egal_unary_nat_r mp (m1-1) np (n1-1))
                    | (TmH(h),Ap(_,np)) when h = empty ->
                       PTmAp(Known(neq_0_ordsucc),np)
                    | (Ap(_,mp),TmH(h)) when h = empty ->
                       PTmAp(Known(neq_ordsucc_0),mp)
                    | _ -> raise (Failure "distinct failed")
                in
                let distinct_egal_unary_nat m n =
                  let m1 = eval_unary_nat m in
                  let n1 = eval_unary_nat n in
                  distinct_egal_unary_nat_r m m1 n n1
                in
                let distinct_egal_unary_nat_ne m =
                  let m1 = eval_unary_nat m in
                  distinct_egal_unary_nat_r m m1 (TmH(empty)) 0
                in
                let rec distinguishing_elt m n i =
                  match (m,n) with
                  | (Ap(Ap(_,x),mr),Ap(Ap(_,y),nr)) ->
                     if x = y then
                       distinguishing_elt mr nr (1+i)
                     else
                       (i,Some(x),Some(y))
                  | (Ap(Ap(TmH(_),x),_),TmH(h)) when h = empty ->
                     (i,Some(x),None)
                  | (TmH(h),Ap(Ap(TmH(_),y),_)) when h = empty ->
                     (i,None,Some(y))
                  | _ ->
                     (i,None,None)
                in
                let rec seq_at_eq_0 m i =
                  match m with
                  | TmH(h) when h = empty -> PTmAp(Known(ap_const_0),unary_nat i)
                  | Ap(Ap(TmH(h),x),mr) when h = seqcons ->
                     if i > 0 then
                       let d = seq_at_eq_0 mr (i-1) in
                       PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(PTmAp(Known(seq_cons_S_tra),x),mr),TmH(empty)),unary_nat (i-1)),omega_nat (i-1)),d)
                     else
                       raise (Failure "distinct failed")
                  | _ -> raise (Failure "distinct failed")
                in
                let rec seq_at_eq m i x =
                  match m with
                  | Ap(Ap(TmH(h),y),mr) when h = seqcons ->
                     if i > 0 then
                       PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(PTmAp(Known(seq_cons_S_tra),y),mr),x),unary_nat (i-1)),omega_nat (i-1)),seq_at_eq mr (i-1) x)
                     else
                       PTmAp(PTmAp(Known(seq_cons_0),x),mr)
                  | _ -> raise (Failure "distinct failed")
                in
                let distinct_egal_seq_over_ne dne m =
                  match m with
                  | Ap(Ap(TmH(h),x),mr) when h = seqcons ->
                     let dnex = dne x in (** pf of x <> 0 **)
                     let dm0x = seq_at_eq m 0 x in (** pf of m 0 = x **)
                     (** pf of m <> 0 **)
                     PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(Known(neq0_ap0),m),TmH(empty)),x),dm0x),dnex)
                  | _ -> raise (Failure "distinct failed")
                in
                let distinct_egal_seq_over d dne m n =
                  match distinguishing_elt m n 0 with
                  | (i,Some(x),Some(y)) ->
                     let dmix = seq_at_eq m i x in (** pf of m i = x **)
                     let dniy = seq_at_eq n i y in (** pf of n i = y **)
                     let ddif = d x y in (** pf of x <> y **)
                     (** pf of m <> n **)
                     PLam(Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),m),n),PPfAp(ddif,PPfAp(PTmAp(PPfAp(PTmAp(Hyp(0),Lam(Set,Lam(Set,Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),Ap(Ap(TmH(ap),DB(1)),unary_nat i)),x)))),dmix),Lam(Set,Lam(Set,Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),DB(1)),y)))),dniy)))
                  | (i,Some(x),None) ->
                     let dmix = seq_at_eq m i x in (** pf of m i = x **)
                     let dni0 = seq_at_eq_0 n i in (** pf of n i = 0 **)
                     let dnex = dne x in (** pf of x <> 0 **)
                     PLam(Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),m),n),PPfAp(dnex,PPfAp(PTmAp(PPfAp(PTmAp(Hyp(0),Lam(Set,Lam(Set,Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),Ap(Ap(TmH(ap),DB(1)),unary_nat i)),x)))),dmix),Lam(Set,Lam(Set,Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),DB(1)),TmH(empty))))),dni0)))
                  | (i,None,Some(y)) ->
                     let dmi0 = seq_at_eq_0 m i in (** pf of m i = 0 **)
                     let dniy = seq_at_eq n i y in (** pf of n i = y **)
                     let dney = dne y in (** pf of y <> 0 **)
                     PLam(Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),m),n),PPfAp(dney,PPfAp(PTmAp(PPfAp(PTmAp(Hyp(0),Lam(Set,Lam(Set,Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),Ap(Ap(TmH(ap),DB(0)),unary_nat i)),y)))),dniy),Lam(Set,Lam(Set,Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),Set),DB(1)),TmH(empty))))),dmi0)))
                  | (i,None,None) -> raise (Failure "distinct failed")
                in
                let distinct_egal_1 m n =
                  if unary_nat_p m && unary_nat_p n then
                    distinct_egal_unary_nat m n
                  else if seq_over_p unary_nat_p m && seq_over_p unary_nat_p n then
                    distinct_egal_seq_over distinct_egal_unary_nat distinct_egal_unary_nat_ne m n
                  else if seq_over_p (seq_over_p unary_nat_p) m && seq_over_p (seq_over_p unary_nat_p) n then
                    distinct_egal_seq_over
                      (distinct_egal_seq_over distinct_egal_unary_nat distinct_egal_unary_nat_ne)
                      (distinct_egal_seq_over_ne distinct_egal_unary_nat_ne)
                      m n
                  else
                    raise (Failure "distinct failed")
                in
                let distinct_egal m n =
                  let d = distinct_egal_1 m n in
                  let currprooffun = !prooffun in
                  prooffun := (fun dl -> currprooffun (d::dl));
                  pfstate := pfstr
                in
                match claimtm with
                | Ap(Ap(TpAp(TmH(h),Set),m),n) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" && not (m = n) ->
                   distinct_egal m n
                | Imp(Ap(Ap(TpAp(TmH(h),Set),m),n),TmH(k)) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" && k = !fal && not (m = n) ->
                   distinct_egal m n
                | Imp(Ap(Ap(TpAp(TmH(h),Set),m),n),All(Prop,DB(0))) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" && not (m = n) ->
                   distinct_egal m n
                | _ -> raise (Failure "distinct tactic requires goal to be diseqn")           
              end
           | _ -> raise (Failure "distinct tactic requires a goal")
         end
       else
         raise (Failure "distinct tactic is only implemented for HOAS and Egal")
     end
  | SpecialTac(x,[]) when x = "reflexivity" ->
     begin
       match !pfstate with
       | PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
          begin
            match claimtm with
            | Ap(Ap(TpAp(TmH(h),a),m),n) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
               begin
                 match conv m n sigdelta !deltaset with
                 | Some(dl) ->
                    deltaset := dl;
                    let reflp = TLam(Ar(a,Ar(a,Prop)),PLam(Ap(Ap(DB(0),tmshift 0 1 m),tmshift 0 1 n),Hyp(0))) in
		    let currprooffun = !prooffun in
                    prooffun := (fun dl -> currprooffun (reflp::dl));
                    pfstate := pfstr
                 | None -> raise (Failure("reflexivity failed"))
               end
            | _ -> raise (Failure("reflexivity tactic cannot be used when there is not an equation"))
          end
       | _ -> raise (Failure("reflexivity tactic cannot be used when there is no claim"))
     end
  | SpecialTac(x,[]) when x = "symmetry" ->
     begin
       match !pfstate with
       | PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
          begin
            match claimtm with
            | Ap(Ap(TpAp(TmH(h),a),m),n) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
               begin
		 let currprooffun = !prooffun in
                 prooffun := (fun dl -> match dl with d::dr -> currprooffun (TLam(Ar(a,Ar(a,Prop)),PTmAp(pftmshift 0 1 d,Lam(a,Lam(a,Ap(Ap(DB(2),DB(0)),DB(1))))))::dr) | [] -> raise (Failure "no pf of symmetric eqn"));
                 pfstate := PfStateGoal(Ap(Ap(TpAp(TmH(h),a),n),m),cxtm,cxpf)::pfstr;
               end
            | _ -> raise (Failure("symmetry tactic cannot be used when there is not an equation"))
          end
       | _ -> raise (Failure("symmetry tactic cannot be used when there is no claim"))
     end
  | SpecialTac(x,(a2::al)) when x = "transitivity" ->
     begin
       match !pfstate with
       | PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
          begin
            match claimtm with
            | Ap(Ap(TpAp(TmH(h),a),lhs),rhs) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
		let q = TpAp(TmH(h),a) in
		let rhs2 = tmshift 0 1 rhs in
		let prhs = Ap(DB(0),rhs2) in
		let rleib_imp_sleib =
		  TLam(a,TLam(a,PLam(All(Ar(a,Prop),Imp(Ap(DB(0),DB(1)),Ap(DB(0),DB(2)))),TLam(Ar(a,Ar(a,Prop)),PPfAp(PTmAp(Hyp(0),Lam(a,Imp(Ap(Ap(DB(1),DB(0)),DB(2)),Ap(Ap(DB(1),DB(2)),DB(0))))),PLam(Ap(Ap(DB(0),DB(1)),DB(1)),Hyp(0)))))))
		in
		let pfun = !prooffun in
		let rec transitivity_tac lhs al =
		  match al with
		  | [] ->
		      let pfst2 = PfStateGoal(Ap(Ap(q,lhs),rhs),cxtm,cxpf)::pfstr in
		      let pfun2 dl =
			match dl with
			| d1::dr -> (PPfAp(PTmAp(pfshift 0 1 (pftmshift 0 1 d1),Lam(a,DB(1))),Hyp(0)),dr)
			| _ -> raise (Failure "mssing proof of eqn in transitivity")
		      in
		      (pfun2,pfst2)
		  | a2::ar ->
		      let a2 = ltree_to_atree a2 in
		      let m2 = check_tm a2 a !polytm sigtmof !sigtm !ctxtp cxtm in
		      let (pfun2,pfst2) = transitivity_tac m2 ar in
		      let pfun3 dl =
			match dl with
			  d1::dr ->
			    let (d2,dr2) = pfun2 dr in
			    (PPfAp(PTmAp(pfshift 0 1 (pftmshift 0 1 d1),Lam(a,DB(1))),d2),dr2)
			| _ -> raise (Failure "mssing proof of eqn in transitivity")
		      in
		      let pfst3 = PfStateGoal(Ap(Ap(q,lhs),m2),cxtm,cxpf)::pfst2 in
		      (pfun3,pfst3)
		in
		let (pfun2,pfst2) = transitivity_tac lhs (a2::al) in
		let pfun3 dl =
		  let (d,dr) = pfun2 dl in
		  pfun (PPfAp(PTmAp(PTmAp(rleib_imp_sleib,lhs),rhs),TLam(Ar(a,Prop),PLam(prhs,d)))::dr)
		in
		prooffun := pfun3;
		pfstate := pfst2
	    | _ -> raise (Failure("transitivity tactic cannot be used when there is not an equation"))
	  end
       | _ -> raise (Failure("transitivity tactic cannot be used when there is no claim"))
     end
  | SpecialTac(x,[]) when x = "f_equal" ->
     begin
       match !pfstate with
       | PfStateGoal(claimtm,cxtm,cxpf)::pfstr ->
          begin
            match claimtm with
            | Ap(Ap(TpAp(TmH(h),a),lhs),rhs) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
               let q = TpAp(TmH(h),a) in
	       let rhs2 = tmshift 0 1 rhs in
	       let prhs = Ap(DB(0),rhs2) in
	       let rleib_imp_sleib =
		 TLam(a,TLam(a,PLam(All(Ar(a,Prop),Imp(Ap(DB(0),DB(1)),Ap(DB(0),DB(2)))),TLam(Ar(a,Ar(a,Prop)),PPfAp(PTmAp(Hyp(0),Lam(a,Imp(Ap(Ap(DB(1),DB(0)),DB(2)),Ap(Ap(DB(1),DB(2)),DB(0))))),PLam(Ap(Ap(DB(0),DB(1)),DB(1)),Hyp(0)))))))
	       in
	       let pfun = !prooffun in
               let rec f_equal_intermediates lhs rhs f r =
                 if lhs = rhs then
                   r
                 else
                   match (lhs,rhs) with
                   | (Ap(lf,la),Ap(rf,ra)) ->
                      let la4 = tmshift 0 4 la in
                      if la = ra then
                        f_equal_intermediates lf rf (fun m -> f (Ap(m,la4))) r
                      else
                        let rf4 = tmshift 0 4 rf in
                        f_equal_intermediates lf rf (fun m -> f (Ap(m,la4))) ((la,ra,(fun m -> f (Ap(rf4,m))))::r)
                   | _ -> raise (Failure "f_equal does not apply here")
               in
               let mnl = f_equal_intermediates lhs rhs (fun m -> m) [] in
               let lift_eqn_pf d f =
                 TLam(Ar(a,Ar(a,Prop)),PTmAp(pftmshift 0 1 d,Lam(a,Lam(a,Ap(Ap(DB(2),f (DB(1))),f (DB(0)))))))
               in
	       let rec f_equal_tac lhs mnl =
		 match mnl with
		 | [] ->
		    ((fun dl -> (Hyp(0),dl)),pfstr)
		 | (m,n,f)::mnr ->
		    let (pfun2,pfst2) = f_equal_tac (tmshift 0 (-4) (f (tmshift 0 4 n))) mnr in
		    let pfun3 dl =
		      match dl with
		      | d1::dr ->
			 let (d2,dr2) = pfun2 dr in
                         let d1a = pfshift 0 1 (pftmshift 0 1 d1) in
                         let d1f = lift_eqn_pf d1a f in
			 (PPfAp(PTmAp(d1f,Lam(a,DB(1))),d2),dr2)
		      | _ -> raise (Failure "mssing proof of eqn in f_equal")
		    in
		    let pfst3 = PfStateGoal(Ap(Ap(q,m),n),cxtm,cxpf)::pfst2 in
		    (pfun3,pfst3)
	       in
	       let (pfun2,pfst2) = f_equal_tac lhs mnl in
	       let pfun3 dl =
		 let (d,dr) = pfun2 dl in
		 pfun (PPfAp(PTmAp(PTmAp(rleib_imp_sleib,lhs),rhs),TLam(Ar(a,Prop),PLam(prhs,d)))::dr)
	       in
	       prooffun := pfun3;
	       pfstate := pfst2
	    | _ -> raise (Failure("f_equal tactic cannot be used when there is not an equation"))
	  end
       | _ -> raise (Failure("f_equal tactic cannot be used when there is no claim"))
     end
  | _ ->
      raise (Failure("Unknown proof tactic"))

let rec evaluate_pftac_2 () =
  match !pfstate with
  | PfStateSep(j,false)::pfstr ->
      begin
	match !html with
	| Some hc -> output_pftacitem_html hc (PfStruct(j)) sigtmh sigknh 3
	| None -> ()
      end;
      begin
	match !latex with
	| Some hc -> output_pftacitem_latex hc (PfStruct(j)) sigtmh sigknh 3
	| None -> ()
      end;
      pfstate := pfstr;
      evaluate_pftac_2 ()
  | _ -> ()

let evaluate_pftac pitem thmname i gpgtm gphv pfggphv =
  if !verbosity > 19 then (Printf.printf "pre1 pfstruct %d\nLength of pfstate stack: %d\n" i (List.length !pfstate); print_pfstate (); flush stdout);
  begin
    match !sexprallsubgoals with
    | None -> ()
    | Some(seaspre,seasincl,_) ->
       match !pfstate with
       | PfStateGoal(atm,ctxtm,ctxpf)::_ ->
          let f = open_out (Printf.sprintf "%s_%d_%d.lisp" seaspre !lineno !charno) in
          if not (seasincl = "") then Printf.fprintf f "(INCLUDE \"%s\")\n" seasincl;
          List.iter (fun (y,q) -> Printf.fprintf f "(HYP \"%s\" %s)\n" y (tm_to_sexpr q)) ctxpf;
          List.iter
            (fun (x,(a,od)) ->
              match od with
              | None -> Printf.fprintf f "(VAR \"%s\" %s)\n" x (tp_to_sexpr a)
              | Some(d) -> Printf.fprintf f "(LET \"%s\" %s %s)\n" x (tp_to_sexpr a) (tm_to_sexpr d))
            ctxtm;
          Printf.fprintf f "(GOAL %s)\n" (tm_to_sexpr atm);
          close_out f
       | _ -> ()
  end;
  evaluate_pftac_1 pitem thmname i gpgtm gphv pfggphv;
  begin
    match !html with
    | Some hc ->
(*	if pitem = Qed || pitem = Admitted then
	  begin
	    match !inchan with
	    | Some(c) -> buffer_to_line_char c pftext inchanline inchanchar !lineno !charno
	    | None -> ()
	  end; *)
	output_pftacitem_html hc pitem sigtmh sigknh !laststructaction
    | None -> ()
  end;
  begin
    match !latex with
    | Some hc ->
(*	if pitem = Qed || pitem = Admitted then
	  begin
	    match !inchan with
	    | Some(c) -> buffer_to_line_char c pftext inchanline inchanchar !lineno !charno
	    | None -> ()
	  end; *)
	output_pftacitem_latex hc pitem sigtmh sigknh !laststructaction
    | None -> ()
  end;
  if !verbosity > 19 then (Printf.printf "pre2 pfstruct %d\nLength of pfstate stack: %d\n" i (List.length !pfstate); print_pfstate (); flush stdout);
  evaluate_pftac_2 ()

let init_env () =
  ctxtp := [];
  ctxtm := [];
  ctxpf := [];
  tparclos := (fun a -> a);
  tmallclos := (fun m -> m);
  tmlamclos := (fun m -> m);
  pflamclos := (fun d -> d);
  aptmloc := (fun m cxtp cxtm -> m);
  appfloc := (fun d cxtp cxtm cxpf -> d);
  secstack := [];
  popfn := (fun () -> ())
	
(*** Function for checking if a file solves a problem file in addition to checking the solution file for correctness. ***)
let mgchecksolves probc solnc =
  init_env ();
  let ptl = ref (TokStrRest(Lexer.token,Lexing.from_channel probc)) in
  let stl = ref (TokStrRest(Lexer.token,Lexing.from_channel solnc)) in
  let currentthm = ref "" in
  let inadmitted = ref false in
  let linenop = ref 1 in
  let charnop = ref 0 in
  let linenos = ref 1 in
  let charnos = ref 0 in
  try
    while true do
      match !proving with
      | None ->
	  begin
	    lineno := !linenop;
	    charno := !charnop;
	    let (pditem,ptr) =
	      try
		parse_docitem !ptl
	      with Lexer.Eof ->
		let _ = parse_docitem !stl in
		raise (Failure("Problem file ended prematurely"))
	    in
	    linenop := !lineno;
	    charnop := !charno;
	    lineno := !linenos;
	    charno := !charnos;
	    authors := [];
	    title := None;
	    let (sditem,str) =
	      try
		parse_docitem !stl
	      with Lexer.Eof ->
		raise (Failure("Solution file ended prematurely"))
	    in
	    linenos := !lineno;
	    charnos := !charno;
	    ptl := ptr;
	    stl := str;
	    evaluate_docitem sditem;
	    if pditem <> sditem then
	      raise (Failure("Solution document differs from problem document at line " ^ (string_of_int !linenop) ^ " and char " ^ (string_of_int !charnop) ^ " / line " ^ (string_of_int !linenos) ^ " and char " ^ (string_of_int !charnos)));
	    match sditem with
	    | ThmDecl(_,x,_) -> currentthm := x
	    | _ -> ()
	  end
      | Some (thmname,i,gpgtm,gphv,pfggphv) -> (*** reading a proof in the solution file ***)
	  begin
	    if !inadmitted then
	      begin
		lineno := !linenos;
		charno := !charnos;
		let (spftac,str) =
		  try
		    parse_pftacitem !stl
		  with Lexer.Eof ->
		    raise (Failure("Solution file ended prematurely"))
		in
		stl := str;
		linenos := !lineno;
		charnos := !charno;
		evaluate_pftac spftac thmname i gpgtm gphv pfggphv;
		if spftac = Qed then
		  inadmitted := false
		else if spftac = Admit || spftac = Admitted then
		  raise (Failure("Incomplete proof in solution file"))
	      end
	    else
	      begin
		lineno := !linenop;
		charno := !charnop;
		let (ppftac,ptr) =
		  try
		    parse_pftacitem !ptl
		  with Lexer.Eof ->
		    let _ = parse_pftacitem !stl in
		    raise (Failure("Problem file ended prematurely"))
		in
		linenop := !lineno;
		charnop := !charno;
		lineno := !linenos;
		charno := !charnos;
		let (spftac,str) =
		  try
		    parse_pftacitem !stl
		  with Lexer.Eof ->
		    raise (Failure("Solution file ended prematurely"))
		in
		linenos := !lineno;
		charnos := !charno;
		ptl := ptr;
		stl := str;
		evaluate_pftac spftac thmname i gpgtm gphv pfggphv;
		if spftac = Admit || spftac = Admitted then
		  raise (Failure("Incomplete proof in solution file"));
		if ppftac <> spftac then
		  begin
		    if ppftac = Admitted then
		      begin
			exercises := !currentthm :: !exercises;
			if spftac <> Qed then
			  inadmitted := true
		      end
		    else
		      raise (Failure("Solution document differs from problem document in proof at line " ^ (string_of_int !linenop) ^ " and char " ^ (string_of_int !charnop) ^ " / line " ^ (string_of_int !linenos) ^ " and char " ^ (string_of_int !charnos)))
		  end
	      end
	  end
    done
  with
  | Lexer.Eof ->
      ()
  | ParsingError(x,l1,c1,l2,c2) ->
      if !webout then
	begin
          Printf.printf "AS%d:%d:%d:%d\n"  l1 c1 l2 c2;
	  Printf.printf "<div class='documentfail'>Syntax error between line %d char %d and line %d char %d:<br/>%s</div>" l1 c1 l2 c2 x;
	  exit 1
	end
      else
	begin
	  Printf.printf "Syntax error between line %d char %d and line %d char %d:\n%s\n" l1 c1 l2 c2 x;
	  exit 1
	end
  | Failure(x) ->
      if !webout then
	begin
          Printf.printf "AF%d:%d\n"  !lineno !charno;
	  Printf.printf "<div class='documentfail'>Failure at line %d char %d: %s</div>" !lineno !charno x; flush stdout;
	  exit 1
	end
      else
	begin
	  Printf.printf "Failure at line %d char %d: %s\n" !lineno !charno x; flush stdout;
	  exit 1
	end

let mgcheck_ajax c =
  let tl = ref (TokStrRest(Lexer.token,Lexing.from_channel c)) in
  lineno := 1;
  charno := 0;
  verbosity := 1;
  try
    while true do
      if !verbosity > 59 then (Printf.printf "Main Loop Start\n"; flush stdout);
      match !proving with
      | None ->
	  ignore (parse_docitem !tl); (*** hopefully this raises End_of_file ***)
	  raise (Failure("The content must not continue beyond the proof."))
      | Some (thmname,i,gpgtm,gphv,pfggphv) -> (*** reading a proof ***)
	  let (pitem,tr) = parse_pftacitem !tl in
	  tl := tr;
	  evaluate_pftac pitem thmname i gpgtm gphv pfggphv
    done
  with
  | Lexer.Eof ->
      begin
	match !proving with
	| None -> () (* OK *)
	| Some(thmname,i,gpgtm,gphv,pfggphv) -> (* pretend there is a Qed at the end *)
	    try
	      evaluate_pftac Qed thmname i gpgtm gphv pfggphv
	    with
	    | Failure(x) ->
		Printf.printf "F %d %d$%s" !lineno !charno x
	    | ParsingError(x,l1,c1,l2,c2) ->
		Printf.printf "E %d %d %d %d$%s" l1 c1 l2 c2 x
      end
  | Failure(x) ->
      Printf.printf "F %d %d$%s" !lineno !charno x
  | ParsingError(x,l1,c1,l2,c2) ->
      Printf.printf "E %d %d %d %d$%s" l1 c1 l2 c2 x

(*** Main function for checking a file ***)
let mgcheck c =
  init_env ();
  let tl = ref (TokStrRest(Lexer.token,Lexing.from_channel c)) in
  lineno := 1;
  charno := 0;
  try
    while true do
      if !verbosity > 59 then (Printf.printf "Main Loop Start\n"; flush stdout);
      match !proving with
      | None ->
	  let (ditem,tr) = parse_docitem !tl in
	  tl := tr;
	  evaluate_docitem ditem
      | Some (thmname,i,gpgtm,gphv,pfggphv) -> (*** reading a proof ***)
	  let (pitem,tr) = parse_pftacitem !tl in
	  tl := tr;
	  evaluate_pftac pitem thmname i gpgtm gphv pfggphv
    done
  with
  | Lexer.Eof ->
    begin
      if !ajax then (*** we should be expecting a proof which can be read from the given proof file ***)
	if not !includingsigfile then
	  begin
	    ajaxactive := true;
	    let ca = open_in !ajaxpffile in
	    mgcheck_ajax ca
	  end
      else
	if (!verbosity > 9) then (Printf.printf "done.\n"; flush stdout)
    end
  | ParsingError(x,l1,c1,l2,c2) ->
      if !webout then
	begin
          Printf.printf "AS%d:%d:%d:%d\n"  l1 c1 l2 c2;
	  Printf.printf "<div class='documentfail'>Syntax error between line %d char %d and line %d char %d:<br/>%s</div>" l1 c1 l2 c2 x;
	  exit 1
	end
      else if !ajax then
	begin
	  Printf.printf "f\n"; (*** this indicates a fundamental problem, not a problem with the ajax input ***)
	  exit 1
	end
      else
	begin
	  Printf.printf "Syntax error between line %d char %d and line %d char %d:\n%s\n" l1 c1 l2 c2 x;
	  exit 1
	end
  | Failure(x) ->
      if !webout then
	begin
          Printf.printf "AF%d:%d\n"  !lineno !charno;
	  Printf.printf "<div class='documentfail'>Failure at line %d char %d: %s</div>" !lineno !charno x; flush stdout;
	  exit 1
	end
      else if !ajax then
	begin
	  Printf.printf "f\n"; (*** this indicates a fundamental problem, not a problem with the ajax input ***)
	  exit 1
	end
      else
	begin
	  Printf.printf "Failure at line %d char %d: %s\n" !lineno !charno x; flush stdout;
	  exit 1
	end

let rec sql_docpresentation docsha c i =
  try
    let l = input_line c in
    sql_docpresentation_0 docsha c l i
  with End_of_file -> ()
and sql_docpresentation_0 docsha c l i =
  if String.length l > 0 && l.[0] = '$' then
    begin
      if String.length l > 1 then
	if l.[1] = 'x' then
	  begin
	    Printf.printf "INSERT INTO `docpresentationpart` (`docsha`,`docpresentationpartno`,`docpresentationpartexercise`) VALUES ('%s',%d,'%s');\n" docsha i (String.sub l 2 (String.length l - 2));
	    if not !presentationonly then (Printf.printf "INSERT INTO `docexercise` (`docsha`,`termid`) VALUES ('%s','%s');\n" docsha (String.sub l 2 (String.length l - 2)));
	  end
	else
	  Printf.printf "INSERT INTO `docpresentationpart` (`docsha`,`docpresentationpartno`,`docpresentationparttreasure`) VALUES ('%s',%d,'%s');\n" docsha i (String.sub l 1 (String.length l - 1));
      sql_docpresentation docsha c (i+10)
    end
  else
    begin
      Printf.printf "INSERT INTO `docpresentationpart` (`docsha`,`docpresentationpartno`,`docpresentationparttext`) VALUES ('%s',%d,'" docsha i;
      try
	sql_docpresentation_1 docsha c l (i+10)
      with End_of_file ->
	Printf.printf "');\n";
    end
and sql_docpresentation_1 docsha c l i =
  if String.length l > 0 && l.[0] = '$' then
    begin
      Printf.printf "');\n";
      sql_docpresentation_0 docsha c l i
    end
  else
    begin
      for j = 0 to String.length l - 1 do
	let z = l.[j] in
	if z = '\'' then
	  (output_char stdout z; output_char stdout z)
	else if z = '\\' then
	  (output_char stdout '\\'; output_char stdout '\\')
	else
	  output_char stdout z
      done;
      output_char stdout '\n';
      let l = input_line c in
      sql_docpresentation_1 docsha c l i
    end

let preset_ptm_lam_id (m:ptm) : string =
  let h = ptm_lam_id m sigtmof sigdelta in
(*  Hashtbl.add sigdelta h m; *)
  h

let preset_ptm_all_id (m:ptm) : string =
  let h = ptm_all_id m sigtmof sigdelta in
  Hashtbl.add sigdelta h m;
  h

let preset_hf_index () =
  Hashtbl.add indextms "174b78e53fc239e8c2aab4ab5a996a27e3e5741e88070dad186e05fb13f275e5" (Ar(Ar(Set,Prop),Set));
  Hashtbl.add indextms "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" Prop;
  Hashtbl.add indextms "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" Prop;
  Hashtbl.add indextms "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" (Ar(Prop,Prop));
  Hashtbl.add indextms "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" (Ar(Prop,Ar(Prop,Prop)));
  Hashtbl.add indextms "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" (Ar(Prop,Ar(Prop,Prop)));
  Hashtbl.add indextms "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" (Ar(Prop,Ar(Prop,Prop)));
  Hashtbl.add indextms "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "e7493d5f5a73b6cb40310f6fcb87d02b2965921a25ab96d312adf7eb8157e4b3" (Ar(Set,Prop));
  Hashtbl.add indextms "384d9f66d8806a02ebe28da535de6ad3715d7edbe784c055e3c70df3ad888708" (Ar(Set,Prop));
  Hashtbl.add indextms "bb3da8f6f3861e950e002517b27fe9407103f6d9bfacf8e3d7600f2396cc1059" (Ar(Set,Prop));
  Hashtbl.add indextms "dcde207b36b2fb5f060060582bf079763feaf495d2165b7092e20cd10daf7a99" (Ar(Set,Prop));
  Hashtbl.add indextms "7c09f0cab3d30d5ff3c2ec8c2cff61e158c82ce67d886c8b6a8763990b8a0515" (Ar(Set,Prop));
  Hashtbl.add indextms "c59022da27533d1a9c86144e1d2afd1512d11dfffd04a979887af2e1ee5f6e59" (Ar(Set,Prop));
  Hashtbl.add indextms "c7df083c7cf25a97335c4c9d8dc333551ed272dcab0c9c75bdb57679962006f5" (Ar(Set,Prop));
  Hashtbl.add indextms "06a9db6a163cde1bda5ecbfee9ca49f646ff205577687d3f603d53e0c58aefb5" (Ar(Set,Prop));
  Hashtbl.add indextms "3c3963fd1d3e8a801895ec2bc1bdd6c0d1f64c3f6bee436c56b146112890c357" (Ar(Set,Prop));
  Hashtbl.add indextms "f73cdba5a4e557a8f57fbba8517c0f7593a0b36795e8f51b63ba62b37035c3d0" (Ar(Set,Prop));
  Hashtbl.add indextms "67f7963d11a96caa6d857a801e3a87a49e63de70c1a4d3f1be82810c5ca7eca7" (Ar(Ar(Set,Prop),Prop));
  Hashtbl.add indextms "161886ed663bc514c81ed7fe836cca71861bfe4dfe4e3ede7ef3a48dbc07d247" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "3e5bc5e85f7552688ed0ced52c5cb8a931e179c99646161ada3249216c657566" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "591ebe2d703dc011fd95f000dd1ad77b0dca9230146d2f3ea2cb96d6d1fba074" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "e66ec047c09acdc1e824084ea640c5c9a30ab00242f4c1f80b83c667c930e87e" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "8f39e0d849db8334a6b514454a2aef6235afa9fc2b6ae44712b4bfcd7ac389cc" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "0609dddba15230f51d1686b31544ff39d4854c4d7f71062511cc07689729b68d" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "4a0f686cd7e2f152f8da5616b417a9f7c3b6867397c9abde39031fa0217d2692" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "4267a4cfb6e147a3c1aa1c9539bd651e22817ab41fd8ab5d535fbf437db49145" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "f3818d36710e8c0117c589ed2d631e086f82fbcbf323e45d2b12a4eaddd3dd85" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "5057825a2357ee2306c9491a856bb7fc4f44cf9790262abb72d8cecde03e3df4" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "f3976896fb7038c2dd6ace65ec3cce7244df6bf443bacb131ad83c3b4d8f71fb" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "35f61b92f0d8ab66d988b2e71c90018e65fc9425895b3bae5d40ddd5e59bebc1" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "b90ec130fa720a21f6a1c02e8b258f65af5e099282fe8b3927313db7f25335ed" (Ar(Ar(Set,Ar(Set,Prop)),Prop));
  Hashtbl.add indextms "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" (Ar(Prop,Ar(Set,Ar(Set,Set))));
  Hashtbl.add indextms "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" (Ar(Prop,Ar(Prop,Prop)));
  Hashtbl.add indextms "d2a0e4530f6e4a8ef3d5fadfbb12229fa580c2add302f925c85ede027bb4b175" (Ar(Prop,Ar(Prop,Ar(Prop,Prop))));
  Hashtbl.add indextms "2f8b7f287504f141b0f821928ac62823a377717763a224067702eee02fc1f359" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "f275e97bd8920540d5c9b32de07f69f373d6f93ba6892c9e346254a85620fa17" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" (Ar(Set,Set));
  Hashtbl.add indextms "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" (Ar(Set,Ar(Ar(Set,Set),Set)));
  Hashtbl.add indextms "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" (Ar(Set,Ar(Ar(Set,Prop),Set)));
  Hashtbl.add indextms "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" (Ar(Set,Ar(Ar(Set,Prop),Ar(Ar(Set,Set),Set))));
  Hashtbl.add indextms "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "2ce94583b11dd10923fde2a0e16d5b0b24ef079ca98253fdbce2d78acdd63e6e" (Ar(Set,Ar(Set,Ar(Ar(Set,Set),Prop))));
  Hashtbl.add indextms "9ef333480205115fcb54535d5d8de44756eee80867000051222280db0c9646e4" (Ar(Set,Ar(Set,Ar(Ar(Set,Set),Prop))));
  Hashtbl.add indextms "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "7b717effbbdb47e1c3b6b0b11d8afebd925fdf397e15abe9de1d5ea74224420c" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "ee2e1f36ccc047af9077fcfe6de79d6c9574876b02cae0b4b919e11461760f0d" (Ar(Ar(Set,Ar(Ar(Set,Set),Set)),Ar(Set,Ar(Set,Prop))));
  Hashtbl.add indextms "f97da687c51f5a332ff57562bd465232bc70c9165b0afe0a54e6440fc4962a9f" (Ar(Ar(Set,Ar(Ar(Set,Set),Set)),Ar(Set,Set)));
  Hashtbl.add indextms "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" (Ar(Set,Set));
  Hashtbl.add indextms "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" (Ar(Set,Prop));
  Hashtbl.add indextms "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" (Ar(Set,Ar(Ar(Set,Ar(Set,Set)),Ar(Set,Set))));
  Hashtbl.add indextms "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" (Ar(Set,Prop));
  Hashtbl.add indextms "dc688de6dbfa5c75bd45f1eb198583d07be144f0cdabb44def09da1c0976495b" (Ar(Set,Set));
  Hashtbl.add indextms "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" (Ar(Set,Set));
  Hashtbl.add indextms "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" (Ar(Set,Set));
  Hashtbl.add indextms "d3f7df13cbeb228811efe8a7c7fce2918025a8321cdfe4521523dc066cca9376" (Ar(Set,Set));
  Hashtbl.add indextms "f0267e2cbae501ea3433aecadbe197ba8f39c96e80326cc5981a1630fda29909" (Ar(Set,Ar(Set,Ar(Ar(Set,Set),Ar(Ar(Set,Set),Ar(Set,Set))))));
  Hashtbl.add indextms "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "877ee30615a1a7b24a60726a1cf1bff24d7049b80efb464ad22a6a9c9c4f6738" (Ar(Set,Set));
  Hashtbl.add indextms "dc75c4d622b258b96498f307f3988491e6ba09fbf1db56d36317e5c18aa5cac6" (Ar(Set,Set));
  Hashtbl.add indextms "d744bcd791713cf88021ce34168c3e2d109a8a6c45637d74541d94007e3139ca" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" (Ar(Set,Ar(Ar(Set,Set),Set)));
  Hashtbl.add indextms "ecef5cea93b11859a42b1ea5e8a89184202761217017f3a5cdce1b91d10b34a7" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "dac986a57e8eb6cc7f35dc0ecc031b9ba0403416fabe2dbe130edd287a499231" (Ar(Set,Prop));
  Hashtbl.add indextms "091d1f35158d5ca6063f3c5949e5cbe3d3a06904220214c5781c49406695af84" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" (Ar(Set,Ar(Ar(Set,Set),Set)));
  Hashtbl.add indextms "fcd77a77362d494f90954f299ee3eb7d4273ae93d2d776186c885fc95baa40dc" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "0775ebd23cf37a46c4b7bc450bd56bce8fc0e7a179485eb4384564c09a44b00f" (Ar(Set,Ar(Ar(Set,Set),Ar(Ar(Set,Ar(Set,Prop)),Set))));
  Hashtbl.add indextms "04c0176f465abbde82b7c5c716ac86c00f1b147c306ffc6b691b3a5e8503e295" (Ar(Set,Prop));
  Hashtbl.add indextms "dc7715ab5114510bba61a47bb1b563d5ab4bbc08004208d43961cf61a850b8b5" (Ar(Set,Ar(Ar(Set,Set),Ar(Ar(Set,Ar(Set,Set)),Set))));
  Hashtbl.add indextms "ac96e86902ef72d5c44622f4a1ba3aaf673377d32cc26993c04167cc9f22067f" (Ar(Set,Ar(Ar(Set,Prop),Ar(Ar(Set,Prop),Prop))));
  Hashtbl.add indextms "f36b5131fd375930d531d698d26ac2fc4552d148f386caa7d27dbce902085320" (Ar(Set,Ar(Ar(Set,Prop),Ar(Ar(Set,Prop),Prop))));
  Hashtbl.add indextms "2336eb45d48549dd8a6a128edc17a8761fd9043c180691483bcf16e1acc9f00a" (Ar(Set,Ar(Ar(Set,Prop),Ar(Set,Ar(Ar(Set,Prop),Prop)))));
  Hashtbl.add indextms "f91c31af54bc4bb4f184b6de34d1e557a26e2d1c9f3c78c2b12be5ff6d66df66" (Ar(Set,Ar(Ar(Set,Prop),Ar(Set,Ar(Ar(Set,Prop),Prop)))));
  Hashtbl.add indextms "e59af381b17c6d7665103fc55f99405c91c5565fece1832a6697045a1714a27a" (Ar(Ar(Set,Ar(Ar(Set,Prop),Prop)),Ar(Set,Ar(Ar(Set,Prop),Prop))));
  Hashtbl.add indextms "eb5699f1770673cc0c3bfaa04e50f2b8554934a9cbd6ee4e9510f57bd9e88b67" (Ar(Ar(Set,Ar(Ar(Set,Prop),Prop)),Ar(Set,Ar(Ar(Set,Prop),Prop))));
  Hashtbl.add indextms "1e55e667ef0bb79beeaf1a09548d003a4ce4f951cd8eb679eb1fed9bde85b91c" (Ar(Set,Set));
  Hashtbl.add indextms "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "89e534b3d5ad303c952b3eac3b2b69eb72d95ba1d9552659f81c57725fc03350" (Ar(Set,Ar(Ar(Set,Prop),Set)));
  Hashtbl.add indextms "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" (Ar(Set,Prop));
  Hashtbl.add indextms "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" (Ar(Set,Set));
  Hashtbl.add indextms "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" (Ar(Set,Ar(Set,Ar(Set,Prop))));
  Hashtbl.add indextms "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "c271c80f80f5f72a61f48aa63abcf552ccb5c1c1455890804f46f810f52c1725" (Ar(Set,Ar(Ar(Set,Ar(Set,Set)),Prop)));
  Hashtbl.add indextms "8aee977f39b94de3060d4e641f09019ff1a3f86f5572cb3093ec9aa4a0a4c21b" (Ar(Set,Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Set,Prop))))));
  Hashtbl.add indextms "65c0daed14d78ada9e0321a2b41d12cc9f628aacc67d8a940c28f08abf25f617" (Ar(Set,Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Set,Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Ar(Set,Set))),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Ar(Set,Set))),Ar(Ar(Set,Ar(Set,Ar(Set,Set))),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Prop)))))))))))))));
  Hashtbl.add indextms "c309fccae6f2952d12a16bfffc197737f9a1e290345afcd106428e646f9cbd2e" (Ar(Set,Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Set,Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Ar(Set,Set))),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Ar(Set,Set))),Ar(Ar(Set,Ar(Set,Ar(Set,Set))),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Prop)))))))))))))));
  Hashtbl.add indextms "cbf428d60d780d655f1b7593b16f52a9cbc57bf95a866db8389c330113d406f3" (Ar(Set,Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Set,Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Ar(Set,Set))),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Ar(Set,Set))),Ar(Ar(Set,Ar(Set,Ar(Set,Set))),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Ar(Ar(Set,Ar(Set,Set)),Prop)))))))))))))));
  Hashtbl.add indextms "f152c3f1281bd34cf1c2b19b596c7883b3995533b2fcccc0eaa6048037ebe4d3" (Ar(Set,Prop));
  Hashtbl.add indextms "4bc888f121f3c8defd33607bf8c316d9626aeb31d9d8b49058dc19828f9be72b" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "dff028b00391bf89df7db2deea89f2e8932114cc819135e93697f3555f1f256d" (Ar(Set,Ar(Set,Ar(Set,Prop))));
  Hashtbl.add indexknowns "4d0b1b3ca489073915e8701e021a09da22887f41f83e407df8eafe040825db18" ();
  Hashtbl.add indexknowns "e4b03c310442ae760be9945e176494db51515dfb952ee60fbd42e05527752af0" ();
  Hashtbl.add indexknowns "d8c32d0ac70c5760222c9adf1a3ca90f3cb6b5182b0f70a5d82cb9000abc77ef" ();
  Hashtbl.add indexknowns "5189b0389a1efe35ba744aa1436bb23541e75e8a85658313375e1e0b3321128f" ();
  Hashtbl.add indexknowns "920f955f033a1286fcaba96c8eb55d2079812a3041ff6b812df4cc2636156b59" ();
  Hashtbl.add indexknowns "0b67fbe4188c03468f8cd69c462ea8e5fb2269bf1fd67125a6456853d4ab7c74" ();
  Hashtbl.add indexknowns "b492ab96942311595fd53c93243cb7ab5314986bb8460d580d9382dfab90f7d1" ();
  Hashtbl.add indexknowns "c10976371705fb97042c207e4021721b0543188b170452fb918fb78d30b85c02" ();
  Hashtbl.add indexknowns "de0eaf5d33c0b573d63cc09df92572f243045babd3e3cb9aa49e72d618f6c7c9" ();
  Hashtbl.add indexknowns "73fa935250c44cafb3971bffe3b0cdef8869cd5693da6149f81741261543e04d" ();
  Hashtbl.add indexknowns "d163e2ba8be4862ce0d5ac17697ba5682d8de00436463bf450e9125489dacfc3" ();
  Hashtbl.add indexknowns "0c00a11817788d01d6282959a65fb640cd29eeecb21451696ae86d2c972ea6a1" ();
  Hashtbl.add indexknowns "81edf453007e75af3d93a8839c342755cf567e7e6a5013d8f463cb4140ccad71" ();
  Hashtbl.add indexknowns "6cb883a59e6fddeb39d4eebbe83417eba32939a89eb03700ed2435b07d6f31a5" ();
  Hashtbl.add indexknowns "06e53f495fbacecf847dbc5190516b217f2f92565fe8bfc4615d85e44cc77999" ();
  Hashtbl.add indexknowns "9b82b58da0e4095efc581051714ee0393eb423e395ec31dc00ec6d95c8e77b64" ();
  Hashtbl.add indexknowns "565012fb49695bbe133012328479877f4cead41cd3716f3772f3913917b21c27" ();
  Hashtbl.add indexknowns "8ad26e31e3f38cfdf8779e1d676300e70c868404a4fdeb018dd56527642ecee1" ();
  Hashtbl.add indexknowns "3ad2cd53af6e886067f36cf5d7a6686fb057b11e0af8ccb3ae491fce5213f516" ();
  Hashtbl.add indexknowns "7db945208f1c44134b64f1d6aa93463fa0c8bc5f1e02c9723c1a6c807e17bcc2" ();
  Hashtbl.add indexknowns "1e4e84c130e0882f993ba6d0725e5ce537488f3e04aeede384a09f2d1b06719d" ();
  Hashtbl.add indexknowns "5fded9d5ec7a3d33bfb840dc4a879fc85216375a19e401f04514b20635bf0648" ();
  Hashtbl.add indexknowns "87271e863c44798c3e4de1b8f94789072942588da2226bb4b8ab30dfd7954f42" ();
  Hashtbl.add indexknowns "1a6dfbf6bce4731c157b95653ed76d6f804db2aafca2c0924e438e0da6c4838e" ();
  Hashtbl.add indexknowns "d85840034f85eb9ab4e3d0362277ac520974920f971983d1894a834be2f58be4" ();
  Hashtbl.add indexknowns "bf0e9190cbf189b369083df40a90fa3be75393b0cdc894a6e7624bf15b71eae3" ();
  Hashtbl.add indexknowns "e1493c8264407ce4977f743da708af28f3e1817238c5e6a4df6fe74e4eac3608" ();
  Hashtbl.add indexknowns "cf0ceafc8c7e1c575b546e37d09bd7dc2acbed4fd47e5e5c6367777dce26e23d" ();
  Hashtbl.add indexknowns "02c002c28b5539eb457a8c7fcd1690a4459c1bfec19149160d3068bdebb8ab2d" ();
  Hashtbl.add indexknowns "03ef95824c9d27c385abd2cbf383f74dd9055886882b365893f0308b44a54a6a" ();
  Hashtbl.add indexknowns "b3f7f55079aa75828bfd3546160e7e051546d8bb9c652e454240c24b2953a703" ();
  Hashtbl.add indexknowns "bb7b109b6d194e6019b5ed8f268daa4a5944b43e2861d9c77bc9c90a26a6546f" ();
  Hashtbl.add indexknowns "b5e97e5c479a400f15307f87ad7213febacf085aca1fcffe72dc9b606b43b224" ();
  Hashtbl.add indexknowns "7fdf10edf434392f083f83041d690be73abf737b4349f00e2439155761461a53" ();
  Hashtbl.add indexknowns "255284955fa857314ff4caa3fb1f74c8c002da18d1dcb5dc7e42e903c456d5e9" ();
  Hashtbl.add indexknowns "406886eb8ba2e63fd142e06f6d7776bd0ac252db18f45614976726ccbeada812" ();
  Hashtbl.add indexknowns "03b8444fc49f5ce909b97c84648b4538c4bc9f6968e92a8a9243fc06db320dcf" ();
  Hashtbl.add indexknowns "7ee92353533ddf535d642b2bef129c16c883c14d39afce96770747278152c535" ();
  Hashtbl.add indexknowns "ad12f6917e0ca69c133ca56a02d806067620494392a4e55a3ac777c23bcf2ecb" ();
  Hashtbl.add indexknowns "ecefebac8563a68cbfce793120303743637d5819451daffc181b33f630a438b6" ();
  Hashtbl.add indexknowns "db908632cbf11771ec4744480ece7a038138cfb412c4002ac4861a544f7f9bc6" ();
  Hashtbl.add indexknowns "b6e249245c9d96bc7c87682fa4b263749fd50f89ced60ddba233249143b17ec6" ();
  Hashtbl.add indexknowns "b6fb7dfd3a4e7e4d40d079a52242724a194378edcb1723c9194906bdb983e7de" ();
  Hashtbl.add indexknowns "3c031eb9b813b10c973c2e405a449509495e89954b4927372175bde6a43672bb" ();
  Hashtbl.add indexknowns "0cb1eb090a19596f321d88b63bd310023ff30f1e55f649589c9dc7ad04918219" ();
  Hashtbl.add indexknowns "721e592a599e6ae4f540013ca4dff30ccb24f5a8279aecf7a527d3fdd365713e" ();
  Hashtbl.add indexknowns "1013258a7dd03314edde209dc3ed607693e989cd51567ee2b3770f70512a100c" ();
  Hashtbl.add indexknowns "fe0137795d3e0bb93daba2e7871618d0878ea87235765eda5ccfe10d795c4028" ();
  Hashtbl.add indexknowns "84ce1720f201517b5d7d0a55cf867ad2e1830c370df9f00103f3b8f4ede18442" ();
  Hashtbl.add indexknowns "1d313c5de18d746735e9bfa92b8e6f0bc60d8718fac1e198635080d3d0a330f1" ();
  Hashtbl.add indexknowns "d7d6188fe9d1029409ee6a37626f85d97049d246e0c58ce03256c1ba25c90b59" ();
  Hashtbl.add indexknowns "77e29ee5b23b44e015f7012c4a3d9fbe416b26f56b7d575c1c972d8fb7ae1d8e" ();
  Hashtbl.add indexknowns "80f19f3c9c089aeb52c61db93aac8c5865260969594e036dcae075b48816d85e" ();
  Hashtbl.add indexknowns "70181fda3cd0f3a49f0e332fffc1b82c7f3db1dea2b54ed28b6eea1422b3a0df" ();
  Hashtbl.add indexknowns "84847918a6f1940ec36a1b45fa4b2ae22fbd7db41d15edc80e45d7873aef54ff" ();
  Hashtbl.add indexknowns "6e58b31079ecf8bae23a9c138e685957465c6669ebd5614fe1de151266aca30b" ();
  Hashtbl.add indexknowns "61134abe2d03ac1a882ca1f6cb15a30302faf8a83dda486152c15415b76431eb" ();
  Hashtbl.add indexknowns "c7c71a691305af81552e17d4bddd97e45146ffae2dff038ee57c0e33239e8165" ();
  Hashtbl.add indexknowns "d52ab71745969a7954a3a9dff4f816cfa80f40893dc58cdbf7215538f7db6801" ();
  Hashtbl.add indexknowns "d98b8cabfcd1585ea3aed5e4341aa3efe311c5c234cfa49859f97f7d338267d6" ();
  Hashtbl.add indexknowns "ae80637a1c6842749a6b25cd0fb423826edeb06aa9ab471bcb1786a2417e9383" ();
  Hashtbl.add indexknowns "5d85ec0b61383a7f30ded95d038e36ade33f73733216927e94a6d3a6f29a7297" ();
  Hashtbl.add indexknowns "a548d12e16f10ede54e57981b037b682eafb7989b4b8fa8de01ef56bfa63f472" ();
  Hashtbl.add indexknowns "a548d12e16f10ede54e57981b037b682eafb7989b4b8fa8de01ef56bfa63f472" ();
  Hashtbl.add indexknowns "e21218f4f9fe181cc79122ffa00ecd0a9ab89d5c268eab61884d227cb092804c" ();
  Hashtbl.add indexknowns "8ae304381145ad470bcb5884f94b55179f2d878015514d28fb1fec556d6b9e8b" ();
  Hashtbl.add indexknowns "a662bd9f0cf9e8ac9a23debeebfe19b66bd11f19173953cea8e6470be043b9af" ();
  Hashtbl.add indexknowns "28c7a81eb6ad33b10da0764d900b05a10fd1dd2bcc5ed5e58bf75fa8a89d03b6" ();
  Hashtbl.add indexknowns "1cccbbadd044ffae74c0982aeadf97372aa58997086cc64bc5c256b36b3ea7fa" ();
  Hashtbl.add indexknowns "1263d8ba94ef9d0d6f7f2b39151f12d28d2d8c71ba57de61f6ac8cc6b355f701" ();
  Hashtbl.add indexknowns "4a22d56a44f5a868129999956374ce814c29898709c8dfc5c00040cdecb23ce6" ();
  Hashtbl.add indexknowns "6965cb1b0e7c2d05180bbda0d02badf5449f148f0012a7bb2c9ac88f6f71c940" ();
  Hashtbl.add indexknowns "44c2f2efdcb9da22db222a641a49682addeb32ed8efb2a51bfcd49ebb4ea1a45" ();
  Hashtbl.add indexknowns "5be13590762e2d145538955a6f24bcb3a5ad7c280d517cb99ade95547629db2a" ();
  Hashtbl.add indexknowns "26b135d99afcfe8c2658d9b6d4bd2ef9c7f18c6b3e9778ec8a094e1f7e9efcbc" ();
  Hashtbl.add indexknowns "b14a1577984678c7ad7c87c6bbb9ff2b176b0ad0eb46b57f8a7e05a97ac6640e" ();
  Hashtbl.add indexknowns "4eafc37373118a9f1243cba3928f3c40a9f0ac0526c943d0c7d25224eebc54ff" ();
  Hashtbl.add indexknowns "27ca9823a62a4121fe1658d93efca87de1c55324f15ceee21ab4565256024dc4" ();
  Hashtbl.add indexknowns "218e38705a57200a96de46b70654e61ef9d8b37738f2c493eccbdea77df8016f" ();
  Hashtbl.add indexknowns "c5522fbe8cf04414ffb8b169c05a81601ed8e85835d65624841b68acc0395eeb" ();
  Hashtbl.add indexknowns "a680fe3e891cb25b3b41f7ae2c2e87682b19cbd9b1c7c57edcf11097c7d01f7a" ();
  Hashtbl.add indexknowns "2c345ca37c0de440610409cb7e4a0618cca967ba6399aa197f52c4dddf7a6b1b" ();
  Hashtbl.add indexknowns "579c6bcc2e49082ddbe990366347358544e408099563117cb95fd61b761acb3e" ();
  Hashtbl.add indexknowns "9edbe245b62c3afd467422d8d7d68805a9556871be26d98031aaad0eecdcd728" ();
  Hashtbl.add indexknowns "602ffb18d1bbc5843fe462e731b3f73a5a976ee46e9da6bb6b40d8509a333aa5" ();
  Hashtbl.add indexknowns "659e82bb8ae88e2b04e50f651d5446a3fdf84711bbf57106c58d8bb717cec709" ();
  Hashtbl.add indexknowns "12451cb2963ac437754f119fd700a4c871292257bf373759b7bd92287a0143c3" ();
  Hashtbl.add indexknowns "a185fe1020a787ac3f5fc232b2cdb281c3c8d79b3befbea0c4edf43a97623f29" ();
  Hashtbl.add indexknowns "35ddbe41ccf8d636bb7be09d378ebbeafa96ab247fbb22d61de52fb2ae8f7d2c" ();
  Hashtbl.add indexknowns "ecbeeaf0badaae278dd637ce4637ef85208490fc1eae35c0e79164f3f5b9fdf5" ();
  Hashtbl.add indexknowns "5b5879bfb5f5ab380758f631c5dda71fdd77a20870fc0d9ff94c46e173ce9d04" ();
  Hashtbl.add indexknowns "c5ca53a6adf517d6574675abbb5f9032ef9ad79b9b8714203f092faaa8ba0887" ();
  Hashtbl.add indexknowns "82640bea0f55be344d1e16e89f41f32887a7a47d8ee55bff12f5481d83e942b5" ();
  Hashtbl.add indexknowns "7fca94a5974ea12bc67f55a16f67dbaca0d58af6648a5661c36b0e6c572cd896" ();
  Hashtbl.add indexknowns "f030a2d2c44eabec7a4cc7446328bc1194822bd4441b8a806ebda667f414ca66" ();
  Hashtbl.add indexknowns "d20efd6ecacb0cb3079f2127a08724476d4eabf3507c95ed5457caf478e82dc0" ();
  Hashtbl.add indexknowns "ec74e0e0b43759c2e284f91d3fc896bad3dfb5b25e731877ccefe7c66e001835" ();
  Hashtbl.add indexknowns "89dc652e8e86a81513b682fa88ff665d5c7ce80f8e965051c98997954b367bf9" ();
  Hashtbl.add indexknowns "22071e7ec3d44038501eae7b845bd1fe4144e084a8985f9cc2d5dbdabd2f5592" ();
  Hashtbl.add indexknowns "5d04957e5d383065e03c72e5f6f126c0dfebf4f039551609c1be24d94cf2b447" ();
  Hashtbl.add indexknowns "95d047b09ce188d473c5e7498669c05fbe6529fc7483ec34f11eec9f9eb9a361" ();
  Hashtbl.add indexknowns "89bdea0aa616a43a477ff5a2b8f8d93ffd0e81538b14f1e3acf287a190a89ddd" ();
  Hashtbl.add indexknowns "cbb07c2a4d089aafb664d96f12f4bb4d73181a7d7b6079750a8b1f00ffa3b378" ();
  Hashtbl.add indexknowns "a9f7dddd1e068a3c747980f5d0555f105b6f79bf8350ae9f2a610b1ad88118a6" ();
  Hashtbl.add indexknowns "bf9e3955698cfdd47596df01c71e1cf03ac8e02f35e01b8b2560828b931bf3b6" ();
  Hashtbl.add indexknowns "72fb3b732d20df7b10a7d845367a5d455a600ffaad98f8e89af0d369750d36ee" ();
  Hashtbl.add indexknowns "85ddba6a7609c822f37b453fe65991931570c7b63ba128a986dba37ced7bbcf1" ();
  Hashtbl.add indexknowns "047aee660e1a13eb74426c75dbc197f437b5b8efbb63d3fb3c4fe31dfaa6eb61" ();
  Hashtbl.add indexknowns "822a836127ce60e878d67d66e2b4a46ea0b813f9f55cc8ff810951d073cc1dbc" ();
  Hashtbl.add indexknowns "aa9ee728af378f05d9eb99b00d097d784ce116396b9b970397b723582e0352eb" ();
  Hashtbl.add indexknowns "77dc3318ff617828477b0a91f762ed88177211d91054f972756c52eddaba4efc" ()

let preset_mizar_index () =
  Hashtbl.clear indextms;
  Hashtbl.clear indexknowns;
  (** In is already Prim 1 and Union is already Prim 3 **)
  Hashtbl.add indextms "174b78e53fc239e8c2aab4ab5a996a27e3e5741e88070dad186e05fb13f275e5" (Ar(Ar(Set,Prop),Set));
  Hashtbl.add indextms "73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5" (Ar(Set,Ar(Set,Prop)));
  Hashtbl.add indextms "f55f90f052decfc17a366f12be0ad237becf63db26be5d163bf4594af99f943a" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "844774016d959cff921a3292054b30b52f175032308aa11e418cb73f5fef3d54" (Ar(Set,Set))

let preset_hoas_index () =
  Hashtbl.clear indextms;
  Hashtbl.clear indexknowns;
  Hashtbl.add indextms "d58762d200971dcc7f1850726d9f2328403127deeba124fc3ba2d2d9f7c3cb8c" (Ar(Set,Ar(Set,Set)));
  Hashtbl.add indextms "73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5" (Ar(Ar(Set,Set),Set))

(*** "main" ***)
let _ =
  (*** There are some global names I need before getting started to make the proof tactics work, so they are precomputed here. ***)
  fal := preset_ptm_lam_id (0,All(Prop,DB(0)));
  fale := preset_ptm_all_id (0,Imp(TmH(!fal),All(Prop,DB(0))));
  eqPoly := preset_ptm_lam_id (1,Lam(TpVar(0),Lam(TpVar(0),All(Ar(TpVar(0),Ar(TpVar(0),Prop)),Imp(Ap(Ap(DB(0),DB(2)),DB(1)),Ap(Ap(DB(0),DB(1)),DB(2)))))));
  conj := preset_ptm_lam_id (0,Lam(Prop,Lam(Prop,All(Prop,Imp(Imp(DB(2),Imp(DB(1),DB(0))),DB(0))))));
  disj := preset_ptm_lam_id (0,Lam(Prop,Lam(Prop,All(Prop,Imp(Imp(DB(2),DB(0)),Imp(Imp(DB(1),DB(0)),DB(0)))))));
  expoly := preset_ptm_lam_id (1,Lam(Ar(TpVar(0),Prop),All(Prop,Imp(All(TpVar(0),Imp(Ap(DB(2),DB(0)),DB(1))),DB(0)))));
  expolyI := preset_ptm_all_id (1,All(Ar(TpVar(0),Prop),All(TpVar(0),Imp(Ap(DB(1),DB(0)),Ap(TpAp(TmH(!expoly),TpVar(0)),DB(1))))));
  preset_mizar_index();
  let i = Array.length Sys.argv in
  if i = 1 then
    mgcheck stdin (*** if no arguments are given, read and check from stdin ***)
  else (*** otherwise, assume the last argument is the main file from which to read and check ***)
    begin
      (*** Process command line arguments including reading signature input files ***)
      let j = ref 0 in
      while (!j < i - 2) do
	incr j;
	if Sys.argv.(!j) = "-I" then
	  begin
	    match !latex with
	    | Some(_) -> raise (Failure("-I must come before -latex"))
	    | None -> includingsigfile := true
          end
        else if Sys.argv.(!j) = "-legend" then
          begin
            if !j < i-2 then
	      begin
		incr j;
		let f = open_in (Sys.argv.(!j)) in
                try
                  while true do
                    let l = input_line f in
                    if l = "Term" then
                       let l1 = input_line f in
                       let l2 = input_line f in
                       Hashtbl.add tmh_legend l1 l2
                    else if l = "Known" then
                       let l1 = input_line f in
                       let l2 = input_line f in
                       Hashtbl.add knownh_legend l1 l2
                    else if l = "Prim" then
                       let l1 = input_line f in
                       let l2 = input_line f in
                       Hashtbl.add prim_legend (int_of_string l1) l2
                  done
                with End_of_file -> close_in f
	      end
          end
        else if Sys.argv.(!j) = "-latex" then
          begin
	    if !j < i-2 then
	      begin
		incr j;
		latex := Some(open_out (Sys.argv.(!j)))
	      end
	    else
	      raise (Failure("Expected -latex <filename>"))
          end
        else if Sys.argv.(!j) = "-globalhrefs" then
          globalhrefs := true
        else if Sys.argv.(!j) = "-html" then
          begin
	    if !j < i-2 then
	      begin
		incr j;
                let hc = open_out (Sys.argv.(!j)) in
		html := Some(hc);
                Printf.fprintf hc "<html><head>\n";
                Printf.fprintf hc "<style>\n";
                Printf.fprintf hc ".paramdecl {\n";
                Printf.fprintf hc " margin-top: 3px;\n";
                Printf.fprintf hc " margin-bottom: 3px;\n";
                Printf.fprintf hc "}\n";
                Printf.fprintf hc ".defdecl {\n";
                Printf.fprintf hc " margin-top: 3px;\n";
                Printf.fprintf hc " margin-bottom: 3px;\n";
                Printf.fprintf hc "}\n";
                Printf.fprintf hc ".axdecl {\n";
                Printf.fprintf hc " margin-top: 3px;\n";
                Printf.fprintf hc " margin-bottom: 3px;\n";
                Printf.fprintf hc "}\n";
                Printf.fprintf hc ".thmdecl {\n";
                Printf.fprintf hc " margin-top: 3px;\n";
                Printf.fprintf hc " margin-bottom: 3px;\n";
                Printf.fprintf hc "}\n";
                Printf.fprintf hc ".proof {\n";
                Printf.fprintf hc " border-style: solid;\n";
                Printf.fprintf hc " border-width: 2px;\n";
                Printf.fprintf hc " padding: 1px;\n";
                Printf.fprintf hc " margin: 1px;\n";
                Printf.fprintf hc "}\n";
                Printf.fprintf hc ".section {\n";
                Printf.fprintf hc " border-style: solid;\n";
                Printf.fprintf hc " border-width: 2px;\n";
                Printf.fprintf hc " padding: 1px;\n";
                Printf.fprintf hc " margin: 1px;\n";
                Printf.fprintf hc "}\n";
                Printf.fprintf hc ".sectionbegin {\n";
                Printf.fprintf hc " text-align: center;\n";
                Printf.fprintf hc " text-decoration: underline;\n";
                Printf.fprintf hc "}\n";
                Printf.fprintf hc ".sectionend {\n";
                Printf.fprintf hc " text-align: center;\n";
                Printf.fprintf hc " text-decoration: underline;\n";
                Printf.fprintf hc "}\n";
                Printf.fprintf hc "</style>\n";
                Printf.fprintf hc "</head><body>\n";
	      end
	    else
	      raise (Failure("Expected -html <filename>"))
          end
        else if Sys.argv.(!j) = "-eagerdeltas" then
          eagerdeltas := true
        else if Sys.argv.(!j) = "-nodoublecheck" then
          doublecheckpf := false
        else if Sys.argv.(!j) = "-fof" then
          begin
	    if !j < i-2 then
	      begin
		incr j;
                fof := Some(Sys.argv.(!j))
	      end
	    else
	      raise (Failure("Expected -fof <fileprefix>"))
          end
        else if Sys.argv.(!j) = "-th0" then
          begin
	    if !j < i-2 then
	      begin
		incr j;
                th0 := Some(Sys.argv.(!j))
	      end
	    else
	      raise (Failure("Expected -th0 <fileprefix>"))
          end
        else if Sys.argv.(!j) = "-th0allsubgoals" then
          begin
	    if !j < i-2 then
	      begin
		incr j;
                th0 := Some(Sys.argv.(!j));
                th0allsubgoals := true;
	      end
	    else
	      raise (Failure("Expected -th0allsubgoals <fileprefix>"))
          end
        else if Sys.argv.(!j) = "-reportbushydeps" then
          begin
	    if !j < i-2 then
	      begin
		incr j;
                reportbushydeps := Some(open_out (Sys.argv.(!j)));
	      end
	    else
	      raise (Failure("Expected -reportbushydeps <file>"))
          end
        else if Sys.argv.(!j) = "-usebushydeps" then
          begin
	    if !j < i-2 then
	      begin
		incr j;
                bushy := true;
                let ch = open_in Sys.argv.(!j) in
                try
                  while true do
                    let l = input_line ch in
                    if l.[0] = 'K' then
                      Hashtbl.add bushykdeps (String.sub l 2 (String.length l - 2)) ()
                    else if l.[0] = 'H' then
                      Hashtbl.add bushyhdeps (int_of_string (String.sub l 2 (String.length l - 2))) ()
                  done
                with End_of_file -> close_in ch
	      end
	    else
	      raise (Failure("Expected -usebushydeps <file>"))
          end
        else if Sys.argv.(!j) = "-th0ps1" then
          begin
	    if !j < i-2 then
	      begin
		incr j;
                th0ps1 := true;
                th0 := Some(Sys.argv.(!j))
	      end
	    else
	      raise (Failure("Expected -th0ps1 <fileprefix>"))
          end
        else if Sys.argv.(!j) = "-sexprallsubgoals" then
          begin
	    if !j < i-2 then
	      begin
		incr j;
                sexprallsubgoals := Some(Sys.argv.(!j),"",0)
	      end
	    else
	      raise (Failure("Expected -sexprallsubgoals <fileprefix>"))
          end
	else if Sys.argv.(!j) = "-s" then
	  begin
	    includingsigfile := false;
	    if !j < i-2 then
	      begin
		incr j;
		match !sigoutfile with
		| Some _ -> raise (Failure("Cannot use -s twice"))
		| None -> sigoutfile := Some (open_out (Sys.argv.(!j)))
	      end
	    else
	      raise (Failure("Expected -s <outsigfilename>"))
	  end
        else if Sys.argv.(!j) = "-normalizepf" then
          normalizepf := true
        else if Sys.argv.(!j) = "-optimizepf1" then
          optimizepf1 := true
        else if Sys.argv.(!j) = "-optimizepf2" then
          begin
            optimizepf2 := true;
            if !j < i-3 then
              begin
                incr j;
                optimizepf2tc := int_of_string (Sys.argv.(!j));
                incr j;
                optimizepf2pc := int_of_string (Sys.argv.(!j));
              end
            else
              raise (Failure("Expected -optimizepf2 <int> <int>"))
          end
        else if Sys.argv.(!j) = "-hf" then
          begin
            pfgtheory := HF;
            preset_hf_index();
          end
        else if Sys.argv.(!j) = "-mizar" then
          begin
            pfgtheory := Mizar;
            preset_mizar_index();
          end
        else if Sys.argv.(!j) = "-hoas" then
          begin
            pfgtheory := HOAS;
            preset_hoas_index();
          end
	else if Sys.argv.(!j) = "-pfg" then
	  begin
	    pfgout := true;
	  end
	else if Sys.argv.(!j) = "-indout" then
	  begin
	    includingsigfile := false;
	    if !j < i-2 then
	      begin
		incr j;
		match !indoutfile with
		| Some _ -> raise (Failure("Cannot use -indout twice"))
		| None -> indoutfile := Some (Sys.argv.(!j))
	      end
	    else
	      raise (Failure("Expected -indout <indoutfilename>"))
	  end
	else if Sys.argv.(!j) = "-ind" then
	  begin
	    includingsigfile := false;
	    if !j < i-2 then
	      begin
		incr j;
		let c = open_in (Sys.argv.(!j)) in
		read_indexfile c;
		close_in c;
	      end
	    else
	      raise (Failure("Expected -ind <indexfilename>"))
	  end
	else if Sys.argv.(!j) = "-ownedout" then
	  begin
	    includingsigfile := false;
	    if !j < i-2 then
	      begin
		incr j;
		match !ownedoutfile with
		| Some _ -> raise (Failure("Cannot use -ownedout twice"))
		| None -> ownedoutfile := Some (Sys.argv.(!j))
	      end
	    else
	      raise (Failure("Expected -ownedout <ownedoutfilename>"))
	  end
	else if Sys.argv.(!j) = "-owned" then
	  begin
	    includingsigfile := false;
	    if !j < i-2 then
	      begin
		incr j;
		let c = open_in (Sys.argv.(!j)) in
		read_ownedfile c;
		close_in c;
	      end
	    else
	      raise (Failure("Expected -owned <ownedfilename>"))
	  end
	else if Sys.argv.(!j) = "-solves" then
	  begin
	    includingsigfile := false;
	    if !j < i-2 then
	      begin
		incr j;
		solvesproblemfile := Some (Sys.argv.(!j))
	      end
	    else
	      raise (Failure("Expected -solves <indexfilename>"))
	  end
	else if Sys.argv.(!j) = "-reportpfcomplexity" then
	  begin
	    includingsigfile := false;
	    reportpfcomplexity := true
	  end
	else if Sys.argv.(!j) = "-reporteachitem" then
	  begin
	    includingsigfile := false;
	    reporteachitem := true
	  end
	else if Sys.argv.(!j) = "-webout" then
	  begin
	    includingsigfile := false;
	    webout := true;
	  end
	else if Sys.argv.(!j) = "-ajax" then
	  begin
	    includingsigfile := false;
	    if !j < i-2 then
	      begin
		ajax := true;
		incr j;
		ajaxpffile := Sys.argv.(!j);
		verbosity := 0;
	      end
	    else
	      raise (Failure("Expected -ajax <pffile>"))
	  end
	else if Sys.argv.(!j) = "-sqltermout" then (*** this should only be used when -sqlout is already being used ***)
	  begin
	    includingsigfile := false;
	    sqltermout := true;
	  end
	else if Sys.argv.(!j) = "-presentationonly" then
	  begin
	    includingsigfile := false;
	    presentationonly := true;
	  end
	else if Sys.argv.(!j) = "-thmsasexercises" then
	  begin
	    verbosity := 0;
	    includingsigfile := false;
	    thmsasexercises := true;
	  end
	else if Sys.argv.(!j) = "-masl" then
	  begin
	    if !j < i-2 then
	      begin
		incr j;
		megaautosaltlimit := int_of_string (Sys.argv.(!j))
	      end
	    else
	      raise (Failure("Expected -masl <int>"))
	  end
	else if Sys.argv.(!j) = "-v" then
	  begin
	    if !j < i-2 then
	      begin
		incr j;
		verbosity := int_of_string (Sys.argv.(!j))
	      end
	    else
	      raise (Failure("Expected -v <verbositynumber>"))
	  end
	else if !includingsigfile then
	  let c = open_in (Sys.argv.(!j)) in
          begin
            match !sexprallsubgoals with
            | None -> mgcheck c
            | Some(seaspre,seasincl,i) ->
               let fn = Printf.sprintf "%s_incl_%d.lisp" seaspre i in
               let f = open_out fn in
               if not (seasincl = "") then Printf.fprintf f "(INCLUDE \"%s\")\n" seasincl;
               sexprallsubgoals_inclfile := Some(f);
               mgcheck c;
               close_out f;
               sexprallsubgoals := Some(seaspre,fn,i+1)
          end;
	  title := None;
	  authors := [];
	  includedsigfiles := Sys.argv.(!j)::!includedsigfiles
	else
	  raise (Failure("Cannot understand command line argument " ^ (Sys.argv.(!j))))
      done;
      includingsigfile := false;
      let checkfile () =
	let c = open_in (Sys.argv.(i-1)) in
        begin
          match !sexprallsubgoals with
          | None -> mgcheck c
          | Some(seaspre,seasincl,i) ->
             let fn = Printf.sprintf "%s_incl_%d.lisp" seaspre i in
             let f = open_out fn in
             if not (seasincl = "") then Printf.fprintf f "(INCLUDE \"%s\")\n" seasincl;
             sexprallsubgoals_inclfile := Some(f);
             mgcheck c;
             close_out f
        end;
	close_in c;
        if !pfgout then
          begin
            begin
              match !pfgtheory with
              | HF -> Printf.printf "Document 6ffc9680fbe00a58d70cdeb319f11205ed998131ce51bb96f16c7904faf74a3d\nBase set\n"
              | Egal -> Printf.printf "Document 29c988c5e6c620410ef4e61bcfcbe4213c77013974af40759d8b732c07d61967\nBase set\n"
              | Mizar -> Printf.printf "Document 5ab3df7b0b4ef20889de0517a318df8746940971ad9b2021e54c820eb9e74dce\nBase set\n"
              | HOAS -> Printf.printf "Document 513140056e2032628f48d11e221efe29892e9a03a661d3b691793524a5176ede\nBase syn\n"
            end;
            List.iter
              (fun i ->
                match i with
                | PfgParam(xhv,x,agtp) ->
                   if not (pfg_prim_id_p xhv) then
                     begin
                       try
                         let pfghv = Hashtbl.find pfgtmhh xhv in
                         Printf.printf "Param %s %s : %s\n" (Hash.hashval_hexstring pfghv) x (tp_pfg_str agtp);
                         Hashtbl.add pfgtmh xhv x
                       with Not_found ->
                         Printf.printf "%% ERROR: No pfg id for %s [%s] obj\n" x xhv
                     end
                | PfgDef(xhv,x,a,m) ->
                   begin
                     tm_pfg_decl pfgdelta pfgtmph m;
                     Printf.printf "Def %s : %s\n := %s\n" x (tp_pfg_str a) (tm_pfg_str m);
                     Hashtbl.add pfgtmh xhv x
                   end
                | PfgKnown(xhv,x,p) ->
                   begin
                     tm_pfg_decl pfgdelta pfgtmph p;
                     Printf.printf "Known %s : %s\n" x (tm_pfg_str p);
	             Hashtbl.add pfgknh xhv x;
                     Hashtbl.add pfgknph xhv p;
                   end
                | PfgConj(xhv,x,p) ->
                   begin
                     tm_pfg_decl pfgdelta pfgtmph p;
                     Printf.printf "Conj %s : %s\n" x (tm_pfg_str p);
	             Hashtbl.add pfgknh xhv x;
                   end
                | PfgThm(xhv,x,p,d) ->
                   begin
                     tm_pfg_decl pfgdelta pfgtmph p;
                     pf_pfg_decl pfgdelta pfgtmph pfgknph d;
                     let d1 = if !optimizepf1 then optimize_pf_1 d else d in
                     let d2 = if !optimizepf2 then optimize_pf_2 sigdelta sigtmof d1 !optimizepf2tc !optimizepf2pc else d1 in
                     Printf.printf "Thm %s : %s\n := %s\n" x (tm_pfg_str p) (pf_pfg_str d2);
	             Hashtbl.add pfgknh xhv x;
                     Hashtbl.add pfgknph xhv p;
                   end)
              (List.rev !pfgmain)
          end;
	begin
	  match !sigoutfile with
	  | Some(soc) -> close_out soc
	  | None -> ()
	end;
	begin
	  match !inchan with
	  | Some(c) -> close_in c
	  | None -> ()
	end;
      in
      begin
	match !solvesproblemfile with
	| None -> checkfile ()
	| Some probf ->
	    let p = open_in probf in
	    let c = open_in (Sys.argv.(i-1)) in
	    mgchecksolves p c;
	    close_in c;
	    close_in p;
	    if !verbosity > 1 then (Printf.printf "%s completely solves %s\n" Sys.argv.(i-1) probf; flush stdout);
      end
    end;
  begin
    match !reportbushydeps with
    | Some(ch) -> close_out ch
    | None -> ()
  end;
  begin
    match !html with
    | Some hc ->
       Printf.fprintf hc "</body></html>\n";
       close_out hc
    | None -> ()
  end;
  begin
    match !latex with
    | Some hc ->
	close_out hc
    | None -> ()
  end;
  if !webout then
    begin
      Printf.printf "<div class='documentcorrect'>The document in its current form is correct.</div>\n";
    end;
  begin
    match !ownedoutfile with
    | Some(f) ->
       let c = open_out f in
       Hashtbl.iter (fun h _ -> Printf.fprintf c "Obj fake fake %s\n" (Hash.hashval_hexstring h)) ownedobj;
       Hashtbl.iter (fun h _ -> Printf.fprintf c "Prop fake fake %s\n" (Hash.hashval_hexstring h)) ownedprop;
       close_out c
    | None ->
       ()
  end;
  if (!reportids) then
    begin
      match !indoutfile with
      | Some(f) ->
	  let c = open_out f in
	  Hashtbl.iter (fun h a -> Printf.fprintf c "\"%s\" %s.\n" h (tp_to_str a)) indextms;
	  Hashtbl.iter (fun x _ -> Printf.fprintf c "Known \"%s\".\n" x) indexknowns;
	  close_out c
      | None ->
	  ()
    end
;;
