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
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom ordinal_SNo : (forall x0, ordinal x0 -> SNo x0).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom add_SNo_ordinal_SL : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> add_SNo (ordsucc x0) x1 = ordsucc (add_SNo x0 x1))).
Axiom ordinal_Empty : ordinal 0.
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNo_1 : SNo 1.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Theorem mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter minus_CSNo "d91e2c13ce03095e08eaa749eebd7a4fa45c5e1306e8ce1c6df365704d44867f" "9c138ddc19cc32bbd65aed7e98ca568d6cf11af8ab01e026a5986579061198b7" *)
Parameter minus_CSNo : set -> set.
Definition int_alt1 : set :=
 binunion omega (Repl omega minus_CSNo).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom minus_SNo_minus_CSNo : (forall x0, SNo x0 -> minus_SNo x0 = minus_CSNo x0).
Theorem missingprop_2504c05a08587fe0873ed45685efc417625f0a904281d653d757d643896f9a70 : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int_alt1 -> x0 x1)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Theorem missingprop_c213ff287d87049b1e6a47a232f87c366800922741a9eeadb1d3ac2fbadaf052 : omega c= int_alt1.
admit.
Qed.
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem missingprop_a66fb27a7b2af57722c6537d3983b55a12cc28475f1d8b8d9bdb1d857010e7af : (forall x0, x0 :e omega -> minus_SNo x0 :e int_alt1).
admit.
Qed.
Theorem ordinal_ordsucc_SNo_eq : (forall x0, ordinal x0 -> ordsucc x0 = add_SNo 1 x0).
admit.
Qed.
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom add_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x1 (add_SNo x0 x2)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom nat_1 : nat_p 1.
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom add_SNo_minus_SNo_prop2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 (add_SNo (minus_SNo x0) x1) = x1).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Theorem missingprop_6c976be5ae7c4eec61e1190f4b65a1cc39ebfb81542ae63578b69be42c01a06a : (forall x0, x0 :e omega -> (forall x1, nat_p x1 -> add_SNo (minus_SNo x0) x1 :e int_alt1)).
admit.
Qed.
Axiom add_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_SNo x0 x1 :e omega)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Theorem missingprop_02609f82bf442d61fb8c6410818e7e4cbf8c67c9ea08bffcbf8a77c06b0f784a : (forall x0, x0 :e int_alt1 -> (forall x1, x1 :e int_alt1 -> add_SNo x0 x1 :e int_alt1)).
admit.
Qed.
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Theorem missingprop_66d7a7b7f8768657be1ea35e52473cc5e1846e635153a280e3783a8275062773 : (forall x0, x0 :e int_alt1 -> minus_SNo x0 :e int_alt1).
admit.
Qed.
Theorem mul_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_SNo x0 x1 :e omega)).
admit.
Qed.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem missingprop_3f000c087708670f2a9497d0587231f65beb85593b7ebdaf7909fe5e7d4b8c27 : (forall x0, x0 :e int_alt1 -> (forall x1, x1 :e int_alt1 -> mul_SNo x0 x1 :e int_alt1)).
admit.
Qed.
(* Parameter SNo_pair "42f58f2a7ea537e615b65875895df2f1fc42b140b7652f8ea8e9c6893053be73" "0c801be26da5c0527e04f5b1962551a552dab2d2643327b86105925953cf3b06" *)
Parameter SNo_pair : set -> set -> set.
(* Parameter CSNo_Re "1be0cda46d38c27e57488fdb9a2e54ccd2b8f9c133cbfc27af57bf54206ada12" "9481cf9deb6efcbb12eccc74f82acf453997c8e75adb5cd83311956bcc85d828" *)
Parameter CSNo_Re : set -> set.
(* Parameter CSNo_Im "8bf86a17c9a6ce157ed3de4762edc8cbee3acc11e18b41f458f34ca9d1983803" "5dad3f55c3f3177e2d18188b94536551b7bfd38a80850f4314ba8abb3fd78138" *)
Parameter CSNo_Im : set -> set.
Definition mul_CSNo : set -> set -> set :=
 (fun x0 x1 : set => SNo_pair (add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Re x1)) (minus_SNo (mul_SNo (CSNo_Im x0) (CSNo_Im x1)))) (add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Im x1)) (mul_SNo (CSNo_Im x0) (CSNo_Re x1)))).
