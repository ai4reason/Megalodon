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
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Theorem bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
admit.
Qed.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
Axiom bij_inv : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> bij x1 x0 (inv x0 x2)).
Theorem equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
admit.
Qed.
Axiom bij_comp : (forall x0 x1 x2, forall x3 x4 : set -> set, bij x0 x1 x3 -> bij x1 x2 x4 -> bij x0 x2 (fun x5 : set => x4 (x3 x5))).
Theorem equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
admit.
Qed.
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
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom nat_2 : nat_p 2.
Theorem nat_3 : nat_p 3.
admit.
Qed.
Theorem nat_4 : nat_p 4.
admit.
Qed.
Theorem nat_5 : nat_p 5.
admit.
Qed.
Theorem nat_6 : nat_p 6.
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom In_0_3 : 0 :e 3.
Axiom In_1_3 : 1 :e 3.
Axiom In_2_3 : 2 :e 3.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem missingprop_637144c754e35176e5f73e9789b35a2d801de40f26463f5ae01a3b9c5aad6047 : (forall x0 x1 x2, (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> equip 3 (SetAdjoin (UPair x0 x1) x2)).
admit.
Qed.
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Axiom or3I1 : (forall x0 x1 x2 : prop, x0 -> or (or x0 x1) x2).
Axiom or3I2 : (forall x0 x1 x2 : prop, x1 -> or (or x0 x1) x2).
Axiom or3I3 : (forall x0 x1 x2 : prop, x2 -> or (or x0 x1) x2).
Theorem missingprop_fc646236ea6fa2c5216d8ec2e38d12566b66120d90466cea118f2d1bb5862799 : (forall x0, equip 3 x0 -> (forall x1 : prop, (forall x2, and (x2 :e x0) (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, and (x6 :e x0) (and (and (and (x2 = x4 -> (forall x7 : prop, x7)) (x2 = x6 -> (forall x7 : prop, x7))) (x4 = x6 -> (forall x7 : prop, x7))) (forall x7, x7 :e x0 -> or (or (x7 = x2) (x7 = x4)) (x7 = x6))) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Axiom or3E : (forall x0 x1 x2 : prop, or (or x0 x1) x2 -> (forall x3 : prop, (x0 -> x3) -> (x1 -> x3) -> (x2 -> x3) -> x3)).
Theorem missingprop_3bd96be69aa6ec3eecd6f9001283ba634547e4583192e2f0725cac970b330516 : (forall x0, equip 3 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> (forall x6 : set -> prop, x6 x2 -> x6 x3 -> x6 x4 -> x6 x5)) -> x1))) -> x1)).
admit.
Qed.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_trichotomy_or : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (or (x0 :e x1) (x0 = x1)) (x1 :e x0)).
Theorem missingprop_52f8a335480a39f614bdbbb4820fe2cafed24ac53f89beb30df75c5a7784b948 : (forall x0, equip 3 x0 -> (forall x1, x1 :e x0 -> ordinal x1) -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 :e x3 -> x3 :e x4 -> (forall x5, x5 :e x0 -> (forall x6 : set -> prop, x6 x2 -> x6 x3 -> x6 x4 -> x6 x5)) -> x1))) -> x1)).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem missingprop_a573fcf5678da4095e6e3bf5046c3135bfe4188e3dfb53e0dc34f5c73e140904 : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, forall x5 : set -> set, equip x0 x1 -> bij x2 x3 x5 -> (forall x6 : prop, (forall x7, and (x7 c= x2) (and (equip x0 x7) (forall x8, x8 :e x7 -> (forall x9, x9 :e x7 -> (x8 = x9 -> (forall x10 : prop, x10)) -> x4 (x5 x8) (x5 x9)))) -> x6) -> x6) -> (forall x6 : prop, (forall x7, and (x7 c= x3) (and (equip x1 x7) (forall x8, x8 :e x7 -> (forall x9, x9 :e x7 -> (x8 = x9 -> (forall x10 : prop, x10)) -> x4 x8 x9))) -> x6) -> x6)).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_778a9720cb8792455dfca5e99a455e221880056d46e8a8a59f16ffc327d04233 : (forall x0 x1 x2 x3 x4 x5, equip x0 x3 -> equip x1 x4 -> equip x2 x5 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x3 x4 x5).
admit.
Qed.
