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
(* Parameter nIn "2f8b7f287504f141b0f821928ac62823a377717763a224067702eee02fc1f359" "36808cca33f2b3819497d3a1f10fcc77486a0cddbcb304e44cbf2d818e181c3e" *)
Parameter nIn : set -> set -> prop.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom complex_tag_fresh : (forall x0, SNo x0 -> (forall x1, x1 :e x0 -> nIn (Sing 2) x1)).
(* Parameter pair_tag "48390061c2181aba77cfa1d5de61c61404ac9ae0a65b3484b17cdb949b4f84ea" "abc4d9a02036ca6bb03da383ad06177224b45cf7aa024b008a587b0088f0cb63" *)
Parameter pair_tag : set -> set -> set -> set.
Definition SNo_pair : set -> set -> set :=
 pair_tag (Sing 2).
Axiom SNo_pair_0 : (forall x0, forall x1 : set -> set -> prop, x1 (SNo_pair x0 0) x0 -> x1 x0 (SNo_pair x0 0)).
Axiom SNo_pair_prop_1 : (forall x0 x1 x2 x3, SNo x0 -> SNo x2 -> SNo_pair x0 x1 = SNo_pair x2 x3 -> x0 = x2).
Axiom SNo_pair_prop_2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo_pair x0 x1 = SNo_pair x2 x3 -> x1 = x3).
(* Parameter CD_carr "2ea55f9b30e95e7481941454eb68ac6de771c9b03bcefa870c619fd0530d5229" "0c2c093b916057b76c377fc735ca4f5cf43faac41dbd2d3dd614aec17be1e1ce" *)
Parameter CD_carr : set -> (set -> prop) -> set -> prop.
Definition CSNo : set -> prop :=
 CD_carr (Sing 2) SNo.
Axiom CSNo_I : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo (SNo_pair x0 x1)).
Axiom CSNo_E : (forall x0, CSNo x0 -> (forall x1 : set -> prop, (forall x2 x3, SNo x2 -> SNo x3 -> x0 = SNo_pair x2 x3 -> x1 (SNo_pair x2 x3)) -> x1 x0)).
Axiom SNo_CSNo : (forall x0, SNo x0 -> CSNo x0).
Axiom CSNo_0 : CSNo 0.
Axiom CSNo_1 : CSNo 1.
(* Parameter ExtendedSNoElt_ "627b29170033a45c17f9b7cf165882704d40149a015b16a52d2ed3cb336a754e" "13321a30acbf25801c5181ac29cb0ad10ff31a15e3555773b3104349704cbc7b" *)
Parameter ExtendedSNoElt_ : set -> set -> prop.
Axiom CSNo_ExtendedSNoElt_3 : (forall x0, CSNo x0 -> ExtendedSNoElt_ 3 x0).
Definition Complex_i : set :=
 SNo_pair 0 1.
(* Parameter CD_proj0 "0f0c33ee510e1a6616dae9740b87813905ab9c81cd7bba0430bb93ed78b7f32e" "e6d3c908403e809d0499044c6327107f48e159032f5d408db7c9a005219d76c5" *)
Parameter CD_proj0 : set -> (set -> prop) -> set -> set.
Definition CSNo_Re : set -> set :=
 CD_proj0 (Sing 2) SNo.
(* Parameter CD_proj1 "0e60a25c698581d33ab462b7d2f97fb3428f8ae674a065695d8fe89cdf0f35a2" "934eedf1ea050179b5169b28a60315fede0e4412cfff04a00c8c4a41e918fb4a" *)
Parameter CD_proj1 : set -> (set -> prop) -> set -> set.
Definition CSNo_Im : set -> set :=
 CD_proj1 (Sing 2) SNo.
Axiom CSNo_Re2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Re (SNo_pair x0 x1) = x0).
Axiom CSNo_Im2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Im (SNo_pair x0 x1) = x1).
Axiom CSNo_ReR : (forall x0, CSNo x0 -> SNo (CSNo_Re x0)).
Axiom CSNo_ImR : (forall x0, CSNo x0 -> SNo (CSNo_Im x0)).
Axiom CSNo_ReIm_split : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re x0 = CSNo_Re x1 -> CSNo_Im x0 = CSNo_Im x1 -> x0 = x1).
Definition CD_minus : set -> (set -> prop) -> (set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set -> set => fun x3 : set => pair_tag x0 (x2 (CD_proj0 x0 x1 x3)) (x2 (CD_proj1 x0 x1 x3))).
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition minus_CSNo : set -> set :=
 CD_minus (Sing 2) SNo minus_SNo.
