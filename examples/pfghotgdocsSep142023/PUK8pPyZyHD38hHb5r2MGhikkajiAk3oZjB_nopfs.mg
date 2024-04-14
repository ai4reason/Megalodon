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
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom nonneg_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe Empty x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem missingprop_a3252d6ac8fc90b05cfbead1aa6db1cdfa8cd486ea70700205ca3a4e7a90edc3 : (forall x0 x1 x2, SNo x0 -> SNoLe Empty x0 -> SNo x1 -> SNo x2 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2) -> SNoLt x1 x2).
admit.
Qed.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Theorem missingprop_6744d6cbc4a943cd8e55c2ddc7084280ae7408fa0d477283c433b7db22965af8 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe Empty x2 -> SNoLt (mul_SNo x0 x2) (mul_SNo x1 x2) -> SNoLt x0 x1).
admit.
Qed.
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Parameter abs_SNo : set -> set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Axiom real_E : (forall x0, x0 :e real -> (forall x1 : prop, (SNo x0 -> SNoLev x0 :e ordsucc omega -> x0 :e SNoS_ (ordsucc omega) -> SNoLt (minus_SNo omega) x0 -> SNoLt x0 omega -> (forall x2, x2 :e SNoS_ omega -> (forall x3, x3 :e omega -> SNoLt (abs_SNo (add_SNo x2 (minus_SNo x0))) (eps_ x3)) -> x2 = x0) -> (forall x2, x2 :e omega -> (forall x3 : prop, (forall x4, and (x4 :e SNoS_ omega) (and (SNoLt x4 x0) (SNoLt x0 (add_SNo x4 (eps_ x2)))) -> x3) -> x3)) -> x1) -> x1)).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_1 : SNo 1.
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom omega_SNoS_omega : omega c= SNoS_ omega.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_1 : nat_p 1.
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom omega_ordinal : ordinal omega.
Axiom SNo_abs_SNo : (forall x0, SNo x0 -> SNo (abs_SNo x0)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Axiom SNo_triangle2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (abs_SNo (add_SNo x0 (minus_SNo x2))) (add_SNo (abs_SNo (add_SNo x0 (minus_SNo x1))) (abs_SNo (add_SNo x1 (minus_SNo x2))))).
Axiom eps_ordsucc_half_add : (forall x0, nat_p x0 -> add_SNo (eps_ (ordsucc x0)) (eps_ (ordsucc x0)) = eps_ x0).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom add_SNo_Lt3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom abs_SNo_intvl_bd : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 (add_SNo x0 x2) -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) x2).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom add_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> add_SNo x0 x1 :e SNoS_ omega)).
Axiom SNo_eps_SNoS_omega : (forall x0, x0 :e omega -> eps_ x0 :e SNoS_ omega).
Axiom abs_SNo_dist_swap : (forall x0 x1, SNo x0 -> SNo x1 -> abs_SNo (add_SNo x0 (minus_SNo x1)) = abs_SNo (add_SNo x1 (minus_SNo x0))).
Axiom real_SNo : (forall x0, x0 :e real -> SNo x0).
Axiom pos_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt 0 x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom mul_SNo_Lt1_pos_Lt : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 1 -> SNoLt 0 x1 -> SNoLt (mul_SNo x0 x1) x1).
Axiom SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
Axiom real_I : (forall x0, x0 :e SNoS_ (ordsucc omega) -> (x0 = omega -> (forall x1 : prop, x1)) -> (x0 = minus_SNo omega -> (forall x1 : prop, x1)) -> (forall x1, x1 :e SNoS_ omega -> (forall x2, x2 :e omega -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) (eps_ x2)) -> x1 = x0) -> x0 :e real).
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom ordsucc_omega_ordinal : ordinal (ordsucc omega).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
(* Parameter TransSet "e7493d5f5a73b6cb40310f6fcb87d02b2965921a25ab96d312adf7eb8157e4b3" "538bb76a522dc0736106c2b620bfc2d628d5ec8a27fe62fc505e3a0cdb60a5a2" *)
Parameter TransSet : set -> prop.
Axiom TransSet_In_ordsucc_Subq : (forall x0 x1, TransSet x1 -> x0 :e ordsucc x1 -> x0 c= x1).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Axiom ordinal_binunion : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binunion x0 x1)).
Axiom ordinal_famunion : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> ordinal (x1 x2)) -> ordinal (famunion x0 x1)).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Axiom nat_0 : nat_p 0.
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom abs_SNo_minus : (forall x0, SNo x0 -> abs_SNo (minus_SNo x0) = abs_SNo x0).
Axiom pos_abs_SNo : (forall x0, SNoLt 0 x0 -> abs_SNo x0 = x0).
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Axiom SNo_omega : SNo omega.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom SNo_0 : SNo 0.
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom mul_SNo_eps_power_2 : (forall x0, nat_p x0 -> mul_SNo (eps_ x0) (exp_SNo_nat 2 x0) = 1).
Axiom nonneg_mul_SNo_Le' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe 0 x2 -> SNoLe x0 x1 -> SNoLe (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom exp_SNo_nat_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> (forall x1, nat_p x1 -> SNoLt 0 (exp_SNo_nat x0 x1))).
Axiom SNo_2 : SNo 2.
Axiom SNoLt_0_2 : SNoLt 0 2.
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Axiom add_SNo_1_ordsucc : (forall x0, x0 :e omega -> add_SNo x0 1 = ordsucc x0).
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Axiom nat_exp_SNo_nat : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_SNo_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom SNoLt_0_1 : SNoLt 0 1.
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom SNoLt_minus_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt 0 (add_SNo x1 (minus_SNo x0))).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom add_SNo_minus_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x2 (add_SNo x0 (minus_SNo x1)) -> SNoLe (add_SNo x2 x1) x0).
Axiom add_SNo_minus_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 (minus_SNo x1)) x2 -> SNoLt x0 (add_SNo x2 x1)).
Axiom add_SNo_minus_Le2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (add_SNo x2 x1) x0 -> SNoLe x2 (add_SNo x0 (minus_SNo x1))).
Axiom minus_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> minus_SNo x0 :e SNoS_ omega).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom minus_SNo_Lt_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt (minus_SNo x1) (minus_SNo x0)).
Axiom add_SNo_minus_Lt1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 (add_SNo x2 x1) -> SNoLt (add_SNo x0 (minus_SNo x1)) x2).
Axiom SNoS_omega_real : SNoS_ omega c= real.
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Theorem pos_small_real_recip_ex : (forall x0, x0 :e real -> SNoLt 0 x0 -> SNoLt x0 1 -> (forall x1 : prop, (forall x2, and (x2 :e real) (mul_SNo x0 x2 = 1) -> x1) -> x1)).
admit.
Qed.
Axiom SNoS_ordsucc_omega_bdd_eps_pos : (forall x0, x0 :e SNoS_ (ordsucc omega) -> SNoLt 0 x0 -> SNoLt x0 omega -> (forall x1 : prop, (forall x2, and (x2 :e omega) (SNoLt (mul_SNo (eps_ x2) x0) 1) -> x1) -> x1)).
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (mul_SNo x0 x1)).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Theorem pos_real_recip_ex : (forall x0, x0 :e real -> SNoLt 0 x0 -> (forall x1 : prop, (forall x2, and (x2 :e real) (mul_SNo x0 x2 = 1) -> x1) -> x1)).
admit.
Qed.
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Theorem nonzero_real_recip_ex : (forall x0, x0 :e real -> (x0 = 0 -> (forall x1 : prop, x1)) -> (forall x1 : prop, (forall x2, and (x2 :e real) (mul_SNo x0 x2 = 1) -> x1) -> x1)).
admit.
Qed.
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Axiom explicit_Field_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5)) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> (x5 = x1 -> (forall x6 : prop, x6)) -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x4 x5 x7 = x2) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> explicit_Field x0 x1 x2 x3 x4).
Axiom real_add_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_SNo x0 x1 :e real)).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom real_0 : 0 :e real.
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Axiom real_1 : 1 :e real.
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Theorem explicit_Field_real : explicit_Field real 0 1 add_SNo mul_SNo.
admit.
Qed.
(* Parameter explicit_OrderedField "1195f96dcd143e4b896b4c1eb080d1fb877084debc58a8626d3dcf7a14ce8df7" "a18f7bca989a67fb7dc6df8e6c094372c26fa2c334578447d3314616155afb72" *)
Parameter explicit_OrderedField : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom explicit_OrderedField_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 x7 x8 -> x5 x6 x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> iff (and (x5 x6 x7) (x5 x7 x6)) (x6 = x7))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> or (x5 x6 x7) (x5 x7 x6))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x6 x7 -> x5 (x3 x6 x8) (x3 x7 x8)))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x1 x6 -> x5 x1 x7 -> x5 x1 (x4 x6 x7))) -> explicit_OrderedField x0 x1 x2 x3 x4 x5).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom SNoLe_antisym : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe x1 x0 -> x0 = x1).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Theorem explicit_OrderedField_real : explicit_OrderedField real 0 1 add_SNo mul_SNo SNoLe.
admit.
Qed.
(* Parameter explicit_Nats "4a59caa11140eabb1b7db2d3493fe76a92b002b3b27e3dfdd313708c6c6ca78f" "3fb62f75e778736947d086a36d35ebe45a5d60bf0a340a0761ba08a396d4123a" *)
Parameter explicit_Nats : set -> set -> (set -> set) -> prop.
Axiom explicit_Nats_E : (forall x0 x1, forall x2 : set -> set, forall x3 : prop, (explicit_Nats x0 x1 x2 -> x1 :e x0 -> (forall x4, x4 :e x0 -> x2 x4 :e x0) -> (forall x4, x4 :e x0 -> x2 x4 = x1 -> (forall x5 : prop, x5)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4 : set -> prop, x4 x1 -> (forall x5, x4 x5 -> x4 (x2 x5)) -> (forall x5, x5 :e x0 -> x4 x5)) -> x3) -> explicit_Nats x0 x1 x2 -> x3).
Theorem missingprop_247eca63ddbcabcce23f37444296e0737b3d081ddee4a41779d4f9a2c3d52966 : (forall x0 x1, forall x2 : set -> set, explicit_Nats x0 x1 x2 -> (forall x3 : prop, (x1 :e x0 -> (forall x4, x4 :e x0 -> x2 x4 :e x0) -> (forall x4, x4 :e x0 -> x2 x4 = x1 -> (forall x5 : prop, x5)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4 : set -> prop, x4 x1 -> (forall x5, x4 x5 -> x4 (x2 x5)) -> (forall x5, x5 :e x0 -> x4 x5)) -> x3) -> x3)).
admit.
Qed.
(* Parameter natOfOrderedField_p "f97b150093ec13f84694e2b8f48becf45e4b6df2b43c1085ae7a99663116b9a6" "f1c45e0e9f9df75c62335865582f186c3ec3df1a94bc94b16d41e73bf27899f9" *)
Parameter natOfOrderedField_p : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop.
Axiom explicit_Nats_natOfOrderedField : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Nats (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) x1 (fun x6 : set => x3 x6 x2)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Theorem missingprop_cc21bb1b7a793fd178643e5fcc401b6255545a0d3dee389d449d3dddcddcfb20 : Sep real (natOfOrderedField_p real 0 1 add_SNo mul_SNo SNoLe) = omega.
admit.
Qed.
(* Parameter explicit_Reals "e5dee14fc7a24a63555de85859904de8dc1b462044060d68dbb06cc9a590bc38" "2c81615a11c9e3e301f3301ec7862ba122acea20bfe1c120f7bdaf5a2e18faf4" *)
Parameter explicit_Reals : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Definition lt : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 x7 : set => and (x5 x6 x7) (x6 = x7 -> (forall x8 : prop, x8))).
(* Parameter setexp "fcd77a77362d494f90954f299ee3eb7d4273ae93d2d776186c885fc95baa40dc" "1de7fcfb8d27df15536f5567084f73d70d2b8526ee5d05012e7c9722ec76a8a6" *)
Parameter setexp : set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom explicit_Reals_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x6 -> x5 x1 x7 -> (forall x8 : prop, (forall x9, and (x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x7 (x4 x9 x6)) -> x8) -> x8))) -> (forall x6, x6 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x6 x8) (ap x7 x8)) (x5 (ap x6 x8) (ap x6 (x3 x8 x2)))) (x5 (ap x7 (x3 x8 x2)) (ap x7 x8))) -> (forall x8 : prop, (forall x9, and (x9 :e x0) (forall x10, x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x6 x10) x9) (x5 x9 (ap x7 x10))) -> x8) -> x8))) -> explicit_Reals x0 x1 x2 x3 x4 x5).
Axiom real_Archimedean : (forall x0, x0 :e real -> (forall x1, x1 :e real -> SNoLt 0 x0 -> SNoLe 0 x1 -> (forall x2 : prop, (forall x3, and (x3 :e omega) (SNoLe x1 (mul_SNo x3 x0)) -> x2) -> x2))).
Axiom real_complete2 : (forall x0, x0 :e setexp real omega -> (forall x1, x1 :e setexp real omega -> (forall x2, x2 :e omega -> and (and (SNoLe (ap x0 x2) (ap x1 x2)) (SNoLe (ap x0 x2) (ap x0 (add_SNo x2 1)))) (SNoLe (ap x1 (add_SNo x2 1)) (ap x1 x2))) -> (forall x2 : prop, (forall x3, and (x3 :e real) (forall x4, x4 :e omega -> and (SNoLe (ap x0 x4) x3) (SNoLe x3 (ap x1 x4))) -> x2) -> x2))).
Theorem explicit_Reals_real : explicit_Reals real 0 1 add_SNo mul_SNo SNoLe.
admit.
Qed.
(* Parameter pack_b_b_r_e_e "94ec6541b5d420bf167196743d54143ff9e46d4022e0ccecb059cf098af4663d" "8efb1973b4a9b292951aa9ca2922b7aa15d8db021bfada9c0f07fc9bb09b65fb" *)
Parameter pack_b_b_r_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set.
Definition real_struct : set :=
 pack_b_b_r_e_e real add_SNo mul_SNo SNoLe 0 1.
