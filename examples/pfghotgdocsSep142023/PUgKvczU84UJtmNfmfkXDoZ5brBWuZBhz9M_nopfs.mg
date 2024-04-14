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
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter Inj0 "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" "8143218ffde429ff34b20ee5c938914c75e40d59cd52cc5db4114971d231ca73" *)
Parameter Inj0 : set -> set.
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
Axiom Inj0_inj : (forall x0 x1, Inj0 x0 = Inj0 x1 -> x0 = x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom Inj0_Inj1_neq : (forall x0 x1, Inj0 x0 = Inj1 x1 -> (forall x2 : prop, x2)).
Axiom Inj1_inj : (forall x0 x1, Inj1 x0 = Inj1 x1 -> x0 = x1).
Axiom missingprop_b6961926aadf85665852392f583ee4d9244a4c9e2652b11ec190e8e3e49588b9 : (forall x0 x1, forall x2 : set -> prop, (forall x3, x3 :e x0 -> x2 (Inj0 x3)) -> (forall x3, x3 :e x1 -> x2 (Inj1 x3)) -> (forall x3, x3 :e setsum x0 x1 -> x2 x3)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Theorem missingprop_8fed54475e70b18fbe9db03f1a81cd38ab9b210f0bea8d2bb706323c288b83da : (forall x0 x1 x2 x3, equip x0 x2 -> equip x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> equip (binunion x0 x1) (setsum x2 x3)).
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_3d49cae020bbbfc37618d229c52b061e89851b6bf6d51c1368f17fc973c0456f : add_nat u3 u1 = u4.
admit.
Qed.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
Theorem missingprop_cbcdc516d918dc788420402237ec548f378f3cef789b7403c9dd8f4b8490ac8e : add_nat u5 u1 = u6.
admit.
Qed.
Definition u7 : set :=
 ordsucc u6.
Axiom nat_1 : nat_p 1.
Theorem missingprop_f535b7e55315533489247ef446da714ae119b4416908c171a0f36b33b8dd4dc1 : add_nat u5 u2 = u7.
admit.
Qed.
Definition u8 : set :=
 ordsucc u7.
Axiom nat_2 : nat_p 2.
Theorem missingprop_95604e4190114887a560e7cb884c9d6e5dc448aed6331e8efbb9b9f11a2dd14c : add_nat u5 u3 = u8.
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom Subq_binintersection_eq : (forall x0 x1, forall x2 : prop -> prop -> prop, x2 (x0 c= x1) (binintersect x0 x1 = x0) -> x2 (binintersect x0 x1 = x0) (x0 c= x1)).
Axiom missingprop_d80a5cdd35aff682e6edc37d56782355ff9ceaa0a69a0eeabe526b6102deafb2 : (forall x0 x1, forall x2 : set -> set -> prop, x2 x0 (binunion (setminus x0 x1) (binintersect x0 x1)) -> x2 (binunion (setminus x0 x1) (binintersect x0 x1)) x0).
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Axiom binintersect_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binintersect x0 x1) (binintersect x1 x0) -> x2 (binintersect x1 x0) (binintersect x0 x1)).
Theorem missingprop_ff7563d54b310a61c1a752018a571ea929b537103802faa76e16375d0d762c34 : (forall x0 x1, x0 c= x1 -> x1 = binunion x0 (setminus x1 x0)).
admit.
Qed.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Theorem missingprop_4b1a7ff1f1af5eade46b5657f25a1ce39a3af58e2fba0b757867e511fb9aacae : (forall x0 x1, forall x2 : set -> set -> prop, x2 (UPair x0 x1) (binunion (Sing x0) (Sing x1)) -> x2 (binunion (Sing x0) (Sing x1)) (UPair x0 x1)).
admit.
Qed.
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_eab190d6552dbda6c7d00c3e93c1ad9385698a8d73462a2a4e5795b67701610d : (forall x0 x1 x2, nIn x2 x1 -> equip x0 x1 -> equip (ordsucc x0) (binunion x1 (Sing x2))).
Axiom missingprop_be1ab2772f2343e1b7afd526582f606d68258ba3f0b6521a351e0ecb8bf3c52e : (forall x0, equip (Sing x0) u1).
Theorem missingprop_39df499f773ced696ac600b0767cd28b9ceea72e50ff2c9103bc16896281c585 : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> equip (UPair x0 x1) u2).
admit.
Qed.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Theorem missingprop_81da4a4b6c1b1603a521d080942fe6e652095cdddea7d0d491d4c44dcea723fa : (forall x0 x1 x2 x3, x3 :e SetAdjoin (UPair x0 x1) x2 -> (forall x4 : set -> prop, x4 x0 -> x4 x1 -> x4 x2 -> x4 x3)).
admit.
Qed.
Theorem missingprop_3de4fed6100f7a1644d3bcc671dd5818f525687e19a89aa1d64708dea3801718 : (forall x0 x1 x2 x3 x4, x4 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3 -> (forall x5 : set -> prop, x5 x0 -> x5 x1 -> x5 x2 -> x5 x3 -> x5 x4)).
admit.
Qed.
Theorem missingprop_01a9c78d2ff9508973a3397619af294eba02d9395696c331bc156cf4e0508f7d : (forall x0 x1 x2, (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> equip (SetAdjoin (UPair x0 x1) x2) u3).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_30f51c1e2b83590a7ed46a006f5e6311b01e639f1f6e9abb0eccefd285a20a15 : (forall x0 x1 x2 x3, (x0 = x1 -> (forall x4 : prop, x4)) -> (x0 = x2 -> (forall x4 : prop, x4)) -> (x0 = x3 -> (forall x4 : prop, x4)) -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> equip (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) u4).
admit.
Qed.
Definition u9 : set :=
 ordsucc u8.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Theorem missingprop_d71775a919fcd71c3df9b239572bb429970e7485925e8b51a4ff0e03a6e5bed4 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> x0 x1 x2 -> x0 x1 x3 -> x0 x2 x3 -> (forall x4 : prop, (x1 = x2 -> x4) -> (x1 = x3 -> x4) -> (x2 = x3 -> x4) -> x4))))).
