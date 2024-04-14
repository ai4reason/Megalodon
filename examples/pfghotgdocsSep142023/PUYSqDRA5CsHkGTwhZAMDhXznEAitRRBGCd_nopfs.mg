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
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Definition Sing : set -> set :=
 (fun x0 : set => UPair x0 x0).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Theorem missingprop_36456668efb81fed7214a2a55c58885a793c080b2e11698015706b30a4b318d6 : (forall x0, forall x1 : set -> set -> prop, x1 (Sing x0) (UPair x0 x0) -> x1 (UPair x0 x0) (Sing x0)).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem Sing_inv : (forall x0 x1, Sing x0 = x1 -> and (x0 :e x1) (forall x2, x2 :e x1 -> x2 = x0)).
admit.
Qed.
Definition KPair_alt7 : set -> set -> set :=
 (fun x0 x1 : set => UPair (UPair x0 x1) (Sing x0)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Theorem missingprop_4fc470822a158af7e86f7979d245a09f9664221329cda46c152b9c38fb3d34d0 : (forall x0 x1 x2 x3, KPair_alt7 x0 x1 = KPair_alt7 x2 x3 -> x0 = x2).
admit.
Qed.
Theorem missingprop_76c22f38ce8e1e6662ba6e808ea8b95144526b3bc9e5268d53e5b2efe525bc94 : (forall x0 x1 x2 x3, KPair_alt7 x0 x1 = KPair_alt7 x2 x3 -> x1 = x3).
admit.
Qed.
Theorem missingprop_8c1c4c24895912c6259e234e7e5ce4b2b19c83c5e2035b8f52978843217cd7ff : (forall x0 x1 x2 x3, KPair_alt7 x0 x1 = KPair_alt7 x2 x3 -> and (x0 = x2) (x1 = x3)).
admit.
Qed.
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Definition missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3, and (and (forall x4, x4 :e x0 -> (forall x5 : prop, (forall x6, and (x6 :e x1) (KPair_alt7 x4 x6 :e x3) -> x5) -> x5)) (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (KPair_alt7 x6 x4 :e x3) -> x5) -> x5))) (forall x4 x5 x6 x7, KPair_alt7 x4 x5 :e x3 -> KPair_alt7 x6 x7 :e x3 -> iff (x4 = x6) (x5 = x7)) -> x2) -> x2).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem missingprop_20d9cb9439a9eb14b8db57b56040cdfb7bc1872855c5076ea7f74fca016ec44d : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 x0 x1).
admit.
Qed.
Axiom Eps_i_ax : (forall x0 : set -> prop, forall x1, x0 x1 -> x0 (Eps_i x0)).
Theorem missingprop_cad5bc2f5dac206bae20b714b49a2d836e36638f9959746bfb42cd8bf23be5ca : (forall x0 x1, missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 x0 x1 -> (forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2)).
admit.
Qed.
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Theorem and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
admit.
Qed.
Axiom and4E : (forall x0 x1 x2 x3 : prop, and (and (and x0 x1) x2) x3 -> (forall x4 : prop, (x0 -> x1 -> x2 -> x3 -> x4) -> x4)).
Theorem and5E : (forall x0 x1 x2 x3 x4 : prop, and (and (and (and x0 x1) x2) x3) x4 -> (forall x5 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5) -> x5)).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom or4I1 : (forall x0 x1 x2 x3 : prop, x0 -> or (or (or x0 x1) x2) x3).
Theorem or5I1 : (forall x0 x1 x2 x3 x4 : prop, x0 -> or (or (or (or x0 x1) x2) x3) x4).
admit.
Qed.
Axiom or4I2 : (forall x0 x1 x2 x3 : prop, x1 -> or (or (or x0 x1) x2) x3).
Theorem or5I2 : (forall x0 x1 x2 x3 x4 : prop, x1 -> or (or (or (or x0 x1) x2) x3) x4).
admit.
Qed.
Axiom or4I3 : (forall x0 x1 x2 x3 : prop, x2 -> or (or (or x0 x1) x2) x3).
Theorem or5I3 : (forall x0 x1 x2 x3 x4 : prop, x2 -> or (or (or (or x0 x1) x2) x3) x4).
admit.
Qed.
Axiom or4I4 : (forall x0 x1 x2 x3 : prop, x3 -> or (or (or x0 x1) x2) x3).
Theorem or5I4 : (forall x0 x1 x2 x3 x4 : prop, x3 -> or (or (or (or x0 x1) x2) x3) x4).
admit.
Qed.
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem or5I5 : (forall x0 x1 x2 x3 x4 : prop, x4 -> or (or (or (or x0 x1) x2) x3) x4).
admit.
Qed.
Axiom or4E : (forall x0 x1 x2 x3 : prop, or (or (or x0 x1) x2) x3 -> (forall x4 : prop, (x0 -> x4) -> (x1 -> x4) -> (x2 -> x4) -> (x3 -> x4) -> x4)).
Theorem or5E : (forall x0 x1 x2 x3 x4 : prop, or (or (or (or x0 x1) x2) x3) x4 -> (forall x5 : prop, (x0 -> x5) -> (x1 -> x5) -> (x2 -> x5) -> (x3 -> x5) -> (x4 -> x5) -> x5)).
admit.
Qed.
Theorem and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
admit.
Qed.
Theorem and6E : (forall x0 x1 x2 x3 x4 x5 : prop, and (and (and (and (and x0 x1) x2) x3) x4) x5 -> (forall x6 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6) -> x6)).
admit.
Qed.
Theorem and7I : (forall x0 x1 x2 x3 x4 x5 x6 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6).
admit.
Qed.
Theorem and7E : (forall x0 x1 x2 x3 x4 x5 x6 : prop, and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6 -> (forall x7 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7) -> x7)).
admit.
Qed.
