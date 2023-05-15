(* Copyright (c) 2021-2022 CIIRC (Czech Institute of Informatics, Robotics and Cybernetics) / CTU (Czech Technical University) *)

open Syntax
open Parser
open Sha256
open Hash

(*** The hash ids for the following will be added as we bootstrap, allowing us to make sense of more term syntax as we go. ***)
let debug = false;;
let fal : string ref = ref "";;
let fale : string ref = ref "";;
let eqPoly : string ref = ref "";;
let eqsymPoly : string ref = ref "";;
let eqsymPolyknown : bool ref = ref false;;
let eqSet : string ref = ref "";;
let conj : string ref = ref "";;
let disj : string ref = ref "";;
let expoly : string ref = ref "";;
let expolyI : string ref = ref "";;
let expolyIknown : bool ref = ref false;;
let setIn : string option ref = ref None;;
let setSubeq : string option ref = ref None;;
let setPow : string option ref = ref None;;
let setimplop : string option ref = ref None;;
let setlam : string option ref = ref None;;
let setlambda : string option ref = ref None;;
let setap : string option ref = ref None;;
let setPi : string option ref = ref None;;
let setexp : string option ref = ref None;;
let setprod : string option ref = ref None;;
let setsum : string option ref = ref None;;
let set0 : string option ref = ref None;;
let setordsucc : string option ref = ref None;;
let set1 : string option ref = ref None;;
let set2 : string option ref = ref None;;
let replop : string option ref = ref None;;
let sepop : string option ref = ref None;;
let replsepop : string option ref = ref None;;

let setenuml : string option list ref = ref [];;
let setenumadj : string option ref = ref None;;

let seqcons : string option ref = ref None;;

let rec set_setenuml_r i h sel =
  if i > 0 then
    begin
      match sel with
      | [] -> None::set_setenuml_r (i-1) h []
      | (z::ser) -> z::set_setenuml_r (i-1) h ser
    end
  else
    begin
      match sel with
      | [] -> [Some h]
      | (_::ser) -> Some h::ser
    end

let set_setenuml_n i h =
  setenuml := set_setenuml_r i h !setenuml

let nat0 : string option ref = ref None
let natS : string option ref = ref None

(*** Hash id for polymorphic if operator: ***)
let ifop : string option ref = ref None
(*** Hash id for monomorphic if operator: ***)
let ifopset : string option ref = ref None

let known_In_0_2 : string option ref = ref None
let known_In_1_2 : string option ref = ref None
let known_tuple0_setsum : string option ref = ref None
let known_tuple1_setsum : string option ref = ref None
let known_tupleI0 : string option ref = ref None
let known_tupleI1 : string option ref = ref None
let known_tuple_2_Sigma : string option ref = ref None
let known_tuple_2_setprod : string option ref = ref None
let known_tuple_2_eta : string option ref = ref None
let known_tuple_2_0_eq : string option ref = ref None
let known_tuple_2_1_eq : string option ref = ref None
let known_ap0_Sigma : string option ref = ref None
let known_ap1_Sigma : string option ref = ref None
let known_tuple_Sigma_eta : string option ref = ref None
let known_lam_ext : string option ref = ref None
let known_lam_Pi : string option ref = ref None
let known_ap_Pi : string option ref = ref None
let known_beta : string option ref = ref None
let known_Pi_cod_ext : string option ref = ref None
let known_Pi_ext : string option ref = ref None
let known_Pi_eta : string option ref = ref None
let known_tupleE_impred : string option ref = ref None

let eq_ : tp -> tm -> tm -> tm = fun a lhs rhs -> Ap(Ap(TpAp(TmH("5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a"),a),lhs),rhs);;
let pf_eq_ref : tp -> pf = fun a -> TLam(a,TLam(Ar(a,Ar(a,Prop)),PLam(Ap(Ap(DB(0),DB(1)),DB(1)),Hyp(0))));;
let pf_eqset_ref : pf = pf_eq_ref Set;;
let pf_eq_sym : tp -> pf = fun a -> TLam(a,TLam(a,PLam(eq_ a (DB(1)) (DB(0)),TLam(Ar(a,Ar(a,Prop)),PTmAp(Hyp(0),Lam(Set,Lam(Set,Ap(Ap(DB(2),DB(0)),DB(1)))))))));;
let pf_eqset_sym : pf = pf_eq_sym Set;;
let pf_eq_tra : tp -> pf = fun a -> TLam(a,TLam(a,TLam(a,PLam(eq_ a (DB(2)) (DB(1)),PLam(eq_ a (DB(1)) (DB(0)),PPfAp(PTmAp(Hyp(0),Lam(a,Lam(a,eq_ a (DB(4)) (DB(1))))),Hyp(1)))))));;
let pf_eqset_tra : pf = pf_eq_tra Set;;

let megacontra : string option ref = ref None;;

let megaautosaltlimit = ref 65536;;
exception SearchLimit
exception SearchBacktrack

let mvarcnt : int ref = ref 0
let searchlim : int ref = ref 1000
let megasgof : (string,ptp) Hashtbl.t ref = ref (Hashtbl.create 10)
let megasgdelta : (string,ptm) Hashtbl.t ref = ref (Hashtbl.create 10)

let rec local_hyp hyps g i =
  match hyps with
  | p::hypsr ->
     if conv p g !megasgdelta [] = None then
       local_hyp hypsr g (i+1)
     else
       i
  | [] -> raise Not_found

let rec tp_returns_p b a =
  if b = a then
    true
  else
    match b with
    | Ar(_,b2) -> tp_returns_p b2 a
    | _ -> false

let rec basic_megaauto lm salt cx hyps g =
  if debug then (Printf.printf "basic_megaauto %d %d %s %d %d |- %s\n" !searchlim lm (hashval_hexstring salt) (List.length cx) (List.length hyps) (tm_to_str g); flush stdout);
  if lm <= 0 || !searchlim <= 0 then raise SearchLimit;
  decr searchlim;
  try
    let i = local_hyp hyps g 0 in
    Hyp(i)
  with
  | Not_found ->
     let salt2 = hashtag salt 23l in
     let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
     match g with
     | Imp(p,g1) ->
        if s0 < 1610612734l then (** 7/8 of the time introduce implication **)
          let d = basic_megaauto (lm-1) salt2 cx (p::hyps) g1 in
          PLam(p,d)
        else if s1 < 1610612734l then (** 7/8 the remaining time try to apply something to prove the goal **)
          basic_megaauto_apply (lm-1) salt2 cx hyps g 0 hyps
        else (** reduce the goal to proving False **)
          let d = basic_megaauto (lm-1) salt2 cx hyps (All(Prop,DB(0))) in
          PTmAp(d,g)
     | All(Prop,DB(0)) -> (** False, just try to apply something **)
        basic_megaauto_apply (lm-1) salt2 cx hyps g 0 hyps
     | All(a,Imp(p1,g1)) when p1 = g1 -> (** covers True and refl of eq **)
        TLam(a,PLam(p1,Hyp(0)))
     | All(a,g1) ->
        if s0 < 1610612734l then (** 7/8 of the time introduce forall **)
          let d = basic_megaauto (lm-1) salt2 (a::cx) (List.map (tmshift 0 1) hyps) g1 in
          TLam(a,d)
        else if s1 < 1610612734l then (** 7/8 the remaining time try to apply something to prove the goal **)
          basic_megaauto_apply (lm-1) salt2 cx hyps g 0 hyps
        else (** reduce the goal to proving False **)
          let d = basic_megaauto (lm-1) salt2 cx hyps (All(Prop,DB(0))) in
          PTmAp(d,g)
     | _ ->
        basic_megaauto_apply (lm-1) salt2 cx hyps g 0 hyps
