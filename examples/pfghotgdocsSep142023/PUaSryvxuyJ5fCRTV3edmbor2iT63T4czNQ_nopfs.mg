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
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom mul_nat_1R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 1) x0 -> x1 x0 (mul_nat x0 1)).
Axiom In_0_2 : 0 :e 2.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
Axiom nat_1 : nat_p 1.
Axiom nat_0 : nat_p 0.
Axiom add_nat_0L : (forall x0, nat_p x0 -> add_nat 0 x0 = x0).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Theorem nat_In_double_S : (forall x0, nat_p x0 -> x0 :e mul_nat 2 (ordsucc x0)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Definition odd_nat : set -> prop :=
 (fun x0 : set => and (x0 :e omega) (forall x1, x1 :e omega -> x0 = mul_nat 2 x1 -> (forall x2 : prop, x2))).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Theorem odd_nat_1 : odd_nat 1.
admit.
Qed.
Definition even_nat : set -> prop :=
 (fun x0 : set => and (x0 :e omega) (forall x1 : prop, (forall x2, and (x2 :e omega) (x0 = mul_nat 2 x2) -> x1) -> x1)).
Theorem even_nat_not_odd_nat : (forall x0, even_nat x0 -> not (odd_nat x0)).
admit.
Qed.
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Theorem even_nat_S_S : (forall x0, even_nat x0 -> even_nat (ordsucc (ordsucc x0))).
admit.
Qed.
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Axiom ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
Theorem even_nat_S_S_inv : (forall x0, nat_p x0 -> even_nat (ordsucc (ordsucc x0)) -> even_nat x0).
admit.
Qed.
Theorem even_nat_double : (forall x0, nat_p x0 -> even_nat (mul_nat 2 x0)).
admit.
Qed.
(* Parameter exactly1of2 "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" "163602f90de012a7426ee39176523ca58bc964ccde619b652cb448bd678f7e21" *)
Parameter exactly1of2 : prop -> prop -> prop.
Axiom exactly1of2_I1 : (forall x0 x1 : prop, x0 -> not x1 -> exactly1of2 x0 x1).
Axiom exactly1of2_E : (forall x0 x1 : prop, exactly1of2 x0 x1 -> (forall x2 : prop, (x0 -> not x1 -> x2) -> (not x0 -> x1 -> x2) -> x2)).
Axiom exactly1of2_I2 : (forall x0 x1 : prop, not x0 -> x1 -> exactly1of2 x0 x1).
Theorem even_nat_xor_S : (forall x0, nat_p x0 -> exactly1of2 (even_nat x0) (even_nat (ordsucc x0))).
admit.
Qed.
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem not_even_nat_S_double : (forall x0, nat_p x0 -> not (even_nat (ordsucc (mul_nat 2 x0)))).
admit.
Qed.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Axiom inj_Cantor : (forall x0, forall x1 : set -> set, not (inj (Power x0) x0 x1)).
Theorem Cantor_atleastp : (forall x0, not (atleastp (Power x0) x0)).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Axiom eps_1_half_eq3 : mul_SNo (eps_ 1) 2 = 1.
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom SNo_eps_1 : SNo (eps_ 1).
Axiom SNo_2 : SNo 2.
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Theorem double_omega_cancel : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat 2 x0 = mul_nat 2 x1 -> x0 = x1)).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom nonneg_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe 0 x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNo_0 : SNo 0.
Theorem mul_SNo_nonneg_nonneg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe 0 (mul_SNo x0 x1)).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition int : set :=
 binunion omega (Repl omega minus_SNo).