admit.
Qed.
Theorem missingprop_7f098af8306b8cdcf47b26bfb1455c3824eb4d0d35f81e31f1ed9b01cffac7ac : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> not (x0 x1 x2) -> not (x0 x1 x3) -> not (x0 x1 x4) -> not (x0 x2 x3) -> not (x0 x2 x4) -> not (x0 x3 x4) -> (forall x5 : prop, (x1 = x2 -> x5) -> (x1 = x3 -> x5) -> (x1 = x4 -> x5) -> (x2 = x3 -> x5) -> (x2 = x4 -> x5) -> (x3 = x4 -> x5) -> x5)))))).
admit.
Qed.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition TwoRamseyProp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom nat_3 : nat_p 3.
Axiom equip_ref : (forall x0, equip x0 x0).
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Axiom TwoRamseyProp_3_3_6 : TwoRamseyProp 3 3 6.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom missingprop_45d11dce2d0b092bd17c01d64c29c5885c90b43dc7cb762c6d6ada999ea508c5 : (forall x0, nat_p x0 -> (forall x1, or (atleastp x1 x0) (atleastp (ordsucc x0) x1))).
Axiom nat_5 : nat_p 5.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_8 : nat_p 8.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom missingprop_19c5bea28ef119e30d80f4e7c578df826b34bc3d0b15978a12c7c1b896ec3046 : (forall x0, atleastp u4 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (x2 = x3 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x1)))) -> x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Theorem missingprop_452df11b965aa438aa496a76fcdf27f39965839d9f9a8a70e5fe6b3a61f5a4ef : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2 : prop, (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (forall x5, x5 :e u9 -> (x1 = x3 -> (forall x6 : prop, x6)) -> (x1 = x4 -> (forall x6 : prop, x6)) -> (x1 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x0 x1 x3 -> x0 x1 x4 -> x0 x1 x5 -> x2))) -> x2))).
admit.
Qed.
Theorem missingprop_15d48b0d93044e45e1d5f0b67d2878c4ac013f81cd695d89157633dd4a764e14 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2 : prop, (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (forall x5, x5 :e u9 -> (x1 = x3 -> (forall x6 : prop, x6)) -> (x1 = x4 -> (forall x6 : prop, x6)) -> (x1 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x0 x1 x3 -> x0 x1 x4 -> x0 x1 x5 -> not (x0 x3 x4) -> not (x0 x3 x5) -> not (x0 x4 x5) -> (forall x6, x6 :e u9 -> x0 x1 x6 -> x6 :e SetAdjoin (SetAdjoin (UPair x1 x3) x4) x5) -> x2))) -> x2))).
admit.
Qed.
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Theorem missingprop_5df8c11eede12b7d829e2a0b95c8033f28b954d28a1a477c3fa227324f16bb6c : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (x1 = x2 -> (forall x3 : prop, x3)) -> x0 x1 x2 -> (forall x3 : prop, (forall x4, x4 :e u9 -> (forall x5, x5 :e u9 -> (x1 = x4 -> (forall x6 : prop, x6)) -> (x1 = x5 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x0 x1 x4 -> x0 x1 x5 -> not (x0 x2 x4) -> not (x0 x2 x5) -> not (x0 x4 x5) -> (forall x6, x6 :e u9 -> x0 x1 x6 -> x6 :e SetAdjoin (SetAdjoin (UPair x1 x2) x4) x5) -> x3)) -> x3)))).
admit.
Qed.
Theorem missingprop_f0014261a073154b27e42b7a2586bc3123c4455a00f08c2d90b89b2c21d8c9c7 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x1 x2 -> x0 x1 x3 -> (forall x4 : prop, (forall x5, x5 :e u9 -> (x1 = x5 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> x0 x1 x5 -> not (x0 x2 x5) -> not (x0 x3 x5) -> (forall x6, x6 :e u9 -> x0 x1 x6 -> x6 :e SetAdjoin (SetAdjoin (UPair x1 x2) x3) x5) -> x4) -> x4))))).
admit.
Qed.
Theorem missingprop_a58ed68e326facfa3846ecea2faee66b9aeeaf3494644a87b11776a6d6b043a5 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (x1 = x2 -> (forall x5 : prop, x5)) -> (x1 = x3 -> (forall x5 : prop, x5)) -> (x1 = x4 -> (forall x5 : prop, x5)) -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x1 x2 -> x0 x1 x3 -> x0 x1 x4 -> (forall x5, x5 :e u9 -> x0 x1 x5 -> x5 :e SetAdjoin (SetAdjoin (UPair x1 x2) x3) x4)))))).
admit.
Qed.
