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
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom omega_ordinal : ordinal omega.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Theorem omega_SNoS_omega : omega c= SNoS_ omega.
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_1 : nat_p 1.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem add_SNo_1_ordsucc : (forall x0, x0 :e omega -> add_SNo x0 1 = ordsucc x0).
admit.
Qed.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Parameter abs_SNo : set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom SNo_0 : SNo 0.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom abs_SNo_minus : (forall x0, SNo x0 -> abs_SNo (minus_SNo x0) = abs_SNo x0).
Axiom pos_abs_SNo : (forall x0, SNoLt 0 x0 -> abs_SNo x0 = x0).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Axiom SNo_eps_SNoS_omega : (forall x0, x0 :e omega -> eps_ x0 :e SNoS_ omega).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom SNo_eps_decr : (forall x0, x0 :e omega -> (forall x1, x1 :e x0 -> SNoLt (eps_ x0) (eps_ x1))).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Theorem SNo_prereal_incr_lower_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> (forall x1, x1 :e SNoS_ omega -> (forall x2, x2 :e omega -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) (eps_ x2)) -> x1 = x0) -> (forall x1, x1 :e omega -> (forall x2 : prop, (forall x3, and (x3 :e SNoS_ omega) (and (SNoLt x3 x0) (SNoLt x0 (add_SNo x3 (eps_ x1)))) -> x2) -> x2)) -> (forall x1, x1 :e omega -> (forall x2 : prop, (forall x3, x3 :e SNoS_ omega -> SNoLt 0 x3 -> SNoLt x3 x0 -> SNoLt x0 (add_SNo x3 (eps_ x1)) -> x2) -> x2))).
admit.
Qed.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom pos_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt 0 x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem pos_mul_SNo_Lt' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x2 -> SNoLt x0 x1 -> SNoLt (mul_SNo x0 x2) (mul_SNo x1 x2)).
admit.
Qed.
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem pos_mul_SNo_Lt2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (mul_SNo x0 x1) (mul_SNo x2 x3)).
admit.
Qed.
Axiom nonneg_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe 0 x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem nonneg_mul_SNo_Le' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe 0 x2 -> SNoLe x0 x1 -> SNoLe (mul_SNo x0 x2) (mul_SNo x1 x2)).
admit.
Qed.
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Theorem nonneg_mul_SNo_Le2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (mul_SNo x0 x1) (mul_SNo x2 x3)).
admit.
Qed.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom exp_SNo_nat_0 : (forall x0, SNo x0 -> exp_SNo_nat x0 0 = 1).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Axiom exp_SNo_nat_S : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> exp_SNo_nat x0 (ordsucc x1) = mul_SNo x0 (exp_SNo_nat x0 x1))).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom SNo_1 : SNo 1.
Axiom SNo_exp_SNo_nat : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> SNo (exp_SNo_nat x0 x1))).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom SNoLt_0_1 : SNoLt 0 1.
Theorem exp_SNo_1_bd : (forall x0, SNo x0 -> SNoLe 1 x0 -> (forall x1, nat_p x1 -> SNoLe 1 (exp_SNo_nat x0 x1))).
admit.
Qed.
Axiom SNo_2 : SNo 2.
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom SNoLt_1_2 : SNoLt 1 2.
Theorem exp_SNo_2_bd : (forall x0, nat_p x0 -> SNoLt x0 (exp_SNo_nat 2 x0)).
admit.
Qed.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom mul_SNo_eps_power_2 : (forall x0, nat_p x0 -> mul_SNo (eps_ x0) (exp_SNo_nat 2 x0) = 1).
Theorem eps_bd_1 : (forall x0, x0 :e omega -> SNoLe (eps_ x0) 1).
admit.
Qed.
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Theorem SNo_foil : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (mul_SNo x0 x2) (add_SNo (mul_SNo x0 x3) (add_SNo (mul_SNo x1 x2) (mul_SNo x1 x3)))).
admit.
Qed.
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Theorem mul_SNo_minus_minus : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) (minus_SNo x1) = mul_SNo x0 x1).
admit.
Qed.
Axiom add_SNo_Lt3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
Theorem add_SNo_Lt4 : (forall x0 x1 x2 x3 x4 x5, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNoLt x0 x3 -> SNoLt x1 x4 -> SNoLt x2 x5 -> SNoLt (add_SNo x0 (add_SNo x1 x2)) (add_SNo x3 (add_SNo x4 x5))).
admit.
Qed.
Theorem mul_SNo_Lt1_pos_Lt : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 1 -> SNoLt 0 x1 -> SNoLt (mul_SNo x0 x1) x1).
admit.
Qed.
Theorem mul_SNo_Le1_nonneg_Le : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 1 -> SNoLe 0 x1 -> SNoLe (mul_SNo x0 x1) x1).
admit.
Qed.
Theorem SNo_mul_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (mul_SNo x0 (mul_SNo x1 x2))).
admit.
Qed.
Theorem missingprop_2b5e0be3fdd1e0beaea0a0bbb8c8dcbe295c4466d682e87cc55cff507dfe0268 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo (mul_SNo x0 (mul_SNo x1 (mul_SNo x2 x3)))).
admit.
Qed.
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Theorem missingprop_bfbed5c576665b09b80b24799a8dbc8abedf700a4bda24c050d1b8d1f758cce9 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo x0 (mul_SNo x1 (mul_SNo x2 x3)) = mul_SNo (mul_SNo x0 (mul_SNo x1 x2)) x3).
admit.
Qed.
Theorem mul_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo x1 (mul_SNo x0 x2)).
admit.
Qed.
Theorem missingprop_75c821312b32bd62e8cde64d5bd0091ffa58fa022476a969b48d9314e191d972 : (forall x0 x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo x0 (mul_SNo x1 (mul_SNo x2 x3)) = mul_SNo x0 (mul_SNo x2 (mul_SNo x1 x3))).
admit.
Qed.
Theorem mul_SNo_com_3b_1_2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (mul_SNo x0 x1) x2 = mul_SNo (mul_SNo x0 x2) x1).
admit.
Qed.
Theorem mul_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (mul_SNo x0 x1) (mul_SNo x2 x3) = mul_SNo (mul_SNo x0 x2) (mul_SNo x1 x3)).
admit.
Qed.
Theorem mul_SNo_rotate_3_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo x2 (mul_SNo x0 x1)).
admit.
Qed.
Theorem mul_SNo_rotate_4_1 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo x0 (mul_SNo x1 (mul_SNo x2 x3)) = mul_SNo x3 (mul_SNo x0 (mul_SNo x1 x2))).
admit.
Qed.
Theorem missingprop_305c941cfd7ab4beb34887f93a32ac1eea31589c106996d6116b806592159515 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> mul_SNo x0 (mul_SNo x1 (mul_SNo x2 (mul_SNo x3 x4))) = mul_SNo x4 (mul_SNo x0 (mul_SNo x1 (mul_SNo x2 x3)))).
admit.
Qed.
Theorem missingprop_0d426297a1a45233eace9e6d9cf8d0d8ff98411e74d27e73cb6c20f53846c8f5 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> mul_SNo x0 (mul_SNo x1 (mul_SNo x2 (mul_SNo x3 x4))) = mul_SNo x3 (mul_SNo x4 (mul_SNo x0 (mul_SNo x1 x2)))).
admit.
Qed.
