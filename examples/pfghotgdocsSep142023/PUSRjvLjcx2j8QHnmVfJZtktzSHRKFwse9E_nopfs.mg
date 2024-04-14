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
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter recip_SNo_pos "88ed11f2dead5b0e5f3c28c04f2c1d5ed89566ba1ab8122ea402434686300b1d" "88641a4cbed44079b02973dc08db05881974114238c1bedb4afc7abc752722a4" *)
Parameter recip_SNo_pos : set -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom recip_SNo_pos_prop1 : (forall x0, SNo x0 -> SNoLt 0 x0 -> and (SNo (recip_SNo_pos x0)) (mul_SNo x0 (recip_SNo_pos x0) = 1)).
Theorem SNo_recip_SNo_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> SNo (recip_SNo_pos x0)).
admit.
Qed.
Theorem recip_SNo_pos_invR : (forall x0, SNo x0 -> SNoLt 0 x0 -> mul_SNo x0 (recip_SNo_pos x0) = 1).
admit.
Qed.
Axiom mul_SNo_nonzero_cancel : (forall x0 x1 x2, SNo x0 -> (x0 = 0 -> (forall x3 : prop, x3)) -> SNo x1 -> SNo x2 -> mul_SNo x0 x1 = mul_SNo x0 x2 -> x1 = x2).
Axiom SNo_1 : SNo 1.
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Axiom SNoLt_0_1 : SNoLt 0 1.
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Theorem recip_SNo_pos_1 : recip_SNo_pos 1 = 1.
admit.
Qed.
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom SNo_0 : SNo 0.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom mul_SNo_pos_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt x1 0 -> SNoLt (mul_SNo x0 x1) 0).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Theorem recip_SNo_pos_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> SNoLt 0 (recip_SNo_pos x0)).
admit.
Qed.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Theorem recip_SNo_pos_invol : (forall x0, SNo x0 -> SNoLt 0 x0 -> recip_SNo_pos (recip_SNo_pos x0) = x0).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Axiom SNo_exp_SNo_nat : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> SNo (exp_SNo_nat x0 x1))).
Axiom SNo_2 : SNo 2.
Axiom mul_SNo_eps_power_2 : (forall x0, nat_p x0 -> mul_SNo (eps_ x0) (exp_SNo_nat 2 x0) = 1).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Theorem recip_SNo_pos_eps_ : (forall x0, nat_p x0 -> recip_SNo_pos (eps_ x0) = exp_SNo_nat 2 x0).
admit.
Qed.
Theorem recip_SNo_pos_pow_2 : (forall x0, nat_p x0 -> recip_SNo_pos (exp_SNo_nat 2 x0) = eps_ x0).
admit.
Qed.
Axiom exp_SNo_nat_S : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> exp_SNo_nat x0 (ordsucc x1) = mul_SNo x0 (exp_SNo_nat x0 x1))).
Axiom nat_0 : nat_p 0.
Axiom exp_SNo_nat_0 : (forall x0, SNo x0 -> exp_SNo_nat x0 0 = 1).
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Theorem exp_SNo_nat_1 : (forall x0, SNo x0 -> exp_SNo_nat x0 1 = x0).
admit.
Qed.
Axiom nat_1 : nat_p 1.
Theorem recip_SNo_pos_2 : recip_SNo_pos 2 = eps_ 1.
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition recip_SNo : set -> set :=
 (fun x0 : set => If_i (SNoLt 0 x0) (recip_SNo_pos x0) (If_i (SNoLt x0 0) (minus_SNo (recip_SNo_pos (minus_SNo x0))) 0)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem recip_SNo_poscase : (forall x0, SNoLt 0 x0 -> recip_SNo x0 = recip_SNo_pos x0).
admit.
Qed.
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Theorem recip_SNo_negcase : (forall x0, SNo x0 -> SNoLt x0 0 -> recip_SNo x0 = minus_SNo (recip_SNo_pos (minus_SNo x0))).
admit.
Qed.
Theorem recip_SNo_0 : recip_SNo 0 = 0.
admit.
Qed.
Theorem recip_SNo_1 : recip_SNo 1 = 1.
admit.
Qed.
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Theorem SNo_recip_SNo : (forall x0, SNo x0 -> SNo (recip_SNo x0)).
admit.
Qed.
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Theorem recip_SNo_invR : (forall x0, SNo x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> mul_SNo x0 (recip_SNo x0) = 1).
admit.
Qed.
Theorem recip_SNo_invL : (forall x0, SNo x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> mul_SNo (recip_SNo x0) x0 = 1).
admit.
Qed.
Theorem recip_SNo_eps_ : (forall x0, nat_p x0 -> recip_SNo (eps_ x0) = exp_SNo_nat 2 x0).
admit.
Qed.
Axiom exp_SNo_nat_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> (forall x1, nat_p x1 -> SNoLt 0 (exp_SNo_nat x0 x1))).
Axiom SNoLt_0_2 : SNoLt 0 2.
Theorem recip_SNo_pow_2 : (forall x0, nat_p x0 -> recip_SNo (exp_SNo_nat 2 x0) = eps_ x0).
admit.
Qed.
Theorem recip_SNo_2 : recip_SNo 2 = eps_ 1.
admit.
Qed.
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Theorem recip_SNo_invol : (forall x0, SNo x0 -> recip_SNo (recip_SNo x0) = x0).
admit.
Qed.
Theorem recip_SNo_of_pos_is_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> SNoLt 0 (recip_SNo x0)).
admit.
Qed.
Theorem recip_SNo_of_neg_is_neg : (forall x0, SNo x0 -> SNoLt x0 0 -> SNoLt (recip_SNo x0) 0).
admit.
Qed.
Definition div_SNo : set -> set -> set :=
 (fun x0 x1 : set => mul_SNo x0 (recip_SNo x1)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem SNo_div_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (div_SNo x0 x1)).
