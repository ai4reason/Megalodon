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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set -> (set -> prop) -> (set -> set) -> set.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter recip_SNo "eb3c2afcb0fc017514672f7e4bb05a93fb8aa03fbeac55c207f299b0a6c23b32" "aa96a290f83ded9b33662ccb13b56cc27eb5c09a09b36ee3890691b04cc8386c" *)
Parameter recip_SNo : set -> set.
Definition div_SNo : set -> set -> set :=
 (fun x0 x1 : set => mul_SNo x0 (recip_SNo x1)).
Definition SNo_sqrtauxset : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => famunion x0 (fun x3 : set => ReplSep x1 (fun x4 : set => SNoLt Empty (add_SNo x3 x4)) (fun x4 : set => div_SNo (add_SNo x2 (mul_SNo x3 x4)) (add_SNo x3 x4)))).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
Axiom real_div_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> div_SNo x0 x1 :e real)).
Axiom real_add_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_SNo x0 x1 :e real)).
Axiom real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
Theorem SNo_sqrtauxset_real : (forall x0 x1 x2, x0 c= real -> x1 c= real -> x2 :e real -> SNo_sqrtauxset x0 x1 x2 c= real).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom SNo_0 : SNo Empty.
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom real_SNo : (forall x0, x0 :e real -> SNo x0).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 Empty = x0).
Axiom add_SNo_Le3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt Empty x0 -> SNoLt Empty x1 -> SNoLt Empty (mul_SNo x0 x1)).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 Empty = Empty).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo Empty x0 = Empty).
Axiom div_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt Empty x0 -> SNoLt Empty x1 -> SNoLt Empty (div_SNo x0 x1)).
Axiom div_SNo_0_num : (forall x0, SNo x0 -> div_SNo Empty x0 = Empty).
Theorem SNo_sqrtauxset_real_nonneg : (forall x0 x1 x2, x0 c= Sep real (SNoLe Empty) -> x1 c= Sep real (SNoLe Empty) -> x2 :e real -> SNoLe Empty x2 -> SNo_sqrtauxset x0 x1 x2 c= Sep real (SNoLe Empty)).
admit.
Qed.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter sqrt_SNo_nonneg "83d279e5aa419fbbd248d65c78365bc07f35773623616e9f2ff1cab03bb53e87" "71d15253c75b86e7fa4727323f2048ac8eeb6097cdf84c78a32c8477edd521d4" *)
Parameter sqrt_SNo_nonneg : set -> set.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom omega_ordinal : ordinal omega.
Axiom SNoLev_ind : (forall x0 : set -> prop, (forall x1, SNo x1 -> (forall x2, x2 :e SNoS_ (SNoLev x1) -> x0 x2) -> x0 x1) -> (forall x1, SNo x1 -> x0 x1)).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom ordinal_Empty : ordinal Empty.
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom ordinal_1 : ordinal 1.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter SNo_sqrtaux "31cfe8bdf5bca31fe1fb3502f567a96e73b06cc4c16d250940c5552ab44bcc3e" "e233df2b059547d5f25a53cb536493018adade8d5c4cdd7e88857b49c4b5fbf8" *)
Parameter SNo_sqrtaux : set -> (set -> set) -> set -> set.
Axiom sqrt_SNo_nonneg_eq : (forall x0, SNo x0 -> sqrt_SNo_nonneg x0 = SNoCut (famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 0)) (famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 1))).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
Axiom SNo_sqrt_SNo_SNoCutP : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNoCutP (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))).
Axiom real_SNoCut : (forall x0, x0 c= real -> (forall x1, x1 c= real -> SNoCutP x0 x1 -> (x0 = 0 -> (forall x2 : prop, x2)) -> (x1 = 0 -> (forall x2 : prop, x2)) -> (forall x2, x2 :e x0 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (SNoLt x2 x4) -> x3) -> x3)) -> (forall x2, x2 :e x1 -> (forall x3 : prop, (forall x4, and (x4 :e x1) (SNoLt x4 x2) -> x3) -> x3)) -> SNoCut x0 x1 :e real)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom sqrt_SNo_nonneg_Lnonempty : (forall x0, SNo x0 -> SNoLe 0 x0 -> 0 :e SNoLev x0 -> famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 0) = 0 -> (forall x1 : prop, x1)).
Axiom sqrt_SNo_nonneg_Rnonempty : (forall x0, SNo x0 -> SNoLe 0 x0 -> 1 :e SNoLev x0 -> famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 1) = 0 -> (forall x1 : prop, x1)).
Axiom SNo_sqrtaux_0_prop : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, nat_p x1 -> (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt (mul_SNo x2 x2) x0)))).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom SNo_1 : SNo 1.
Axiom SNo_sqrtaux_mon : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> (forall x3, nat_p x3 -> x2 c= x3 -> and (ap (SNo_sqrtaux x0 x1 x2) 0 c= ap (SNo_sqrtaux x0 x1 x3) 0) (ap (SNo_sqrtaux x0 x1 x2) 1 c= ap (SNo_sqrtaux x0 x1 x3) 1))).
Axiom nat_0 : nat_p 0.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom Subq_Empty : (forall x0, 0 c= x0).
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition SNoL : set -> set :=
 (fun x0 : set => Sep (SNoS_ (SNoLev x0)) (fun x1 : set => SNoLt x1 x0)).
