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
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom In_0_1 : 0 :e 1.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Theorem not_TransSet_Sing_tagn : (forall x0, nat_p x0 -> 1 :e x0 -> not (TransSet (Sing x0))).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Theorem not_ordinal_Sing_tagn : (forall x0, nat_p x0 -> 1 :e x0 -> not (ordinal (Sing x0))).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Theorem missingprop_b040cfab3ba6ec1b3c19f31a88b1921bdc8dd61135c4cd923e1212599f8218e3 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1, not (ordinal (SetAdjoin x1 (Sing x0))))).
admit.
Qed.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Theorem missingprop_ffc171453ac798e185a4c4fc0de7bb85ce44d8ec72157829e9ddfc0f80032171 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2, ordinal x1 -> nIn (SetAdjoin x2 (Sing x0)) x1)).
admit.
Qed.
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem missingprop_e948d7c5fa1375f6d519e47d896028dd041b0af5587408f5c508216bbae8d46d : (forall x0, nat_p x0 -> 1 :e x0 -> nIn (Sing x0) (Sing (Sing 1))).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Definition SNoElts_ : set -> set :=
 (fun x0 : set => binunion x0 {SetAdjoin x1 (Sing 1) | x1 :e x0}).
(* Parameter exactly1of2 "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" "163602f90de012a7426ee39176523ca58bc964ccde619b652cb448bd678f7e21" *)
Parameter exactly1of2 : prop -> prop -> prop.
Definition SNo_ : set -> set -> prop :=
 (fun x0 x1 : set => and (x1 c= SNoElts_ x0) (forall x2, x2 :e x0 -> exactly1of2 (SetAdjoin x2 (Sing 1) :e x1) (x2 :e x1))).
Axiom SNoLev_prop : (forall x0, SNo x0 -> and (ordinal (SNoLev x0)) (SNo_ (SNoLev x0) x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem missingprop_b77e4d13156bc801da7c50d615690a07853273eb1e278cd0903fec4370f9e4e2 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2, SNo x1 -> nIn (SetAdjoin x2 (Sing x0)) x1)).
admit.
Qed.
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Theorem missingprop_63f7c049c04cf6dd8522f23c2ad60bce02e050a2c7835473668a67ed6b19a82c : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2, SNo x1 -> SNo x2 -> (forall x3, x3 :e x1 -> (forall x4, x4 :e x2 -> SetAdjoin x3 (Sing x0) = SetAdjoin x4 (Sing x0) -> x3 c= x4)))).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem missingprop_69efd4cfe2ea5d2354a44349c7af8c918734fcc831898cfc8069b10f87ccbafa : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2, SNo x1 -> SNo x2 -> (forall x3, x3 :e x1 -> (forall x4, x4 :e x2 -> SetAdjoin x3 (Sing x0) = SetAdjoin x4 (Sing x0) -> x3 = x4)))).
admit.
Qed.
Definition missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => binunion x1 {SetAdjoin x3 (Sing x0) | x3 :e x2}).
Theorem missingprop_4ebeaacb2851d9e41983779fbd58bfe17be5bb7c82e66aadde72a4733a455603 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2 x3 x4, SNo x1 -> missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x1 x2 = missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x3 x4 -> x1 c= x3)).
admit.
Qed.
Theorem missingprop_92b7514ef3d0f5b6f05d43c13e9c99120ec6f325219c0abcbb2506a32700bb9b : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2 x3 x4, SNo x1 -> SNo x3 -> missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x1 x2 = missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x3 x4 -> x1 = x3)).
admit.
Qed.
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem missingprop_78da5370b3190c65447d48ceafc97cfa2d590a8a3a8a14af4f82f908ac321b60 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2 x3 x4, SNo x2 -> SNo x3 -> SNo x4 -> missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x1 x2 = missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x3 x4 -> x2 c= x4)).
admit.
Qed.
Theorem missingprop_e437aaea55c2f358fd4d76995270bb29fe4f5671fbd6d05625ee39a54f4508ed : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2 x3 x4, SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x1 x2 = missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x3 x4 -> x2 = x4)).
admit.
Qed.
Axiom Repl_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (Repl 0 x0) 0 -> x1 0 (Repl 0 x0)).
Axiom binunion_idr : (forall x0, forall x1 : set -> set -> prop, x1 (binunion x0 0) x0 -> x1 x0 (binunion x0 0)).
Theorem missingprop_018990654898ba9e35fc100e42fefe93263d7ad1c440c4b21e7158930dddc512 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x1 0) x1 -> x2 x1 (missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be x0 x1 0))).
admit.
Qed.
Definition missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb : set -> set -> set :=
 missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be 2.