and basic_megaauto_apply lm salt cx hyps g i hl =
  if debug then (Printf.printf "basic_megaauto_apply %d %d %s %d %d |- %s ; %d\n" !searchlim lm (hashval_hexstring salt) (List.length cx) (List.length hyps) (tm_to_str g) i; flush stdout);
  match hl with
  | p::hr ->
     begin
       let salt2 = hashtag salt 23l in
       let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
       if s0 < 0l then (** 1/2 of the time skip the hyp without trying it **)
         basic_megaauto_apply lm salt2 cx hyps g (i+1) hr
       else
         try
           basic_megaauto_apply_1 lm salt2 cx hyps g (tm_to_mtm p) (fun theta -> []) (fun theta dl -> Hyp(i)) [] (fun i -> raise Not_found)
         with SearchBacktrack ->
           basic_megaauto_apply lm salt2 cx hyps g (i+1) hr
     end
  | [] ->
     raise SearchBacktrack
and basic_megaauto_apply_1 lm salt cx hyps g p subgoals d xl theta =
  if debug then (Printf.printf "basic_megaauto_apply_1 %d %d %s %d %d |- %s ; %s\n" !searchlim lm (hashval_hexstring salt) (List.length cx) (List.length hyps) (tm_to_str g) (mtm_to_str p); flush stdout);
  try
    if debug then (Printf.printf "trying to match\n"; flush stdout);
    let theta = ref (pattern_match !megasgdelta p g theta) in
    if debug then (Printf.printf "matched\n"; flush stdout);
    (** try to ground theta if it isn't **)
    List.iter
      (fun (xi,a) ->
        try
          ignore (!theta xi)
        with
          Not_found ->
          let m = basic_megaauto_tm lm salt cx a in
          let mm = tm_to_mtm m in
          let thetaold = !theta in
          theta := (fun i -> if i = xi then mm else mtm_msub (fun i -> if i = xi then mm else raise Not_found) (thetaold xi)))
      xl;
    let gl = subgoals !theta in
    let i2 = ref 0l in
    let dl = List.map (fun g -> i2 := Int32.add !i2 1l; basic_megaauto lm (hashtag salt !i2) cx hyps g) gl in
    d !theta dl
  with
  | Not_found -> raise SearchBacktrack
  | MatchFail ->
     begin
       if debug then (Printf.printf "match failed\n"; flush stdout);
       match p with
       | MAll(a,p1) ->
          let sigma = ref [] in
          for j = List.length cx - 1 downto 0 do
            sigma := MDB(j)::!sigma
          done;
          incr mvarcnt;
          let xi = !mvarcnt in
          let x = MVar(xi,!sigma) in
          let dnew = (fun theta dl -> PTmAp(d theta dl,mtm_to_tm (theta xi))) in
          basic_megaauto_apply_1 lm salt cx hyps g (mtm_ssub (x::!sigma) p1) subgoals dnew ((xi,a)::xl) theta
       | MImp(g1,p1) ->
          let subgoalsnew = (fun theta -> mtm_to_tm (mtm_msub theta g1)::subgoals theta) in
          let dnew =
            (fun theta dl ->
              match dl with
              | d1::dr -> PPfAp(d theta dr,d1)
              | _ -> raise Not_found)
          in
          basic_megaauto_apply_1 lm salt cx hyps g p1 subgoalsnew dnew xl theta
       | _ -> raise SearchBacktrack
     end
and basic_megaauto_tm lm salt cx a =
  if lm <= 0 || !searchlim <= 0 then raise SearchLimit;
  decr searchlim;
  match a with
  | Ar(a1,a2) ->
     begin
       let (s0,s1,s2,s3,s4,s5,s6,s7) = salt in
       if s7 < 0l then
         let m = basic_megaauto_tm lm (hashtag salt 23l) (a1::cx) a2 in
         Lam(a1,m)
       else
         basic_megaauto_var lm salt cx a 0 cx
     end
  | Prop ->
     let (s0,s1,s2,s3,s4,s5,s6,s7) = salt in
     if s7 < 0l then
       if s6 < 0l then
         All(Prop,DB(0))
       else
         All(Prop,Imp(DB(0),DB(0)))
     else
       basic_megaauto_apvar lm salt cx a 0 cx
  | Set -> basic_megaauto_apvar lm salt cx a 0 cx
  | _ -> raise SearchBacktrack
and basic_megaauto_apvar lm salt cx a i bl =
  match bl with
  | b::br when tp_returns_p b a ->
     let salt2 = hashtag salt 23l in
     let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
     if s7 < 0l then
       begin
         try
           basic_megaauto_spine (lm-1) salt2 cx a b (DB(i))
         with SearchBacktrack ->
           basic_megaauto_apvar lm salt cx a (i+1) br
       end
     else
       basic_megaauto_apvar lm salt cx a (i+1) br
  | _::br -> basic_megaauto_apvar lm salt cx a (i+1) br
  | [] -> raise SearchBacktrack
and basic_megaauto_var lm salt cx a i bl =
  match bl with
  | b::br when a = b ->
     let salt2 = hashtag salt 23l in
     let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
     if s7 < 0l then
       DB(i)
     else
       basic_megaauto_var lm salt cx a (i+1) br
  | _::br -> basic_megaauto_var lm salt cx a (i+1) br
  | [] -> raise SearchBacktrack
and basic_megaauto_spine lm salt cx a b m =
  if lm <= 0 || !searchlim <= 0 then raise SearchLimit;
  decr searchlim;
  if a = b then
    m
  else
    match b with
    | Ar(b1,b2) ->
       let m1 = basic_megaauto_tm (lm-1) salt cx b1 in
       basic_megaauto_spine lm salt cx a b2 (Ap(m,m1))
    | _ -> raise SearchBacktrack

let rec basic_megaauto_search masl salt cx hyps g =
  if masl <= 0 then (Printf.printf "Line %d Char %d: Failed to find salt\n" !lineno !charno; flush stdout; raise SearchLimit);
  try
    mvarcnt := 0; searchlim := 1000;
    if debug then Printf.printf "Trying salt %s\n" (md256_hexstring salt); flush stdout;
    let d = basic_megaauto 50 salt cx hyps g in
    let h = md256_hexstring salt in
    let n = ref 63 in
    while (!n >= 0 && h.[!n] = '0') do
      decr n
    done;
    Printf.printf "Line %d Char %d: Use ?%s?\n" !lineno !charno (String.sub h 0 (!n+1)); flush stdout;
    d
  with
  | SearchLimit -> basic_megaauto_search_nxt (masl-1) salt cx hyps g
  | SearchBacktrack -> basic_megaauto_search_nxt (masl-1) salt cx hyps g
and basic_megaauto_search_nxt masl salt cx hyps g =
  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt in
  if (s1,s2,s3,s4,s5,s6,s7) = (0l,0l,0l,0l,0l,0l,0l) then
    let s0r = Hashaux.int32_rev s0 in
    if s0r = -1l then
      basic_megaauto_search masl (0l,1l,0l,0l,0l,0l,0l,0l) cx hyps g
    else
      basic_megaauto_search masl (Hashaux.int32_rev (Int32.add s0r 1l),0l,0l,0l,0l,0l,0l,0l) cx hyps g
  else
    if s0 = -1l then
      if s1 = -1l then
        if s2 = -1l then
          basic_megaauto_search masl (s0,s1,s2,Int32.add s3 1l,s4,s5,s6,s7) cx hyps g
        else
          basic_megaauto_search masl (s0,s1,Int32.add s2 1l,s3,s4,s5,s6,s7) cx hyps g
      else
        basic_megaauto_search masl (s0,Int32.add s1 1l,s2,s3,s4,s5,s6,s7) cx hyps g
    else
      basic_megaauto_search masl (Int32.add s0 1l,s1,s2,s3,s4,s5,s6,s7) cx hyps g

let rec tm_head_args_r m args =
  match m with
  | Ap(m1,m2) -> tm_head_args_r m1 (m2::args)
  | _ -> (m,args)

let tm_head_args m =
  tm_head_args_r m []

let rec headnorm1 salt m =
  match m with
  | Lam(_,_) -> m
  | Imp(_,_) -> m
  | All(_,_) -> m
  | _ ->
      let (mh,margs) = tm_head_args m in
      if defp !megasgdelta mh then
	let salt2 = hashtag salt 24l in
	let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
	if s7 < 1610612734l then (** once we've decided to head normalize, expand head 7/8 of the time **)
	  headnorm1 salt2 (delta_exp !megasgdelta mh margs)
	else
	  m
      else
	m

let headnorm salt m = headnorm1 salt (tm_beta_eta_norm m)

let rec basic_megaauto_small_search i j k l cx hyps g =
  let trysalt s1 =
    try
      mvarcnt := 0; searchlim := 1000;
      let d = basic_megaauto 50 (s1,0l,0l,0l,0l,0l,0l,0l) cx hyps g in
      let h = md256_hexstring (s1,0l,0l,0l,0l,0l,0l,0l) in
      let n = ref 63 in
      while (!n >= 0 && h.[!n] = '0') do
        decr n
      done;
      Printf.printf "Line %d Char %d: Use ?%s?\n" !lineno !charno (String.sub h 0 (!n+1)); flush stdout;
      d
    with SearchBacktrack -> raise SearchLimit
  in
  try
    trysalt (Int32.logor (Int32.shift_left i 28)
               (Int32.logor (Int32.shift_left j 24)
                  (Int32.logor (Int32.shift_left k 20)
                     (Int32.shift_left l 16))))
  with SearchLimit ->
        if i < 15l then
          basic_megaauto_small_search (Int32.add i 1l) j k l cx hyps g
        else if j < 15l then
          basic_megaauto_small_search 0l (Int32.add j 1l) k l cx hyps g
        else if k < 15l then
          basic_megaauto_small_search 0l 0l (Int32.add k 1l) l cx hyps g
        else if l < 15l then
          basic_megaauto_small_search 0l 0l 0l (Int32.add l 1l) cx hyps g
        else
          raise SearchLimit

let invert_tuple2 m =
  match m with
  | Ap(Ap(TmH(hl),m2),Lam(Set,mb)) when Some(hl) = !setlam && Some(tm_id m2 !megasgof !megasgdelta) = !set2 ->
      begin
	let (mcond,mth,mels) =
	  match mb with
	  | Ap(Ap(Ap(TmH(hif),mcond),mth),mels) when Some(hif) = !ifopset ->
	      (mcond,mth,mels)
	  | Ap(Ap(Ap(TpAp(TmH(hif),Set),mcond),mth),mels) when Some(hif) = !ifop ->
	      (mcond,mth,mels)
	  | _ ->
	      raise Not_found
	in
	match mcond with
	| Ap(Ap(TpAp(TmH(he),Set),DB(0)),m0) when he = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" && Some(tm_id m0 !megasgof !megasgdelta) = !set0 ->
	    if free_in_tm_p mth 0 then raise Not_found;
	    if free_in_tm_p mels 0 then raise Not_found;
	    (tmshift 0 (-1) mth,tmshift 0 (-1) mels)
	| _ -> raise Not_found
      end
  | _ ->
      raise Not_found

let rec type_megaauto lm salt cx hyps g =
  if lm <= 0 || !searchlim <= 0 then raise SearchLimit;
  decr searchlim;
  match g with
  | Imp(p,g1) ->
      let d = type_megaauto (lm-1) salt cx (p::hyps) g1 in
      PLam(p,d)
  | All(Set,g1) ->
      let d = type_megaauto (lm-1) salt (Set::cx) (List.map (tmshift 0 1) hyps) g1 in
      TLam(Set,d)
  | Ap(Ap(Prim(1),m),a) -> (** just assume Prim 1 is In **)
      type_megaauto_of lm salt cx hyps m a
  | Ap(Ap(TmH(h),m),a) when h = "73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5" -> (** assume this is the id of In **)
      type_megaauto_of lm salt cx hyps m a
  | Ap(Ap(TpAp(TmH(h),Set),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
      type_megaauto_conv lm salt cx hyps m1 m2
  | _ -> raise SearchBacktrack
and type_megaauto_of lm salt cx hyps m a =
  if debug then (Printf.printf "of: m = %s\n    a = %s\n" (tm_to_str m) (tm_to_str a); flush stdout);
  let salt2 = hashtag salt 23l in
  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
  let mn =
    if s6 < 1610612734l then (** 7/8 of the time head normalize **)
      headnorm salt2 m
    else
      m
  in
  let an =
    if s7 < 1610612734l then (** 7/8 the time head normalize **)
      headnorm salt2 a
    else
      a
  in
  if mn = m && an = a then
    type_megaauto_of_2 lm salt2 cx hyps m a
  else
    try
      type_megaauto_of_2 lm salt2 cx hyps mn an
    with SearchBacktrack ->
      if mn = m then
	begin
	  try
	    type_megaauto_of_2 lm salt2 cx hyps m an
	  with SearchBacktrack ->
	    type_megaauto_of_2 lm salt2 cx hyps m a
	end
      else if an = a then
	begin
	  try
	    type_megaauto_of_2 lm salt2 cx hyps mn a
	  with SearchBacktrack ->
	    type_megaauto_of_2 lm salt2 cx hyps m a
	end
      else if s1 < 0l then
	begin
	  try
	    type_megaauto_of_2 lm salt2 cx hyps m an
	  with SearchBacktrack ->
	    try
	      type_megaauto_of_2 lm salt2 cx hyps mn a
	    with SearchBacktrack ->
	      type_megaauto_of_2 lm salt2 cx hyps m a
	end
      else
	begin
	  try
	    type_megaauto_of_2 lm salt2 cx hyps mn a
	  with SearchBacktrack ->
	    try
	      type_megaauto_of_2 lm salt2 cx hyps m an
	    with SearchBacktrack ->
	      type_megaauto_of_2 lm salt2 cx hyps m a
	end
and type_megaauto_of_2 lm salt cx hyps m a =
  let d = type_megaauto_of_2b lm salt cx hyps m a in
  if debug then if (None = (try check_propofpf !megasgdelta !megasgof cx hyps d (Ap(Ap(Prim(1),m),a)) [] with _ -> None)) then (Printf.printf "returned proof term by of_2b did not check:\nd = %s\n%s :e %s\n" (pf_to_str d) (tm_to_str m) (tm_to_str a); raise (Failure "bug"));
  d
and type_megaauto_of_2b lm salt cx hyps m a =
  if lm <= 0 || !searchlim <= 0 then raise SearchLimit;
  decr searchlim;
  if debug then (Printf.printf "of after hnf: m = %s\n    a = %s\n" (tm_to_str m) (tm_to_str a); flush stdout);
  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt in
  let gen_lam_body n =
    match n with
    | Lam(_,n1) -> n1
    | _ -> Ap(tmshift 0 1 n,DB(0))
  in
  match (m,a) with
  | (Ap(Ap(TmH(h),b1),m1),Ap(Ap(TmH(k),a1),a2)) when Some(h) = !setlambda && Some(k) = !setPi ->
      begin
	if conv a1 b1 !megasgdelta [] = None then
	  if s0 < 0l then (** half the time try to convert the type **)
	    let e = type_megaauto_conv (lm-1) salt cx hyps b1 a1 in
	    begin
	      match !known_lam_Pi with
	      | Some(hk) ->
		  let tphyp = Ap(Ap(Prim(1),DB(0)),tmshift 0 1 a1) in
		  let m1b = gen_lam_body m1 in
		  let a2b = gen_lam_body a2 in
		  let d = type_megaauto_of (lm-1) salt (Set::cx) (tphyp::List.map (tmshift 0 1) hyps) m1b a2b in
		  PPfAp(PTmAp(e,Lam(Set,Lam(Set,Ap(Ap(Prim(1),Ap(Ap(TmH(h),DB(0)),tmshift 0 2 m1)),Ap(Ap(TmH(k),tmshift 0 2 a1),tmshift 0 2 a2))))),PPfAp(PTmAp(PTmAp(PTmAp(Known(hk),a1),a2),m1),TLam(Set,PLam(tphyp,d))))
	      | _ -> raise SearchBacktrack
	    end
	  else
	    raise SearchBacktrack
	else
	  begin
	    match !known_lam_Pi with
	    | Some(hk) ->
		let tphyp = Ap(Ap(Prim(1),DB(0)),tmshift 0 1 a1) in
		let d = type_megaauto_of (lm-1) salt (Set::cx) (tphyp::List.map (tmshift 0 1) hyps) (gen_lam_body m1) (gen_lam_body a2) in
		PPfAp(PTmAp(PTmAp(PTmAp(Known(hk),a1),a2),m1),TLam(Set,PLam(tphyp,d)))
	    | _ -> raise SearchBacktrack
	  end
      end
  | (Ap(Ap(TmH(h),b1),m1),Ap(Ap(TmH(k),a2),a1)) when Some(h) = !setlambda && Some(k) = !setexp ->
      begin
	if conv a1 b1 !megasgdelta [] = None then
	  if s0 < 0l then (** half the time try to convert the type **)
	    let e = type_megaauto_conv (lm-1) salt cx hyps b1 a1 in
	    begin
	      match !known_lam_Pi with
	      | Some(hk) ->
		  let tphyp = Ap(Ap(Prim(1),DB(0)),tmshift 0 1 a1) in
		  let m1b = gen_lam_body m1 in
		  let a2b = tmshift 0 1 a2 in
		  let d = type_megaauto_of (lm-1) salt (Set::cx) (tphyp::List.map (tmshift 0 1) hyps) m1b a2b in
		  PPfAp(PTmAp(e,Lam(Set,Lam(Set,Ap(Ap(Prim(1),Ap(Ap(TmH(h),DB(0)),tmshift 0 2 m1)),Ap(Ap(TmH(k),tmshift 0 2 a1),tmshift 0 2 a2))))),PPfAp(PTmAp(PTmAp(PTmAp(Known(hk),a1),a2),m1),TLam(Set,PLam(tphyp,d))))
	      | _ -> raise SearchBacktrack
	    end
	  else
	    raise SearchBacktrack
	else
	  begin
	    match !known_lam_Pi with
	    | Some(hk) ->
		let tphyp = Ap(Ap(Prim(1),DB(0)),tmshift 0 1 a1) in
		let a2b = tmshift 0 1 a2 in
		let d = type_megaauto_of (lm-1) salt (Set::cx) (tphyp::List.map (tmshift 0 1) hyps) (gen_lam_body m1) a2b in
		PPfAp(PTmAp(PTmAp(PTmAp(Known(hk),a1),Lam(Set,a2b)),m1),TLam(Set,PLam(tphyp,d)))
	    | _ -> raise SearchBacktrack
	  end
      end
  | _ ->
      try
	let (m1,m2) = invert_tuple2 m in
	match a with
	| Ap(Ap(TmH(k),a1),a2) when Some(k) = !setlambda -> (** lam is Sigma **)
	    let d1 = type_megaauto_of lm salt cx hyps m1 a1 in
	    let a2b = gen_lam_body a2 in
	    let d2 = type_megaauto_of lm salt cx hyps m2 (tmsubst a2b 0 m1) in
	    begin
	      match !known_tuple_2_Sigma with
	      | Some(kt2S) ->
		  PPfAp(PTmAp(PPfAp(PTmAp(PTmAp(PTmAp(Known(kt2S),a1),a2),m1),d1),m2),d2)
	      | None -> raise SearchBacktrack
	    end
	| Ap(Ap(TmH(k),a1),a2) when Some(k) = !setprod ->
	    let d1 = type_megaauto_of lm salt cx hyps m1 a1 in
	    let d2 = type_megaauto_of lm salt cx hyps m2 a2 in
	    begin
	      match !known_tuple_2_setprod with
	      | Some(kt2p) ->
		  PPfAp(PTmAp(PPfAp(PTmAp(PTmAp(PTmAp(Known(kt2p),a1),a2),m1),d1),m2),d2)
	      | None -> raise SearchBacktrack
	    end
	| Ap(Ap(TmH(hs),a1),a2) when Some(hs) = !setsum ->
	    let h1 = tm_id m1 !megasgof !megasgdelta in
	    if Some(h1) = !set0 then
	      let d = type_megaauto_of (lm-1) salt cx hyps m2 a1 in
	      begin
		match !known_tuple0_setsum with
		| Some(ks) ->
		    PPfAp(PTmAp(PTmAp(PTmAp(Known(ks),a1),a2),m2),d)
		| None ->
		    raise SearchBacktrack
	      end
	    else if Some(h1) = !set1 then
	      let d = type_megaauto_of (lm-1) salt cx hyps m2 a2 in
	      begin
		match !known_tuple1_setsum with
		| Some(ks) ->
		    PPfAp(PTmAp(PTmAp(PTmAp(Known(ks),a1),a2),m2),d)
		| None ->
		    raise SearchBacktrack
	      end
	    else
	      raise SearchBacktrack
	| _ -> raise SearchBacktrack
      with Not_found ->
	let (d,b) = type_megaauto_extr lm salt cx hyps m in
	if conv a b !megasgdelta [] = None then
	  if s0 < 0l then (** half the time try to convert the type **)
	    let e = type_megaauto_conv (lm-1) salt cx hyps a b in
	    PPfAp(PTmAp(e,Lam(Set,Lam(Set,Ap(Ap(Prim(2),tmshift 0 2 m),DB(0))))),d)
	  else
	    raise SearchBacktrack
	else
	  begin
	    d
	  end
and type_megaauto_extr lm salt cx hyps m =
  if debug then (Printf.printf "extr: m = %s\n" (tm_to_str m); flush stdout);
  let salt2 = hashtag salt 23l in
  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
  let mn =
    if s6 < 1610612734l then (** 7/8 of the time head normalize **)
      headnorm salt2 m
    else
      m
  in
  if mn = m then
    type_megaauto_extr_2 lm salt2 cx hyps m
  else
    begin
      try
	type_megaauto_extr_2 lm salt2 cx hyps mn
      with SearchBacktrack ->
	type_megaauto_extr_2 lm salt2 cx hyps m
    end
and type_megaauto_extr_2 lm salt cx hyps m =
  let (d,a) = type_megaauto_extr_2b lm salt cx hyps m in
  if debug then if (None = (try check_propofpf !megasgdelta !megasgof cx hyps d (Ap(Ap(Prim(1),m),a)) [] with _ -> None)) then (Printf.printf "returned proof term/extracted type by extr_2b did not check:\nd = %s\n%s :e %s\n" (pf_to_str d) (tm_to_str m) (tm_to_str a); raise (Failure "bug"));
  (d,a)
and type_megaauto_extr_2b lm salt cx hyps m =
  if lm <= 0 || !searchlim <= 0 then raise SearchLimit;
  decr searchlim;
  (*  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt in *)
  let (_,_,_,_,_,_,_,_) = salt in
  if debug then (Printf.printf "extr after hnf: m = %s\n" (tm_to_str m); flush stdout);
  let rec local_type_hyp hypsl i =
    match hypsl with
    | Ap(Ap(Prim(1),n),b)::hypsr ->
	if conv n m !megasgdelta [] = None then
	  local_type_hyp hypsr (i+1)
	else
	  (i,b)
    | Ap(Ap(TmH(h),n),b)::hypsr when h = "73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5" ->
	if conv n m !megasgdelta [] = None then
	  local_type_hyp hypsr (i+1)
	else
	  (i,b)
    | _::hypsr -> local_type_hyp hypsr (i+1)
    | [] -> raise Not_found
  in
  let handle_ap m1 m2 =
    let (d1,b) = type_megaauto_extr lm salt cx hyps m1 in
    match b with
    | Ap(Ap(TmH(hp),b1),b2) when Some(hp) = !setPi ->
	let d2 = type_megaauto_of (lm-1) salt cx hyps m2 b1 in
	begin
	  match !known_ap_Pi with
	  | Some(kap) -> (PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(PTmAp(Known(kap),b1),b2),m1),m2),d1),d2),tmsubst (gen_lam_body b2) 0 m2)
	  | None -> raise SearchBacktrack
	end
    | Ap(Ap(TmH(he),b2),b1) when Some(he) = !setexp ->
	let d2 = type_megaauto_of (lm-1) salt cx hyps m2 b1 in
	begin
	  match !known_ap_Pi with
	  | Some(kap) -> (PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(PTmAp(Known(kap),b1),Lam(Set,tmshift 0 1 b2)),m1),m2),d1),d2),b2)
	  | None -> raise SearchBacktrack
	end
    | _ -> raise SearchBacktrack
  in
  match m with
  | DB(_) ->
      begin
	try
	  let (i,b) = local_type_hyp hyps 0 in
	  (Hyp(i),b)
	with Not_found ->
	  raise SearchBacktrack
      end
  | Ap(Ap(TmH(h),m1),m2) when Some(h) = !setap && Some(tm_id m2 !megasgof !megasgdelta) = !set0 ->
      begin
	let (d,b) = type_megaauto_extr lm salt cx hyps m1 in
	match b with
	| Ap(Ap(TmH(h),b1),b2) when Some(h) = !setlambda -> (** lam is Sigma **)
	    begin
	      match !known_ap0_Sigma with
	      | Some(hk) ->
		  (PPfAp(PTmAp(PTmAp(PTmAp(Known(hk),b1),b2),m1),d),b1)
	      | _ -> raise SearchBacktrack
	    end
	| Ap(Ap(TmH(h),b1),b2) when Some(h) = !setprod ->
	    begin
	      match !known_ap0_Sigma with
	      | Some(hk) ->
		  (PPfAp(PTmAp(PTmAp(PTmAp(Known(hk),b1),Lam(Set,tmshift 0 1 b2)),m1),d),b1)
	      | _ -> raise SearchBacktrack
	    end
	| _ -> handle_ap m1 m2
      end
  | Ap(Ap(TmH(h),m1),m2) when Some(h) = !setap && Some(tm_id m2 !megasgof !megasgdelta) = !set1 ->
      begin
	let (d,b) = type_megaauto_extr lm salt cx hyps m1 in
	match b with
	| Ap(Ap(TmH(hl),b1),b2) when Some(hl) = !setlambda -> (** lam is Sigma **)
	    begin
	      match !known_ap1_Sigma with
	      | Some(hk) ->
		  (PPfAp(PTmAp(PTmAp(PTmAp(Known(hk),b1),b2),m1),d),tmsubst (gen_lam_body b2) 0 (Ap(Ap(TmH(h),m1),Prim(2))))
	      | _ -> raise SearchBacktrack
	    end
	| Ap(Ap(TmH(hp),b1),b2) when Some(hp) = !setprod ->
	    begin
	      match !known_ap1_Sigma with
	      | Some(hk) ->
		  (PPfAp(PTmAp(PTmAp(PTmAp(Known(hk),b1),Lam(Set,tmshift 0 1 b2)),m1),d),b2)
	      | _ -> raise SearchBacktrack
	    end
	| _ -> handle_ap m1 m2
      end
  | Ap(Ap(TmH(h),m1),m2) when Some(h) = !setap -> handle_ap m1 m2
  | _ ->
      let h = tm_id m !megasgof !megasgdelta in
      if Some(h) = !set0 then
	begin
	  match (!known_In_0_2,!setordsucc) with
	  | (Some(k02),Some(hs)) -> (Known(k02),Ap(TmH(hs),Ap(TmH(hs),Prim(2))))
	  | _ -> raise SearchBacktrack
	end
      else if Some(h) = !set1 then
	begin
	  match (!known_In_1_2,!setordsucc) with
	  | (Some(k12),Some(hs)) -> (Known(k12),Ap(TmH(hs),Ap(TmH(hs),Prim(2))))
	  | _ -> raise SearchBacktrack
	end
      else
	begin
	  try
	    match (!setprod,!known_tuple_2_Sigma) with
	    | (Some(hp),Some(ktS)) ->
		let (m1,m2) = invert_tuple2 m in
		let (d1,b1) = type_megaauto_extr lm salt cx hyps m1 in
		let (d2,b2) = type_megaauto_extr lm salt cx hyps m2 in
		(PPfAp(PTmAp(PPfAp(PTmAp(PTmAp(PTmAp(Known(ktS),b1),Lam(Set,tmshift 0 1 b2)),m1),d1),m2),d2),Ap(Ap(TmH(hp),b1),b2))
	    | _ -> raise Not_found
	  with Not_found ->
	    raise SearchBacktrack
	end
