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
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_2 : nat_p 2.
Axiom nat_1 : nat_p 1.
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_0081651aea3d6f1c927139f33dafe364a67f12ece85830970354f85e4fe4a0a7 : add_nat u3 u3 = u6.
admit.
Qed.
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
Axiom nat_4 : nat_p 4.
Axiom nat_3 : nat_p 3.
Theorem missingprop_abc20638bf748af1a36f43157efbc918ef01c9604b8bdbaf812a69e5e78ab11d : add_nat u12 u5 = u17.
admit.
Qed.
Axiom add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
Axiom nat_12 : nat_p 12.
Theorem missingprop_a826f2620b9c1761a765a32e5d5dcbc640507b9be837b9f7de8f5a679692e566 : add_nat u13 u4 = u17.
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Axiom SchroederBernstein : (forall x0 x1, forall x2 x3 : set -> set, inj x0 x1 x2 -> inj x1 x0 x3 -> equip x0 x1).
Theorem missingprop_e218ed8cf74f73d11b13279ecb43db2e902573ebd411cc1f7c1f71620f4a5da3 : (forall x0 x1, atleastp x0 x1 -> atleastp x1 x0 -> equip x0 x1).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_8c033b5532b5ecb975cda388e43db69e003e5159ad10f70a2cd946604e0cb0f6 : (forall x0 x1, atleastp x0 x1 -> (forall x2 : prop, (forall x3, x3 c= x1 -> equip x0 x3 -> x2) -> x2)).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_8fed54475e70b18fbe9db03f1a81cd38ab9b210f0bea8d2bb706323c288b83da : (forall x0 x1 x2 x3, equip x0 x2 -> equip x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> equip (binunion x0 x1) (setsum x2 x3)).
Axiom Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
Axiom binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom binunion_Subq_1 : (forall x0 x1, x0 c= binunion x0 x1).
Axiom binunion_Subq_2 : (forall x0 x1, x1 c= binunion x0 x1).
Theorem missingprop_f59d6b770984c869c1e5c6fa6c966bf2e7f31a21d93561635565b3e8dc0de299 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x2 -> nIn x4 x3) -> atleastp (setsum x0 x1) (binunion x2 x3)).
admit.
Qed.
(* Parameter SetAdjoin "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" "1f3a09356e470bff37ef2408148f440357b92f92f9a27c828b37d777eb41ddc6" *)
Parameter SetAdjoin : set -> set -> set.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Axiom missingprop_81da4a4b6c1b1603a521d080942fe6e652095cdddea7d0d491d4c44dcea723fa : (forall x0 x1 x2 x3, x3 :e SetAdjoin (UPair x0 x1) x2 -> (forall x4 : set -> prop, x4 x0 -> x4 x1 -> x4 x2 -> x4 x3)).
Theorem missingprop_434e2e2330a02d70f83efc2b51c595946aeb4462c38cf32d55a1757fe463ba11 : (forall x0 x1 x2, forall x3 : set -> prop, x3 x0 -> x3 x1 -> x3 x2 -> (forall x4, x4 :e SetAdjoin (UPair x0 x1) x2 -> x3 x4)).
admit.
Qed.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Axiom missingprop_ff7563d54b310a61c1a752018a571ea929b537103802faa76e16375d0d762c34 : (forall x0 x1, x0 c= x1 -> x1 = binunion x0 (setminus x1 x0)).
Theorem missingprop_2ec38089a92dcd86a75a337a6e999322444786992f1b612acfe1d68011bad142 : (forall x0 x1, x1 c= x0 -> x0 = binunion (setminus x0 x1) x1).
admit.
Qed.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom missingprop_20ec276501d9ecb91e40cc4525c5a2c0798ab59924056be0d591bc4dcbb72338 : (forall x0 x1 x2, x2 :e x0 -> (forall x3 : set -> set, bij x0 x1 x3 -> bij (setminus x0 (Sing x2)) (setminus x1 (Sing (x3 x2))) x3)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Theorem missingprop_997b324045b1165b0cf38788927ff324ddb3a505c8b91e290586e4dd5480f2bd : (forall x0 x1 x2, x2 :e x0 -> equip x0 (ordsucc x1) -> equip (setminus x0 (Sing x2)) x1).
admit.
Qed.
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem missingprop_085ebafec807a7a2a3be885b45bd1cb633614843d46ca40af31ed222f04aaeef : (forall x0 x1 x2, x2 :e x0 -> (forall x3 : set -> set, inj x0 x1 x3 -> inj (setminus x0 (Sing x2)) (setminus x1 (Sing (x3 x2))) x3)).
admit.
Qed.
Theorem missingprop_043d6557c78f29ad2cb49e9735f83299e9477f30cbba49aec6fe4e6796b5763d : (forall x0 x1 x2, x2 :e x0 -> atleastp x0 (ordsucc x1) -> atleastp (setminus x0 (Sing x2)) x1).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition DirGraphOutNeighbors : set -> (set -> set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> prop => fun x2 : set => Sep x0 (fun x3 : set => and (x2 = x3 -> (forall x4 : prop, x4)) (x1 x2 x3))).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Theorem missingprop_426b271b8453605fe796f284fb15405fbff198d07b0c3dc7b8c218dee82a5c65 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> x2 :e DirGraphOutNeighbors x0 x1 x3))).
admit.
Qed.
Axiom missingprop_8a21f6cb5fc1714044127ec01eb34af4a43c7190a9ab55c5830d9c24f7e274f6 : (forall x0 x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> atleastp u3 x0))).
Axiom missingprop_2f981bb386e15ae80933d34ec7d4feaabeedc598a3b07fb73b422d0a88302c67 : (forall x0 x1 x2, x0 :e SetAdjoin (UPair x0 x1) x2).
Axiom missingprop_91640ab91f642c55f5e5a7feb12af7896a6f3419531543b011f7b54a888153d1 : (forall x0 x1 x2, x1 :e SetAdjoin (UPair x0 x1) x2).
Axiom missingprop_ca66642b4e7ed479322d8970220318ddbb0c129adc66c35d9ce66f8223608389 : (forall x0 x1 x2, x2 :e SetAdjoin (UPair x0 x1) x2).
Theorem missingprop_e153145abdef8d76c5a6e74702cb9d7f11b028f942da54501a84e1d9c7529c05 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> (forall x4, x4 :e DirGraphOutNeighbors x0 x1 x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4))))).
admit.
Qed.
Axiom missingprop_45d11dce2d0b092bd17c01d64c29c5885c90b43dc7cb762c6d6ada999ea508c5 : (forall x0, nat_p x0 -> (forall x1, or (atleastp x1 x0) (atleastp (ordsucc x0) x1))).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Theorem missingprop_7fc58161c06ac759b74ed554400e74038cd0a5c3177ca714d699b1cb30814d29 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, nat_p x2 -> (forall x3, x3 c= x0 -> atleastp (ordsucc x2) x3 -> not (forall x4, x4 :e x3 -> (forall x5, x5 :e x3 -> (x4 = x5 -> (forall x6 : prop, x6)) -> not (x1 x4 x5)))) -> (forall x3, x3 :e x0 -> atleastp (DirGraphOutNeighbors x0 x1 x3) x2))).
admit.
Qed.
Definition TwoRamseyProp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Axiom setminus_Subq : (forall x0 x1, setminus x0 x1 c= x0).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom missingprop_150e303ecf8a7227a9f23528d11666f9ad495de0a25ae8fba20dedf2c3db2f83 : add_nat 4 1 = 5.
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom equip_ref : (forall x0, equip x0 x0).
Axiom missingprop_be1ab2772f2343e1b7afd526582f606d68258ba3f0b6521a351e0ecb8bf3c52e : (forall x0, equip (Sing x0) u1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Axiom TwoRamseyProp_3_4_9 : TwoRamseyProp 3 4 9.
Axiom nat_8 : nat_p 8.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom missingprop_8805a75f81012de0423e9173532fc074fb73b80e451597fde52287a4721fb204 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom missingprop_6f4f3b954cb736651074754cd4a7a9c9f8fdee5b2d9e8c774389a322e59d45f1 : (forall x0, atleastp (Sing x0) u1).
Axiom missingprop_6cbf2ce5b238902a91be96bb2397d1da08ec04d3fb85075e050578834f28c05e : add_nat 8 4 = 12.
Theorem missingprop_54d2e451cb5c2e9a38e91d17277dd467c0ffb3d62664bce1539cc052c0f0e5f2 : (forall x0, atleastp u13 x0 -> (forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 c= x0 -> atleastp u5 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4)))) -> (forall x2, x2 :e x0 -> atleastp u4 (DirGraphOutNeighbors x0 x1 x2)))).
admit.
Qed.
Definition u18 : set :=
 ordsucc u17.
