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
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition KPair_alt7 : set -> set -> set :=
 (fun x0 x1 : set => UPair (UPair x0 x1) (Sing x0)).
Definition KPair_alt6 : set -> set -> set :=
 (fun x0 x1 : set => UPair (Sing x0) (UPair x0 x1)).
Definition KPair_alt5 : set -> set -> set :=
 (fun x0 x1 : set => UPair (Sing x0) (UPair x1 x0)).
Definition KPair_alt4 : set -> set -> set :=
 (fun x0 x1 : set => UPair (UPair x1 x0) (Sing x0)).
Definition KPair_alt3 : set -> set -> set :=
 (fun x0 x1 : set => UPair (UPair x1 x0) (Sing x1)).
Definition KPair_alt2 : set -> set -> set :=
 (fun x0 x1 : set => UPair (Sing x1) (UPair x1 x0)).
Definition KPair_alt1 : set -> set -> set :=
 (fun x0 x1 : set => UPair (Sing x1) (UPair x0 x1)).
Definition KPair : set -> set -> set :=
 (fun x0 x1 : set => UPair (UPair x0 x1) (Sing x1)).
