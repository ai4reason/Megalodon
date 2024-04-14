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
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Theorem missingprop_2f981bb386e15ae80933d34ec7d4feaabeedc598a3b07fb73b422d0a88302c67 : (forall x0 x1 x2, x0 :e SetAdjoin (UPair x0 x1) x2).
admit.
Qed.
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Theorem missingprop_91640ab91f642c55f5e5a7feb12af7896a6f3419531543b011f7b54a888153d1 : (forall x0 x1 x2, x1 :e SetAdjoin (UPair x0 x1) x2).
admit.
Qed.
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Theorem missingprop_ca66642b4e7ed479322d8970220318ddbb0c129adc66c35d9ce66f8223608389 : (forall x0 x1 x2, x2 :e SetAdjoin (UPair x0 x1) x2).
admit.
Qed.
Theorem missingprop_a83b0f00b7010506012eac50a37acf9397f188fab2e100b8a543b795c63cc457 : (forall x0 x1 x2 x3, x0 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3).
admit.
Qed.
Theorem missingprop_4d1134395428f655c70060d89bfb8558ccadeb21955f223d5ca8f7e2fc67148c : (forall x0 x1 x2 x3, x1 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3).
admit.
Qed.
Theorem missingprop_e4760fc821f351cd9b641f80133df8c2736e77957d5436be4e26fe6dae8c4afe : (forall x0 x1 x2 x3, x2 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3).
admit.
Qed.
Theorem missingprop_7b54ca399582282a7040a71f9c2f008cb6ef4ffaa1dd688f4883cd33f8f6980b : (forall x0 x1 x2 x3, x3 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3).
admit.
Qed.
Theorem missingprop_56452fe06aca82d310983388ec25d56a97f31b883325980403ff02c27aa4e5f6 : (forall x0 x1 x2 x3 x4, x0 :e SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4).
admit.
Qed.
Theorem missingprop_37836b27b574a67d32401b0394ff2628cc90885173690a3264ef8f6507324875 : (forall x0 x1 x2 x3 x4, x1 :e SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4).
admit.
Qed.
Theorem missingprop_d01b6855d365ef88e4dec58ef26d87a9fb41a039e0ffb88e5b1374db5dfc773b : (forall x0 x1 x2 x3 x4, x2 :e SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4).
admit.
Qed.
Theorem missingprop_bce292dbf3466a71711d948e5a5b744a6432721deb4655ed1a8e9dc5653d01b1 : (forall x0 x1 x2 x3 x4, x3 :e SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4).
admit.
Qed.
Theorem missingprop_605d24fd0c5bddbb45a0eccdc7c091ba8aff9e8a65a669ce7a97e512941381d0 : (forall x0 x1 x2 x3 x4, x4 :e SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4).
admit.
Qed.
Theorem missingprop_026a02ec2a61d9b71e75f37f5c8c8ef312184a8db8726e8eb929b169123db6f2 : (forall x0 x1 x2 x3 x4 x5, x0 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5).
admit.
Qed.
Theorem missingprop_d258939fca8170e3a72bf9cd5e0b20edbb9d2c4412e127ee3c0fe1200f474e40 : (forall x0 x1 x2 x3 x4 x5, x1 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5).
admit.
Qed.
Theorem missingprop_ec4e2abc9cf562cc3a29c133a51f603e0a95b9c0ea4f70badd479b4140f14cee : (forall x0 x1 x2 x3 x4 x5, x2 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5).
admit.
Qed.
Theorem missingprop_4c9ce2265a3c88a79320b78c2bd76666f05104f8504fede4636f477f2bfa61d4 : (forall x0 x1 x2 x3 x4 x5, x3 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5).
admit.
Qed.
Theorem missingprop_9b05c123e5ddbc9a0b6618a1997bf97c56724b746cea289e91183f1c16ba5bae : (forall x0 x1 x2 x3 x4 x5, x4 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5).
admit.
Qed.
Theorem missingprop_d5a2b128c5d90052733eb2b6c0d1971691037e7bc096e6812286444e04f288d6 : (forall x0 x1 x2 x3 x4 x5, x5 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5).
admit.
Qed.
Theorem missingprop_14d99d04129bb273651a13119bdbb7abe88b093f7bf83d1f2352290f54627605 : (forall x0 x1 x2 x3 x4 x5 x6, x0 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6).
admit.
Qed.
Theorem missingprop_ab9085d4cabc327c6045fb1e301646da37dc1106adefcc4a4d69416103af9202 : (forall x0 x1 x2 x3 x4 x5 x6, x1 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6).
admit.
Qed.
Theorem missingprop_26e35aabe8fb5a836662ab61fb1a68d9f1a5d86e9a71f89c0c6714eb45cf82e2 : (forall x0 x1 x2 x3 x4 x5 x6, x2 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6).
admit.
Qed.
Theorem missingprop_112e6c2ab33e7c8c61bca6ba8bf87bae0bc48d917ef6e8e23fa510cff300164c : (forall x0 x1 x2 x3 x4 x5 x6, x3 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6).
admit.
Qed.
Theorem missingprop_d522a88c276679b9e7e7d037dbb0e0fa38149933978e4ab7e4bd0535c24a424b : (forall x0 x1 x2 x3 x4 x5 x6, x4 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6).
admit.
Qed.
Theorem missingprop_3563753988718bdfce9ec92f2631996c7a36402b667f9103553c1622e0ddcce2 : (forall x0 x1 x2 x3 x4 x5 x6, x5 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6).
admit.
Qed.
Theorem missingprop_36e2b4b1ba0e5d32476d3ddbeb055229d423c310a3d08dd69f7040171e800526 : (forall x0 x1 x2 x3 x4 x5 x6, x6 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6).
admit.
Qed.
Theorem missingprop_a885d411ffab1d414e1ed2e1aba3135ef6c07f33a54a7b6c03820010137fd68d : (forall x0 x1 x2 x3 x4 x5 x6 x7, x0 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) x7).
admit.
Qed.
Theorem missingprop_a69ec2778a555864968bc85c5440ed9af34f018d1bb1727e7c61dcf8d2851ebd : (forall x0 x1 x2 x3 x4 x5 x6 x7, x1 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) x7).
admit.
Qed.
Theorem missingprop_d80fcc781bc5763b8151a3105ded8b14e53976c441f0cb4677956510fc385660 : (forall x0 x1 x2 x3 x4 x5 x6 x7, x2 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) x7).
admit.
Qed.
Theorem missingprop_4510384353334358d2e9e6ff6384d29365a768daae7f5e7f7d15266030a5dac6 : (forall x0 x1 x2 x3 x4 x5 x6 x7, x3 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) x7).
admit.
Qed.
Theorem missingprop_a4a21c9d6635b3c2055854ef5206dc568aab8b50c28a91cf5e0bd2c7497104e6 : (forall x0 x1 x2 x3 x4 x5 x6 x7, x4 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) x7).
admit.
Qed.
Theorem missingprop_ee497ff586b2e918fe584165e6640bc481a8df83d5a27444947cdbd309bbe6d5 : (forall x0 x1 x2 x3 x4 x5 x6 x7, x5 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) x7).
admit.
Qed.
Theorem missingprop_eabd74eb28422c13a2f96138c893c532a9183919c70544f02451a25fa72ece2a : (forall x0 x1 x2 x3 x4 x5 x6 x7, x6 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) x7).
admit.
Qed.
Theorem missingprop_b88df72c1a9851517d5b92f7b21ba7d858f03393de391921d79ba898efe900da : (forall x0 x1 x2 x3 x4 x5 x6 x7, x7 :e SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) x7).
admit.
Qed.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
Axiom setminus_Subq : (forall x0 x1, setminus x0 x1 c= x0).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem missingprop_8805a75f81012de0423e9173532fc074fb73b80e451597fde52287a4721fb204 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> atleastp (binunion x0 x1) (setsum x2 x3)).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Axiom missingprop_4b1a7ff1f1af5eade46b5657f25a1ce39a3af58e2fba0b757867e511fb9aacae : (forall x0 x1, forall x2 : set -> set -> prop, x2 (UPair x0 x1) (binunion (Sing x0) (Sing x1)) -> x2 (binunion (Sing x0) (Sing x1)) (UPair x0 x1)).
Axiom setsum_1_1_2 : setsum 1 1 = 2.
Axiom missingprop_6f4f3b954cb736651074754cd4a7a9c9f8fdee5b2d9e8c774389a322e59d45f1 : (forall x0, atleastp (Sing x0) u1).
Theorem missingprop_597982e7559de2b855feaaad714998b2c76c203ae083789ba10d06918304c2af : (forall x0 x1, atleastp (UPair x0 x1) u2).
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_d631a7130d5b5dc7c63be4f6ec657039b3370cb84697eaa2bc8ab827ff606adf : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 u1) (ordsucc x0) -> x1 (ordsucc x0) (add_nat x0 u1)).
admit.
Qed.
Definition u3 : set :=
 ordsucc u2.
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom nat_2 : nat_p 2.
Axiom nat_1 : nat_p 1.
Axiom equip_ref : (forall x0, equip x0 x0).
Theorem missingprop_759385aaf2552bc084b93d85dc14d2c88a6e1c208e7a8c2f2496c2cc97eb9fd1 : (forall x0 x1 x2, atleastp (SetAdjoin (UPair x0 x1) x2) u3).
admit.
Qed.
Definition u4 : set :=
 ordsucc u3.
