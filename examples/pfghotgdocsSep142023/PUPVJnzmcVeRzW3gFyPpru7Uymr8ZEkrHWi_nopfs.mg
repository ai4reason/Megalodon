Section Eq.
Variable A:SType.
Definition eq : A->A->prop := fun x y:A => forall Q:A->A->prop, Q x y -> Q y x.
End Eq.
Infix = 502 := eq.
Section Ex.
Variable A:SType.
Definition ex : (A->prop)->prop := fun Q:A->prop => forall P:prop, (forall x:A, Q x -> P) -> P.
End Ex.
(* Unicode exists "2203" *)
Binder+ exists , := ex.
(* Parameter Eps_i "174b78e53fc239e8c2aab4ab5a996a27e3e5741e88070dad186e05fb13f275e5" *)
Parameter Eps_i : (set->prop)->set.
Parameter In:set->set->prop.
Parameter Empty : set.
(* Unicode Union "22C3" *)
Parameter Union : set->set.
(* Unicode Power "1D4AB" *)
Parameter Power : set->set.
Parameter Repl : set -> (set -> set) -> set.
Notation Repl Repl.
Parameter UnivOf : set->set.
(* Parameter u24 "9a20092e34f76c3487a8ba76804c9325515e6c119eea9f7411777ec0a733bf91" "2e737a3b857301a25389cf7e02bb12d25fab5e9eda6266671eaec9b91ed87775" *)
Parameter u24 : set.
(* Parameter ChurchNum_3ary_proj_p "78818644393f655899ed66a6ea1895888ada3b8d13ff9c597d58fa85a63bf0f6" "7456b6c71eb4ddcebbca14f4614c76d44aff25ab9cffb2ae54f53cc5f4f73fab" *)
Parameter ChurchNum_3ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop.
(* Parameter ChurchNum_8ary_proj_p "b8834674a20323fbc2d5825fbc6a8f71f60ca89b2847624a5b6872e9c48e11d4" "a77aece4cebaf8d8bb332a4fb87637d997f5b502af1a67214219293f72df800a" *)
Parameter ChurchNum_8ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
Definition u7 : set :=
 ordsucc u6.
Definition u8 : set :=
 ordsucc u7.
Definition u9 : set :=
 ordsucc u8.
Definition u10 : set :=
 ordsucc u9.
Definition u11 : set :=
 ordsucc u10.
Definition u12 : set :=
 ordsucc u11.
Definition u13 : set :=
 ordsucc u12.
Definition u14 : set :=
 ordsucc u13.
Definition u15 : set :=
 ordsucc u14.
Definition u16 : set :=
 ordsucc u15.
Definition u17 : set :=
 ordsucc u16.
Definition u18 : set :=
 ordsucc u17.
Definition u19 : set :=
 ordsucc u18.
Definition u20 : set :=
 ordsucc u19.
Definition u21 : set :=
 ordsucc u20.
Definition u22 : set :=
 ordsucc u21.
Definition u23 : set :=
 ordsucc u22.
Axiom missingprop_8af8461f254015a646490155b24cf6f4887874a2fe626569972cf084a5fef5e2 : (forall x0, x0 :e u24 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 u15 -> x1 u16 -> x1 u17 -> x1 u18 -> x1 u19 -> x1 u20 -> x1 u21 -> x1 u22 -> x1 u23 -> x1 x0)).
Axiom missingprop_b3205a5f97a9b7efdf9cf8b544efa479d104ae9763ca62a574fc2597b5138348 : ChurchNum_3ary_proj_p (fun x0 x1 x2 : (set -> set) -> set -> set => x0).
Axiom missingprop_c81ed2e9a17c355a8eba784e3f7c99474839bcd57b59bf65a4f5f4cc009847ea : ChurchNum_8ary_proj_p (fun x0 x1 x2 x3 x4 x5 x6 x7 : (set -> set) -> set -> set => x0).
Axiom missingprop_f798ca89c8567ea7da8a78160d7cd47b3d0207ab1034ef92a2ea3a0a4b916fbc : ChurchNum_8ary_proj_p (fun x0 x1 x2 x3 x4 x5 x6 x7 : (set -> set) -> set -> set => x1).
Axiom missingprop_d79e0593f17494e6d5530254550ecb02b8a6cc10f6aea3b51be08ce73cab44ac : ChurchNum_8ary_proj_p (fun x0 x1 x2 x3 x4 x5 x6 x7 : (set -> set) -> set -> set => x2).
Axiom missingprop_a820edf1df6b5c92668217259c75ae523851dd9fb028042bb6e14985c16976ff : ChurchNum_8ary_proj_p (fun x0 x1 x2 x3 x4 x5 x6 x7 : (set -> set) -> set -> set => x3).
Axiom missingprop_77373a2933cfcb1a37334b719eb77edf1b1748d9da47ba868185fa412d5cdec1 : ChurchNum_8ary_proj_p (fun x0 x1 x2 x3 x4 x5 x6 x7 : (set -> set) -> set -> set => x4).
Axiom missingprop_f0037219748a33909d912b9fce7a38be396bfa5941888bf986f5ecce1edf8391 : ChurchNum_8ary_proj_p (fun x0 x1 x2 x3 x4 x5 x6 x7 : (set -> set) -> set -> set => x5).
Axiom missingprop_ec1851fba031ceb8b36005ab5bb38ffa46592f2ab2b842c56650d2f5922b9cc8 : ChurchNum_8ary_proj_p (fun x0 x1 x2 x3 x4 x5 x6 x7 : (set -> set) -> set -> set => x6).
Axiom missingprop_30cfcf8bf34acb2c5ca68ea0e7be506d609e5867a4d4497397aad7d562af1dab : ChurchNum_8ary_proj_p (fun x0 x1 x2 x3 x4 x5 x6 x7 : (set -> set) -> set -> set => x7).
Axiom missingprop_e6edcda273718db468f4cfbb333cc08373d8662c42f27ca851ee375409a4b89e : ChurchNum_3ary_proj_p (fun x0 x1 x2 : (set -> set) -> set -> set => x1).
Axiom missingprop_f3fbe0dcd7af60cbd2c45144c1a80d31889ed8fd9e1689678c35da17d6e44ed6 : ChurchNum_3ary_proj_p (fun x0 x1 x2 : (set -> set) -> set -> set => x2).
Theorem missingprop_71f021c030b388b031b0cb54393cd4b453c65667caa2e250dac00458eefad39c : (forall x0, x0 :e u24 -> (forall x1 : prop, (forall x2 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x3 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x2 -> ChurchNum_8ary_proj_p x3 -> x0 = x2 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 x6)))))))) (fun x5 : set -> set => fun x6 : set => x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 (x5 x6)))))))))))))))) ordsucc (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x5 (x5 x6)) (fun x5 : set -> set => fun x6 : set => x5 (x5 (x5 x6))) (fun x5 : set -> set => fun x6 : set => x5 (x5 (x5 (x5 x6)))) (fun x5 : set -> set => fun x6 : set => x5 (x5 (x5 (x5 (x5 x6))))) (fun x5 : set -> set => fun x6 : set => x5 (x5 (x5 (x5 (x5 (x5 x6)))))) (fun x5 : set -> set => fun x6 : set => x5 (x5 (x5 (x5 (x5 (x5 (x5 x6))))))) ordsucc 0) -> x1) -> x1)).
admit.
Qed.