admit.
Qed.
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Theorem div_SNo_0_num : (forall x0, SNo x0 -> div_SNo 0 x0 = 0).
admit.
Qed.
Theorem div_SNo_0_denum : (forall x0, SNo x0 -> div_SNo x0 0 = 0).
admit.
Qed.
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Theorem mul_div_SNo_invL : (forall x0 x1, SNo x0 -> SNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> mul_SNo (div_SNo x0 x1) x1 = x0).
admit.
Qed.
Theorem mul_div_SNo_invR : (forall x0 x1, SNo x0 -> SNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> mul_SNo x1 (div_SNo x0 x1) = x0).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Theorem mul_div_SNo_R : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (div_SNo x0 x1) x2 = div_SNo (mul_SNo x0 x2) x1).
admit.
Qed.
Theorem mul_div_SNo_L : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x2 (div_SNo x0 x1) = div_SNo (mul_SNo x2 x0) x1).
admit.
Qed.
Theorem div_mul_SNo_invL : (forall x0 x1, SNo x0 -> SNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> div_SNo (mul_SNo x0 x1) x1 = x0).
admit.
Qed.
Theorem div_div_SNo : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> div_SNo (div_SNo x0 x1) x2 = div_SNo x0 (mul_SNo x1 x2)).
admit.
Qed.
Theorem mul_div_SNo_both : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (div_SNo x0 x1) (div_SNo x2 x3) = div_SNo (mul_SNo x0 x2) (mul_SNo x1 x3)).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom nonneg_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe 0 x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (mul_SNo x0 x1)).
Theorem div_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (div_SNo x0 x1)).
admit.
Qed.
Axiom mul_SNo_neg_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 0 -> SNoLt x1 0 -> SNoLt 0 (mul_SNo x0 x1)).
Theorem div_SNo_neg_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 0 -> SNoLt x1 0 -> SNoLt 0 (div_SNo x0 x1)).
admit.
Qed.
Theorem div_SNo_pos_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt x1 0 -> SNoLt (div_SNo x0 x1) 0).
admit.
Qed.
Axiom mul_SNo_neg_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 0 -> SNoLt 0 x1 -> SNoLt (mul_SNo x0 x1) 0).
Theorem div_SNo_neg_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 0 -> SNoLt 0 x1 -> SNoLt (div_SNo x0 x1) 0).
admit.
Qed.
Axiom pos_mul_SNo_Lt' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x2 -> SNoLt x0 x1 -> SNoLt (mul_SNo x0 x2) (mul_SNo x1 x2)).
Theorem div_SNo_pos_LtL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt x0 (mul_SNo x2 x1) -> SNoLt (div_SNo x0 x1) x2).
admit.
Qed.
Theorem div_SNo_pos_LtR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt (mul_SNo x2 x1) x0 -> SNoLt x2 (div_SNo x0 x1)).
admit.
Qed.
Theorem div_SNo_pos_LtL' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt (div_SNo x0 x1) x2 -> SNoLt x0 (mul_SNo x2 x1)).
admit.
Qed.
Theorem div_SNo_pos_LtR' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt x2 (div_SNo x0 x1) -> SNoLt (mul_SNo x2 x1) x0).
admit.
Qed.
Theorem mul_div_SNo_nonzero_eq : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> (x1 = 0 -> (forall x3 : prop, x3)) -> x0 = mul_SNo x1 x2 -> div_SNo x0 x1 = x2).
admit.
Qed.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Axiom SNoLev_0_eq_0 : (forall x0, SNo x0 -> SNoLev x0 = 0 -> x0 = 0).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom SNo_SNo : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNo x1)).
Axiom ordinal_Empty : ordinal 0.
Axiom SNoLev_uniq2 : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNoLev x1 = x0)).
Theorem SNo_0_eq_0 : (forall x0, SNo_ 0 x0 -> x0 = 0).
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Theorem SNo_gt2_double_ltS : (forall x0, SNo x0 -> SNoLt 1 x0 -> SNoLt (add_SNo x0 1) (mul_SNo 2 x0)).
admit.
Qed.
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Parameter abs_SNo : set -> set.
Axiom real_E : (forall x0, x0 :e real -> (forall x1 : prop, (SNo x0 -> SNoLev x0 :e ordsucc omega -> x0 :e SNoS_ (ordsucc omega) -> SNoLt (minus_SNo omega) x0 -> SNoLt x0 omega -> (forall x2, x2 :e SNoS_ omega -> (forall x3, x3 :e omega -> SNoLt (abs_SNo (add_SNo x2 (minus_SNo x0))) (eps_ x3)) -> x2 = x0) -> (forall x2, x2 :e omega -> (forall x3 : prop, (forall x4, and (x4 :e SNoS_ omega) (and (SNoLt x4 x0) (SNoLt x0 (add_SNo x4 (eps_ x2)))) -> x3) -> x3)) -> x1) -> x1)).
Axiom eps_0_1 : eps_ 0 = 1.
Axiom SNoS_E : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (forall x3, and (x3 :e x0) (SNo_ x3 x1) -> x2) -> x2))).
Axiom omega_ordinal : ordinal omega.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom ordinal_SNoLev_max_2 : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e ordsucc x0 -> SNoLe x1 x0)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom add_SNo_Lev_bd : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev (add_SNo x0 x1) c= add_SNo (SNoLev x0) (SNoLev x1)).
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
Axiom add_SNo_1_ordsucc : (forall x0, x0 :e omega -> add_SNo x0 1 = ordsucc x0).
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem nonneg_real_nat_interval : (forall x0, x0 :e real -> SNoLe 0 x0 -> (forall x1 : prop, (forall x2, and (x2 :e omega) (and (SNoLe x2 x0) (SNoLt x0 (ordsucc x2))) -> x1) -> x1)).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
Definition SNoL_pos : set -> set :=
 (fun x0 : set => Sep (SNoL x0) (SNoLt 0)).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom ordinal_SNo_ : (forall x0, ordinal x0 -> SNo_ x0 x0).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom abs_SNo_minus : (forall x0, SNo x0 -> abs_SNo (minus_SNo x0) = abs_SNo x0).