Definition diadic_rational_p : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (forall x3 : prop, (forall x4, and (x4 :e int) (x0 = mul_SNo (eps_ x2) x4) -> x3) -> x3) -> x1) -> x1).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom omega_ordinal : ordinal omega.
Axiom diadic_rational_p_SNoS_omega : (forall x0, diadic_rational_p x0 -> x0 :e SNoS_ omega).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom ordinal_ordsucc_SNo_eq : (forall x0, ordinal x0 -> ordsucc x0 = add_SNo 1 x0).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNo_1 : SNo 1.
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
Axiom ordinal_Subq_SNoLe : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoLe x0 x1).
Axiom ordinal_Empty : ordinal 0.
Axiom Subq_Empty : (forall x0, 0 c= x0).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom minus_SNo_Le_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe (minus_SNo x1) (minus_SNo x0)).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Theorem diadic_rational_p_pos_eps_between : (forall x0, diadic_rational_p x0 -> SNoLt 0 x0 -> (forall x1 : prop, (forall x2, and (x2 :e omega) (SNoLe (eps_ x2) x0) -> x1) -> x1)).
admit.
Qed.
(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Parameter abs_SNo : set -> set.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
(* Parameter SetAdjoin "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" "1f3a09356e470bff37ef2408148f440357b92f92f9a27c828b37d777eb41ddc6" *)
Parameter SetAdjoin : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition SNoElts_ : set -> set :=
 (fun x0 : set => binunion x0 {SetAdjoin x1 (Sing 1) | x1 :e x0}).
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Definition PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)).
Definition SNoEq_ : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => PNoEq_ x0 (fun x3 : set => x3 :e x1) (fun x3 : set => x3 :e x2)).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom SNoLtI2 : (forall x0 x1, SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> SNoLt x0 x1).
Axiom restr_SNoLev : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNoLev (binintersect x0 (SNoElts_ x1)) = x1)).
Axiom SNoEq_tra_ : (forall x0 x1 x2 x3, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x3 -> SNoEq_ x0 x1 x3).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom minus_SNo_Lt_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt (minus_SNo x1) (minus_SNo x0)).
Axiom SNoLtI3 : (forall x0 x1, SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> SNoLt x0 x1).
Axiom SNoEq_sym_ : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x1).
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom restr_SNoEq : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNoEq_ x1 (binintersect x0 (SNoElts_ x1)) x0)).
Axiom SNoS_omega_diadic_rational_p : (forall x0, x0 :e SNoS_ omega -> diadic_rational_p x0).
Axiom add_SNo_Lt1_cancel : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1) -> SNoLt x0 x2).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom add_SNo_minus_R2' : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 (minus_SNo x1)) x1 = x0).
Axiom add_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> add_SNo x0 x1 :e SNoS_ omega)).
Axiom minus_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> minus_SNo x0 :e SNoS_ omega).
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom restr_SNo_ : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNo_ x1 (binintersect x0 (SNoElts_ x1)))).
Axiom abs_SNo_dist_swap : (forall x0 x1, SNo x0 -> SNo x1 -> abs_SNo (add_SNo x0 (minus_SNo x1)) = abs_SNo (add_SNo x1 (minus_SNo x0))).
Axiom nonneg_abs_SNo : (forall x0, SNoLe 0 x0 -> abs_SNo x0 = x0).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNoLev_uniq : (forall x0 x1 x2, ordinal x1 -> ordinal x2 -> SNo_ x1 x0 -> SNo_ x2 x0 -> x1 = x2).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Axiom SNo_SNo : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNo x1)).
Theorem missingprop_179251ed39d6affd04dd313b42d1f602c18cbb5e98db72901e760491e6149a15 : (forall x0, SNo_ omega x0 -> (forall x1, x1 :e SNoS_ omega -> (forall x2, x2 :e omega -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) (eps_ x2)) -> or (and (nIn (SNoLev x1) x0) (forall x2, x2 :e omega -> SNoLev x1 :e x2 -> x2 :e x0)) (and (SNoLev x1 :e x0) (forall x2, x2 :e omega -> SNoLev x1 :e x2 -> nIn x2 x0)))).
admit.
Qed.
Axiom minus_SNo_In : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> x1 :e x0 -> nIn x1 (minus_SNo x0))).
Axiom SNo_omega : SNo omega.
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
Theorem nat_nIn_minus_SNo_omega : (forall x0, x0 :e omega -> nIn x0 (minus_SNo omega)).
admit.
Qed.
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set -> (set -> prop) -> (set -> set) -> set.
Definition PSNo : set -> (set -> prop) -> set :=
 (fun x0 : set => fun x1 : set -> prop => binunion (Sep x0 x1) (ReplSep x0 (fun x2 : set => not (x1 x2)) (fun x2 : set => SetAdjoin x2 (Sing 1)))).
