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
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
(* Parameter u3 "e803b40f939f4fe15fb61b29ded3bee1206757349f3b808c5103467101bdab9a" "1da7b5b024a841d0694168c01df8b0cada113e9c4616f1555b257b978dff46cc" *)
Parameter u3 : set.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition DirGraphOutNeighbors : set -> (set -> set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> prop => fun x2 : set => Sep x0 (fun x3 : set => and (x2 = x3 -> (forall x4 : prop, x4)) (x1 x2 x3))).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Axiom missingprop_2ec38089a92dcd86a75a337a6e999322444786992f1b612acfe1d68011bad142 : (forall x0 x1, x1 c= x0 -> x0 = binunion (setminus x0 x1) x1).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom missingprop_e153145abdef8d76c5a6e74702cb9d7f11b028f942da54501a84e1d9c7529c05 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> (forall x4, x4 :e DirGraphOutNeighbors x0 x1 x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4))))).
Theorem missingprop_891efbf0f888d5ec549c9ff814ca1cdd33d7bb7cafa5c8097e0d5078e789e883 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, nat_p x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4) -> or (equip (binintersect (DirGraphOutNeighbors x0 x1 x3) (DirGraphOutNeighbors x0 x1 x4)) x2) (equip (binintersect (DirGraphOutNeighbors x0 x1 x3) (DirGraphOutNeighbors x0 x1 x4)) (ordsucc x2)))) -> (forall x3 x4, x3 :e x0 -> x4 :e DirGraphOutNeighbors x0 x1 x3 -> (forall x5, x5 :e Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x3) (Sing x3))) (fun x6 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x6) (DirGraphOutNeighbors x0 x1 x3)) x2) -> not (x1 x4 x5)) -> binunion (setminus (DirGraphOutNeighbors x0 x1 x4) (Sing x3)) (setminus (Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x3) (Sing x3))) (fun x6 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x6) (DirGraphOutNeighbors x0 x1 x3)) (ordsucc x2))) (setminus (DirGraphOutNeighbors x0 x1 x4) (Sing x3))) = Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x3) (Sing x3))) (fun x6 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x6) (DirGraphOutNeighbors x0 x1 x3)) (ordsucc x2))))).
admit.
Qed.
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
Theorem missingprop_74300e8630354a9e6b22f56ad1e698128cde1f677fcf36af494b5405a744aa44 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 c= x0 -> atleastp u6 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4)))) -> (forall x2, nat_p x2 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4) -> or (equip (binintersect (DirGraphOutNeighbors x0 x1 x3) (DirGraphOutNeighbors x0 x1 x4)) x2) (equip (binintersect (DirGraphOutNeighbors x0 x1 x3) (DirGraphOutNeighbors x0 x1 x4)) (ordsucc x2)))) -> (forall x3 x4, x3 :e x0 -> x4 :e DirGraphOutNeighbors x0 x1 x3 -> (forall x5, x5 :e Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x3) (Sing x3))) (fun x6 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x6) (DirGraphOutNeighbors x0 x1 x3)) x2) -> not (x1 x4 x5)) -> binunion (setminus (DirGraphOutNeighbors x0 x1 x4) (Sing x3)) (setminus (Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x3) (Sing x3))) (fun x6 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x6) (DirGraphOutNeighbors x0 x1 x3)) (ordsucc x2))) (setminus (DirGraphOutNeighbors x0 x1 x4) (Sing x3))) = Sep (setminus x0 (binunion (DirGraphOutNeighbors x0 x1 x3) (Sing x3))) (fun x6 : set => equip (binintersect (DirGraphOutNeighbors x0 x1 x6) (DirGraphOutNeighbors x0 x1 x3)) (ordsucc x2))))).
admit.
Qed.
