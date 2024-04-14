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
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom idl_negcycle_16 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNo x28 -> SNo x29 -> SNo x30 -> SNo x31 -> SNoLt (add_SNo x16 (add_SNo x17 (add_SNo x18 (add_SNo x19 (add_SNo x20 (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 (add_SNo x27 (add_SNo x28 (add_SNo x29 (add_SNo x30 x31))))))))))))))) Empty -> SNoLe (add_SNo x1 (minus_SNo x0)) x16 -> SNoLe (add_SNo x2 (minus_SNo x1)) x17 -> SNoLe (add_SNo x3 (minus_SNo x2)) x18 -> SNoLe (add_SNo x4 (minus_SNo x3)) x19 -> SNoLe (add_SNo x5 (minus_SNo x4)) x20 -> SNoLe (add_SNo x6 (minus_SNo x5)) x21 -> SNoLe (add_SNo x7 (minus_SNo x6)) x22 -> SNoLe (add_SNo x8 (minus_SNo x7)) x23 -> SNoLe (add_SNo x9 (minus_SNo x8)) x24 -> SNoLe (add_SNo x10 (minus_SNo x9)) x25 -> SNoLe (add_SNo x11 (minus_SNo x10)) x26 -> SNoLe (add_SNo x12 (minus_SNo x11)) x27 -> SNoLe (add_SNo x13 (minus_SNo x12)) x28 -> SNoLe (add_SNo x14 (minus_SNo x13)) x29 -> SNoLe (add_SNo x15 (minus_SNo x14)) x30 -> SNoLe (add_SNo x0 (minus_SNo x15)) x31 -> False).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_0 : SNo Empty.
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom add_SNo_com_3b_1_2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo (add_SNo x0 x1) x2 = add_SNo (add_SNo x0 x2) x1).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem idl_negcycle_17 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNo x28 -> SNo x29 -> SNo x30 -> SNo x31 -> SNo x32 -> SNo x33 -> SNoLt (add_SNo x17 (add_SNo x18 (add_SNo x19 (add_SNo x20 (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 (add_SNo x27 (add_SNo x28 (add_SNo x29 (add_SNo x30 (add_SNo x31 (add_SNo x32 x33)))))))))))))))) Empty -> SNoLe (add_SNo x1 (minus_SNo x0)) x17 -> SNoLe (add_SNo x2 (minus_SNo x1)) x18 -> SNoLe (add_SNo x3 (minus_SNo x2)) x19 -> SNoLe (add_SNo x4 (minus_SNo x3)) x20 -> SNoLe (add_SNo x5 (minus_SNo x4)) x21 -> SNoLe (add_SNo x6 (minus_SNo x5)) x22 -> SNoLe (add_SNo x7 (minus_SNo x6)) x23 -> SNoLe (add_SNo x8 (minus_SNo x7)) x24 -> SNoLe (add_SNo x9 (minus_SNo x8)) x25 -> SNoLe (add_SNo x10 (minus_SNo x9)) x26 -> SNoLe (add_SNo x11 (minus_SNo x10)) x27 -> SNoLe (add_SNo x12 (minus_SNo x11)) x28 -> SNoLe (add_SNo x13 (minus_SNo x12)) x29 -> SNoLe (add_SNo x14 (minus_SNo x13)) x30 -> SNoLe (add_SNo x15 (minus_SNo x14)) x31 -> SNoLe (add_SNo x16 (minus_SNo x15)) x32 -> SNoLe (add_SNo x0 (minus_SNo x16)) x33 -> False).
admit.
Qed.
Theorem idl_negcycle_18 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNo x28 -> SNo x29 -> SNo x30 -> SNo x31 -> SNo x32 -> SNo x33 -> SNo x34 -> SNo x35 -> SNoLt (add_SNo x18 (add_SNo x19 (add_SNo x20 (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 (add_SNo x27 (add_SNo x28 (add_SNo x29 (add_SNo x30 (add_SNo x31 (add_SNo x32 (add_SNo x33 (add_SNo x34 x35))))))))))))))))) Empty -> SNoLe (add_SNo x1 (minus_SNo x0)) x18 -> SNoLe (add_SNo x2 (minus_SNo x1)) x19 -> SNoLe (add_SNo x3 (minus_SNo x2)) x20 -> SNoLe (add_SNo x4 (minus_SNo x3)) x21 -> SNoLe (add_SNo x5 (minus_SNo x4)) x22 -> SNoLe (add_SNo x6 (minus_SNo x5)) x23 -> SNoLe (add_SNo x7 (minus_SNo x6)) x24 -> SNoLe (add_SNo x8 (minus_SNo x7)) x25 -> SNoLe (add_SNo x9 (minus_SNo x8)) x26 -> SNoLe (add_SNo x10 (minus_SNo x9)) x27 -> SNoLe (add_SNo x11 (minus_SNo x10)) x28 -> SNoLe (add_SNo x12 (minus_SNo x11)) x29 -> SNoLe (add_SNo x13 (minus_SNo x12)) x30 -> SNoLe (add_SNo x14 (minus_SNo x13)) x31 -> SNoLe (add_SNo x15 (minus_SNo x14)) x32 -> SNoLe (add_SNo x16 (minus_SNo x15)) x33 -> SNoLe (add_SNo x17 (minus_SNo x16)) x34 -> SNoLe (add_SNo x0 (minus_SNo x17)) x35 -> False).
admit.
Qed.
Theorem idl_negcycle_19 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNo x28 -> SNo x29 -> SNo x30 -> SNo x31 -> SNo x32 -> SNo x33 -> SNo x34 -> SNo x35 -> SNo x36 -> SNo x37 -> SNoLt (add_SNo x19 (add_SNo x20 (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 (add_SNo x27 (add_SNo x28 (add_SNo x29 (add_SNo x30 (add_SNo x31 (add_SNo x32 (add_SNo x33 (add_SNo x34 (add_SNo x35 (add_SNo x36 x37)))))))))))))))))) Empty -> SNoLe (add_SNo x1 (minus_SNo x0)) x19 -> SNoLe (add_SNo x2 (minus_SNo x1)) x20 -> SNoLe (add_SNo x3 (minus_SNo x2)) x21 -> SNoLe (add_SNo x4 (minus_SNo x3)) x22 -> SNoLe (add_SNo x5 (minus_SNo x4)) x23 -> SNoLe (add_SNo x6 (minus_SNo x5)) x24 -> SNoLe (add_SNo x7 (minus_SNo x6)) x25 -> SNoLe (add_SNo x8 (minus_SNo x7)) x26 -> SNoLe (add_SNo x9 (minus_SNo x8)) x27 -> SNoLe (add_SNo x10 (minus_SNo x9)) x28 -> SNoLe (add_SNo x11 (minus_SNo x10)) x29 -> SNoLe (add_SNo x12 (minus_SNo x11)) x30 -> SNoLe (add_SNo x13 (minus_SNo x12)) x31 -> SNoLe (add_SNo x14 (minus_SNo x13)) x32 -> SNoLe (add_SNo x15 (minus_SNo x14)) x33 -> SNoLe (add_SNo x16 (minus_SNo x15)) x34 -> SNoLe (add_SNo x17 (minus_SNo x16)) x35 -> SNoLe (add_SNo x18 (minus_SNo x17)) x36 -> SNoLe (add_SNo x0 (minus_SNo x18)) x37 -> False).
admit.
Qed.
Theorem idl_negcycle_20 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37 x38 x39, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNo x28 -> SNo x29 -> SNo x30 -> SNo x31 -> SNo x32 -> SNo x33 -> SNo x34 -> SNo x35 -> SNo x36 -> SNo x37 -> SNo x38 -> SNo x39 -> SNoLt (add_SNo x20 (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 (add_SNo x27 (add_SNo x28 (add_SNo x29 (add_SNo x30 (add_SNo x31 (add_SNo x32 (add_SNo x33 (add_SNo x34 (add_SNo x35 (add_SNo x36 (add_SNo x37 (add_SNo x38 x39))))))))))))))))))) Empty -> SNoLe (add_SNo x1 (minus_SNo x0)) x20 -> SNoLe (add_SNo x2 (minus_SNo x1)) x21 -> SNoLe (add_SNo x3 (minus_SNo x2)) x22 -> SNoLe (add_SNo x4 (minus_SNo x3)) x23 -> SNoLe (add_SNo x5 (minus_SNo x4)) x24 -> SNoLe (add_SNo x6 (minus_SNo x5)) x25 -> SNoLe (add_SNo x7 (minus_SNo x6)) x26 -> SNoLe (add_SNo x8 (minus_SNo x7)) x27 -> SNoLe (add_SNo x9 (minus_SNo x8)) x28 -> SNoLe (add_SNo x10 (minus_SNo x9)) x29 -> SNoLe (add_SNo x11 (minus_SNo x10)) x30 -> SNoLe (add_SNo x12 (minus_SNo x11)) x31 -> SNoLe (add_SNo x13 (minus_SNo x12)) x32 -> SNoLe (add_SNo x14 (minus_SNo x13)) x33 -> SNoLe (add_SNo x15 (minus_SNo x14)) x34 -> SNoLe (add_SNo x16 (minus_SNo x15)) x35 -> SNoLe (add_SNo x17 (minus_SNo x16)) x36 -> SNoLe (add_SNo x18 (minus_SNo x17)) x37 -> SNoLe (add_SNo x19 (minus_SNo x18)) x38 -> SNoLe (add_SNo x0 (minus_SNo x19)) x39 -> False).
admit.
Qed.
Theorem idl_negcycle_21 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37 x38 x39 x40 x41, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNo x28 -> SNo x29 -> SNo x30 -> SNo x31 -> SNo x32 -> SNo x33 -> SNo x34 -> SNo x35 -> SNo x36 -> SNo x37 -> SNo x38 -> SNo x39 -> SNo x40 -> SNo x41 -> SNoLt (add_SNo x21 (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 (add_SNo x27 (add_SNo x28 (add_SNo x29 (add_SNo x30 (add_SNo x31 (add_SNo x32 (add_SNo x33 (add_SNo x34 (add_SNo x35 (add_SNo x36 (add_SNo x37 (add_SNo x38 (add_SNo x39 (add_SNo x40 x41)))))))))))))))))))) Empty -> SNoLe (add_SNo x1 (minus_SNo x0)) x21 -> SNoLe (add_SNo x2 (minus_SNo x1)) x22 -> SNoLe (add_SNo x3 (minus_SNo x2)) x23 -> SNoLe (add_SNo x4 (minus_SNo x3)) x24 -> SNoLe (add_SNo x5 (minus_SNo x4)) x25 -> SNoLe (add_SNo x6 (minus_SNo x5)) x26 -> SNoLe (add_SNo x7 (minus_SNo x6)) x27 -> SNoLe (add_SNo x8 (minus_SNo x7)) x28 -> SNoLe (add_SNo x9 (minus_SNo x8)) x29 -> SNoLe (add_SNo x10 (minus_SNo x9)) x30 -> SNoLe (add_SNo x11 (minus_SNo x10)) x31 -> SNoLe (add_SNo x12 (minus_SNo x11)) x32 -> SNoLe (add_SNo x13 (minus_SNo x12)) x33 -> SNoLe (add_SNo x14 (minus_SNo x13)) x34 -> SNoLe (add_SNo x15 (minus_SNo x14)) x35 -> SNoLe (add_SNo x16 (minus_SNo x15)) x36 -> SNoLe (add_SNo x17 (minus_SNo x16)) x37 -> SNoLe (add_SNo x18 (minus_SNo x17)) x38 -> SNoLe (add_SNo x19 (minus_SNo x18)) x39 -> SNoLe (add_SNo x20 (minus_SNo x19)) x40 -> SNoLe (add_SNo x0 (minus_SNo x20)) x41 -> False).
admit.
Qed.
Theorem idl_negcycle_22 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37 x38 x39 x40 x41 x42 x43, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> SNo x16 -> SNo x17 -> SNo x18 -> SNo x19 -> SNo x20 -> SNo x21 -> SNo x22 -> SNo x23 -> SNo x24 -> SNo x25 -> SNo x26 -> SNo x27 -> SNo x28 -> SNo x29 -> SNo x30 -> SNo x31 -> SNo x32 -> SNo x33 -> SNo x34 -> SNo x35 -> SNo x36 -> SNo x37 -> SNo x38 -> SNo x39 -> SNo x40 -> SNo x41 -> SNo x42 -> SNo x43 -> SNoLt (add_SNo x22 (add_SNo x23 (add_SNo x24 (add_SNo x25 (add_SNo x26 (add_SNo x27 (add_SNo x28 (add_SNo x29 (add_SNo x30 (add_SNo x31 (add_SNo x32 (add_SNo x33 (add_SNo x34 (add_SNo x35 (add_SNo x36 (add_SNo x37 (add_SNo x38 (add_SNo x39 (add_SNo x40 (add_SNo x41 (add_SNo x42 x43))))))))))))))))))))) Empty -> SNoLe (add_SNo x1 (minus_SNo x0)) x22 -> SNoLe (add_SNo x2 (minus_SNo x1)) x23 -> SNoLe (add_SNo x3 (minus_SNo x2)) x24 -> SNoLe (add_SNo x4 (minus_SNo x3)) x25 -> SNoLe (add_SNo x5 (minus_SNo x4)) x26 -> SNoLe (add_SNo x6 (minus_SNo x5)) x27 -> SNoLe (add_SNo x7 (minus_SNo x6)) x28 -> SNoLe (add_SNo x8 (minus_SNo x7)) x29 -> SNoLe (add_SNo x9 (minus_SNo x8)) x30 -> SNoLe (add_SNo x10 (minus_SNo x9)) x31 -> SNoLe (add_SNo x11 (minus_SNo x10)) x32 -> SNoLe (add_SNo x12 (minus_SNo x11)) x33 -> SNoLe (add_SNo x13 (minus_SNo x12)) x34 -> SNoLe (add_SNo x14 (minus_SNo x13)) x35 -> SNoLe (add_SNo x15 (minus_SNo x14)) x36 -> SNoLe (add_SNo x16 (minus_SNo x15)) x37 -> SNoLe (add_SNo x17 (minus_SNo x16)) x38 -> SNoLe (add_SNo x18 (minus_SNo x17)) x39 -> SNoLe (add_SNo x19 (minus_SNo x18)) x40 -> SNoLe (add_SNo x20 (minus_SNo x19)) x41 -> SNoLe (add_SNo x21 (minus_SNo x20)) x42 -> SNoLe (add_SNo x0 (minus_SNo x21)) x43 -> False).
admit.
Qed.