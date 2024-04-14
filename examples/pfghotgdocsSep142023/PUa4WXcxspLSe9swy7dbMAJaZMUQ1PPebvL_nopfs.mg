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
(* Parameter explicit_Nats "4a59caa11140eabb1b7db2d3493fe76a92b002b3b27e3dfdd313708c6c6ca78f" "3fb62f75e778736947d086a36d35ebe45a5d60bf0a340a0761ba08a396d4123a" *)
Parameter explicit_Nats : set -> set -> (set -> set) -> prop.
(* Parameter explicit_Nats_primrec "5ec40a637f9843917a81733636ffe333120e9a78db0c1236764d271d8704674a" "a61e60c0704e01255992ecc776a771ad4ef672b2ed0f4edea9713442d02c0ba9" *)
Parameter explicit_Nats_primrec : set -> set -> (set -> set) -> set -> (set -> set -> set) -> set -> set.
Axiom explicit_Nats_E : (forall x0 x1, forall x2 : set -> set, forall x3 : prop, (explicit_Nats x0 x1 x2 -> x1 :e x0 -> (forall x4, x4 :e x0 -> x2 x4 :e x0) -> (forall x4, x4 :e x0 -> x2 x4 = x1 -> (forall x5 : prop, x5)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4 : set -> prop, x4 x1 -> (forall x5, x4 x5 -> x4 (x2 x5)) -> (forall x5, x5 :e x0 -> x4 x5)) -> x3) -> explicit_Nats x0 x1 x2 -> x3).
Axiom explicit_Nats_ind : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3 : set -> prop, x3 x1 -> (forall x4, x4 :e x0 -> x3 x4 -> x3 (x2 x4)) -> (forall x4, x4 :e x0 -> x3 x4))).
Axiom explicit_Nats_primrec_base : (forall x0 x1, forall x2 : set -> set, forall x3, forall x4 : set -> set -> set, explicit_Nats x0 x1 x2 -> explicit_Nats_primrec x0 x1 x2 x3 x4 x1 = x3).
Axiom explicit_Nats_primrec_S : (forall x0 x1, forall x2 : set -> set, forall x3, forall x4 : set -> set -> set, explicit_Nats x0 x1 x2 -> (forall x5, x5 :e x0 -> explicit_Nats_primrec x0 x1 x2 x3 x4 (x2 x5) = x4 x5 (explicit_Nats_primrec x0 x1 x2 x3 x4 x5))).
Theorem explicit_Nats_primrec_P : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3 : set -> prop, forall x4, x3 x4 -> (forall x5 : set -> set -> set, (forall x6, x6 :e x0 -> (forall x7, x3 x7 -> x3 (x5 x6 x7))) -> (forall x6, x6 :e x0 -> x3 (explicit_Nats_primrec x0 x1 x2 x4 x5 x6))))).
admit.
Qed.
Definition explicit_Nats_zero_plus : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => explicit_Nats_primrec x0 x1 x2 x4 (fun x5 : set => x2) x3).
Definition explicit_Nats_zero_mult : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => explicit_Nats_primrec x0 x1 x2 x1 (fun x5 : set => explicit_Nats_zero_plus x0 x1 x2 x4) x3).
Theorem explicit_Nats_zero_plus_N : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_zero_plus x0 x1 x2 x3 x4 :e x0))).
admit.
Qed.
Theorem explicit_Nats_zero_mult_N : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_zero_mult x0 x1 x2 x3 x4 :e x0))).
admit.
Qed.
Axiom explicit_Nats_zero_plus_0L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_zero_plus x0 x1 x2 x1 x3 = x3)).
Axiom explicit_Nats_zero_plus_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_zero_plus x0 x1 x2 (x2 x3) x4 = x2 (explicit_Nats_zero_plus x0 x1 x2 x3 x4)))).
Axiom explicit_Nats_zero_mult_0L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_zero_mult x0 x1 x2 x1 x3 = x1)).
Axiom explicit_Nats_zero_mult_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_zero_mult x0 x1 x2 (x2 x3) x4 = explicit_Nats_zero_plus x0 x1 x2 x4 (explicit_Nats_zero_mult x0 x1 x2 x3 x4)))).
Definition explicit_Nats_one_plus : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => explicit_Nats_primrec x0 x1 x2 (x2 x4) (fun x5 : set => x2) x3).
Theorem explicit_Nats_one_plus_N : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_one_plus x0 x1 x2 x3 x4 :e x0))).
admit.
Qed.
Definition explicit_Nats_one_mult : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => explicit_Nats_primrec x0 x1 x2 x4 (fun x5 : set => explicit_Nats_one_plus x0 x1 x2 x4) x3).
Theorem explicit_Nats_one_mult_N : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_one_mult x0 x1 x2 x3 x4 :e x0))).
admit.
Qed.
Definition explicit_Nats_one_exp : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 : set => explicit_Nats_primrec x0 x1 x2 x3 (fun x4 : set => explicit_Nats_one_mult x0 x1 x2 x3)).
Theorem explicit_Nats_one_exp_N : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_one_exp x0 x1 x2 x3 x4 :e x0))).
admit.
Qed.
Axiom explicit_Nats_one_plus_1L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_one_plus x0 x1 x2 x1 x3 = x2 x3)).
Axiom explicit_Nats_one_plus_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_one_plus x0 x1 x2 (x2 x3) x4 = x2 (explicit_Nats_one_plus x0 x1 x2 x3 x4)))).
Axiom explicit_Nats_one_mult_1L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_one_mult x0 x1 x2 x1 x3 = x3)).
Axiom explicit_Nats_one_mult_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_one_mult x0 x1 x2 (x2 x3) x4 = explicit_Nats_one_plus x0 x1 x2 x4 (explicit_Nats_one_mult x0 x1 x2 x3 x4)))).
Axiom explicit_Nats_one_exp_1L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_one_exp x0 x1 x2 x3 x1 = x3)).
Axiom explicit_Nats_one_exp_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_one_exp x0 x1 x2 x3 (x2 x4) = explicit_Nats_one_mult x0 x1 x2 x3 (explicit_Nats_one_exp x0 x1 x2 x3 x4)))).
Theorem AssocComm_identities : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4))) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 = x1 x3 x2)) -> (forall x2 : prop, ((forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 (x1 x4 x5) = x1 x4 (x1 x3 x5)))) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 (x1 x4 x5) = x1 x5 (x1 x3 x4)))) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 (x1 x3 x4) (x1 x5 x6) = x1 (x1 x3 x5) (x1 x4 x6))))) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x3 (x1 x4 (x1 x5 x6)) = x1 x6 (x1 x3 (x1 x4 x5)))))) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x3 (x1 x4 (x1 x5 x6)) = x1 x5 (x1 x6 (x1 x3 x4)))))) -> x2) -> x2)).
admit.
Qed.
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom explicit_Field_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (x6 = x1 -> (forall x7 : prop, x7)) -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x4 x6 x8 = x2) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_Field x0 x1 x2 x3 x4 -> x5).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom explicit_Field_zero_multL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x1 x5 = x1)).
Theorem explicit_Field_mult_zero_inv : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x1 -> or (x5 = x1) (x6 = x1)))).
admit.
Qed.
(* Parameter explicit_OrderedField "1195f96dcd143e4b896b4c1eb080d1fb877084debc58a8626d3dcf7a14ce8df7" "a18f7bca989a67fb7dc6df8e6c094372c26fa2c334578447d3314616155afb72" *)
Parameter explicit_OrderedField : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom explicit_OrderedField_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Field x0 x1 x2 x3 x4 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 x8 x9 -> x5 x7 x9))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> iff (and (x5 x7 x8) (x5 x8 x7)) (x7 = x8))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> or (x5 x7 x8) (x5 x8 x7))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 (x3 x7 x9) (x3 x8 x9)))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x1 x7 -> x5 x1 x8 -> x5 x1 (x4 x7 x8))) -> x6) -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> x6).
Theorem explicit_OrderedField_leq_refl : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> x5 x6 x6)).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem explicit_OrderedField_leq_antisym : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x6 x7 -> x5 x7 x6 -> x6 = x7))).
admit.
Qed.
Theorem explicit_OrderedField_leq_tra : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 x7 x8 -> x5 x6 x8)))).
admit.
Qed.
Axiom explicit_OrderedField_square_nonneg : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> x5 x1 (x4 x6 x6))).
Theorem explicit_OrderedField_leq_zero_one : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> x5 x1 x2).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition natOfOrderedField_p : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 : set => forall x7 : set -> prop, x7 x1 -> (forall x8, x7 x8 -> x7 (x3 x8 x2)) -> x7 x6).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom explicit_Nats_I : (forall x0 x1, forall x2 : set -> set, x1 :e x0 -> (forall x3, x3 :e x0 -> x2 x3 :e x0) -> (forall x3, x3 :e x0 -> x2 x3 = x1 -> (forall x4 : prop, x4)) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3 : set -> prop, x3 x1 -> (forall x4, x3 x4 -> x3 (x2 x4)) -> (forall x4, x4 :e x0 -> x3 x4)) -> explicit_Nats x0 x1 x2).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom explicit_Field_plus_cancelR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x7 = x3 x6 x7 -> x5 = x6)))).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom explicit_Nats_natOfOrderedField : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Nats (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) x1 (fun x6 : set => x3 x6 x2)).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Theorem explicit_PosNats_natOfOrderedField : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Nats (Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x6 : set => x6 = x1 -> (forall x7 : prop, x7))) x2 (fun x6 : set => x3 x6 x2)).
admit.
Qed.
(* Parameter explicit_Field_minus "be660f6f1e37e7325ec2a39529b9c937b61a60f864e85f0dabdf2bddacb0986e" "5be570b4bcbe7fefd36c2057491ddcc7b11903d8d98ca54d9b37db60d1bf0f7e" *)
Parameter explicit_Field_minus : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> set -> set.
Definition explicit_OrderedField_rationalp : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 : set => forall x7 : prop, (forall x8, and (x8 :e Sep x0 (fun x9 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) (x9 = x1)) (x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))))) (forall x9 : prop, (forall x10, and (x10 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x11 : set => x11 = x1 -> (forall x12 : prop, x12))) (x4 x10 x6 = x8) -> x9) -> x9) -> x7) -> x7).
Axiom explicit_Field_dist_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 (x3 x5 x6) x7 = x3 (x4 x5 x7) (x4 x6 x7))))).
Theorem explicit_OrderedField_Npos_props : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6 : prop, (Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x7 : set => x7 = x1 -> (forall x8 : prop, x8)) c= x0 -> explicit_Nats (Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x7 : set => x7 = x1 -> (forall x8 : prop, x8))) x2 (fun x7 : set => x3 x7 x2) -> x2 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x7 : set => x7 = x1 -> (forall x8 : prop, x8)) -> (forall x7, x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)) -> x3 x7 x2 = x2 -> (forall x8 : prop, x8)) -> (forall x7, x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)) -> (forall x8 : set -> prop, x8 x2 -> (forall x9, x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11)) -> x8 (x3 x9 x2)) -> x8 x7)) -> (forall x7, x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)) -> (forall x8, x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)) -> explicit_Nats_one_plus (Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) x2 (fun x10 : set => x3 x10 x2) x7 x8 = x3 x7 x8)) -> (forall x7, x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)) -> (forall x8, x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)) -> explicit_Nats_one_mult (Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) x2 (fun x10 : set => x3 x10 x2) x7 x8 = x4 x7 x8)) -> (forall x7, x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)) -> (forall x8, x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)) -> x3 x7 x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)))) -> (forall x7, x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)) -> (forall x8, x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)) -> x4 x7 x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)))) -> x6) -> x6)).
admit.
Qed.
Axiom explicit_Field_minus_invol : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x5)).
Axiom explicit_Field_minus_mult_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 (explicit_Field_minus x0 x1 x2 x3 x4 x6) = explicit_Field_minus x0 x1 x2 x3 x4 (x4 x5 x6)))).
Axiom explicit_Field_zero_multR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x5 x1 = x1)).
Axiom explicit_Field_minus_plus_dist : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 (x3 x5 x6) = x3 (explicit_Field_minus x0 x1 x2 x3 x4 x5) (explicit_Field_minus x0 x1 x2 x3 x4 x6)))).
Axiom explicit_Field_minus_clos : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 x5 :e x0)).
Axiom explicit_Field_minus_L : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 (explicit_Field_minus x0 x1 x2 x3 x4 x5) x5 = x1)).
Axiom explicit_Field_minus_zero : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> explicit_Field_minus x0 x1 x2 x3 x4 x1 = x1).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Theorem explicit_OrderedField_Z_props : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6 : prop, ((forall x7, x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)) -> explicit_Field_minus x0 x1 x2 x3 x4 x7 :e Sep x0 (fun x8 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10))) (x8 = x1)) (x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10))))) -> x1 :e Sep x0 (fun x7 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9))) (x7 = x1)) (x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)))) -> Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x7 : set => x7 = x1 -> (forall x8 : prop, x8)) c= Sep x0 (fun x7 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9))) (x7 = x1)) (x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)))) -> Sep x0 (fun x7 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9))) (x7 = x1)) (x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)))) c= x0 -> (forall x7, x7 :e Sep x0 (fun x8 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10))) (x8 = x1)) (x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)))) -> (forall x8 : prop, (explicit_Field_minus x0 x1 x2 x3 x4 x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)) -> x8) -> (x7 = x1 -> x8) -> (x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)) -> x8) -> x8)) -> x2 :e Sep x0 (fun x7 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9))) (x7 = x1)) (x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)))) -> explicit_Field_minus x0 x1 x2 x3 x4 x2 :e Sep x0 (fun x7 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9))) (x7 = x1)) (x7 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x8 : set => x8 = x1 -> (forall x9 : prop, x9)))) -> (forall x7, x7 :e Sep x0 (fun x8 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10))) (x8 = x1)) (x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)))) -> explicit_Field_minus x0 x1 x2 x3 x4 x7 :e Sep x0 (fun x8 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10))) (x8 = x1)) (x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10))))) -> (forall x7, x7 :e Sep x0 (fun x8 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10))) (x8 = x1)) (x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)))) -> (forall x8, x8 :e Sep x0 (fun x9 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) (x9 = x1)) (x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11)))) -> x3 x7 x8 :e Sep x0 (fun x9 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) (x9 = x1)) (x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11)))))) -> (forall x7, x7 :e Sep x0 (fun x8 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10))) (x8 = x1)) (x8 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)))) -> (forall x8, x8 :e Sep x0 (fun x9 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) (x9 = x1)) (x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11)))) -> x4 x7 x8 :e Sep x0 (fun x9 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) (x9 = x1)) (x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11)))))) -> x6) -> x6)).
admit.
Qed.
Theorem explicit_OrderedField_Q_props : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6 : prop, (Sep x0 (explicit_OrderedField_rationalp x0 x1 x2 x3 x4 x5) c= x0 -> (forall x7, x7 :e Sep x0 (explicit_OrderedField_rationalp x0 x1 x2 x3 x4 x5) -> (forall x8 : prop, (x7 :e x0 -> (forall x9, x9 :e Sep x0 (fun x10 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x10 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x11 : set => x11 = x1 -> (forall x12 : prop, x12))) (x10 = x1)) (x10 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x11 : set => x11 = x1 -> (forall x12 : prop, x12)))) -> (forall x10, x10 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x11 : set => x11 = x1 -> (forall x12 : prop, x12)) -> x4 x10 x7 = x9 -> x8))) -> x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e Sep x0 (fun x9 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) (x9 = x1)) (x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11)))) -> (forall x9, x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11)) -> x4 x9 x7 = x8 -> x7 :e Sep x0 (explicit_OrderedField_rationalp x0 x1 x2 x3 x4 x5)))) -> x6) -> x6)).
admit.
Qed.
Axiom explicit_Field_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5)) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> (x5 = x1 -> (forall x6 : prop, x6)) -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x4 x5 x7 = x2) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> explicit_Field x0 x1 x2 x3 x4).
Axiom explicit_Field_minus_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 x5 (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x1)).
Axiom explicit_Field_minus_mult_L : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 (explicit_Field_minus x0 x1 x2 x3 x4 x5) x6 = explicit_Field_minus x0 x1 x2 x3 x4 (x4 x5 x6)))).
Theorem explicit_OrderedField_explicit_Field_Q : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Field (Sep x0 (explicit_OrderedField_rationalp x0 x1 x2 x3 x4 x5)) x1 x2 x3 x4).
admit.
Qed.
(* Parameter explicit_Reals "e5dee14fc7a24a63555de85859904de8dc1b462044060d68dbb06cc9a590bc38" "2c81615a11c9e3e301f3301ec7862ba122acea20bfe1c120f7bdaf5a2e18faf4" *)
Parameter explicit_Reals : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition lt : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 x7 : set => and (x5 x6 x7) (x6 = x7 -> (forall x8 : prop, x8))).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom explicit_Reals_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_Reals x0 x1 x2 x3 x4 x5 -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x7 -> x5 x1 x8 -> (forall x9 : prop, (forall x10, and (x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x8 (x4 x10 x7)) -> x9) -> x9))) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x9, x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x7 x9) (ap x8 x9)) (x5 (ap x7 x9) (ap x7 (x3 x9 x2)))) (x5 (ap x8 (x3 x9 x2)) (ap x8 x9))) -> (forall x9 : prop, (forall x10, and (x10 :e x0) (forall x11, x11 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x7 x11) x10) (x5 x10 (ap x8 x11))) -> x9) -> x9))) -> x6) -> explicit_Reals x0 x1 x2 x3 x4 x5 -> x6).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Theorem explicit_Reals_characteristic_0 : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_Reals x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e omega -> nat_primrec x2 (fun x8 : set => x3 x2) x6 = x1 -> (forall x7 : prop, x7))).
admit.
Qed.
Axiom explicit_OrderedField_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 x7 x8 -> x5 x6 x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> iff (and (x5 x6 x7) (x5 x7 x6)) (x6 = x7))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> or (x5 x6 x7) (x5 x7 x6))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 (x3 x6 x8) (x3 x7 x8)))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x1 x6 -> x5 x1 x7 -> x5 x1 (x4 x6 x7))) -> explicit_OrderedField x0 x1 x2 x3 x4 x5).
Theorem explicit_Reals_sub : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 c= x0 -> x1 :e x6 -> x2 :e x6 -> (forall x7, x7 :e x6 -> (forall x8, x8 :e x6 -> x3 x7 x8 :e x6)) -> (forall x7, x7 :e x6 -> explicit_Field_minus x0 x1 x2 x3 x4 x7 :e x6) -> (forall x7, x7 :e x6 -> (forall x8, x8 :e x6 -> x4 x7 x8 :e x6)) -> (forall x7, x7 :e x6 -> (x7 = x1 -> (forall x8 : prop, x8)) -> (forall x8 : prop, (forall x9, and (x9 :e x6) (x4 x7 x9 = x2) -> x8) -> x8)) -> explicit_OrderedField x6 x1 x2 x3 x4 x5)).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom explicit_Field_plus_cancelL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x6 = x3 x5 x7 -> x6 = x7)))).
Theorem explicit_Reals_Q_min_props : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> x6 c= x0 -> explicit_Field x6 x1 x2 x3 x4 -> (forall x7 : prop, ((forall x8, x8 :e x6 -> explicit_Field_minus x6 x1 x2 x3 x4 x8 = explicit_Field_minus x0 x1 x2 x3 x4 x8) -> (forall x8, x8 :e x6 -> explicit_Field_minus x0 x1 x2 x3 x4 x8 :e x6) -> Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) = Sep x6 (natOfOrderedField_p x6 x1 x2 x3 x4 x5) -> Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)) = Sep (Sep x6 (natOfOrderedField_p x6 x1 x2 x3 x4 x5)) (fun x9 : set => x9 = x1 -> (forall x10 : prop, x10)) -> Sep x0 (fun x9 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) (x9 = x1)) (x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11)))) = Sep x6 (fun x9 : set => or (or (explicit_Field_minus x6 x1 x2 x3 x4 x9 :e Sep (Sep x6 (natOfOrderedField_p x6 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) (x9 = x1)) (x9 :e Sep (Sep x6 (natOfOrderedField_p x6 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11)))) -> Sep x0 (explicit_OrderedField_rationalp x0 x1 x2 x3 x4 x5) = Sep x6 (explicit_OrderedField_rationalp x6 x1 x2 x3 x4 x5) -> x7) -> x7)).
admit.
Qed.
Theorem explicit_Reals_Q_min : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 c= x0 -> explicit_Field x6 x1 x2 x3 x4 -> Sep x0 (explicit_OrderedField_rationalp x0 x1 x2 x3 x4 x5) c= x6)).
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter encode_b "21324eab171ba1d7a41ca9f7ad87272b72d2982da5848b0cef9a7fe7653388ad" "4c89a6c736b15453d749c576f63559855d72931c3c7513c44e12ce14882d2fa7" *)
Parameter encode_b : set -> (set -> set -> set) -> set.
(* Parameter encode_r "b1fb9de059c4e510b136e3f2b3833e9b6a459da341bf14d8c0591abe625c04aa" "17bc9f7081d26ba5939127ec0eef23162cf5bbe34ceeb18f41b091639dd2d108" *)
Parameter encode_r : set -> (set -> set -> prop) -> set.
Definition pack_b_b_r_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set :=
 (fun x0 : set => fun x1 x2 : set -> set -> set => fun x3 : set -> set -> prop => fun x4 x5 : set => lam 6 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) (encode_b x0 x1) (If_i (x6 = 2) (encode_b x0 x2) (If_i (x6 = 3) (encode_r x0 x3) (If_i (x6 = 4) x4 x5)))))).
