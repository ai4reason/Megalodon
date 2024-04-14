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
Definition explicit_Ring : set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 x3 : set -> set -> set => and (and (and (and (and (and (and (and (and (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 x5 :e x0)) (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x4 (x2 x5 x6) = x2 (x2 x4 x5) x6)))) (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 x5 = x2 x5 x4))) (x1 :e x0)) (forall x4, x4 :e x0 -> x2 x1 x4 = x4)) (forall x4, x4 :e x0 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x4 x6 = x1) -> x5) -> x5))) (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x3 x4 x5 :e x0))) (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x4 (x3 x5 x6) = x3 (x3 x4 x5) x6)))) (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x4 (x2 x5 x6) = x2 (x3 x4 x5) (x3 x4 x6))))) (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 (x2 x4 x5) x6 = x2 (x3 x4 x6) (x3 x5 x6))))).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom and7I : (forall x0 x1 x2 x3 x4 x5 x6 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6).
Theorem explicit_Ring_I : (forall x0 x1, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 x5 :e x0)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x4 (x2 x5 x6) = x2 (x2 x4 x5) x6))) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 x5 = x2 x5 x4)) -> x1 :e x0 -> (forall x4, x4 :e x0 -> x2 x1 x4 = x4) -> (forall x4, x4 :e x0 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x4 x6 = x1) -> x5) -> x5)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x3 x4 x5 :e x0)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x4 (x3 x5 x6) = x3 (x3 x4 x5) x6))) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x4 (x2 x5 x6) = x2 (x3 x4 x5) (x3 x4 x6)))) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 (x2 x4 x5) x6 = x2 (x3 x4 x6) (x3 x5 x6)))) -> explicit_Ring x0 x1 x2 x3).
admit.
Qed.
Axiom and4E : (forall x0 x1 x2 x3 : prop, and (and (and x0 x1) x2) x3 -> (forall x4 : prop, (x0 -> x1 -> x2 -> x3 -> x4) -> x4)).
Axiom and7E : (forall x0 x1 x2 x3 x4 x5 x6 : prop, and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6 -> (forall x7 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7) -> x7)).
Theorem explicit_Ring_E : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : prop, (explicit_Ring x0 x1 x2 x3 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x5 (x2 x6 x7) = x2 (x2 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 = x2 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x2 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x2 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x2 x6 x7) = x2 (x3 x5 x6) (x3 x5 x7)))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 (x2 x5 x6) x7 = x2 (x3 x5 x7) (x3 x6 x7)))) -> x4) -> explicit_Ring x0 x1 x2 x3 -> x4).
admit.
Qed.
Definition explicit_Ring_minus : set -> set -> (set -> set -> set) -> (set -> set -> set) -> set -> set :=
 (fun x0 x1 : set => fun x2 x3 : set -> set -> set => fun x4 : set => Eps_i (fun x5 : set => and (x5 :e x0) (x2 x4 x5 = x1))).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem explicit_Ring_minus_prop : (forall x0 x1, forall x2 x3 : set -> set -> set, explicit_Ring x0 x1 x2 x3 -> (forall x4, x4 :e x0 -> and (explicit_Ring_minus x0 x1 x2 x3 x4 :e x0) (x2 x4 (explicit_Ring_minus x0 x1 x2 x3 x4) = x1))).
