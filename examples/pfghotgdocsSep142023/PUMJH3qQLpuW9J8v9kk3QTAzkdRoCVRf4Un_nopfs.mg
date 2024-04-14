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
Definition ChurchNum2 : (set -> set) -> set -> set :=
 (fun x0 : set -> set => fun x1 : set => x0 (x0 x1)).
Definition ChurchNum4 : (set -> set) -> set -> set :=
 (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 x1)))).
Definition ChurchNum_plus : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 x1 : (set -> set) -> set -> set => fun x2 : set -> set => fun x3 : set => x0 x2 (x1 x2 x3)).
Definition ChurchNum_mult : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 x1 : (set -> set) -> set -> set => fun x2 : set -> set => x0 (x1 x2)).
Theorem missingprop_a6711e82d286dae7fcae27565a7375a40308d8c5483b1a71d1907e3e7cd70f0a : ChurchNum_plus ChurchNum2 ChurchNum2 = ChurchNum4.
admit.
Qed.
Theorem missingprop_57a2b7cda93ec45ae931cde1af7309b1e743b23a4e0d02d072e78acf3c6b43cf : ChurchNum_mult ChurchNum2 ChurchNum2 = ChurchNum4.
admit.
Qed.
