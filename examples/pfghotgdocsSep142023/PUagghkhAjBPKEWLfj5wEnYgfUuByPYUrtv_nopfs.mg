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
Definition Church17_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x9) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x10) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x11) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x12) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x13) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> x1 x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_1030b2f82370682da82bd2e49c05e6c78943595f102389be16df3b42b6279cb8 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> or ((fun x2 x3 : set => x0 x2 x2 x2 x2 x2 x2 x2 x2 x2 x3 x3 x3 x3 x3 x3 x3 x3) = (fun x2 x3 : set => x2)) ((fun x2 x3 : set => x0 x3 x3 x3 x3 x3 x3 x3 x3 x3 x2 x2 x2 x2 x2 x2 x2 x2) = (fun x2 x3 : set => x2))).
admit.
Qed.
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
Axiom missingprop_0bdc9214f3d13da435022f8588b958836c09a818ca32d79d0900f54c8d2527a2 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> (fun x3 x4 : set => x0 x3 x3 x3 x3 x3 x3 x3 x3 x3 x4 x4 x4 x4 x4 x4 x4 x4) = (fun x3 x4 : set => x3) -> x0 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 = x1 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 -> x0 = x1).
Axiom missingprop_c8f4c6132c330d292a33ed857f1378dfa11f59a06ab198d38d5ce3df4b16ca8f : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> (fun x3 x4 : set => x0 x4 x4 x4 x4 x4 x4 x4 x4 x4 x3 x3 x3 x3 x3 x3 x3 x3) = (fun x3 x4 : set => x3) -> x0 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 = x1 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 -> x0 = x1).
Theorem missingprop_18a65fd3493d2e48f1b5060258780b303ac9e04051ad34220b728dfc47e48d7f : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> x0 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 = x1 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 -> x0 = x1).
admit.
Qed.
Definition TwoRamseyGraph_4_4_Church17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2) (x1 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2) (x1 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3) (x1 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2) (x1 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3) (x1 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3) (x1 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3) (x1 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2) (x1 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2) (x1 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3) (x1 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3) (x1 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3) (x1 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3) (x1 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2) (x1 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2) (x1 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom missingprop_ff49046eea45e52be0679da7e60a06faabb9bec19c71965e127e54eb9539f5f3 : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> (fun x4 x5 : set => x0 x4 x4 x4 x4 x4 x4 x4 x4 x4 x5 x5 x5 x5 x5 x5 x5 x5) = (fun x4 x5 : set => x4) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x0 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x1 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x2 -> (forall x3 : prop, x3)) -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x0 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 x0 x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 x1 x2 = (fun x4 x5 : set => x4) -> False).
Axiom missingprop_354b4f1f97bbb4f2cdb2200623d77e815b98a25ce80df80b154c7f787661debc : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> (fun x4 x5 : set => x0 x5 x5 x5 x5 x5 x5 x5 x5 x5 x4 x4 x4 x4 x4 x4 x4 x4) = (fun x4 x5 : set => x4) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x0 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x1 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x2 -> (forall x3 : prop, x3)) -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x0 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 x0 x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 x1 x2 = (fun x4 x5 : set => x4) -> False).
Axiom missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
Theorem missingprop_5fd6939c226fd9da4e2a4a575d79a2e61666fad9c4051e73ef1851f344020124 : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x0 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x1 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x2 -> (forall x3 : prop, x3)) -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x0 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 x0 x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_4_Church17 x1 x2 = (fun x4 x5 : set => x4) -> False).
admit.
Qed.
Axiom missingprop_0488073fe9c750b552eb460682a4287ceddcb40e6873677c84616c7fe9875c49 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> (forall x1 : prop, (forall x2 x3 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, (forall x4 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x4 -> Church17_p (x2 x4)) -> (forall x4 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x4 -> Church17_p (x3 x4)) -> (forall x4 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, forall x5 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x5 (x2 (x3 x4)) x4 -> x5 x4 (x2 (x3 x4))) -> (forall x4 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, forall x5 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x5 (x3 (x2 x4)) x4 -> x5 x4 (x3 (x2 x4))) -> (forall x4 x5 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x4 -> Church17_p x5 -> TwoRamseyGraph_4_4_Church17 x4 x5 = TwoRamseyGraph_4_4_Church17 (x2 x4) (x2 x5)) -> x2 x0 = (fun x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 : set => x5) -> x1) -> x1)).
Theorem missingprop_600304c5ef13e538022ba8291ad91324a1e2aaa5ae55e716967d35f2c83846df : (forall x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> Church17_p x3 -> (x0 = x1 -> (forall x4 : prop, x4)) -> (x0 = x2 -> (forall x4 : prop, x4)) -> (x0 = x3 -> (forall x4 : prop, x4)) -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x5 x6 : set => x5) -> TwoRamseyGraph_4_4_Church17 x0 x2 = (fun x5 x6 : set => x5) -> TwoRamseyGraph_4_4_Church17 x0 x3 = (fun x5 x6 : set => x5) -> TwoRamseyGraph_4_4_Church17 x1 x2 = (fun x5 x6 : set => x5) -> TwoRamseyGraph_4_4_Church17 x1 x3 = (fun x5 x6 : set => x5) -> TwoRamseyGraph_4_4_Church17 x2 x3 = (fun x5 x6 : set => x5) -> False).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition u17 : set :=
 ordsucc u16.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition TwoRamseyGraph_4_4_17 : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 x3 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x2 -> Church17_p x3 -> x0 = x2 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 -> x1 = x3 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 -> TwoRamseyGraph_4_4_Church17 x2 x3 = (fun x5 x6 : set => x5)).
