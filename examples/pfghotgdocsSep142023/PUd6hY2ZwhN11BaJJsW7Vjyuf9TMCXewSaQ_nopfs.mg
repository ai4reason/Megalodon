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
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom missingprop_95c6cbd2308b27a7edcd2a1d9389b377988e902d740d05dc7c88e6b8da945ab9 : (forall x0, atleastp 3 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1))) -> x1)).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom PigeonHole_nat : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e ordsucc x0 -> x1 x2 :e x0) -> not (forall x2, x2 :e ordsucc x0 -> (forall x3, x3 :e ordsucc x0 -> x1 x2 = x1 x3 -> x2 = x3)))).
Axiom nat_3 : nat_p 3.
Axiom surj_inv_inj : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> inj x1 x0 (inv x0 x2)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom In_2_3 : 2 :e 3.
Axiom tuple_3_2_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2) x2 -> x3 x2 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2)).
Axiom In_1_3 : 1 :e 3.
Axiom tuple_3_1_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1) x1 -> x3 x1 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1)).
Axiom In_0_3 : 0 :e 3.
Axiom tuple_3_0_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0) x0 -> x3 x0 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0)).
Axiom In_0_4 : 0 :e 4.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Axiom missingprop_7f4cc74286338bdb3dc8d40a5d6e96ae816d0c1e29bc03842b7e31756efa27de : (forall x0, x0 c= Power 3 -> (forall x1, x1 c= Power 3 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e 3) (forall x6 : prop, (forall x7, and (x7 :e 3) (and (and (x5 = x7 -> (forall x8 : prop, x8)) (x5 :e x2 = x5 :e x3)) (x7 :e x2 = x7 :e x3)) -> x6) -> x6) -> x4) -> x4))) -> (forall x2 : prop, (atleastp x0 1 -> x2) -> (atleastp x1 1 -> x2) -> (equip 2 x0 -> equip 2 x1 -> x2) -> x2))).
Axiom missingprop_7f444f6cc2b3e8fcea6dd2732c041a0e6b190d56d44fec793c589d5fd75a4590 : (forall x0 x1, (forall x2, x2 :e x0 -> nIn x2 x1) -> atleastp 6 (binunion x0 x1) -> atleastp x0 1 -> atleastp x1 (Power 2) -> False).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_5 : nat_p 5.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Axiom missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_51bec2d8eaf1a80be21b9c627f1350028311d7a37b5fc9ca1e29924c42861ed2 : equip 4 (setsum 2 2).
Axiom nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
Axiom In_4_5 : 4 :e 5.
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom missingprop_1f3f366e14c73ec48a422efa1703953039e0b4a1e969c23730d9245db2f327d4 : (forall x0 x1, x1 c= Power (ordsucc x0) -> (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> (forall x4 : prop, (forall x5, and (x5 :e ordsucc x0) (x5 :e x2 = x5 :e x3) -> x4) -> x4))) -> atleastp x1 (Power x0)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Theorem not_TwoRamseyProp_atleast_3_6_Power_4 : not (TwoRamseyProp_atleastp 3 6 (Power 4)).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Theorem missingprop_47c913063b1e4fc5bce3cf3efeba2defffa6033adca73022bfae689ed61125de : not (TwoRamseyProp 3 6 (Power 4)).
admit.
Qed.
Axiom nat_7 : nat_p 7.
Axiom In_6_7 : 6 :e 7.
Theorem missingprop_0b06fe661bcabe7206ab480d053c9a118dc0d4ee32a3c0c6c5348fcca50dc926 : not (TwoRamseyProp 3 7 (Power 4)).
admit.
Qed.
Axiom nat_8 : nat_p 8.
Axiom In_6_8 : 6 :e 8.
Theorem missingprop_7c4c3c41a338314b7ec1fd1f62a9602d0d2926ec172243cf6e4c45ce30191a0a : not (TwoRamseyProp 3 8 (Power 4)).
admit.
Qed.
Axiom nat_9 : nat_p 9.
Axiom In_6_9 : 6 :e 9.
Theorem missingprop_a44fd93c3a7af381df06edbe7b673b8904ff55629d4af6ee3134e29617e2dc2a : not (TwoRamseyProp 3 9 (Power 4)).
admit.
Qed.
Axiom nat_10 : nat_p 10.
Axiom missingprop_fd78d9827713c0f7b71247ad97a24b91bc3ec9128c1ed685c74b49de36aa650c : 6 :e 10.
Theorem missingprop_c502247406c83d3dd236c471de0e0633dc617b03a7871e8ec10a50e354027940 : not (TwoRamseyProp 3 10 (Power 4)).
admit.
Qed.
Axiom nat_4 : nat_p 4.
Axiom In_3_4 : 3 :e 4.
Theorem missingprop_277385155346a4bc633fe5b8391d50ff96ebe1b0bd16f65327fc63db75f24b6c : not (TwoRamseyProp 4 6 (Power 4)).
admit.
Qed.
Theorem missingprop_d0d0d19caeec7ab451c67616456cce2d6c9f7be9893f8b7062f4ece250e433df : not (TwoRamseyProp 4 7 (Power 4)).
admit.
Qed.
Theorem missingprop_219cd9e9ae15be58af11f76b22218f6f910be27cfef2e0b8e92b2b26abb01a58 : not (TwoRamseyProp 4 8 (Power 4)).
admit.
Qed.
Theorem missingprop_6302145d7575133a85279937634c49851399d2c5e77b31d2e52f64c466ec37f4 : not (TwoRamseyProp 4 9 (Power 4)).
admit.
Qed.
Axiom In_3_5 : 3 :e 5.
Theorem missingprop_5bd1079b775c7d4040b92e5148afc779efe6245ec71d88d08724a0e19224415d : not (TwoRamseyProp 5 6 (Power 4)).
admit.
Qed.
Theorem missingprop_9229f611e06c05b6b1879d05235a731becf0fc23c9cefc69c65af92da9cd4eae : not (TwoRamseyProp 5 7 (Power 4)).
admit.
Qed.
Theorem missingprop_3b8817afe1fed5ea5f0f8fa76123cb273b2eecc5e17709aa02782ffb86f0adc7 : not (TwoRamseyProp 5 8 (Power 4)).
admit.
Qed.
Axiom nat_6 : nat_p 6.
Axiom In_3_6 : 3 :e 6.
Theorem missingprop_1e8eab9e01e2e768f2352fc2034a6fb374eca3aa03e3e4baeee124da4295d4bf : not (TwoRamseyProp 6 6 (Power 4)).
admit.
Qed.
Theorem missingprop_045e6fd8f8f3d513192f90e2ef662d7a322f7854d64fbb0415b959094ebbc5a8 : not (TwoRamseyProp 6 7 (Power 4)).
admit.
Qed.
