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
Definition u17_to_Church17_buggy : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => ap (lam 17 (fun x18 : set => If_i (x18 = 0) x1 (If_i (x18 = 1) x18 (If_i (x18 = 2) x3 (If_i (x18 = 3) x4 (If_i (x18 = 4) x5 (If_i (x18 = 5) x6 (If_i (x18 = 6) x7 (If_i (x18 = 7) x8 (If_i (x18 = 8) x9 (If_i (x18 = 9) x10 (If_i (x18 = 10) x11 (If_i (x18 = 11) x12 (If_i (x18 = 12) x13 (If_i (x18 = 13) x14 (If_i (x18 = 14) x15 (If_i (x18 = 15) x16 x17))))))))))))))))) x0).
Definition TwoRamseyGraph_3_6_Church17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x3 x2 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x2 x2 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x3 x2 x3 x3 x2 x3 x2 x2 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x2 x3 x3 x3 x3 x2 x2 x2 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x2 x2 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x2 x2 x3 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x2 x3 x3 x2 x2 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x2 x3 x3 x2 x3 x3 x3 x2) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x2) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x3 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x2) (x1 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x2 x2 x2 x2 x2)).
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
Definition TwoRamseyGraph_3_6_17_buggy : set -> set -> prop :=
 (fun x0 x1 : set => x0 :e u17 -> x1 :e u17 -> TwoRamseyGraph_3_6_Church17 (u17_to_Church17_buggy x0) (u17_to_Church17_buggy x1) = (fun x3 x4 : set => x3)).
(* Parameter Church17_p "45876439a0ebffabe974dfc224bfb5fcf7cdefbe1842d969001ec0615838c25b" "2a50602e0a09f647d85d3e0968b772706a7501d07652bb47048c29a7df10757a" *)
Parameter Church17_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom missingprop_95c6cbd2308b27a7edcd2a1d9389b377988e902d740d05dc7c88e6b8da945ab9 : (forall x0, atleastp 3 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1))) -> x1)).
Theorem missingprop_770505912c32dda2498a8aaf85f0c77fe9f674b5bdbb481b51987aa8ab664128 : (forall x0, x0 :e u17 -> Church17_p (u17_to_Church17_buggy x0)) -> (forall x0, x0 :e u17 -> (forall x1, x1 :e u17 -> u17_to_Church17_buggy x0 = u17_to_Church17_buggy x1 -> x0 = x1)) -> (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_6_Church17 x0 x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_6_Church17 x1 x2 = (fun x4 x5 : set => x4) -> False) -> (forall x0, x0 c= u17 -> atleastp u3 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_6_17_buggy x1 x2))).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Theorem missingprop_f9aaf94a696a3a601361748669ef031543f893c9566c95130e38db730b2a265f : (forall x0, x0 :e u17 -> Church17_p (u17_to_Church17_buggy x0)) -> (forall x0, x0 :e u17 -> (forall x1, x1 :e u17 -> u17_to_Church17_buggy x0 = u17_to_Church17_buggy x1 -> x0 = x1)) -> (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_6_Church17 x0 x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_6_Church17 x1 x2 = (fun x4 x5 : set => x4) -> False) -> (forall x0 x1, TwoRamseyGraph_3_6_17_buggy x0 x1 -> TwoRamseyGraph_3_6_17_buggy x1 x0) -> (forall x0, x0 c= u17 -> atleastp u6 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_6_17_buggy x1 x2)))) -> not (TwoRamseyProp_atleastp 3 6 17).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Theorem missingprop_91ad72c81ed3adcc28a79a32d480975f89729c0dd96c24d2c3ddca8aa3e2ae2b : (forall x0, x0 :e u17 -> Church17_p (u17_to_Church17_buggy x0)) -> (forall x0, x0 :e u17 -> (forall x1, x1 :e u17 -> u17_to_Church17_buggy x0 = u17_to_Church17_buggy x1 -> x0 = x1)) -> (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_6_Church17 x0 x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_6_Church17 x1 x2 = (fun x4 x5 : set => x4) -> False) -> (forall x0 x1, TwoRamseyGraph_3_6_17_buggy x0 x1 -> TwoRamseyGraph_3_6_17_buggy x1 x0) -> (forall x0, x0 c= u17 -> atleastp u6 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_6_17_buggy x1 x2)))) -> not (TwoRamseyProp 3 6 17).
admit.
Qed.