(* Parameter CD_conj "ed5d3637676fc8f4658dd685e15ce9c2e389effe6e6ae21ea11cf574a73047aa" "b39bd24227d03dc1058ece41a05ced6e07fc86a368553c9e9cad9950e6962f94" *)
Parameter CD_conj : set -> (set -> prop) -> (set -> set) -> (set -> set) -> set -> set.
Definition conj_CSNo : set -> set :=
 CD_conj (Sing 2) SNo minus_SNo (fun x0 : set => x0).
Definition CD_add : set -> (set -> prop) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set -> set -> set => fun x3 x4 : set => pair_tag x0 (x2 (CD_proj0 x0 x1 x3) (CD_proj0 x0 x1 x4)) (x2 (CD_proj1 x0 x1 x3) (CD_proj1 x0 x1 x4))).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Definition add_CSNo : set -> set -> set :=
 CD_add (Sing 2) SNo add_SNo.
Definition CD_mul : set -> (set -> prop) -> (set -> set) -> (set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 x3 : set -> set => fun x4 x5 : set -> set -> set => fun x6 x7 : set => pair_tag x0 (x4 (x5 (CD_proj0 x0 x1 x6) (CD_proj0 x0 x1 x7)) (x2 (x5 (x3 (CD_proj1 x0 x1 x7)) (CD_proj1 x0 x1 x6)))) (x4 (x5 (CD_proj1 x0 x1 x7) (CD_proj0 x0 x1 x6)) (x5 (CD_proj1 x0 x1 x6) (x3 (CD_proj0 x0 x1 x7))))).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition mul_CSNo : set -> set -> set :=
 CD_mul (Sing 2) SNo minus_SNo (fun x0 : set => x0) add_SNo mul_SNo.
