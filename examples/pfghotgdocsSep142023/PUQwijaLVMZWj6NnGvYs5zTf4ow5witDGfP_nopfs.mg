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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition DirGraphOutNeighbors : set -> (set -> set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> prop => fun x2 : set => Sep x0 (fun x3 : set => and (x2 = x3 -> (forall x4 : prop, x4)) (x1 x2 x3))).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom FalseE : False -> (forall x0 : prop, x0).
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_0 : nat_p 0.
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom nat_1 : nat_p 1.
Axiom equip_ref : (forall x0, equip x0 x0).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_8fed54475e70b18fbe9db03f1a81cd38ab9b210f0bea8d2bb706323c288b83da : (forall x0 x1 x2 x3, equip x0 x2 -> equip x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> equip (binunion x0 x1) (setsum x2 x3)).
Axiom missingprop_be1ab2772f2343e1b7afd526582f606d68258ba3f0b6521a351e0ecb8bf3c52e : (forall x0, equip (Sing x0) u1).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
Axiom binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom missingprop_426b271b8453605fe796f284fb15405fbff198d07b0c3dc7b8c218dee82a5c65 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> x2 :e DirGraphOutNeighbors x0 x1 x3))).
Axiom missingprop_158329ee42f538f9f45353e081644457b58bf58b995713ab00dcbc514147ba46 : (forall x0 x1, x1 :e x0 -> Sing x1 c= x0).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Theorem missingprop_3ca76274172fb59f40aef50f83f94f64953f737dc335b5dc8429884c78fe3f58 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2 x3, nat_p x2 -> (forall x4 x5, x5 :e DirGraphOutNeighbors x0 x1 x4 -> (forall x6 x7 x8, x6 c= x0 -> x7 c= x0 -> x8 c= x0 -> x7 = setminus (DirGraphOutNeighbors x0 x1 x5) (Sing x4) -> x8 = setminus (Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x4) (Sing x4))) (fun x10 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x4)) x3)) x7 -> equip x6 x2 -> (forall x9, x9 :e x6 -> x9 = x5 -> (forall x10 : prop, x10)) -> (forall x9, x9 :e x6 -> nIn x9 x7) -> (forall x9, x9 :e x6 -> nIn x9 x8) -> (forall x9, x9 :e x6 -> nIn x9 (DirGraphOutNeighbors x0 x1 x4)) -> (forall x9, x9 :e x6 -> nIn x9 (DirGraphOutNeighbors x0 x1 x5)) -> (forall x9, x9 :e x6 -> (forall x10, x10 :e x6 -> (x9 = x10 -> (forall x11 : prop, x11)) -> (forall x11, x11 :e binintersect (DirGraphOutNeighbors x0 x1 x9) (DirGraphOutNeighbors x0 x1 x10) -> x11 :e x6))) -> (forall x9 : set -> set, (forall x10, x10 :e x6 -> x9 x10 :e x7) -> (forall x10, x10 :e x6 -> x1 x10 (x9 x10)) -> (forall x10, x10 :e x7 -> (forall x11 : prop, (forall x12, and (x12 :e x6) (x9 x12 = x10) -> x11) -> x11)) -> (forall x10, x10 :e x8 -> or (equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x5)) u1) (equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x5)) x3)) -> equip (Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x5) (Sing x5))) (fun x10 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x5)) u1)) x2 -> x8 c= Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x5) (Sing x5))) (fun x10 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x5)) x3)))))).
admit.
Qed.
(* Parameter u3 "e803b40f939f4fe15fb61b29ded3bee1206757349f3b808c5103467101bdab9a" "1da7b5b024a841d0694168c01df8b0cada113e9c4616f1555b257b978dff46cc" *)
Parameter u3 : set.
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
Theorem missingprop_738c4085d60e652c35248313aaf7c1ebb3af119f21f6640867b03caad5cb512e : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 c= x0 -> atleastp u6 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4)))) -> (forall x2 x3, nat_p x2 -> (forall x4 x5, x5 :e DirGraphOutNeighbors x0 x1 x4 -> (forall x6 x7 x8, x6 c= x0 -> x7 c= x0 -> x8 c= x0 -> x7 = setminus (DirGraphOutNeighbors x0 x1 x5) (Sing x4) -> x8 = setminus (Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x4) (Sing x4))) (fun x10 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x4)) x3)) x7 -> equip x6 x2 -> (forall x9, x9 :e x6 -> x9 = x5 -> (forall x10 : prop, x10)) -> (forall x9, x9 :e x6 -> nIn x9 x7) -> (forall x9, x9 :e x6 -> nIn x9 x8) -> (forall x9, x9 :e x6 -> nIn x9 (DirGraphOutNeighbors x0 x1 x4)) -> (forall x9, x9 :e x6 -> nIn x9 (DirGraphOutNeighbors x0 x1 x5)) -> (forall x9, x9 :e x6 -> (forall x10, x10 :e x6 -> (x9 = x10 -> (forall x11 : prop, x11)) -> (forall x11, x11 :e binintersect (DirGraphOutNeighbors x0 x1 x9) (DirGraphOutNeighbors x0 x1 x10) -> x11 :e x6))) -> (forall x9 : set -> set, (forall x10, x10 :e x6 -> x9 x10 :e x7) -> (forall x10, x10 :e x6 -> x1 x10 (x9 x10)) -> (forall x10, x10 :e x7 -> (forall x11 : prop, (forall x12, and (x12 :e x6) (x9 x12 = x10) -> x11) -> x11)) -> (forall x10, x10 :e x8 -> or (equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x5)) u1) (equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x5)) x3)) -> equip (Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x5) (Sing x5))) (fun x10 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x5)) u1)) x2 -> x8 c= Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x5) (Sing x5))) (fun x10 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x10) (DirGraphOutNeighbors x0 x1 x5)) x3)))))).
admit.
Qed.
