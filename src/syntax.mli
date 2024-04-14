(*** File: syntax.ml ***)
(*** Chad E. Brown ***)
(*** Jan 18 2014 ***)

val sexprinfo : bool ref;;
val reportbushydeps : out_channel option ref;;

type pfgthy = HF | Egal | Mizar | HOAS;;
val pfgtheory : pfgthy ref

val eagerdeltas : bool ref
val prim_legend : (int,string) Hashtbl.t
val tmh_legend : (string,string) Hashtbl.t
val knownh_legend : (string,string) Hashtbl.t
val currtmid : string ref
val thmcount : int ref
val pflinestart : int ref
val pfcharstart : int ref
val pftext : Buffer.t

type tp = TpVar of int | Prop | Set | Ar of tp * tp

val notpvarsp : tp -> bool

(*** assume number of type variables is between 0 and 3 ***)
type ptp = int * tp

val primname : string -> int * ptp

type tm =
  | DB of int
  | TmH of string
  | Prim of int
  | TpAp of tm * tp
  | Ap of tm * tm
  | Lam of tp * tm
  | Imp of tm * tm
  | All of tp * tm

type ptm = int * tm

type pf =
  | Hyp of int
  | Known of string
  | PTpAp of pf * tp
  | PTmAp of pf * tm
  | PPfAp of pf * pf
  | PLam of tm * pf
  | TLam of tp * pf

type ppf = int * pf

type setinfixop = InfMem | InfSubq

type infixop =
  | InfSet of setinfixop
  | InfNam of string

type asckind = AscTp | AscSet | AscSubeq

type atree =
  | Byte of int
  | String of string
  | QString of string
  | Na of string
  | Nu of bool * string * string option * string option
  | Le of string * (asckind * atree) option * atree * atree
  | LeM of string * string list * atree * atree
  | Bi of string * (string list * (asckind * atree) option) list * atree
  | Preo of string * atree
  | Posto of string * atree
  | Info of infixop * atree * atree
  | Implop of atree * atree
  | Sep of string * setinfixop * atree * atree
  | Rep of string * setinfixop * atree * atree
  | SepRep of string * setinfixop * atree * atree * atree
  | SetEnum of atree list
  | MTuple of atree * atree list
  | Tuple of atree * atree * atree list
  | IfThenElse of atree * atree * atree

type ltree =
  | ByteL of int
  | StringL of string
  | QStringL of string
  | NaL of string
  | NuL of bool * string * string option * string option
  | LeL of string * (asckind * ltree) option * ltree * ltree
  | LeML of string * string list * ltree * ltree
  | BiL of string * string * (string list * (asckind * ltree) option) list * ltree
  | PreoL of string * ltree
  | PostoL of string * ltree
  | InfoL of infixop * ltree * ltree
  | ImplopL of ltree * ltree
  | SepL of string * setinfixop * ltree * ltree
  | RepL of string * setinfixop * ltree * ltree
  | SepRepL of string * setinfixop * ltree * ltree * ltree
  | SetEnumL of ltree list
  | MTupleL of ltree * ltree list
  | ParenL of ltree * ltree list
  | IfThenElseL of ltree * ltree * ltree

val binderishp : ltree -> bool

val output_ltree : out_channel -> ltree -> unit

val ltree_to_atree : ltree -> atree

type picase = Postfix | InfixNone | InfixLeft | InfixRight

type docitem =
  | Author of string * string list
  | Title of string
  | Salt of string
  | Opaque of string list
  | Transparent of string list
  | Treasure of string
  | ShowProofTerms of bool
  | Section of string
  | End of string
  | VarDecl of string list * asckind * ltree
  | LetDecl of string * (asckind * ltree) option * ltree
  | HypDecl of string * ltree
  | PostInfixDecl of string * ltree * int * picase
  | PrefixDecl of string * ltree * int
  | BinderDecl of bool * bool * string * ltree * ltree option
  | NotationDecl of string * string list
  | UnicodeDecl of string * string list
  | SubscriptDecl of string
  | SuperscriptDecl of string
  | ParamDecl of string * ltree
  | DefDecl of string * ltree option * ltree
  | ParamHash of string * string * string option
  | AxDecl of string * ltree
  | ThmDecl of string * string * ltree

