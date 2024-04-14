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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
(* Parameter u3 "e803b40f939f4fe15fb61b29ded3bee1206757349f3b808c5103467101bdab9a" "1da7b5b024a841d0694168c01df8b0cada113e9c4616f1555b257b978dff46cc" *)
Parameter u3 : set.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition DirGraphOutNeighbors : set -> (set -> set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> prop => fun x2 : set => Sep x0 (fun x3 : set => and (x2 = x3 -> (forall x4 : prop, x4)) (x1 x2 x3))).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom missingprop_426b271b8453605fe796f284fb15405fbff198d07b0c3dc7b8c218dee82a5c65 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> x2 :e DirGraphOutNeighbors x0 x1 x3))).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
(* Parameter SetAdjoin "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" "1f3a09356e470bff37ef2408148f440357b92f92f9a27c828b37d777eb41ddc6" *)
Parameter SetAdjoin : set -> set -> set.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Axiom missingprop_434e2e2330a02d70f83efc2b51c595946aeb4462c38cf32d55a1757fe463ba11 : (forall x0 x1 x2, forall x3 : set -> prop, x3 x0 -> x3 x1 -> x3 x2 -> (forall x4, x4 :e SetAdjoin (UPair x0 x1) x2 -> x3 x4)).
Axiom missingprop_8a21f6cb5fc1714044127ec01eb34af4a43c7190a9ab55c5830d9c24f7e274f6 : (forall x0 x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> atleastp u3 x0))).
Axiom missingprop_2f981bb386e15ae80933d34ec7d4feaabeedc598a3b07fb73b422d0a88302c67 : (forall x0 x1 x2, x0 :e SetAdjoin (UPair x0 x1) x2).
Axiom missingprop_91640ab91f642c55f5e5a7feb12af7896a6f3419531543b011f7b54a888153d1 : (forall x0 x1 x2, x1 :e SetAdjoin (UPair x0 x1) x2).
Axiom missingprop_ca66642b4e7ed479322d8970220318ddbb0c129adc66c35d9ce66f8223608389 : (forall x0 x1 x2, x2 :e SetAdjoin (UPair x0 x1) x2).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_b452704b69c2690d64de292592f2c296c8b3728aed73fd19657b521cd4c80c64 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x9 c= x0 -> x11 c= x0 -> x8 = setminus (DirGraphOutNeighbors x0 x1 x4) (Sing x5) -> x10 = setminus (DirGraphOutNeighbors x0 x1 x5) (Sing x4) -> x9 = Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x4) (Sing x4))) (fun x13 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x13) (DirGraphOutNeighbors x0 x1 x4)) x2) -> x11 = setminus (Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x4) (Sing x4))) (fun x13 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x13) (DirGraphOutNeighbors x0 x1 x4)) x3)) x10 -> (forall x12, x12 :e x9 -> nIn x12 x8) -> (forall x12, x12 :e x9 -> nIn x12 x11) -> (forall x12, x12 :e x8 -> nIn x12 x11) -> x6 :e x9 -> x7 :e x11 -> x1 x6 x7 -> (forall x12 x13 : set -> set, x1 x6 (x12 x6) -> (forall x14, x14 :e x8 -> x13 x14 :e Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x4) (Sing x4))) (fun x15 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x15) (DirGraphOutNeighbors x0 x1 x4)) x2)) -> (forall x14, x14 :e x8 -> x12 (x13 x14) = x14) -> atleastp x3 (Sep (setminus x9 (Sing x6)) (fun x14 : set => x1 (x12 x14) x7))))).
admit.
Qed.
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
Theorem missingprop_afd8bd69905723a8d22916fb686004eb0e153aef160350f3e64111315ba2605b : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 c= x0 -> atleastp u6 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4)))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x9 c= x0 -> x11 c= x0 -> x8 = setminus (DirGraphOutNeighbors x0 x1 x4) (Sing x5) -> x10 = setminus (DirGraphOutNeighbors x0 x1 x5) (Sing x4) -> x9 = Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x4) (Sing x4))) (fun x13 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x13) (DirGraphOutNeighbors x0 x1 x4)) x2) -> x11 = setminus (Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x4) (Sing x4))) (fun x13 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x13) (DirGraphOutNeighbors x0 x1 x4)) x3)) x10 -> (forall x12, x12 :e x9 -> nIn x12 x8) -> (forall x12, x12 :e x9 -> nIn x12 x11) -> (forall x12, x12 :e x8 -> nIn x12 x11) -> x6 :e x9 -> x7 :e x11 -> x1 x6 x7 -> (forall x12 x13 : set -> set, x1 x6 (x12 x6) -> (forall x14, x14 :e x8 -> x13 x14 :e Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x4) (Sing x4))) (fun x15 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x15) (DirGraphOutNeighbors x0 x1 x4)) x2)) -> (forall x14, x14 :e x8 -> x12 (x13 x14) = x14) -> atleastp x3 (Sep (setminus x9 (Sing x6)) (fun x14 : set => x1 (x12 x14) x7))))).
admit.
Qed.