Axiom nat_3 : nat_p 3.
Theorem missingprop_4e0cf9174e37d832969880935f090edb119d1d2839b896a409f752aecb0ec817 : (forall x0 x1 x2 x3, atleastp (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) u4).
admit.
Qed.
Definition u5 : set :=
 ordsucc u4.
Axiom nat_4 : nat_p 4.
Theorem missingprop_0d2b71dbc566dc9256876fbf3a6fbc6e13ed379d200767ef811bfed1f124cdbd : (forall x0 x1 x2 x3 x4, atleastp (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) u5).
admit.
Qed.
Definition u6 : set :=
 ordsucc u5.
Axiom nat_5 : nat_p 5.
Theorem missingprop_64283f372689c951426ae8d649fec9f376f7cbf5cb90cae78f87ad478a86b091 : (forall x0 x1 x2 x3 x4 x5, atleastp (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) u6).
admit.
Qed.
Definition u7 : set :=
 ordsucc u6.
Axiom nat_6 : nat_p 6.
Theorem missingprop_e3d792208a43699ac881369daf980df8fc1c9033274e154dfa581ec0b9f01408 : (forall x0 x1 x2 x3 x4 x5 x6, atleastp (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) u7).
admit.
Qed.
Definition u8 : set :=
 ordsucc u7.
