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
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
admit.
Qed.
Theorem cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
admit.
Qed.
Theorem cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
admit.
Qed.
Theorem cases_4 : (forall x0, x0 :e 4 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 x0)).
admit.
Qed.
Theorem cases_5 : (forall x0, x0 :e 5 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 x0)).
admit.
Qed.
Theorem cases_6 : (forall x0, x0 :e 6 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 x0)).
admit.
Qed.
Theorem cases_7 : (forall x0, x0 :e 7 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 x0)).
admit.
Qed.
Theorem cases_8 : (forall x0, x0 :e 8 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 7 -> x1 x0)).
admit.
Qed.
Theorem cases_9 : (forall x0, x0 :e 9 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 7 -> x1 8 -> x1 x0)).
admit.
Qed.
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Theorem neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
Theorem ordsucc_inj_contra : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> ordsucc x0 = ordsucc x1 -> (forall x2 : prop, x2)).
admit.
Qed.
Theorem neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem nIn_2_1 : nIn 2 1.
admit.
Qed.
Theorem neq_3_0 : 3 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_3_1 : 3 = 1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_3_2 : 3 = 2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_4_0 : 4 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_4_1 : 4 = 1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_4_2 : 4 = 2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_4_3 : 4 = 3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_5_0 : 5 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_5_1 : 5 = 1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_5_2 : 5 = 2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_5_3 : 5 = 3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_5_4 : 5 = 4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_6_0 : 6 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_6_1 : 6 = 1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_6_2 : 6 = 2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_6_3 : 6 = 3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_6_4 : 6 = 4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_6_5 : 6 = 5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_7_0 : 7 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_7_1 : 7 = 1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_7_2 : 7 = 2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_7_3 : 7 = 3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_7_4 : 7 = 4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_7_5 : 7 = 5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_7_6 : 7 = 6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_8_0 : 8 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_8_1 : 8 = 1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_8_2 : 8 = 2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_8_3 : 8 = 3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_8_4 : 8 = 4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_8_5 : 8 = 5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_8_6 : 8 = 6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_8_7 : 8 = 7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_9_0 : 9 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_9_1 : 9 = 1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_9_2 : 9 = 2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_9_3 : 9 = 3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_9_4 : 9 = 4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_9_5 : 9 = 5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_9_6 : 9 = 6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_9_7 : 9 = 7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_9_8 : 9 = 8 -> (forall x0 : prop, x0).
admit.
Qed.