admit.
Qed.
Theorem explicit_Ring_minus_clos : (forall x0 x1, forall x2 x3 : set -> set -> set, explicit_Ring x0 x1 x2 x3 -> (forall x4, x4 :e x0 -> explicit_Ring_minus x0 x1 x2 x3 x4 :e x0)).
admit.
Qed.
Theorem explicit_Ring_minus_R : (forall x0 x1, forall x2 x3 : set -> set -> set, explicit_Ring x0 x1 x2 x3 -> (forall x4, x4 :e x0 -> x2 x4 (explicit_Ring_minus x0 x1 x2 x3 x4) = x1)).
admit.
Qed.
Theorem explicit_Ring_minus_L : (forall x0 x1, forall x2 x3 : set -> set -> set, explicit_Ring x0 x1 x2 x3 -> (forall x4, x4 :e x0 -> x2 (explicit_Ring_minus x0 x1 x2 x3 x4) x4 = x1)).
admit.
Qed.
Theorem explicit_Ring_plus_cancelL : (forall x0 x1, forall x2 x3 : set -> set -> set, explicit_Ring x0 x1 x2 x3 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x4 x5 = x2 x4 x6 -> x5 = x6)))).
admit.
Qed.
Theorem explicit_Ring_plus_cancelR : (forall x0 x1, forall x2 x3 : set -> set -> set, explicit_Ring x0 x1 x2 x3 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x4 x6 = x2 x5 x6 -> x4 = x5)))).
admit.
Qed.
Theorem explicit_Ring_minus_invol : (forall x0 x1, forall x2 x3 : set -> set -> set, explicit_Ring x0 x1 x2 x3 -> (forall x4, x4 :e x0 -> explicit_Ring_minus x0 x1 x2 x3 (explicit_Ring_minus x0 x1 x2 x3 x4) = x4)).
admit.
Qed.
Definition explicit_Ring_with_id : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => and (and (and (and (and (and (and (and (and (and (and (and (and (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7)))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5))) (x1 :e x0)) (forall x5, x5 :e x0 -> x3 x1 x5 = x5)) (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7)))) (x2 :e x0)) (x2 = x1 -> (forall x5 : prop, x5))) (forall x5, x5 :e x0 -> x4 x2 x5 = x5)) (forall x5, x5 :e x0 -> x4 x5 x2 = x5)) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7))))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 (x3 x5 x6) x7 = x3 (x4 x5 x7) (x4 x6 x7))))).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem explicit_Ring_with_id_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> x4 x5 x2 = x5) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 (x3 x5 x6) x7 = x3 (x4 x5 x7) (x4 x6 x7)))) -> explicit_Ring_with_id x0 x1 x2 x3 x4).
admit.
Qed.
Theorem explicit_Ring_with_id_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> x4 x6 x2 = x6) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 (x3 x6 x7) x8 = x3 (x4 x6 x8) (x4 x7 x8)))) -> x5) -> explicit_Ring_with_id x0 x1 x2 x3 x4 -> x5).
admit.
Qed.
Theorem explicit_Ring_with_id_Ring : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> explicit_Ring x0 x1 x3 x4).
admit.
Qed.
Theorem explicit_Ring_with_id_minus_clos : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Ring_minus x0 x1 x3 x4 x5 :e x0)).
admit.
Qed.
Theorem explicit_Ring_with_id_minus_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 x5 (explicit_Ring_minus x0 x1 x3 x4 x5) = x1)).
admit.
Qed.
Theorem explicit_Ring_with_id_minus_L : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 (explicit_Ring_minus x0 x1 x3 x4 x5) x5 = x1)).
admit.
Qed.
Theorem explicit_Ring_with_id_plus_cancelL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x6 = x3 x5 x7 -> x6 = x7)))).
admit.
Qed.
Theorem explicit_Ring_with_id_plus_cancelR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x7 = x3 x6 x7 -> x5 = x6)))).
admit.
Qed.
Theorem explicit_Ring_with_id_minus_invol : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Ring_minus x0 x1 x3 x4 (explicit_Ring_minus x0 x1 x3 x4 x5) = x5)).
admit.
Qed.
Theorem explicit_Ring_with_id_minus_one_In : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> explicit_Ring_minus x0 x1 x3 x4 x2 :e x0).
admit.
Qed.
Theorem explicit_Ring_with_id_zero_multR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x5 x1 = x1)).
admit.
Qed.
Theorem explicit_Ring_with_id_zero_multL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x1 x5 = x1)).
admit.
Qed.
Theorem explicit_Ring_with_id_minus_mult : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Ring_minus x0 x1 x3 x4 x5 = x4 (explicit_Ring_minus x0 x1 x3 x4 x2) x5)).
admit.
Qed.
Theorem explicit_Ring_with_id_mult_minus : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Ring_minus x0 x1 x3 x4 x5 = x4 x5 (explicit_Ring_minus x0 x1 x3 x4 x2))).
admit.
Qed.
Theorem explicit_Ring_with_id_minus_one_square : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> x4 (explicit_Ring_minus x0 x1 x3 x4 x2) (explicit_Ring_minus x0 x1 x3 x4 x2) = x2).
admit.
Qed.
Theorem explicit_Ring_with_id_minus_square : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 (explicit_Ring_minus x0 x1 x3 x4 x5) (explicit_Ring_minus x0 x1 x3 x4 x5) = x4 x5 x5)).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition explicit_Ring_with_id_exp_nat : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set => nat_primrec x2 (fun x6 : set => x4 x5)).
Definition explicit_CRing_with_id : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => and (and (and (and (and (and (and (and (and (and (and (and (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7)))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5))) (x1 :e x0)) (forall x5, x5 :e x0 -> x3 x1 x5 = x5)) (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7)))) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5))) (x2 :e x0)) (x2 = x1 -> (forall x5 : prop, x5))) (forall x5, x5 :e x0 -> x4 x2 x5 = x5)) (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7))))).
Theorem explicit_CRing_with_id_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5)) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> explicit_CRing_with_id x0 x1 x2 x3 x4).
admit.
Qed.
Theorem explicit_CRing_with_id_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_CRing_with_id x0 x1 x2 x3 x4 -> x5).
admit.
Qed.
Theorem explicit_CRing_with_id_Ring_with_id : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> explicit_Ring_with_id x0 x1 x2 x3 x4).
admit.
Qed.
Theorem explicit_CRing_with_id_Ring : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> explicit_Ring x0 x1 x3 x4).
admit.
Qed.
Theorem explicit_CRing_with_id_minus_clos : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Ring_minus x0 x1 x3 x4 x5 :e x0)).
admit.
Qed.
Theorem explicit_CRing_with_id_minus_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 x5 (explicit_Ring_minus x0 x1 x3 x4 x5) = x1)).
admit.
Qed.
Theorem explicit_CRing_with_id_minus_L : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 (explicit_Ring_minus x0 x1 x3 x4 x5) x5 = x1)).
admit.
Qed.
Theorem explicit_CRing_with_id_plus_cancelL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x6 = x3 x5 x7 -> x6 = x7)))).
admit.
Qed.
Theorem explicit_CRing_with_id_plus_cancelR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x7 = x3 x6 x7 -> x5 = x6)))).
admit.
Qed.
Theorem explicit_CRing_with_id_minus_invol : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Ring_minus x0 x1 x3 x4 (explicit_Ring_minus x0 x1 x3 x4 x5) = x5)).
admit.
Qed.
Theorem explicit_CRing_with_id_minus_one_In : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> explicit_Ring_minus x0 x1 x3 x4 x2 :e x0).
admit.
Qed.
Theorem explicit_CRing_with_id_zero_multR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x5 x1 = x1)).
admit.
Qed.
Theorem explicit_CRing_with_id_zero_multL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x1 x5 = x1)).
admit.
Qed.
Theorem explicit_CRing_with_id_minus_mult : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Ring_minus x0 x1 x3 x4 x5 = x4 (explicit_Ring_minus x0 x1 x3 x4 x2) x5)).
admit.
Qed.
Theorem explicit_CRing_with_id_mult_minus : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Ring_minus x0 x1 x3 x4 x5 = x4 x5 (explicit_Ring_minus x0 x1 x3 x4 x2))).
admit.
Qed.
Theorem explicit_CRing_with_id_minus_one_square : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> x4 (explicit_Ring_minus x0 x1 x3 x4 x2) (explicit_Ring_minus x0 x1 x3 x4 x2) = x2).
admit.
Qed.
Theorem explicit_CRing_with_id_minus_square : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 (explicit_Ring_minus x0 x1 x3 x4 x5) (explicit_Ring_minus x0 x1 x3 x4 x5) = x4 x5 x5)).
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter encode_b "21324eab171ba1d7a41ca9f7ad87272b72d2982da5848b0cef9a7fe7653388ad" "4c89a6c736b15453d749c576f63559855d72931c3c7513c44e12ce14882d2fa7" *)
Parameter encode_b : set -> (set -> set -> set) -> set.
Definition pack_b_b_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set :=
 (fun x0 : set => fun x1 x2 : set -> set -> set => fun x3 : set => lam 4 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) (encode_b x0 x1) (If_i (x4 = 2) (encode_b x0 x2) x3)))).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom pack_b_b_e_0_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4, x0 = pack_b_b_e x1 x2 x3 x4 -> x1 = ap x0 0).
