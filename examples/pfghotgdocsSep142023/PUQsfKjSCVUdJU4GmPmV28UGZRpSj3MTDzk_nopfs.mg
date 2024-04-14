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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom missingprop_11c6158bd93dbd27daaa9a84a43404be6ccbf75f900b1e28dfa453e64ea6c96b : (forall x0 x1 x2, nIn x2 x1 -> atleastp x0 x1 -> atleastp (ordsucc x0) (binunion x1 (Sing x2))).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom binunion_Subq_1 : (forall x0 x1, x0 c= binunion x0 x1).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Theorem missingprop_bc4d022a9b4544106a3a19063fe89a5e354086f2ebfc488fcbbe9ad8451a6fad : (forall x0 x1 x2 x3, nIn x2 x1 -> nIn x3 x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> atleastp x0 x1 -> atleastp (ordsucc (ordsucc x0)) (binunion x1 (UPair x2 x3))).
admit.
Qed.
(* Parameter u18 "2ad23cacd85ada648391b1e57574e71fea972c2263aff41d810ca1743540443f" "c52d30b6fcd1a5e24fb5eb74ade252f6f9aeac6121955aa617e586ddb4760173" *)
Parameter u18 : set.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
(* Parameter u4 "7a516cda4555ee314bd599299eac983d7d569296583a629b47918e19d4a0f71f" "66241e5ccfbbd32429c1f14526f03d9d37590fe4ddf66171a76fae8bb5f8b113" *)
Parameter u4 : set.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition DirGraphOutNeighbors : set -> (set -> set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> prop => fun x2 : set => Sep x0 (fun x3 : set => and (x2 = x3 -> (forall x4 : prop, x4)) (x1 x2 x3))).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Axiom missingprop_52137fbb4a2ce93c26a5099f50d500c9abe51677b43046d7cccb609dc3338329 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> (forall x2, x2 :e DirGraphOutNeighbors u18 x0 x1 -> equip (setminus (DirGraphOutNeighbors u18 x0 x2) (Sing x1)) u4))).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom setminus_Subq : (forall x0 x1, setminus x0 x1 c= x0).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom missingprop_426b271b8453605fe796f284fb15405fbff198d07b0c3dc7b8c218dee82a5c65 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> x2 :e DirGraphOutNeighbors x0 x1 x3))).
Axiom missingprop_e153145abdef8d76c5a6e74702cb9d7f11b028f942da54501a84e1d9c7529c05 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> (forall x4, x4 :e DirGraphOutNeighbors x0 x1 x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4))))).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_1 : nat_p 1.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom missingprop_70c71962e8fc1b4ddbda71c37aaca8def65b78d5219f1b88a18baeaefa0b7a55 : (forall x0 x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> atleastp u2 x0)).
Axiom binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
(* Parameter SetAdjoin "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" "1f3a09356e470bff37ef2408148f440357b92f92f9a27c828b37d777eb41ddc6" *)
Parameter SetAdjoin : set -> set -> set.
Axiom missingprop_434e2e2330a02d70f83efc2b51c595946aeb4462c38cf32d55a1757fe463ba11 : (forall x0 x1 x2, forall x3 : set -> prop, x3 x0 -> x3 x1 -> x3 x2 -> (forall x4, x4 :e SetAdjoin (UPair x0 x1) x2 -> x3 x4)).
Axiom missingprop_8a21f6cb5fc1714044127ec01eb34af4a43c7190a9ab55c5830d9c24f7e274f6 : (forall x0 x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> atleastp u3 x0))).
Axiom missingprop_2f981bb386e15ae80933d34ec7d4feaabeedc598a3b07fb73b422d0a88302c67 : (forall x0 x1 x2, x0 :e SetAdjoin (UPair x0 x1) x2).
Axiom missingprop_91640ab91f642c55f5e5a7feb12af7896a6f3419531543b011f7b54a888153d1 : (forall x0 x1 x2, x1 :e SetAdjoin (UPair x0 x1) x2).
Axiom missingprop_ca66642b4e7ed479322d8970220318ddbb0c129adc66c35d9ce66f8223608389 : (forall x0 x1 x2, x2 :e SetAdjoin (UPair x0 x1) x2).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_14e8b1cab6218ae78b591f7980f02116989e69b3919a40df92b352b5ca17bd33 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> (forall x2, x2 :e DirGraphOutNeighbors u18 x0 x1 -> (forall x3, x3 :e Sep (setminus u18 (binunion (DirGraphOutNeighbors u18 x0 x1) (Sing x1))) (fun x4 : set => equip (binintersect (DirGraphOutNeighbors u18 x0 x4) (DirGraphOutNeighbors u18 x0 x1)) u1) -> (forall x4, x4 :e Sep (setminus u18 (binunion (DirGraphOutNeighbors u18 x0 x1) (Sing x1))) (fun x5 : set => equip (binintersect (DirGraphOutNeighbors u18 x0 x5) (DirGraphOutNeighbors u18 x0 x1)) u1) -> x0 x3 x2 -> x0 x4 x2 -> x3 = x4))))).
admit.
Qed.
Axiom nat_2 : nat_p 2.
Axiom Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
Axiom missingprop_fd1aa60075a6cb1ab6854d763e4039860335cee822238478a9df863451c3a626 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> (forall x2, x2 :e u18 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (x0 x1 x2) -> atleastp (binintersect (DirGraphOutNeighbors u18 x0 x1) (DirGraphOutNeighbors u18 x0 x2)) u2))).
Theorem missingprop_9f88c5be3f902e376d020972716dbd54df5ffbbe66a1ccf2cb1cb5dccafc6ff6 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> (forall x2, x2 :e DirGraphOutNeighbors u18 x0 x1 -> (forall x3, x3 :e DirGraphOutNeighbors u18 x0 x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> (forall x4, x4 :e setminus u18 (binunion (DirGraphOutNeighbors u18 x0 x1) (Sing x1)) -> (forall x5, x5 :e setminus u18 (binunion (DirGraphOutNeighbors u18 x0 x1) (Sing x1)) -> x0 x4 x2 -> x0 x5 x2 -> x0 x4 x3 -> x0 x5 x3 -> x4 = x5)))))).
admit.
Qed.