Axiom tuple_6_0_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0) x0 -> x6 x0 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0)).
Theorem pack_b_b_r_e_e_0_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : set -> set -> prop, forall x5 x6, x0 = pack_b_b_r_e_e x1 x2 x3 x4 x5 x6 -> x1 = ap x0 0).
admit.
Qed.
Theorem pack_b_b_r_e_e_0_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, forall x6 : set -> set -> prop, x6 x0 (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) 0) -> x6 (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) 0) x0).
admit.
Qed.
(* Parameter decode_b "86e649daaa54cc94337666c48155bcb9c8d8f416ab6625b9c91601b52ce66901" "1024fb6c1c39aaae4a36f455b998b6ed0405d12e967bf5eae211141970ffa4fa" *)
Parameter decode_b : set -> set -> set -> set.
Axiom tuple_6_1_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 1) x1 -> x6 x1 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 1)).
Axiom decode_encode_b : (forall x0, forall x1 : set -> set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> decode_b (encode_b x0 x1) x2 x3 = x1 x2 x3)).
Theorem pack_b_b_r_e_e_1_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : set -> set -> prop, forall x5 x6, x0 = pack_b_b_r_e_e x1 x2 x3 x4 x5 x6 -> (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = decode_b (ap x0 1) x7 x8))).
admit.
Qed.
Theorem pack_b_b_r_e_e_1_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x1 x6 x7 = decode_b (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) 1) x6 x7)).
admit.
Qed.
Axiom tuple_6_2_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 2) x2 -> x6 x2 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 2)).
Theorem pack_b_b_r_e_e_2_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : set -> set -> prop, forall x5 x6, x0 = pack_b_b_r_e_e x1 x2 x3 x4 x5 x6 -> (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x3 x7 x8 = decode_b (ap x0 2) x7 x8))).
admit.
Qed.
Theorem pack_b_b_r_e_e_2_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 = decode_b (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) 2) x6 x7)).
admit.
Qed.
(* Parameter decode_r "e25e4327c67053c3d99245dbaf92fdb3e5247e754bd6d8291f39ac34b6d57820" "f2f91589fb6488dd2bad3cebb9f65a57b7d7f3818091dcc789edd28f5d0ef2af" *)
Parameter decode_r : set -> set -> set -> prop.
Axiom tuple_6_3_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 3) x3 -> x6 x3 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 3)).
Axiom decode_encode_r : (forall x0, forall x1 : set -> set -> prop, forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> decode_r (encode_r x0 x1) x2 x3 = x1 x2 x3)).
Theorem pack_b_b_r_e_e_3_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : set -> set -> prop, forall x5 x6, x0 = pack_b_b_r_e_e x1 x2 x3 x4 x5 x6 -> (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x4 x7 x8 = decode_r (ap x0 3) x7 x8))).
admit.
Qed.
Theorem pack_b_b_r_e_e_3_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = decode_r (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) 3) x6 x7)).
admit.
Qed.
Axiom tuple_6_4_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 4) x4 -> x6 x4 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 4)).
Theorem pack_b_b_r_e_e_4_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : set -> set -> prop, forall x5 x6, x0 = pack_b_b_r_e_e x1 x2 x3 x4 x5 x6 -> x5 = ap x0 4).
admit.
Qed.
Theorem pack_b_b_r_e_e_4_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, forall x6 : set -> set -> prop, x6 x4 (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) 4) -> x6 (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) 4) x4).
admit.
Qed.
Axiom tuple_6_5_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 5) x5 -> x6 x5 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 5)).
Theorem pack_b_b_r_e_e_5_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : set -> set -> prop, forall x5 x6, x0 = pack_b_b_r_e_e x1 x2 x3 x4 x5 x6 -> x6 = ap x0 5).
admit.
Qed.
Theorem pack_b_b_r_e_e_5_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, forall x6 : set -> set -> prop, x6 x5 (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) 5) -> x6 (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) 5) x5).
admit.
Qed.
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Theorem pack_b_b_r_e_e_inj : (forall x0 x1, forall x2 x3 x4 x5 : set -> set -> set, forall x6 x7 : set -> set -> prop, forall x8 x9 x10 x11, pack_b_b_r_e_e x0 x2 x4 x6 x8 x10 = pack_b_b_r_e_e x1 x3 x5 x7 x9 x11 -> and (and (and (and (and (x0 = x1) (forall x12, x12 :e x0 -> (forall x13, x13 :e x0 -> x2 x12 x13 = x3 x12 x13))) (forall x12, x12 :e x0 -> (forall x13, x13 :e x0 -> x4 x12 x13 = x5 x12 x13))) (forall x12, x12 :e x0 -> (forall x13, x13 :e x0 -> x6 x12 x13 = x7 x12 x13))) (x8 = x9)) (x10 = x11)).
admit.
Qed.
Axiom encode_r_ext : (forall x0, forall x1 x2 : set -> set -> prop, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> iff (x1 x3 x4) (x2 x3 x4))) -> encode_r x0 x1 = encode_r x0 x2).
Axiom encode_b_ext : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> encode_b x0 x1 = encode_b x0 x2).
Theorem pack_b_b_r_e_e_ext : (forall x0, forall x1 x2 x3 x4 : set -> set -> set, forall x5 x6 : set -> set -> prop, forall x7 x8, (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x1 x9 x10 = x2 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x3 x9 x10 = x4 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> iff (x5 x9 x10) (x6 x9 x10))) -> pack_b_b_r_e_e x0 x1 x3 x5 x7 x8 = pack_b_b_r_e_e x0 x2 x4 x6 x7 x8).
admit.
Qed.
Definition struct_b_b_r_e_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> set, (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x4 x5 x6 :e x2)) -> (forall x5 : set -> set -> prop, forall x6, x6 :e x2 -> (forall x7, x7 :e x2 -> x1 (pack_b_b_r_e_e x2 x3 x4 x5 x6 x7))))) -> x1 x0).
Theorem pack_struct_b_b_r_e_e_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 x4 :e x0)) -> (forall x3 : set -> set -> prop, forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5))))).
admit.
Qed.
Theorem pack_struct_b_b_r_e_e_E1 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x1 x6 x7 :e x0))).
admit.
Qed.
Theorem pack_struct_b_b_r_e_e_E2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 :e x0))).
admit.
Qed.
Theorem pack_struct_b_b_r_e_e_E4 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) -> x4 :e x0).
admit.
Qed.
Theorem pack_struct_b_b_r_e_e_E5 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) -> x5 :e x0).
admit.
Qed.
Axiom iff_refl : (forall x0 : prop, iff x0 x0).
Theorem struct_b_b_r_e_e_eta : (forall x0, struct_b_b_r_e_e x0 -> x0 = pack_b_b_r_e_e (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (decode_r (ap x0 3)) (ap x0 4) (ap x0 5)).
admit.
Qed.
Definition unpack_b_b_r_e_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (decode_r (ap x0 3)) (ap x0 4) (ap x0 5)).
Theorem unpack_b_b_r_e_e_i_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set, forall x1, forall x2 x3 : set -> set -> set, forall x4 : set -> set -> prop, forall x5 x6, (forall x7 : set -> set -> set, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> x2 x8 x9 = x7 x8 x9)) -> (forall x8 : set -> set -> set, (forall x9, x9 :e x1 -> (forall x10, x10 :e x1 -> x3 x9 x10 = x8 x9 x10)) -> (forall x9 : set -> set -> prop, (forall x10, x10 :e x1 -> (forall x11, x11 :e x1 -> iff (x4 x10 x11) (x9 x10 x11))) -> x0 x1 x7 x8 x9 x5 x6 = x0 x1 x2 x3 x4 x5 x6))) -> unpack_b_b_r_e_e_i (pack_b_b_r_e_e x1 x2 x3 x4 x5 x6) x0 = x0 x1 x2 x3 x4 x5 x6).
admit.
Qed.
Definition unpack_b_b_r_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (decode_r (ap x0 3)) (ap x0 4) (ap x0 5)).
Theorem unpack_b_b_r_e_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop, forall x1, forall x2 x3 : set -> set -> set, forall x4 : set -> set -> prop, forall x5 x6, (forall x7 : set -> set -> set, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> x2 x8 x9 = x7 x8 x9)) -> (forall x8 : set -> set -> set, (forall x9, x9 :e x1 -> (forall x10, x10 :e x1 -> x3 x9 x10 = x8 x9 x10)) -> (forall x9 : set -> set -> prop, (forall x10, x10 :e x1 -> (forall x11, x11 :e x1 -> iff (x4 x10 x11) (x9 x10 x11))) -> x0 x1 x7 x8 x9 x5 x6 = x0 x1 x2 x3 x4 x5 x6))) -> unpack_b_b_r_e_e_o (pack_b_b_r_e_e x1 x2 x3 x4 x5 x6) x0 = x0 x1 x2 x3 x4 x5 x6).
admit.
Qed.
Definition OrderedFieldStruct : set -> prop :=
 (fun x0 : set => and (struct_b_b_r_e_e x0) (unpack_b_b_r_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 : set -> set -> prop => fun x5 x6 : set => explicit_OrderedField x1 x5 x6 x2 x3 x4))).
