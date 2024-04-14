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
Axiom In_0_5 : 0 :e 5.
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem tuple_5_0_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0) x0 -> x5 x0 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0)).
admit.
Qed.
Axiom In_1_5 : 1 :e 5.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Theorem tuple_5_1_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1) x1 -> x5 x1 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1)).
admit.
Qed.
Axiom In_2_5 : 2 :e 5.
Axiom neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
Theorem tuple_5_2_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2) x2 -> x5 x2 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2)).
admit.
Qed.
Axiom In_3_5 : 3 :e 5.
Axiom neq_3_0 : 3 = 0 -> (forall x0 : prop, x0).
Axiom neq_3_1 : 3 = 1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : 3 = 2 -> (forall x0 : prop, x0).
Theorem tuple_5_3_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3) x3 -> x5 x3 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3)).
admit.
Qed.
Axiom In_4_5 : 4 :e 5.
Axiom neq_4_0 : 4 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_1 : 4 = 1 -> (forall x0 : prop, x0).
Axiom neq_4_2 : 4 = 2 -> (forall x0 : prop, x0).
Axiom neq_4_3 : 4 = 3 -> (forall x0 : prop, x0).
Theorem tuple_5_4_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4) x4 -> x5 x4 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4)).
admit.
Qed.
Axiom In_0_6 : 0 :e 6.
Theorem tuple_6_0_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0) x0 -> x6 x0 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0)).
admit.
Qed.
Axiom In_1_6 : 1 :e 6.
Theorem tuple_6_1_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 1) x1 -> x6 x1 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 1)).
admit.
Qed.
Axiom In_2_6 : 2 :e 6.
Theorem tuple_6_2_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 2) x2 -> x6 x2 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 2)).
admit.
Qed.
Axiom In_3_6 : 3 :e 6.
Theorem tuple_6_3_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 3) x3 -> x6 x3 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 3)).
admit.
Qed.
Axiom In_4_6 : 4 :e 6.
Theorem tuple_6_4_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 4) x4 -> x6 x4 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 4)).
admit.
Qed.
Axiom In_5_6 : 5 :e 6.
Axiom neq_5_0 : 5 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_1 : 5 = 1 -> (forall x0 : prop, x0).
Axiom neq_5_2 : 5 = 2 -> (forall x0 : prop, x0).
Axiom neq_5_3 : 5 = 3 -> (forall x0 : prop, x0).
Axiom neq_5_4 : 5 = 4 -> (forall x0 : prop, x0).
Theorem tuple_6_5_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 5) x5 -> x6 x5 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 5)).
admit.
Qed.
Axiom In_0_7 : 0 :e 7.
Theorem tuple_7_0_eq : (forall x0 x1 x2 x3 x4 x5 x6, forall x7 : set -> set -> prop, x7 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 0) x0 -> x7 x0 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 0)).
admit.
Qed.
Axiom In_1_7 : 1 :e 7.
Theorem tuple_7_1_eq : (forall x0 x1 x2 x3 x4 x5 x6, forall x7 : set -> set -> prop, x7 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 1) x1 -> x7 x1 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 1)).
admit.
Qed.
Axiom In_2_7 : 2 :e 7.
Theorem tuple_7_2_eq : (forall x0 x1 x2 x3 x4 x5 x6, forall x7 : set -> set -> prop, x7 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 2) x2 -> x7 x2 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 2)).
admit.
Qed.
Axiom In_3_7 : 3 :e 7.
Theorem tuple_7_3_eq : (forall x0 x1 x2 x3 x4 x5 x6, forall x7 : set -> set -> prop, x7 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 3) x3 -> x7 x3 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 3)).
admit.
Qed.
Axiom In_4_7 : 4 :e 7.
Theorem tuple_7_4_eq : (forall x0 x1 x2 x3 x4 x5 x6, forall x7 : set -> set -> prop, x7 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 4) x4 -> x7 x4 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 4)).
admit.
Qed.
Axiom In_5_7 : 5 :e 7.
Theorem tuple_7_5_eq : (forall x0 x1 x2 x3 x4 x5 x6, forall x7 : set -> set -> prop, x7 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 5) x5 -> x7 x5 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 5)).
admit.
Qed.
Axiom In_6_7 : 6 :e 7.
Axiom neq_6_0 : 6 = 0 -> (forall x0 : prop, x0).
Axiom neq_6_1 : 6 = 1 -> (forall x0 : prop, x0).
Axiom neq_6_2 : 6 = 2 -> (forall x0 : prop, x0).
Axiom neq_6_3 : 6 = 3 -> (forall x0 : prop, x0).
Axiom neq_6_4 : 6 = 4 -> (forall x0 : prop, x0).
Axiom neq_6_5 : 6 = 5 -> (forall x0 : prop, x0).
Theorem tuple_7_6_eq : (forall x0 x1 x2 x3 x4 x5 x6, forall x7 : set -> set -> prop, x7 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 6) x6 -> x7 x6 (ap (lam 7 (fun x8 : set => If_i (x8 = 0) x0 (If_i (x8 = 1) x1 (If_i (x8 = 2) x2 (If_i (x8 = 3) x3 (If_i (x8 = 4) x4 (If_i (x8 = 5) x5 x6))))))) 6)).
admit.
Qed.
