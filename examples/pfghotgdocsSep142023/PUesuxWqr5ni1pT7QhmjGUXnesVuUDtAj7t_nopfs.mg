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
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Definition SNo_max_of : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x1 :e x0) (SNo x1)) (forall x2, x2 :e x0 -> SNo x2 -> SNoLe x2 x1)).
Definition SNo_min_of : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x1 :e x0) (SNo x1)) (forall x2, x2 :e x0 -> SNo x2 -> SNoLe x1 x2)).
Axiom SNoLe_antisym : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe x1 x0 -> x0 = x1).
Theorem missingprop_8825b34749f3298be3b0ac6f1586bf2a7146d2944891c7645bdbfabf7009fed2 : (forall x0 x1 x2, SNo_max_of x0 x1 -> SNo_max_of x0 x2 -> x1 = x2).
admit.
Qed.
Theorem missingprop_b884d11e4a0342dec861995a346cb1fbf7098f4ec3c4b43e2dde1f5894fd080d : (forall x0 x1 x2, SNo_min_of x0 x1 -> SNo_min_of x0 x2 -> x1 = x2).
admit.
Qed.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_1 : nat_p 1.
Axiom eps_1_split_eq : (forall x0, SNo x0 -> add_SNo (mul_SNo (eps_ 1) x0) (mul_SNo (eps_ 1) x0) = x0).
Theorem missingprop_66aaedebd64d62981649248d7d5461c3339fc47a6d6e4973bc85e661c7966c66 : (forall x0, SNo x0 -> x0 = mul_SNo (eps_ 1) (add_SNo x0 x0)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem Repl_inv_eq : (forall x0 : set -> prop, forall x1 x2 : set -> set, (forall x3, x0 x3 -> x2 (x1 x3) = x3) -> (forall x3, (forall x4, x4 :e x3 -> x0 x4) -> Repl (Repl x3 x1) x2 = x3)).
admit.
Qed.
Theorem Repl_invol_eq : (forall x0 : set -> prop, forall x1 : set -> set, (forall x2, x0 x2 -> x1 (x1 x2) = x2) -> (forall x2, (forall x3, x3 :e x2 -> x0 x3) -> Repl (Repl x2 x1) x1 = x2)).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom minus_SNo_Le_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe (minus_SNo x1) (minus_SNo x0)).
Theorem minus_SNo_max_min : (forall x0 x1, (forall x2, x2 :e x0 -> SNo x2) -> SNo_max_of x0 x1 -> SNo_min_of (Repl x0 minus_SNo) (minus_SNo x1)).
admit.
Qed.
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Theorem minus_SNo_max_min' : (forall x0 x1, (forall x2, x2 :e x0 -> SNo x2) -> SNo_max_of (Repl x0 minus_SNo) x1 -> SNo_min_of x0 (minus_SNo x1)).
admit.
Qed.
Theorem minus_SNo_min_max : (forall x0 x1, (forall x2, x2 :e x0 -> SNo x2) -> SNo_min_of x0 x1 -> SNo_max_of (Repl x0 minus_SNo) (minus_SNo x1)).
admit.
Qed.
Theorem missingprop_9ab18224f17818922eccece15c4b32ba1f1eb6d3cfd5264016a58a85faf4d355 : (forall x0 x1, (forall x2, x2 :e x0 -> SNo x2) -> SNo_min_of (Repl x0 minus_SNo) x1 -> SNo_max_of x0 (minus_SNo x1)).
admit.
Qed.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
Axiom SNoLev_ind : (forall x0 : set -> prop, (forall x1, SNo x1 -> (forall x2, x2 :e SNoS_ (SNoLev x1) -> x0 x2) -> x0 x1) -> (forall x1, SNo x1 -> x0 x1)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom SNoLt_SNoL_or_SNoR_impred : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, x3 :e SNoL x1 -> x3 :e SNoR x0 -> x2) -> (x0 :e SNoL x1 -> x2) -> (x1 :e SNoR x0 -> x2) -> x2)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom add_SNo_SNoR_interpolate : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoR (add_SNo x0 x1) -> or (forall x3 : prop, (forall x4, and (x4 :e SNoR x0) (SNoLe (add_SNo x4 x1) x2) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e SNoR x1) (SNoLe (add_SNo x0 x4) x2) -> x3) -> x3))).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_SNoL_interpolate : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoL (add_SNo x0 x1) -> or (forall x3 : prop, (forall x4, and (x4 :e SNoL x0) (SNoLe x2 (add_SNo x4 x1)) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e SNoL x1) (SNoLe x2 (add_SNo x0 x4)) -> x3) -> x3))).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom SNoR_SNoS_ : (forall x0, SNoR x0 c= SNoS_ (SNoLev x0)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom add_SNo_Lt3b : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Theorem double_SNo_max_1 : (forall x0 x1, SNo x0 -> SNo_max_of (SNoL x0) x1 -> (forall x2, SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x1 x2) (add_SNo x0 x0) -> (forall x3 : prop, (forall x4, and (x4 :e SNoR x2) (add_SNo x1 x4 = add_SNo x0 x0) -> x3) -> x3))).
admit.
Qed.
Axiom minus_SNo_Lev : (forall x0, SNo x0 -> SNoLev (minus_SNo x0) = SNoLev x0).
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom minus_SNo_Lt_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt (minus_SNo x1) (minus_SNo x0)).
Theorem SNoL_minus_SNoR : (forall x0, SNo x0 -> SNoL (minus_SNo x0) = Repl (SNoR x0) minus_SNo).
admit.
Qed.
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Theorem double_SNo_min_1 : (forall x0 x1, SNo x0 -> SNo_min_of (SNoR x0) x1 -> (forall x2, SNo x2 -> SNoLt x2 x0 -> SNoLt (add_SNo x0 x0) (add_SNo x1 x2) -> (forall x3 : prop, (forall x4, and (x4 :e SNoL x2) (add_SNo x1 x4 = add_SNo x0 x0) -> x3) -> x3))).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom omega_SNoS_omega : omega c= SNoS_ omega.
Axiom nat_0 : nat_p 0.
Axiom add_SNo_1_ordsucc : (forall x0, x0 :e omega -> add_SNo x0 1 = ordsucc x0).
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom add_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> add_SNo x0 x1 :e SNoS_ omega)).
Axiom SNo_eps_SNoS_omega : (forall x0, x0 :e omega -> eps_ x0 :e SNoS_ omega).
Theorem nonneg_diadic_rational_p_SNoS_omega : (forall x0, x0 :e omega -> (forall x1, nat_p x1 -> mul_SNo (eps_ x0) x1 :e SNoS_ omega)).
admit.
Qed.
Definition missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (forall x3 : prop, (forall x4, and (x4 :e omega) (or (x0 = mul_SNo (eps_ x2) x4) (x0 = minus_SNo (mul_SNo (eps_ x2) x4))) -> x3) -> x3) -> x1) -> x1).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom minus_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> minus_SNo x0 :e SNoS_ omega).
Theorem missingprop_1fc7df5df4068e8f70367e459129034ed8bd4d3ba7bb4f460e76807efd078459 : (forall x0, missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 x0 -> x0 :e SNoS_ omega).
admit.
Qed.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom omega_ordinal : ordinal omega.
Theorem missingprop_33055a47c34eaf2fd33f60f47cd922580aa0f552464a8bd29f983f4c1f22c189 : (forall x0, missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 x0 -> SNo x0).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom eps_0_1 : eps_ 0 = 1.
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Theorem missingprop_34ad79a56689aa822beb7177f6d0efeec0b74a3c0b0b168ec3087937ccca081d : (forall x0, x0 :e omega -> missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 x0).
admit.
Qed.
Theorem missingprop_47f878e3bff4e9d8b8a670294d8a8d3ba20a6b538506a7d6839050bc029186d3 : (forall x0, x0 :e omega -> missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 (eps_ x0)).
admit.
Qed.
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem missingprop_178d4c1a901831a37023ef839c159b36ca135a6b1e935c6c97fa3d8f24f936ef : (forall x0, missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 x0 -> missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 (minus_SNo x0)).
admit.
Qed.
Axiom add_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_SNo x0 x1 :e omega)).
Axiom mul_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_SNo x0 x1 :e omega)).
Axiom mul_SNo_eps_eps_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_SNo (eps_ x0) (eps_ x1) = eps_ (add_SNo x0 x1))).
Axiom mul_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (mul_SNo x0 x1) (mul_SNo x2 x3) = mul_SNo (mul_SNo x0 x2) (mul_SNo x1 x3)).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_minus_minus : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) (minus_SNo x1) = mul_SNo x0 x1).
Theorem missingprop_4fe1ea21f391fb86306308f153a6be3dbd1ec4737ac62af11697481c51f354c5 : (forall x0 x1, missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 x0 -> missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 x1 -> missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 (mul_SNo x0 x1)).
admit.
Qed.
Axiom ordinal_Subq_SNoLe : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoLe x0 x1).
Axiom ordinal_Empty : ordinal 0.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom Subq_Empty : (forall x0, 0 c= x0).
Theorem omega_nonneg : (forall x0, x0 :e omega -> SNoLe 0 x0).
admit.
Qed.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom mul_SNo_eps_power_2 : (forall x0, nat_p x0 -> mul_SNo (eps_ x0) (exp_SNo_nat 2 x0) = 1).
Axiom nat_exp_SNo_nat : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_SNo_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Axiom SNo_0 : SNo 0.
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom nonneg_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe 0 x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
Theorem missingprop_51fcd19d7bcbe442564331ee722a140d91d5b6bc7b80a6bca9e8c4432478f60e : (forall x0 x1, missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 x0 -> missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> missingname_aa3022928e9bd683f97e18ff14a7b598daeba5ca43bb6fd75b75d499e659b7f3 (add_SNo x0 x1)).
admit.
Qed.
Axiom mul_SNo_nonzero_cancel : (forall x0 x1 x2, SNo x0 -> (x0 = 0 -> (forall x3 : prop, x3)) -> SNo x1 -> SNo x2 -> mul_SNo x0 x1 = mul_SNo x0 x2 -> x1 = x2).
Axiom SNo_2 : SNo 2.
Axiom neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
Axiom eps_1_half_eq2 : mul_SNo 2 (eps_ 1) = 1.
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom SNo_1 : SNo 1.
Theorem double_eps_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 x0 = add_SNo x1 x2 -> x0 = mul_SNo (eps_ 1) (add_SNo x1 x2)).
admit.
Qed.
