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
(* Parameter CSNo "4a34d6ddf18af8c0c2f637afb2ddadaa240273c85b9410fcb82cd0782bab13d7" "c35281fa7c11775a593d536c7fec2695f764921632445fa772f3a2a45bdf4257" *)
Parameter CSNo : set -> prop.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom SNo_CSNo : (forall x0, SNo x0 -> CSNo x0).
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Theorem missingprop_e2fb61ffd42f1e1333bb283858fc373cb4d96748d71c4a06eee437d16c47868c : (forall x0, nat_p x0 -> CSNo x0).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Theorem missingprop_c7117d9d09f34971838ad7052e0a0e9e93ec6768139c98339098e62b6f3740b3 : (forall x0, x0 :e omega -> CSNo x0).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_2 : nat_p 2.
Theorem missingprop_c781ab230bdce64cdbed93f897cfe3027c133f27f2abafd047688954f65ac63d : CSNo 2.
admit.
Qed.
Axiom nat_3 : nat_p 3.
Theorem missingprop_df792f9cb56a3a91561e57aeb727f1a1231f507807ce2f3e75d0a7010e16ad53 : CSNo 3.
admit.
Qed.
Axiom nat_4 : nat_p 4.
Theorem missingprop_75a3fef52041972c9e562d6eab68c9a320b9ac5df960f524806767ffe72a3341 : CSNo 4.
admit.
Qed.
Axiom nat_5 : nat_p 5.
Theorem missingprop_4272324d89396324f282f9cba6c5859073b7f38104468fb4f4c7598b285aa063 : CSNo 5.
admit.
Qed.
Axiom nat_6 : nat_p 6.
Theorem missingprop_09010cf81baff97ff306d15fc30d334090a861d55d9ee031cba5a2cd835c6397 : CSNo 6.
admit.
Qed.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem nat_7 : nat_p 7.
admit.
Qed.
Theorem nat_8 : nat_p 8.
admit.
Qed.
Theorem nat_9 : nat_p 9.
admit.
Qed.
Theorem nat_10 : nat_p 10.
admit.
Qed.
Theorem nat_11 : nat_p 11.
admit.
Qed.
Theorem nat_12 : nat_p 12.
admit.
Qed.
Theorem missingprop_48f094512a14d5a17747c9f89ca9935edcf7b1fdd71181e30339d3c5a9261250 : CSNo 7.
admit.
Qed.
Theorem missingprop_579756023e8f50d55080c5f9b3257d4b6650fffb22472803e60ec23ad17a359c : CSNo 8.
admit.
Qed.
Theorem missingprop_04e75785ed9c200b05fccf4ed9859b5ec767341832859a636330784836450346 : CSNo 9.
admit.
Qed.
Theorem missingprop_c933c068292d9fb49cf97333196e04c2cf3c581aa30a2103e67c5869e2661cba : CSNo 10.
admit.
Qed.
Theorem missingprop_f284aff1de1e2a86704eec28f35e9798031934e33ca0fc2fa5533203d891bdc2 : CSNo 11.
admit.
Qed.
Theorem missingprop_a4c3484071bbbe97c4d268f3f3ae02dcb4f2ee0e26c171baee4e2862e5a03cf2 : CSNo 12.
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
(* Parameter add_CSNo "87078b7ac24bf8933a19e084290a2389879a99a0c1e88735fb5de288e047db0c" "30acc532eaa669658d7b9166abf687ea3e2b7c588c03b36ba41be23d1c82e448" *)
Parameter add_CSNo : set -> set -> set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
Axiom add_SNo_add_CSNo : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_CSNo x0 x1).
Theorem missingprop_8133078cef6240af324afcb2f1d252bca0d0b19fe91aae84b7d12c6e2b758f14 : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_CSNo x0 x1)).
admit.
Qed.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
(* Parameter mul_CSNo "be6a968dce01facef568dc993eb13308d0ad11a1122ff3b96873947b912d1ffe" "e40da52d94418bf12fcea785e96229c7cfb23420a48e78383b914917ad3fa626" *)
Parameter mul_CSNo : set -> set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom missingprop_e8fe572c395c46aa7a6d67f7a8cd850bf647261d6b3677aecbf3b7ddfa5a7193 : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_CSNo x0 x1).
Theorem missingprop_9624bdc21b4d4165bb1ae8a405223efbf12ff7418b3a1dd1e201b512a621dd27 : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_CSNo x0 x1)).
admit.
Qed.
Axiom SNo_1 : SNo 1.
Axiom add_SNo_1_ordsucc : (forall x0, x0 :e omega -> add_SNo x0 1 = ordsucc x0).
Theorem missingprop_284dc111c6eb2bddb3c4d801652d8c8261bace09e41e64d83eb05adf646c0cc8 : (forall x0, x0 :e omega -> add_CSNo x0 1 = ordsucc x0).
admit.
Qed.
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Theorem missingprop_73c5ed37cd397345828b6724275d98cb3347abc06b11b1be4c212b0d8bb8f103 : add_CSNo 1 1 = 2.
admit.
Qed.
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Theorem missingprop_64a920699476449206e8c57ca7ffc987e1c1342be951b54cfcf520a6fdd082de : (forall x0, x0 :e omega -> add_CSNo x0 1 :e omega).
admit.
Qed.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Theorem missingprop_58515aea86eabc34c5ea45b292b31ba2004802a49a550cfa817d43bb9f97938e : (forall x0, nat_p x0 -> nat_p (add_CSNo x0 1)).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Theorem missingprop_8e8d1a3fe39744d5365fedcf96e7eeb32bdb21d4032f28d267bbfa8abe529def : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (add_CSNo x1 1)) -> (forall x1, nat_p x1 -> x0 x1)).
admit.
Qed.
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Theorem missingprop_43cb5a76d994a313182eba8f3a42eede331e54ecc8fc62c4c505222670320894 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_CSNo x0 x1))).
admit.
Qed.
Theorem missingprop_77ad158f244c06eee30f2a48ec680456f192f98658cfebef4c77a6f090f4c0fc : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_CSNo x0 x1 :e omega)).
admit.
Qed.
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Theorem missingprop_0bb75eee38af15744cc7fae0e5a9d1a6dc79cf3f4b96a91d4c30371ac9fe242c : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_CSNo x0 x1))).
admit.
Qed.
Theorem missingprop_923a352bf0848105f6714767a324796c19a9b67b8e06d0564e73b6f203768dae : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_CSNo x0 x1 :e omega)).
admit.
Qed.
(* Parameter minus_CSNo "d91e2c13ce03095e08eaa749eebd7a4fa45c5e1306e8ce1c6df365704d44867f" "9c138ddc19cc32bbd65aed7e98ca568d6cf11af8ab01e026a5986579061198b7" *)
Parameter minus_CSNo : set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom minus_SNo_minus_CSNo : (forall x0, SNo x0 -> minus_SNo x0 = minus_CSNo x0).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem missingprop_86ca75d1c76debbfa3c15b8a3e774540f72ec170cecc4939194860f81e1042b0 : (forall x0, SNo x0 -> SNo (minus_CSNo x0)).
admit.
Qed.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom minus_SNo_SNoS_ : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> minus_SNo x1 :e SNoS_ x0)).
Theorem missingprop_f9ab7d0017ff80ea014b0d54c4be76dec64ff46e9adf31ecb697ac79fb43a8b7 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> minus_CSNo x1 :e SNoS_ x0)).
admit.
Qed.
Axiom omega_ordinal : ordinal omega.
Theorem missingprop_5315e4043b876c5e2d11535d5e30198a1fd9e7b5e3557ef6582b546f0c9335c6 : (forall x0, x0 :e SNoS_ omega -> minus_CSNo x0 :e SNoS_ omega).
admit.
Qed.
Axiom SNo_0 : SNo 0.
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Theorem missingprop_23a15a3018cabb8ca327c67835a5f1fc097fc8fcb33d259b96e7fc1a5e1f06be : minus_CSNo 0 = 0.
admit.
Qed.
Axiom add_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> add_SNo x0 x1 :e SNoS_ omega)).
Theorem missingprop_d1c8d38cd11c01badbfe30b9135da3b7f47c8cf3ebf93660d5d259d1d5903795 : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> add_CSNo x0 x1 :e SNoS_ omega)).
admit.
Qed.
Axiom mul_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> mul_SNo x0 x1 :e SNoS_ omega)).
Theorem missingprop_b2a5843e3028594537f5e2bfa1629b94f464fad26e0926185ef841bbcf3a7803 : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> mul_CSNo x0 x1 :e SNoS_ omega)).
admit.
Qed.
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
Axiom real_SNo : (forall x0, x0 :e real -> SNo x0).
Theorem missingprop_6f662f8dce09405223d7366d90ea1371a0829620eb2027ae511013528fc1c004 : (forall x0, x0 :e real -> CSNo x0).
admit.
Qed.
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Theorem missingprop_d90800d1e0b4c4ac3584fcaa3e5abfb7f1eb0be0fa39a373f6e3d7594c08d204 : (forall x0, x0 :e real -> minus_CSNo x0 :e real).
admit.
Qed.
Axiom real_add_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_SNo x0 x1 :e real)).
Theorem missingprop_2ec3453880cc0350465fce01beb73b44239056b01a5a9256f3bb7a1653d4485d : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_CSNo x0 x1 :e real)).
admit.
Qed.
Axiom real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
Theorem missingprop_5f1c1e0f3ffa6a07dfe357fb7f98d1bbda331a32fc712f5b9376071a501c9e0b : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_CSNo x0 x1 :e real)).
admit.
Qed.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom pos_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt 0 x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem missingprop_5e44090ae6bcbfba765362591f9f56f50c5026bb194c232694fc15d6b39ba4cd : (forall x0 x1 x2, SNo x0 -> SNoLt 0 x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (mul_CSNo x0 x1) (mul_CSNo x0 x2)).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom nonneg_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe 0 x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem missingprop_58654ba5d4c7e6fc5b4a7183a9cc686aa19f65fba6850e54b744c83382feb953 : (forall x0 x1 x2, SNo x0 -> SNoLe 0 x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_CSNo x0 x1) (mul_CSNo x0 x2)).
admit.
Qed.
Axiom neg_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt x0 0 -> SNo x1 -> SNo x2 -> SNoLt x2 x1 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem missingprop_e1a831dc3dabe58b9cd93d982b0d42d868858a175a645179d8142fc9c88eade6 : (forall x0 x1 x2, SNo x0 -> SNoLt x0 0 -> SNo x1 -> SNo x2 -> SNoLt x2 x1 -> SNoLt (mul_CSNo x0 x1) (mul_CSNo x0 x2)).
admit.
Qed.
Axiom nonpos_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe x0 0 -> SNo x1 -> SNo x2 -> SNoLe x2 x1 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem missingprop_af2fa94f43d13a0242824fa75fe6fc17c6c6b80d90e2b363950bb1fba5e78ec7 : (forall x0 x1 x2, SNo x0 -> SNoLe x0 0 -> SNo x1 -> SNo x2 -> SNoLe x2 x1 -> SNoLe (mul_CSNo x0 x1) (mul_CSNo x0 x2)).
admit.
Qed.
(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.
Axiom int_SNo : (forall x0, x0 :e int -> SNo x0).
Theorem missingprop_41c62f5f8d2dfb2a4b37a5e353906abf2590fc394c7c1b44a0908fc84491ae34 : (forall x0, x0 :e int -> CSNo x0).
admit.
Qed.
Axiom int_SNo_cases : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int -> x0 x1)).
Theorem missingprop_f70cecc5100a5adb6238d97edfbcc490fbdbb660b722893732e69db6ea7adb86 : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_CSNo x1)) -> (forall x1, x1 :e int -> x0 x1)).
admit.
Qed.
Axiom int_minus_SNo_omega : (forall x0, x0 :e omega -> minus_SNo x0 :e int).
Theorem missingprop_93bccf3667431da8a98af228fc2afeced4669e2ccfc32fd3584fdedc8c8c68e2 : (forall x0, x0 :e omega -> minus_CSNo x0 :e int).
admit.
Qed.
Axiom int_minus_SNo : (forall x0, x0 :e int -> minus_SNo x0 :e int).
Theorem missingprop_675cd88b909def2d8bd7390a7b755e333acc9e7799b8d4639e8eeefc688f8968 : (forall x0, x0 :e int -> minus_CSNo x0 :e int).
admit.
Qed.
Axiom int_add_SNo : (forall x0, x0 :e int -> (forall x1, x1 :e int -> add_SNo x0 x1 :e int)).
Theorem missingprop_1a7cdf5cb5a48bf3df8089ba175e9489337274d3579c1139315dd71d9aec7718 : (forall x0, x0 :e int -> (forall x1, x1 :e int -> add_CSNo x0 x1 :e int)).
admit.
Qed.
Axiom int_mul_SNo : (forall x0, x0 :e int -> (forall x1, x1 :e int -> mul_SNo x0 x1 :e int)).
Theorem missingprop_c091b5f648b3f262e5b16ea0392ee068010ee180dfb0ba89d019b4a464428e2f : (forall x0, x0 :e int -> (forall x1, x1 :e int -> mul_CSNo x0 x1 :e int)).
admit.
Qed.
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
Axiom nonpos_nonneg_0 : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> x0 = minus_SNo x1 -> and (x0 = 0) (x1 = 0))).
Theorem missingprop_6133989d79338ef1b84dfffb9366eaaabdeab1fe855a6fa22a6173d1d82090de : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> x0 = minus_CSNo x1 -> and (x0 = 0) (x1 = 0))).
admit.
Qed.
Axiom add_CSNo_0L : (forall x0, CSNo x0 -> add_CSNo 0 x0 = x0).
Axiom add_CSNo_minus_CSNo_linv : (forall x0, CSNo x0 -> add_CSNo (minus_CSNo x0) x0 = 0).
Axiom missingprop_4dacc39fbff2a1eb7f64c88eae888b40bdb7083a731b4cd05ad435e42f13fcba : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo x0 (add_CSNo x1 x2) = add_CSNo (add_CSNo x0 x1) x2).
Axiom CSNo_minus_CSNo : (forall x0, CSNo x0 -> CSNo (minus_CSNo x0)).
Theorem missingprop_06a4ec1d06df31c2c8c53ecdf2780bb9f187c1468b28741ccdfd338035b0de7f : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo x0 x1 = add_CSNo x0 x2 -> x1 = x2).
admit.
Qed.
Axiom missingprop_6df04587a59e9b54f0549c96144213d94328d0b365474f739b895e743839c817 : (forall x0 x1, CSNo x0 -> CSNo x1 -> add_CSNo x0 x1 = add_CSNo x1 x0).
Theorem missingprop_28b7bd7c495fc6d6aba877cec7421acb6ac63eedc181bb03d3f51f298d7e9d45 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo x0 x2 = add_CSNo x1 x2 -> x0 = x1).
admit.
Qed.
Axiom add_CSNo_minus_CSNo_rinv : (forall x0, CSNo x0 -> add_CSNo x0 (minus_CSNo x0) = 0).
Theorem missingprop_cb3c73e6397c4921a333f973bae46a7e59f433123dea81f3a2d0adee769cf93f : (forall x0, CSNo x0 -> minus_CSNo (minus_CSNo x0) = x0).
admit.
Qed.
Axiom missingprop_85a866d410bbf26b260c37246259122da00d151df84a9a2a98da7e65f3fcf36a : CSNo 0.
Axiom missingprop_1a3b6d576749bdb66b853eab2e35cc4332be69b97fdfebcc7e17a4a552a3d204 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (add_CSNo x1 x2) = add_CSNo (mul_CSNo x0 x1) (mul_CSNo x0 x2)).
Axiom missingprop_3ecd982cbc53bc522aff3fa68eac8a88bfce787ef3776f0dfe2618ef278e2daf : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (mul_CSNo x0 x1)).
Theorem missingprop_125482bd1feb67ec2e9da6790eb6492e3ac6b5310e309d7023b9247b76e919b5 : (forall x0, CSNo x0 -> mul_CSNo x0 0 = 0).
admit.
Qed.
Axiom missingprop_4be0565ac5b41f138f7a30d0a9f34a5d126bb341d2eeaa545aa7f0c1552b9722 : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 x1 = mul_CSNo x1 x0).
Theorem missingprop_2a5a876481120fa10aa7abde74e1fdc7c8706213e1f397e994cc370e961fee2d : (forall x0, CSNo x0 -> mul_CSNo 0 x0 = 0).
admit.
Qed.
Axiom missingprop_33594f786441fb94cfa9c7be2034d88216fac0dbcbe9e223f18185e2cf6cb053 : CSNo 1.
Theorem missingprop_816b24b7fa8629239787a2f67d57cb724841aa24b172a2911100d1463e5d17f5 : CSNo (minus_CSNo 1).
admit.
Qed.
Axiom missingprop_8e63a35ced1c21572795aec3dca7302bd96cc84c909ac1e26265b0a88a4ddf7f : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo (add_CSNo x0 x1) x2 = add_CSNo (mul_CSNo x0 x2) (mul_CSNo x1 x2)).
Theorem missingprop_78927d114a9e016b6fa814cd3cb647b02601a2956c15aa990b929c9491fbf104 : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo (minus_CSNo x0) x1 = minus_CSNo (mul_CSNo x0 x1)).
admit.
Qed.
Axiom missingprop_0d9bf92aa5eb4d4ae6bc10fbd993cadc9f48c429c82304b11a917b483aee3888 : (forall x0, CSNo x0 -> mul_CSNo 1 x0 = x0).
Theorem missingprop_9f6bc196f7ae3fda0e8cad887be4572a054a199163decc01a808975c97308e9a : (forall x0, CSNo x0 -> minus_CSNo x0 = mul_CSNo (minus_CSNo 1) x0).
admit.
Qed.
Theorem missingprop_2f3abf0dc8f8a8be1aa9d298d1fecff1a496796abe903d77feb6f0e5457defc1 : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 (minus_CSNo x1) = minus_CSNo (mul_CSNo x0 x1)).
admit.
Qed.
Theorem missingprop_cd59b4d22f7b379d4b243fdcb2bfd13113d34cf2ba828a50498254f03ce04e0e : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo (minus_CSNo x0) (minus_CSNo x1) = mul_CSNo x0 x1).
admit.
Qed.
Axiom CSNo_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (add_CSNo x0 x1)).
Theorem missingprop_c43d8335769836c36f9b797ba1eb1e4cdc54581b36d1df362a19e77c9778f7ce : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo (add_CSNo x0 (add_CSNo x1 x2))).
admit.
Qed.
Theorem missingprop_1c73edda9ac17d7ea7b8fc29add08ec45279707e75796f69e60ce0a076b79536 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> CSNo (add_CSNo x0 (add_CSNo x1 (add_CSNo x2 x3)))).
admit.
Qed.
Theorem missingprop_d66293b5616fc5b5accdeab89990a2768c5c8c0d3888be108848c33f6a994876 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> add_CSNo x0 (add_CSNo x1 (add_CSNo x2 x3)) = add_CSNo (add_CSNo x0 (add_CSNo x1 x2)) x3).
admit.
Qed.
Theorem missingprop_da96b87d1828fc8ba863b6e04bdabe0039a91c2aa965c2060e150e0d03b88cbb : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo x0 (add_CSNo x1 x2) = add_CSNo x1 (add_CSNo x0 x2)).
admit.
Qed.
Theorem missingprop_d5e174bf650f0bf76660687d9b3c8aa594ddcd91ca33bb5ec5eb968d24ac9465 : (forall x0 x1 x2 x3, CSNo x1 -> CSNo x2 -> CSNo x3 -> add_CSNo x0 (add_CSNo x1 (add_CSNo x2 x3)) = add_CSNo x0 (add_CSNo x2 (add_CSNo x1 x3))).
admit.
Qed.
Theorem missingprop_77dcef66813586d50120c5a96b0e64deb3bb2f24f033e706f9707610229e2634 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo (add_CSNo x0 x1) x2 = add_CSNo (add_CSNo x0 x2) x1).
admit.
Qed.
Theorem missingprop_bc5d75aef1cebf250904193b318ff14152dec1ee6de37ede33809ace5bf4802f : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> add_CSNo (add_CSNo x0 x1) (add_CSNo x2 x3) = add_CSNo (add_CSNo x0 x2) (add_CSNo x1 x3)).
admit.
Qed.
Theorem missingprop_15eb5b285a226a5656174d3a9de3f1e64f419838ace8340d1f9ea4f413ff2b14 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo x0 (add_CSNo x1 x2) = add_CSNo x2 (add_CSNo x0 x1)).
admit.
Qed.
Theorem missingprop_8f00f9db3633f6178cb0cf83b7682b34a4811960bd09884862d46b68f70f245f : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> add_CSNo x0 (add_CSNo x1 (add_CSNo x2 x3)) = add_CSNo x3 (add_CSNo x0 (add_CSNo x1 x2))).
admit.
Qed.
Theorem missingprop_bb314311587f05f6fc68994eed567dad930d3a512d178f2cfd47dd38479aaffc : (forall x0 x1 x2 x3 x4, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> CSNo x4 -> add_CSNo x0 (add_CSNo x1 (add_CSNo x2 (add_CSNo x3 x4))) = add_CSNo x4 (add_CSNo x0 (add_CSNo x1 (add_CSNo x2 x3)))).
admit.
Qed.
Theorem missingprop_515fe880a514f0bd7a0b506fe4a1ca524f148d154deceb8f9a57c249c8f7211f : (forall x0 x1 x2 x3 x4, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> CSNo x4 -> add_CSNo x0 (add_CSNo x1 (add_CSNo x2 (add_CSNo x3 x4))) = add_CSNo x3 (add_CSNo x4 (add_CSNo x0 (add_CSNo x1 x2)))).
admit.
Qed.
Theorem missingprop_276b9848c59b12652df2b7a1f236b9d3fe3d1a9e17a87e7b6dcb54b622e4e874 : (forall x0 x1, CSNo x0 -> CSNo x1 -> add_CSNo (minus_CSNo x0) (add_CSNo x0 x1) = x1).
admit.
Qed.
Theorem missingprop_92eb7d26fbda0a13fde02f6818f4208a8e9dd2b231cb52c2e32d3eca28a14a45 : (forall x0 x1, CSNo x0 -> CSNo x1 -> add_CSNo x0 (add_CSNo (minus_CSNo x0) x1) = x1).
admit.
Qed.
Theorem missingprop_25736a7f92c31e8fd99a310f6c7a28172c5f7a5b698118098169e99d8456d9ea : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> add_CSNo (add_CSNo x0 (add_CSNo x1 x2)) (add_CSNo (minus_CSNo x2) x3) = add_CSNo x0 (add_CSNo x1 x3)).
admit.
Qed.
Theorem missingprop_90fc91b7b01841708c81bb29e0766eb3856c42ce4fbfff407c114c010370d66d : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> add_CSNo (add_CSNo x0 (add_CSNo x1 x2)) (add_CSNo x3 (minus_CSNo x2)) = add_CSNo x0 (add_CSNo x1 x3)).
admit.
Qed.
Theorem missingprop_8376fd8a60ff784ca5f4d8df8bcc9a6dc1abe1a2a716388e586845b1b8574127 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> add_CSNo (add_CSNo x0 (add_CSNo x1 (minus_CSNo x2))) (add_CSNo x2 x3) = add_CSNo x0 (add_CSNo x1 x3)).
admit.
Qed.
Theorem missingprop_90a66eb31286c43c8c15602fee62623565bcc46fc51b23832bd0c4409a66e562 : (forall x0 x1, CSNo x0 -> CSNo x1 -> minus_CSNo (add_CSNo x0 x1) = add_CSNo (minus_CSNo x0) (minus_CSNo x1)).
admit.
Qed.
Theorem missingprop_7d4f5457b1da346c62a95920399532c7f77f2218a9c26aaccd862de3e2c66112 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo (mul_CSNo x0 (mul_CSNo x1 x2))).
admit.
Qed.
Theorem missingprop_cffa254914a365c60b706102f304a6b9c3bd8e5ed95d9066f8d0b6a334eee610 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> CSNo (mul_CSNo x0 (mul_CSNo x1 (mul_CSNo x2 x3)))).
admit.
Qed.
Axiom missingprop_f134758f39278620c60cfac6676dbfce170f8cc0cce849e07ba3004e259a9bbb : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo (mul_CSNo x0 x1) x2).
Theorem missingprop_075b313d6a8b24fdcc296bb0944b6296b8484ef706776cb12bc18c9c65cb6728 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> mul_CSNo x0 (mul_CSNo x1 (mul_CSNo x2 x3)) = mul_CSNo (mul_CSNo x0 (mul_CSNo x1 x2)) x3).
admit.
Qed.
Theorem missingprop_d58675f456b2a327cc37b294dd8f7a9297734ca60440fc59cc75cc79890a4904 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo x1 (mul_CSNo x0 x2)).
admit.
Qed.
Theorem missingprop_fc4a807bf1f311bbda93ebcf8cc652892012d46bea24550ceee34df8bc0ca3e5 : (forall x0 x1 x2 x3, CSNo x1 -> CSNo x2 -> CSNo x3 -> mul_CSNo x0 (mul_CSNo x1 (mul_CSNo x2 x3)) = mul_CSNo x0 (mul_CSNo x2 (mul_CSNo x1 x3))).
admit.
Qed.
Theorem missingprop_66500b13538e9fc8ad8ae5cec64ebbeeda988536d7db5bf4045bc7f28048a72b : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo (mul_CSNo x0 x1) x2 = mul_CSNo (mul_CSNo x0 x2) x1).
admit.
Qed.
Theorem missingprop_603b67eb49ca407bac332227dd0f5becd71c9a85824d8b02e8d20ab679b151f2 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> mul_CSNo (mul_CSNo x0 x1) (mul_CSNo x2 x3) = mul_CSNo (mul_CSNo x0 x2) (mul_CSNo x1 x3)).
admit.
Qed.
Theorem missingprop_83f42a9be1fb70a66754d3f1ec6766cd22411cf20e288c8e140f22d881bd2da2 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo x2 (mul_CSNo x0 x1)).
admit.
Qed.
Theorem missingprop_bffa6df8e7b96b9efd8fc8e3fdaaadbd71fae4b5ece73e60fa0341dcf0b04e45 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> mul_CSNo x0 (mul_CSNo x1 (mul_CSNo x2 x3)) = mul_CSNo x3 (mul_CSNo x0 (mul_CSNo x1 x2))).
admit.
Qed.
Theorem missingprop_4755b0be94c4b455b7aae20c1fa4300a433d91f4b45826966bd694a7adc989af : (forall x0 x1 x2 x3 x4, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> CSNo x4 -> mul_CSNo x0 (mul_CSNo x1 (mul_CSNo x2 (mul_CSNo x3 x4))) = mul_CSNo x4 (mul_CSNo x0 (mul_CSNo x1 (mul_CSNo x2 x3)))).
admit.
Qed.
Theorem missingprop_e60a736366809a5ea970fdd218c9ce2e3fd0837a3455b332ac8523816492e7d0 : (forall x0 x1 x2 x3 x4, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> CSNo x4 -> mul_CSNo x0 (mul_CSNo x1 (mul_CSNo x2 (mul_CSNo x3 x4))) = mul_CSNo x3 (mul_CSNo x4 (mul_CSNo x0 (mul_CSNo x1 x2)))).
admit.
Qed.
