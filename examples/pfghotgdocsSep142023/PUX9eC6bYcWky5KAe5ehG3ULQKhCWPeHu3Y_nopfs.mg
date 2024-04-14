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
Definition missingname_dab7606af601ae243130ff09daae802479457c4d774ec129bd23fa723eb795d6 : set -> set -> (set -> set) -> set -> (set -> set -> set) -> set -> set -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 : set => fun x4 : set -> set -> set => fun x5 x6 : set => forall x7 : set -> set -> prop, x7 x1 x3 -> (forall x8, x8 :e x0 -> (forall x9, x7 x8 x9 -> x7 (x2 x8) (x4 x8 x9))) -> x7 x5 x6).
(* Parameter explicit_Nats "4a59caa11140eabb1b7db2d3493fe76a92b002b3b27e3dfdd313708c6c6ca78f" "3fb62f75e778736947d086a36d35ebe45a5d60bf0a340a0761ba08a396d4123a" *)
Parameter explicit_Nats : set -> set -> (set -> set) -> prop.
Axiom explicit_Nats_ind : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3 : set -> prop, x3 x1 -> (forall x4, x4 :e x0 -> x3 x4 -> x3 (x2 x4)) -> (forall x4, x4 :e x0 -> x3 x4))).
Theorem missingprop_f4957c6c8fd18fac2fb0b1d8e4e76acd033ec5e8e3d225d6663f62ada99582b4 : (forall x0 x1, forall x2 : set -> set, forall x3, forall x4 : set -> set -> set, explicit_Nats x0 x1 x2 -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, missingname_dab7606af601ae243130ff09daae802479457c4d774ec129bd23fa723eb795d6 x0 x1 x2 x3 x4 x5 x7 -> x6) -> x6))).
admit.
Qed.
Axiom explicit_Nats_E : (forall x0 x1, forall x2 : set -> set, forall x3 : prop, (explicit_Nats x0 x1 x2 -> x1 :e x0 -> (forall x4, x4 :e x0 -> x2 x4 :e x0) -> (forall x4, x4 :e x0 -> x2 x4 = x1 -> (forall x5 : prop, x5)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4 : set -> prop, x4 x1 -> (forall x5, x4 x5 -> x4 (x2 x5)) -> (forall x5, x5 :e x0 -> x4 x5)) -> x3) -> explicit_Nats x0 x1 x2 -> x3).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_987d3840aa104d50ea50759bc446be3aae0e33c59dc8291c7942424d9287e6ed : (forall x0 x1, forall x2 : set -> set, forall x3, forall x4 : set -> set -> set, explicit_Nats x0 x1 x2 -> (forall x5, missingname_dab7606af601ae243130ff09daae802479457c4d774ec129bd23fa723eb795d6 x0 x1 x2 x3 x4 x1 x5 -> x5 = x3)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_2611cf16ddfa1b4edb79e3ab7434c5739866f2053fe5690c0b558b5b0ae50bfd : (forall x0 x1, forall x2 : set -> set, forall x3, forall x4 : set -> set -> set, explicit_Nats x0 x1 x2 -> (forall x5, x5 :e x0 -> (forall x6, missingname_dab7606af601ae243130ff09daae802479457c4d774ec129bd23fa723eb795d6 x0 x1 x2 x3 x4 (x2 x5) x6 -> (forall x7 : prop, (forall x8, and (x6 = x4 x5 x8) (missingname_dab7606af601ae243130ff09daae802479457c4d774ec129bd23fa723eb795d6 x0 x1 x2 x3 x4 x5 x8) -> x7) -> x7)))).
admit.
Qed.
Theorem missingprop_39f1d7e6fd5a8cac4be9227a915f550879579764a9e39ca1251d774dc53cc6ce : (forall x0 x1, forall x2 : set -> set, forall x3, forall x4 : set -> set -> set, explicit_Nats x0 x1 x2 -> (forall x5, x5 :e x0 -> (forall x6 x7, missingname_dab7606af601ae243130ff09daae802479457c4d774ec129bd23fa723eb795d6 x0 x1 x2 x3 x4 x5 x6 -> missingname_dab7606af601ae243130ff09daae802479457c4d774ec129bd23fa723eb795d6 x0 x1 x2 x3 x4 x5 x7 -> x6 = x7))).
admit.
Qed.
Definition explicit_Nats_primrec : set -> set -> (set -> set) -> set -> (set -> set -> set) -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 : set => fun x4 : set -> set -> set => fun x5 : set => Eps_i (missingname_dab7606af601ae243130ff09daae802479457c4d774ec129bd23fa723eb795d6 x0 x1 x2 x3 x4 x5)).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem missingprop_babb8ca41ea0201511f2f22263861b8dd90f74016344bcbe2499d80c10dc00c2 : (forall x0 x1, forall x2 : set -> set, forall x3, forall x4 : set -> set -> set, explicit_Nats x0 x1 x2 -> (forall x5, x5 :e x0 -> missingname_dab7606af601ae243130ff09daae802479457c4d774ec129bd23fa723eb795d6 x0 x1 x2 x3 x4 x5 (explicit_Nats_primrec x0 x1 x2 x3 x4 x5))).
admit.
Qed.
Theorem explicit_Nats_primrec_base : (forall x0 x1, forall x2 : set -> set, forall x3, forall x4 : set -> set -> set, explicit_Nats x0 x1 x2 -> explicit_Nats_primrec x0 x1 x2 x3 x4 x1 = x3).
admit.
Qed.
Theorem explicit_Nats_primrec_S : (forall x0 x1, forall x2 : set -> set, forall x3, forall x4 : set -> set -> set, explicit_Nats x0 x1 x2 -> (forall x5, x5 :e x0 -> explicit_Nats_primrec x0 x1 x2 x3 x4 (x2 x5) = x4 x5 (explicit_Nats_primrec x0 x1 x2 x3 x4 x5))).
admit.
Qed.
Definition explicit_Nats_zero_plus : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => explicit_Nats_primrec x0 x1 x2 x4 (fun x5 : set => x2) x3).
Definition explicit_Nats_zero_mult : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => explicit_Nats_primrec x0 x1 x2 x1 (fun x5 : set => explicit_Nats_zero_plus x0 x1 x2 x4) x3).
Theorem explicit_Nats_zero_plus_0L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_zero_plus x0 x1 x2 x1 x3 = x3)).
admit.
Qed.
Theorem explicit_Nats_zero_plus_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_zero_plus x0 x1 x2 (x2 x3) x4 = x2 (explicit_Nats_zero_plus x0 x1 x2 x3 x4)))).
admit.
Qed.
Theorem explicit_Nats_zero_mult_0L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_zero_mult x0 x1 x2 x1 x3 = x1)).
admit.
Qed.
Theorem explicit_Nats_zero_mult_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_zero_mult x0 x1 x2 (x2 x3) x4 = explicit_Nats_zero_plus x0 x1 x2 x4 (explicit_Nats_zero_mult x0 x1 x2 x3 x4)))).
admit.
Qed.
Definition explicit_Nats_one_plus : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => explicit_Nats_primrec x0 x1 x2 (x2 x4) (fun x5 : set => x2) x3).
Definition explicit_Nats_one_mult : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => explicit_Nats_primrec x0 x1 x2 x4 (fun x5 : set => explicit_Nats_one_plus x0 x1 x2 x4) x3).
Definition explicit_Nats_one_exp : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 : set => explicit_Nats_primrec x0 x1 x2 x3 (fun x4 : set => explicit_Nats_one_mult x0 x1 x2 x3)).
Theorem explicit_Nats_one_plus_1L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_one_plus x0 x1 x2 x1 x3 = x2 x3)).
admit.
Qed.
Theorem explicit_Nats_one_plus_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_one_plus x0 x1 x2 (x2 x3) x4 = x2 (explicit_Nats_one_plus x0 x1 x2 x3 x4)))).
admit.
Qed.
Theorem explicit_Nats_one_mult_1L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_one_mult x0 x1 x2 x1 x3 = x3)).
admit.
Qed.
Theorem explicit_Nats_one_mult_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_one_mult x0 x1 x2 (x2 x3) x4 = explicit_Nats_one_plus x0 x1 x2 x4 (explicit_Nats_one_mult x0 x1 x2 x3 x4)))).
admit.
Qed.
Theorem explicit_Nats_one_exp_1L : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> explicit_Nats_one_exp x0 x1 x2 x3 x1 = x3)).
admit.
Qed.
Theorem explicit_Nats_one_exp_SL : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> explicit_Nats_one_exp x0 x1 x2 x3 (x2 x4) = explicit_Nats_one_mult x0 x1 x2 x3 (explicit_Nats_one_exp x0 x1 x2 x3 x4)))).
admit.
Qed.