(* Parameter CD_exp_nat "2f68668d950ae4b31a36622c9395f9129a99cbaf960a62d9b333bff96e32521b" "7fdc79d0bbcb8e25212e6590e58e780616267925d89e75438662efe2e5f1651d" *)
Parameter CD_exp_nat : set -> (set -> prop) -> (set -> set) -> (set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
Definition exp_CSNo_nat : set -> set -> set :=
 CD_exp_nat (Sing 2) SNo minus_SNo (fun x0 : set => x0) add_SNo mul_SNo.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Definition abs_sqr_CSNo : set -> set :=
 (fun x0 : set => add_SNo (exp_SNo_nat (CSNo_Re x0) 2) (exp_SNo_nat (CSNo_Im x0) 2)).
(* Parameter recip_SNo "eb3c2afcb0fc017514672f7e4bb05a93fb8aa03fbeac55c207f299b0a6c23b32" "aa96a290f83ded9b33662ccb13b56cc27eb5c09a09b36ee3890691b04cc8386c" *)
Parameter recip_SNo : set -> set.
Definition div_SNo : set -> set -> set :=
 (fun x0 x1 : set => mul_SNo x0 (recip_SNo x1)).
Definition recip_CSNo : set -> set :=
 (fun x0 : set => SNo_pair (div_SNo (CSNo_Re x0) (abs_sqr_CSNo x0)) (minus_SNo (div_SNo (CSNo_Im x0) (abs_sqr_CSNo x0)))).
Definition div_CSNo : set -> set -> set :=
 (fun x0 x1 : set => mul_CSNo x0 (recip_CSNo x1)).
Axiom CSNo_Complex_i : CSNo Complex_i.
Axiom CSNo_minus_CSNo : (forall x0, CSNo x0 -> CSNo (minus_CSNo x0)).
Axiom minus_CSNo_CRe : (forall x0, CSNo x0 -> CSNo_Re (minus_CSNo x0) = minus_SNo (CSNo_Re x0)).
Axiom minus_CSNo_CIm : (forall x0, CSNo x0 -> CSNo_Im (minus_CSNo x0) = minus_SNo (CSNo_Im x0)).
Axiom CSNo_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (add_CSNo x0 x1)).
Axiom add_CSNo_CRe : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re (add_CSNo x0 x1) = add_SNo (CSNo_Re x0) (CSNo_Re x1)).
Axiom add_CSNo_CIm : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Im (add_CSNo x0 x1) = add_SNo (CSNo_Im x0) (CSNo_Im x1)).
Axiom CSNo_mul_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (mul_CSNo x0 x1)).
Axiom mul_CSNo_CRe : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re (mul_CSNo x0 x1) = add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Re x1)) (minus_SNo (mul_SNo (CSNo_Im x1) (CSNo_Im x0)))).
Axiom mul_CSNo_CIm : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Im (mul_CSNo x0 x1) = add_SNo (mul_SNo (CSNo_Im x1) (CSNo_Re x0)) (mul_SNo (CSNo_Im x0) (CSNo_Re x1))).
Axiom SNo_Re : (forall x0, SNo x0 -> CSNo_Re x0 = x0).
Axiom SNo_Im : (forall x0, SNo x0 -> CSNo_Im x0 = 0).
Axiom Re_0 : CSNo_Re 0 = 0.
Axiom Im_0 : CSNo_Im 0 = 0.
Axiom Re_1 : CSNo_Re 1 = 1.
Axiom Im_1 : CSNo_Im 1 = 0.
Axiom Re_i : CSNo_Re Complex_i = 0.
Axiom Im_i : CSNo_Im Complex_i = 1.
Axiom mul_CSNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> mul_CSNo x0 x1 = mul_SNo x0 x1).
Axiom mul_CSNo_1R : (forall x0, CSNo x0 -> mul_CSNo x0 1 = x0).
Axiom exp_CSNo_nat_2 : (forall x0, CSNo x0 -> exp_CSNo_nat x0 2 = mul_CSNo x0 x0).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom CSNo_exp_CSNo_nat : (forall x0, CSNo x0 -> (forall x1, nat_p x1 -> CSNo (exp_CSNo_nat x0 x1))).
Axiom mul_CSNo_com : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 x1 = mul_CSNo x1 x0).
Axiom mul_CSNo_assoc : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo (mul_CSNo x0 x1) x2).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNo_exp_SNo_nat : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> SNo (exp_SNo_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Theorem SNo_abs_sqr_CSNo : (forall x0, CSNo x0 -> SNo (abs_sqr_CSNo x0)).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom SNo_0 : SNo 0.
Axiom add_SNo_Le3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom exp_SNo_nat_2 : (forall x0, SNo x0 -> exp_SNo_nat x0 2 = mul_SNo x0 x0).
Axiom SNo_sqr_nonneg : (forall x0, SNo x0 -> SNoLe 0 (mul_SNo x0 x0)).
Theorem abs_sqr_CSNo_nonneg : (forall x0, CSNo x0 -> SNoLe 0 (abs_sqr_CSNo x0)).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNo_zero_or_sqr_pos' : (forall x0, SNo x0 -> or (x0 = 0) (SNoLt 0 (exp_SNo_nat x0 2))).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom SNo_sqr_nonneg' : (forall x0, SNo x0 -> SNoLe 0 (exp_SNo_nat x0 2)).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Theorem abs_sqr_CSNo_zero : (forall x0, CSNo x0 -> abs_sqr_CSNo x0 = 0 -> x0 = 0).
admit.
Qed.
Axiom SNo_div_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (div_SNo x0 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem CSNo_recip_CSNo : (forall x0, CSNo x0 -> CSNo (recip_CSNo x0)).
admit.
Qed.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Axiom SNo_1 : SNo 1.
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom mul_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo x1 (mul_SNo x0 x2)).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Axiom SNo_mul_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (mul_SNo x0 (mul_SNo x1 x2))).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem CSNo_relative_recip : (forall x0, CSNo x0 -> (forall x1, SNo x1 -> mul_SNo (add_SNo (exp_SNo_nat (CSNo_Re x0) 2) (exp_SNo_nat (CSNo_Im x0) 2)) x1 = 1 -> mul_CSNo x0 (add_CSNo (mul_CSNo x1 (CSNo_Re x0)) (minus_CSNo (mul_CSNo Complex_i (mul_CSNo x1 (CSNo_Im x0))))) = 1)).
admit.
Qed.
Axiom recip_SNo_invR : (forall x0, SNo x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> mul_SNo x0 (recip_SNo x0) = 1).
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom SNo_recip_SNo : (forall x0, SNo x0 -> SNo (recip_SNo x0)).
Theorem recip_CSNo_invR : (forall x0, CSNo x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> mul_CSNo x0 (recip_CSNo x0) = 1).
admit.
Qed.
Theorem recip_CSNo_invL : (forall x0, CSNo x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> mul_CSNo (recip_CSNo x0) x0 = 1).
admit.
Qed.
Theorem CSNo_div_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (div_CSNo x0 x1)).
admit.
Qed.
Theorem mul_div_CSNo_invL : (forall x0 x1, CSNo x0 -> CSNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> mul_CSNo (div_CSNo x0 x1) x1 = x0).
admit.
Qed.
Theorem mul_div_CSNo_invR : (forall x0 x1, CSNo x0 -> CSNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> mul_CSNo x1 (div_CSNo x0 x1) = x0).
admit.
Qed.
(* Parameter sqrt_SNo_nonneg "83d279e5aa419fbbd248d65c78365bc07f35773623616e9f2ff1cab03bb53e87" "71d15253c75b86e7fa4727323f2048ac8eeb6097cdf84c78a32c8477edd521d4" *)
Parameter sqrt_SNo_nonneg : set -> set.
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom pos_mul_SNo_Lt2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (mul_SNo x0 x1) (mul_SNo x2 x3)).
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (mul_SNo x0 x1)).
Axiom sqrt_SNo_nonneg_0 : sqrt_SNo_nonneg 0 = 0.
Axiom sqrt_SNo_nonneg_sqr : (forall x0, SNo x0 -> SNoLe 0 x0 -> mul_SNo (sqrt_SNo_nonneg x0) (sqrt_SNo_nonneg x0) = x0).
Axiom sqrt_SNo_nonneg_nonneg : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNoLe 0 (sqrt_SNo_nonneg x0)).
Axiom SNo_sqrt_SNo_nonneg : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNo (sqrt_SNo_nonneg x0)).
Theorem sqrt_SNo_nonneg_sqr_id : (forall x0, SNo x0 -> SNoLe 0 x0 -> sqrt_SNo_nonneg (exp_SNo_nat x0 2) = x0).
admit.
Qed.
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom nonneg_mul_SNo_Le2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (mul_SNo x0 x1) (mul_SNo x2 x3)).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Theorem sqrt_SNo_nonneg_mon_strict : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLt x0 x1 -> SNoLt (sqrt_SNo_nonneg x0) (sqrt_SNo_nonneg x1)).
admit.
Qed.
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Theorem sqrt_SNo_nonneg_mon : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe x0 x1 -> SNoLe (sqrt_SNo_nonneg x0) (sqrt_SNo_nonneg x1)).
admit.
Qed.
Axiom mul_SNo_nonneg_nonneg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe 0 (mul_SNo x0 x1)).
Axiom mul_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (mul_SNo x0 x1) (mul_SNo x2 x3) = mul_SNo (mul_SNo x0 x2) (mul_SNo x1 x3)).
Theorem sqrt_SNo_nonneg_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe 0 x1 -> sqrt_SNo_nonneg (mul_SNo x0 x1) = mul_SNo (sqrt_SNo_nonneg x0) (sqrt_SNo_nonneg x1)).
admit.
Qed.
Definition modulus_CSNo : set -> set :=
 (fun x0 : set => sqrt_SNo_nonneg (abs_sqr_CSNo x0)).