Axiom pack_b_b_e_0_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3, forall x4 : set -> set -> prop, x4 x0 (ap (pack_b_b_e x0 x1 x2 x3) 0) -> x4 (ap (pack_b_b_e x0 x1 x2 x3) 0) x0).
(* Parameter decode_b "86e649daaa54cc94337666c48155bcb9c8d8f416ab6625b9c91601b52ce66901" "1024fb6c1c39aaae4a36f455b998b6ed0405d12e967bf5eae211141970ffa4fa" *)
Parameter decode_b : set -> set -> set -> set.
Axiom pack_b_b_e_1_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4, x0 = pack_b_b_e x1 x2 x3 x4 -> (forall x5, x5 :e x1 -> (forall x6, x6 :e x1 -> x2 x5 x6 = decode_b (ap x0 1) x5 x6))).
Axiom pack_b_b_e_1_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x4 x5 = decode_b (ap (pack_b_b_e x0 x1 x2 x3) 1) x4 x5)).
Axiom pack_b_b_e_2_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4, x0 = pack_b_b_e x1 x2 x3 x4 -> (forall x5, x5 :e x1 -> (forall x6, x6 :e x1 -> x3 x5 x6 = decode_b (ap x0 2) x5 x6))).
Axiom pack_b_b_e_2_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 x5 = decode_b (ap (pack_b_b_e x0 x1 x2 x3) 2) x4 x5)).
Axiom pack_b_b_e_3_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4, x0 = pack_b_b_e x1 x2 x3 x4 -> x4 = ap x0 3).
Axiom pack_b_b_e_3_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3, forall x4 : set -> set -> prop, x4 x3 (ap (pack_b_b_e x0 x1 x2 x3) 3) -> x4 (ap (pack_b_b_e x0 x1 x2 x3) 3) x3).
Axiom pack_b_b_e_inj : (forall x0 x1, forall x2 x3 x4 x5 : set -> set -> set, forall x6 x7, pack_b_b_e x0 x2 x4 x6 = pack_b_b_e x1 x3 x5 x7 -> and (and (and (x0 = x1) (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x2 x8 x9 = x3 x8 x9))) (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x4 x8 x9 = x5 x8 x9))) (x6 = x7)).
Axiom pack_b_b_e_ext : (forall x0, forall x1 x2 x3 x4 : set -> set -> set, forall x5, (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x1 x6 x7 = x2 x6 x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x4 x6 x7)) -> pack_b_b_e x0 x1 x3 x5 = pack_b_b_e x0 x2 x4 x5).
Definition struct_b_b_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> set, (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x4 x5 x6 :e x2)) -> (forall x5, x5 :e x2 -> x1 (pack_b_b_e x2 x3 x4 x5)))) -> x1 x0).
Axiom pack_struct_b_b_e_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 x4 :e x0)) -> (forall x3, x3 :e x0 -> struct_b_b_e (pack_b_b_e x0 x1 x2 x3)))).
Axiom pack_struct_b_b_e_E1 : (forall x0, forall x1 x2 : set -> set -> set, forall x3, struct_b_b_e (pack_b_b_e x0 x1 x2 x3) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x4 x5 :e x0))).
Axiom pack_struct_b_b_e_E2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3, struct_b_b_e (pack_b_b_e x0 x1 x2 x3) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 x5 :e x0))).
Axiom pack_struct_b_b_e_E3 : (forall x0, forall x1 x2 : set -> set -> set, forall x3, struct_b_b_e (pack_b_b_e x0 x1 x2 x3) -> x3 :e x0).
Axiom struct_b_b_e_eta : (forall x0, struct_b_b_e x0 -> x0 = pack_b_b_e (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (ap x0 3)).
Definition unpack_b_b_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (ap x0 3)).
Axiom unpack_b_b_e_i_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set, forall x1, forall x2 x3 : set -> set -> set, forall x4, (forall x5 : set -> set -> set, (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x2 x6 x7 = x5 x6 x7)) -> (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x3 x7 x8 = x6 x7 x8)) -> x0 x1 x5 x6 x4 = x0 x1 x2 x3 x4)) -> unpack_b_b_e_i (pack_b_b_e x1 x2 x3 x4) x0 = x0 x1 x2 x3 x4).
Definition unpack_b_b_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> prop => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (ap x0 3)).
Axiom unpack_b_b_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> prop, forall x1, forall x2 x3 : set -> set -> set, forall x4, (forall x5 : set -> set -> set, (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x2 x6 x7 = x5 x6 x7)) -> (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x3 x7 x8 = x6 x7 x8)) -> x0 x1 x5 x6 x4 = x0 x1 x2 x3 x4)) -> unpack_b_b_e_o (pack_b_b_e x1 x2 x3 x4) x0 = x0 x1 x2 x3 x4).
Definition Ring : set -> prop :=
 (fun x0 : set => and (struct_b_b_e x0) (unpack_b_b_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 : set => explicit_Ring x1 x4 x2 x3))).
