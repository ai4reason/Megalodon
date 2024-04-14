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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Definition divides_nat : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e omega) (x1 :e omega)) (forall x2 : prop, (forall x3, and (x3 :e omega) (mul_nat x0 x3 = x1) -> x2) -> x2)).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom missingprop_4f580385494c3bb0b65abf1bcb00277688faff94da8eb184b6015c42d53d3c52 : (forall x0, nat_p x0 -> (forall x1 x2, divides_nat x0 x1 -> divides_nat x0 x2 -> divides_nat x0 (add_SNo x1 x2))).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem missingprop_a32fb45428c9c33bd4262577ea43fa0bb55100cdc8dce2a3eb1524d4776630a8 : (forall x0 x1 x2 x3, divides_nat x0 x1 -> divides_nat x0 x2 -> divides_nat x0 x3 -> divides_nat x0 (add_SNo x1 (add_SNo x2 x3))).
admit.
Qed.
Theorem missingprop_4337955706192e18d86315b6623efda6ba2892995a20d7198d29d5fd3c1f6b15 : (forall x0 x1 x2 x3 x4, divides_nat x0 x1 -> divides_nat x0 x2 -> divides_nat x0 x3 -> divides_nat x0 x4 -> divides_nat x0 (add_SNo x1 (add_SNo x2 (add_SNo x3 x4)))).
admit.
Qed.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom mul_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_SNo x0 x1 :e omega)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom mul_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (mul_SNo x0 x1) (mul_SNo x2 x3) = mul_SNo (mul_SNo x0 x2) (mul_SNo x1 x3)).
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Theorem missingprop_248e62429ee041b1b0c95ce5b113a9a2ae590754133296285bbadfbd86cd4fc0 : (forall x0 x1 x2 x3, divides_nat x0 x2 -> divides_nat x1 x3 -> divides_nat (mul_SNo x0 x1) (mul_SNo x2 x3)).
admit.
Qed.
(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.
Definition missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e int) (x1 :e int)) (forall x2 : prop, (forall x3, and (x3 :e int) (mul_SNo x0 x3 = x1) -> x2) -> x2)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_p_int : (forall x0, nat_p x0 -> x0 :e int).
Axiom nat_1 : nat_p 1.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom int_SNo : (forall x0, x0 :e int -> SNo x0).
Theorem missingprop_6f5bb9f62c2e8528e2de85cd93a6dd7f7c02c981ae91d7d9ca2f24bf2b336daf : (forall x0, x0 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x0).
admit.
Qed.
Axiom nat_0 : nat_p 0.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Theorem missingprop_f1256b5686a5d04d5080056c62ec6bbc067e4e65bec44411ce01120f27f246d9 : (forall x0, x0 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 0).
admit.
Qed.
Axiom int_add_SNo : (forall x0, x0 :e int -> (forall x1, x1 :e int -> add_SNo x0 x1 :e int)).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem missingprop_8466f3888c9dffc179428cd664baffd365119181aa844a56adbda5e4fdcb2abd : (forall x0 x1 x2, missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x2 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 x2)).
admit.
Qed.
Theorem missingprop_6785195de72b8bb9f69b7f80c2365be62c07feb5f370a81728166f979d12d8a1 : (forall x0 x1 x2 x3, missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x2 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x3 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 (add_SNo x2 x3))).
admit.
Qed.
Theorem missingprop_f5bda85f3a41a44bf4b8cf9907ca24fee28834747776a6a6f4e4f098bc1b677f : (forall x0 x1 x2 x3 x4, missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x2 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x3 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x4 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 (add_SNo x2 (add_SNo x3 x4)))).
admit.
Qed.
Axiom int_mul_SNo : (forall x0, x0 :e int -> (forall x1, x1 :e int -> mul_SNo x0 x1 :e int)).
Theorem missingprop_6a57ce326930b71959c6e42873608c45ab1407b0c1043ac32218acb27d4cfdd6 : (forall x0 x1 x2 x3, missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x2 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x1 x3 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 (mul_SNo x0 x1) (mul_SNo x2 x3)).
admit.
Qed.
Theorem missingprop_c2b8d5ad97d36c7091f177e077a896721a2c3974bd49b27a4035bd27f9dbbcf4 : (forall x0 x1, divides_nat x0 x1 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom SNo_0 : SNo 0.
Axiom missingprop_72fc13f59561a486e7f04b4e6ad6c40ec1d48eeac6e68c47cb50fa618c19e933 : (forall x0, nat_p x0 -> SNoLe 0 x0).
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom int_SNo_cases : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int -> x0 x1)).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_inv_impred : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_ordsucc_SNo_eq : (forall x0, ordinal x0 -> ordsucc x0 = add_SNo 1 x0).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom SNo_1 : SNo 1.
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom mul_SNo_nonneg_nonneg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe 0 (mul_SNo x0 x1)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom missingprop_94b9b73b1207350973a964cfd79fac000c8d717e12b3149994867d613d318c69 : (forall x0, nat_p x0 -> divides_nat x0 0).
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Theorem missingprop_57df2013083178ada5d0f980a1ec12aac081132b62848eaeff1b3d2d56546865 : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1 -> divides_nat x0 x1)).
admit.
Qed.
Axiom int_minus_SNo : (forall x0, x0 :e int -> minus_SNo x0 :e int).
Theorem missingprop_28e67df4d056ae23885d484c7564a6fa3e77105cf9d0eee46420f1848b41430d : (forall x0 x1, missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (minus_SNo x1)).
admit.
Qed.
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Theorem missingprop_41401b1ecc1605c1630a390e8c6a927033789fce3e6d5ad96a192345f1b3dbae : (forall x0 x1, SNo x1 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (minus_SNo x1) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1).
admit.
Qed.
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Theorem missingprop_150caf3fa1b7041ee0cccc2bc692183c5e26643505c73714e2a4b2ea92b7370f : (forall x0 x1, x1 :e int -> (forall x2, x2 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 (minus_SNo x2)) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x2 (minus_SNo x1)))).
admit.
Qed.
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Theorem missingprop_20289098f6c25efd738bc6328dcd12bfe7c759915539f8e67ebaf97e303f1d98 : (forall x0 x1 x2, x2 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (mul_SNo x1 x2)).
admit.
Qed.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Theorem missingprop_08581b37fd6d8550dc5fcf171cf6e425e78996329027691359c131e8ee94e8c3 : (forall x0 x1 x2, x2 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (mul_SNo x2 x1)).
admit.
Qed.
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Theorem missingprop_2cd97d117b5bb8e45ac7fffe272a930a4723ac914d9731b31958b36423911c43 : (forall x0 x1, x1 :e int -> (forall x2, x2 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 (minus_SNo x2)) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo (mul_SNo x1 x1) (minus_SNo (mul_SNo x2 x2))))).
admit.
Qed.
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Theorem missingprop_82d8b16cbabe15f33566315da037f391b292861be9631cc7d9815c42bac38696 : (forall x0 x1, x1 :e int -> (forall x2, x2 :e int -> (forall x3, x3 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 (minus_SNo x2)) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x2 x3) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 x3)))).
admit.
Qed.
Theorem missingprop_61887ed89638f3e8ae2bf6a2c384a905c1377bda9906e7801b339098548e1a07 : (forall x0 x1, x1 :e int -> (forall x2, x2 :e int -> (forall x3, x3 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x2 (minus_SNo x3)) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 x2) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 x3)))).
admit.
Qed.
Axiom add_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x1 (add_SNo x0 x2)).
Theorem missingprop_be1e11a5d71ca041f832eed73db12e8257c3594ef5a78dd31311d67a55db0a2e : (forall x0 x1, x1 :e int -> (forall x2, x2 :e int -> (forall x3, x3 :e int -> (forall x4, x4 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x2 (minus_SNo x3)) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 (add_SNo x3 x4)) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 (add_SNo x2 x4)))))).
admit.
Qed.
Theorem missingprop_af5467fd148d224dfbc3159966c89ceb650d3464a181cfcb028851e108ead1d1 : (forall x0 x1, x1 :e int -> (forall x2, x2 :e int -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 (add_SNo x1 (minus_SNo x2)) -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x2 -> missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 x0 x1)).
admit.
Qed.
