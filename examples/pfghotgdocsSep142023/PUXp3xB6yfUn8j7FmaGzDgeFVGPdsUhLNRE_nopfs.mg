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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem missingprop_3dc3ca8e80c5985b3812224a7e8b12ade87bd8c503ccba160df1d5346c5b9a71 : (forall x0 x1, x1 c= x0 -> (forall x2, x2 c= x0 -> (forall x3, x3 :e x0 -> x3 :e x1 -> x3 :e x2) -> (forall x3, x3 :e x0 -> x3 :e x2 -> x3 :e x1) -> x1 = x2)).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom In_2_3 : 2 :e 3.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom In_1_3 : 1 :e 3.
Axiom In_0_3 : 0 :e 3.
Theorem missingprop_e980f3b4eb3d84c6d1fc977b9fa5a0b22ba1b43104b18cf429ec74cbcbeb2e0e : (forall x0, x0 :e 3 -> (forall x1, x1 :e 3 -> (x0 = x1 -> (forall x2 : prop, x2)) -> (forall x2 : prop, (forall x3, and (x3 :e 3) (forall x4, x4 :e 3 -> (x4 = x3 -> (forall x5 : prop, x5)) -> or (x4 = x0) (x4 = x1)) -> x2) -> x2))).
admit.
Qed.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Theorem missingprop_0135c1838e7dbe9ce6268a16d200d01454b4a7eb96329920d0693540cf460d73 : (forall x0 x1 : prop, (x0 = x1 -> (forall x2 : prop, x2)) -> (forall x2 : prop, or (x2 = x0) (x2 = x1))).
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
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom In_0_2 : 0 :e 2.
Axiom In_1_2 : 1 :e 2.
Theorem missingprop_3ec052b482c9586393801a691570db7db5e41e6f5045529f723594be820ae083 : (forall x0 x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> (forall x3, x3 :e x0 -> or (x3 = x1) (x3 = x2)) -> equip 2 x0)).
admit.
Qed.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem missingprop_6b7679dc4db802a54146c35c96ab8434ce7f76facbf7624371a3206bd73fb6ab : (forall x0, atleastp x0 0 -> x0 = 0).
admit.
Qed.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Theorem missingprop_b1ab55fb3adc1f5608875c7150ec0901fc5d8b2cbdf1e5df6d670947db1f7326 : (forall x0, equip 0 x0 -> x0 = 0).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem missingprop_20fce6fc7f2e036c1229cbf996632439eddb19cfae541105a83e5be9c65bc111 : (forall x0 x1, x1 :e x0 -> x0 = binunion (setminus x0 (Sing x1)) (Sing x1)).
admit.
Qed.
Axiom bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_eab190d6552dbda6c7d00c3e93c1ad9385698a8d73462a2a4e5795b67701610d : (forall x0 x1 x2, nIn x2 x1 -> equip x0 x1 -> equip (ordsucc x0) (binunion x1 (Sing x2))).
admit.
Qed.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
(* Parameter Inj0 "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" "8143218ffde429ff34b20ee5c938914c75e40d59cd52cc5db4114971d231ca73" *)
Parameter Inj0 : set -> set.
Axiom setsum_Inj_inv : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = Inj0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = Inj1 x4) -> x3) -> x3)).
Axiom Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
Axiom Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem missingprop_a6105cd3bee646cbc6a7978da0610ff59702805b421c59ac087574af921e69c9 : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (setsum x0 (binunion x1 x2)) (binunion (setsum x0 x1) (Repl x2 Inj1)) -> x3 (binunion (setsum x0 x1) (Repl x2 Inj1)) (setsum x0 (binunion x1 x2))).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom Inj0_inj : (forall x0 x1, Inj0 x0 = Inj0 x1 -> x0 = x1).
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom Repl_Sing : (forall x0 : set -> set, forall x1, forall x2 : set -> set -> prop, x2 (Repl (Sing x1) x0) (Sing (x0 x1)) -> x2 (Sing (x0 x1)) (Repl (Sing x1) x0)).
Axiom Inj0_Inj1_neq : (forall x0 x1, Inj0 x0 = Inj1 x1 -> (forall x2 : prop, x2)).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom Inj1_inj : (forall x0 x1, Inj1 x0 = Inj1 x1 -> x0 = x1).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Theorem missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
admit.
Qed.
Axiom nat_0 : nat_p 0.
Theorem missingprop_8bd16f1c6d595fd2e54164941c14be47266d62f6203fb144a3e90b4a111e96af : add_nat 2 1 = 3.
admit.
Qed.
Axiom nat_1 : nat_p 1.
Theorem missingprop_a056e7e1d4164d24a60c8047a73979083395e5609e36aaee67608ba08eded8a1 : add_nat 2 2 = 4.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Axiom equip_ref : (forall x0, equip x0 x0).
Theorem missingprop_51bec2d8eaf1a80be21b9c627f1350028311d7a37b5fc9ca1e29924c42861ed2 : equip 4 (setsum 2 2).
admit.
Qed.
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom In_0_1 : 0 :e 1.
Theorem missingprop_7f4cc74286338bdb3dc8d40a5d6e96ae816d0c1e29bc03842b7e31756efa27de : (forall x0, x0 c= Power 3 -> (forall x1, x1 c= Power 3 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e 3) (forall x6 : prop, (forall x7, and (x7 :e 3) (and (and (x5 = x7 -> (forall x8 : prop, x8)) (x5 :e x2 = x5 :e x3)) (x7 :e x2 = x7 :e x3)) -> x6) -> x6) -> x4) -> x4))) -> (forall x2 : prop, (atleastp x0 1 -> x2) -> (atleastp x1 1 -> x2) -> (equip 2 x0 -> equip 2 x1 -> x2) -> x2))).
admit.
Qed.
