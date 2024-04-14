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
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom lam_eta : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (lam x0 (ap (lam x0 x1))) (lam x0 x1) -> x2 (lam x0 x1) (lam x0 (ap (lam x0 x1)))).
Theorem tuple_3_eta : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (lam 3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))))) (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) -> x3 (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) (lam 3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2)))))).
admit.
Qed.
Theorem tuple_4_eta : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (lam 4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))))) (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) -> x4 (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) (lam 4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3))))))).
admit.
Qed.
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom In_0_3 : 0 :e 3.
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem tuple_3_0_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0) x0 -> x3 x0 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0)).
admit.
Qed.
Axiom In_1_3 : 1 :e 3.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Theorem tuple_3_1_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1) x1 -> x3 x1 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1)).
admit.
Qed.
Axiom In_2_3 : 2 :e 3.
Axiom neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
Theorem tuple_3_2_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2) x2 -> x3 x2 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2)).
admit.
Qed.
Axiom In_0_4 : 0 :e 4.
Theorem tuple_4_0_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0) x0 -> x4 x0 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0)).
admit.
Qed.
Axiom In_1_4 : 1 :e 4.
Theorem tuple_4_1_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1) x1 -> x4 x1 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1)).
admit.
Qed.
Axiom In_2_4 : 2 :e 4.
Theorem tuple_4_2_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2) x2 -> x4 x2 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2)).
admit.
Qed.
Axiom In_3_4 : 3 :e 4.
Axiom neq_3_0 : 3 = 0 -> (forall x0 : prop, x0).
Axiom neq_3_1 : 3 = 1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : 3 = 2 -> (forall x0 : prop, x0).
Theorem tuple_4_3_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3) x3 -> x4 x3 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3)).
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
Theorem tuple_3_in_A_3 : (forall x0 x1 x2 x3, x0 :e x3 -> x1 :e x3 -> x2 :e x3 -> lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2)) :e setexp x3 3).
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom PigeonHole_nat_bij : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e x0) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> bij x0 x0 x1)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom nat_2 : nat_p 2.
Theorem tuple_3_bij_3 : (forall x0 x1 x2, x0 :e 3 -> x1 :e 3 -> x2 :e 3 -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> bij 3 3 (ap (lam 3 (fun x3 : set => If_i (x3 = 0) x0 (If_i (x3 = 1) x1 x2))))).
admit.
Qed.
Axiom cases_4 : (forall x0, x0 :e 4 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 x0)).
Theorem tuple_4_in_A_4 : (forall x0 x1 x2 x3 x4, x0 :e x4 -> x1 :e x4 -> x2 :e x4 -> x3 :e x4 -> lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3))) :e setexp x4 4).
admit.
Qed.
Theorem tuple_4_bij_4 : (forall x0 x1 x2 x3, x0 :e 4 -> x1 :e 4 -> x2 :e 4 -> x3 :e 4 -> (x0 = x1 -> (forall x4 : prop, x4)) -> (x0 = x2 -> (forall x4 : prop, x4)) -> (x0 = x3 -> (forall x4 : prop, x4)) -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> bij 4 4 (ap (lam 4 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 (If_i (x4 = 2) x2 x3)))))).
admit.
Qed.
