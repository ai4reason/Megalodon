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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Theorem exandE_i : (forall x0 x1 : set -> prop, (forall x2 : prop, (forall x3, and (x0 x3) (x1 x3) -> x2) -> x2) -> (forall x2 : prop, (forall x3, x0 x3 -> x1 x3 -> x2) -> x2)).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition If_Vo4 : prop -> ((((set -> prop) -> prop) -> prop) -> prop) -> ((((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop :=
 (fun x0 : prop => fun x1 x2 : (((set -> prop) -> prop) -> prop) -> prop => fun x3 : ((set -> prop) -> prop) -> prop => and (x0 -> x1 x3) (not x0 -> x2 x3)).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Axiom andEL : (forall x0 x1 : prop, and x0 x1 -> x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom notE : (forall x0 : prop, not x0 -> x0 -> False).
Theorem If_Vo4_1 : (forall x0 : prop, forall x1 x2 : (((set -> prop) -> prop) -> prop) -> prop, x0 -> If_Vo4 x0 x1 x2 = x1).
admit.
Qed.
Axiom andER : (forall x0 x1 : prop, and x0 x1 -> x1).
Theorem If_Vo4_0 : (forall x0 : prop, forall x1 x2 : (((set -> prop) -> prop) -> prop) -> prop, not x0 -> If_Vo4 x0 x1 x2 = x2).
admit.
Qed.
Definition Descr_Vo4 : (((((set -> prop) -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop :=
 (fun x0 : ((((set -> prop) -> prop) -> prop) -> prop) -> prop => fun x1 : ((set -> prop) -> prop) -> prop => forall x2 : (((set -> prop) -> prop) -> prop) -> prop, x0 x2 -> x2 x1).
Theorem Descr_Vo4_prop : (forall x0 : ((((set -> prop) -> prop) -> prop) -> prop) -> prop, (forall x1 : prop, (forall x2 : (((set -> prop) -> prop) -> prop) -> prop, x0 x2 -> x1) -> x1) -> (forall x1 x2 : (((set -> prop) -> prop) -> prop) -> prop, x0 x1 -> x0 x2 -> x1 = x2) -> x0 (Descr_Vo4 x0)).
admit.
Qed.
Definition missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 : (set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop) -> set -> ((((set -> prop) -> prop) -> prop) -> prop) -> prop :=
 (fun x0 : set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop => fun x1 : set => fun x2 : (((set -> prop) -> prop) -> prop) -> prop => forall x3 : set -> ((((set -> prop) -> prop) -> prop) -> prop) -> prop, (forall x4, forall x5 : set -> (((set -> prop) -> prop) -> prop) -> prop, (forall x6, x6 :e x4 -> x3 x6 (x5 x6)) -> x3 x4 (x0 x4 x5)) -> x3 x1 x2).
Definition In_rec_Vo4 : (set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop) -> set -> (((set -> prop) -> prop) -> prop) -> prop :=
 (fun x0 : set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop => fun x1 : set => Descr_Vo4 (missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 x0 x1)).
Theorem missingprop_baa64b0dc3150faa2aa910b1d0b43f6e89eea54fa7fdbb099eecf828a22d69a1 : (forall x0 : set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop, forall x1, forall x2 : set -> (((set -> prop) -> prop) -> prop) -> prop, (forall x3, x3 :e x1 -> missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 x0 x3 (x2 x3)) -> missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 x0 x1 (x0 x1 x2)).
admit.
Qed.
Theorem missingprop_349503f29d9bb3eb88f2a95e2ff0f1bcfaa0fba198d2c220380ae20870a8027c : (forall x0 : set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop, forall x1, forall x2 : (((set -> prop) -> prop) -> prop) -> prop, missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 x0 x1 x2 -> (forall x3 : prop, (forall x4 : set -> (((set -> prop) -> prop) -> prop) -> prop, and (forall x5, x5 :e x1 -> missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 x0 x5 (x4 x5)) (x2 = x0 x1 x4) -> x3) -> x3)).
admit.
Qed.
Axiom In_ind : (forall x0 : set -> prop, (forall x1, (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, x0 x1)).
Theorem missingprop_30ddc768878844a84528ac4e845a2f81437458ecc81ad73fcb6b32ab7dec1955 : (forall x0 : set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop, (forall x1, forall x2 x3 : set -> (((set -> prop) -> prop) -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 x3 : (((set -> prop) -> prop) -> prop) -> prop, missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 x0 x1 x2 -> missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 x0 x1 x3 -> x2 = x3)).
admit.
Qed.
Theorem missingprop_5f32da66d57eeaba7a1d19841e1b8f1005019fa8fa58df386168e4a64dad34fb : (forall x0 : set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop, (forall x1, forall x2 x3 : set -> (((set -> prop) -> prop) -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 x0 x1 (In_rec_Vo4 x0 x1))).
admit.
Qed.
Theorem missingprop_549ed4d6ab13405e2f934e782135a7d2cf08b083a9012f7772cc79fa3b0026c5 : (forall x0 : set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop, (forall x1, forall x2 x3 : set -> (((set -> prop) -> prop) -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_5ed645fb6b5ecb05bd37bd214a6a27de649586e56c38f3c33df707b33562f269 x0 x1 (x0 x1 (In_rec_Vo4 x0)))).
admit.
Qed.
Theorem In_rec_Vo4_eq : (forall x0 : set -> (set -> (((set -> prop) -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop, (forall x1, forall x2 x3 : set -> (((set -> prop) -> prop) -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : ((((set -> prop) -> prop) -> prop) -> prop) -> ((((set -> prop) -> prop) -> prop) -> prop) -> prop, x2 (In_rec_Vo4 x0 x1) (x0 x1 (In_rec_Vo4 x0)) -> x2 (x0 x1 (In_rec_Vo4 x0)) (In_rec_Vo4 x0 x1))).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom not_and_or_demorgan : (forall x0 x1 : prop, not (and x0 x1) -> or (not x0) (not x1)).
Theorem eq_imp_or : (fun x1 x2 : prop => x1 -> x2) = (fun x1 : prop => or (not x1)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Subq_contra : (forall x0 x1 x2, x0 c= x1 -> nIn x2 x1 -> nIn x2 x0).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom Subq_Empty : (forall x0, Empty c= x0).
Axiom Empty_Subq_eq : (forall x0, x0 c= Empty -> x0 = Empty).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = Empty).
Axiom UnionE : (forall x0 x1, x1 :e Union x0 -> (forall x2 : prop, (forall x3, and (x1 :e x3) (x3 :e x0) -> x2) -> x2)).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Axiom Union_Empty : Union Empty = Empty.
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Axiom Union_Power_Subq : (forall x0, Union (Power x0) c= x0).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom Repl_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (Repl Empty x0) Empty -> x1 Empty (Repl Empty x0)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom ReplEq_ext_sub : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Repl x0 x1 c= Repl x0 x2).
Axiom ReplEq_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Repl x0 x1 = Repl x0 x2).
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom missingprop_41df03d7391f8ab64a94521b5b73d37be1e15da3e6364796447f828200c63f8e : (forall x0 x1, UPair x0 x1 c= UPair x1 x0).
Axiom UPair_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (UPair x0 x1) (UPair x1 x0) -> x2 (UPair x1 x0) (UPair x0 x1)).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom Empty_In_Power : (forall x0, Empty :e Power x0).
Axiom Power_0_Sing_0 : Power Empty = Sing Empty.
Axiom Repl_UPair : (forall x0 : set -> set, forall x1 x2, forall x3 : set -> set -> prop, x3 (Repl (UPair x1 x2) x0) (UPair (x0 x1) (x0 x2)) -> x3 (UPair (x0 x1) (x0 x2)) (Repl (UPair x1 x2) x0)).
Axiom Repl_Sing : (forall x0 : set -> set, forall x1, forall x2 : set -> set -> prop, x2 (Repl (Sing x1) x0) (Sing (x0 x1)) -> x2 (Sing (x0 x1)) (Repl (Sing x1) x0)).
Axiom ReplE : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = x1 x4) -> x3) -> x3)).
Definition famunion : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => Union (Repl x0 x1)).
Axiom UnionI : (forall x0 x1 x2, x1 :e x2 -> x2 :e x0 -> x1 :e Union x0).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom UnionE_impred : (forall x0 x1, x1 :e Union x0 -> (forall x2 : prop, (forall x3, x1 :e x3 -> x3 :e x0 -> x2) -> x2)).
Axiom famunionE : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 :e x1 x4) -> x3) -> x3)).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom UnionEq_famunionId : (forall x0, forall x1 : set -> set -> prop, x1 (Union x0) (famunion x0 (fun x2 : set => x2)) -> x1 (famunion x0 (fun x2 : set => x2)) (Union x0)).
Axiom ReplEq_famunion_Sing : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (Repl x0 x1) (famunion x0 (fun x3 : set => Sing (x1 x3))) -> x2 (famunion x0 (fun x3 : set => Sing (x1 x3))) (Repl x0 x1)).
Theorem Empty_or_ex : (forall x0, or (x0 = Empty) (forall x1 : prop, (forall x2, x2 :e x0 -> x1) -> x1)).
admit.
Qed.