and type_megaauto_conv lm salt cx hyps m1 m2 =
  if debug then (Printf.printf "conv: m1 = %s\n    m2 = %s\n" (tm_to_str m1) (tm_to_str m2); flush stdout);
  let salt2 = hashtag salt 23l in
  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
  let m1n =
    if s6 < 1610612734l then (** 7/8 of the time head normalize **)
      headnorm salt2 m1
    else
      m1
  in
  let m2n =
    if s7 < 1610612734l then (** 7/8 the time head normalize **)
      headnorm salt2 m2
    else
      m2
  in
  if m1n = m1 && m2n = m2 then
    type_megaauto_conv_2 lm salt cx hyps m1 m2
  else
    try
      type_megaauto_conv_2 lm salt cx hyps m1n m2n
    with SearchBacktrack ->
      if m1n = m1 then
	begin
	  try
	    type_megaauto_conv_2 lm salt cx hyps m1 m2n
	  with SearchBacktrack ->
	    type_megaauto_conv_2 lm salt cx hyps m1 m2
	end
      else if m2n = m2 then
	begin
	  try
	    type_megaauto_conv_2 lm salt cx hyps m1n m2
	  with SearchBacktrack ->
	    type_megaauto_conv_2 lm salt cx hyps m1 m2
	end
      else if s1 < 0l then
	begin
	  try
	    type_megaauto_conv_2 lm salt cx hyps m1 m2n
	  with SearchBacktrack ->
	    try
	      type_megaauto_conv_2 lm salt cx hyps m1n m2
	    with SearchBacktrack ->
	      type_megaauto_conv_2 lm salt cx hyps m1 m2
	end
      else
	begin
	  try
	    type_megaauto_conv_2 lm salt cx hyps m1n m2
	  with SearchBacktrack ->
	    try
	      type_megaauto_conv_2 lm salt cx hyps m1 m2n
	    with SearchBacktrack ->
	      type_megaauto_conv_2 lm salt cx hyps m1 m2
	end
