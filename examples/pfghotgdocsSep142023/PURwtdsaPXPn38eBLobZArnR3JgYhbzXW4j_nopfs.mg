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
Definition canonical_elt : (set -> set -> prop) -> set -> set :=
 (fun x0 : set -> set -> prop => fun x1 : set => Eps_i (x0 x1)).
Axiom Eps_i_ax : (forall x0 : set -> prop, forall x1, x0 x1 -> x0 (Eps_i x0)).
Theorem canonical_elt_rel : (forall x0 : set -> set -> prop, forall x1, x0 x1 x1 -> x0 x1 (canonical_elt x0 x1)).
admit.
Qed.
(* Parameter per "4a0f686cd7e2f152f8da5616b417a9f7c3b6867397c9abde39031fa0217d2692" "5754c55c5ad43b5eaeb1fb67971026c82f41fd52267a380d6f2bb8487e4e959b" *)
Parameter per : (set -> set -> prop) -> prop.
Axiom pred_ext_2 : (forall x0 x1 : set -> prop, (forall x2, x0 x2 -> x1 x2) -> (forall x2, x1 x2 -> x0 x2) -> x0 = x1).
Axiom per_stra1 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2 x3, x0 x2 x1 -> x0 x2 x3 -> x0 x1 x3)).
Definition transitive : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2 x3, x0 x1 x2 -> x0 x2 x3 -> x0 x1 x3).
Axiom per_tra : (forall x0 : set -> set -> prop, per x0 -> transitive x0).
Theorem canonical_elt_eq : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2, x0 x1 x2 -> canonical_elt x0 x1 = canonical_elt x0 x2)).
admit.
Qed.
Theorem canonical_elt_idem : (forall x0 : set -> set -> prop, per x0 -> (forall x1, x0 x1 x1 -> canonical_elt x0 x1 = canonical_elt x0 (canonical_elt x0 x1))).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition quotient : (set -> set -> prop) -> set -> prop :=
 (fun x0 : set -> set -> prop => fun x1 : set => and (x0 x1 x1) (x1 = canonical_elt x0 x1)).
Axiom andEL : (forall x0 x1 : prop, and x0 x1 -> x0).
Theorem quotient_prop1 : (forall x0 : set -> set -> prop, forall x1, quotient x0 x1 -> x0 x1 x1).
admit.
Qed.
Axiom andER : (forall x0 x1 : prop, and x0 x1 -> x1).
Theorem quotient_prop2 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2, quotient x0 x1 -> quotient x0 x2 -> x0 x1 x2 -> x1 = x2)).
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition canonical_elt_def : (set -> set -> prop) -> (set -> set) -> set -> set :=
 (fun x0 : set -> set -> prop => fun x1 : set -> set => fun x2 : set => If_i (x0 x2 (x1 x2)) (x1 x2) (canonical_elt x0 x2)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom If_i_correct : (forall x0 : prop, forall x1 x2, or (and x0 (If_i x0 x1 x2 = x1)) (and (not x0) (If_i x0 x1 x2 = x2))).
Theorem canonical_elt_def_rel : (forall x0 : set -> set -> prop, forall x1 : set -> set, forall x2, x0 x2 x2 -> x0 x2 (canonical_elt_def x0 x1 x2)).
admit.
Qed.
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Theorem canonical_elt_def_eq : (forall x0 : set -> set -> prop, per x0 -> (forall x1 : set -> set, (forall x2 x3, x0 x2 x3 -> x1 x2 = x1 x3) -> (forall x2 x3, x0 x2 x3 -> canonical_elt_def x0 x1 x2 = canonical_elt_def x0 x1 x3))).
admit.
Qed.
Theorem canonical_elt_def_idem : (forall x0 : set -> set -> prop, per x0 -> (forall x1 : set -> set, (forall x2 x3, x0 x2 x3 -> x1 x2 = x1 x3) -> (forall x2, x0 x2 x2 -> canonical_elt_def x0 x1 x2 = canonical_elt_def x0 x1 (canonical_elt_def x0 x1 x2)))).
admit.
Qed.
Definition quotient_def : (set -> set -> prop) -> (set -> set) -> set -> prop :=
 (fun x0 : set -> set -> prop => fun x1 : set -> set => fun x2 : set => and (x0 x2 x2) (x2 = canonical_elt_def x0 x1 x2)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom per_ref1 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2, x0 x1 x2 -> x0 x1 x1)).
Theorem quotient_def_prop0 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 : set -> set, forall x2, x0 x2 (x1 x2) -> x2 = x1 x2 -> quotient_def x0 x1 x2)).
admit.
Qed.
Theorem quotient_def_prop1 : (forall x0 : set -> set -> prop, forall x1 : set -> set, forall x2, quotient_def x0 x1 x2 -> x0 x2 x2).
admit.
Qed.
Theorem quotient_def_prop2 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 : set -> set, (forall x2 x3, x0 x2 x3 -> x1 x2 = x1 x3) -> (forall x2 x3, quotient_def x0 x1 x2 -> quotient_def x0 x1 x3 -> x0 x2 x3 -> x2 = x3))).
admit.
Qed.