Axiom missingprop_19c5bea28ef119e30d80f4e7c578df826b34bc3d0b15978a12c7c1b896ec3046 : (forall x0, atleastp u4 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (x2 = x3 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x1)))) -> x1)).
Axiom missingprop_fa363309151222d666a5df6648c3d7cbb9db9b9ba87cc04000ea2b8b969c70c7 : (forall x0, x0 :e u17 -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x2 -> x0 = x2 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 -> x1) -> x1)).
Theorem missingprop_1947e9bb22af44c2835c404efac3be226fcf1cde719d4bda48e06372ac44fe1d : (forall x0, x0 c= u17 -> atleastp u4 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_4_4_17 x1 x2))).
admit.
Qed.
Theorem missingprop_805df3bfbf10a3f532039c4e52b4f89518eefb765fbde3dea103a4efdc804215 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> or (TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x3 x4 : set => x3)) (TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x3 x4 : set => x4))).
admit.
Qed.
Axiom missingprop_1f2bba689392703fd9ae4d43bb1fb4db9f6cb380e2866ddb66d73f17c1bb7937 : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> (fun x4 x5 : set => x4) = (fun x4 x5 : set => x0 x4 x4 x4 x4 x4 x4 x4 x4 x4 x5 x5 x5 x5 x5 x5 x5 x5) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x0 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x1 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x2 -> (forall x3 : prop, x3)) -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x0 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 x0 x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 x1 x2 = (fun x4 x5 : set => x5) -> False).
Axiom missingprop_0c179d13b0842b8b667bad141e154df467dcf4161461e0e5d6153322ede94224 : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> (fun x4 x5 : set => x4) = (fun x4 x5 : set => x0 x5 x5 x5 x5 x5 x5 x5 x5 x5 x4 x4 x4 x4 x4 x4 x4 x4) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x0 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x1 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x2 -> (forall x3 : prop, x3)) -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x0 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 x0 x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 x1 x2 = (fun x4 x5 : set => x5) -> False).
Theorem missingprop_24b802e9c634b424b8d6cdae46b7a7a8811d806afc84a4a23d0b7c9ae4b9c9de : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x0 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x1 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) = x2 -> (forall x3 : prop, x3)) -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x0 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x4) x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 x0 x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_4_4_Church17 x1 x2 = (fun x4 x5 : set => x5) -> False).
admit.
Qed.
Theorem missingprop_0622a2b3aafa59ebcc3706a1ebb97b2d68596d563b882a30d4a0969ed018220b : (forall x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> Church17_p x3 -> (x0 = x1 -> (forall x4 : prop, x4)) -> (x0 = x2 -> (forall x4 : prop, x4)) -> (x0 = x3 -> (forall x4 : prop, x4)) -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> TwoRamseyGraph_4_4_Church17 x0 x1 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_4_4_Church17 x0 x2 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_4_4_Church17 x0 x3 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_4_4_Church17 x1 x2 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_4_4_Church17 x1 x3 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_4_4_Church17 x2 x3 = (fun x5 x6 : set => x6) -> False).
admit.
Qed.
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_dadf5826f13a875cf09df22d9944f81bee726f8a1b299f608c97841ffb4cd64a : (forall x0, x0 c= u17 -> atleastp u4 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_4_4_17 x1 x2)))).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Axiom missingprop_bf922fbc15ef367e36095d6fe104c659782efdeb2f3c623c6ad8079831449813 : (forall x0 x1, TwoRamseyGraph_4_4_17 x0 x1 -> TwoRamseyGraph_4_4_17 x1 x0).
Theorem not_TwoRamseyProp_atleast_4_4_17 : not (TwoRamseyProp_atleastp 4 4 17).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Theorem not_TwoRamseyProp_4_4_17 : not (TwoRamseyProp 4 4 17).
admit.
Qed.