Axiom nat_2 : nat_p 2.
Axiom In_1_2 : 1 :e 2.
Theorem missingprop_872273e895264b163d3a3b042c5d1abf262e26919401a643ccce2dcdcb6a14ef : (forall x0, forall x1 : set -> set -> prop, x1 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 0) x0 -> x1 x0 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 0)).
admit.
Qed.
Theorem missingprop_91df53020fea6a9ff4cc6802b4e01884637366fdcf8bc35cea3e79e3c777050d : (forall x0 x1 x2 x3, SNo x0 -> SNo x2 -> missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x3 -> x0 = x2).
admit.
Qed.
Theorem missingprop_099a43452f71b99572a0fc9274d07254641d0dd9bc5a2bb9941dc1314f377a3f : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x3 -> x1 = x3).
admit.
Qed.
Definition missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (SNo x2) (forall x3 : prop, (forall x4, and (SNo x4) (x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x4) -> x3) -> x3) -> x1) -> x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_942959aad6790cf3a71a2f8f2b9ffc552b42fb28a7f163a4f5e7e7842fdbd934 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1)).
admit.
Qed.
Theorem missingprop_e73e07ecfeb5f0c05c137b34b758a03a6c1a818d92f2bc592020af36f35702e2 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> (forall x1 : set -> prop, (forall x2 x3, SNo x2 -> SNo x3 -> x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x3 -> x1 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x3)) -> x1 x0)).
admit.
Qed.
Axiom SNo_0 : SNo 0.
Theorem missingprop_d5b3979eda0b2ffa5796e15ffae00de7d64c34c0b372e55d71aaaed66e4f9845 : (forall x0, SNo x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0).
admit.
Qed.
Theorem Sing_inj : (forall x0 x1, Sing x0 = Sing x1 -> x0 = x1).
admit.
Qed.
Definition missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x1 -> (forall x3 : prop, (forall x4, and (SNo x4) (or (x2 :e x4) (forall x5 : prop, (forall x6, and (x6 :e x4) (forall x7 : prop, (forall x8, and (x8 :e x0) (and (1 :e x8) (x2 = SetAdjoin x6 (Sing x8))) -> x7) -> x7) -> x5) -> x5)) -> x3) -> x3)).
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Theorem missingprop_6287073a7195e79c52abdc1556efdae70a83304a479aee56c6dfadb3bbee4870 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1, (x0 = x1 -> (forall x2 : prop, x2)) -> (forall x2 x3 x4, SNo x3 -> x4 :e x3 -> SetAdjoin x2 (Sing x0) = SetAdjoin x4 (Sing x1) -> (forall x5 : prop, x5)))).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_ddfc870a0f67dd8bf5406d70b56c890bf0a0c8baf75fc04a131d801e13a59627 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2, missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 x0 x1 -> SNo x2 -> missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 (ordsucc x0) (binunion x1 {SetAdjoin x3 (Sing x0) | x3 :e x2}))).
admit.
Qed.
Theorem missingprop_93892cbce277566e8cc1efdde5180cb4698c4865b713b4e41b7f3e1218e2f0cf : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2 x3 x4, missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 x0 x1 -> binunion x1 {SetAdjoin x6 (Sing x0) | x6 :e x3} = binunion x2 {SetAdjoin x6 (Sing x0) | x6 :e x4} -> x1 c= x2)).
admit.
Qed.
Theorem missingprop_51bcfb81b3dbbea1e1fae277f714ba4cf628952e82df65fecaaeb1c81602a38b : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2 x3 x4, missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 x0 x1 -> missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 x0 x2 -> binunion x1 {SetAdjoin x6 (Sing x0) | x6 :e x3} = binunion x2 {SetAdjoin x6 (Sing x0) | x6 :e x4} -> x1 = x2)).
admit.
Qed.
Theorem missingprop_a97133940ac2c1ce9f083f5e9e39454f8b1e260e2b08e635a6abc9c31862ea27 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2 x3 x4, missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 x0 x2 -> SNo x3 -> SNo x4 -> binunion x1 {SetAdjoin x6 (Sing x0) | x6 :e x3} = binunion x2 {SetAdjoin x6 (Sing x0) | x6 :e x4} -> x3 c= x4)).
admit.
Qed.
Theorem missingprop_2813bbc264ba76c59b7f17aa546b4f6f8aeefd89625c13ba0e93156d0c5da027 : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1 x2 x3 x4, missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 x0 x1 -> missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 x0 x2 -> SNo x3 -> SNo x4 -> binunion x1 {SetAdjoin x6 (Sing x0) | x6 :e x3} = binunion x2 {SetAdjoin x6 (Sing x0) | x6 :e x4} -> x3 = x4)).
admit.
Qed.
Theorem missingprop_a4edcbab661199d6911d1441c90756c844d60baa5bb17d517bccec0c64f7803b : (forall x0 x1, SNo x0 -> missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 x1 x0).
admit.
Qed.
Theorem missingprop_d70cc86669636f09f3d7916eef547e3c121ef7467f1e4baa7bd1bb2d082b0fbe : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 3 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1)).
admit.
Qed.
Definition missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 : set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 : set => binunion (binunion (binunion x0 {SetAdjoin x4 (Sing 2) | x4 :e x1}) {SetAdjoin x4 (Sing 3) | x4 :e x2}) {SetAdjoin x4 (Sing 4) | x4 :e x3}).
Axiom nat_4 : nat_p 4.
Axiom In_1_4 : 1 :e 4.
Axiom nat_3 : nat_p 3.
Axiom In_1_3 : 1 :e 3.
Theorem missingprop_0baa02f7150c0866934da98d7084f1221a506b850ca6a82af7a78033da3423bf : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 5 (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3)).
admit.
Qed.
Theorem missingprop_3a6161768bf91e61fa892c8d38b180efc695d0a755ac90625538c413d2215048 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x4 -> SNo x5 -> SNo x6 -> missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x4 x5 x6 x7 -> x0 = x4).
admit.
Qed.
Theorem missingprop_a3a33ccb0071c2878f92a1cae7afeb2b106a5eb10ab63f1d0d9582d703abc2a9 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x4 x5 x6 x7 -> x1 = x5).
admit.
Qed.
Theorem missingprop_99f23fd81225bd29ee42dc62a4d6e5b57a541a40a9b9a933a59c939aaf96ffc9 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x4 x5 x6 x7 -> x2 = x6).
admit.
Qed.
Theorem missingprop_103a081e403793937d3065fae3fde1756efbefb7dcc44a50b4b18345b916d030 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x4 x5 x6 x7 -> x3 = x7).
admit.
Qed.
Definition missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (SNo x2) (forall x3 : prop, (forall x4, and (SNo x4) (forall x5 : prop, (forall x6, and (SNo x6) (forall x7 : prop, (forall x8, and (SNo x8) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x2 x4 x6 x8) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1).
Theorem missingprop_5211365bd8f9bc32132c7d18ef8b1eeb82945bf78b11eab7df690b661bcac67c : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 0) (binunion (binunion x0 {SetAdjoin x4 (Sing 2) | x4 :e x1}) {SetAdjoin x4 (Sing 3) | x4 :e x2}) -> x3 (binunion (binunion x0 {SetAdjoin x4 (Sing 2) | x4 :e x1}) {SetAdjoin x4 (Sing 3) | x4 :e x2}) (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 0)).
admit.
Qed.
Theorem missingprop_af847e040e91b99dbf77a9d137cb8611c75d491ea2b42e1ae03082b87361b50c : (forall x0 x1, forall x2 : set -> set -> prop, x2 (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 0 0) (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) -> x2 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 0 0)).
admit.
Qed.
Theorem missingprop_37eff17632f0129128fb8745847268813a293c6305c6184a275949fd4ba3aeff : (forall x0, forall x1 : set -> set -> prop, x1 (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 0 0 0) x0 -> x1 x0 (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 0 0 0)).
admit.
Qed.
Theorem missingprop_d8169bca45bf6dc61a9b68b14bd212f924210a50c0badd0d068adc296c1821a3 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0).
admit.
Qed.
Definition missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 : set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 x4 x5 x6 x7 : set => binunion (binunion (binunion (binunion (binunion (binunion (binunion x0 {SetAdjoin x8 (Sing 2) | x8 :e x1}) {SetAdjoin x8 (Sing 3) | x8 :e x2}) {SetAdjoin x8 (Sing 4) | x8 :e x3}) {SetAdjoin x8 (Sing 5) | x8 :e x4}) {SetAdjoin x8 (Sing 6) | x8 :e x5}) {SetAdjoin x8 (Sing 7) | x8 :e x6}) {SetAdjoin x8 (Sing 8) | x8 :e x7}).
Axiom nat_8 : nat_p 8.
Axiom In_1_8 : 1 :e 8.
Axiom nat_7 : nat_p 7.
Axiom In_1_7 : 1 :e 7.
Axiom nat_6 : nat_p 6.
Axiom In_1_6 : 1 :e 6.
Axiom nat_5 : nat_p 5.
Axiom In_1_5 : 1 :e 5.
Theorem missingprop_5e03601a45a8e457d0bebaaeb1ad4162517f3c4605bc5c20003bdea7ac0acdf1 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> missingname_9e9ecccc3ef3aca5e3a28d0a85fa3345cd79328531b15aaa520a2aee35b8c8a0 9 (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7)).
admit.
Qed.
Theorem missingprop_7ba3f92f967e123967e629b72d5daf9552c85c622ce99c5b8b29b04c0d507df0 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x8 x9 x10 x11 x12 x13 x14 x15 -> x0 = x8).
admit.
Qed.
Theorem missingprop_1f1147660c57857036a262d845483c11859bd708baf27dc152f7376c9dfded15 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x8 x9 x10 x11 x12 x13 x14 x15 -> x1 = x9).
admit.
Qed.
Theorem missingprop_b7917276b742ff97397778dfa6c7f2fcdd64ea8b17b3babe1be43cf44c30135e : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x8 x9 x10 x11 x12 x13 x14 x15 -> x2 = x10).
admit.
Qed.
Theorem missingprop_cabc2c75f97525fec06157ea7341d9138985bf2890effe8cf5379115c661126e : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x8 x9 x10 x11 x12 x13 x14 x15 -> x3 = x11).
admit.
Qed.
Theorem missingprop_c0469169faa1732b66ca70e1c7312df7db4cf3c6742238fecf4ec797b1e8e6cc : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x8 x9 x10 x11 x12 x13 x14 x15 -> x4 = x12).
admit.
Qed.
Theorem missingprop_dadfc48f49557ad184cca2f33ccac3d4e8fadaf9dc3455018d39bcf3ef7b30b0 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x8 x9 x10 x11 x12 x13 x14 x15 -> x5 = x13).
admit.
Qed.
Theorem missingprop_b3af6432820d4bfafee558c98b417c8ba75d83cb8ac2eb176e7ebbb6b46721f3 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x8 x9 x10 x11 x12 x13 x14 x15 -> x6 = x14).
admit.
Qed.
Theorem missingprop_ada651b8d048492b4d5d15fa65dbce7fac6cde86c978389d3dba37ffb1d94499 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> SNo x10 -> SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> SNo x15 -> missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x8 x9 x10 x11 x12 x13 x14 x15 -> x7 = x15).
admit.
Qed.
Definition missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (SNo x2) (forall x3 : prop, (forall x4, and (SNo x4) (forall x5 : prop, (forall x6, and (SNo x6) (forall x7 : prop, (forall x8, and (SNo x8) (forall x9 : prop, (forall x10, and (SNo x10) (forall x11 : prop, (forall x12, and (SNo x12) (forall x13 : prop, (forall x14, and (SNo x14) (forall x15 : prop, (forall x16, and (SNo x16) (x0 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x2 x4 x6 x8 x10 x12 x14 x16) -> x15) -> x15) -> x13) -> x13) -> x11) -> x11) -> x9) -> x9) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1).
Theorem missingprop_6e19704af9ad5218d3a56ceb94eb0641aa006b64f12b9d9f42f28f674bc7fda5 : (forall x0 x1 x2 x3 x4 x5 x6, forall x7 : set -> set -> prop, x7 (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 0) (binunion (binunion (binunion (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) {SetAdjoin x8 (Sing 5) | x8 :e x4}) {SetAdjoin x8 (Sing 6) | x8 :e x5}) {SetAdjoin x8 (Sing 7) | x8 :e x6}) -> x7 (binunion (binunion (binunion (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) {SetAdjoin x8 (Sing 5) | x8 :e x4}) {SetAdjoin x8 (Sing 6) | x8 :e x5}) {SetAdjoin x8 (Sing 7) | x8 :e x6}) (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 0)).
admit.
Qed.
Theorem missingprop_032e0e1ca2b6a6dec28f9022c0ab2a1eaf6a350eb9ef1a90bdd9222c65da37a1 : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 0 0) (binunion (binunion (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) {SetAdjoin x7 (Sing 5) | x7 :e x4}) {SetAdjoin x7 (Sing 6) | x7 :e x5}) -> x6 (binunion (binunion (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) {SetAdjoin x7 (Sing 5) | x7 :e x4}) {SetAdjoin x7 (Sing 6) | x7 :e x5}) (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 0 0)).
admit.
Qed.
Theorem missingprop_99075cb60dd6ee1ecde84daf9e64c3f2c524bf0d235a5b34e6bf4c80b29f7ce1 : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 0 0 0) (binunion (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) {SetAdjoin x6 (Sing 5) | x6 :e x4}) -> x5 (binunion (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) {SetAdjoin x6 (Sing 5) | x6 :e x4}) (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 0 0 0)).
admit.
Qed.
Theorem missingprop_a6706530c540e85386f94949b855c1ccc1a599c293e85488e019abc3d78728f6 : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 0 0 0 0) (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) -> x4 (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 0 0 0 0)).
admit.
Qed.
Theorem missingprop_384c004bd98fa57070cfb75e7b526aff6bb4d00d6f4e33aef2f115afc4f16757 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 x0).
admit.
Qed.
