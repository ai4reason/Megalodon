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
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Axiom ordinal_ordsucc_In_Subq : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 c= x0)).
Axiom ordsucc_omega_ordinal : ordinal (ordsucc omega).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom ordinal_binunion : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binunion x0 x1)).
Axiom ordinal_famunion : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> ordinal (x1 x2)) -> ordinal (famunion x0 x1)).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom omega_ordinal : ordinal omega.
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom SNoS_omega_real : SNoS_ omega c= real.
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Parameter abs_SNo : set -> set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Axiom real_I : (forall x0, x0 :e SNoS_ (ordsucc omega) -> (x0 = omega -> (forall x1 : prop, x1)) -> (x0 = minus_SNo omega -> (forall x1 : prop, x1)) -> (forall x1, x1 :e SNoS_ omega -> (forall x2, x2 :e omega -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) (eps_ x2)) -> x1 = x0) -> x0 :e real).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom ordinal_SNoLev_max : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e x0 -> SNoLt x1 x0)).
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom SNo_omega : SNo omega.
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom minus_SNo_Lev : (forall x0, SNo x0 -> SNoLev (minus_SNo x0) = SNoLev x0).
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom add_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> add_SNo x0 x1 :e SNoS_ omega)).
Axiom minus_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> minus_SNo x0 :e SNoS_ omega).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom SNo_pos_eps_Lt : (forall x0, nat_p x0 -> (forall x1, x1 :e SNoS_ (ordsucc x0) -> SNoLt 0 x1 -> SNoLt (eps_ x0) x1)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom SNoLt_minus_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt 0 (add_SNo x1 (minus_SNo x0))).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom SNo_0 : SNo 0.
Axiom SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
Axiom nonneg_abs_SNo : (forall x0, SNoLe 0 x0 -> abs_SNo x0 = x0).
Axiom abs_SNo_dist_swap : (forall x0 x1, SNo x0 -> SNo x1 -> abs_SNo (add_SNo x0 (minus_SNo x1)) = abs_SNo (add_SNo x1 (minus_SNo x0))).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom minus_SNo_Lt_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt (minus_SNo x1) (minus_SNo x0)).
Theorem real_SNoCut_SNoS_omega : (forall x0, x0 c= SNoS_ omega -> (forall x1, x1 c= SNoS_ omega -> SNoCutP x0 x1 -> (x0 = 0 -> (forall x2 : prop, x2)) -> (x1 = 0 -> (forall x2 : prop, x2)) -> (forall x2, x2 :e x0 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (SNoLt x2 x4) -> x3) -> x3)) -> (forall x2, x2 :e x1 -> (forall x3 : prop, (forall x4, and (x4 :e x1) (SNoLt x4 x2) -> x3) -> x3)) -> SNoCut x0 x1 :e real)).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom SNoCut_ext : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x1 -> SNoLt (SNoCut x2 x3) x4) -> (forall x4, x4 :e x2 -> SNoLt x4 (SNoCut x0 x1)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoCut x0 x1 = SNoCut x2 x3).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom real_E : (forall x0, x0 :e real -> (forall x1 : prop, (SNo x0 -> SNoLev x0 :e ordsucc omega -> x0 :e SNoS_ (ordsucc omega) -> SNoLt (minus_SNo omega) x0 -> SNoLt x0 omega -> (forall x2, x2 :e SNoS_ omega -> (forall x3, x3 :e omega -> SNoLt (abs_SNo (add_SNo x2 (minus_SNo x0))) (eps_ x3)) -> x2 = x0) -> (forall x2, x2 :e omega -> (forall x3 : prop, (forall x4, and (x4 :e SNoS_ omega) (and (SNoLt x4 x0) (SNoLt x0 (add_SNo x4 (eps_ x2)))) -> x3) -> x3)) -> x1) -> x1)).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SNoS_SNoLev : (forall x0, SNo x0 -> x0 :e SNoS_ (ordsucc (SNoLev x0))).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom omega_TransSet : TransSet omega.
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Theorem real_SNoCut : (forall x0, x0 c= real -> (forall x1, x1 c= real -> SNoCutP x0 x1 -> (x0 = 0 -> (forall x2 : prop, x2)) -> (x1 = 0 -> (forall x2 : prop, x2)) -> (forall x2, x2 :e x0 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (SNoLt x2 x4) -> x3) -> x3)) -> (forall x2, x2 :e x1 -> (forall x3 : prop, (forall x4, and (x4 :e x1) (SNoLt x4 x2) -> x3) -> x3)) -> SNoCut x0 x1 :e real)).
admit.
Qed.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom add_SNo_eq : (forall x0, SNo x0 -> (forall x1, SNo x1 -> add_SNo x0 x1 = SNoCut (binunion {add_SNo x3 x1 | x3 :e SNoL x0} (Repl (SNoL x1) (add_SNo x0))) (binunion {add_SNo x3 x1 | x3 :e SNoR x0} (Repl (SNoR x1) (add_SNo x0))))).
Axiom add_SNo_SNoCutP : (forall x0 x1, SNo x0 -> SNo x1 -> SNoCutP (binunion {add_SNo x2 x1 | x2 :e SNoL x0} (Repl (SNoL x1) (add_SNo x0))) (binunion {add_SNo x2 x1 | x2 :e SNoR x0} (Repl (SNoR x1) (add_SNo x0)))).
Axiom binunionE' : (forall x0 x1 x2, forall x3 : prop, (x2 :e x0 -> x3) -> (x2 :e x1 -> x3) -> x2 :e binunion x0 x1 -> x3).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom add_SNo_Lt3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
Theorem add_SNoCutP_lem : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> and (SNoCutP (binunion {add_SNo x6 x5 | x6 :e x0} (Repl x2 (add_SNo x4))) (binunion {add_SNo x6 x5 | x6 :e x1} (Repl x3 (add_SNo x4)))) (add_SNo x4 x5 = SNoCut (binunion {add_SNo x7 x5 | x7 :e x0} (Repl x2 (add_SNo x4))) (binunion {add_SNo x7 x5 | x7 :e x1} (Repl x3 (add_SNo x4))))).
admit.
Qed.
Theorem add_SNoCutP_gen : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> SNoCutP (binunion {add_SNo x6 x5 | x6 :e x0} (Repl x2 (add_SNo x4))) (binunion {add_SNo x6 x5 | x6 :e x1} (Repl x3 (add_SNo x4)))).
admit.
Qed.
Theorem add_SNoCut_eq : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> add_SNo x4 x5 = SNoCut (binunion {add_SNo x7 x5 | x7 :e x0} (Repl x2 (add_SNo x4))) (binunion {add_SNo x7 x5 | x7 :e x1} (Repl x3 (add_SNo x4)))).
admit.
Qed.
Axiom SNoLev_ind : (forall x0 : set -> prop, (forall x1, SNo x1 -> (forall x2, x2 :e SNoS_ (SNoLev x1) -> x0 x2) -> x0 x1) -> (forall x1, SNo x1 -> x0 x1)).
Axiom SNo_eta : (forall x0, SNo x0 -> x0 = SNoCut (SNoL x0) (SNoR x0)).
Axiom SNoCut_Le : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoLe (SNoCut x0 x1) (SNoCut x2 x3)).
Axiom SNoCutP_SNoL_SNoR : (forall x0, SNo x0 -> SNoCutP (SNoL x0) (SNoR x0)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom SNoLt_trichotomy_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (or (SNoLt x0 x1) (x0 = x1)) (SNoLt x1 x0)).
Axiom SNoR_SNoS_ : (forall x0, SNoR x0 c= SNoS_ (SNoLev x0)).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Theorem add_SNo_SNoCut_L_interpolate : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> (forall x6, x6 :e SNoL (add_SNo x4 x5) -> or (forall x7 : prop, (forall x8, and (x8 :e x0) (SNoLe x6 (add_SNo x8 x5)) -> x7) -> x7) (forall x7 : prop, (forall x8, and (x8 :e x2) (SNoLe x6 (add_SNo x4 x8)) -> x7) -> x7))).
admit.
Qed.
Axiom SNoL_SNoS_ : (forall x0, SNoL x0 c= SNoS_ (SNoLev x0)).
Theorem add_SNo_SNoCut_R_interpolate : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> (forall x6, x6 :e SNoR (add_SNo x4 x5) -> or (forall x7 : prop, (forall x8, and (x8 :e x1) (SNoLe (add_SNo x8 x5) x6) -> x7) -> x7) (forall x7 : prop, (forall x8, and (x8 :e x3) (SNoLe (add_SNo x4 x8) x6) -> x7) -> x7))).
admit.
Qed.