(* Parameter struct_b_b_r_e_e "08195fc95542b2be3e25b7fdef814f4e54290bd680ae0917923b0e44786a0214" "d542f60aebdbe4e018abe75d8586699fd6db6951a7fdc2bc884bfb42c0d77a22" *)
Parameter struct_b_b_r_e_e : set -> prop.
(* Parameter unpack_b_b_r_e_e_o "3db063fdbe07c7344b83deebc95b091786045a06e01e2ce6e2eae1d885f574af" "b3a2fc60275daf51e6cbe3161abaeed96cb2fc4e1d5fe26b5e3e58d0eb93c477" *)
Parameter unpack_b_b_r_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop) -> prop.
Definition RealsStruct : set -> prop :=
 (fun x0 : set => and (struct_b_b_r_e_e x0) (unpack_b_b_r_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 : set -> set -> prop => fun x5 x6 : set => explicit_Reals x1 x5 x6 x2 x3 x4))).
Axiom pack_struct_b_b_r_e_e_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 x4 :e x0)) -> (forall x3 : set -> set -> prop, forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5))))).
Axiom RealsStruct_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, forall x6 : prop -> prop -> prop, x6 (unpack_b_b_r_e_e_o (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) (fun x7 : set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> prop => fun x11 x12 : set => explicit_Reals x7 x11 x12 x8 x9 x10)) (explicit_Reals x0 x4 x5 x1 x2 x3) -> x6 (explicit_Reals x0 x4 x5 x1 x2 x3) (unpack_b_b_r_e_e_o (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) (fun x7 : set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> prop => fun x11 x12 : set => explicit_Reals x7 x11 x12 x8 x9 x10))).
Theorem missingprop_4487a3b7a38118ddf35d8d22185a9f43ae529331924e37910c154ab3e6f9bfd6 : RealsStruct real_struct.
admit.
Qed.
