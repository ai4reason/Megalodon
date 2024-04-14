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
Definition ChurchNum2 : (set -> set) -> set -> set :=
 (fun x0 : set -> set => fun x1 : set => x0 (x0 x1)).
Definition ChurchNum_ii_2 : ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : (set -> set) -> set -> set => fun x1 : set -> set => x0 (x0 x1)).
Definition ChurchNum_ii_3 : ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : (set -> set) -> set -> set => fun x1 : set -> set => x0 (x0 (x0 x1))).
Definition ChurchNum_ii_4 : ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : (set -> set) -> set -> set => fun x1 : set -> set => x0 (x0 (x0 (x0 x1)))).
Definition ChurchNum_ii_5 : ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : (set -> set) -> set -> set => fun x1 : set -> set => x0 (x0 (x0 (x0 (x0 x1))))).
Definition ChurchNum_ii_6 : ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : (set -> set) -> set -> set => fun x1 : set -> set => x0 (x0 (x0 (x0 (x0 (x0 x1)))))).
Definition ChurchNum_ii_7 : ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : (set -> set) -> set -> set => fun x1 : set -> set => x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))).
Definition ChurchNum_ii_8 : ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : (set -> set) -> set -> set => fun x1 : set -> set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))).
Theorem missingprop_652c33d51786d83ad73a9f3ad061b0312e77991db52346310444b921b4facd5f : (forall x0 : set -> set, forall x1 : set -> set -> prop, (forall x2 x3, x1 x3 x2 -> x1 x3 (x0 x2)) -> (forall x2 x3, x1 x3 x2 -> x1 x3 (ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_11e15fca8ff1d439d23914dd5828d3dfc7587cdbdb1b58f4cdcd37abbc83a41a : (forall x0 : set -> set, forall x1 : set -> set -> prop, (forall x2 x3, x1 x3 x2 -> x1 x3 (x0 x2)) -> (forall x2 x3, x1 x3 x2 -> x1 x3 (ChurchNum_ii_2 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_0a70d2d43ea31863dc5afb5c5dd839dddd16f01bbe480459e9d6b2402dd27bce : (forall x0 : set -> set, forall x1 : set -> set -> prop, (forall x2 x3, x1 x3 x2 -> x1 x3 (x0 x2)) -> (forall x2 x3, x1 x3 x2 -> x1 x3 (ChurchNum_ii_3 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_8f091fac19628539fcf2e218e3dc2a99ae1149b00810a44df3df9898ec6617fb : (forall x0 : set -> set, forall x1 : set -> set -> prop, (forall x2 x3, x1 x3 x2 -> x1 x3 (x0 x2)) -> (forall x2 x3, x1 x3 x2 -> x1 x3 (ChurchNum_ii_4 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_af1ecdf9ce6b04278d3e4fc32870f99c200ac770476565e590e79cfb33806b67 : (forall x0 : set -> set, forall x1 : set -> set -> prop, (forall x2 x3, x1 x3 x2 -> x1 x3 (x0 x2)) -> (forall x2 x3, x1 x3 x2 -> x1 x3 (ChurchNum_ii_5 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_44e0ba05d0717b02d304ea93cace392f852a965609b181bd83e00caede8a9540 : (forall x0 : set -> set, forall x1 : set -> set -> prop, (forall x2 x3, x1 x3 x2 -> x1 x3 (x0 x2)) -> (forall x2 x3, x1 x3 x2 -> x1 x3 (ChurchNum_ii_6 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_0cd951a82ebe4f4eae336dba1435eb57a5ebd8c7fea6487ca4fa5dfa1e00ce12 : (forall x0 : set -> set, forall x1 : set -> set -> prop, (forall x2 x3, x1 x3 x2 -> x1 x3 (x0 x2)) -> (forall x2 x3, x1 x3 x2 -> x1 x3 (ChurchNum_ii_7 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_6902f0c6251eadd4e123d336a380d25ca544dedff5e8ea91e4f839972fe3cd63 : (forall x0 : set -> set, forall x1 : set -> set -> prop, (forall x2 x3, x1 x3 x2 -> x1 x3 (x0 x2)) -> (forall x2 x3, x1 x3 x2 -> x1 x3 (ChurchNum_ii_8 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_cd8820c0941404bc0ee6e2d99bfa9cb130b650b8c5580df573b90c29b818d998 : (forall x0 : set -> set, forall x1 : set -> prop, (forall x2, x1 x2 -> x1 (x0 x2)) -> (forall x2, x1 x2 -> x1 (ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_1614b543c6d96eeda0a488900213094a8fd1c045e7cd1981f3f7be2de773b0b2 : (forall x0 : set -> set, forall x1 : set -> prop, (forall x2, x1 x2 -> x1 (x0 x2)) -> (forall x2, x1 x2 -> x1 (ChurchNum_ii_2 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_6922ca648754d2fcd8def657f3c462cad3da091597013f4f6b6e4c200e62547f : (forall x0 : set -> set, forall x1 : set -> prop, (forall x2, x1 x2 -> x1 (x0 x2)) -> (forall x2, x1 x2 -> x1 (ChurchNum_ii_3 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_e93a8c6aa6f443714903366c406c66ee5568ab35bb2d12e6033aa07bd1f73b7d : (forall x0 : set -> set, forall x1 : set -> prop, (forall x2, x1 x2 -> x1 (x0 x2)) -> (forall x2, x1 x2 -> x1 (ChurchNum_ii_4 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_5a55ae6da060bd3592cd2518e6392e5786971bf34a92b383078bce38ef6a8408 : (forall x0 : set -> set, forall x1 : set -> prop, (forall x2, x1 x2 -> x1 (x0 x2)) -> (forall x2, x1 x2 -> x1 (ChurchNum_ii_5 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_15156acfaef83289041d2fede437e15a29e8b8de66c5ea43e1171f433b1a0acd : (forall x0 : set -> set, forall x1 : set -> prop, (forall x2, x1 x2 -> x1 (x0 x2)) -> (forall x2, x1 x2 -> x1 (ChurchNum_ii_6 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_ce54d5ef942573b8a5e252b7d383c47677ca0bf9a20df871ef49769286038d6d : (forall x0 : set -> set, forall x1 : set -> prop, (forall x2, x1 x2 -> x1 (x0 x2)) -> (forall x2, x1 x2 -> x1 (ChurchNum_ii_7 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_ecf5eea45f41bf7adbe211aa6fc21085082149e5b6bd207afa72850cb193f7b3 : (forall x0 : set -> set, forall x1 : set -> prop, (forall x2, x1 x2 -> x1 (x0 x2)) -> (forall x2, x1 x2 -> x1 (ChurchNum_ii_8 ChurchNum2 x0 x2))).
admit.
Qed.
Theorem missingprop_6188398b9f7d79a13748e25a6502abdb9bec2af00da91608d0db3966f5053c1a : (forall x0 : set -> set, forall x1 : set -> prop, forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x0 x3)) -> (forall x3, x1 x3 -> x2 (x0 x3) = x0 (x2 x3)) -> (forall x3, x1 x3 -> x2 (ChurchNum2 x0 x3) = ChurchNum2 x0 (x2 x3))).
admit.
Qed.
Theorem missingprop_910f270f5569d9b3d1b399a0d821e706f62672ed8ac07f2a600977372b2a7f17 : (forall x0 : set -> set, forall x1 : set -> prop, forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x0 x3)) -> (forall x3, x1 x3 -> x2 (x0 x3) = x0 (x2 x3)) -> (forall x3, x1 x3 -> x2 (ChurchNum_ii_2 ChurchNum2 x0 x3) = ChurchNum_ii_2 ChurchNum2 x0 (x2 x3))).
admit.
Qed.
Theorem missingprop_e2cb0de7874d400d74b6cb5cf619af6f48ae813f369fbf388b00f41ca04e606a : (forall x0 : set -> set, forall x1 : set -> prop, forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x0 x3)) -> (forall x3, x1 x3 -> x2 (x0 x3) = x0 (x2 x3)) -> (forall x3, x1 x3 -> x2 (ChurchNum_ii_3 ChurchNum2 x0 x3) = ChurchNum_ii_3 ChurchNum2 x0 (x2 x3))).
admit.
Qed.
Theorem missingprop_25e71d8a7ad20837122ea1d4ff51220449571353b61bd172f7ce85161686ccac : (forall x0 : set -> set, forall x1 : set -> prop, forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x0 x3)) -> (forall x3, x1 x3 -> x2 (x0 x3) = x0 (x2 x3)) -> (forall x3, x1 x3 -> x2 (ChurchNum_ii_4 ChurchNum2 x0 x3) = ChurchNum_ii_4 ChurchNum2 x0 (x2 x3))).
admit.
Qed.
Theorem missingprop_3d492f63bbda05786f59e1a020a0f00cded12b012672cfcb59b4dfe595a76487 : (forall x0 : set -> set, forall x1 : set -> prop, forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x0 x3)) -> (forall x3, x1 x3 -> x2 (x0 x3) = x0 (x2 x3)) -> (forall x3, x1 x3 -> x2 (ChurchNum_ii_5 ChurchNum2 x0 x3) = ChurchNum_ii_5 ChurchNum2 x0 (x2 x3))).
admit.
Qed.
Theorem missingprop_1ecba3dd5eafa4f5c4681522469f6140788e091a78ad9f01e97cc0b6f2c0488f : (forall x0 : set -> set, forall x1 : set -> prop, forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x0 x3)) -> (forall x3, x1 x3 -> x2 (x0 x3) = x0 (x2 x3)) -> (forall x3, x1 x3 -> x2 (ChurchNum_ii_6 ChurchNum2 x0 x3) = ChurchNum_ii_6 ChurchNum2 x0 (x2 x3))).
admit.
Qed.
Theorem missingprop_90ee732e350e6ffe2073d662ad885e0f4d56a79b3cc64afadf949a48ec2985f2 : (forall x0 : set -> set, forall x1 : set -> prop, forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x0 x3)) -> (forall x3, x1 x3 -> x2 (x0 x3) = x0 (x2 x3)) -> (forall x3, x1 x3 -> x2 (ChurchNum_ii_7 ChurchNum2 x0 x3) = ChurchNum_ii_7 ChurchNum2 x0 (x2 x3))).
admit.
Qed.
Theorem missingprop_9cbd73c57b57189ea2bc84acebad90ec41684848a5d57f638fc08edf56e7b70d : (forall x0 : set -> set, forall x1 : set -> prop, forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x0 x3)) -> (forall x3, x1 x3 -> x2 (x0 x3) = x0 (x2 x3)) -> (forall x3, x1 x3 -> x2 (ChurchNum_ii_8 ChurchNum2 x0 x3) = ChurchNum_ii_8 ChurchNum2 x0 (x2 x3))).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom nat_0 : nat_p 0.
Theorem missingprop_c00f2f77a9de84adbe221e2db786f0dbccd295ee08ec6eb8eaaf0b0a862ad5bd : nat_p 64.
admit.
Qed.
Theorem missingprop_6e53a236b7ea8e68ba2218da7e776817c8344b3c6935bc90e79d581ea505cdeb : nat_p 128.
admit.
Qed.
Theorem missingprop_c39f4091a15f1ff7b3dd65d38fd37d060cdcbceda205863f5e715a04f6271f28 : nat_p 256.
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Definition exp_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec 1 (fun x1 : set => mul_nat x0)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem missingprop_e320081fa46c313032b82ae65d08f162063eec597356adc2ef96e4883b8d3302 : (forall x0, forall x1 : set -> set -> prop, x1 (exp_nat x0 0) 1 -> x1 1 (exp_nat x0 0)).
admit.
Qed.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Theorem missingprop_e9c4cec7fb327dcb17b88acdaf76daee024e49fa71834a13065f86e12e958609 : (forall x0 x1, nat_p x1 -> exp_nat x0 (ordsucc x1) = mul_nat x0 (exp_nat x0 x1)).
admit.
Qed.
Theorem missingprop_098635d36327e911c191b98b7e3c49d73ef8a0c0f5b4edc71d9e1d18b9a5538e : exp_nat 2 0 = 1.
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_1_1_2 : add_nat 1 1 = 2.
Axiom mul_add_nat_distrR : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat (add_nat x0 x1) x2 = add_nat (mul_nat x0 x2) (mul_nat x1 x2)))).
Axiom nat_1 : nat_p 1.
Axiom missingprop_1b73e01bc234ba0e318bc9baf16604d4f0fc12bea57885439d70438de4eb7174 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Axiom missingprop_6e31f7e63da1d74f4ea3ef967162bc5821029ffe1e451b13664a6e51a570dea7 : (forall x0, nat_p x0 -> mul_nat 1 x0 = x0).
Theorem missingprop_9282c4fc031a36c9b2eafd476b3c98b0d2f015723908debe89fc7acd2c78f947 : (forall x0, nat_p x0 -> exp_nat 2 (ordsucc x0) = add_nat (exp_nat 2 x0) (exp_nat 2 x0)).
admit.
Qed.
Axiom missingprop_5858d8b36c7cdaccd2f26eae0cf9cb2cc1dc7fc685e15eee42b07d14732d6e73 : (forall x0, forall x1 : set -> set -> prop, x1 (exp_nat x0 1) x0 -> x1 x0 (exp_nat x0 1)).
Theorem missingprop_d905c99d1abb5a70060fb13a377a3d2ed29dadd1b587947d11ed98993de2a4f1 : exp_nat 2 1 = 2.
admit.
Qed.
Axiom missingprop_c2aa62c368a47ae018ac0952ff3137b0b6dc17b9b871ce9eb89fc53a8a9f308f : exp_nat 2 2 = 4.
Theorem missingprop_51d7aacc78b3ddca98fe7228c327d11718f39d1da28fadd163039627202ffbe1 : exp_nat 2 2 = ChurchNum_ii_2 ChurchNum2 ordsucc 0.
admit.
Qed.
Axiom missingprop_dce43ea6d63e54501c7ce27a27a4f3799fbde66446a6152326baf4c4d41aa8a0 : exp_nat 2 3 = 8.
Theorem missingprop_e3a36523d7f90f2528e1a2ea879f24ab8208107328113e66e212617420efdebb : exp_nat 2 3 = ChurchNum_ii_3 ChurchNum2 ordsucc 0.
admit.
Qed.
Axiom missingprop_18dab10013860d442d73fc2b55cfee57e61b2e3044d2d0c29767dba9e5eb2112 : exp_nat 2 4 = 16.
Theorem missingprop_9fcf35c2e424289a044693a3f4d7db926c91858a9a16bc172b830443758e610b : exp_nat 2 4 = ChurchNum_ii_4 ChurchNum2 ordsucc 0.
admit.
Qed.
Axiom missingprop_8e67f22739f9a01fd2d9438edd2f3f6d8d323d1fa4d050bc09f5b1af8d3b6dd7 : exp_nat 2 5 = 32.
Theorem missingprop_dfd75789bdcf74d855c762b087b060f27bac1d86daec67bb0564ef3cbdbd7473 : exp_nat 2 5 = ChurchNum_ii_5 ChurchNum2 ordsucc 0.
admit.
Qed.
Axiom nat_5 : nat_p 5.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_180b0fd5c0d77d89fc7c74d0519e38ad47b1b50cde73428ffe5103966c8941b7 : exp_nat 2 6 = ChurchNum_ii_6 ChurchNum2 ordsucc 0.
admit.
Qed.
Theorem missingprop_4d619f8c0c4edc98bd8e6be92366236784a59ad7862cae98bda091f9d44c9792 : exp_nat 2 6 = 64.
admit.
Qed.
Axiom nat_6 : nat_p 6.
Theorem missingprop_6df9254739f4a388867a5d36973fd227e06018cecfed76efdc871bfcb7b2c526 : exp_nat 2 7 = ChurchNum_ii_7 ChurchNum2 ordsucc 0.
admit.
Qed.
Theorem missingprop_9e6f23a1f067c4fb7287250d6c9f5db51a314df65fe3c62e2fb6ac9083579f6f : exp_nat 2 7 = 128.
admit.
Qed.
Axiom nat_7 : nat_p 7.
Theorem missingprop_53a54314c9a6a892295b2ded3eab37435879a00813e71bc2836df12be576e7ac : exp_nat 2 8 = ChurchNum_ii_8 ChurchNum2 ordsucc 0.
admit.
Qed.
Theorem missingprop_6a52958e4f78bfbec0705264cbdc4db2a67b208886bb7fb64814eed466bdb010 : exp_nat 2 8 = 256.
admit.
Qed.