type pftacitem =
  | PfStruct of int
  | Exact of ltree
  | LetTac of string list * ltree option
  | AssumeTac of string list * ltree option
  | SetTac of string * ltree option * ltree
  | ApplyTac of ltree
  | ClaimTac of string * ltree
  | ProveTac of ltree * ltree list
  | CasesTac of ltree * (string * ltree) list list
  | WitnessTac of ltree
  | RewriteTac of bool * ltree * int list
  | SpecialTac of string * ltree list
  | Qed
  | Admitted
  | Admit

type docorpftacitem =
  | DocItem : docitem -> docorpftacitem
  | PfTacItem : pftacitem -> docorpftacitem

type doc = (string * string) list * docorpftacitem list

(*** DocPromise(hashofdocyettobepublished,[...listofhashesofpropositionsprovenindocyettobepublished...]) ***)
type formalmetablockitem =
  | Doc of doc
  | DocPromise of string * string list

type formalmetablock = formalmetablockitem list

val tp_to_str : tp -> string
val tm_to_str : tm -> string
val pf_to_str : pf -> string

val tp_to_sexpr : tp -> string
val tm_to_sexpr : tm -> string
val pf_to_sexpr : pf -> string

val position : 'a list -> 'a -> int

val tpsubst : tp -> tp list -> tp
val tmtpsubst : tm -> tp list -> tm
val pftpsubst : pf -> tp list -> pf

val tplookup : string list -> string -> tp
val tmlookup : (string * (tp * tm option)) list -> string -> tm
val tmtplookup : (string * (tp * tm option)) list -> string -> tm * tp
val pflookup : (string * tm) list -> string -> pf
val pfproplookup : (string * tm) list -> string -> pf * tm

val beta_count : int option ref
val beta_count_check : unit -> unit

exception NegDB
val tmshift : int -> int -> tm -> tm
val pfshift : int -> int -> pf -> pf
val pftmshift : int -> int -> pf -> pf
val tmsubst : tm -> int -> tm -> tm
(***
val tmssub : tm -> (int -> tm) -> tm
***)
val free_in_tm_p : tm -> int -> bool
    
val extr_tpoftm : (string,ptp) Hashtbl.t -> tp list -> tm -> tp
val check_tpoftm : (string,ptp) Hashtbl.t -> tp list -> tm -> tp -> unit

val extr_propofpf : (string,ptm) Hashtbl.t -> (string,ptp) Hashtbl.t -> tp list -> tm list -> pf -> string list -> tm * string list
val check_propofpf : (string,ptm) Hashtbl.t -> (string,ptp) Hashtbl.t -> tp list -> tm list -> pf -> tm -> string list -> string list option

(*** conv m n del returns None if m and n are not convertible and returns Some(dl) where dl is a list of global definitions that were expanded if they are convertible ***)
val conv : tm -> tm -> (string,ptm) Hashtbl.t -> string list -> string list option
val headnorm : tm -> (string,ptm) Hashtbl.t -> string list -> tm * string list
val tm_beta_eta_norm : tm -> tm
val defp : (string,ptm) Hashtbl.t -> tm -> bool
val delta_exp : (string,ptm) Hashtbl.t -> tm -> tm list -> tm

exception MatchFail

type mtm =
  | MVar of int * mtm list
  | MDB of int
  | MTmH of string
  | MPrim of int
  | MTpAp of mtm * tp
  | MAp of mtm * mtm
  | MLam of tp * mtm
  | MImp of mtm * mtm
  | MAll of tp * mtm

val mtm_to_str : mtm -> string
val tm_to_mtm : tm -> mtm
val mtm_to_tm : mtm -> tm
val mtm_shift : int -> int -> mtm -> mtm
val mtm_ssub : mtm list -> mtm -> mtm
val mtm_msub : (int -> mtm) -> mtm -> mtm
val mtm_minap_db : mtm -> int -> int option
val mtm_lammvar_p : mtm -> bool
val mtm_betared_if : mtm -> (mtm -> mtm -> bool) -> mtm
val pattern_match : (string,ptm) Hashtbl.t -> mtm -> tm -> (int -> mtm) -> (int -> mtm)
val mheadnorm : mtm -> (string,ptm) Hashtbl.t -> string list -> mtm * string list

val valid_id_p : string -> bool