Axiom missingprop_020ff441acf63956db89023138d2e3bf192b2578e8bfb819c9422a66b469b129 : (forall x0 x1 x2, forall x3 x4 x5 x6 : set -> set -> set, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x7 x8 = x5 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x7 x8 = x6 x7 x8)) -> explicit_Field x0 x1 x2 x3 x4 -> explicit_Field x0 x1 x2 x5 x6).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem missingprop_bae4375e88c2d44b2130484c0c2686703cdc53a204e289a5b7a073f35c0f816b : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 x7 : set -> set -> set, forall x8 : set -> set -> prop, (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x3 x9 x10 = x6 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x4 x9 x10 = x7 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> iff (x5 x9 x10) (x8 x9 x10))) -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_OrderedField x0 x1 x2 x6 x7 x8).
admit.
Qed.
Axiom iff_sym : (forall x0 x1 : prop, iff x0 x1 -> iff x1 x0).
Theorem explicit_OrderedField_repindep : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 x7 : set -> set -> set, forall x8 : set -> set -> prop, (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x3 x9 x10 = x6 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x4 x9 x10 = x7 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> iff (x5 x9 x10) (x8 x9 x10))) -> iff (explicit_OrderedField x0 x1 x2 x3 x4 x5) (explicit_OrderedField x0 x1 x2 x6 x7 x8)).
admit.
Qed.
Axiom prop_ext : (forall x0 x1 : prop, iff x0 x1 -> x0 = x1).
Theorem OrderedFieldStruct_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, forall x6 : prop -> prop -> prop, x6 (unpack_b_b_r_e_e_o (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) (fun x7 : set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> prop => fun x11 x12 : set => explicit_OrderedField x7 x11 x12 x8 x9 x10)) (explicit_OrderedField x0 x4 x5 x1 x2 x3) -> x6 (explicit_OrderedField x0 x4 x5 x1 x2 x3) (unpack_b_b_r_e_e_o (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) (fun x7 : set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> prop => fun x11 x12 : set => explicit_OrderedField x7 x11 x12 x8 x9 x10))).
admit.
Qed.
Definition RealsStruct : set -> prop :=
 (fun x0 : set => and (struct_b_b_r_e_e x0) (unpack_b_b_r_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 : set -> set -> prop => fun x5 x6 : set => explicit_Reals x1 x5 x6 x2 x3 x4))).