Theorem SNo_modulus_CSNo : (forall x0, CSNo x0 -> SNo (modulus_CSNo x0)).
admit.
Qed.
Theorem modulus_CSNo_nonneg : (forall x0, CSNo x0 -> SNoLe 0 (modulus_CSNo x0)).
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Definition sqrt_CSNo : set -> set :=
 (fun x0 : set => If_i (or (SNoLt (CSNo_Im x0) 0) (and (CSNo_Im x0 = 0) (SNoLt (CSNo_Re x0) 0))) (SNo_pair (sqrt_SNo_nonneg (mul_SNo (eps_ 1) (add_SNo (CSNo_Re x0) (modulus_CSNo x0)))) (minus_SNo (sqrt_SNo_nonneg (mul_SNo (eps_ 1) (add_SNo (minus_SNo (CSNo_Re x0)) (modulus_CSNo x0)))))) (SNo_pair (sqrt_SNo_nonneg (mul_SNo (eps_ 1) (add_SNo (CSNo_Re x0) (modulus_CSNo x0)))) (sqrt_SNo_nonneg (mul_SNo (eps_ 1) (add_SNo (minus_SNo (CSNo_Re x0)) (modulus_CSNo x0)))))).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom mul_SNo_minus_minus : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) (minus_SNo x1) = mul_SNo x0 x1).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom eps_1_half_eq1 : add_SNo (eps_ 1) (eps_ 1) = 1.
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Axiom SNo_foil : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (mul_SNo x0 x2) (add_SNo (mul_SNo x0 x3) (add_SNo (mul_SNo x1 x2) (mul_SNo x1 x3)))).
Axiom add_SNo_minus_L2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (minus_SNo x0) (add_SNo x0 x1) = x1).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom add_SNo_minus_Le2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (add_SNo x2 x1) x0 -> SNoLe x2 (add_SNo x0 (minus_SNo x1))).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_1 : nat_p 1.
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Theorem sqrt_CSNo_sqrt : (forall x0, CSNo x0 -> exp_CSNo_nat (sqrt_CSNo x0) 2 = x0).
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition complex : set :=
 {SNo_pair (ap x0 0) (ap x0 1) | x0 :e setprod real real}.
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Theorem complex_I : (forall x0, x0 :e real -> (forall x1, x1 :e real -> SNo_pair x0 x1 :e complex)).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem complex_E : (forall x0, x0 :e complex -> (forall x1 : prop, (forall x2, x2 :e real -> (forall x3, x3 :e real -> x0 = SNo_pair x2 x3 -> x1)) -> x1)).
admit.
Qed.
Axiom real_SNo : (forall x0, x0 :e real -> SNo x0).
Theorem complex_CSNo : (forall x0, x0 :e complex -> CSNo x0).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom real_0 : 0 :e real.
Theorem real_complex : real c= complex.
admit.
Qed.
Theorem complex_0 : 0 :e complex.
admit.
Qed.
Axiom real_1 : 1 :e real.
Theorem complex_1 : 1 :e complex.
admit.
Qed.
Theorem complex_i : Complex_i :e complex.
admit.
Qed.
Theorem complex_Re_eq : (forall x0, x0 :e real -> (forall x1, x1 :e real -> CSNo_Re (SNo_pair x0 x1) = x0)).
admit.
Qed.
Theorem complex_Im_eq : (forall x0, x0 :e real -> (forall x1, x1 :e real -> CSNo_Im (SNo_pair x0 x1) = x1)).
admit.
Qed.
Theorem complex_Re_real : (forall x0, x0 :e complex -> CSNo_Re x0 :e real).
admit.
Qed.
Theorem complex_Im_real : (forall x0, x0 :e complex -> CSNo_Im x0 :e real).
admit.
Qed.
Theorem complex_ReIm_split : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> CSNo_Re x0 = CSNo_Re x1 -> CSNo_Im x0 = CSNo_Im x1 -> x0 = x1)).
admit.
Qed.
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Theorem complex_minus_CSNo : (forall x0, x0 :e complex -> minus_CSNo x0 :e complex).
admit.
Qed.
Axiom real_add_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_SNo x0 x1 :e real)).
Theorem complex_add_CSNo : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> add_CSNo x0 x1 :e complex)).
admit.
Qed.
Axiom real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
Theorem complex_mul_CSNo : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> mul_CSNo x0 x1 :e complex)).
admit.
Qed.
Theorem real_Re_eq : (forall x0, x0 :e real -> CSNo_Re x0 = x0).
admit.
Qed.
Theorem real_Im_eq : (forall x0, x0 :e real -> CSNo_Im x0 = 0).
admit.
Qed.
Theorem mul_i_real_eq : (forall x0, x0 :e real -> mul_CSNo Complex_i x0 = SNo_pair 0 x0).
admit.
Qed.
Theorem real_Re_i_eq : (forall x0, x0 :e real -> CSNo_Re (mul_CSNo Complex_i x0) = 0).
admit.
Qed.
Theorem real_Im_i_eq : (forall x0, x0 :e real -> CSNo_Im (mul_CSNo Complex_i x0) = x0).
admit.
Qed.
Theorem complex_eta : (forall x0, x0 :e complex -> x0 = add_CSNo (CSNo_Re x0) (mul_CSNo Complex_i (CSNo_Im x0))).
admit.
Qed.
Axiom real_div_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> div_SNo x0 x1 :e real)).
Theorem complex_recip_CSNo : (forall x0, x0 :e complex -> recip_CSNo x0 :e complex).
admit.
Qed.
Theorem complex_div_CSNo : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> div_CSNo x0 x1 :e complex)).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Theorem complex_real_set_eq : real = Sep complex (fun x1 : set => forall x2 : set -> set -> prop, x2 (CSNo_Re x1) x1 -> x2 x1 (CSNo_Re x1)).
admit.
Qed.
