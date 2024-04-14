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
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom add_SNo_minus_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 (minus_SNo x1)) x2 -> SNoLt x0 (add_SNo x2 x1)).
Axiom add_SNo_minus_R2' : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 (minus_SNo x1)) x1 = x0).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Theorem missingprop_e94cce6a23612d7cff310d62499df64cf528a3271aa6cb14f459be602d3b5ada : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (add_SNo x0 (minus_SNo x1)) x2 -> SNoLe x0 (add_SNo x2 x1)).
admit.
Qed.
Axiom add_SNo_minus_Lt1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 (add_SNo x2 x1) -> SNoLt (add_SNo x0 (minus_SNo x1)) x2).
Axiom add_SNo_minus_R2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 x1) (minus_SNo x1) = x0).
Theorem add_SNo_minus_Le1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 (add_SNo x2 x1) -> SNoLe (add_SNo x0 (minus_SNo x1)) x2).
admit.
Qed.
Axiom add_SNo_minus_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x2 (add_SNo x0 (minus_SNo x1)) -> SNoLt (add_SNo x2 x1) x0).
Theorem add_SNo_minus_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x2 (add_SNo x0 (minus_SNo x1)) -> SNoLe (add_SNo x2 x1) x0).
admit.
Qed.
Axiom add_SNo_minus_Lt2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x2 x1) x0 -> SNoLt x2 (add_SNo x0 (minus_SNo x1))).
Theorem add_SNo_minus_Le2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (add_SNo x2 x1) x0 -> SNoLe x2 (add_SNo x0 (minus_SNo x1))).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition exp_SNo_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec 1 (fun x1 : set => mul_SNo x0)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem exp_SNo_nat_0 : (forall x0, SNo x0 -> exp_SNo_nat x0 0 = 1).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Theorem exp_SNo_nat_S : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> exp_SNo_nat x0 (ordsucc x1) = mul_SNo x0 (exp_SNo_nat x0 x1))).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom SNo_1 : SNo 1.
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem SNo_exp_SNo_nat : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> SNo (exp_SNo_nat x0 x1))).
admit.
Qed.
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Axiom nat_1 : nat_p 1.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Theorem nat_exp_SNo_nat : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_SNo_nat x0 x1))).
admit.
Qed.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Axiom eps_0_1 : eps_ 0 = 1.
Axiom SNo_2 : SNo 2.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom eps_ordsucc_half_add : (forall x0, nat_p x0 -> add_SNo (eps_ (ordsucc x0)) (eps_ (ordsucc x0)) = eps_ x0).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem mul_SNo_eps_power_2 : (forall x0, nat_p x0 -> mul_SNo (eps_ x0) (exp_SNo_nat 2 x0) = 1).
admit.
Qed.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Theorem mul_SNo_eps_power_2' : (forall x0, nat_p x0 -> mul_SNo (exp_SNo_nat 2 x0) (eps_ x0) = 1).
admit.
Qed.
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Theorem exp_SNo_nat_mul_add : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_SNo (exp_SNo_nat x0 x1) (exp_SNo_nat x0 x2) = exp_SNo_nat x0 (add_SNo x1 x2)))).
admit.
Qed.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem exp_SNo_nat_mul_add' : (forall x0, SNo x0 -> (forall x1, x1 :e omega -> (forall x2, x2 :e omega -> mul_SNo (exp_SNo_nat x0 x1) (exp_SNo_nat x0 x2) = exp_SNo_nat x0 (add_SNo x1 x2)))).
admit.
Qed.
Axiom SNoLt_0_1 : SNoLt 0 1.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom pos_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt 0 x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNo_0 : SNo 0.
Theorem exp_SNo_nat_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> (forall x1, nat_p x1 -> SNoLt 0 (exp_SNo_nat x0 x1))).
admit.
Qed.
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom neg_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt x0 0 -> SNo x1 -> SNo x2 -> SNoLt x2 x1 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem mul_SNo_nonzero_cancel : (forall x0 x1 x2, SNo x0 -> (x0 = 0 -> (forall x3 : prop, x3)) -> SNo x1 -> SNo x2 -> mul_SNo x0 x1 = mul_SNo x0 x2 -> x1 = x2).
admit.
Qed.
Axiom SNoLt_0_2 : SNoLt 0 2.
Axiom add_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_SNo x0 x1 :e omega)).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Theorem mul_SNo_eps_eps_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_SNo (eps_ x0) (eps_ x1) = eps_ (add_SNo x0 x1))).
admit.
Qed.