Axiom pos_abs_SNo : (forall x0, SNoLt 0 x0 -> abs_SNo x0 = x0).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom pos_low_eq_one : (forall x0, SNo x0 -> SNoLt 0 x0 -> SNoLev x0 c= 1 -> x0 = 1).
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom ordinal_SNoLt_In : (forall x0 x1, ordinal x0 -> ordinal x1 -> SNoLt x0 x1 -> x0 :e x1).
Axiom nat_2 : nat_p 2.
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Axiom ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
Axiom ordinal_ordsucc_SNo_eq : (forall x0, ordinal x0 -> ordsucc x0 = add_SNo 1 x0).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom ordinal_Subq_SNoLe : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoLe x0 x1).
Axiom Subq_Empty : (forall x0, 0 c= x0).
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom ordinal_SNoLev_max : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e x0 -> SNoLt x1 x0)).
Axiom add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom SNoLt_1_2 : SNoLt 1 2.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Definition PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)).
Definition SNoEq_ : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => PNoEq_ x0 (fun x3 : set => x3 :e x1) (fun x3 : set => x3 :e x2)).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom eps_ordinal_In_eq_0 : (forall x0 x1, ordinal x1 -> x1 :e eps_ x0 -> x1 = 0).
Axiom SNoLev_eps_ : (forall x0, x0 :e omega -> SNoLev (eps_ x0) = ordsucc x0).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom eps_ordsucc_half_add : (forall x0, nat_p x0 -> add_SNo (eps_ (ordsucc x0)) (eps_ (ordsucc x0)) = eps_ x0).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Theorem pos_real_left_approx_double : (forall x0, x0 :e real -> SNoLt 0 x0 -> (x0 = 2 -> (forall x1 : prop, x1)) -> (forall x1, x1 :e omega -> x0 = eps_ x1 -> (forall x2 : prop, x2)) -> (forall x1 : prop, (forall x2, and (x2 :e SNoL_pos x0) (SNoLt x0 (mul_SNo 2 x2)) -> x1) -> x1)).
admit.
Qed.
(* Parameter sqrt_SNo_nonneg "83d279e5aa419fbbd248d65c78365bc07f35773623616e9f2ff1cab03bb53e87" "71d15253c75b86e7fa4727323f2048ac8eeb6097cdf84c78a32c8477edd521d4" *)
Parameter sqrt_SNo_nonneg : set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter SNo_sqrtaux "31cfe8bdf5bca31fe1fb3502f567a96e73b06cc4c16d250940c5552ab44bcc3e" "e233df2b059547d5f25a53cb536493018adade8d5c4cdd7e88857b49c4b5fbf8" *)
Parameter SNo_sqrtaux : set -> (set -> set) -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition SNoL_nonneg : set -> set :=
 (fun x0 : set => Sep (SNoL x0) (SNoLe 0)).
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom SNo_sqrtaux_0 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (SNo_sqrtaux x0 x1 0) (lam 2 (fun x3 : set => If_i (x3 = 0) (Repl (SNoL_nonneg x0) x1) (Repl (SNoR x0) x1))) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) (Repl (SNoL_nonneg x0) x1) (Repl (SNoR x0) x1))) (SNo_sqrtaux x0 x1 0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter SNo_sqrtauxset "68b7df36646d2eda255314a2e43c4cdd64b4c655e5fb64be90d4363f70dd25dd" "211c641d3a706d9a991fc306cd3b4f60b97678881c6943c492699443fd2aa1de" *)
Parameter SNo_sqrtauxset : set -> set -> set -> set.
Axiom SNo_sqrtaux_S : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> SNo_sqrtaux x0 x1 (ordsucc x2) = lam 2 (fun x4 : set => If_i (x4 = 0) (binunion (ap (SNo_sqrtaux x0 x1 x2) 0) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)) (binunion (binunion (ap (SNo_sqrtaux x0 x1 x2) 1) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 0) x0)) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 1) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)))).
Axiom binunionE' : (forall x0 x1 x2, forall x3 : prop, (x2 :e x0 -> x3) -> (x2 :e x1 -> x3) -> x2 :e binunion x0 x1 -> x3).
Axiom SNo_sqrtauxset_E : (forall x0 x1 x2 x3, x3 :e SNo_sqrtauxset x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> (forall x6, x6 :e x1 -> SNoLt 0 (add_SNo x5 x6) -> x3 = div_SNo (add_SNo x2 (mul_SNo x5 x6)) (add_SNo x5 x6) -> x4)) -> x4)).
Axiom add_SNo_Le3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom mul_SNo_nonneg_nonneg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe 0 (mul_SNo x0 x1)).
Axiom SNo_foil : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (mul_SNo x0 x2) (add_SNo (mul_SNo x0 x3) (add_SNo (mul_SNo x1 x2) (mul_SNo x1 x3)))).
Axiom add_SNo_rotate_4_1 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo x0 (add_SNo x1 (add_SNo x2 x3)) = add_SNo x3 (add_SNo x0 (add_SNo x1 x2))).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNo_add_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (add_SNo x0 (add_SNo x1 x2))).
Axiom add_SNo_minus_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x2 (add_SNo x0 (minus_SNo x1)) -> SNoLt (add_SNo x2 x1) x0).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom add_SNo_rotate_3_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x2 (add_SNo x0 x1)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom mul_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo x1 (mul_SNo x0 x2)).
Axiom SNo_foil_mm : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (add_SNo x0 (minus_SNo x1)) (add_SNo x2 (minus_SNo x3)) = add_SNo (mul_SNo x0 x2) (add_SNo (minus_SNo (mul_SNo x0 x3)) (add_SNo (minus_SNo (mul_SNo x1 x2)) (mul_SNo x1 x3)))).
Axiom SNoLt_minus_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt 0 (add_SNo x1 (minus_SNo x0))).
Axiom SNo_mul_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (mul_SNo x0 (mul_SNo x1 x2))).
Axiom add_SNo_minus_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 (minus_SNo x1)) x2 -> SNoLt x0 (add_SNo x2 x1)).
Axiom add_SNo_minus_Lt1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 (add_SNo x2 x1) -> SNoLt (add_SNo x0 (minus_SNo x1)) x2).
Theorem sqrt_SNo_nonneg_prop1a : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLe 0 x1 -> and (and (SNo (sqrt_SNo_nonneg x1)) (SNoLe 0 (sqrt_SNo_nonneg x1))) (mul_SNo (sqrt_SNo_nonneg x1) (sqrt_SNo_nonneg x1) = x1)) -> (forall x1, nat_p x1 -> and (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt (mul_SNo x2 x2) x0)) (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt x0 (mul_SNo x2 x2))))).
admit.
Qed.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom nonneg_mul_SNo_Le2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (mul_SNo x0 x1) (mul_SNo x2 x3)).
Theorem sqrt_SNo_nonneg_prop1b : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, nat_p x1 -> and (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt (mul_SNo x2 x2) x0)) (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt x0 (mul_SNo x2 x2)))) -> SNoCutP (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))).
admit.
Qed.
