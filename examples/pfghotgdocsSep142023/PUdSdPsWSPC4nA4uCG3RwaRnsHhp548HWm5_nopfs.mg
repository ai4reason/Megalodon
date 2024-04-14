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
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom missingprop_e218ed8cf74f73d11b13279ecb43db2e902573ebd411cc1f7c1f71620f4a5da3 : (forall x0 x1, atleastp x0 x1 -> atleastp x1 x0 -> equip x0 x1).
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
Axiom missingprop_f59d6b770984c869c1e5c6fa6c966bf2e7f31a21d93561635565b3e8dc0de299 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x2 -> nIn x4 x3) -> atleastp (setsum x0 x1) (binunion x2 x3)).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem missingprop_9a1a966f8c8e7afed78247e44fc56ee0d1da4c414d7d3d1e95e0c6b106051621 : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x0 (setminus x1 x0)) -> x2 (binunion x0 (setminus x1 x0)) (binunion x0 x1)).
admit.
Qed.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Definition u7 : set :=
 ordsucc u6.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom missingprop_45d11dce2d0b092bd17c01d64c29c5885c90b43dc7cb762c6d6ada999ea508c5 : (forall x0, nat_p x0 -> (forall x1, or (atleastp x1 x0) (atleastp (ordsucc x0) x1))).
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_5 : nat_p 5.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom nat_3 : nat_p 3.
Axiom equip_ref : (forall x0, equip x0 x0).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Axiom binintersect_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binintersect x0 x1) (binintersect x1 x0) -> x2 (binintersect x1 x0) (binintersect x0 x1)).
Axiom missingprop_d80a5cdd35aff682e6edc37d56782355ff9ceaa0a69a0eeabe526b6102deafb2 : (forall x0 x1, forall x2 : set -> set -> prop, x2 x0 (binunion (setminus x0 x1) (binintersect x0 x1)) -> x2 (binunion (setminus x0 x1) (binintersect x0 x1)) x0).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_f535b7e55315533489247ef446da714ae119b4416908c171a0f36b33b8dd4dc1 : add_nat u5 u2 = u7.
Theorem missingprop_2e872802aaf3ec53f852073fbe4a1119b1c7dd35db69adf809a1eba03d82622c : (forall x0 x1, atleastp u3 (binintersect x0 x1) -> atleastp x0 u5 -> atleastp x1 u5 -> atleastp (binunion x0 x1) u7).
admit.
Qed.
Definition u8 : set :=
 ordsucc u7.
Definition u9 : set :=
 ordsucc u8.
Theorem missingprop_407f43b301b44d6761885ee5c0bd1f379d16b0dba6fd4f1f30ff25632fa81326 : add_nat u7 u2 = u9.
admit.
Qed.
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
Axiom nat_7 : nat_p 7.
Axiom nat_6 : nat_p 6.
Axiom nat_4 : nat_p 4.
Theorem missingprop_b099a6d384f67b798b0bfd1f45fa1160887a70345b08c9f181479611f83ae973 : add_nat u9 u8 = u17.
admit.
Qed.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom missingprop_043d6557c78f29ad2cb49e9735f83299e9477f30cbba49aec6fe4e6796b5763d : (forall x0 x1 x2, x2 :e x0 -> atleastp x0 (ordsucc x1) -> atleastp (setminus x0 (Sing x2)) x1).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition DirGraphOutNeighbors : set -> (set -> set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> prop => fun x2 : set => Sep x0 (fun x3 : set => and (x2 = x3 -> (forall x4 : prop, x4)) (x1 x2 x3))).
Axiom missingprop_e153145abdef8d76c5a6e74702cb9d7f11b028f942da54501a84e1d9c7529c05 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> (forall x4, x4 :e DirGraphOutNeighbors x0 x1 x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4))))).
Definition u18 : set :=
 ordsucc u17.
Axiom missingprop_942eb02a74c10f16602e1ae1f344c3023e05004e91bcaa34f489f7c49867be93 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> equip (DirGraphOutNeighbors u18 x0 x1) u5)).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom missingprop_cbcdc516d918dc788420402237ec548f378f3cef789b7403c9dd8f4b8490ac8e : add_nat u5 u1 = u6.
Axiom missingprop_12ee6633dc54fc9da79764260fff4b3b0c4c52c79582045c211dac0d55037713 : (forall x0 x1, x1 :e x0 -> atleastp u1 x0).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Theorem missingprop_a7eebbd0877028a5b64563f3f8deb69ec800c19cc86ab34abae3b4eaf878db79 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> (forall x2, x2 :e u18 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (x0 x1 x2) -> atleastp u1 (binintersect (DirGraphOutNeighbors u18 x0 x1) (DirGraphOutNeighbors u18 x0 x2))))).
admit.
Qed.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Definition TwoRamseyProp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom setminus_Subq : (forall x0 x1, setminus x0 x1 c= x0).
Axiom missingprop_c7ff2c1ce2f06f72fc2bfa42801bb82ccb8c93fb9879a65ac61f882be9c49615 : add_nat 4 2 = 6.
Axiom missingprop_70c71962e8fc1b4ddbda71c37aaca8def65b78d5219f1b88a18baeaefa0b7a55 : (forall x0 x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> atleastp u2 x0)).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Axiom TwoRamseyProp_3_4_9 : TwoRamseyProp 3 4 9.
Axiom nat_8 : nat_p 8.
Axiom nat_17 : nat_p 17.
Axiom missingprop_ff7563d54b310a61c1a752018a571ea929b537103802faa76e16375d0d762c34 : (forall x0 x1, x0 c= x1 -> x1 = binunion x0 (setminus x1 x0)).
Axiom missingprop_8805a75f81012de0423e9173532fc074fb73b80e451597fde52287a4721fb204 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom nat_9 : nat_p 9.
Axiom missingprop_597982e7559de2b855feaaad714998b2c76c203ae083789ba10d06918304c2af : (forall x0 x1, atleastp (UPair x0 x1) u2).
Theorem missingprop_fd1aa60075a6cb1ab6854d763e4039860335cee822238478a9df863451c3a626 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> (forall x2, x2 :e u18 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (x0 x1 x2) -> atleastp (binintersect (DirGraphOutNeighbors u18 x0 x1) (DirGraphOutNeighbors u18 x0 x2)) u2))).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_fb3d0adbe91c2b1cc5b1232e9c5e5db92d0c657c92a093db9ee89bd94dc257ee : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> (forall x2, x2 :e u18 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (x0 x1 x2) -> or (equip (binintersect (DirGraphOutNeighbors u18 x0 x1) (DirGraphOutNeighbors u18 x0 x2)) u1) (equip (binintersect (DirGraphOutNeighbors u18 x0 x1) (DirGraphOutNeighbors u18 x0 x2)) u2)))).
admit.
Qed.