Axiom explicit_Reals_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x6 -> x5 x1 x7 -> (forall x8 : prop, (forall x9, and (x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x7 (x4 x9 x6)) -> x8) -> x8))) -> (forall x6, x6 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x6 x8) (ap x7 x8)) (x5 (ap x6 x8) (ap x6 (x3 x8 x2)))) (x5 (ap x7 (x3 x8 x2)) (ap x7 x8))) -> (forall x8 : prop, (forall x9, and (x9 :e x0) (forall x10, x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x6 x10) x9) (x5 x9 (ap x7 x10))) -> x8) -> x8))) -> explicit_Reals x0 x1 x2 x3 x4 x5).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Theorem missingprop_3b552f49d6c33f4d08ab7d5e3880cbc5e8e473340428bccc29909b64db43bcdc : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 x7 : set -> set -> set, forall x8 : set -> set -> prop, (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x3 x9 x10 = x6 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x4 x9 x10 = x7 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> iff (x5 x9 x10) (x8 x9 x10))) -> explicit_Reals x0 x1 x2 x3 x4 x5 -> explicit_Reals x0 x1 x2 x6 x7 x8).
admit.
Qed.
Theorem explicit_Reals_repindep : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 x7 : set -> set -> set, forall x8 : set -> set -> prop, (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x3 x9 x10 = x6 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x4 x9 x10 = x7 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> iff (x5 x9 x10) (x8 x9 x10))) -> iff (explicit_Reals x0 x1 x2 x3 x4 x5) (explicit_Reals x0 x1 x2 x6 x7 x8)).
admit.
Qed.
Theorem RealsStruct_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, forall x6 : prop -> prop -> prop, x6 (unpack_b_b_r_e_e_o (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) (fun x7 : set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> prop => fun x11 x12 : set => explicit_Reals x7 x11 x12 x8 x9 x10)) (explicit_Reals x0 x4 x5 x1 x2 x3) -> x6 (explicit_Reals x0 x4 x5 x1 x2 x3) (unpack_b_b_r_e_e_o (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) (fun x7 : set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> prop => fun x11 x12 : set => explicit_Reals x7 x11 x12 x8 x9 x10))).
admit.
Qed.