Axiom SNo_Re : (forall x0, SNo x0 -> CSNo_Re x0 = x0).
Axiom SNo_pair_0 : (forall x0, forall x1 : set -> set -> prop, x1 (SNo_pair x0 0) x0 -> x1 x0 (SNo_pair x0 0)).
Axiom SNo_Im : (forall x0, SNo x0 -> CSNo_Im x0 = 0).
Axiom SNo_0 : SNo 0.
Theorem missingprop_e8fe572c395c46aa7a6d67f7a8cd850bf647261d6b3677aecbf3b7ddfa5a7193 : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_CSNo x0 x1).
admit.
Qed.
Axiom add_SNo_rotate_4_1 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo x0 (add_SNo x1 (add_SNo x2 x3)) = add_SNo x3 (add_SNo x0 (add_SNo x1 x2))).
Axiom SNo_add_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (add_SNo x0 (add_SNo x1 x2))).
Theorem add_SNo_rotate_5_1 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> add_SNo x0 (add_SNo x1 (add_SNo x2 (add_SNo x3 x4))) = add_SNo x4 (add_SNo x0 (add_SNo x1 (add_SNo x2 x3)))).
admit.
Qed.
Theorem add_SNo_rotate_5_2 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> add_SNo x0 (add_SNo x1 (add_SNo x2 (add_SNo x3 x4))) = add_SNo x3 (add_SNo x4 (add_SNo x0 (add_SNo x1 x2)))).
admit.
Qed.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom SNoL_SNoS : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> x1 :e SNoS_ (SNoLev x0))).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom SNoR_SNoS : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> x1 :e SNoS_ (SNoLev x0))).
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom add_SNo_minus_Lt1b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x0 x1) (add_SNo x3 x2) -> SNoLt (add_SNo x0 (add_SNo x1 (minus_SNo x2))) x3).
Axiom add_SNo_Lt1_cancel : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1) -> SNoLt x0 x2).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom SNo_add_SNo_4 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo (add_SNo x0 (add_SNo x1 (add_SNo x2 x3)))).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Theorem mul_SNo_assoc_lem1 : (forall x0 : set -> set -> set, (forall x1 x2, SNo x1 -> SNo x2 -> SNo (x0 x1 x2)) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> x0 x1 (add_SNo x2 x3) = add_SNo (x0 x1 x2) (x0 x1 x3)) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> x0 (add_SNo x1 x2) x3 = add_SNo (x0 x1 x3) (x0 x2 x3)) -> (forall x1 x2, SNo x1 -> SNo x2 -> (forall x3, x3 :e SNoL (x0 x1 x2) -> (forall x4 : prop, (forall x5, x5 :e SNoL x1 -> (forall x6, x6 :e SNoL x2 -> SNoLe (add_SNo x3 (x0 x5 x6)) (add_SNo (x0 x5 x2) (x0 x1 x6)) -> x4)) -> (forall x5, x5 :e SNoR x1 -> (forall x6, x6 :e SNoR x2 -> SNoLe (add_SNo x3 (x0 x5 x6)) (add_SNo (x0 x5 x2) (x0 x1 x6)) -> x4)) -> x4))) -> (forall x1 x2, SNo x1 -> SNo x2 -> (forall x3, x3 :e SNoR (x0 x1 x2) -> (forall x4 : prop, (forall x5, x5 :e SNoL x1 -> (forall x6, x6 :e SNoR x2 -> SNoLe (add_SNo (x0 x5 x2) (x0 x1 x6)) (add_SNo x3 (x0 x5 x6)) -> x4)) -> (forall x5, x5 :e SNoR x1 -> (forall x6, x6 :e SNoL x2 -> SNoLe (add_SNo (x0 x5 x2) (x0 x1 x6)) (add_SNo x3 (x0 x5 x6)) -> x4)) -> x4))) -> (forall x1 x2 x3 x4, SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNoLt x3 x1 -> SNoLt x4 x2 -> SNoLt (add_SNo (x0 x3 x2) (x0 x1 x4)) (add_SNo (x0 x1 x2) (x0 x3 x4))) -> (forall x1 x2 x3 x4, SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNoLe x3 x1 -> SNoLe x4 x2 -> SNoLe (add_SNo (x0 x3 x2) (x0 x1 x4)) (add_SNo (x0 x1 x2) (x0 x3 x4))) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> x0 x4 (x0 x2 x3) = x0 (x0 x4 x2) x3) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> x0 x1 (x0 x4 x3) = x0 (x0 x1 x4) x3) -> (forall x4, x4 :e SNoS_ (SNoLev x3) -> x0 x1 (x0 x2 x4) = x0 (x0 x1 x2) x4) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> x0 x4 (x0 x5 x3) = x0 (x0 x4 x5) x3)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x4 (x0 x2 x5) = x0 (x0 x4 x2) x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x1 (x0 x4 x5) = x0 (x0 x1 x4) x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> (forall x6, x6 :e SNoS_ (SNoLev x3) -> x0 x4 (x0 x5 x6) = x0 (x0 x4 x5) x6))) -> (forall x4, (forall x5, x5 :e x4 -> (forall x6 : prop, (forall x7, x7 :e SNoL x1 -> (forall x8, x8 :e SNoL (x0 x2 x3) -> x5 = add_SNo (x0 x7 (x0 x2 x3)) (add_SNo (x0 x1 x8) (minus_SNo (x0 x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x1 -> (forall x8, x8 :e SNoR (x0 x2 x3) -> x5 = add_SNo (x0 x7 (x0 x2 x3)) (add_SNo (x0 x1 x8) (minus_SNo (x0 x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e x4 -> SNoLt x5 (x0 (x0 x1 x2) x3))))).
admit.
Qed.
Axiom add_SNo_minus_Lt2b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x3 x2) (add_SNo x0 x1) -> SNoLt x3 (add_SNo x0 (add_SNo x1 (minus_SNo x2)))).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Theorem mul_SNo_assoc_lem2 : (forall x0 : set -> set -> set, (forall x1 x2, SNo x1 -> SNo x2 -> SNo (x0 x1 x2)) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> x0 x1 (add_SNo x2 x3) = add_SNo (x0 x1 x2) (x0 x1 x3)) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> x0 (add_SNo x1 x2) x3 = add_SNo (x0 x1 x3) (x0 x2 x3)) -> (forall x1 x2, SNo x1 -> SNo x2 -> (forall x3, x3 :e SNoL (x0 x1 x2) -> (forall x4 : prop, (forall x5, x5 :e SNoL x1 -> (forall x6, x6 :e SNoL x2 -> SNoLe (add_SNo x3 (x0 x5 x6)) (add_SNo (x0 x5 x2) (x0 x1 x6)) -> x4)) -> (forall x5, x5 :e SNoR x1 -> (forall x6, x6 :e SNoR x2 -> SNoLe (add_SNo x3 (x0 x5 x6)) (add_SNo (x0 x5 x2) (x0 x1 x6)) -> x4)) -> x4))) -> (forall x1 x2, SNo x1 -> SNo x2 -> (forall x3, x3 :e SNoR (x0 x1 x2) -> (forall x4 : prop, (forall x5, x5 :e SNoL x1 -> (forall x6, x6 :e SNoR x2 -> SNoLe (add_SNo (x0 x5 x2) (x0 x1 x6)) (add_SNo x3 (x0 x5 x6)) -> x4)) -> (forall x5, x5 :e SNoR x1 -> (forall x6, x6 :e SNoL x2 -> SNoLe (add_SNo (x0 x5 x2) (x0 x1 x6)) (add_SNo x3 (x0 x5 x6)) -> x4)) -> x4))) -> (forall x1 x2 x3 x4, SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNoLt x3 x1 -> SNoLt x4 x2 -> SNoLt (add_SNo (x0 x3 x2) (x0 x1 x4)) (add_SNo (x0 x1 x2) (x0 x3 x4))) -> (forall x1 x2 x3 x4, SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNoLe x3 x1 -> SNoLe x4 x2 -> SNoLe (add_SNo (x0 x3 x2) (x0 x1 x4)) (add_SNo (x0 x1 x2) (x0 x3 x4))) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> x0 x4 (x0 x2 x3) = x0 (x0 x4 x2) x3) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> x0 x1 (x0 x4 x3) = x0 (x0 x1 x4) x3) -> (forall x4, x4 :e SNoS_ (SNoLev x3) -> x0 x1 (x0 x2 x4) = x0 (x0 x1 x2) x4) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> x0 x4 (x0 x5 x3) = x0 (x0 x4 x5) x3)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x4 (x0 x2 x5) = x0 (x0 x4 x2) x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x1 (x0 x4 x5) = x0 (x0 x1 x4) x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> (forall x6, x6 :e SNoS_ (SNoLev x3) -> x0 x4 (x0 x5 x6) = x0 (x0 x4 x5) x6))) -> (forall x4, (forall x5, x5 :e x4 -> (forall x6 : prop, (forall x7, x7 :e SNoL x1 -> (forall x8, x8 :e SNoR (x0 x2 x3) -> x5 = add_SNo (x0 x7 (x0 x2 x3)) (add_SNo (x0 x1 x8) (minus_SNo (x0 x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x1 -> (forall x8, x8 :e SNoL (x0 x2 x3) -> x5 = add_SNo (x0 x7 (x0 x2 x3)) (add_SNo (x0 x1 x8) (minus_SNo (x0 x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e x4 -> SNoLt (x0 (x0 x1 x2) x3) x5)))).
admit.
Qed.
Axiom SNoLev_ind3 : (forall x0 : set -> set -> set -> prop, (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> x0 x4 x2 x3) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> x0 x1 x4 x3) -> (forall x4, x4 :e SNoS_ (SNoLev x3) -> x0 x1 x2 x4) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> x0 x4 x5 x3)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x4 x2 x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x1 x4 x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> (forall x6, x6 :e SNoS_ (SNoLev x3) -> x0 x4 x5 x6))) -> x0 x1 x2 x3) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> x0 x1 x2 x3)).
(* Parameter SNoCutP "b102ccc5bf572aba76b2c5ff3851795ba59cb16151277dbee9ce5a1aad694334" "c083d829a4633f1bc9aeab80859255a8d126d7c6824bf5fd520d6daabfbbe976" *)
Parameter SNoCutP : set -> set -> prop.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
Axiom mul_SNo_eq_3 : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (forall x3 x4, SNoCutP x3 x4 -> (forall x5, x5 :e x3 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e x4 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> mul_SNo x0 x1 = SNoCut x3 x4 -> x2) -> x2)).
Axiom SNoCut_ext : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x1 -> SNoLt (SNoCut x2 x3) x4) -> (forall x4, x4 :e x2 -> SNoLt x4 (SNoCut x0 x1)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoCut x0 x1 = SNoCut x2 x3).
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom mul_SNo_SNoL_interpolate_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoL (mul_SNo x0 x1) -> (forall x3 : prop, (forall x4, x4 :e SNoL x0 -> (forall x5, x5 :e SNoL x1 -> SNoLe (add_SNo x2 (mul_SNo x4 x5)) (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) -> x3)) -> (forall x4, x4 :e SNoR x0 -> (forall x5, x5 :e SNoR x1 -> SNoLe (add_SNo x2 (mul_SNo x4 x5)) (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) -> x3)) -> x3))).
Axiom mul_SNo_SNoR_interpolate_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoR (mul_SNo x0 x1) -> (forall x3 : prop, (forall x4, x4 :e SNoL x0 -> (forall x5, x5 :e SNoR x1 -> SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) (add_SNo x2 (mul_SNo x4 x5)) -> x3)) -> (forall x4, x4 :e SNoR x0 -> (forall x5, x5 :e SNoL x1 -> SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) (add_SNo x2 (mul_SNo x4 x5)) -> x3)) -> x3))).
Axiom mul_SNo_Lt : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x2 x0 -> SNoLt x3 x1 -> SNoLt (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
Axiom mul_SNo_Le : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x2 x0 -> SNoLe x3 x1 -> SNoLe (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
Theorem mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
admit.
Qed.
