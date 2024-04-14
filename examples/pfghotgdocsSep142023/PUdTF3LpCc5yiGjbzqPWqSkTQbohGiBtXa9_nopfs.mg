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
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_ref : (forall x0, equip x0 x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition TwoRamseyProp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_6 : nat_p 6.
Axiom missingprop_a573fcf5678da4095e6e3bf5046c3135bfe4188e3dfb53e0dc34f5c73e140904 : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, forall x5 : set -> set, equip x0 x1 -> bij x2 x3 x5 -> (forall x6 : prop, (forall x7, and (x7 c= x2) (and (equip x0 x7) (forall x8, x8 :e x7 -> (forall x9, x9 :e x7 -> (x8 = x9 -> (forall x10 : prop, x10)) -> x4 (x5 x8) (x5 x9)))) -> x6) -> x6) -> (forall x6 : prop, (forall x7, and (x7 c= x3) (and (equip x1 x7) (forall x8, x8 :e x7 -> (forall x9, x9 :e x7 -> (x8 = x9 -> (forall x10 : prop, x10)) -> x4 x8 x9))) -> x6) -> x6)).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Axiom missingprop_637144c754e35176e5f73e9789b35a2d801de40f26463f5ae01a3b9c5aad6047 : (forall x0 x1 x2, (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> equip 3 (SetAdjoin (UPair x0 x1) x2)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_bc68040e974dbfe11adf82b9099a81283bbbef3b5681189ad5be3c2adcfe85d6 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 :e 6 -> (forall x2, x2 :e 6 -> (forall x3, x3 :e 6 -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x1 x2 -> x0 x1 x3 -> x0 x2 x3 -> (forall x4 : prop, (forall x5, and (x5 c= 6) (and (equip 3 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x0 x6 x7))) -> x4) -> x4))))).
admit.
Qed.
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom In_0_4 : 0 :e 4.
Axiom In_1_4 : 1 :e 4.
Axiom In_0_6 : 0 :e 6.
Axiom In_1_6 : 1 :e 6.
Axiom In_4_6 : 4 :e 6.
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom neq_4_0 : 4 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_1 : 4 = 1 -> (forall x0 : prop, x0).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom In_5_6 : 5 :e 6.
Axiom neq_5_0 : 5 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_1 : 5 = 1 -> (forall x0 : prop, x0).
Axiom In_2_4 : 2 :e 4.
Axiom In_2_6 : 2 :e 6.
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Axiom neq_4_2 : 4 = 2 -> (forall x0 : prop, x0).
Axiom neq_5_2 : 5 = 2 -> (forall x0 : prop, x0).
Axiom In_3_4 : 3 :e 4.
Axiom In_3_6 : 3 :e 6.
Axiom neq_3_0 : 3 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_3 : 4 = 3 -> (forall x0 : prop, x0).
Axiom neq_5_3 : 5 = 3 -> (forall x0 : prop, x0).
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Axiom neq_3_1 : 3 = 1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : 3 = 2 -> (forall x0 : prop, x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom In_4_5 : 4 :e 5.
Axiom neq_5_4 : 5 = 4 -> (forall x0 : prop, x0).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Theorem missingprop_aaed795e8d5c2653e9f652bec86f5ef354e81828f5a08710e4e31ae5a49671af : (forall x0 : set -> set -> prop, x0 0 4 -> x0 4 5 -> (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> or (forall x1 : prop, (forall x2, and (x2 c= 6) (and (equip 3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= 6) (and (equip 3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)).
admit.
Qed.
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Axiom cases_6 : (forall x0, x0 :e 6 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 x0)).
Axiom neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Theorem missingprop_6a985c2bc7f0f34dcb9cbf722df17cdf501e7087fca990e1fbbdb3baf2586ba2 : (forall x0 : set -> set -> prop, x0 4 5 -> (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> or (forall x1 : prop, (forall x2, and (x2 c= 6) (and (equip 3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= 6) (and (equip 3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)).
admit.
Qed.
Axiom pred_ext_2 : (forall x0 x1 : set -> prop, (forall x2, x0 x2 -> x1 x2) -> (forall x2, x1 x2 -> x0 x2) -> x0 = x1).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Theorem TwoRamseyProp_3_3_6 : TwoRamseyProp 3 3 6.
admit.
Qed.
