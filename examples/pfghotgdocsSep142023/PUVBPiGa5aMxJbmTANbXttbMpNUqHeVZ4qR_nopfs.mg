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
Definition Church13_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x9) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x10) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x11) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x12) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x13) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x14) -> x1 x0).
Definition TwoRamseyGraph_3_5_Church13 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2) (x1 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3) (x1 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3) (x1 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3) (x1 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2) (x1 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3) (x1 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3) (x1 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3) (x1 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
Theorem missingprop_65dffad5ad9eda5ad12d18cb61d84c2c7226cfad8cd8ffdee87c8f630b9465b1 : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> Church13_p x2 -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4) = (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11) -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4) = x0 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4) = x1 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4) = x2 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11) = x0 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11) = x1 -> (forall x3 : prop, x3)) -> ((fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11) = x2 -> (forall x3 : prop, x3)) -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_5_Church13 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4) (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11) = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_5_Church13 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4) x0 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_5_Church13 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4) x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_5_Church13 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4) x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_5_Church13 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11) x0 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_5_Church13 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11) x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_5_Church13 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11) x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_5_Church13 x0 x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_5_Church13 x0 x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_5_Church13 x1 x2 = (fun x4 x5 : set => x5) -> False).
admit.
Qed.
