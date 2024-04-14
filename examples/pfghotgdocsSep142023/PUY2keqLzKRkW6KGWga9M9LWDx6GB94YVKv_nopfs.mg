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
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom minus_SNo_Le_swap : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 (add_SNo x1 (minus_SNo x2)) -> SNoLe (add_SNo x2 (minus_SNo x1)) (minus_SNo x0)).
Axiom SNo_1 : SNo 1.
Theorem minus_SNo_Le_swap_1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 1 (add_SNo x0 (minus_SNo x1)) -> SNoLe (add_SNo x1 (minus_SNo x0)) (minus_SNo 1)).
admit.
Qed.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom SNo_0 : SNo 0.
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom SNoLt_0_1 : SNoLt 0 1.
Theorem SNoLt_minus_1_0 : SNoLt (minus_SNo 1) 0.
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_ordsucc_SNo_eq : (forall x0, ordinal x0 -> ordsucc x0 = add_SNo 1 x0).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom add_SNo_minus_L2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (minus_SNo x0) (add_SNo x0 x1) = x1).
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Theorem add_minus_1_ordsucc : (forall x0, nat_p x0 -> add_SNo (minus_SNo 1) (ordsucc x0) = x0).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_Le3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Theorem idl_negcycle_2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x2 x3) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x2 -> SNoLe (add_SNo x0 (minus_SNo x1)) x3 -> False).
admit.
Qed.
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom add_SNo_com_3b_1_2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo (add_SNo x0 x1) x2 = add_SNo (add_SNo x0 x2) x1).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Theorem idl_negcycle_3 : (forall x0 x1 x2 x3 x4 x5, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNoLt (add_SNo x3 (add_SNo x4 x5)) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x3 -> SNoLe (add_SNo x2 (minus_SNo x1)) x4 -> SNoLe (add_SNo x0 (minus_SNo x2)) x5 -> False).
admit.
Qed.
Axiom idl_negcycle_4 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNoLt (add_SNo x4 (add_SNo x5 (add_SNo x6 x7))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x4 -> SNoLe (add_SNo x2 (minus_SNo x1)) x5 -> SNoLe (add_SNo x3 (minus_SNo x2)) x6 -> SNoLe (add_SNo x0 (minus_SNo x3)) x7 -> False).
Theorem idl_negcycle_5 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNoLt (add_SNo x5 (add_SNo x6 (add_SNo x7 (add_SNo x8 x9)))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x5 -> SNoLe (add_SNo x2 (minus_SNo x1)) x6 -> SNoLe (add_SNo x3 (minus_SNo x2)) x7 -> SNoLe (add_SNo x4 (minus_SNo x3)) x8 -> SNoLe (add_SNo x0 (minus_SNo x4)) x9 -> False).
admit.
Qed.
Theorem idl_negcycle_6 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNoLt (add_SNo x6 (add_SNo x7 (add_SNo x8 (add_SNo x9 (add_SNo x10 x11))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x6 -> SNoLe (add_SNo x2 (minus_SNo x1)) x7 -> SNoLe (add_SNo x3 (minus_SNo x2)) x8 -> SNoLe (add_SNo x4 (minus_SNo x3)) x9 -> SNoLe (add_SNo x5 (minus_SNo x4)) x10 -> SNoLe (add_SNo x0 (minus_SNo x5)) x11 -> False).
admit.
Qed.
Theorem idl_negcycle_7 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNoLt (add_SNo x7 (add_SNo x8 (add_SNo x9 (add_SNo x10 (add_SNo x11 (add_SNo x12 x13)))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x7 -> SNoLe (add_SNo x2 (minus_SNo x1)) x8 -> SNoLe (add_SNo x3 (minus_SNo x2)) x9 -> SNoLe (add_SNo x4 (minus_SNo x3)) x10 -> SNoLe (add_SNo x5 (minus_SNo x4)) x11 -> SNoLe (add_SNo x6 (minus_SNo x5)) x12 -> SNoLe (add_SNo x0 (minus_SNo x6)) x13 -> False).
admit.
Qed.
Theorem idl_negcycle_8 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNoLt (add_SNo x8 (add_SNo x9 (add_SNo x10 (add_SNo x11 (add_SNo x12 (add_SNo x13 (add_SNo x14 x15))))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x8 -> SNoLe (add_SNo x2 (minus_SNo x1)) x9 -> SNoLe (add_SNo x3 (minus_SNo x2)) x10 -> SNoLe (add_SNo x4 (minus_SNo x3)) x11 -> SNoLe (add_SNo x5 (minus_SNo x4)) x12 -> SNoLe (add_SNo x6 (minus_SNo x5)) x13 -> SNoLe (add_SNo x7 (minus_SNo x6)) x14 -> SNoLe (add_SNo x0 (minus_SNo x7)) x15 -> False).
admit.
Qed.
Theorem idl_negcycle_9 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNoLt (add_SNo x9 (add_SNo x10 (add_SNo x11 (add_SNo x12 (add_SNo x13 (add_SNo x14 (add_SNo x15 (add_SNo x16 x17)))))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x9 -> SNoLe (add_SNo x2 (minus_SNo x1)) x10 -> SNoLe (add_SNo x3 (minus_SNo x2)) x11 -> SNoLe (add_SNo x4 (minus_SNo x3)) x12 -> SNoLe (add_SNo x5 (minus_SNo x4)) x13 -> SNoLe (add_SNo x6 (minus_SNo x5)) x14 -> SNoLe (add_SNo x7 (minus_SNo x6)) x15 -> SNoLe (add_SNo x8 (minus_SNo x7)) x16 -> SNoLe (add_SNo x0 (minus_SNo x8)) x17 -> False).
admit.
Qed.
Theorem idl_negcycle_10 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNoLt (add_SNo x10 (add_SNo x11 (add_SNo x12 (add_SNo x13 (add_SNo x14 (add_SNo x15 (add_SNo x16 (add_SNo x17 (add_SNo x18 x19))))))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x10 -> SNoLe (add_SNo x2 (minus_SNo x1)) x11 -> SNoLe (add_SNo x3 (minus_SNo x2)) x12 -> SNoLe (add_SNo x4 (minus_SNo x3)) x13 -> SNoLe (add_SNo x5 (minus_SNo x4)) x14 -> SNoLe (add_SNo x6 (minus_SNo x5)) x15 -> SNoLe (add_SNo x7 (minus_SNo x6)) x16 -> SNoLe (add_SNo x8 (minus_SNo x7)) x17 -> SNoLe (add_SNo x9 (minus_SNo x8)) x18 -> SNoLe (add_SNo x0 (minus_SNo x9)) x19 -> False).
admit.
Qed.
Theorem idl_negcycle_11 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNoLt (add_SNo x11 (add_SNo x12 (add_SNo x13 (add_SNo x14 (add_SNo x15 (add_SNo x16 (add_SNo x17 (add_SNo x18 (add_SNo x19 (add_SNo x20 x21)))))))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x11 -> SNoLe (add_SNo x2 (minus_SNo x1)) x12 -> SNoLe (add_SNo x3 (minus_SNo x2)) x13 -> SNoLe (add_SNo x4 (minus_SNo x3)) x14 -> SNoLe (add_SNo x5 (minus_SNo x4)) x15 -> SNoLe (add_SNo x6 (minus_SNo x5)) x16 -> SNoLe (add_SNo x7 (minus_SNo x6)) x17 -> SNoLe (add_SNo x8 (minus_SNo x7)) x18 -> SNoLe (add_SNo x9 (minus_SNo x8)) x19 -> SNoLe (add_SNo x10 (minus_SNo x9)) x20 -> SNoLe (add_SNo x0 (minus_SNo x10)) x21 -> False).
admit.
Qed.
Theorem idl_negcycle_12 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNoLt (add_SNo x12 (add_SNo x13 (add_SNo x14 (add_SNo x15 (add_SNo x16 (add_SNo x17 (add_SNo x18 (add_SNo x19 (add_SNo x20 (add_SNo x21 (add_SNo x22 x23))))))))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x12 -> SNoLe (add_SNo x2 (minus_SNo x1)) x13 -> SNoLe (add_SNo x3 (minus_SNo x2)) x14 -> SNoLe (add_SNo x4 (minus_SNo x3)) x15 -> SNoLe (add_SNo x5 (minus_SNo x4)) x16 -> SNoLe (add_SNo x6 (minus_SNo x5)) x17 -> SNoLe (add_SNo x7 (minus_SNo x6)) x18 -> SNoLe (add_SNo x8 (minus_SNo x7)) x19 -> SNoLe (add_SNo x9 (minus_SNo x8)) x20 -> SNoLe (add_SNo x10 (minus_SNo x9)) x21 -> SNoLe (add_SNo x11 (minus_SNo x10)) x22 -> SNoLe (add_SNo x0 (minus_SNo x11)) x23 -> False).
admit.
Qed.
Theorem idl_negcycle_13 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNoLt (add_SNo x13 (add_SNo x14 (add_SNo x15 (add_SNo x16 (add_SNo x17 (add_SNo x18 (add_SNo x19 (add_SNo x20 (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 x25)))))))))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x13 -> SNoLe (add_SNo x2 (minus_SNo x1)) x14 -> SNoLe (add_SNo x3 (minus_SNo x2)) x15 -> SNoLe (add_SNo x4 (minus_SNo x3)) x16 -> SNoLe (add_SNo x5 (minus_SNo x4)) x17 -> SNoLe (add_SNo x6 (minus_SNo x5)) x18 -> SNoLe (add_SNo x7 (minus_SNo x6)) x19 -> SNoLe (add_SNo x8 (minus_SNo x7)) x20 -> SNoLe (add_SNo x9 (minus_SNo x8)) x21 -> SNoLe (add_SNo x10 (minus_SNo x9)) x22 -> SNoLe (add_SNo x11 (minus_SNo x10)) x23 -> SNoLe (add_SNo x12 (minus_SNo x11)) x24 -> SNoLe (add_SNo x0 (minus_SNo x12)) x25 -> False).
admit.
Qed.
Theorem idl_negcycle_14 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNoLt (add_SNo x14 (add_SNo x15 (add_SNo x16 (add_SNo x17 (add_SNo x18 (add_SNo x19 (add_SNo x20 (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 x27))))))))))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x14 -> SNoLe (add_SNo x2 (minus_SNo x1)) x15 -> SNoLe (add_SNo x3 (minus_SNo x2)) x16 -> SNoLe (add_SNo x4 (minus_SNo x3)) x17 -> SNoLe (add_SNo x5 (minus_SNo x4)) x18 -> SNoLe (add_SNo x6 (minus_SNo x5)) x19 -> SNoLe (add_SNo x7 (minus_SNo x6)) x20 -> SNoLe (add_SNo x8 (minus_SNo x7)) x21 -> SNoLe (add_SNo x9 (minus_SNo x8)) x22 -> SNoLe (add_SNo x10 (minus_SNo x9)) x23 -> SNoLe (add_SNo x11 (minus_SNo x10)) x24 -> SNoLe (add_SNo x12 (minus_SNo x11)) x25 -> SNoLe (add_SNo x13 (minus_SNo x12)) x26 -> SNoLe (add_SNo x0 (minus_SNo x13)) x27 -> False).
admit.
Qed.
Theorem idl_negcycle_15 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNo x28 -> SNo x29 -> SNoLt (add_SNo x15 (add_SNo x16 (add_SNo x17 (add_SNo x18 (add_SNo x19 (add_SNo x20 (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 (add_SNo x27 (add_SNo x28 x29)))))))))))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x15 -> SNoLe (add_SNo x2 (minus_SNo x1)) x16 -> SNoLe (add_SNo x3 (minus_SNo x2)) x17 -> SNoLe (add_SNo x4 (minus_SNo x3)) x18 -> SNoLe (add_SNo x5 (minus_SNo x4)) x19 -> SNoLe (add_SNo x6 (minus_SNo x5)) x20 -> SNoLe (add_SNo x7 (minus_SNo x6)) x21 -> SNoLe (add_SNo x8 (minus_SNo x7)) x22 -> SNoLe (add_SNo x9 (minus_SNo x8)) x23 -> SNoLe (add_SNo x10 (minus_SNo x9)) x24 -> SNoLe (add_SNo x11 (minus_SNo x10)) x25 -> SNoLe (add_SNo x12 (minus_SNo x11)) x26 -> SNoLe (add_SNo x13 (minus_SNo x12)) x27 -> SNoLe (add_SNo x14 (minus_SNo x13)) x28 -> SNoLe (add_SNo x0 (minus_SNo x14)) x29 -> False).
admit.
Qed.
Theorem idl_negcycle_16 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNo x28 -> SNo x29 -> SNo x30 -> SNo x31 -> SNoLt (add_SNo x16 (add_SNo x17 (add_SNo x18 (add_SNo x19 (add_SNo x20 (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 (add_SNo x27 (add_SNo x28 (add_SNo x29 (add_SNo x30 x31))))))))))))))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x16 -> SNoLe (add_SNo x2 (minus_SNo x1)) x17 -> SNoLe (add_SNo x3 (minus_SNo x2)) x18 -> SNoLe (add_SNo x4 (minus_SNo x3)) x19 -> SNoLe (add_SNo x5 (minus_SNo x4)) x20 -> SNoLe (add_SNo x6 (minus_SNo x5)) x21 -> SNoLe (add_SNo x7 (minus_SNo x6)) x22 -> SNoLe (add_SNo x8 (minus_SNo x7)) x23 -> SNoLe (add_SNo x9 (minus_SNo x8)) x24 -> SNoLe (add_SNo x10 (minus_SNo x9)) x25 -> SNoLe (add_SNo x11 (minus_SNo x10)) x26 -> SNoLe (add_SNo x12 (minus_SNo x11)) x27 -> SNoLe (add_SNo x13 (minus_SNo x12)) x28 -> SNoLe (add_SNo x14 (minus_SNo x13)) x29 -> SNoLe (add_SNo x15 (minus_SNo x14)) x30 -> SNoLe (add_SNo x0 (minus_SNo x15)) x31 -> False).
admit.
Qed.
