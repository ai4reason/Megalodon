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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition nSubq : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 c= x1)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom neq_0_ordsucc : (forall x0, 0 = ordsucc x0 -> (forall x1 : prop, x1)).
Theorem neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom ordsucc_inj_contra : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> ordsucc x0 = ordsucc x1 -> (forall x2 : prop, x2)).
Theorem neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
admit.
Qed.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem nIn_0_0 : nIn 0 0.
admit.
Qed.
Theorem nIn_1_0 : nIn 1 0.
admit.
Qed.
Theorem nIn_2_0 : nIn 2 0.
admit.
Qed.
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem nIn_1_1 : nIn 1 1.
admit.
Qed.
Theorem nIn_2_2 : nIn 2 2.
admit.
Qed.
Axiom Subq_Empty : (forall x0, 0 c= x0).
Theorem Subq_0_0 : 0 c= 0.
admit.
Qed.
Theorem Subq_0_1 : 0 c= 1.
admit.
Qed.
Theorem Subq_0_2 : 0 c= 2.
admit.
Qed.
Axiom In_0_1 : 0 :e 1.
Theorem nSubq_1_0 : nSubq 1 0.
admit.
Qed.
Axiom Subq_ref : (forall x0, x0 c= x0).
Theorem Subq_1_1 : 1 c= 1.
admit.
Qed.
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem Subq_1_2 : 1 c= 2.
admit.
Qed.
Axiom In_0_2 : 0 :e 2.
Theorem nSubq_2_0 : nSubq 2 0.
admit.
Qed.
Axiom In_1_2 : 1 :e 2.
Theorem nSubq_2_1 : nSubq 2 1.
admit.
Qed.
Theorem Subq_2_2 : 2 c= 2.
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_complete_ind : (forall x0 : set -> prop, (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom UnionE_impred : (forall x0 x1, x1 :e Union x0 -> (forall x2 : prop, (forall x3, x1 :e x3 -> x3 :e x0 -> x2) -> x2)).
Axiom nat_ordsucc_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e ordsucc x0 -> x1 c= x0)).
Axiom UnionI : (forall x0 x1 x2, x1 :e x2 -> x2 :e x0 -> x1 :e Union x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom Union_ordsucc_eq : (forall x0, nat_p x0 -> Union (ordsucc x0) = x0).
Theorem In_0_3 : 0 :e 3.
admit.
Qed.
Theorem In_1_3 : 1 :e 3.
admit.
Qed.
Theorem In_2_3 : 2 :e 3.
admit.
Qed.
Theorem In_0_4 : 0 :e 4.
admit.
Qed.
Theorem In_1_4 : 1 :e 4.
admit.
Qed.
Theorem In_2_4 : 2 :e 4.
admit.
Qed.
Theorem In_3_4 : 3 :e 4.
admit.
Qed.
Theorem In_0_5 : 0 :e 5.
admit.
Qed.
Theorem In_1_5 : 1 :e 5.
admit.
Qed.
Theorem In_2_5 : 2 :e 5.
admit.
Qed.
Theorem In_3_5 : 3 :e 5.
admit.
Qed.
Theorem In_4_5 : 4 :e 5.
admit.
Qed.
Theorem In_0_6 : 0 :e 6.
admit.
Qed.
Theorem In_1_6 : 1 :e 6.
admit.
Qed.
Theorem In_2_6 : 2 :e 6.
admit.
Qed.
Theorem In_3_6 : 3 :e 6.
admit.
Qed.
Theorem In_4_6 : 4 :e 6.
admit.
Qed.
Theorem In_5_6 : 5 :e 6.
admit.
Qed.
Theorem In_0_7 : 0 :e 7.
admit.
Qed.
Theorem In_1_7 : 1 :e 7.
admit.
Qed.
Theorem In_2_7 : 2 :e 7.
admit.
Qed.
Theorem In_3_7 : 3 :e 7.
admit.
Qed.
Theorem In_4_7 : 4 :e 7.
admit.
Qed.
Theorem In_5_7 : 5 :e 7.
admit.
Qed.
Theorem In_6_7 : 6 :e 7.
admit.
Qed.
Theorem In_0_8 : 0 :e 8.
admit.
Qed.
Theorem In_1_8 : 1 :e 8.
admit.
Qed.
Theorem In_2_8 : 2 :e 8.
admit.
Qed.
Theorem In_3_8 : 3 :e 8.
admit.
Qed.
Theorem In_4_8 : 4 :e 8.
admit.
Qed.
Theorem In_5_8 : 5 :e 8.
admit.
Qed.
Theorem In_6_8 : 6 :e 8.
admit.
Qed.
Theorem In_7_8 : 7 :e 8.
admit.
Qed.
Theorem In_0_9 : 0 :e 9.
admit.
Qed.
Theorem In_1_9 : 1 :e 9.
admit.
Qed.
Theorem In_2_9 : 2 :e 9.
admit.
Qed.
Theorem In_3_9 : 3 :e 9.
admit.
Qed.
Theorem In_4_9 : 4 :e 9.
admit.
Qed.
Theorem In_5_9 : 5 :e 9.
admit.
Qed.
Theorem In_6_9 : 6 :e 9.
admit.
Qed.
Theorem In_7_9 : 7 :e 9.
admit.
Qed.
Theorem In_8_9 : 8 :e 9.
admit.
Qed.
(* Parameter In_rec_i "f97da687c51f5a332ff57562bd465232bc70c9165b0afe0a54e6440fc4962a9f" "fac413e747a57408ad38b3855d3cde8673f86206e95ccdadff2b5babaf0c219e" *)
Parameter In_rec_i : (set -> (set -> set) -> set) -> set -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition nat_primrec : set -> (set -> set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> set => In_rec_i (fun x2 : set => fun x3 : set -> set => If_i (Union x2 :e x2) (x1 (Union x2) (x3 (Union x2))) x0)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Theorem nat_primrec_r : (forall x0, forall x1 : set -> set -> set, forall x2, forall x3 x4 : set -> set, (forall x5, x5 :e x2 -> x3 x5 = x4 x5) -> If_i (Union x2 :e x2) (x1 (Union x2) (x3 (Union x2))) x0 = If_i (Union x2 :e x2) (x1 (Union x2) (x4 (Union x2))) x0).
admit.
Qed.
Axiom In_rec_i_eq : (forall x0 : set -> (set -> set) -> set, (forall x1, forall x2 x3 : set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : set -> set -> prop, x2 (In_rec_i x0 x1) (x0 x1 (In_rec_i x0)) -> x2 (x0 x1 (In_rec_i x0)) (In_rec_i x0 x1))).
Theorem nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
admit.
Qed.
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
admit.
Qed.
Definition add_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec x0 (fun x1 : set => ordsucc)).
Theorem add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
admit.
Qed.
Theorem add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
admit.
Qed.
Theorem add_nat_asso : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> add_nat (add_nat x0 x1) x2 = add_nat x0 (add_nat x1 x2)))).
admit.
Qed.
Theorem add_nat_0L : (forall x0, nat_p x0 -> add_nat 0 x0 = x0).
admit.
Qed.
Theorem add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
admit.
Qed.
Theorem add_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = add_nat x1 x0)).
admit.
Qed.
Definition mul_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec 0 (fun x1 : set => add_nat x0)).
Theorem mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
admit.
Qed.
Theorem mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
admit.
Qed.
Axiom nat_0 : nat_p 0.
Theorem mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
admit.
Qed.
Theorem mul_nat_0L : (forall x0, nat_p x0 -> mul_nat 0 x0 = 0).
admit.
Qed.
Theorem mul_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat (ordsucc x0) x1 = add_nat (mul_nat x0 x1) x1)).
admit.
Qed.
Theorem mul_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x1 = mul_nat x1 x0)).
admit.
Qed.
Theorem mul_add_nat_distrL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat x0 (add_nat x1 x2) = add_nat (mul_nat x0 x1) (mul_nat x0 x2)))).
admit.
Qed.
Theorem mul_add_nat_distrR : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat (add_nat x0 x1) x2 = add_nat (mul_nat x0 x2) (mul_nat x1 x2)))).
admit.
Qed.
Theorem mul_nat_asso : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat (mul_nat x0 x1) x2 = mul_nat x0 (mul_nat x1 x2)))).
admit.
Qed.
Theorem add_nat_1_1_2 : add_nat 1 1 = 2.
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem PigeonHole_nat : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e ordsucc x0 -> x1 x2 :e x0) -> not (forall x2, x2 :e ordsucc x0 -> (forall x3, x3 :e ordsucc x0 -> x1 x2 = x1 x3 -> x2 = x3)))).
admit.
Qed.
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Theorem PigeonHole_nat_bij : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e x0) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> bij x0 x0 x1)).
admit.
Qed.