Definition SNoL_nonneg : set -> set :=
 (fun x0 : set => Sep (SNoL x0) (SNoLe 0)).
Definition SNoR : set -> set :=
 (fun x0 : set => Sep (SNoS_ (SNoLev x0)) (SNoLt x0)).
Axiom SNo_sqrtaux_0 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (SNo_sqrtaux x0 x1 0) (lam 2 (fun x3 : set => If_i (x3 = 0) (Repl (SNoL_nonneg x0) x1) (Repl (SNoR x0) x1))) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) (Repl (SNoL_nonneg x0) x1) (Repl (SNoR x0) x1))) (SNo_sqrtaux x0 x1 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom sqrt_SNo_nonneg_1 : sqrt_SNo_nonneg 1 = 1.
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Axiom SNo_sqrtaux_S : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> SNo_sqrtaux x0 x1 (ordsucc x2) = lam 2 (fun x4 : set => If_i (x4 = 0) (binunion (ap (SNo_sqrtaux x0 x1 x2) 0) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)) (binunion (binunion (ap (SNo_sqrtaux x0 x1 x2) 1) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 0) x0)) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 1) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)))).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SNo_sqrtauxset_I : (forall x0 x1 x2 x3, x3 :e x0 -> (forall x4, x4 :e x1 -> SNoLt 0 (add_SNo x3 x4) -> div_SNo (add_SNo x2 (mul_SNo x3 x4)) (add_SNo x3 x4) :e SNo_sqrtauxset x0 x1 x2)).
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom SNoLt_0_2 : SNoLt 0 2.
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom SNoLt_0_1 : SNoLt 0 1.
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom div_mul_SNo_invL : (forall x0 x1, SNo x0 -> SNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> div_SNo (mul_SNo x0 x1) x1 = x0).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom pos_mul_SNo_Lt' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x2 -> SNoLt x0 x1 -> SNoLt (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom SNo_recip_SNo : (forall x0, SNo x0 -> SNo (recip_SNo x0)).
Axiom recip_SNo_of_pos_is_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> SNoLt 0 (recip_SNo x0)).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom add_SNo_Lt3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom SNo_sqrtaux_1_prop : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, nat_p x1 -> (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt x0 (mul_SNo x2 x2))))).
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom omega_TransSet : TransSet omega.
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Definition PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)).
Definition SNoEq_ : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => PNoEq_ x0 (fun x3 : set => x3 :e x1) (fun x3 : set => x3 :e x2)).
Axiom SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom SNoLtI3 : (forall x0 x1, SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> SNoLt x0 x1).
Axiom SNoLev_0 : SNoLev 0 = 0.
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom real_1 : 1 :e real.
Axiom SNoLev_0_eq_0 : (forall x0, SNo x0 -> SNoLev x0 = 0 -> x0 = 0).
Axiom Empty_Subq_eq : (forall x0, x0 c= 0 -> x0 = 0).
Axiom sqrt_SNo_nonneg_0 : sqrt_SNo_nonneg 0 = 0.
Axiom real_0 : 0 :e real.
Axiom SNoS_omega_real : SNoS_ omega c= real.
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Theorem sqrt_SNo_nonneg_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> SNoLe 0 x0 -> sqrt_SNo_nonneg x0 :e real).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Parameter abs_SNo : set -> set.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Axiom real_E : (forall x0, x0 :e real -> (forall x1 : prop, (SNo x0 -> SNoLev x0 :e ordsucc omega -> x0 :e SNoS_ (ordsucc omega) -> SNoLt (minus_SNo omega) x0 -> SNoLt x0 omega -> (forall x2, x2 :e SNoS_ omega -> (forall x3, x3 :e omega -> SNoLt (abs_SNo (add_SNo x2 (minus_SNo x0))) (eps_ x3)) -> x2 = x0) -> (forall x2, x2 :e omega -> (forall x3 : prop, (forall x4, and (x4 :e SNoS_ omega) (and (SNoLt x4 x0) (SNoLt x0 (add_SNo x4 (eps_ x2)))) -> x3) -> x3)) -> x1) -> x1)).
Axiom sqrt_SNo_nonneg_prop1 : (forall x0, SNo x0 -> SNoLe 0 x0 -> and (and (SNo (sqrt_SNo_nonneg x0)) (SNoLe 0 (sqrt_SNo_nonneg x0))) (mul_SNo (sqrt_SNo_nonneg x0) (sqrt_SNo_nonneg x0) = x0)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom div_SNo_pos_LtR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt (mul_SNo x2 x1) x0 -> SNoLt x2 (div_SNo x0 x1)).
Axiom pos_mul_SNo_Lt2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (mul_SNo x0 x1) (mul_SNo x2 x3)).
Axiom add_SNo_Lt3b : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Axiom div_SNo_pos_LtL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt x0 (mul_SNo x2 x1) -> SNoLt (div_SNo x0 x1) x2).
Axiom nat_1 : nat_p 1.
Axiom sqrt_SNo_nonneg_nonneg : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNoLe 0 (sqrt_SNo_nonneg x0)).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Theorem sqrt_SNo_nonneg_real : (forall x0, x0 :e real -> SNoLe 0 x0 -> sqrt_SNo_nonneg x0 :e real).
admit.
Qed.
(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition rational : set :=
 Sep real (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e int) (forall x3 : prop, (forall x4, and (x4 :e setminus omega (Sing 0)) (x0 = div_SNo x2 x4) -> x3) -> x3) -> x1) -> x1).
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom form100_1_v1 : (forall x0, x0 :e setminus omega 1 -> (forall x1, x1 :e setminus omega 1 -> mul_nat x0 x0 = mul_nat 2 (mul_nat x1 x1) -> (forall x2 : prop, x2))).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom omega_SNoS_omega : omega c= SNoS_ omega.
Axiom nat_2 : nat_p 2.
Axiom int_3_cases : (forall x0, x0 :e int -> (forall x1 : prop, (forall x2, x2 :e omega -> x0 = minus_SNo (ordsucc x2) -> x1) -> (x0 = 0 -> x1) -> (forall x2, x2 :e omega -> x0 = ordsucc x2 -> x1) -> x1)).
Axiom SNo_2 : SNo 2.
Axiom div_SNo_neg_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 0 -> SNoLt 0 x1 -> SNoLt (div_SNo x0 x1) 0).
Axiom int_SNo : (forall x0, x0 :e int -> SNo x0).
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom ordinal_ordsucc_SNo_eq : (forall x0, ordinal x0 -> ordsucc x0 = add_SNo 1 x0).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom omega_nonneg : (forall x0, x0 :e omega -> SNoLe 0 x0).
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Axiom eq_1_Sing0 : 1 = Sing 0.
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Axiom mul_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (mul_SNo x0 x1) (mul_SNo x2 x3) = mul_SNo (mul_SNo x0 x2) (mul_SNo x1 x3)).
Axiom sqrt_SNo_nonneg_sqr : (forall x0, SNo x0 -> SNoLe 0 x0 -> mul_SNo (sqrt_SNo_nonneg x0) (sqrt_SNo_nonneg x0) = x0).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom mul_div_SNo_invL : (forall x0 x1, SNo x0 -> SNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> mul_SNo (div_SNo x0 x1) x1 = x0).
Axiom SNo_sqrt_SNo_nonneg : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNo (sqrt_SNo_nonneg x0)).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem sqrt_2_irrational : sqrt_SNo_nonneg 2 :e setminus real rational.
admit.
Qed.
