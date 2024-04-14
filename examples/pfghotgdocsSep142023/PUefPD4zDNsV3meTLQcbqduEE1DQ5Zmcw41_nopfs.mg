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
Definition explicit_Nats : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (and (and (x1 :e x0) (forall x3, x3 :e x0 -> x2 x3 :e x0)) (forall x3, x3 :e x0 -> x2 x3 = x1 -> (forall x4 : prop, x4))) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3 : set -> prop, x3 x1 -> (forall x4, x3 x4 -> x3 (x2 x4)) -> (forall x4, x4 :e x0 -> x3 x4))).
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Theorem explicit_Nats_I : (forall x0 x1, forall x2 : set -> set, x1 :e x0 -> (forall x3, x3 :e x0 -> x2 x3 :e x0) -> (forall x3, x3 :e x0 -> x2 x3 = x1 -> (forall x4 : prop, x4)) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3 : set -> prop, x3 x1 -> (forall x4, x3 x4 -> x3 (x2 x4)) -> (forall x4, x4 :e x0 -> x3 x4)) -> explicit_Nats x0 x1 x2).
admit.
Qed.
Axiom and5E : (forall x0 x1 x2 x3 x4 : prop, and (and (and (and x0 x1) x2) x3) x4 -> (forall x5 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5) -> x5)).
Theorem explicit_Nats_E : (forall x0 x1, forall x2 : set -> set, forall x3 : prop, (explicit_Nats x0 x1 x2 -> x1 :e x0 -> (forall x4, x4 :e x0 -> x2 x4 :e x0) -> (forall x4, x4 :e x0 -> x2 x4 = x1 -> (forall x5 : prop, x5)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4 : set -> prop, x4 x1 -> (forall x5, x4 x5 -> x4 (x2 x5)) -> (forall x5, x5 :e x0 -> x4 x5)) -> x3) -> explicit_Nats x0 x1 x2 -> x3).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem explicit_Nats_ind : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3 : set -> prop, x3 x1 -> (forall x4, x4 :e x0 -> x3 x4 -> x3 (x2 x4)) -> (forall x4, x4 :e x0 -> x3 x4))).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom missingprop_87d981ec36961a0324ea5d0962fa0689e652a1a367082910c100751340d2d034 : 0 :e omega.
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Axiom ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
Definition nat_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, x1 0 -> (forall x2, x1 x2 -> x1 (ordsucc x2)) -> x1 x0).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem explicit_Nats_omega : explicit_Nats omega 0 ordsucc.
admit.
Qed.
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Theorem explicit_Nats_transfer : (forall x0 x1, forall x2 : set -> set, forall x3 x4, forall x5 x6 : set -> set, explicit_Nats x0 x1 x2 -> bij x0 x3 x6 -> x6 x1 = x4 -> (forall x7, x7 :e x0 -> x6 (x2 x7) = x5 (x6 x7)) -> explicit_Nats x3 x4 x5).
admit.
Qed.
Definition explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => and (and (and (and (and (and (and (and (and (and (and (and (and (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7)))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5))) (x1 :e x0)) (forall x5, x5 :e x0 -> x3 x1 x5 = x5)) (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7)))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5))) (x2 :e x0)) (x2 = x1 -> (forall x5 : prop, x5))) (forall x5, x5 :e x0 -> x4 x2 x5 = x5)) (forall x5, x5 :e x0 -> (x5 = x1 -> (forall x6 : prop, x6)) -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x4 x5 x7 = x2) -> x6) -> x6))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7))))).
Axiom and7I : (forall x0 x1 x2 x3 x4 x5 x6 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6).
Theorem explicit_Field_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5)) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> (x5 = x1 -> (forall x6 : prop, x6)) -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x4 x5 x7 = x2) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> explicit_Field x0 x1 x2 x3 x4).
admit.
Qed.
Axiom and7E : (forall x0 x1 x2 x3 x4 x5 x6 : prop, and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6 -> (forall x7 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7) -> x7)).
Theorem explicit_Field_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (x6 = x1 -> (forall x7 : prop, x7)) -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x4 x6 x8 = x2) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_Field x0 x1 x2 x3 x4 -> x5).
admit.
Qed.
Definition explicit_Field_minus : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> set -> set :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set => Eps_i (fun x6 : set => and (x6 :e x0) (x3 x5 x6 = x1))).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem explicit_Field_minus_prop : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> and (explicit_Field_minus x0 x1 x2 x3 x4 x5 :e x0) (x3 x5 (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x1))).
admit.
Qed.
Theorem explicit_Field_minus_clos : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 x5 :e x0)).
admit.
Qed.
Theorem explicit_Field_minus_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 x5 (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x1)).
admit.
Qed.
Theorem explicit_Field_minus_L : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 (explicit_Field_minus x0 x1 x2 x3 x4 x5) x5 = x1)).
admit.
Qed.
Theorem explicit_Field_plus_cancelL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x6 = x3 x5 x7 -> x6 = x7)))).
admit.
Qed.
Theorem explicit_Field_plus_cancelR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x7 = x3 x6 x7 -> x5 = x6)))).
admit.
Qed.
Theorem explicit_Field_minus_invol : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x5)).
admit.
Qed.
Theorem explicit_Field_minus_one_In : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> explicit_Field_minus x0 x1 x2 x3 x4 x2 :e x0).
admit.
Qed.
Theorem explicit_Field_zero_multR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x5 x1 = x1)).
admit.
Qed.
Theorem explicit_Field_zero_multL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x1 x5 = x1)).
admit.
Qed.
Theorem explicit_Field_minus_mult : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 x5 = x4 (explicit_Field_minus x0 x1 x2 x3 x4 x2) x5)).
admit.
Qed.
Theorem explicit_Field_minus_one_square : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> x4 (explicit_Field_minus x0 x1 x2 x3 x4 x2) (explicit_Field_minus x0 x1 x2 x3 x4 x2) = x2).
admit.
Qed.
Theorem explicit_Field_minus_square : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 (explicit_Field_minus x0 x1 x2 x3 x4 x5) (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x4 x5 x5)).
admit.
Qed.
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition explicit_OrderedField : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => and (and (and (and (and (explicit_Field x0 x1 x2 x3 x4) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 x7 x8 -> x5 x6 x8)))) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> iff (and (x5 x6 x7) (x5 x7 x6)) (x6 = x7)))) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> or (x5 x6 x7) (x5 x7 x6)))) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 (x3 x6 x8) (x3 x7 x8))))) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x1 x6 -> x5 x1 x7 -> x5 x1 (x4 x6 x7)))).
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Theorem explicit_OrderedField_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 x7 x8 -> x5 x6 x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> iff (and (x5 x6 x7) (x5 x7 x6)) (x6 = x7))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> or (x5 x6 x7) (x5 x7 x6))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 (x3 x6 x8) (x3 x7 x8)))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x1 x6 -> x5 x1 x7 -> x5 x1 (x4 x6 x7))) -> explicit_OrderedField x0 x1 x2 x3 x4 x5).
admit.
Qed.
Axiom and6E : (forall x0 x1 x2 x3 x4 x5 : prop, and (and (and (and (and x0 x1) x2) x3) x4) x5 -> (forall x6 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6) -> x6)).
Theorem explicit_OrderedField_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Field x0 x1 x2 x3 x4 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 x8 x9 -> x5 x7 x9))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> iff (and (x5 x7 x8) (x5 x8 x7)) (x7 = x8))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> or (x5 x7 x8) (x5 x8 x7))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 (x3 x7 x9) (x3 x8 x9)))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x1 x7 -> x5 x1 x8 -> x5 x1 (x4 x7 x8))) -> x6) -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> x6).
admit.
Qed.
Definition lt : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 x7 : set => and (x5 x6 x7) (x6 = x7 -> (forall x8 : prop, x8))).
Definition natOfOrderedField_p : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 : set => forall x7 : set -> prop, x7 x1 -> (forall x8, x7 x8 -> x7 (x3 x8 x2)) -> x7 x6).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Theorem explicit_Nats_natOfOrderedField : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Nats (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) x1 (fun x6 : set => x3 x6 x2)).
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition explicit_Reals : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => and (and (explicit_OrderedField x0 x1 x2 x3 x4 x5) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x6 -> x5 x1 x7 -> (forall x8 : prop, (forall x9, and (x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x7 (x4 x9 x6)) -> x8) -> x8)))) (forall x6, x6 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x6 x8) (ap x7 x8)) (x5 (ap x6 x8) (ap x6 (x3 x8 x2)))) (x5 (ap x7 (x3 x8 x2)) (ap x7 x8))) -> (forall x8 : prop, (forall x9, and (x9 :e x0) (forall x10, x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x6 x10) x9) (x5 x9 (ap x7 x10))) -> x8) -> x8)))).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem explicit_Reals_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x6 -> x5 x1 x7 -> (forall x8 : prop, (forall x9, and (x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x7 (x4 x9 x6)) -> x8) -> x8))) -> (forall x6, x6 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x6 x8) (ap x7 x8)) (x5 (ap x6 x8) (ap x6 (x3 x8 x2)))) (x5 (ap x7 (x3 x8 x2)) (ap x7 x8))) -> (forall x8 : prop, (forall x9, and (x9 :e x0) (forall x10, x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x6 x10) x9) (x5 x9 (ap x7 x10))) -> x8) -> x8))) -> explicit_Reals x0 x1 x2 x3 x4 x5).
admit.
Qed.
Axiom and3E : (forall x0 x1 x2 : prop, and (and x0 x1) x2 -> (forall x3 : prop, (x0 -> x1 -> x2 -> x3) -> x3)).
Theorem explicit_Reals_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_Reals x0 x1 x2 x3 x4 x5 -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x7 -> x5 x1 x8 -> (forall x9 : prop, (forall x10, and (x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x8 (x4 x10 x7)) -> x9) -> x9))) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x9, x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x7 x9) (ap x8 x9)) (x5 (ap x7 x9) (ap x7 (x3 x9 x2)))) (x5 (ap x8 (x3 x9 x2)) (ap x8 x9))) -> (forall x9 : prop, (forall x10, and (x10 :e x0) (forall x11, x11 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x7 x11) x10) (x5 x10 (ap x8 x11))) -> x9) -> x9))) -> x6) -> explicit_Reals x0 x1 x2 x3 x4 x5 -> x6).
admit.
Qed.
Theorem explicit_Field_transfer : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 x6 x7, forall x8 x9 : set -> set -> set, forall x10 : set -> set, explicit_Field x0 x1 x2 x3 x4 -> bij x0 x5 x10 -> x10 x1 = x6 -> x10 x2 = x7 -> (forall x11, x11 :e x0 -> (forall x12, x12 :e x0 -> x10 (x3 x11 x12) = x8 (x10 x11) (x10 x12))) -> (forall x11, x11 :e x0 -> (forall x12, x12 :e x0 -> x10 (x4 x11 x12) = x9 (x10 x11) (x10 x12))) -> explicit_Field x5 x6 x7 x8 x9).
admit.
Qed.
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem explicit_OrderedField_transfer : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 x7 x8, forall x9 x10 : set -> set -> set, forall x11 : set -> set -> prop, forall x12 : set -> set, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> bij x0 x6 x12 -> x12 x1 = x7 -> x12 x2 = x8 -> (forall x13, x13 :e x0 -> (forall x14, x14 :e x0 -> x12 (x3 x13 x14) = x9 (x12 x13) (x12 x14))) -> (forall x13, x13 :e x0 -> (forall x14, x14 :e x0 -> x12 (x4 x13 x14) = x10 (x12 x13) (x12 x14))) -> (forall x13, x13 :e x0 -> (forall x14, x14 :e x0 -> iff (x5 x13 x14) (x11 (x12 x13) (x12 x14)))) -> explicit_OrderedField x6 x7 x8 x9 x10 x11).
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Theorem explicit_Reals_transfer : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 x7 x8, forall x9 x10 : set -> set -> set, forall x11 : set -> set -> prop, forall x12 : set -> set, explicit_Reals x0 x1 x2 x3 x4 x5 -> bij x0 x6 x12 -> x12 x1 = x7 -> x12 x2 = x8 -> (forall x13, x13 :e x0 -> (forall x14, x14 :e x0 -> x12 (x3 x13 x14) = x9 (x12 x13) (x12 x14))) -> (forall x13, x13 :e x0 -> (forall x14, x14 :e x0 -> x12 (x4 x13 x14) = x10 (x12 x13) (x12 x14))) -> (forall x13, x13 :e x0 -> (forall x14, x14 :e x0 -> iff (x5 x13 x14) (x11 (x12 x13) (x12 x14)))) -> explicit_Reals x6 x7 x8 x9 x10 x11).
admit.
Qed.
Definition explicit_Complex : set -> (set -> set) -> (set -> set) -> set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> set => fun x3 x4 x5 : set => fun x6 x7 : set -> set -> set => and (and (and (and (and (and (and (and (explicit_Field x0 x3 x4 x6 x7) (forall x8 : prop, (forall x9 : set -> set -> prop, explicit_Reals (Sep x0 (fun x10 : set => forall x11 : set -> set -> prop, x11 (x1 x10) x10 -> x11 x10 (x1 x10))) x3 x4 x6 x7 x9 -> x8) -> x8)) (forall x8, x8 :e x0 -> x2 x8 :e Sep x0 (fun x9 : set => forall x10 : set -> set -> prop, x10 (x1 x9) x9 -> x10 x9 (x1 x9)))) (x5 :e x0)) (forall x8, x8 :e x0 -> x1 x8 :e x0)) (forall x8, x8 :e x0 -> x2 x8 :e x0)) (forall x8, x8 :e x0 -> x8 = x6 (x1 x8) (x7 x5 (x2 x8)))) (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x1 x8 = x1 x9 -> x2 x8 = x2 x9 -> x8 = x9))) (x6 (x7 x5 x5) x4 = x3)).
Theorem explicit_Complex_I : (forall x0, forall x1 x2 : set -> set, forall x3 x4 x5, forall x6 x7 : set -> set -> set, explicit_Field x0 x3 x4 x6 x7 -> (forall x8 : prop, (forall x9 : set -> set -> prop, explicit_Reals (Sep x0 (fun x10 : set => forall x11 : set -> set -> prop, x11 (x1 x10) x10 -> x11 x10 (x1 x10))) x3 x4 x6 x7 x9 -> x8) -> x8) -> (forall x8, x8 :e x0 -> x2 x8 :e Sep x0 (fun x9 : set => forall x10 : set -> set -> prop, x10 (x1 x9) x9 -> x10 x9 (x1 x9))) -> x5 :e x0 -> (forall x8, x8 :e x0 -> x1 x8 :e x0) -> (forall x8, x8 :e x0 -> x2 x8 :e x0) -> (forall x8, x8 :e x0 -> x8 = x6 (x1 x8) (x7 x5 (x2 x8))) -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x1 x8 = x1 x9 -> x2 x8 = x2 x9 -> x8 = x9)) -> x6 (x7 x5 x5) x4 = x3 -> explicit_Complex x0 x1 x2 x3 x4 x5 x6 x7).
admit.
Qed.