Axiom nat_13 : nat_p 13.
Axiom missingprop_cbcdc516d918dc788420402237ec548f378f3cef789b7403c9dd8f4b8490ac8e : add_nat u5 u1 = u6.
Axiom nat_5 : nat_p 5.
Axiom TwoRamseyProp_3_5_14 : TwoRamseyProp 3 5 14.
Theorem missingprop_85506b6c69878f76c92de64599015cf7ee14b1d70236436d66a4fb9fd9f5e012 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> atleastp (setminus u18 (binunion (DirGraphOutNeighbors u18 x0 x1) (Sing x1))) u13)).
admit.
Qed.
Axiom nat_17 : nat_p 17.
Theorem missingprop_80515a4f51b905e5f458bd64311a6e5631d7df258f9b51af7e5c23139d13dc0a : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> atleastp u4 (DirGraphOutNeighbors u18 x0 x1))).
admit.
Qed.
Axiom missingprop_c7ff2c1ce2f06f72fc2bfa42801bb82ccb8c93fb9879a65ac61f882be9c49615 : add_nat 4 2 = 6.
Axiom missingprop_39df499f773ced696ac600b0767cd28b9ceea72e50ff2c9103bc16896281c585 : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> equip (UPair x0 x1) u2).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom missingprop_12ee6633dc54fc9da79764260fff4b3b0c4c52c79582045c211dac0d55037713 : (forall x0 x1, x1 :e x0 -> atleastp u1 x0).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom missingprop_01a9c78d2ff9508973a3397619af294eba02d9395696c331bc156cf4e0508f7d : (forall x0 x1 x2, (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> equip (SetAdjoin (UPair x0 x1) x2) u3).
Axiom nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
Axiom In_3_4 : 3 :e 4.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom missingprop_19c5bea28ef119e30d80f4e7c578df826b34bc3d0b15978a12c7c1b896ec3046 : (forall x0, atleastp u4 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (x2 = x3 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x1)))) -> x1)).
Axiom missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
Theorem missingprop_942eb02a74c10f16602e1ae1f344c3023e05004e91bcaa34f489f7c49867be93 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> equip (DirGraphOutNeighbors u18 x0 x1) u5)).
admit.
Qed.
