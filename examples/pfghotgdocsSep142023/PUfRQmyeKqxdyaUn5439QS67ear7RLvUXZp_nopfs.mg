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
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom In_ind : (forall x0 : set -> prop, (forall x1, (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, x0 x1)).
Theorem In_no4cycle : (forall x0 x1 x2 x3, x0 :e x1 -> x1 :e x2 -> x2 :e x3 -> x3 :e x0 -> False).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom SNo_0 : SNo Empty.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 Empty = Empty).
Theorem mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo Empty x0 = Empty).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom SNo_1 : SNo 1.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Theorem mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
admit.
Qed.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom mul_SNo_Lt : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x2 x0 -> SNoLt x3 x1 -> SNoLt (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Theorem pos_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt 0 x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom mul_SNo_Le : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x2 x0 -> SNoLe x3 x1 -> SNoLe (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
Theorem nonneg_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe 0 x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
admit.
Qed.
Theorem neg_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt x0 0 -> SNo x1 -> SNo x2 -> SNoLt x2 x1 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
admit.
Qed.
Theorem nonpos_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe x0 0 -> SNo x1 -> SNo x2 -> SNoLe x2 x1 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition abs_SNo : set -> set :=
 (fun x0 : set => If_i (SNoLe 0 x0) x0 (minus_SNo x0)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem nonneg_abs_SNo : (forall x0, SNoLe 0 x0 -> abs_SNo x0 = x0).
admit.
Qed.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Theorem not_nonneg_abs_SNo : (forall x0, not (SNoLe 0 x0) -> abs_SNo x0 = minus_SNo x0).
admit.
Qed.
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Theorem abs_SNo_0 : abs_SNo 0 = 0.
admit.
Qed.
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Theorem pos_abs_SNo : (forall x0, SNoLt 0 x0 -> abs_SNo x0 = x0).
admit.
Qed.
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Theorem neg_abs_SNo : (forall x0, SNo x0 -> SNoLt x0 0 -> abs_SNo x0 = minus_SNo x0).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem SNo_abs_SNo : (forall x0, SNo x0 -> SNo (abs_SNo x0)).
admit.
Qed.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Axiom minus_SNo_Lev : (forall x0, SNo x0 -> SNoLev (minus_SNo x0) = SNoLev x0).
Theorem abs_SNo_Lev : (forall x0, SNo x0 -> SNoLev (abs_SNo x0) = SNoLev x0).
admit.
Qed.
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom SNoLe_antisym : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe x1 x0 -> x0 = x1).
Axiom minus_SNo_Le_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe (minus_SNo x1) (minus_SNo x0)).
Theorem abs_SNo_minus : (forall x0, SNo x0 -> abs_SNo (minus_SNo x0) = abs_SNo x0).
admit.
Qed.
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Theorem abs_SNo_dist_swap : (forall x0 x1, SNo x0 -> SNo x1 -> abs_SNo (add_SNo x0 (minus_SNo x1)) = abs_SNo (add_SNo x1 (minus_SNo x0))).
admit.
Qed.
Axiom add_SNo_Lt3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Axiom add_SNo_Le3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x3)).
Theorem SNo_triangle : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe (abs_SNo (add_SNo x0 x1)) (add_SNo (abs_SNo x0) (abs_SNo x1))).
admit.
Qed.
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom add_SNo_minus_L2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (minus_SNo x0) (add_SNo x0 x1) = x1).
Theorem SNo_triangle2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (abs_SNo (add_SNo x0 (minus_SNo x2))) (add_SNo (abs_SNo (add_SNo x0 (minus_SNo x1))) (abs_SNo (add_SNo x1 (minus_SNo x2))))).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter SetAdjoin "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" "1f3a09356e470bff37ef2408148f440357b92f92f9a27c828b37d777eb41ddc6" *)
Parameter SetAdjoin : set -> set -> set.
Definition eps_ : set -> set :=
 (fun x0 : set => binunion (Sing 0) {SetAdjoin (ordsucc x1) (Sing 1) | x1 :e x0}).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom SNoLev_eps_ : (forall x0, x0 :e omega -> SNoLev (eps_ x0) = ordsucc x0).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom SNoLev_0_eq_0 : (forall x0, SNo x0 -> SNoLev x0 = 0 -> x0 = 0).