Axiom real_I : (forall x0, x0 :e SNoS_ (ordsucc omega) -> (x0 = omega -> (forall x1 : prop, x1)) -> (x0 = minus_SNo omega -> (forall x1 : prop, x1)) -> (forall x1, x1 :e SNoS_ omega -> (forall x2, x2 :e omega -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) (eps_ x2)) -> x1 = x0) -> x0 :e real).
Axiom ordsucc_omega_ordinal : ordinal (ordsucc omega).
Axiom nat_3 : nat_p 3.
Axiom SNoLev_uniq2 : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNoLev x1 = x0)).
Axiom SNo_PSNo : (forall x0, ordinal x0 -> (forall x1 : set -> prop, SNo_ x0 (PSNo x0 x1))).
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom ReplSepI : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e x0 -> x1 x3 -> x2 x3 :e ReplSep x0 x1 x2).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
Axiom tagged_not_ordinal : (forall x0, not (ordinal (SetAdjoin x0 (Sing 1)))).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem atleastp_Power_omega_real : atleastp (Power omega) real.
admit.
Qed.
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Theorem real_uncountable : not (equip omega real).
admit.
Qed.
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Axiom explicit_Field_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5)) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> (x5 = x1 -> (forall x6 : prop, x6)) -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x4 x5 x7 = x2) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> explicit_Field x0 x1 x2 x3 x4).
Axiom real_add_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_SNo x0 x1 :e real)).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom real_SNo : (forall x0, x0 :e real -> SNo x0).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom real_0 : 0 :e real.
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Axiom real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom real_1 : 1 :e real.
Axiom nonzero_real_recip_ex : (forall x0, x0 :e real -> (x0 = 0 -> (forall x1 : prop, x1)) -> (forall x1 : prop, (forall x2, and (x2 :e real) (mul_SNo x0 x2 = 1) -> x1) -> x1)).
Theorem explicit_Field_real : explicit_Field real 0 1 add_SNo mul_SNo.
admit.
Qed.
(* Parameter explicit_OrderedField "1195f96dcd143e4b896b4c1eb080d1fb877084debc58a8626d3dcf7a14ce8df7" "a18f7bca989a67fb7dc6df8e6c094372c26fa2c334578447d3314616155afb72" *)
Parameter explicit_OrderedField : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Axiom explicit_OrderedField_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 x7 x8 -> x5 x6 x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> iff (and (x5 x6 x7) (x5 x7 x6)) (x6 = x7))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> or (x5 x6 x7) (x5 x7 x6))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 (x3 x6 x8) (x3 x7 x8)))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x1 x6 -> x5 x1 x7 -> x5 x1 (x4 x6 x7))) -> explicit_OrderedField x0 x1 x2 x3 x4 x5).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Axiom SNoLe_antisym : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe x1 x0 -> x0 = x1).
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Theorem explicit_OrderedField_real : explicit_OrderedField real 0 1 add_SNo mul_SNo SNoLe.
admit.
Qed.
(* Parameter explicit_Reals "e5dee14fc7a24a63555de85859904de8dc1b462044060d68dbb06cc9a590bc38" "2c81615a11c9e3e301f3301ec7862ba122acea20bfe1c120f7bdaf5a2e18faf4" *)
Parameter explicit_Reals : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
(* Parameter natOfOrderedField_p "f97b150093ec13f84694e2b8f48becf45e4b6df2b43c1085ae7a99663116b9a6" "f1c45e0e9f9df75c62335865582f186c3ec3df1a94bc94b16d41e73bf27899f9" *)
Parameter natOfOrderedField_p : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop.
(* Parameter explicit_Nats "4a59caa11140eabb1b7db2d3493fe76a92b002b3b27e3dfdd313708c6c6ca78f" "3fb62f75e778736947d086a36d35ebe45a5d60bf0a340a0761ba08a396d4123a" *)
Parameter explicit_Nats : set -> set -> (set -> set) -> prop.
Axiom explicit_Nats_E : (forall x0 x1, forall x2 : set -> set, forall x3 : prop, (explicit_Nats x0 x1 x2 -> x1 :e x0 -> (forall x4, x4 :e x0 -> x2 x4 :e x0) -> (forall x4, x4 :e x0 -> x2 x4 = x1 -> (forall x5 : prop, x5)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4 : set -> prop, x4 x1 -> (forall x5, x4 x5 -> x4 (x2 x5)) -> (forall x5, x5 :e x0 -> x4 x5)) -> x3) -> explicit_Nats x0 x1 x2 -> x3).
Definition lt : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 x7 : set => and (x5 x6 x7) (x6 = x7 -> (forall x8 : prop, x8))).
(* Parameter setexp "fcd77a77362d494f90954f299ee3eb7d4273ae93d2d776186c885fc95baa40dc" "1de7fcfb8d27df15536f5567084f73d70d2b8526ee5d05012e7c9722ec76a8a6" *)
Parameter setexp : set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom explicit_Reals_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x6 -> x5 x1 x7 -> (forall x8 : prop, (forall x9, and (x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x7 (x4 x9 x6)) -> x8) -> x8))) -> (forall x6, x6 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x6 x8) (ap x7 x8)) (x5 (ap x6 x8) (ap x6 (x3 x8 x2)))) (x5 (ap x7 (x3 x8 x2)) (ap x7 x8))) -> (forall x8 : prop, (forall x9, and (x9 :e x0) (forall x10, x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x6 x10) x9) (x5 x9 (ap x7 x10))) -> x8) -> x8))) -> explicit_Reals x0 x1 x2 x3 x4 x5).
Axiom real_Archimedean : (forall x0, x0 :e real -> (forall x1, x1 :e real -> SNoLt 0 x0 -> SNoLe 0 x1 -> (forall x2 : prop, (forall x3, and (x3 :e omega) (SNoLe x1 (mul_SNo x3 x0)) -> x2) -> x2))).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom real_complete2 : (forall x0, x0 :e setexp real omega -> (forall x1, x1 :e setexp real omega -> (forall x2, x2 :e omega -> and (and (SNoLe (ap x0 x2) (ap x1 x2)) (SNoLe (ap x0 x2) (ap x0 (add_SNo x2 1)))) (SNoLe (ap x1 (add_SNo x2 1)) (ap x1 x2))) -> (forall x2 : prop, (forall x3, and (x3 :e real) (forall x4, x4 :e omega -> and (SNoLe (ap x0 x4) x3) (SNoLe x3 (ap x1 x4))) -> x2) -> x2))).
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Axiom explicit_Nats_natOfOrderedField : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Nats (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) x1 (fun x6 : set => x3 x6 x2)).
Theorem explicit_Reals_real : explicit_Reals real 0 1 add_SNo mul_SNo SNoLe.
admit.
Qed.
Definition missingname_22d502484969f4c539b7cc9621b8169b8dfed8f1bdb5db38a6b00a4b23c39c3a : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 : set => forall x7 : prop, (forall x8, (forall x9 : prop, (forall x10, and (and (natOfOrderedField_p x0 x1 x2 x3 x4 x5 x8) (natOfOrderedField_p x0 x1 x2 x3 x4 x5 x10)) (x4 x10 x6 = x8) -> x9) -> x9) -> x7) -> x7).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom explicit_Field_zero_multL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x1 x5 = x1)).
Axiom explicit_OrderedField_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Field x0 x1 x2 x3 x4 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 x8 x9 -> x5 x7 x9))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> iff (and (x5 x7 x8) (x5 x8 x7)) (x7 = x8))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> or (x5 x7 x8) (x5 x8 x7))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 (x3 x7 x9) (x3 x8 x9)))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x1 x7 -> x5 x1 x8 -> x5 x1 (x4 x7 x8))) -> x6) -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> x6).
Theorem missingprop_9008f8f2ade63c16b95ce9874af844e7e3d8eff775b1a6fdc91615ef20cc18c1 : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> Sep x0 (missingname_22d502484969f4c539b7cc9621b8169b8dfed8f1bdb5db38a6b00a4b23c39c3a x0 x1 x2 x3 x4 x5) = x0).
admit.
Qed.
Theorem missingprop_044a9bb6a2fa2d2dd31679b6718e9c932daa0189445cdb0e4f3b6c33a09c8eeb : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_Reals x0 x1 x2 x3 x4 x5 -> equip omega (Sep x0 (missingname_22d502484969f4c539b7cc9621b8169b8dfed8f1bdb5db38a6b00a4b23c39c3a x0 x1 x2 x3 x4 x5))) -> (forall x0 : prop, x0).
admit.
Qed.
