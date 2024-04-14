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
Theorem f_eq_i : (forall x0 : set -> set, forall x1 x2, x1 = x2 -> x0 x1 = x0 x2).
admit.
Qed.
Theorem f_eq_i_i : (forall x0 : set -> set -> set, forall x1 x2 x3 x4, x1 = x2 -> x3 = x4 -> x0 x1 x3 = x0 x2 x4).
admit.
Qed.
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
(* Parameter explicit_Field_minus "be660f6f1e37e7325ec2a39529b9c937b61a60f864e85f0dabdf2bddacb0986e" "5be570b4bcbe7fefd36c2057491ddcc7b11903d8d98ca54d9b37db60d1bf0f7e" *)
Parameter explicit_Field_minus : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> set -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom explicit_Field_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (x6 = x1 -> (forall x7 : prop, x7)) -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x4 x6 x8 = x2) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_Field x0 x1 x2 x3 x4 -> x5).
Axiom explicit_Field_plus_cancelL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x6 = x3 x5 x7 -> x6 = x7)))).
Axiom explicit_Field_minus_clos : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 x5 :e x0)).
Axiom explicit_Field_minus_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 x5 (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x1)).
Theorem explicit_Field_minus_zero : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> explicit_Field_minus x0 x1 x2 x3 x4 x1 = x1).
admit.
Qed.
Theorem explicit_Field_dist_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 (x3 x5 x6) x7 = x3 (x4 x5 x7) (x4 x6 x7))))).
admit.
Qed.
Axiom explicit_Field_minus_mult : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 x5 = x4 (explicit_Field_minus x0 x1 x2 x3 x4 x2) x5)).
Axiom explicit_Field_minus_one_In : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> explicit_Field_minus x0 x1 x2 x3 x4 x2 :e x0).
Theorem explicit_Field_minus_plus_dist : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 (x3 x5 x6) = x3 (explicit_Field_minus x0 x1 x2 x3 x4 x5) (explicit_Field_minus x0 x1 x2 x3 x4 x6)))).
admit.
Qed.
Theorem explicit_Field_minus_mult_L : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 (explicit_Field_minus x0 x1 x2 x3 x4 x5) x6 = explicit_Field_minus x0 x1 x2 x3 x4 (x4 x5 x6)))).
admit.
Qed.
Theorem explicit_Field_minus_mult_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 (explicit_Field_minus x0 x1 x2 x3 x4 x6) = explicit_Field_minus x0 x1 x2 x3 x4 (x4 x5 x6)))).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom explicit_Field_zero_multL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x1 x5 = x1)).
Theorem explicit_Field_square_zero_inv : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x5 x5 = x1 -> x5 = x1)).
admit.
Qed.
(* Parameter explicit_OrderedField "1195f96dcd143e4b896b4c1eb080d1fb877084debc58a8626d3dcf7a14ce8df7" "a18f7bca989a67fb7dc6df8e6c094372c26fa2c334578447d3314616155afb72" *)
Parameter explicit_OrderedField : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom explicit_OrderedField_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Field x0 x1 x2 x3 x4 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 x8 x9 -> x5 x7 x9))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> iff (and (x5 x7 x8) (x5 x8 x7)) (x7 = x8))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> or (x5 x7 x8) (x5 x8 x7))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 (x3 x7 x9) (x3 x8 x9)))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x1 x7 -> x5 x1 x8 -> x5 x1 (x4 x7 x8))) -> x6) -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> x6).
Theorem explicit_OrderedField_minus_leq : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x6 x7 -> x5 (explicit_Field_minus x0 x1 x2 x3 x4 x7) (explicit_Field_minus x0 x1 x2 x3 x4 x6)))).
admit.
Qed.
Axiom explicit_Field_minus_square : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 (explicit_Field_minus x0 x1 x2 x3 x4 x5) (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x4 x5 x5)).
Theorem explicit_OrderedField_square_nonneg : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> x5 x1 (x4 x6 x6))).
admit.
Qed.
Theorem explicit_OrderedField_sum_squares_nonneg : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x1 (x3 (x4 x6 x6) (x4 x7 x7))))).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_d1bdb1f8b22b849ace01cbcd6c090eba1f645244479242be5e13f2accd31d097 : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x1 x6 -> x5 x1 x7 -> x3 x6 x7 = x1 -> x7 = x1))).
admit.
Qed.
Theorem explicit_OrderedField_sum_nonneg_zero_inv : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x1 x6 -> x5 x1 x7 -> x3 x6 x7 = x1 -> and (x6 = x1) (x7 = x1)))).
admit.
Qed.
Theorem explicit_OrderedField_sum_squares_zero_inv : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 (x4 x6 x6) (x4 x7 x7) = x1 -> and (x6 = x1) (x7 = x1)))).
admit.
Qed.
