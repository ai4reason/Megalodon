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
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
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
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom missingprop_eab190d6552dbda6c7d00c3e93c1ad9385698a8d73462a2a4e5795b67701610d : (forall x0 x1 x2, nIn x2 x1 -> equip x0 x1 -> equip (ordsucc x0) (binunion x1 (Sing x2))).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom missingprop_3de4fed6100f7a1644d3bcc671dd5818f525687e19a89aa1d64708dea3801718 : (forall x0 x1 x2 x3 x4, x4 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3 -> (forall x5 : set -> prop, x5 x0 -> x5 x1 -> x5 x2 -> x5 x3 -> x5 x4)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom missingprop_30f51c1e2b83590a7ed46a006f5e6311b01e639f1f6e9abb0eccefd285a20a15 : (forall x0 x1 x2 x3, (x0 = x1 -> (forall x4 : prop, x4)) -> (x0 = x2 -> (forall x4 : prop, x4)) -> (x0 = x3 -> (forall x4 : prop, x4)) -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> equip (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) u4).
Theorem missingprop_3fceca27190be082874ab0327e8c7b21f47d4627eb1f13a0cdc619c2edff8aa4 : (forall x0 x1 x2 x3 x4, (x0 = x1 -> (forall x5 : prop, x5)) -> (x0 = x2 -> (forall x5 : prop, x5)) -> (x0 = x3 -> (forall x5 : prop, x5)) -> (x0 = x4 -> (forall x5 : prop, x5)) -> (x1 = x2 -> (forall x5 : prop, x5)) -> (x1 = x3 -> (forall x5 : prop, x5)) -> (x1 = x4 -> (forall x5 : prop, x5)) -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> equip (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) u5).
admit.
Qed.
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
(* Parameter Subq "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" "81c0efe6636cef7bc8041820a3ebc8dc5fa3bc816854d8b7f507e30425fc1cef" *)
Parameter Subq : set -> set -> prop.
Definition u6 : set :=
 ordsucc u5.
Definition u7 : set :=
 ordsucc u6.
Definition u8 : set :=
 ordsucc u7.
Definition u9 : set :=
 ordsucc u8.
Axiom missingprop_15d48b0d93044e45e1d5f0b67d2878c4ac013f81cd695d89157633dd4a764e14 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2 : prop, (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (forall x5, x5 :e u9 -> (x1 = x3 -> (forall x6 : prop, x6)) -> (x1 = x4 -> (forall x6 : prop, x6)) -> (x1 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x0 x1 x3 -> x0 x1 x4 -> x0 x1 x5 -> not (x0 x3 x4) -> not (x0 x3 x5) -> not (x0 x4 x5) -> (forall x6, x6 :e u9 -> x0 x1 x6 -> x6 :e SetAdjoin (SetAdjoin (UPair x1 x3) x4) x5) -> x2))) -> x2))).
Axiom missingprop_5df8c11eede12b7d829e2a0b95c8033f28b954d28a1a477c3fa227324f16bb6c : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (x1 = x2 -> (forall x3 : prop, x3)) -> x0 x1 x2 -> (forall x3 : prop, (forall x4, x4 :e u9 -> (forall x5, x5 :e u9 -> (x1 = x4 -> (forall x6 : prop, x6)) -> (x1 = x5 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x0 x1 x4 -> x0 x1 x5 -> not (x0 x2 x4) -> not (x0 x2 x5) -> not (x0 x4 x5) -> (forall x6, x6 :e u9 -> x0 x1 x6 -> x6 :e SetAdjoin (SetAdjoin (UPair x1 x2) x4) x5) -> x3)) -> x3)))).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_9 : nat_p 9.
Definition u10 : set :=
 ordsucc u9.