Axiom eps_ordinal_In_eq_0 : (forall x0 x1, ordinal x1 -> x1 :e eps_ x0 -> x1 = 0).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Theorem SNo_pos_eps_Lt : (forall x0, nat_p x0 -> (forall x1, x1 :e SNoS_ (ordsucc x0) -> SNoLt 0 x1 -> SNoLt (eps_ x0) x1)).
admit.
Qed.
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Theorem SNo_pos_eps_Le : (forall x0, nat_p x0 -> (forall x1, x1 :e SNoS_ (ordsucc (ordsucc x0)) -> SNoLt 0 x1 -> SNoLe (eps_ x0) x1)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom nat_ordsucc_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e ordsucc x0 -> x1 c= x0)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
Axiom SNoEq_tra_ : (forall x0 x1 x2 x3, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x3 -> SNoEq_ x0 x1 x3).
Axiom SNoEq_sym_ : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x1).
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom SNoEq_I : (forall x0 x1 x2, (forall x3, x3 :e x0 -> iff (x3 :e x1) (x3 :e x2)) -> SNoEq_ x0 x1 x2).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Theorem eps_SNo_eq : (forall x0, nat_p x0 -> (forall x1, x1 :e SNoS_ (ordsucc x0) -> SNoLt 0 x1 -> SNoEq_ (SNoLev x1) (eps_ x0) x1 -> (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 = eps_ x3) -> x2) -> x2))).
admit.
Qed.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem eps_SNoCutP : (forall x0, x0 :e omega -> SNoCutP (Sing 0) (Repl x0 eps_)).
admit.
Qed.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Axiom binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Axiom SNo_eps_decr : (forall x0, x0 :e omega -> (forall x1, x1 :e x0 -> SNoLt (eps_ x0) (eps_ x1))).
Axiom famunion_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (famunion 0 x0) 0 -> x1 0 (famunion 0 x0)).
Axiom binunion_idr : (forall x0, forall x1 : set -> set -> prop, x1 (binunion x0 0) x0 -> x1 x0 (binunion x0 0)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom Subq_binunion_eq : (forall x0 x1, forall x2 : prop -> prop -> prop, x2 (x0 c= x1) (binunion x0 x1 = x1) -> x2 (binunion x0 x1 = x1) (x0 c= x1)).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom SNoLev_0 : SNoLev 0 = 0.
Axiom In_0_1 : 0 :e 1.
Theorem eps_SNoCut : (forall x0, x0 :e omega -> eps_ x0 = SNoCut (Sing 0) (Repl x0 eps_)).
admit.
Qed.
Axiom nat_complete_ind : (forall x0 : set -> prop, (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, nat_p x1 -> x0 x1)).
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom add_SNo_eq : (forall x0, SNo x0 -> (forall x1, SNo x1 -> add_SNo x0 x1 = SNoCut (binunion {add_SNo x3 x1 | x3 :e SNoL x0} (Repl (SNoL x1) (add_SNo x0))) (binunion {add_SNo x3 x1 | x3 :e SNoR x0} (Repl (SNoR x1) (add_SNo x0))))).
Axiom SNoCut_ext : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x1 -> SNoLt (SNoCut x2 x3) x4) -> (forall x4, x4 :e x2 -> SNoLt x4 (SNoCut x0 x1)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoCut x0 x1 = SNoCut x2 x3).
Axiom add_SNo_SNoCutP : (forall x0 x1, SNo x0 -> SNo x1 -> SNoCutP (binunion {add_SNo x2 x1 | x2 :e SNoL x0} (Repl (SNoL x1) (add_SNo x0))) (binunion {add_SNo x2 x1 | x2 :e SNoR x0} (Repl (SNoR x1) (add_SNo x0)))).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom andEL : (forall x0 x1 : prop, and x0 x1 -> x0).
Axiom andER : (forall x0 x1 : prop, and x0 x1 -> x1).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Theorem eps_ordsucc_half_add : (forall x0, nat_p x0 -> add_SNo (eps_ (ordsucc x0)) (eps_ (ordsucc x0)) = eps_ x0).
admit.
Qed.
Axiom nat_1 : nat_p 1.
Theorem SNo_eps_1 : SNo (eps_ 1).
admit.
Qed.
Axiom nat_0 : nat_p 0.
Axiom eps_0_1 : eps_ 0 = 1.
Theorem eps_1_half_eq1 : add_SNo (eps_ 1) (eps_ 1) = 1.
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
Axiom add_nat_1_1_2 : add_nat 1 1 = 2.
Theorem add_SNo_1_1_2 : add_SNo 1 1 = 2.
admit.
Qed.
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Theorem eps_1_half_eq2 : mul_SNo 2 (eps_ 1) = 1.
admit.
Qed.
Axiom SNo_2 : SNo 2.
Theorem eps_1_half_eq3 : mul_SNo (eps_ 1) 2 = 1.
admit.
Qed.
Theorem eps_1_split_eq : (forall x0, SNo x0 -> add_SNo (mul_SNo (eps_ 1) x0) (mul_SNo (eps_ 1) x0) = x0).
admit.
Qed.
Theorem eps_1_split_Le_bd : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 (mul_SNo (eps_ 1) x0) -> SNoLe x2 (mul_SNo (eps_ 1) x0) -> SNoLe (add_SNo x1 x2) x0).
admit.
Qed.
Theorem eps_1_split_LeLt_bd : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 (mul_SNo (eps_ 1) x0) -> SNoLt x2 (mul_SNo (eps_ 1) x0) -> SNoLt (add_SNo x1 x2) x0).
admit.
Qed.
Axiom add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
Theorem eps_1_split_LtLe_bd : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 (mul_SNo (eps_ 1) x0) -> SNoLe x2 (mul_SNo (eps_ 1) x0) -> SNoLt (add_SNo x1 x2) x0).
admit.
Qed.
Theorem eps_1_split_Lt_bd : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 (mul_SNo (eps_ 1) x0) -> SNoLt x2 (mul_SNo (eps_ 1) x0) -> SNoLt (add_SNo x1 x2) x0).
admit.
Qed.
Definition SNo_ord_seq : set -> (set -> set) -> prop :=
 (fun x0 : set => fun x1 : set -> set => forall x2, x2 :e x0 -> SNo (x1 x2)).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Definition missingname_c2c6be4a6894d20435c66e16fcd58650c96e6bf73276341174d1448c569a7990 : set -> (set -> set) -> set -> prop :=
 (fun x0 : set => fun x1 : set -> set => fun x2 : set => forall x3, SNo x3 -> SNoLt 0 x3 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (forall x6, x6 :e setminus x0 x5 -> SNoLt (abs_SNo (add_SNo (x1 x6) (minus_SNo x2))) x3) -> x4) -> x4)).
