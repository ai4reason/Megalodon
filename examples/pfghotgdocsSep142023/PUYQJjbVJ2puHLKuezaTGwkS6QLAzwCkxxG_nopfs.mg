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
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Definition pair_tag : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => binunion x1 {SetAdjoin x3 x0 | x3 :e x2}).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Theorem ctagged_notin_F : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> nIn (SetAdjoin x3 x0) x2)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Theorem ctagged_eqE_Subq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> (forall x4, x4 :e x2 -> (forall x5, SetAdjoin x4 x0 = SetAdjoin x5 x0 -> x4 c= x5)))).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem ctagged_eqE_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x3 -> SetAdjoin x4 x0 = SetAdjoin x5 x0 -> x4 = x5)))).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem pair_tag_prop_1_Subq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 x4 x5, x1 x2 -> pair_tag x0 x2 x3 = pair_tag x0 x4 x5 -> x2 c= x4)).
admit.
Qed.
Theorem pair_tag_prop_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 x4 x5, x1 x2 -> x1 x4 -> pair_tag x0 x2 x3 = pair_tag x0 x4 x5 -> x2 = x4)).
admit.
Qed.
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem pair_tag_prop_2_Subq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 x4 x5, x1 x3 -> x1 x4 -> x1 x5 -> pair_tag x0 x2 x3 = pair_tag x0 x4 x5 -> x3 c= x5)).
admit.
Qed.
Theorem pair_tag_prop_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 x4 x5, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> pair_tag x0 x2 x3 = pair_tag x0 x4 x5 -> x3 = x5)).
admit.
Qed.
Axiom Repl_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (Repl Empty x0) Empty -> x1 Empty (Repl Empty x0)).
Axiom binunion_idr : (forall x0, forall x1 : set -> set -> prop, x1 (binunion x0 Empty) x0 -> x1 x0 (binunion x0 Empty)).
Theorem pair_tag_0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, forall x3 : set -> set -> prop, x3 (pair_tag x0 x2 Empty) x2 -> x3 x2 (pair_tag x0 x2 Empty))).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition CD_carr : set -> (set -> prop) -> set -> prop :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => forall x3 : prop, (forall x4, and (x1 x4) (forall x5 : prop, (forall x6, and (x1 x6) (x2 = pair_tag x0 x4 x6) -> x5) -> x5) -> x3) -> x3).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem CD_carr_I : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> CD_carr x0 x1 (pair_tag x0 x2 x3))).
admit.
Qed.
Theorem CD_carr_E : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> (forall x3 : set -> prop, (forall x4 x5, x1 x4 -> x1 x5 -> x2 = pair_tag x0 x4 x5 -> x3 (pair_tag x0 x4 x5)) -> x3 x2))).
admit.
Qed.
Theorem CD_carr_0ext : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> x1 Empty -> (forall x2, x1 x2 -> CD_carr x0 x1 x2)).
admit.
Qed.
Definition CD_proj0 : set -> (set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => Eps_i (fun x3 : set => and (x1 x3) (forall x4 : prop, (forall x5, and (x1 x5) (x2 = pair_tag x0 x3 x5) -> x4) -> x4))).
Definition CD_proj1 : set -> (set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => Eps_i (fun x3 : set => and (x1 x3) (x2 = pair_tag x0 (CD_proj0 x0 x1 x2) x3))).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem CD_proj0_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> and (x1 (CD_proj0 x0 x1 x2)) (forall x3 : prop, (forall x4, and (x1 x4) (x2 = pair_tag x0 (CD_proj0 x0 x1 x2) x4) -> x3) -> x3))).
admit.
Qed.
Theorem CD_proj0_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> CD_proj0 x0 x1 (pair_tag x0 x2 x3) = x2)).
admit.
Qed.
Theorem CD_proj1_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> and (x1 (CD_proj1 x0 x1 x2)) (x2 = pair_tag x0 (CD_proj0 x0 x1 x2) (CD_proj1 x0 x1 x2)))).
admit.
Qed.
Theorem CD_proj1_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> CD_proj1 x0 x1 (pair_tag x0 x2 x3) = x3)).
admit.
Qed.
Theorem CD_proj0R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> x1 (CD_proj0 x0 x1 x2))).
admit.
Qed.
Theorem CD_proj1R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> x1 (CD_proj1 x0 x1 x2))).
admit.
Qed.
Theorem CD_proj0proj1_eta : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> x2 = pair_tag x0 (CD_proj0 x0 x1 x2) (CD_proj1 x0 x1 x2))).
admit.
Qed.
Theorem CD_proj0proj1_split : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, CD_carr x0 x1 x2 -> CD_carr x0 x1 x3 -> CD_proj0 x0 x1 x2 = CD_proj0 x0 x1 x3 -> CD_proj1 x0 x1 x2 = CD_proj1 x0 x1 x3 -> x2 = x3)).
admit.
Qed.
Theorem CD_proj0_F : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> x1 Empty -> (forall x2, x1 x2 -> CD_proj0 x0 x1 x2 = x2)).
admit.
Qed.
Theorem CD_proj1_F : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> x1 Empty -> (forall x2, x1 x2 -> CD_proj1 x0 x1 x2 = Empty)).
admit.
Qed.
Definition CD_minus : set -> (set -> prop) -> (set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set -> set => fun x3 : set => pair_tag x0 (x2 (CD_proj0 x0 x1 x3)) (x2 (CD_proj1 x0 x1 x3))).
Definition CD_conj : set -> (set -> prop) -> (set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 x3 : set -> set => fun x4 : set => pair_tag x0 (x3 (CD_proj0 x0 x1 x4)) (x2 (CD_proj1 x0 x1 x4))).
Definition CD_add : set -> (set -> prop) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set -> set -> set => fun x3 x4 : set => pair_tag x0 (x2 (CD_proj0 x0 x1 x3) (CD_proj0 x0 x1 x4)) (x2 (CD_proj1 x0 x1 x3) (CD_proj1 x0 x1 x4))).
Definition CD_mul : set -> (set -> prop) -> (set -> set) -> (set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 x3 : set -> set => fun x4 x5 : set -> set -> set => fun x6 x7 : set => pair_tag x0 (x4 (x5 (CD_proj0 x0 x1 x6) (CD_proj0 x0 x1 x7)) (x2 (x5 (x3 (CD_proj1 x0 x1 x7)) (CD_proj1 x0 x1 x6)))) (x4 (x5 (CD_proj1 x0 x1 x7) (CD_proj0 x0 x1 x6)) (x5 (CD_proj1 x0 x1 x6) (x3 (CD_proj0 x0 x1 x7))))).
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition CD_exp_nat : set -> (set -> prop) -> (set -> set) -> (set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 x3 : set -> set => fun x4 x5 : set -> set -> set => fun x6 : set => nat_primrec 1 (fun x7 : set => CD_mul x0 x1 x2 x3 x4 x5 x6)).
Theorem CD_minus_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, CD_carr x0 x1 x3 -> CD_carr x0 x1 (CD_minus x0 x1 x2 x3)))).
admit.
Qed.
Theorem CD_minus_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, CD_carr x0 x1 x3 -> CD_proj0 x0 x1 (CD_minus x0 x1 x2 x3) = x2 (CD_proj0 x0 x1 x3)))).
admit.
Qed.
Theorem CD_minus_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, CD_carr x0 x1 x3 -> CD_proj1 x0 x1 (CD_minus x0 x1 x2 x3) = x2 (CD_proj1 x0 x1 x3)))).
admit.
Qed.
Theorem CD_conj_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3 : set -> set, (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_carr x0 x1 (CD_conj x0 x1 x2 x3 x4))))).
admit.
Qed.
Theorem CD_conj_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3 : set -> set, (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_proj0 x0 x1 (CD_conj x0 x1 x2 x3 x4) = x3 (CD_proj0 x0 x1 x4))))).
admit.
Qed.
Theorem CD_conj_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3 : set -> set, (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_proj1 x0 x1 (CD_conj x0 x1 x2 x3 x4) = x2 (CD_proj1 x0 x1 x4))))).
admit.
Qed.
Theorem CD_add_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_carr x0 x1 (CD_add x0 x1 x2 x3 x4)))).
admit.
Qed.
Theorem CD_add_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_proj0 x0 x1 (CD_add x0 x1 x2 x3 x4) = x2 (CD_proj0 x0 x1 x3) (CD_proj0 x0 x1 x4)))).
admit.
Qed.
Theorem CD_add_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_proj1 x0 x1 (CD_add x0 x1 x2 x3 x4) = x2 (CD_proj1 x0 x1 x3) (CD_proj1 x0 x1 x4)))).
admit.
Qed.
Theorem CD_mul_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_carr x0 x1 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7)))).
admit.
Qed.
Theorem CD_mul_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_proj0 x0 x1 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) = x4 (x5 (CD_proj0 x0 x1 x6) (CD_proj0 x0 x1 x7)) (x2 (x5 (x3 (CD_proj1 x0 x1 x7)) (CD_proj1 x0 x1 x6)))))).
admit.
Qed.
Theorem CD_mul_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_proj1 x0 x1 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) = x4 (x5 (CD_proj1 x0 x1 x7) (CD_proj0 x0 x1 x6)) (x5 (CD_proj1 x0 x1 x6) (x3 (CD_proj0 x0 x1 x7)))))).
admit.
Qed.
Theorem CD_minus_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, x1 0 -> x2 0 = 0 -> (forall x3, x1 x3 -> CD_minus x0 x1 x2 x3 = x2 x3))).
admit.
Qed.
Theorem CD_conj_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, x1 0 -> x2 0 = 0 -> (forall x3 : set -> set, forall x4, x1 x4 -> CD_conj x0 x1 x2 x3 x4 = x3 x4))).
admit.
Qed.
Theorem CD_add_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, x1 0 -> x2 0 0 = 0 -> (forall x3 x4, x1 x3 -> x1 x4 -> CD_add x0 x1 x2 x3 x4 = x2 x3 x4))).
admit.
Qed.
Theorem CD_mul_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> x2 0 = 0 -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6 x7, x1 x6 -> x1 x7 -> CD_mul x0 x1 x2 x3 x4 x5 x6 x7 = x5 x6 x7))).
admit.
Qed.
Theorem CD_minus_invol : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, x1 x3 -> x2 (x2 x3) = x3) -> (forall x3, CD_carr x0 x1 x3 -> CD_minus x0 x1 x2 (CD_minus x0 x1 x2 x3) = x3))).
admit.
Qed.
Theorem CD_conj_invol : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, x1 x4 -> x2 (x2 x4) = x4) -> (forall x4, x1 x4 -> x3 (x3 x4) = x4) -> (forall x4, CD_carr x0 x1 x4 -> CD_conj x0 x1 x2 x3 (CD_conj x0 x1 x2 x3 x4) = x4))).
admit.
Qed.
Theorem CD_conj_minus : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, x1 x4 -> x3 (x2 x4) = x2 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_conj x0 x1 x2 x3 (CD_minus x0 x1 x2 x4) = CD_minus x0 x1 x2 (CD_conj x0 x1 x2 x3 x4)))).
admit.
Qed.
Theorem CD_minus_add : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, forall x3 : set -> set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4 x5, x1 x4 -> x1 x5 -> x1 (x3 x4 x5)) -> (forall x4 x5, x1 x4 -> x1 x5 -> x2 (x3 x4 x5) = x3 (x2 x4) (x2 x5)) -> (forall x4 x5, CD_carr x0 x1 x4 -> CD_carr x0 x1 x5 -> CD_minus x0 x1 x2 (CD_add x0 x1 x3 x4 x5) = CD_add x0 x1 x3 (CD_minus x0 x1 x2 x4) (CD_minus x0 x1 x2 x5)))).
admit.
Qed.
Theorem CD_conj_add : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 : set -> set -> set, (forall x5, x1 x5 -> x1 (x2 x5)) -> (forall x5, x1 x5 -> x1 (x3 x5)) -> (forall x5 x6, x1 x5 -> x1 x6 -> x1 (x4 x5 x6)) -> (forall x5 x6, x1 x5 -> x1 x6 -> x2 (x4 x5 x6) = x4 (x2 x5) (x2 x6)) -> (forall x5 x6, x1 x5 -> x1 x6 -> x3 (x4 x5 x6) = x4 (x3 x5) (x3 x6)) -> (forall x5 x6, CD_carr x0 x1 x5 -> CD_carr x0 x1 x6 -> CD_conj x0 x1 x2 x3 (CD_add x0 x1 x4 x5 x6) = CD_add x0 x1 x4 (CD_conj x0 x1 x2 x3 x5) (CD_conj x0 x1 x2 x3 x6)))).
admit.
Qed.
Theorem CD_add_com : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x2 x3 x4 = x2 x4 x3) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_add x0 x1 x2 x3 x4 = CD_add x0 x1 x2 x4 x3))).
admit.
Qed.
Theorem CD_add_assoc : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4 x5, x1 x3 -> x1 x4 -> x1 x5 -> x2 (x2 x3 x4) x5 = x2 x3 (x2 x4 x5)) -> (forall x3 x4 x5, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_carr x0 x1 x5 -> CD_add x0 x1 x2 (CD_add x0 x1 x2 x3 x4) x5 = CD_add x0 x1 x2 x3 (CD_add x0 x1 x2 x4 x5)))).
admit.
Qed.
Theorem CD_add_0R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, x1 0 -> (forall x3, x1 x3 -> x2 x3 0 = x3) -> (forall x3, CD_carr x0 x1 x3 -> CD_add x0 x1 x2 x3 0 = x3))).
admit.
Qed.
Theorem CD_add_0L : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, x1 0 -> (forall x3, x1 x3 -> x2 0 x3 = x3) -> (forall x3, CD_carr x0 x1 x3 -> CD_add x0 x1 x2 0 x3 = x3))).
admit.
Qed.
Theorem CD_add_minus_linv : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, forall x3 : set -> set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x3 (x2 x4) x4 = 0) -> (forall x4, CD_carr x0 x1 x4 -> CD_add x0 x1 x3 (CD_minus x0 x1 x2 x4) x4 = 0))).
admit.
Qed.
Theorem CD_add_minus_rinv : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, forall x3 : set -> set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x3 x4 (x2 x4) = 0) -> (forall x4, CD_carr x0 x1 x4 -> CD_add x0 x1 x3 x4 (CD_minus x0 x1 x2 x4) = 0))).
admit.
Qed.
Theorem CD_mul_0R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x2 0 = 0 -> x3 0 = 0 -> x4 0 0 = 0 -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 x6 0 = 0))).
admit.
Qed.
Theorem CD_mul_0L : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> (forall x6, x1 x6 -> x1 (x3 x6)) -> x2 0 = 0 -> x4 0 0 = 0 -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 0 x6 = 0))).
admit.
Qed.
Theorem CD_mul_1R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> x2 0 = 0 -> x3 0 = 0 -> x3 1 = 1 -> (forall x6, x1 x6 -> x4 0 x6 = x6) -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 x6 1 = x6))).
admit.
Qed.
Theorem CD_mul_1L : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> (forall x6, x1 x6 -> x1 (x3 x6)) -> x2 0 = 0 -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6, x1 x6 -> x5 1 x6 = x6) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 1 x6 = x6))).
admit.
Qed.
Theorem CD_conj_mul : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6, x1 x6 -> x2 (x2 x6) = x6) -> (forall x6, x1 x6 -> x3 (x3 x6) = x6) -> (forall x6, x1 x6 -> x3 (x2 x6) = x2 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x3 (x4 x6 x7) = x4 (x3 x6) (x3 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x4 x6 x7 = x4 x7 x6) -> (forall x6 x7, x1 x6 -> x1 x7 -> x3 (x5 x6 x7) = x5 (x3 x7) (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 x6 (x2 x7) = x2 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 (x2 x6) x7 = x2 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_conj x0 x1 x2 x3 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) = CD_mul x0 x1 x2 x3 x4 x5 (CD_conj x0 x1 x2 x3 x7) (CD_conj x0 x1 x2 x3 x6)))).
admit.
Qed.
Theorem CD_add_mul_distrR : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x4 (x4 x6 x7) x8 = x4 x6 (x4 x7 x8)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x4 x6 x7 = x4 x7 x6) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 x6 (x4 x7 x8) = x4 (x5 x6 x7) (x5 x6 x8)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 (x4 x6 x7) x8 = x4 (x5 x6 x8) (x5 x7 x8)) -> (forall x6 x7 x8, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_carr x0 x1 x8 -> CD_mul x0 x1 x2 x3 x4 x5 (CD_add x0 x1 x4 x6 x7) x8 = CD_add x0 x1 x4 (CD_mul x0 x1 x2 x3 x4 x5 x6 x8) (CD_mul x0 x1 x2 x3 x4 x5 x7 x8)))).
admit.
Qed.
Theorem CD_add_mul_distrL : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x3 (x4 x6 x7) = x4 (x3 x6) (x3 x7)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x4 (x4 x6 x7) x8 = x4 x6 (x4 x7 x8)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x4 x6 x7 = x4 x7 x6) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 x6 (x4 x7 x8) = x4 (x5 x6 x7) (x5 x6 x8)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 (x4 x6 x7) x8 = x4 (x5 x6 x8) (x5 x7 x8)) -> (forall x6 x7 x8, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_carr x0 x1 x8 -> CD_mul x0 x1 x2 x3 x4 x5 x6 (CD_add x0 x1 x4 x7 x8) = CD_add x0 x1 x4 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) (CD_mul x0 x1 x2 x3 x4 x5 x6 x8)))).
admit.
Qed.
Theorem CD_minus_mul_distrR : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6, x1 x6 -> x3 (x2 x6) = x2 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 x6 (x2 x7) = x2 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 (x2 x6) x7 = x2 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_mul x0 x1 x2 x3 x4 x5 x6 (CD_minus x0 x1 x2 x7) = CD_minus x0 x1 x2 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7)))).
admit.
Qed.
Theorem CD_minus_mul_distrL : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 x6 (x2 x7) = x2 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 (x2 x6) x7 = x2 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_mul x0 x1 x2 x3 x4 x5 (CD_minus x0 x1 x2 x6) x7 = CD_minus x0 x1 x2 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7)))).
admit.
Qed.
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem CD_exp_nat_0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, forall x6, forall x7 : set -> set -> prop, x7 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 0) 1 -> x7 1 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 0))).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Theorem CD_exp_nat_S : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, forall x6 x7, nat_p x7 -> CD_exp_nat x0 x1 x2 x3 x4 x5 x6 (ordsucc x7) = CD_mul x0 x1 x2 x3 x4 x5 x6 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 x7))).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Theorem CD_exp_nat_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> x1 0 -> x1 1 -> (forall x6, CD_carr x0 x1 x6 -> (forall x7, nat_p x7 -> CD_carr x0 x1 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 x7))))).
admit.
Qed.