Axiom missingprop_01a03387607d86435cc918dbbb1e6e9737afede76fd5cb445816be24686ac63c : (forall x0 x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> (x1 = x2 -> (forall x11 : prop, x11)) -> (x1 = x3 -> (forall x11 : prop, x11)) -> (x2 = x3 -> (forall x11 : prop, x11)) -> (x1 = x4 -> (forall x11 : prop, x11)) -> (x2 = x4 -> (forall x11 : prop, x11)) -> (x3 = x4 -> (forall x11 : prop, x11)) -> (x1 = x5 -> (forall x11 : prop, x11)) -> (x2 = x5 -> (forall x11 : prop, x11)) -> (x3 = x5 -> (forall x11 : prop, x11)) -> (x4 = x5 -> (forall x11 : prop, x11)) -> (x1 = x6 -> (forall x11 : prop, x11)) -> (x2 = x6 -> (forall x11 : prop, x11)) -> (x3 = x6 -> (forall x11 : prop, x11)) -> (x4 = x6 -> (forall x11 : prop, x11)) -> (x5 = x6 -> (forall x11 : prop, x11)) -> (x1 = x7 -> (forall x11 : prop, x11)) -> (x2 = x7 -> (forall x11 : prop, x11)) -> (x3 = x7 -> (forall x11 : prop, x11)) -> (x4 = x7 -> (forall x11 : prop, x11)) -> (x5 = x7 -> (forall x11 : prop, x11)) -> (x6 = x7 -> (forall x11 : prop, x11)) -> (x1 = x8 -> (forall x11 : prop, x11)) -> (x2 = x8 -> (forall x11 : prop, x11)) -> (x3 = x8 -> (forall x11 : prop, x11)) -> (x4 = x8 -> (forall x11 : prop, x11)) -> (x5 = x8 -> (forall x11 : prop, x11)) -> (x6 = x8 -> (forall x11 : prop, x11)) -> (x7 = x8 -> (forall x11 : prop, x11)) -> (x1 = x9 -> (forall x11 : prop, x11)) -> (x2 = x9 -> (forall x11 : prop, x11)) -> (x3 = x9 -> (forall x11 : prop, x11)) -> (x4 = x9 -> (forall x11 : prop, x11)) -> (x5 = x9 -> (forall x11 : prop, x11)) -> (x6 = x9 -> (forall x11 : prop, x11)) -> (x7 = x9 -> (forall x11 : prop, x11)) -> (x8 = x9 -> (forall x11 : prop, x11)) -> (x1 = x10 -> (forall x11 : prop, x11)) -> (x2 = x10 -> (forall x11 : prop, x11)) -> (x3 = x10 -> (forall x11 : prop, x11)) -> (x4 = x10 -> (forall x11 : prop, x11)) -> (x5 = x10 -> (forall x11 : prop, x11)) -> (x6 = x10 -> (forall x11 : prop, x11)) -> (x7 = x10 -> (forall x11 : prop, x11)) -> (x8 = x10 -> (forall x11 : prop, x11)) -> (x9 = x10 -> (forall x11 : prop, x11)) -> atleastp u10 x0)))))))))).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Theorem missingprop_4ea53c48851955e8bea31637fee475e64087a6b61ca7b79b70612b7fb5547d5f : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2 : prop, (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (forall x5, x5 :e u9 -> (forall x6, x6 :e u9 -> (x1 = x3 -> (forall x7 : prop, x7)) -> (x1 = x4 -> (forall x7 : prop, x7)) -> (x1 = x5 -> (forall x7 : prop, x7)) -> (x1 = x6 -> (forall x7 : prop, x7)) -> (x3 = x4 -> (forall x7 : prop, x7)) -> (x3 = x5 -> (forall x7 : prop, x7)) -> (x3 = x6 -> (forall x7 : prop, x7)) -> (x4 = x5 -> (forall x7 : prop, x7)) -> (x4 = x6 -> (forall x7 : prop, x7)) -> (x5 = x6 -> (forall x7 : prop, x7)) -> x0 x1 x3 -> x0 x1 x4 -> x0 x1 x5 -> not (x0 x3 x4) -> not (x0 x3 x5) -> not (x0 x4 x5) -> (forall x7, x7 :e u9 -> x0 x1 x7 -> x7 :e SetAdjoin (SetAdjoin (UPair x1 x3) x4) x5) -> x0 x6 x3 -> x0 x6 x4 -> x2)))) -> x2))).
admit.
Qed.
