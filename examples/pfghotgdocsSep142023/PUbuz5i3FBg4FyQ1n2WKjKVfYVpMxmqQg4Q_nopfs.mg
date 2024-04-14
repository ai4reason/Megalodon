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
Definition surj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom bij_surj : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> surj x0 x1 x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Theorem missingprop_4de6f85beee126c6d8f0d68ab16a18727003bb214dff8629692233ebd9fc8179 : (forall x0 : set -> set, not (surj omega (Power omega) x0)).
admit.
Qed.
(* Parameter missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 "ae1e1b0c86cebae1f9b3a1770183528d91f067a075ed4218d4359926c8bac5ac" "83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198" *)
Parameter missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 : set -> set -> prop.
Axiom missingprop_cad5bc2f5dac206bae20b714b49a2d836e36638f9959746bfb42cd8bf23be5ca : (forall x0 x1, missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 x0 x1 -> (forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2)).
Theorem missingprop_36457b093102c6b29a960d8e4efa5863b42a6733eb6b3b1deb8c2a250cccfc36 : not (missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 omega (Power omega)).
admit.
Qed.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set -> (set -> prop) -> (set -> set) -> set.
Axiom ReplSepI : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e x0 -> x1 x3 -> x2 x3 :e ReplSep x0 x1 x2).
Axiom ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
Theorem missingprop_eabc1406401c7ee64172dfcfa53fcc0c6f2670ee984e191d114e32c1d4f08f36 : (forall x0 : set -> set, not (inj (Power omega) omega x0)).
admit.
Qed.
