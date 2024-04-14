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
Theorem missingprop_935700b984ff1222807d4ec5408b7c6e379beba4bc40115b9b12324e2e964d39 : (forall x0 x1 : set -> prop, forall x2 x3 : set -> set -> set -> set -> prop, (forall x4, x0 x4 -> (forall x5, x1 x5 -> (forall x6, x0 x6 -> (forall x7, x0 x7 -> not (x1 x7) -> x2 x4 x5 x6 x7)))) -> (forall x4 x5 x6 x7, x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> (forall x8 : prop, (x2 x4 x5 x6 x7 -> x8) -> (x3 x4 x5 x6 x7 -> x8) -> (x2 x6 x7 x4 x5 -> x8) -> x8)) -> (forall x4 x5 x6 x7, x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x3 x4 x5 x6 x7 -> x3 x6 x7 x4 x5) -> (forall x4, x0 x4 -> (forall x5, x0 x5 -> (forall x6, x0 x6 -> (forall x7, x0 x7 -> (forall x8, x0 x8 -> (forall x9, x0 x9 -> (forall x10, x0 x10 -> (forall x11, x0 x11 -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> (forall x14, x0 x14 -> (forall x15, x0 x15 -> x1 x5 -> not (x1 x7) -> not (x1 x9) -> not (x1 x11) -> not (x1 x13) -> not (x1 x15) -> not (x3 x4 x5 x6 x7) -> not (x3 x4 x5 x8 x9) -> not (x3 x4 x5 x10 x11) -> not (x3 x4 x5 x12 x13) -> not (x3 x4 x5 x14 x15) -> not (x3 x6 x7 x8 x9) -> not (x3 x6 x7 x10 x11) -> not (x3 x6 x7 x12 x13) -> not (x3 x6 x7 x14 x15) -> not (x3 x8 x9 x10 x11) -> not (x3 x8 x9 x12 x13) -> not (x3 x8 x9 x14 x15) -> not (x3 x10 x11 x12 x13) -> not (x3 x10 x11 x14 x15) -> not (x3 x12 x13 x14 x15) -> (forall x16 : prop, (forall x17, x0 x17 -> (forall x18, x0 x18 -> (forall x19, x0 x19 -> (forall x20, x0 x20 -> (forall x21, x0 x21 -> (forall x22, x0 x22 -> (forall x23, x0 x23 -> (forall x24, x0 x24 -> (forall x25, x0 x25 -> (forall x26, x0 x26 -> x2 x4 x5 x17 x18 -> x2 x17 x18 x19 x20 -> x2 x19 x20 x21 x22 -> x2 x21 x22 x23 x24 -> x2 x23 x24 x25 x26 -> not (x1 x18) -> not (x1 x20) -> not (x1 x22) -> not (x1 x24) -> not (x1 x26) -> not (x3 x4 x5 x17 x18) -> not (x3 x4 x5 x19 x20) -> not (x3 x4 x5 x21 x22) -> not (x3 x4 x5 x23 x24) -> not (x3 x4 x5 x25 x26) -> not (x3 x17 x18 x19 x20) -> not (x3 x17 x18 x21 x22) -> not (x3 x17 x18 x23 x24) -> not (x3 x17 x18 x25 x26) -> not (x3 x19 x20 x21 x22) -> not (x3 x19 x20 x23 x24) -> not (x3 x19 x20 x25 x26) -> not (x3 x21 x22 x23 x24) -> not (x3 x21 x22 x25 x26) -> not (x3 x23 x24 x25 x26) -> x16)))))))))) -> x16)))))))))))))).
admit.
Qed.
