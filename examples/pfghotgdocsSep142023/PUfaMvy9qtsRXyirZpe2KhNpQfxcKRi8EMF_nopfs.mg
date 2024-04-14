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
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom exp_SNo_nat_S : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> exp_SNo_nat x0 (ordsucc x1) = mul_SNo x0 (exp_SNo_nat x0 x1))).
Axiom nat_1 : nat_p 1.
Axiom exp_SNo_nat_1 : (forall x0, SNo x0 -> exp_SNo_nat x0 1 = x0).
Theorem exp_SNo_nat_2 : (forall x0, SNo x0 -> exp_SNo_nat x0 2 = mul_SNo x0 x0).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SNo_sqr_nonneg : (forall x0, SNo x0 -> SNoLe 0 (mul_SNo x0 x0)).
Theorem SNo_sqr_nonneg' : (forall x0, SNo x0 -> SNoLe 0 (exp_SNo_nat x0 2)).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNo_zero_or_sqr_pos : (forall x0, SNo x0 -> or (x0 = 0) (SNoLt 0 (mul_SNo x0 x0))).
Theorem SNo_zero_or_sqr_pos' : (forall x0, SNo x0 -> or (x0 = 0) (SNoLt 0 (exp_SNo_nat x0 2))).
admit.
Qed.
(* Parameter SNo_pair "42f58f2a7ea537e615b65875895df2f1fc42b140b7652f8ea8e9c6893053be73" "0c801be26da5c0527e04f5b1962551a552dab2d2643327b86105925953cf3b06" *)
Parameter SNo_pair : set -> set -> set.
(* Parameter recip_SNo "eb3c2afcb0fc017514672f7e4bb05a93fb8aa03fbeac55c207f299b0a6c23b32" "aa96a290f83ded9b33662ccb13b56cc27eb5c09a09b36ee3890691b04cc8386c" *)
Parameter recip_SNo : set -> set.
Definition div_SNo : set -> set -> set :=
 (fun x0 x1 : set => mul_SNo x0 (recip_SNo x1)).
(* Parameter CSNo_Re "1be0cda46d38c27e57488fdb9a2e54ccd2b8f9c133cbfc27af57bf54206ada12" "9481cf9deb6efcbb12eccc74f82acf453997c8e75adb5cd83311956bcc85d828" *)
Parameter CSNo_Re : set -> set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter CSNo_Im "8bf86a17c9a6ce157ed3de4762edc8cbee3acc11e18b41f458f34ca9d1983803" "5dad3f55c3f3177e2d18188b94536551b7bfd38a80850f4314ba8abb3fd78138" *)
Parameter CSNo_Im : set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition missingname_1e6ac5880283defc53d83863115a8fb4680f33c09c934d770c730b84316feaee : set -> set :=
 (fun x0 : set => SNo_pair (div_SNo (CSNo_Re x0) (add_SNo (exp_SNo_nat (CSNo_Re x0) 2) (exp_SNo_nat (CSNo_Im x0) 2))) (minus_SNo (div_SNo (CSNo_Im x0) (add_SNo (exp_SNo_nat (CSNo_Re x0) 2) (exp_SNo_nat (CSNo_Im x0) 2))))).
(* Parameter mul_CSNo "be6a968dce01facef568dc993eb13308d0ad11a1122ff3b96873947b912d1ffe" "e40da52d94418bf12fcea785e96229c7cfb23420a48e78383b914917ad3fa626" *)
Parameter mul_CSNo : set -> set -> set.
Definition missingname_7bb5946b3cdd85f919bea1cceb073b0a41168f14fcd953037b3d32bcbbb59e8f : set -> set -> set :=
 (fun x0 x1 : set => mul_CSNo x0 (missingname_1e6ac5880283defc53d83863115a8fb4680f33c09c934d770c730b84316feaee x1)).
