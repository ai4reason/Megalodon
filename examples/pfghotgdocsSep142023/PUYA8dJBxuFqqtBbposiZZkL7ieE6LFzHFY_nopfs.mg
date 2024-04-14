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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_9fcd89e49aba8cf742b1a659b065702d7e37246acca433ba68b57adb395450a4 : (forall x0 x1 : set -> prop, forall x2 x3 x4 x5 x6 x7, (forall x8 : set -> prop, x8 x2 -> x8 x3 -> x8 x4 -> x8 x5 -> x8 x6 -> x8 x7 -> (forall x9, x0 x9 -> x8 x9)) -> (forall x8, x0 x8 -> not (x1 x8) -> (forall x9 : set -> prop, x9 x6 -> x9 x7 -> x9 x8)) -> x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> (forall x8 : set -> set -> set -> set -> prop, (forall x9, x0 x9 -> (forall x10, x0 x10 -> not (x8 x9 x7 x10 x6))) -> (forall x9, x0 x9 -> not (x8 x2 x9 x2 x9)) -> (forall x9, x0 x9 -> not (x8 x3 x9 x2 x9)) -> (forall x9, x0 x9 -> not (x8 x4 x9 x2 x9)) -> (forall x9, x0 x9 -> not (x8 x5 x9 x2 x9)) -> (forall x9, x0 x9 -> not (x8 x6 x9 x2 x9)) -> (forall x9, x0 x9 -> not (x8 x7 x9 x2 x9)) -> (forall x9, x0 x9 -> not (x8 x3 x9 x3 x9)) -> (forall x9, x0 x9 -> not (x8 x4 x9 x3 x9)) -> (forall x9, x0 x9 -> not (x8 x5 x9 x3 x9)) -> (forall x9, x0 x9 -> not (x8 x6 x9 x3 x9)) -> (forall x9, x0 x9 -> not (x8 x7 x9 x3 x9)) -> (forall x9, x0 x9 -> not (x8 x4 x9 x4 x9)) -> (forall x9, x0 x9 -> not (x8 x5 x9 x4 x9)) -> (forall x9, x0 x9 -> not (x8 x6 x9 x4 x9)) -> (forall x9, x0 x9 -> not (x8 x7 x9 x4 x9)) -> (forall x9, x0 x9 -> not (x8 x5 x9 x5 x9)) -> (forall x9, x0 x9 -> not (x8 x6 x9 x5 x9)) -> (forall x9, x0 x9 -> not (x8 x7 x9 x5 x9)) -> (forall x9, x0 x9 -> not (x8 x6 x9 x6 x9)) -> (forall x9, x0 x9 -> not (x8 x7 x9 x6 x9)) -> (forall x9, x0 x9 -> not (x8 x7 x9 x7 x9)) -> (forall x9 : set -> set -> set -> set -> prop, (forall x10 x11, x0 x10 -> x0 x11 -> x9 x10 x11 x7 x7) -> (forall x10, x0 x10 -> x9 x6 x6 x7 x10) -> (forall x10, x0 x10 -> x9 x6 x7 x7 x10) -> x9 x2 x6 x4 x6 -> x9 x2 x6 x4 x7 -> x9 x2 x6 x5 x6 -> x9 x2 x6 x5 x7 -> x9 x2 x6 x7 x6 -> x9 x2 x7 x4 x7 -> x9 x2 x7 x5 x7 -> x9 x3 x6 x3 x7 -> x9 x3 x6 x5 x6 -> x9 x3 x6 x5 x7 -> x9 x3 x6 x6 x7 -> x9 x3 x6 x7 x6 -> x9 x3 x7 x5 x7 -> x9 x4 x6 x2 x7 -> x9 x4 x6 x4 x7 -> x9 x5 x6 x2 x7 -> x9 x5 x6 x3 x7 -> x9 x6 x6 x3 x7 -> x9 x7 x6 x2 x7 -> x9 x7 x6 x3 x7 -> x9 x7 x6 x6 x7 -> (forall x10, x0 x10 -> (forall x11, x0 x11 -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x1 x10) -> not (x1 x11) -> x12 = x6 -> not (x1 x13) -> (forall x14, x0 x14 -> (forall x15, x0 x15 -> (forall x16, x0 x16 -> (forall x17, x0 x17 -> x8 x14 x10 x15 x11 -> x8 x15 x11 x16 x12 -> x8 x16 x12 x17 x13 -> not (x9 x14 x10 x15 x11) -> not (x9 x14 x10 x16 x12) -> not (x9 x14 x10 x17 x13) -> not (x9 x15 x11 x16 x12) -> not (x9 x15 x11 x17 x13) -> not (x9 x16 x12 x17 x13) -> (forall x18 : prop, (x14 = x2 -> x10 = x6 -> x15 = x3 -> x11 = x6 -> x16 = x6 -> x12 = x6 -> x17 = x2 -> x13 = x7 -> x18) -> (x14 = x4 -> x10 = x6 -> x15 = x5 -> x11 = x6 -> x16 = x6 -> x12 = x6 -> x17 = x5 -> x13 = x7 -> x18) -> (x14 = x4 -> x10 = x6 -> x15 = x5 -> x11 = x6 -> x16 = x6 -> x12 = x6 -> x17 = x6 -> x13 = x7 -> x18) -> (x14 = x4 -> x10 = x6 -> x15 = x5 -> x11 = x6 -> x16 = x7 -> x12 = x6 -> x17 = x5 -> x13 = x7 -> x18) -> (x14 = x2 -> x10 = x6 -> x15 = x6 -> x11 = x6 -> x16 = x2 -> x12 = x7 -> x17 = x6 -> x13 = x7 -> x18) -> (x14 = x4 -> x10 = x6 -> x15 = x5 -> x11 = x6 -> x16 = x5 -> x12 = x7 -> x17 = x6 -> x13 = x7 -> x18) -> (x14 = x4 -> x10 = x6 -> x15 = x6 -> x11 = x6 -> x16 = x5 -> x12 = x7 -> x17 = x6 -> x13 = x7 -> x18) -> (x14 = x5 -> x10 = x6 -> x15 = x6 -> x11 = x6 -> x16 = x4 -> x12 = x7 -> x17 = x5 -> x13 = x7 -> x18) -> (x14 = x5 -> x10 = x6 -> x15 = x6 -> x11 = x6 -> x16 = x4 -> x12 = x7 -> x17 = x6 -> x13 = x7 -> x18) -> (x14 = x5 -> x10 = x6 -> x15 = x6 -> x11 = x6 -> x16 = x5 -> x12 = x7 -> x17 = x6 -> x13 = x7 -> x18) -> (x14 = x5 -> x10 = x6 -> x15 = x7 -> x11 = x6 -> x16 = x4 -> x12 = x7 -> x17 = x5 -> x13 = x7 -> x18) -> (x14 = x2 -> x10 = x6 -> x15 = x2 -> x11 = x7 -> x16 = x3 -> x12 = x7 -> x17 = x6 -> x13 = x7 -> x18) -> (x14 = x5 -> x10 = x6 -> x15 = x4 -> x11 = x7 -> x16 = x5 -> x12 = x7 -> x17 = x6 -> x13 = x7 -> x18) -> (x14 = x6 -> x10 = x6 -> x15 = x4 -> x11 = x7 -> x16 = x5 -> x12 = x7 -> x17 = x6 -> x13 = x7 -> x18) -> x18)))))))))))).
admit.
Qed.
