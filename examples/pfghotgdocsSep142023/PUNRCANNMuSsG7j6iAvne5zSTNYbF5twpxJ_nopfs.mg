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
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom In_0_8 : 0 :e 8.
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem tuple_8_0_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7, forall x8 : set -> set -> prop, x8 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 0) x0 -> x8 x0 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 0)).
admit.
Qed.
Axiom In_1_8 : 1 :e 8.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Theorem tuple_8_1_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7, forall x8 : set -> set -> prop, x8 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 1) x1 -> x8 x1 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 1)).
admit.
Qed.
Axiom In_2_8 : 2 :e 8.
Axiom neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
Theorem tuple_8_2_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7, forall x8 : set -> set -> prop, x8 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 2) x2 -> x8 x2 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 2)).
admit.
Qed.
Axiom In_3_8 : 3 :e 8.
Axiom neq_3_0 : 3 = 0 -> (forall x0 : prop, x0).
Axiom neq_3_1 : 3 = 1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : 3 = 2 -> (forall x0 : prop, x0).
Theorem tuple_8_3_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7, forall x8 : set -> set -> prop, x8 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 3) x3 -> x8 x3 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 3)).
admit.
Qed.
Axiom In_4_8 : 4 :e 8.
Axiom neq_4_0 : 4 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_1 : 4 = 1 -> (forall x0 : prop, x0).
Axiom neq_4_2 : 4 = 2 -> (forall x0 : prop, x0).
Axiom neq_4_3 : 4 = 3 -> (forall x0 : prop, x0).
Theorem tuple_8_4_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7, forall x8 : set -> set -> prop, x8 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 4) x4 -> x8 x4 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 4)).
admit.
Qed.
Axiom In_5_8 : 5 :e 8.
Axiom neq_5_0 : 5 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_1 : 5 = 1 -> (forall x0 : prop, x0).
Axiom neq_5_2 : 5 = 2 -> (forall x0 : prop, x0).
Axiom neq_5_3 : 5 = 3 -> (forall x0 : prop, x0).
Axiom neq_5_4 : 5 = 4 -> (forall x0 : prop, x0).
Theorem tuple_8_5_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7, forall x8 : set -> set -> prop, x8 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 5) x5 -> x8 x5 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 5)).
admit.
Qed.
Axiom In_6_8 : 6 :e 8.
Axiom neq_6_0 : 6 = 0 -> (forall x0 : prop, x0).
Axiom neq_6_1 : 6 = 1 -> (forall x0 : prop, x0).
Axiom neq_6_2 : 6 = 2 -> (forall x0 : prop, x0).
Axiom neq_6_3 : 6 = 3 -> (forall x0 : prop, x0).
Axiom neq_6_4 : 6 = 4 -> (forall x0 : prop, x0).
Axiom neq_6_5 : 6 = 5 -> (forall x0 : prop, x0).
Theorem tuple_8_6_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7, forall x8 : set -> set -> prop, x8 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 6) x6 -> x8 x6 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 6)).
admit.
Qed.
Axiom In_7_8 : 7 :e 8.
Axiom neq_7_0 : 7 = 0 -> (forall x0 : prop, x0).
Axiom neq_7_1 : 7 = 1 -> (forall x0 : prop, x0).
Axiom neq_7_2 : 7 = 2 -> (forall x0 : prop, x0).
Axiom neq_7_3 : 7 = 3 -> (forall x0 : prop, x0).
Axiom neq_7_4 : 7 = 4 -> (forall x0 : prop, x0).
Axiom neq_7_5 : 7 = 5 -> (forall x0 : prop, x0).
Axiom neq_7_6 : 7 = 6 -> (forall x0 : prop, x0).
Theorem tuple_8_7_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7, forall x8 : set -> set -> prop, x8 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 7) x7 -> x8 x7 (ap (lam 8 (fun x9 : set => If_i (x9 = 0) x0 (If_i (x9 = 1) x1 (If_i (x9 = 2) x2 (If_i (x9 = 3) x3 (If_i (x9 = 4) x4 (If_i (x9 = 5) x5 (If_i (x9 = 6) x6 x7)))))))) 7)).
admit.
Qed.
Axiom In_0_9 : 0 :e 9.
Theorem tuple_9_0_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, forall x9 : set -> set -> prop, x9 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 0) x0 -> x9 x0 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 0)).
admit.
Qed.
Axiom In_1_9 : 1 :e 9.
Theorem tuple_9_1_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, forall x9 : set -> set -> prop, x9 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 1) x1 -> x9 x1 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 1)).
admit.
Qed.
Axiom In_2_9 : 2 :e 9.
Theorem tuple_9_2_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, forall x9 : set -> set -> prop, x9 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 2) x2 -> x9 x2 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 2)).
admit.
Qed.
Axiom In_3_9 : 3 :e 9.
Theorem tuple_9_3_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, forall x9 : set -> set -> prop, x9 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 3) x3 -> x9 x3 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 3)).
admit.
Qed.
Axiom In_4_9 : 4 :e 9.
Theorem tuple_9_4_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, forall x9 : set -> set -> prop, x9 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 4) x4 -> x9 x4 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 4)).
admit.
Qed.
Axiom In_5_9 : 5 :e 9.
Theorem tuple_9_5_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, forall x9 : set -> set -> prop, x9 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 5) x5 -> x9 x5 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 5)).
admit.
Qed.
Axiom In_6_9 : 6 :e 9.
Theorem tuple_9_6_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, forall x9 : set -> set -> prop, x9 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 6) x6 -> x9 x6 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 6)).
admit.
Qed.
Axiom In_7_9 : 7 :e 9.
Theorem tuple_9_7_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, forall x9 : set -> set -> prop, x9 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 7) x7 -> x9 x7 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 7)).
admit.
Qed.
Axiom In_8_9 : 8 :e 9.
Axiom neq_8_0 : 8 = 0 -> (forall x0 : prop, x0).
Axiom neq_8_1 : 8 = 1 -> (forall x0 : prop, x0).
Axiom neq_8_2 : 8 = 2 -> (forall x0 : prop, x0).
Axiom neq_8_3 : 8 = 3 -> (forall x0 : prop, x0).
Axiom neq_8_4 : 8 = 4 -> (forall x0 : prop, x0).
Axiom neq_8_5 : 8 = 5 -> (forall x0 : prop, x0).
Axiom neq_8_6 : 8 = 6 -> (forall x0 : prop, x0).
Axiom neq_8_7 : 8 = 7 -> (forall x0 : prop, x0).
Theorem tuple_9_8_eq : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, forall x9 : set -> set -> prop, x9 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 8) x8 -> x9 x8 (ap (lam 9 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 x8))))))))) 8)).
admit.
Qed.
