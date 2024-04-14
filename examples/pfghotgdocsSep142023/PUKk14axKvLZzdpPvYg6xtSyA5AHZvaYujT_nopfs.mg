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
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom missingprop_3de4fed6100f7a1644d3bcc671dd5818f525687e19a89aa1d64708dea3801718 : (forall x0 x1 x2 x3 x4, x4 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3 -> (forall x5 : set -> prop, x5 x0 -> x5 x1 -> x5 x2 -> x5 x3 -> x5 x4)).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Theorem missingprop_adcc59d9ee410b66386ecaedc82bf46a176ebbf6449d79464abd3c2581f7e01d : (forall x0 x1 x2 x3 x4 x5, x5 :e SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4 -> (forall x6 : set -> prop, x6 x0 -> x6 x1 -> x6 x2 -> x6 x3 -> x6 x4 -> x6 x5)).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
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
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Axiom missingprop_45d11dce2d0b092bd17c01d64c29c5885c90b43dc7cb762c6d6ada999ea508c5 : (forall x0, nat_p x0 -> (forall x1, or (atleastp x1 x0) (atleastp (ordsucc x0) x1))).
Axiom nat_3 : nat_p 3.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_8 : nat_p 8.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom missingprop_d80a5cdd35aff682e6edc37d56782355ff9ceaa0a69a0eeabe526b6102deafb2 : (forall x0 x1, forall x2 : set -> set -> prop, x2 x0 (binunion (setminus x0 x1) (binintersect x0 x1)) -> x2 (binunion (setminus x0 x1) (binintersect x0 x1)) x0).
Axiom binintersect_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binintersect x0 x1) (binintersect x1 x0) -> x2 (binintersect x1 x0) (binintersect x0 x1)).
Axiom binintersect_Subq_eq_1 : (forall x0 x1, x0 c= x1 -> binintersect x0 x1 = x0).
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom missingprop_3fceca27190be082874ab0327e8c7b21f47d4627eb1f13a0cdc619c2edff8aa4 : (forall x0 x1 x2 x3 x4, (x0 = x1 -> (forall x5 : prop, x5)) -> (x0 = x2 -> (forall x5 : prop, x5)) -> (x0 = x3 -> (forall x5 : prop, x5)) -> (x0 = x4 -> (forall x5 : prop, x5)) -> (x1 = x2 -> (forall x5 : prop, x5)) -> (x1 = x3 -> (forall x5 : prop, x5)) -> (x1 = x4 -> (forall x5 : prop, x5)) -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> equip (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) u5).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom missingprop_95604e4190114887a560e7cb884c9d6e5dc448aed6331e8efbb9b9f11a2dd14c : add_nat u5 u3 = u8.
Axiom add_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = add_nat x1 x0)).
Axiom nat_5 : nat_p 5.
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom equip_ref : (forall x0, equip x0 x0).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom If_i_or : (forall x0 : prop, forall x1 x2, or (If_i x0 x1 x2 = x1) (If_i x0 x1 x2 = x2)).
Axiom In_0_3 : 0 :e 3.
Axiom In_1_3 : 1 :e 3.
Axiom In_2_3 : 2 :e 3.
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom missingprop_a58ed68e326facfa3846ecea2faee66b9aeeaf3494644a87b11776a6d6b043a5 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (x1 = x2 -> (forall x5 : prop, x5)) -> (x1 = x3 -> (forall x5 : prop, x5)) -> (x1 = x4 -> (forall x5 : prop, x5)) -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x1 x2 -> x0 x1 x3 -> x0 x1 x4 -> (forall x5, x5 :e u9 -> x0 x1 x5 -> x5 :e SetAdjoin (SetAdjoin (UPair x1 x2) x3) x4)))))).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Axiom neq_1_0 : u1 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_0 : u2 = 0 -> (forall x0 : prop, x0).
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Axiom neq_2_1 : u2 = u1 -> (forall x0 : prop, x0).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom missingprop_7f098af8306b8cdcf47b26bfb1455c3824eb4d0d35f81e31f1ed9b01cffac7ac : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> not (x0 x1 x2) -> not (x0 x1 x3) -> not (x0 x1 x4) -> not (x0 x2 x3) -> not (x0 x2 x4) -> not (x0 x3 x4) -> (forall x5 : prop, (x1 = x2 -> x5) -> (x1 = x3 -> x5) -> (x1 = x4 -> x5) -> (x2 = x3 -> x5) -> (x2 = x4 -> x5) -> (x3 = x4 -> x5) -> x5)))))).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_e5f54883ef81ce7762b9725b9788939c5645e264719dcad8a0b5599f672a6573 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (forall x5, x5 :e u9 -> (x1 = x2 -> (forall x6 : prop, x6)) -> (x1 = x3 -> (forall x6 : prop, x6)) -> (x1 = x4 -> (forall x6 : prop, x6)) -> (x1 = x5 -> (forall x6 : prop, x6)) -> (x2 = x3 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x0 x1 x2 -> x0 x1 x3 -> x0 x1 x4 -> not (x0 x2 x3) -> not (x0 x2 x4) -> not (x0 x3 x4) -> x0 x5 x2 -> x0 x5 x3 -> x0 x5 x4 -> False)))))).
admit.
Qed.
