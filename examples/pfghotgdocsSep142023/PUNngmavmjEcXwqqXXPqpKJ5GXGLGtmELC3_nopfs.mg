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
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Axiom missingprop_95c6cbd2308b27a7edcd2a1d9389b377988e902d740d05dc7c88e6b8da945ab9 : (forall x0, atleastp 3 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1))) -> x1)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_3 : nat_p 3.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom surj_rinv : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> (forall x3, x3 :e x1 -> and (inv x0 x2 x3 :e x0) (x2 (inv x0 x2 x3) = x3))).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom In_0_3 : 0 :e 3.
Axiom tuple_3_0_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0) x0 -> x3 x0 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0)).
Axiom In_1_3 : 1 :e 3.
Axiom tuple_3_1_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1) x1 -> x3 x1 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1)).
Axiom In_2_3 : 2 :e 3.
Axiom tuple_3_2_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2) x2 -> x3 x2 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2)).
Axiom nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
Axiom nat_4 : nat_p 4.
Axiom In_3_4 : 3 :e 4.
Theorem missingprop_19c5bea28ef119e30d80f4e7c578df826b34bc3d0b15978a12c7c1b896ec3046 : (forall x0, atleastp u4 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (x2 = x3 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x1)))) -> x1)).
admit.
Qed.
Definition u5 : set :=
 ordsucc u4.
Axiom In_0_4 : 0 :e 4.
Axiom tuple_4_0_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0) x0 -> x4 x0 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0)).
Axiom In_1_4 : 1 :e 4.
Axiom tuple_4_1_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1) x1 -> x4 x1 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1)).
Axiom In_2_4 : 2 :e 4.
Axiom tuple_4_2_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2) x2 -> x4 x2 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2)).
Axiom tuple_4_3_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3) x3 -> x4 x3 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3)).
Axiom nat_5 : nat_p 5.
Axiom In_4_5 : 4 :e 5.
Theorem missingprop_611d05f3c0e0aff033700ccf72b7ceaf4160dd0bd5dde16fbd4a43684d4061b2 : (forall x0, atleastp u5 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (x2 = x3 -> (forall x7 : prop, x7)) -> (x2 = x4 -> (forall x7 : prop, x7)) -> (x2 = x5 -> (forall x7 : prop, x7)) -> (x2 = x6 -> (forall x7 : prop, x7)) -> (x3 = x4 -> (forall x7 : prop, x7)) -> (x3 = x5 -> (forall x7 : prop, x7)) -> (x3 = x6 -> (forall x7 : prop, x7)) -> (x4 = x5 -> (forall x7 : prop, x7)) -> (x4 = x6 -> (forall x7 : prop, x7)) -> (x5 = x6 -> (forall x7 : prop, x7)) -> x1))))) -> x1)).
admit.
Qed.
