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
Axiom In_0_3 : 0 :e 3.
Axiom In_1_3 : 1 :e 3.
Axiom In_2_3 : 2 :e 3.
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Theorem missingprop_95c6cbd2308b27a7edcd2a1d9389b377988e902d740d05dc7c88e6b8da945ab9 : (forall x0, atleastp 3 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1))) -> x1)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Theorem missingprop_1f3f366e14c73ec48a422efa1703953039e0b4a1e969c23730d9245db2f327d4 : (forall x0 x1, x1 c= Power (ordsucc x0) -> (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> (forall x4 : prop, (forall x5, and (x5 :e ordsucc x0) (x5 :e x2 = x5 :e x3) -> x4) -> x4))) -> atleastp x1 (Power x0)).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter Inj0 "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" "8143218ffde429ff34b20ee5c938914c75e40d59cd52cc5db4114971d231ca73" *)
Parameter Inj0 : set -> set.
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
Axiom Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
Axiom Inj0_inj : (forall x0 x1, Inj0 x0 = Inj0 x1 -> x0 = x1).
Axiom Inj0_Inj1_neq : (forall x0 x1, Inj0 x0 = Inj1 x1 -> (forall x2 : prop, x2)).
Axiom Inj1_inj : (forall x0 x1, Inj1 x0 = Inj1 x1 -> x0 = x1).
Theorem missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom PigeonHole_nat : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e ordsucc x0 -> x1 x2 :e x0) -> not (forall x2, x2 :e ordsucc x0 -> (forall x3, x3 :e ordsucc x0 -> x1 x2 = x1 x3 -> x2 = x3)))).
Theorem missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom cases_4 : (forall x0, x0 :e 4 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 x0)).
Axiom tuple_4_0_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0) x0 -> x4 x0 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0)).
Axiom Empty_In_Power : (forall x0, 0 :e Power x0).
Axiom tuple_4_1_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1) x1 -> x4 x1 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1)).
Axiom Subq_1_2 : 1 c= 2.
Axiom tuple_4_2_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2) x2 -> x4 x2 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2)).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom In_1_2 : 1 :e 2.
Axiom tuple_4_3_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3) x3 -> x4 x3 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3)).
Axiom Self_In_Power : (forall x0, x0 :e Power x0).
Axiom not_Empty_eq_Sing : (forall x0, 0 = Sing x0 -> (forall x1 : prop, x1)).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Axiom nIn_not_eq_Sing : (forall x0 x1, nIn x0 x1 -> x1 = Sing x0 -> (forall x2 : prop, x2)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom In_0_2 : 0 :e 2.
Axiom neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
Axiom In_Power_2_cases_impred : (forall x0, x0 :e Power 2 -> (forall x1 : prop, (x0 = 0 -> x1) -> (x0 = 1 -> x1) -> (x0 = Sing 1 -> x1) -> (x0 = 2 -> x1) -> x1)).
Axiom In_0_4 : 0 :e 4.
Axiom In_1_4 : 1 :e 4.
Axiom In_2_4 : 2 :e 4.
Axiom In_3_4 : 3 :e 4.
Theorem missingprop_a2e75caeebe46359eec4abf3d977b407a386725b84f4aeac6b92aa7fc83ac4b8 : equip 4 (Power 2).
admit.
Qed.
Axiom bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
Axiom Inj1I2 : (forall x0 x1, x1 :e x0 -> Inj1 x1 :e Inj1 x0).
Axiom Inj1I1 : (forall x0, 0 :e Inj1 x0).
Axiom Inj1NE1 : (forall x0, Inj1 x0 = 0 -> (forall x1 : prop, x1)).
Axiom Inj1E : (forall x0 x1, x1 :e Inj1 x0 -> or (x1 = 0) (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 = Inj1 x3) -> x2) -> x2)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_c0c4d5a2bc2380a9bf5f072ca1b6c6de0f9cf249a6300964520a8eca88f1ad2a : (forall x0 x1, equip x0 x1 -> equip (ordsucc x0) (Inj1 x1)).
admit.
Qed.
Axiom Inj1_setsum_1L : (forall x0, forall x1 : set -> set -> prop, x1 (setsum 1 x0) (Inj1 x0) -> x1 (Inj1 x0) (setsum 1 x0)).
Theorem missingprop_df367236b04025a8bc475bb0339f30914d7857f44d1c25f727210d578b124584 : equip 5 (setsum 1 (Power 2)).
admit.
Qed.
Axiom nat_5 : nat_p 5.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Theorem missingprop_7f444f6cc2b3e8fcea6dd2732c041a0e6b190d56d44fec793c589d5fd75a4590 : (forall x0 x1, (forall x2, x2 :e x0 -> nIn x2 x1) -> atleastp 6 (binunion x0 x1) -> atleastp x0 1 -> atleastp x1 (Power 2) -> False).
admit.
Qed.
Axiom cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
Theorem missingprop_bdf8f38979e5b6aa5a80d7e7d322fb2fd2730d38183e0411cbbccad81116d61b : (forall x0, x0 c= 3 -> (forall x1, x1 c= 3 -> 0 :e x0 = 0 :e x1 -> 1 :e x0 = 1 :e x1 -> 2 :e x0 = 2 :e x1 -> x0 = x1)).
admit.
Qed.