Definition missingname_2c86f64dbef3ef87bdd31e0fc742f4610572f8fe58fd3815dea1e66ec881f755 : set -> (set -> set) -> prop :=
 (fun x0 : set => fun x1 : set -> set => forall x2, SNo x2 -> SNoLt 0 x2 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5, x5 :e setminus x0 x4 -> (forall x6, x6 :e setminus x0 x4 -> SNoLt (abs_SNo (add_SNo (x1 x5) (minus_SNo (x1 x6)))) x2)) -> x3) -> x3)).
Axiom ordinal_linear : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 c= x1) (x1 c= x0)).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (mul_SNo x0 x1)).
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Theorem missingprop_bebf142b4e02bf5be071228ae3a49177bccdb1899cd21e76e8099dcfb6cdf926 : (forall x0, ordinal x0 -> (forall x1 : set -> set, SNo_ord_seq x0 x1 -> (forall x2, SNo x2 -> missingname_c2c6be4a6894d20435c66e16fcd58650c96e6bf73276341174d1448c569a7990 x0 x1 x2 -> (forall x3, SNo x3 -> missingname_c2c6be4a6894d20435c66e16fcd58650c96e6bf73276341174d1448c569a7990 x0 x1 x3 -> not (SNoLt x2 x3))))).
admit.
Qed.
Theorem missingprop_97c1775bc35517bf2f77b11299d5afb73016e992658fcef7851de8df0b9b210c : (forall x0, ordinal x0 -> (forall x1 : set -> set, SNo_ord_seq x0 x1 -> (forall x2, SNo x2 -> missingname_c2c6be4a6894d20435c66e16fcd58650c96e6bf73276341174d1448c569a7990 x0 x1 x2 -> (forall x3, SNo x3 -> missingname_c2c6be4a6894d20435c66e16fcd58650c96e6bf73276341174d1448c569a7990 x0 x1 x3 -> x2 = x3)))).
admit.
Qed.
