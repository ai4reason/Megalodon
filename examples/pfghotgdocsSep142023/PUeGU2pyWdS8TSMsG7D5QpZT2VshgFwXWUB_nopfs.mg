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
Theorem missingprop_02ee1f49e9cc412273e5c70d42ed8bb3c47a38e2a60ec19eee5108733746f46e : (forall x0 x1 : set -> prop, forall x2 x3 x4 x5 x6 x7, (forall x8 : set -> prop, x8 x2 -> x8 x3 -> x8 x4 -> x8 x5 -> x8 x6 -> x8 x7 -> (forall x9, x0 x9 -> x8 x9)) -> x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> (forall x8 x9 x10 : set -> set, x8 x2 = x3 -> x8 x3 = x2 -> x8 x4 = x5 -> x8 x5 = x4 -> x9 x2 = x4 -> x9 x3 = x5 -> x9 x4 = x2 -> x9 x5 = x3 -> x10 x2 = x5 -> x10 x3 = x4 -> x10 x4 = x3 -> x10 x5 = x2 -> (forall x11 : set -> set -> set -> set -> prop, (forall x12 x13, x0 x12 -> x0 x13 -> not (x11 x12 x13 x12 x13)) -> (forall x12 x13 x14 x15, x11 x12 x13 x14 x15 -> x11 x14 x15 x12 x13) -> (forall x12 x13, x0 x12 -> x0 x13 -> not (x11 x12 x13 x7 x7)) -> (forall x12 x13 x14 x15, x0 x12 -> x1 x13 -> x0 x14 -> x1 x15 -> not (x11 x12 x13 x14 x15) -> not (x11 x12 (x8 x13) x14 (x8 x15))) -> (forall x12 x13 x14 x15, x0 x12 -> x1 x13 -> x0 x14 -> x1 x15 -> not (x11 x12 x13 x14 x15) -> not (x11 x12 (x9 x13) x14 (x9 x15))) -> (forall x12 x13 x14 x15, x0 x12 -> x1 x13 -> x0 x14 -> x1 x15 -> not (x11 x12 x13 x14 x15) -> not (x11 x12 (x10 x13) x14 (x10 x15))) -> (forall x12, x0 x12 -> not (x11 x4 x6 x5 x12)) -> (forall x12, x0 x12 -> not (x11 x4 x6 x7 x12)) -> (forall x12, x0 x12 -> not (x11 x6 x7 x4 x12)) -> (forall x12, x0 x12 -> not (x11 x5 x5 x12 x7)) -> (forall x12, x0 x12 -> not (x11 x6 x2 x12 x6)) -> not (x11 x2 x2 x3 x4) -> not (x11 x2 x2 x4 x2) -> not (x11 x2 x2 x6 x3) -> not (x11 x2 x3 x4 x2) -> not (x11 x2 x3 x6 x2) -> not (x11 x2 x4 x2 x6) -> not (x11 x2 x4 x3 x2) -> not (x11 x2 x5 x3 x2) -> not (x11 x2 x5 x4 x6) -> not (x11 x2 x6 x3 x2) -> not (x11 x2 x6 x4 x4) -> not (x11 x2 x6 x6 x5) -> not (x11 x2 x7 x3 x4) -> not (x11 x3 x2 x3 x3) -> not (x11 x3 x2 x3 x5) -> not (x11 x3 x2 x4 x3) -> not (x11 x3 x2 x4 x4) -> not (x11 x3 x2 x4 x5) -> not (x11 x3 x2 x5 x2) -> not (x11 x3 x2 x6 x2) -> not (x11 x3 x2 x6 x5) -> not (x11 x3 x2 x7 x2) -> not (x11 x3 x2 x7 x5) -> not (x11 x3 x4 x3 x6) -> not (x11 x3 x4 x4 x2) -> not (x11 x3 x4 x4 x7) -> not (x11 x3 x4 x5 x6) -> not (x11 x3 x4 x6 x6) -> not (x11 x3 x4 x7 x2) -> not (x11 x3 x4 x7 x6) -> not (x11 x3 x7 x4 x6) -> not (x11 x3 x7 x5 x2) -> not (x11 x3 x7 x6 x2) -> not (x11 x4 x2 x5 x5) -> not (x11 x4 x2 x6 x3) -> not (x11 x4 x2 x7 x3) -> not (x11 x4 x3 x6 x2) -> not (x11 x4 x4 x5 x7) -> not (x11 x5 x2 x5 x5) -> not (x11 x5 x2 x6 x2) -> not (x11 x5 x5 x6 x2) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> (forall x14, x0 x14 -> (forall x15, x0 x15 -> (forall x16, x0 x16 -> x11 x3 x4 x4 x12 -> x11 x3 x4 x13 x14 -> x11 x3 x4 x15 x16 -> x11 x4 x12 x13 x14 -> x11 x4 x12 x15 x16 -> x11 x13 x14 x15 x16 -> False)))))))).
admit.
Qed.
