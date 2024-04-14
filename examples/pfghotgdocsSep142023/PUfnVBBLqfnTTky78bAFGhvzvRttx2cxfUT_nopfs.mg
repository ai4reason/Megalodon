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
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom missingprop_b2fe1166cc90aada9c2da7a2f96ec027f60d52a2799891b4e0a891d3402a8b5f : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2 x3, atleastp (add_nat x0 x1) (binunion x2 x3) -> or (atleastp x0 x2) (atleastp x1 x3)))).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom missingprop_11c6158bd93dbd27daaa9a84a43404be6ccbf75f900b1e28dfa453e64ea6c96b : (forall x0 x1 x2, nIn x2 x1 -> atleastp x0 x1 -> atleastp (ordsucc x0) (binunion x1 (Sing x2))).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom FalseE : False -> (forall x0 : prop, x0).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_ref : (forall x0, equip x0 x0).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Theorem missingprop_7894589e92ad65fe6a6a8f12eea7b2520d76849fec738d96171c7ec8a02dfa84 : (forall x0 x1 x2 x3, nat_p x2 -> nat_p x3 -> TwoRamseyProp_atleastp (ordsucc x0) x1 x2 -> TwoRamseyProp_atleastp x0 (ordsucc x1) x3 -> TwoRamseyProp_atleastp (ordsucc x0) (ordsucc x1) (ordsucc (add_nat x2 x3))).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom missingprop_8aec7aa3dfe2dc8cbf1366cb9f5d8ab2c4ceeb7b1cd3cc933b26d92d53269901 : (forall x0 x1 x2, TwoRamseyProp_atleastp x0 x1 x2 -> TwoRamseyProp x0 x1 x2).
Theorem missingprop_217e5145b65197888461a6aa126b20121c0d56dc8d69d44ac11b973377d98f71 : (forall x0 x1 x2 x3, nat_p x2 -> nat_p x3 -> TwoRamseyProp_atleastp (ordsucc x0) x1 x2 -> TwoRamseyProp_atleastp x0 (ordsucc x1) x3 -> TwoRamseyProp (ordsucc x0) (ordsucc x1) (ordsucc (add_nat x2 x3))).
admit.
Qed.
Axiom missingprop_bb0cce2a8a891fc83c2d273bca3870e6d95b58f7c38b76aa14bb34832a6eb7db : add_nat 6 4 = 10.
Axiom nat_6 : nat_p 6.
Axiom nat_4 : nat_p 4.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom TwoRamseyProp_3_3_6 : TwoRamseyProp 3 3 6.
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Axiom missingprop_678f269783f56623b590ce1d631178bc95b1ef296ba955ebeddcd0dc31626e86 : (forall x0, TwoRamseyProp_atleastp 2 x0 x0).
Theorem TwoRamseyProp_3_4_11 : TwoRamseyProp 3 4 11.
admit.
Qed.
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Axiom nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
Axiom nat_16 : nat_p 16.
Axiom missingprop_ae3e46fe1608a88c13cfd94c7c4f636604e089dbe99822d5f16bc7323d0026af : 11 :e 16.
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
(* Parameter exp_nat "4ce015b98f266293ef85ef9898e1d8f66f4d9664bd9601197410d96354105016" "37c5310c8da5c9f9db9152285b742d487f1a5b1bd7c73a4207d40bcd4f4d13fb" *)
Parameter exp_nat : set -> set -> set.
Axiom missingprop_18dab10013860d442d73fc2b55cfee57e61b2e3044d2d0c29767dba9e5eb2112 : exp_nat 2 4 = 16.
Axiom missingprop_f5822e9d5891900b4c653eab5e89c5bb71543e61fe2c332750489ecd340604eb : (forall x0, nat_p x0 -> equip (Power x0) (exp_nat 2 x0)).
Theorem TwoRamseyProp_3_4_Power_4 : TwoRamseyProp 3 4 (Power 4).
admit.
Qed.
Axiom missingprop_5b7536e138ce2802b7ff71fe1112d72a83e0e7fe4b94027c8a3d1f1cacfae786 : (forall x0 x1 x2 x3, x2 c= x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Axiom missingprop_ed9ae380d91bb4eef6a9133f8865237c6a1236bcf056f5e6c2e3787bb8a1ba4a : (forall x0, Power x0 c= Power (ordsucc x0)).
Theorem TwoRamseyProp_3_4_Power_5 : TwoRamseyProp 3 4 (Power 5).
admit.
Qed.
Theorem TwoRamseyProp_3_4_Power_6 : TwoRamseyProp 3 4 (Power 6).
admit.
Qed.
Theorem TwoRamseyProp_3_4_Power_7 : TwoRamseyProp 3 4 (Power 7).
admit.
Qed.
Theorem TwoRamseyProp_3_4_Power_8 : TwoRamseyProp 3 4 (Power 8).
admit.
Qed.
Axiom missingprop_7cd03dbfae329617acb8c22c57274b9ce847af995390987fceba274bc1b46dfb : add_nat 11 5 = 16.
Axiom nat_11 : nat_p 11.
Axiom nat_5 : nat_p 5.
Theorem TwoRamseyProp_3_5_17 : TwoRamseyProp 3 5 17.
admit.
Qed.
Axiom missingprop_e20297641bb65d9e51ebac2e053948365a3f53b65d223d41920ce90b2e26b533 : nat_p 32.
Axiom missingprop_a88c85c6f3bdc8051d7ba28ca09445c45d7f982fd1cec9a3ed2cdf307b04bd69 : 17 :e 32.
Axiom missingprop_8e67f22739f9a01fd2d9438edd2f3f6d8d323d1fa4d050bc09f5b1af8d3b6dd7 : exp_nat 2 5 = 32.
Theorem TwoRamseyProp_3_5_Power_5 : TwoRamseyProp 3 5 (Power 5).
admit.
Qed.
Theorem TwoRamseyProp_3_5_Power_6 : TwoRamseyProp 3 5 (Power 6).
admit.
Qed.
Theorem TwoRamseyProp_3_5_Power_7 : TwoRamseyProp 3 5 (Power 7).
admit.
Qed.
Theorem TwoRamseyProp_3_5_Power_8 : TwoRamseyProp 3 5 (Power 8).
admit.
Qed.
Axiom missingprop_70a8ef6b90a3613f01ae6c665eced16b10e3c2de4bfc4352f3e312ab3c0845f2 : add_nat 11 11 = 22.
Axiom missingprop_9555e0d9fdb2de2946ade80c5601bbc2d7d10bbfbfdf3c2a29f338ee6ac35b14 : (forall x0 x1 x2, TwoRamseyProp_atleastp x0 x1 x2 -> TwoRamseyProp_atleastp x1 x0 x2).
Theorem TwoRamseyProp_4_4_23 : TwoRamseyProp 4 4 23.
admit.
Qed.
Axiom missingprop_17f884ddc3f039c0d5a0568a967dbdbf216b15afe5c273c30b000f89c3e3142a : 23 :e 32.
Theorem TwoRamseyProp_4_4_Power_5 : TwoRamseyProp 4 4 (Power 5).
admit.
Qed.
Theorem TwoRamseyProp_4_4_Power_6 : TwoRamseyProp 4 4 (Power 6).
admit.
Qed.
Theorem TwoRamseyProp_4_4_Power_7 : TwoRamseyProp 4 4 (Power 7).
admit.
Qed.
Theorem TwoRamseyProp_4_4_Power_8 : TwoRamseyProp 4 4 (Power 8).
admit.
Qed.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_3aed17a5efe6106d2d51f43d89be6fe3581fe8b39f9fd99a21e9de83130635b9 : add_nat 17 1 = 18.
admit.
Qed.
Axiom nat_1 : nat_p 1.
Theorem missingprop_cddd0fc2bb21119d75219a71768ca2dea18b7c73ff709fb8296254df8ad773cb : add_nat 17 2 = 19.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Theorem missingprop_474f7895989c15c9ae7b231f78aa73ad19f0ddfd450a5ef2e2fad7f2219d0ee2 : add_nat 17 3 = 20.
admit.
Qed.
Axiom nat_3 : nat_p 3.
Theorem missingprop_9e6e58733bc8ce6f6efa9418ce429d4d23f5fc86a320b83ea81ab02e2b573f9a : add_nat 17 4 = 21.
admit.
Qed.
Theorem missingprop_6ebadfe66af36e6dccf341a36a2dd7fb6e7643554d8d6f4689ecefe8451e9a80 : add_nat 17 5 = 22.
admit.
Qed.
Theorem missingprop_3259cb7d3b3b3adafac7093356c6be4d14cc142aba0c3345c772dc583fe3fafc : add_nat 17 6 = 23.
admit.
Qed.
Axiom nat_17 : nat_p 17.
Theorem TwoRamseyProp_3_6_24 : TwoRamseyProp 3 6 24.
admit.
Qed.
Axiom missingprop_517d6d8aecf883bffffb5e65645f1bfa2f40dec14b5ac3b5b3dc9b93db3c1ef5 : 24 :e 32.
Theorem TwoRamseyProp_3_6_Power_5 : TwoRamseyProp 3 6 (Power 5).
admit.
Qed.
Theorem TwoRamseyProp_3_6_Power_6 : TwoRamseyProp 3 6 (Power 6).
admit.
Qed.
Theorem TwoRamseyProp_3_6_Power_7 : TwoRamseyProp 3 6 (Power 7).
admit.
Qed.
Theorem TwoRamseyProp_3_6_Power_8 : TwoRamseyProp 3 6 (Power 8).
admit.
Qed.