and type_megaauto_conv_2 lm salt cx hyps m1 m2 =
  let d = type_megaauto_conv_2b lm salt cx hyps m1 m2 in
  d
and type_megaauto_conv_2b lm salt cx hyps m1 m2 =
  if lm <= 0 || !searchlim <= 0 then raise SearchLimit;
  decr searchlim;
  if m1 = m2 then
    PTmAp(pf_eqset_ref,m1)
  else
    type_megaauto_conv_3 lm salt cx hyps m1 m2
and type_megaauto_conv_3 lm salt cx hyps m1 m2 =
  try
    let (d1,m1r) = type_megaauto_red lm salt cx hyps m1 in
    try
      let (d2,m2r) = type_megaauto_red lm salt cx hyps m2 in
      if m1r = m2r then
	let d2s = PPfAp(PTmAp(PTmAp(pf_eqset_sym,m2),m2r),d2) in
	PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(pf_eqset_tra,m1),m2r),m2),d1),d2s)
      else
	try
	  let d3 = type_megaauto_conv_2 (lm-1) salt cx hyps m1r m2r in
	  (** d1 :: m1 = m1r **)
	  (** d3 :: m1r = m2r **)
	  (** d2 :: m2r = m2 **)
	  let d13 = PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(pf_eqset_tra,m1),m1r),m2r),d1),d3) in
	  let d2s = PPfAp(PTmAp(PTmAp(pf_eqset_sym,m2),m2r),d2) in
	  PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(pf_eqset_tra,m1),m2r),m2),d13),d2s)
	with SearchBacktrack ->
	  try
	    let d3 = type_megaauto_conv_2 (lm-1) salt cx hyps m1 m2r in
	    (** d3 :: m1 = m2r **)
	    (** d2 :: m2 = m2r **)
	    let d2s = PPfAp(PTmAp(PTmAp(pf_eqset_sym,m2),m2r),d2) in
	    PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(pf_eqset_tra,m1),m2r),m2),d3),d2s)
	  with SearchBacktrack ->
	    let d3 = type_megaauto_conv_2 (lm-1) salt cx hyps m1r m2 in
	    (** d1 :: m1 = m1r **)
	    (** d3 :: m1r = m2 **)
	    PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(pf_eqset_tra,m1),m1r),m2),d1),d3)
    with Not_found ->
      if m1r = m2 then
	d1
      else
	let d3 = type_megaauto_conv_2 (lm-1) salt cx hyps m1r m2 in
	(** d1 :: m1 = m1r **)
	(** d3 :: m1r = m2 **)
	PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(pf_eqset_tra,m1),m1r),m2),d1),d3)
  with Not_found ->
    try
      let (d2,m2r) = type_megaauto_red lm salt cx hyps m2 in
      if m1 = m2r then
	PPfAp(PTmAp(PTmAp(pf_eqset_sym,m2),m2r),d2)
      else
	let d3 = type_megaauto_conv_2 (lm-1) salt cx hyps m1 m2r in
	(** d3 :: m1 = m2r **)
	(** d2 :: m2 = m2r **)
	let d2s = PPfAp(PTmAp(PTmAp(pf_eqset_sym,m2),m2r),d2) in
	PPfAp(PPfAp(PTmAp(PTmAp(PTmAp(pf_eqset_tra,m1),m2r),m2),d3),d2s)
    with Not_found ->
      raise SearchBacktrack
