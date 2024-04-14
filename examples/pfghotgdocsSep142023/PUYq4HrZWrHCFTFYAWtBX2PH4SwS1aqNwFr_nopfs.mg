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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_150e303ecf8a7227a9f23528d11666f9ad495de0a25ae8fba20dedf2c3db2f83 : add_nat 4 1 = 5.
admit.
Qed.
Axiom nat_1 : nat_p 1.
Theorem missingprop_c7ff2c1ce2f06f72fc2bfa42801bb82ccb8c93fb9879a65ac61f882be9c49615 : add_nat 4 2 = 6.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Theorem missingprop_909bce7836e0f55a0dadd112320e0a6a30226e110e08bf9ff00fde6033b2fd03 : add_nat 4 3 = 7.
admit.
Qed.
Axiom nat_3 : nat_p 3.
Theorem missingprop_58ff2b27b026e86dd7175f8c18dac8fe76e7f12b4c3407557df1571fd66d2cbc : add_nat 4 4 = 8.
admit.
Qed.
Theorem missingprop_338431d9538a20654d743f8ae106061819c7ebca823a9d80d9af1e3fa036eeee : add_nat 8 1 = 9.
admit.
Qed.
Theorem missingprop_d7deec8e526d5cecdb6f4b802de37ac257a251c1edccb76e6b421c0971b8c843 : add_nat 8 2 = 10.
admit.
Qed.
Theorem missingprop_c5746c977b2d47aad81880b1d586c3161c988d7145724c58061d0e11bbb6bccb : add_nat 8 3 = 11.
admit.
Qed.
Theorem missingprop_6cbf2ce5b238902a91be96bb2397d1da08ec04d3fb85075e050578834f28c05e : add_nat 8 4 = 12.
admit.
Qed.
Axiom nat_4 : nat_p 4.
Theorem missingprop_be387064582b78b8923fd34438f6658726875e67eca3705bc9b1d5eb2f7c04d7 : add_nat 8 5 = 13.
admit.
Qed.
Axiom nat_5 : nat_p 5.
Theorem missingprop_3c4363a8307a78a0d14450aa2d47228e9f62c65b7b7720322b109dbe01aa2579 : add_nat 8 6 = 14.
admit.
Qed.
Axiom nat_6 : nat_p 6.
Theorem missingprop_e9e46689fa13531c3c5f1fe9f56f219753b5a957461194ee1c0c3a42c7e35908 : add_nat 8 7 = 15.
admit.
Qed.
Axiom nat_7 : nat_p 7.
Theorem missingprop_344c784b1c3b94c370e58970c6c07f9652a98f817bb26a71614a2661ed1216a6 : add_nat 8 8 = 16.
admit.
Qed.
Theorem missingprop_e8b8cc3197e9023162add07151dc0f7ca1683c2ac8baa030b8f4fa51ef79c8ab : add_nat 11 1 = 12.
admit.
Qed.
Theorem missingprop_86401da035efc11abf0f31fdc4126152acca9384034029b622369caf98a819cc : add_nat 11 2 = 13.
admit.
Qed.
Theorem missingprop_2abea2296d79fb28458b1b603e722086e8ef5f7781e61072ef5f487cf099c1f1 : add_nat 11 3 = 14.
admit.
Qed.
Theorem missingprop_09fb15cb456ea8622363717a3a97c52e8b1fb4788e63f2161fea149e3fdd2f98 : add_nat 11 4 = 15.
admit.
Qed.
Theorem missingprop_7cd03dbfae329617acb8c22c57274b9ce847af995390987fceba274bc1b46dfb : add_nat 11 5 = 16.
admit.
Qed.
Theorem missingprop_df15fb7a07da4a2b5124ddea4e33f012b3f09ace77b002ed675c7b110878b43a : add_nat 11 6 = 17.
admit.
Qed.
Theorem missingprop_c92fee5a65e5fadde4757af680b77e183bc38443fef77c13f781614a293e5e12 : add_nat 11 7 = 18.
admit.
Qed.
Theorem missingprop_c47a21f42a2e79ac3d16722997a88866c055b7f31e118d111f94e4cb0cf9219e : add_nat 11 8 = 19.
admit.
Qed.
Axiom nat_8 : nat_p 8.
Theorem missingprop_7a066c966ba0f9a08b1372c22745f205fa3d924c63c9603593d2516de2169f24 : add_nat 11 9 = 20.
admit.
Qed.
Axiom nat_9 : nat_p 9.
Theorem missingprop_74cdc96a7530e97889a33140b593c4632e362c28b4ced8ea4b080022d4c9036b : add_nat 11 10 = 21.
admit.
Qed.
Axiom nat_10 : nat_p 10.
Theorem missingprop_70a8ef6b90a3613f01ae6c665eced16b10e3c2de4bfc4352f3e312ab3c0845f2 : add_nat 11 11 = 22.
admit.
Qed.
Axiom nat_11 : nat_p 11.
Theorem missingprop_b1cbd49965c5cf09bf2752439c1e5c9e5fec2e21bac8c32a5ed180b4cfbebead : add_nat 11 12 = 23.
admit.
Qed.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom add_nat_1_1_2 : add_nat 1 1 = 2.
Axiom mul_add_nat_distrL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat x0 (add_nat x1 x2) = add_nat (mul_nat x0 x1) (mul_nat x0 x2)))).
Axiom mul_nat_1R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 1) x0 -> x1 x0 (mul_nat x0 1)).
Axiom missingprop_a056e7e1d4164d24a60c8047a73979083395e5609e36aaee67608ba08eded8a1 : add_nat 2 2 = 4.
Theorem missingprop_74ac8a784913fa4a6f9da3de96c05984e11ff1600ef66d703e49d6ee22ad106d : mul_nat 2 2 = 4.
admit.
Qed.
Theorem missingprop_82b4ca10eb7ca03c2ab8db9622e8ff501b1df3632d9b511d2313d8304ef45b38 : mul_nat 2 4 = 8.
admit.
Qed.
Theorem missingprop_36374898b358f79d17b8b2339ff8c1fbf04a96c8611bd3a9eaa03c3fcb156f33 : mul_nat 2 8 = 16.
admit.
Qed.
Theorem missingprop_e93669ab817546d215ac951e41fd970256c635b281fe171be0505c81f79158aa : add_nat 6 1 = 7.
admit.
Qed.
Theorem missingprop_322d60e409d28f2933376ad9b03426ecbf00d5aadf0d49b69462c8faf31aa96a : add_nat 6 2 = 8.
admit.
Qed.
Theorem missingprop_fe07743fe98096b69562f4a957d6d8b26d4ea588bad46740358ca1acdd2e63c5 : add_nat 6 3 = 9.
admit.
Qed.
Theorem missingprop_bb0cce2a8a891fc83c2d273bca3870e6d95b58f7c38b76aa14bb34832a6eb7db : add_nat 6 4 = 10.
admit.
Qed.
Theorem missingprop_4b4439c51da8a600c3e11d331807be244fd41e0a1665627143e087ea35ed06e4 : add_nat 16 1 = 17.
admit.
Qed.
Theorem missingprop_26fac5d4bef4b9f6ba3a7efb0a4e398ff2e6bc4a3bfb1f8331d0793afe0746f8 : add_nat 16 2 = 18.
admit.
Qed.
Theorem missingprop_6dfb8f2d9a155fa34a535f0fe1572779e1dd1c9ed05627deccc2c50bf90e1e28 : add_nat 16 3 = 19.
admit.
Qed.
Theorem missingprop_869ea870df29fcc4ae842e2eb607bddd40c710b245db66a0d5ea43e934bbc447 : add_nat 16 4 = 20.
admit.
Qed.
Theorem missingprop_5e518023b1fa3ed7394745b2dc84505ba256b46bf1cfb7809c2d6f1e92527a3e : add_nat 16 5 = 21.
admit.
Qed.
Theorem missingprop_dd3938713573242af0c4fea8e90696a5a614e277ed0440a5717dd66ee9d68a70 : add_nat 16 6 = 22.
admit.
Qed.
Theorem missingprop_bf2b81e6403dbb816616ca5b741869e1f96c53bee8ce62b552a9a9320e0268db : add_nat 16 7 = 23.
admit.
Qed.
Theorem missingprop_4da5fc600f2b33aedc274a99663b5b8b863d740d1d214334be4061845214dfc3 : add_nat 16 8 = 24.
admit.
Qed.
Theorem missingprop_bbeab9e99915fa2731527c9acebd23b22ab8c47440d771f1bb9ee7ef22a74d5e : add_nat 16 9 = 25.
admit.
Qed.
Theorem missingprop_01294585c3b31bb5e40697a2ebfbe1349ac4ab45671f65bc8730ecc3bc621323 : add_nat 16 10 = 26.
admit.
Qed.
Theorem missingprop_d9a103ff87079f6ae5063f08d2114c23dc1d50c13a046a1d8257e1efd6213c61 : add_nat 16 11 = 27.
admit.
Qed.
Theorem missingprop_0e26a8904f30faec2d9f425c22a9c507e31b613ec26c5d60ecbf0db0daff9f20 : add_nat 16 12 = 28.
admit.
Qed.
Axiom nat_12 : nat_p 12.
Theorem missingprop_b985b5127f0100fc0eba8ad64e545f7345a40cce1500156aad2cefd6c74fb978 : add_nat 16 13 = 29.
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition exp_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec 1 (fun x1 : set => mul_nat x0)).
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem missingprop_5858d8b36c7cdaccd2f26eae0cf9cb2cc1dc7fc685e15eee42b07d14732d6e73 : (forall x0, forall x1 : set -> set -> prop, x1 (exp_nat x0 1) x0 -> x1 x0 (exp_nat x0 1)).
admit.
Qed.
Theorem missingprop_c2aa62c368a47ae018ac0952ff3137b0b6dc17b9b871ce9eb89fc53a8a9f308f : exp_nat 2 2 = 4.
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
Axiom add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Axiom add_nat_0L : (forall x0, nat_p x0 -> add_nat 0 x0 = x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_98467c341abf2d4df00f25d8d19317397055bbc0ea96a9fffe28da9dc82a28f5 : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc (mul_nat 2 x1) :e mul_nat 2 x0)).
admit.
Qed.
Axiom In_3_4 : 3 :e 4.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom missingprop_1b73e01bc234ba0e318bc9baf16604d4f0fc12bea57885439d70438de4eb7174 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_nat x0 x1))).
Theorem missingprop_441f51eac9a2dfe161ce38a8744a6c32b2686e6c04076ec100ae43cffb074cd3 : (forall x0, nat_p x0 -> ordsucc (exp_nat 2 (ordsucc x0)) :e exp_nat 2 (ordsucc (ordsucc x0))).
admit.
Qed.
Theorem missingprop_dce43ea6d63e54501c7ce27a27a4f3799fbde66446a6152326baf4c4d41aa8a0 : exp_nat 2 3 = 8.
admit.
Qed.
Theorem missingprop_18dab10013860d442d73fc2b55cfee57e61b2e3044d2d0c29767dba9e5eb2112 : exp_nat 2 4 = 16.
admit.
Qed.