Axiom nat_7 : nat_p 7.
Theorem missingprop_fafbac4bcd2b3e7da700bf5f8907bdf7d7033f400ee01d030d82e0a016e2e93a : (forall x0 x1 x2 x3 x4 x5 x6 x7, atleastp (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) x5) x6) x7) u8).
admit.
Qed.
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
Definition TwoRamseyProp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Definition u9 : set :=
 ordsucc u8.
Axiom missingprop_4ea53c48851955e8bea31637fee475e64087a6b61ca7b79b70612b7fb5547d5f : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2 : prop, (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (forall x5, x5 :e u9 -> (forall x6, x6 :e u9 -> (x1 = x3 -> (forall x7 : prop, x7)) -> (x1 = x4 -> (forall x7 : prop, x7)) -> (x1 = x5 -> (forall x7 : prop, x7)) -> (x1 = x6 -> (forall x7 : prop, x7)) -> (x3 = x4 -> (forall x7 : prop, x7)) -> (x3 = x5 -> (forall x7 : prop, x7)) -> (x3 = x6 -> (forall x7 : prop, x7)) -> (x4 = x5 -> (forall x7 : prop, x7)) -> (x4 = x6 -> (forall x7 : prop, x7)) -> (x5 = x6 -> (forall x7 : prop, x7)) -> x0 x1 x3 -> x0 x1 x4 -> x0 x1 x5 -> not (x0 x3 x4) -> not (x0 x3 x5) -> not (x0 x4 x5) -> (forall x7, x7 :e u9 -> x0 x1 x7 -> x7 :e SetAdjoin (SetAdjoin (UPair x1 x3) x4) x5) -> x0 x6 x3 -> x0 x6 x4 -> x2)))) -> x2))).
Axiom missingprop_f0014261a073154b27e42b7a2586bc3123c4455a00f08c2d90b89b2c21d8c9c7 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x1 x2 -> x0 x1 x3 -> (forall x4 : prop, (forall x5, x5 :e u9 -> (x1 = x5 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> x0 x1 x5 -> not (x0 x2 x5) -> not (x0 x3 x5) -> (forall x6, x6 :e u9 -> x0 x1 x6 -> x6 :e SetAdjoin (SetAdjoin (UPair x1 x2) x3) x5) -> x4) -> x4))))).
Axiom missingprop_3de4fed6100f7a1644d3bcc671dd5818f525687e19a89aa1d64708dea3801718 : (forall x0 x1 x2 x3 x4, x4 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3 -> (forall x5 : set -> prop, x5 x0 -> x5 x1 -> x5 x2 -> x5 x3 -> x5 x4)).
Axiom missingprop_a58ed68e326facfa3846ecea2faee66b9aeeaf3494644a87b11776a6d6b043a5 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (x1 = x2 -> (forall x5 : prop, x5)) -> (x1 = x3 -> (forall x5 : prop, x5)) -> (x1 = x4 -> (forall x5 : prop, x5)) -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x1 x2 -> x0 x1 x3 -> x0 x1 x4 -> (forall x5, x5 :e u9 -> x0 x1 x5 -> x5 :e SetAdjoin (SetAdjoin (UPair x1 x2) x3) x4)))))).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom missingprop_e5f54883ef81ce7762b9725b9788939c5645e264719dcad8a0b5599f672a6573 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (or (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u3 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x0 x3 x4))) -> x1) -> x1) (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1)) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> (forall x5, x5 :e u9 -> (x1 = x2 -> (forall x6 : prop, x6)) -> (x1 = x3 -> (forall x6 : prop, x6)) -> (x1 = x4 -> (forall x6 : prop, x6)) -> (x1 = x5 -> (forall x6 : prop, x6)) -> (x2 = x3 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x0 x1 x2 -> x0 x1 x3 -> x0 x1 x4 -> not (x0 x2 x3) -> not (x0 x2 x4) -> not (x0 x3 x4) -> x0 x5 x2 -> x0 x5 x3 -> x0 x5 x4 -> False)))))).
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_8 : nat_p 8.
Axiom missingprop_01a9c78d2ff9508973a3397619af294eba02d9395696c331bc156cf4e0508f7d : (forall x0 x1 x2, (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> equip (SetAdjoin (UPair x0 x1) x2) u3).
Axiom In_0_9 : 0 :e 9.
Axiom missingprop_7f098af8306b8cdcf47b26bfb1455c3824eb4d0d35f81e31f1ed9b01cffac7ac : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> not (forall x1 : prop, (forall x2, and (x2 c= u9) (and (equip u4 x2) (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x0 x3 x4)))) -> x1) -> x1) -> (forall x1, x1 :e u9 -> (forall x2, x2 :e u9 -> (forall x3, x3 :e u9 -> (forall x4, x4 :e u9 -> not (x0 x1 x2) -> not (x0 x1 x3) -> not (x0 x1 x4) -> not (x0 x2 x3) -> not (x0 x2 x4) -> not (x0 x3 x4) -> (forall x5 : prop, (x1 = x2 -> x5) -> (x1 = x3 -> x5) -> (x1 = x4 -> x5) -> (x2 = x3 -> x5) -> (x2 = x4 -> x5) -> (x3 = x4 -> x5) -> x5)))))).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem TwoRamseyProp_3_4_9 : TwoRamseyProp 3 4 9.
admit.
Qed.