and type_megaauto_red lm salt cx hyps m =
  let salt2 = hashtag salt 25l in
  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
  match m with
  | Ap(Ap(TmH(h),((Ap(Ap(TmH(k),a),m1pb)) as m1)),m2) when Some(h) = !setap && Some(k) = !setlambda ->
      begin
	try
	  let (m1a,m1b) = invert_tuple2 m1 in
	  let h2 = tm_id m2 !megasgof !megasgdelta in
	  if Some(h2) = !set0 then
	    if s0 < 1610612734l then (** do this reduction 7/8 of the time since unlike beta it doesn't require type checking **)
	      begin
		match !known_tuple_2_0_eq with
		| Some(kte) ->
		    (PTmAp(PTmAp(Known(kte),m1a),m1b),m1a)
		| None -> raise Not_found
	      end
	    else
	      raise Not_found
	  else if Some(h2) = !set1 then
	    if s0 < 1610612734l then (** do this reduction 7/8 of the time since unlike beta it doesn't require type checking **)
	      begin
		match !known_tuple_2_1_eq with
		| Some(kte) ->
		    (PTmAp(PTmAp(Known(kte),m1a),m1b),m1b)
		| None -> raise Not_found
	      end
	    else
	      raise Not_found
	  else
	    raise Not_found
	with Not_found ->
	  if s0 < 0l then
	    begin
	      match !known_beta with
	      | Some(kb) ->
		  let d = type_megaauto_of (lm-1) salt2 cx hyps m2 a in
		  let m1b = gen_lam_body m1pb in
		  let m3 = tmsubst m1b 0 m2 in
		  (PPfAp(PTmAp(PTmAp(PTmAp(Known(kb),a),Lam(Set,m1b)),m2),d),m3)
	      | None -> raise Not_found
	    end
	  else
	    begin
	      try
		type_megaauto_red_2 lm salt2 cx hyps m
	      with Not_found ->
		type_megaauto_red_2 lm salt2 cx hyps m
	    end
      end
  | _ -> type_megaauto_red_2 lm salt2 cx hyps m
and type_megaauto_red_2 lm salt cx hyps m =
  let salt2 = hashtag salt 26l in
  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
  match m with
  | Ap(m1,m2) ->
      if s0 < 0l then
	if s1 < 0l then
	  begin
	    try
	      type_megaauto_red_3 lm salt2 cx hyps m1 (fun u -> Ap(u,tmshift 0 1 m2))
	    with Not_found ->
	      try
		type_megaauto_red_3 lm salt2 cx hyps m2 (fun u -> Ap(tmshift 0 1 m1,u))
	      with Not_found ->
		type_megaauto_red_4 lm salt2 cx hyps m
	  end
	else
	  begin
	    try
	      type_megaauto_red_3 lm salt2 cx hyps m2 (fun u -> Ap(tmshift 0 1 m1,u))
	    with Not_found ->
	      try
		type_megaauto_red_3 lm salt2 cx hyps m1 (fun u -> Ap(u,tmshift 0 1 m2))
	      with Not_found ->
		type_megaauto_red_4 lm salt2 cx hyps m
	  end
      else
	type_megaauto_red_4 lm salt2 cx hyps m
  | _ -> raise Not_found
and type_megaauto_red_3 lm salt cx hyps m hl =
  let salt2 = hashtag salt 25l in
  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in
  match m with
  | Ap(Ap(TmH(h),a1),m2) when Some(h) = !setlambda || Some(h) = !setPi ->
      if s3 < 1610612734l then
	begin
	  try
	    let (d,mr) = type_megaauto_red_4 lm salt2 cx hyps m in
	    (** d :: m = mr **)
	    let hl0 = hl (DB(0)) in
	    let hlp = Lam(Set,hl0) in
	    let hlp_1 = tmshift 0 1 hlp in
	    let hlp_3 = tmshift 0 3 hlp in
	    let m_1 = tmshift 0 1 m in
	    let mr_1 = tmshift 0 1 mr in
	    let dhl = TLam(Ar(Set,Ar(Set,Prop)),PLam(Ap(Ap(DB(0),Ap(hlp_1,m_1)),Ap(hlp_1,mr_1)),PPfAp(PTmAp(pftmshift 0 1 (pfshift 0 1 d),Lam(Set,Lam(Set,Ap(Ap(DB(2),Ap(hlp_3,DB(1))),Ap(hlp_3,DB(0)))))),Hyp(0)))) in
	    (dhl,tmsubst hl0 0 mr)
	  with Not_found ->
	    if s2 < 0l then
	      let hl2 = hl in (** try to reduce the type bound (not under a binder) **)
	      type_megaauto_red_3 lm salt2 cx hyps a1 (fun u -> hl2 (Ap(Ap(TmH(h),u),tmshift 0 1 m2)))
	    else
	      raise Not_found
	end
      else
	let hl2 = hl in (** try to reduce the type bound (not under a binder) **)
	type_megaauto_red_3 lm salt2 cx hyps a1 (fun u -> hl2 (Ap(Ap(TmH(h),u),tmshift 0 1 m2)))
  | Ap(Ap(TmH(h),((Ap(Ap(TmH(k),a),m1pb)) as m1)),m2) when Some(h) = !setap && Some(k) = !setlambda ->
      begin
	try
	  let (m1a,m1b) = invert_tuple2 m1 in
	  let h2 = tm_id m2 !megasgof !megasgdelta in
	  if Some(h2) = !set0 then
	    if s0 < 1610612734l then (** do this reduction 7/8 of the time since unlike beta it doesn't require type checking **)
	      begin
		match !known_tuple_2_0_eq with
		| Some(kte) ->
		    let d = PTmAp(PTmAp(Known(kte),m1a),m1b) in
		    (** d :: m = m1a **)
		    (** need :: hl m = hl m1a, let q. assume H:q (hl m) (hl m1a). d (fun u v => q (hl u) (hl v)) :: q (hl m) (hl m1a) -> q (hl m1a) (hl m) **)
		    let hl0 = hl (DB(0)) in
		    let hlp = Lam(Set,hl0) in
		    let hlp_1 = tmshift 0 1 hlp in
		    let hlp_3 = tmshift 0 3 hlp in
		    let m_1 = tmshift 0 1 m in
		    let m1a_1 = tmshift 0 1 m1a in
		    let dhl = TLam(Ar(Set,Ar(Set,Prop)),PLam(Ap(Ap(DB(0),Ap(hlp_1,m_1)),Ap(hlp_1,m1a_1)),PPfAp(PTmAp(pftmshift 0 1 (pfshift 0 1 d),Lam(Set,Lam(Set,Ap(Ap(DB(2),Ap(hlp_3,DB(1))),Ap(hlp_3,DB(0)))))),Hyp(0)))) in
		    (dhl,tmsubst hl0 0 m1a)
		| None -> raise Not_found
	      end
	    else
	      raise Not_found
	  else if Some(h2) = !set1 then
	    if s0 < 1610612734l then (** do this reduction 7/8 of the time since unlike beta it doesn't require type checking **)
	      begin
		match !known_tuple_2_1_eq with
		| Some(kte) ->
		    let d = PTmAp(PTmAp(Known(kte),m1a),m1b) in
		    (** d :: m = m1b **)
		    let hl0 = hl (DB(0)) in
		    let hlp = Lam(Set,hl0) in
		    let hlp_1 = tmshift 0 1 hlp in
		    let hlp_3 = tmshift 0 3 hlp in
		    let m_1 = tmshift 0 1 m in
		    let m1b_1 = tmshift 0 1 m1b in
		    let dhl = TLam(Ar(Set,Ar(Set,Prop)),PLam(Ap(Ap(DB(0),Ap(hlp_1,m_1)),Ap(hlp_1,m1b_1)),PPfAp(PTmAp(pftmshift 0 1 (pfshift 0 1 d),Lam(Set,Lam(Set,Ap(Ap(DB(2),Ap(hlp_3,DB(1))),Ap(hlp_3,DB(0)))))),Hyp(0)))) in
		    (dhl,tmsubst hl0 0 m1b)
		| None -> raise Not_found
	      end
	    else
	      raise Not_found
	  else
	    raise Not_found
	with Not_found ->
	  if s0 < 0l then
	    begin
	      match !known_beta with
	      | Some(kb) ->
		  let d = type_megaauto_of (lm-1) salt2 cx hyps m2 a in
		  let m1b = gen_lam_body m1pb in
		  let m3 = tmsubst m1b 0 m2 in
		  let d2 = PPfAp(PTmAp(PTmAp(PTmAp(Known(kb),a),Lam(Set,m1b)),m2),d) in
		  (** d2 :: m = m3 **)
		  let hl0 = hl (DB(0)) in
		  let hlp = Lam(Set,hl0) in
		  let hlp_1 = tmshift 0 1 hlp in
		  let hlp_3 = tmshift 0 3 hlp in
		  let m_1 = tmshift 0 1 m in
		  let m3_1 = tmshift 0 1 m3 in
		  let dhl = TLam(Ar(Set,Ar(Set,Prop)),PLam(Ap(Ap(DB(0),Ap(hlp_1,m_1)),Ap(hlp_1,m3_1)),PPfAp(PTmAp(pftmshift 0 1 (pfshift 0 1 d2),Lam(Set,Lam(Set,Ap(Ap(DB(2),Ap(hlp_3,DB(1))),Ap(hlp_3,DB(0)))))),Hyp(0)))) in
		  (dhl,tmsubst hl0 0 m3)
	      | None -> raise Not_found
	    end
	  else
	    raise Not_found
      end
  | Ap(m1,m2) ->
      begin
	let hl2 = hl in
	if s1 < 0l then
	  try
	    type_megaauto_red_3 lm salt2 cx hyps m1 (fun u -> hl2 (Ap(u,tmshift 0 1 m2)))
	  with Not_found ->
	    type_megaauto_red_3 lm salt2 cx hyps m2 (fun u -> hl2 (Ap(tmshift 0 1 m1,u)))
	else
	  try
	    type_megaauto_red_3 lm salt2 cx hyps m2 (fun u -> hl2 (Ap(tmshift 0 1 m1,u)))
	  with Not_found ->
	    type_megaauto_red_3 lm salt2 cx hyps m1 (fun u -> hl2 (Ap(u,tmshift 0 1 m2)))
      end
  | _ -> raise Not_found
and type_megaauto_red_4 lm salt cx hyps m =
  let salt2 = hashtag salt 27l in
  (*  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt2 in *)
  let (_,_,_,_,_,_,_,_) = salt2 in
  match m with
  | Ap(Ap(TmH(h),a1),m2) when Some(h) = !setlam ->
      begin
	let tphyp = Ap(Ap(Prim(1),DB(0)),tmshift 0 1 a1) in
	let m2b = gen_lam_body m2 in
	let (d,m2br) = type_megaauto_red lm salt2 (Set::cx) (tphyp::List.map (tmshift 0 1) hyps) m2b in
	(** x;x :e a1 |- d :: m2b = m2br **)
	(** need lam a1 (Lam(Set,m2b)) = lam a1 (Lam(Set,m2br)) **)
	match !known_lam_ext with
	| Some(kle) ->
	    (PPfAp(PTmAp(PTmAp(PTmAp(Known(kle),a1),m2),Lam(Set,m2br)),TLam(Set,PLam(tphyp,d))),Ap(Ap(TmH(h),a1),Lam(Set,m2br)))
	| None -> raise Not_found
      end
  | Ap(Ap(TmH(h),a1),m2) when Some(h) = !setPi ->
      begin
	let tphyp = Ap(Ap(Prim(1),DB(0)),tmshift 0 1 a1) in
	let m2b = gen_lam_body m2 in
	let (d,m2br) = type_megaauto_red lm salt2 (Set::cx) (tphyp::List.map (tmshift 0 1) hyps) m2b in
	(** x;x :e a1 |- d :: m2b = m2br **)
	(** need Pi a1 (Lam(Set,m2b)) = Pi a1 (Lam(Set,m2br)) **)
	match !known_Pi_cod_ext with
	| Some(kpe) ->
	    (PPfAp(PTmAp(PTmAp(PTmAp(Known(kpe),a1),m2),Lam(Set,m2br)),TLam(Set,PLam(tphyp,d))),Ap(Ap(TmH(h),a1),Lam(Set,m2br)))
	| None -> raise Not_found
      end
  | _ ->
      raise Not_found

let rec type_megaauto_search masl salt cx hyps g =
  if masl <= 0 then (Printf.printf "Line %d Char %d: Failed to find salt\n" !lineno !charno; flush stdout; raise SearchLimit);
  try
    mvarcnt := 0; searchlim := 1000;
    if debug then Printf.printf "Trying salt %s\n" (md256_hexstring salt); flush stdout;
    let d = type_megaauto 50 salt cx hyps g in
    let h = md256_hexstring salt in
    let n = ref 63 in
    while (!n >= 0 && h.[!n] = '0') do
      decr n
    done;
    Printf.printf "Line %d Char %d: Use ?t:%s?\n" !lineno !charno (String.sub h 0 (!n+1)); flush stdout;
    d
  with
  | SearchLimit -> type_megaauto_search_nxt (masl-1) salt cx hyps g
  | SearchBacktrack -> type_megaauto_search_nxt (masl-1) salt cx hyps g
and type_megaauto_search_nxt masl salt cx hyps g =
  let (s0,s1,s2,s3,s4,s5,s6,s7) = salt in
  if (s1,s2,s3,s4,s5,s6,s7) = (0l,0l,0l,0l,0l,0l,0l) then
    let s0r = Hashaux.int32_rev s0 in
    if s0r = -1l then
      type_megaauto_search masl (0l,1l,0l,0l,0l,0l,0l,0l) cx hyps g
    else
      type_megaauto_search masl (Hashaux.int32_rev (Int32.add s0r 1l),0l,0l,0l,0l,0l,0l,0l) cx hyps g
  else
    if s0 = -1l then
      if s1 = -1l then
        if s2 = -1l then
          type_megaauto_search masl (s0,s1,s2,Int32.add s3 1l,s4,s5,s6,s7) cx hyps g
        else
          type_megaauto_search masl (s0,s1,Int32.add s2 1l,s3,s4,s5,s6,s7) cx hyps g
      else
        type_megaauto_search masl (s0,Int32.add s1 1l,s2,s3,s4,s5,s6,s7) cx hyps g
    else
      type_megaauto_search masl (Int32.add s0 1l,s1,s2,s3,s4,s5,s6,s7) cx hyps g

let rec type_megaauto_small_search i j k l cx hyps g =
  let trysalt s1 =
    try
      mvarcnt := 0; searchlim := 1000;
      let d = type_megaauto 50 (s1,0l,0l,0l,0l,0l,0l,0l) cx hyps g in
      let h = md256_hexstring (s1,0l,0l,0l,0l,0l,0l,0l) in
      let n = ref 63 in
      while (!n >= 0 && h.[!n] = '0') do
        decr n
      done;
      Printf.printf "Line %d Char %d: Use ?t:%s?\n" !lineno !charno (String.sub h 0 (!n+1)); flush stdout;
      d
    with SearchBacktrack -> raise SearchLimit
  in
  try
    trysalt (Int32.logor (Int32.shift_left i 28)
               (Int32.logor (Int32.shift_left j 24)
                  (Int32.logor (Int32.shift_left k 20)
                     (Int32.shift_left l 16))))
  with SearchLimit ->
        if i < 15l then
          type_megaauto_small_search (Int32.add i 1l) j k l cx hyps g
        else if j < 15l then
          type_megaauto_small_search 0l (Int32.add j 1l) k l cx hyps g
        else if k < 15l then
          type_megaauto_small_search 0l 0l (Int32.add k 1l) l cx hyps g
        else if l < 15l then
          type_megaauto_small_search 0l 0l 0l (Int32.add l 1l) cx hyps g
        else
          raise SearchLimit

let megaauto pre ops cx hyps g =
  if pre = "" then
    if not (ops = "") && ops.[0] = '*' then (** search for an appropriate salt **)
      let n = String.length ops - 1 in
      let h =
        if n = 64 then
          String.sub ops 1 64
        else if n > 64 then
          raise (Failure (Printf.sprintf "salt for megaauto too long \"%s\"" ops))
        else
          let sbuf = Buffer.create 64 in
          for i = 1 to n do Buffer.add_char sbuf (ops.[i]) done;
          for i = n+1 to 64 do Buffer.add_char sbuf '0' done;
          Buffer.contents sbuf
      in
      let salt = hexstring_md256 h in
      if debug then (Printf.printf "Line %d Char %d: Trying Basic Megaauto Search (will likely hang until successful or killed)\n" !lineno !charno; flush stdout);
      basic_megaauto_search !megaautosaltlimit salt cx hyps g
    else if ops = "+" then (** search for an appropriate small salt **)
      begin
        try
          basic_megaauto_small_search 0l 0l 0l 0l cx hyps g
        with SearchLimit ->
          Printf.printf "Line %d Char %d: Failed to find small salt\n" !lineno !charno; flush stdout;
          raise SearchLimit
      end
    else
      let n = String.length ops in
      let h =
        if n = 64 then
          ops
        else if n > 64 then
          raise (Failure (Printf.sprintf "salt for megaauto too long \"%s\"" ops))
        else
          let sbuf = Buffer.create 64 in
          Buffer.add_string sbuf ops;
          for i = n to 63 do Buffer.add_char sbuf '0' done;
          Buffer.contents sbuf
      in
      let salt = hexstring_md256 h in
      mvarcnt := 0; searchlim := 1000;
      basic_megaauto 50 salt cx hyps g
  else if pre = "t" then
    if not (ops = "") && ops.[0] = '*' then (** search for an appropriate salt **)
      let n = String.length ops - 1 in
      let h =
        if n = 64 then
          String.sub ops 1 64
        else if n > 64 then
          raise (Failure (Printf.sprintf "salt for megaauto too long \"%s\"" ops))
        else
          let sbuf = Buffer.create 64 in
          for i = 1 to n do Buffer.add_char sbuf (ops.[i]) done;
          for i = n+1 to 64 do Buffer.add_char sbuf '0' done;
          Buffer.contents sbuf
      in
      let salt = hexstring_md256 h in
      if debug then (Printf.printf "Line %d Char %d: Trying Basic Megaauto Search (will likely hang until successful or killed)\n" !lineno !charno; flush stdout);
      type_megaauto_search !megaautosaltlimit salt cx hyps g
    else if ops = "+" then (** search for an appropriate small salt **)
      begin
        try
          type_megaauto_small_search 0l 0l 0l 0l cx hyps g
        with SearchLimit ->
          Printf.printf "Line %d Char %d: Failed to find small salt\n" !lineno !charno; flush stdout;
          raise SearchLimit
      end
    else
      let n = String.length ops in
      let h =
        if n = 64 then
          ops
        else if n > 64 then
          raise (Failure (Printf.sprintf "salt for megaauto too long \"%s\"" ops))
        else
          let sbuf = Buffer.create 64 in
          Buffer.add_string sbuf ops;
          for i = n to 63 do Buffer.add_char sbuf '0' done;
          Buffer.contents sbuf
      in
      let salt = hexstring_md256 h in
      mvarcnt := 0; searchlim := 1000;
      type_megaauto 50 salt cx hyps g
  else
    raise (Failure (Printf.sprintf "unknown prefix \"%s\" for megaauto" pre))
