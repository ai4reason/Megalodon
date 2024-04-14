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
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
Definition u7 : set :=
 ordsucc u6.
Definition u8 : set :=
 ordsucc u7.
Definition u9 : set :=
 ordsucc u8.
Definition u10 : set :=
 ordsucc u9.
Definition u11 : set :=
 ordsucc u10.
Definition u12 : set :=
 ordsucc u11.
Definition u13 : set :=
 ordsucc u12.
Definition u14 : set :=
 ordsucc u13.
Definition u15 : set :=
 ordsucc u14.
Definition u16 : set :=
 ordsucc u15.
Definition u17 : set :=
 ordsucc u16.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom missingprop_fff531c49970071934428d0aef9046ef564b1c688918cc28a68137a9f7d29720 : 0 :e 16.
Theorem missingprop_9851dfe301262128a9dc5def6f083cbb499c4d0eace7612e5dc050c4fe5ba3c7 : 0 :e u17.
admit.
Qed.
Axiom missingprop_5652f21220a21736c3c1c7ff394952ea63f98e4255215cdb9aaab91866efe7dd : 1 :e 16.
Theorem missingprop_4f0f2f2c8505addb4aa66d1187553d1cf0a291464cc87b78a3faaf7ae73ed155 : u1 :e u17.
admit.
Qed.
Axiom missingprop_c38dc1b25a0e2dc5936848fac54d16b82c023e49a17d0d1875549efe638d7dec : 2 :e 16.
Theorem missingprop_fcb0372c2816a1d869a174f57c9ee90635b20300695b8cc5b4a5ca8436427e30 : u2 :e u17.
admit.
Qed.
Axiom missingprop_2af8bf40bf7eaefd36fa12e21921eb2aeb029dbe2775546e49d5225f179719d9 : 3 :e 16.
Theorem missingprop_515e04c9d20f4760fa1f9ec9f7d43a79e2cf83cd96ac9929a00f63e10a33bee6 : u3 :e u17.
admit.
Qed.
Axiom missingprop_146ef1143e471cfbb8d96545c2df24929043ca109ec4a7c8c78dd73fb371c488 : 4 :e 16.
Theorem missingprop_8bfb0eb80a8f5f9fa400351ad533eb8f6abcbab81f79751d9b99dc5c5b198b37 : u4 :e u17.
admit.
Qed.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Theorem missingprop_099fdd6f6fc9d9c65e6c63c6cd5d2c7468eccfeb1ff3ee8aa274ca2d4ba4b627 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) 0) x0 -> x17 x0 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) 0)).
admit.
Qed.
Axiom neq_1_0 : u1 = 0 -> (forall x0 : prop, x0).
Theorem missingprop_e35554b7d815af2aaa8cf3f8fd96fa83341d7d9a61689fa603830c4de03c7838 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u1) x1 -> x17 x1 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u1)).
admit.
Qed.
Axiom neq_2_0 : u2 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : u2 = u1 -> (forall x0 : prop, x0).
Theorem missingprop_d0ea30e0036b834b660c28f1dcc14750a91fe57f6d6ee329bb7013809ae8f9ca : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u2) x2 -> x17 x2 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u2)).
admit.
Qed.
Axiom neq_3_0 : u3 = 0 -> (forall x0 : prop, x0).
Axiom neq_3_1 : u3 = u1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : u3 = u2 -> (forall x0 : prop, x0).
Theorem missingprop_a6179bdad21d79fe2688e5f4282f260d58287f1f0e0511acc4c20fa77c855adc : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u3) x3 -> x17 x3 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u3)).
admit.
Qed.
Axiom neq_4_0 : u4 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_1 : u4 = u1 -> (forall x0 : prop, x0).
Axiom neq_4_2 : u4 = u2 -> (forall x0 : prop, x0).
Axiom neq_4_3 : u4 = u3 -> (forall x0 : prop, x0).
Theorem missingprop_11bf4639bf1e664afa4d9107ee537da1aa697aa58916f75fa32b5675ebaa4135 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u4) x4 -> x17 x4 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u4)).
admit.
Qed.
