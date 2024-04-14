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
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_SNo : (forall x0, ordinal x0 -> SNo x0).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Theorem nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem omega_SNo : (forall x0, x0 :e omega -> SNo x0).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter minus_CSNo "d91e2c13ce03095e08eaa749eebd7a4fa45c5e1306e8ce1c6df365704d44867f" "9c138ddc19cc32bbd65aed7e98ca568d6cf11af8ab01e026a5986579061198b7" *)
Parameter minus_CSNo : set -> set.
Definition int_alt1 : set :=
 binunion omega (Repl omega minus_CSNo).
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom missingprop_2504c05a08587fe0873ed45685efc417625f0a904281d653d757d643896f9a70 : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int_alt1 -> x0 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem missingprop_21e78e4ab287a999eff678dc5fdcb4fe6daaa47d39850e6dedc392cb88159c27 : (forall x0, x0 :e int_alt1 -> SNo x0).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_0 : SNo 0.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordinal_Subq_SNoLe : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoLe x0 x1).
Axiom ordinal_Empty : ordinal 0.
Axiom Subq_Empty : (forall x0, 0 c= x0).
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Theorem nonpos_nonneg_0 : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> x0 = minus_SNo x1 -> and (x0 = 0) (x1 = 0))).
admit.
Qed.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Theorem mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom add_SNo_minus_R2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 x1) (minus_SNo x1) = x0).
Theorem add_SNo_minus_R2' : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 (minus_SNo x1)) x1 = x0).
admit.
Qed.
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Theorem add_SNo_minus_L2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (minus_SNo x0) (add_SNo x0 x1) = x1).
admit.
Qed.
Theorem add_SNo_minus_SNo_prop2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 (add_SNo (minus_SNo x0) x1) = x1).
admit.
Qed.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Definition missingname_5ddeddad41440f383a16cfc8383ec9460789fb3cfa98ab1d776b6ffd3724c29d : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (and (x0 :e omega) (x1 :e omega)) (x2 :e setminus omega 1)) (or (forall x3 : prop, (forall x4, and (x4 :e omega) (add_SNo x0 (mul_SNo x4 x2) = x1) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e omega) (add_SNo x1 (mul_SNo x4 x2) = x0) -> x3) -> x3))).
Definition divides_int_alt1 : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e int_alt1) (x1 :e int_alt1)) (forall x2 : prop, (forall x3, and (x3 :e int_alt1) (mul_SNo x0 x3 = x1) -> x2) -> x2)).
Definition missingname_204ad52cabbe4675636421d1481695b86daeb768902254898efb0a6889a98848 : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (and (x0 :e int_alt1) (x1 :e int_alt1)) (x2 :e setminus omega 1)) (divides_int_alt1 x2 (add_SNo x0 (minus_SNo x1)))).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Theorem missingprop_28d247415f1c7ed197c5b3921d407caa1ec338b02ea0677564d53f2a37c403d7 : (forall x0 : set -> prop, x0 0 -> (forall x1, x1 :e setminus omega 1 -> x0 x1) -> (forall x1, x1 :e setminus omega 1 -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int_alt1 -> x0 x1)).
admit.
Qed.
Theorem missingprop_225f9ba100c65562995fe593ddb461b48a9445cbc97ff02979ace15116ef9330 : (forall x0, x0 :e int_alt1 -> (forall x1 : prop, (x0 = 0 -> x1) -> (x0 :e setminus omega 1 -> x1) -> (forall x2, x2 :e setminus omega 1 -> x0 = minus_SNo x2 -> x1) -> x1)).
admit.
Qed.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Definition divides_nat : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e omega) (x1 :e omega)) (forall x2 : prop, (forall x3, and (x3 :e omega) (mul_nat x0 x3 = x1) -> x2) -> x2)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom missingprop_c213ff287d87049b1e6a47a232f87c366800922741a9eeadb1d3ac2fbadaf052 : omega c= int_alt1.
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Theorem missingprop_e53fc57e99eabca8b8e8c368b05a0490ce055ed8f71f4da2136aafa03e99b460 : (forall x0 x1, divides_nat x0 x1 -> divides_int_alt1 x0 x1).
admit.
Qed.
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_0 : nat_p 0.
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom minus_SNo_minus_CSNo : (forall x0, SNo x0 -> minus_SNo x0 = minus_CSNo x0).
Axiom mul_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_SNo x0 x1 :e omega)).
Theorem missingprop_c9c36883e1bc2d8bed3fd5dc85072c7e932e4427b6b65effb58ba8e6a414fb93 : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> divides_int_alt1 x0 x1 -> divides_nat x0 x1)).
admit.
Qed.
Definition coprime_nat : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e omega) (x1 :e omega)) (forall x2, x2 :e setminus omega 1 -> divides_nat x2 x0 -> divides_nat x2 x1 -> x2 = 1)).
Definition missingname_48ca77268e35362c65956d7fd4145d07598e7a91e7ef4a1e6af043bc1202b37f : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e int_alt1) (x1 :e int_alt1)) (forall x2, x2 :e setminus omega 1 -> divides_int_alt1 x2 x0 -> divides_int_alt1 x2 x1 -> x2 = 1)).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem missingprop_cd4a0e86a7240c910ba6e418a2c3c79dd88f60c46bcab79eba88a1b667750c47 : (forall x0 x1, coprime_nat x0 x1 -> missingname_48ca77268e35362c65956d7fd4145d07598e7a91e7ef4a1e6af043bc1202b37f x0 x1).
admit.
Qed.
Theorem missingprop_3d62234b49b0e4bfe7a13c887f0815e06d232acc181b4d57a355d1fe7e263b85 : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> missingname_48ca77268e35362c65956d7fd4145d07598e7a91e7ef4a1e6af043bc1202b37f x0 x1 -> coprime_nat x0 x1)).
admit.
Qed.
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom missingprop_02609f82bf442d61fb8c6410818e7e4cbf8c67c9ea08bffcbf8a77c06b0f784a : (forall x0, x0 :e int_alt1 -> (forall x1, x1 :e int_alt1 -> add_SNo x0 x1 :e int_alt1)).
Axiom missingprop_66d7a7b7f8768657be1ea35e52473cc5e1846e635153a280e3783a8275062773 : (forall x0, x0 :e int_alt1 -> minus_SNo x0 :e int_alt1).
Axiom missingprop_a66fb27a7b2af57722c6537d3983b55a12cc28475f1d8b8d9bdb1d857010e7af : (forall x0, x0 :e omega -> minus_SNo x0 :e int_alt1).
Axiom add_SNo_cancel_R : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 x1 = add_SNo x2 x1 -> x0 = x2).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem missingprop_b50ef14c9262eb5436677f5e9ac5842c89ca53157192d0ccc86f2030ddee298d : (forall x0 x1 x2, missingname_5ddeddad41440f383a16cfc8383ec9460789fb3cfa98ab1d776b6ffd3724c29d x0 x1 x2 -> missingname_204ad52cabbe4675636421d1481695b86daeb768902254898efb0a6889a98848 x0 x1 x2).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_cc04962dbc8c6d548990c2bf35b09d0b7404c11f3bebccf03d1eb6c69c77d8dc : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> (forall x2, missingname_204ad52cabbe4675636421d1481695b86daeb768902254898efb0a6889a98848 x0 x1 x2 -> missingname_5ddeddad41440f383a16cfc8383ec9460789fb3cfa98ab1d776b6ffd3724c29d x0 x1 x2))).
admit.
Qed.