Definition pack_b_b_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 x2 : set -> set -> set => fun x3 x4 : set => lam 5 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) (encode_b x0 x1) (If_i (x5 = 2) (encode_b x0 x2) (If_i (x5 = 3) x3 x4))))).
Axiom pack_b_b_e_e_0_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 x5, x0 = pack_b_b_e_e x1 x2 x3 x4 x5 -> x1 = ap x0 0).
Axiom pack_b_b_e_e_0_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x0 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 0) -> x5 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 0) x0).
Axiom pack_b_b_e_e_1_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 x5, x0 = pack_b_b_e_e x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x2 x6 x7 = decode_b (ap x0 1) x6 x7))).
Axiom pack_b_b_e_e_1_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4 x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 = decode_b (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 1) x5 x6)).
Axiom pack_b_b_e_e_2_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 x5, x0 = pack_b_b_e_e x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x3 x6 x7 = decode_b (ap x0 2) x6 x7))).
Axiom pack_b_b_e_e_2_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4 x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 = decode_b (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 2) x5 x6)).
Axiom pack_b_b_e_e_3_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 x5, x0 = pack_b_b_e_e x1 x2 x3 x4 x5 -> x4 = ap x0 3).
Axiom pack_b_b_e_e_3_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x3 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 3) -> x5 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 3) x3).
Axiom pack_b_b_e_e_4_eq : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 x5, x0 = pack_b_b_e_e x1 x2 x3 x4 x5 -> x5 = ap x0 4).
Axiom pack_b_b_e_e_4_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x4 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 4) -> x5 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 4) x4).
Axiom pack_b_b_e_e_inj : (forall x0 x1, forall x2 x3 x4 x5 : set -> set -> set, forall x6 x7 x8 x9, pack_b_b_e_e x0 x2 x4 x6 x8 = pack_b_b_e_e x1 x3 x5 x7 x9 -> and (and (and (and (x0 = x1) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> x2 x10 x11 = x3 x10 x11))) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> x4 x10 x11 = x5 x10 x11))) (x6 = x7)) (x8 = x9)).
Axiom pack_b_b_e_e_ext : (forall x0, forall x1 x2 x3 x4 : set -> set -> set, forall x5 x6, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x1 x7 x8 = x2 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x7 x8 = x4 x7 x8)) -> pack_b_b_e_e x0 x1 x3 x5 x6 = pack_b_b_e_e x0 x2 x4 x5 x6).
Definition struct_b_b_e_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> set, (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x4 x5 x6 :e x2)) -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x1 (pack_b_b_e_e x2 x3 x4 x5 x6))))) -> x1 x0).
Axiom pack_struct_b_b_e_e_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 x4 :e x0)) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4))))).
Axiom pack_struct_b_b_e_e_E1 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 :e x0))).
Axiom pack_struct_b_b_e_e_E2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 :e x0))).
Axiom pack_struct_b_b_e_e_E3 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> x3 :e x0).
Axiom pack_struct_b_b_e_e_E4 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> x4 :e x0).
Axiom struct_b_b_e_e_eta : (forall x0, struct_b_b_e_e x0 -> x0 = pack_b_b_e_e (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (ap x0 3) (ap x0 4)).
Definition unpack_b_b_e_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (ap x0 3) (ap x0 4)).
Axiom unpack_b_b_e_e_i_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set, forall x1, forall x2 x3 : set -> set -> set, forall x4 x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> set, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> x3 x8 x9 = x7 x8 x9)) -> x0 x1 x6 x7 x4 x5 = x0 x1 x2 x3 x4 x5)) -> unpack_b_b_e_e_i (pack_b_b_e_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
Definition unpack_b_b_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (ap x0 3) (ap x0 4)).
Axiom unpack_b_b_e_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop, forall x1, forall x2 x3 : set -> set -> set, forall x4 x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> set, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> x3 x8 x9 = x7 x8 x9)) -> x0 x1 x6 x7 x4 x5 = x0 x1 x2 x3 x4 x5)) -> unpack_b_b_e_e_o (pack_b_b_e_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
Definition Ring_with_id : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_Ring_with_id x1 x4 x5 x2 x3))).
Definition CRing_with_id : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_CRing_with_id x1 x4 x5 x2 x3))).
Definition Ring_minus : set -> set -> set :=
 (fun x0 x1 : set => unpack_b_b_e_i x0 (fun x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set => explicit_Ring_minus x2 x5 x3 x4 x1)).
Definition Ring_of_Ring_with_id : set -> set :=
 (fun x0 : set => unpack_b_b_e_e_i x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => pack_b_b_e x1 x2 x3 x4)).