val tp_id : tp -> string
val ptp_id : ptp -> string
val tm_id : tm -> (string,ptp) Hashtbl.t -> (string,ptm) Hashtbl.t -> string
val ptm_lam_id : ptm -> (string,ptp) Hashtbl.t -> (string,ptm) Hashtbl.t -> string
val ptm_all_id : ptm -> (string,ptp) Hashtbl.t -> (string,ptm) Hashtbl.t -> string
val pfg_propid : tm -> Hash.hashval
val pfg_objid : tm -> tp -> Hash.hashval * Hash.hashval
val pfg_objid_pure_to_thy : Hash.hashval -> tp -> Hash.hashval
val pf_id : pf -> (string,ptp) Hashtbl.t -> (string,ptm) Hashtbl.t -> string
val ppf_id : ppf -> (string,ptp) Hashtbl.t -> (string,ptm) Hashtbl.t -> string

val tp_args_rtp : tp -> tp list * tp
val mk_forall_tm : tp list -> (tm -> tm -> tm) -> tm -> tm -> tm
val mk_gen_ap : tm -> tm list -> tm
val gen_lam_body : tm -> tm

val unicode : (string,string list) Hashtbl.t
val subscript : (string,unit) Hashtbl.t
val superscript : (string,unit) Hashtbl.t
val authors : string list ref
val title : string option ref
val signature : string option ref
val showproofterms : bool ref
val salt : string option ref
val treasure : string option ref

val pf_complexity : pf -> int

val globalhrefs : bool ref
val url_friendly_name : string -> string
val output_ltree_html : out_channel -> ltree -> (string,string) Hashtbl.t -> (string,string) Hashtbl.t -> unit
val output_docitem_html : out_channel -> docitem -> (string,string) Hashtbl.t -> (string,string) Hashtbl.t -> unit
val output_pftacitem_html : out_channel -> pftacitem -> (string,string) Hashtbl.t -> (string,string) Hashtbl.t -> int -> unit
                                 
val stp_html_string : tp -> string
                              
val output_ltree_latex : out_channel -> ltree -> (string,string) Hashtbl.t -> (string,string) Hashtbl.t -> unit
val output_docitem_latex : out_channel -> docitem -> (string,string) Hashtbl.t -> (string,string) Hashtbl.t -> unit
val output_pftacitem_latex : out_channel -> pftacitem -> (string,string) Hashtbl.t -> (string,string) Hashtbl.t -> int -> unit

val pfgtmh : (string,string) Hashtbl.t
val pfgtmhh : (string,Hash.hashval) Hashtbl.t
val pfgknh : (string,string) Hashtbl.t
val pfgknhh : (string,Hash.hashval) Hashtbl.t
val pfgbvarh : (tm,string) Hashtbl.t
val pfgpfbvarh : (pf,string) Hashtbl.t
val pfghyph : (pf,string) Hashtbl.t

val tp_pfg_str : tp -> string
val tm_pfg_str : tm -> string
val pf_pfg_str : pf -> string
val tm_pfg_decl : (string,unit) Hashtbl.t -> (string,string * tp * (tm option)) Hashtbl.t -> tm -> unit
val pf_pfg_decl : (string,unit) Hashtbl.t -> (string,string * tp * (tm option)) Hashtbl.t -> (string,tm) Hashtbl.t -> pf -> unit

val pfg_prim_id_p : string -> bool

val tp_ocaml : tp -> string

val hoas_nil : unit -> tm
val hoas_byte : int -> tm
val hoas_pair : tm -> tm -> tm

val normalize_pf : pf -> pf
val optimize_pf_1 : pf -> pf
val optimize_pf_2 : (string,ptm) Hashtbl.t -> (string,ptp) Hashtbl.t -> pf -> int -> int -> pf

exception NotFO
val tptpize_name : string -> string
val tptp_id_name : (string,string * tp) Hashtbl.t
val fof_trm_str : tm -> (string * tp) list -> string
val fof_prop_str : tm -> (string * tp) list -> string
val th0_str : tm -> (string * tp) list -> string
val th0_stp_str : tp -> string
val fof_def_str : tp -> string -> tm -> string
val th0_def_str : tp -> string -> tm -> string

val beta_report : unit -> unit

val logicop : (string,unit) Hashtbl.t
val tm_deps : tm -> tm list