(* Parameter CSNo "4a34d6ddf18af8c0c2f637afb2ddadaa240273c85b9410fcb82cd0782bab13d7" "c35281fa7c11775a593d536c7fec2695f764921632445fa772f3a2a45bdf4257" *)
Parameter CSNo : set -> prop.
Axiom missingprop_4be0565ac5b41f138f7a30d0a9f34a5d126bb341d2eeaa545aa7f0c1552b9722 : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 x1 = mul_CSNo x1 x0).
Axiom missingprop_33594f786441fb94cfa9c7be2034d88216fac0dbcbe9e223f18185e2cf6cb053 : CSNo 1.
Axiom missingprop_0d9bf92aa5eb4d4ae6bc10fbd993cadc9f48c429c82304b11a917b483aee3888 : (forall x0, CSNo x0 -> mul_CSNo 1 x0 = x0).
Theorem missingprop_4605d3fc90526ac069a4c8f6c80e61131f850ffc461321a2f21a66ddd142841d : (forall x0, CSNo x0 -> mul_CSNo x0 1 = x0).
admit.
Qed.
Axiom CSNo_I : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo (SNo_pair x0 x1)).
Axiom SNo_div_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (div_SNo x0 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNo_exp_SNo_nat : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> SNo (exp_SNo_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Axiom CSNo_ImR : (forall x0, CSNo x0 -> SNo (CSNo_Im x0)).
Axiom CSNo_ReR : (forall x0, CSNo x0 -> SNo (CSNo_Re x0)).
Theorem missingprop_8e324a6fdc5dd93fc7954e55762c3ec235dc1a98306aca944193e8223699b282 : (forall x0, CSNo x0 -> CSNo (missingname_1e6ac5880283defc53d83863115a8fb4680f33c09c934d770c730b84316feaee x0)).
admit.
Qed.
(* Parameter add_CSNo "87078b7ac24bf8933a19e084290a2389879a99a0c1e88735fb5de288e047db0c" "30acc532eaa669658d7b9166abf687ea3e2b7c588c03b36ba41be23d1c82e448" *)
Parameter add_CSNo : set -> set -> set.
(* Parameter minus_CSNo "d91e2c13ce03095e08eaa749eebd7a4fa45c5e1306e8ce1c6df365704d44867f" "9c138ddc19cc32bbd65aed7e98ca568d6cf11af8ab01e026a5986579061198b7" *)
Parameter minus_CSNo : set -> set.
(* Parameter Complex_i "6c7fc05bbe5807883e5035b06b65b9a669c2f2a8ba2ba952ab91a9a02f7ea409" "d0c55cfc8a943f26e3abfa84ecab85911a27c5b5714cd32dcda81d104eb92c6e" *)
Parameter Complex_i : set.
Axiom missingprop_e8fe572c395c46aa7a6d67f7a8cd850bf647261d6b3677aecbf3b7ddfa5a7193 : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_CSNo x0 x1).
Axiom CSNo_ReIm_split : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re x0 = CSNo_Re x1 -> CSNo_Im x0 = CSNo_Im x1 -> x0 = x1).
Axiom missingprop_3ecd982cbc53bc522aff3fa68eac8a88bfce787ef3776f0dfe2618ef278e2daf : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (mul_CSNo x0 x1)).
Axiom Re_1 : CSNo_Re 1 = 1.
Axiom missingprop_6c208b2fed212d981bc839a7f70f9c484483dc6ca9daee237131093290c06c64 : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re (mul_CSNo x0 x1) = add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Re x1)) (minus_SNo (mul_SNo (CSNo_Im x0) (CSNo_Im x1)))).
Axiom missingprop_af0b151803c2dc4bc6691b166645c0a8471b89f2da30fa0948427517708d6da0 : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re (add_CSNo x0 x1) = add_SNo (CSNo_Re x0) (CSNo_Re x1)).
Axiom missingprop_7f97cbea1b316ccd537155d989f2889dd5c3074e8edefbeca1dbc06c62876158 : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Im (add_CSNo x0 x1) = add_SNo (CSNo_Im x0) (CSNo_Im x1)).
Axiom missingprop_b3da9c8705efa35c67169a2e2027e4447fcfab350671212d3a9a4c69902c0e94 : (forall x0, CSNo x0 -> CSNo_Re (minus_CSNo x0) = minus_SNo (CSNo_Re x0)).
Axiom missingprop_efd7dfcd3e80202ffcc3e685b73692d3dd99f31e27f878a9cd3b14c55287909a : (forall x0, CSNo x0 -> CSNo_Im (minus_CSNo x0) = minus_SNo (CSNo_Im x0)).
Axiom SNo_Re : (forall x0, SNo x0 -> CSNo_Re x0 = x0).
Axiom SNo_Im : (forall x0, SNo x0 -> CSNo_Im x0 = 0).
Axiom SNo_Complex_i : CSNo Complex_i.
Axiom missingprop_f8168dc7675423b30fd1f30a7c39b8d4f1ba18bd99e8df15949f136f95eea4c7 : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Im (mul_CSNo x0 x1) = add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Im x1)) (mul_SNo (CSNo_Im x0) (CSNo_Re x1))).
Axiom Re_i : CSNo_Re Complex_i = 0.
Axiom Im_i : CSNo_Im Complex_i = 1.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom SNo_0 : SNo 0.
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Axiom SNo_1 : SNo 1.
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom mul_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo x1 (mul_SNo x0 x2)).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom Im_1 : CSNo_Im 1 = 0.
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Axiom SNo_mul_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (mul_SNo x0 (mul_SNo x1 x2))).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom CSNo_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (add_CSNo x0 x1)).
Axiom CSNo_minus_CSNo : (forall x0, CSNo x0 -> CSNo (minus_CSNo x0)).
Axiom SNo_CSNo : (forall x0, SNo x0 -> CSNo x0).
Theorem missingprop_0d97a0552c8901c8e5c1ff922af7643b21490c8f0cb217a138610332491bad62 : (forall x0, CSNo x0 -> (forall x1, SNo x1 -> mul_SNo (add_SNo (exp_SNo_nat (CSNo_Re x0) 2) (exp_SNo_nat (CSNo_Im x0) 2)) x1 = 1 -> mul_CSNo x0 (add_CSNo (mul_CSNo x1 (CSNo_Re x0)) (minus_CSNo (mul_CSNo Complex_i (mul_CSNo x1 (CSNo_Im x0))))) = 1)).
admit.
Qed.
Axiom missingprop_85a866d410bbf26b260c37246259122da00d151df84a9a2a98da7e65f3fcf36a : CSNo 0.
Axiom Re_0 : CSNo_Re 0 = 0.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom Im_0 : CSNo_Im 0 = 0.
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Theorem missingprop_47e45f255129e75796831cdfb6d067a2522bf40239ee47e1c11cb7d3d69ccf2c : (forall x0, CSNo x0 -> add_SNo (exp_SNo_nat (CSNo_Re x0) 2) (exp_SNo_nat (CSNo_Im x0) 2) = 0 -> x0 = 0).
admit.
Qed.
Axiom CSNo_Re2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Re (SNo_pair x0 x1) = x0).
Axiom CSNo_Im2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Im (SNo_pair x0 x1) = x1).
Axiom recip_SNo_invR : (forall x0, SNo x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> mul_SNo x0 (recip_SNo x0) = 1).
Axiom SNo_recip_SNo : (forall x0, SNo x0 -> SNo (recip_SNo x0)).
Theorem missingprop_60624b5a99770747095ea0f6821453458503484b58bf76604277214779563c53 : (forall x0, CSNo x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> mul_CSNo x0 (missingname_1e6ac5880283defc53d83863115a8fb4680f33c09c934d770c730b84316feaee x0) = 1).
admit.
Qed.
Theorem missingprop_f8a93434a65f4d79239aef8a16507c806f675f8adeb7c2d266d9d22d0659f005 : (forall x0, CSNo x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> mul_CSNo (missingname_1e6ac5880283defc53d83863115a8fb4680f33c09c934d770c730b84316feaee x0) x0 = 1).
admit.
Qed.
Theorem missingprop_7e109fe8a86bc772f947345bca731e46765cdd64b4b42e3642bf3487c4a64010 : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (missingname_7bb5946b3cdd85f919bea1cceb073b0a41168f14fcd953037b3d32bcbbb59e8f x0 x1)).
admit.
Qed.
Axiom missingprop_f134758f39278620c60cfac6676dbfce170f8cc0cce849e07ba3004e259a9bbb : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo (mul_CSNo x0 x1) x2).
Theorem missingprop_61f618358c6caba0be539f7d9823aaa498c1bb68a19c0266545b6a0ee0013f72 : (forall x0 x1, CSNo x0 -> CSNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> mul_CSNo (missingname_7bb5946b3cdd85f919bea1cceb073b0a41168f14fcd953037b3d32bcbbb59e8f x0 x1) x1 = x0).
admit.
Qed.
Theorem missingprop_cf3916cd43699a316fe8814dab2bc39272c455e50caf5bb441b5977b8d94ff47 : (forall x0 x1, CSNo x0 -> CSNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> mul_CSNo x1 (missingname_7bb5946b3cdd85f919bea1cceb073b0a41168f14fcd953037b3d32bcbbb59e8f x0 x1) = x0).
admit.
Qed.
(* Parameter complex "772e9c2d17c93514d9930b0a3a98a287703684d1fe782a98a34117d0e0ee0a9c" "66d2d10b199cf5a3b4dfb5713cc4133cfbc826169169bd617efe7895854be641" *)
Parameter complex : set.
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
Axiom complex_E : (forall x0, x0 :e complex -> (forall x1 : prop, (forall x2, x2 :e real -> (forall x3, x3 :e real -> x0 = SNo_pair x2 x3 -> x1)) -> x1)).
Axiom complex_I : (forall x0, x0 :e real -> (forall x1, x1 :e real -> SNo_pair x0 x1 :e complex)).
Axiom real_div_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> div_SNo x0 x1 :e real)).
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Axiom real_add_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_SNo x0 x1 :e real)).
Axiom real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
Axiom complex_Im_eq : (forall x0, x0 :e real -> (forall x1, x1 :e real -> CSNo_Im (SNo_pair x0 x1) = x1)).
Axiom complex_Re_eq : (forall x0, x0 :e real -> (forall x1, x1 :e real -> CSNo_Re (SNo_pair x0 x1) = x0)).
Axiom complex_CSNo : (forall x0, x0 :e complex -> CSNo x0).
Theorem missingprop_c1d2bb8e040b6263924ed736e04413cf61ed14375ccce29094d9146c796b5b0d : (forall x0, x0 :e complex -> missingname_1e6ac5880283defc53d83863115a8fb4680f33c09c934d770c730b84316feaee x0 :e complex).
admit.
Qed.
Axiom complex_mul_CSNo : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> mul_CSNo x0 x1 :e complex)).
Theorem missingprop_875489064c781ed99546c38240044a9d8c6e53840e6a6b443bb61f5406345f96 : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> missingname_7bb5946b3cdd85f919bea1cceb073b0a41168f14fcd953037b3d32bcbbb59e8f x0 x1 :e complex)).
admit.
Qed.
