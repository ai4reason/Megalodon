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
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Axiom SingI : (forall x0, x0 :e Sing x0).
Theorem not_Empty_eq_Sing : (forall x0, Empty = Sing x0 -> (forall x1 : prop, x1)).
admit.
Qed.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Theorem not_Empty_eq_UPair : (forall x0 x1, Empty = UPair x0 x1 -> (forall x2 : prop, x2)).
admit.
Qed.
Theorem nIn_not_eq_Sing : (forall x0 x1, nIn x0 x1 -> x1 = Sing x0 -> (forall x2 : prop, x2)).
admit.
Qed.
Theorem nIn_not_eq_UPair_1 : (forall x0 x1 x2, nIn x0 x2 -> x2 = UPair x0 x1 -> (forall x3 : prop, x3)).
admit.
Qed.
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Theorem nIn_not_eq_UPair_2 : (forall x0 x1 x2, nIn x1 x2 -> x2 = UPair x0 x1 -> (forall x3 : prop, x3)).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Theorem In_Power_ordsucc_cases_impred : (forall x0 x1, x1 :e Power (ordsucc x0) -> (forall x2 : prop, (x1 :e Power x0 -> x2) -> (x0 :e x1 -> setminus x1 (Sing x0) :e Power x0 -> x2) -> x2)).
admit.
Qed.
Axiom Power_0_Sing_0 : Power 0 = Sing 0.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Theorem In_Power_0_eq_0 : (forall x0, x0 :e Power 0 -> x0 = 0).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom In_0_1 : 0 :e 1.
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Theorem In_Power_1_cases_impred : (forall x0, x0 :e Power 1 -> (forall x1 : prop, (x0 = 0 -> x1) -> (x0 = 1 -> x1) -> x1)).
admit.
Qed.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem In_Power_2_cases_impred : (forall x0, x0 :e Power 2 -> (forall x1 : prop, (x0 = 0 -> x1) -> (x0 = 1 -> x1) -> (x0 = Sing 1 -> x1) -> (x0 = 2 -> x1) -> x1)).
admit.
Qed.
Axiom cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Axiom In_0_2 : 0 :e 2.
Axiom In_1_2 : 1 :e 2.
Theorem In_Power_3_cases_impred : (forall x0, x0 :e Power 3 -> (forall x1 : prop, (x0 = 0 -> x1) -> (x0 = 1 -> x1) -> (x0 = Sing 1 -> x1) -> (x0 = 2 -> x1) -> (x0 = Sing 2 -> x1) -> (x0 = UPair 0 2 -> x1) -> (x0 = UPair 1 2 -> x1) -> (x0 = 3 -> x1) -> x1)).
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Definition TwoRamseyProp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Axiom bij_inj : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> inj x0 x1 x2).
Theorem equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
admit.
Qed.
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem inj_comp : (forall x0 x1 x2, forall x3 x4 : set -> set, inj x0 x1 x3 -> inj x1 x2 x4 -> inj x0 x2 (fun x5 : set => x4 (x3 x5))).
admit.
Qed.
Axiom equip_ref : (forall x0, equip x0 x0).
Theorem atleastp_ref : (forall x0, atleastp x0 x0).
admit.
Qed.
Theorem atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
admit.
Qed.
Theorem Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Theorem nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
admit.
Qed.
