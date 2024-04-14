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
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Definition SNoL : set -> set :=
 (fun x0 : set => Sep (SNoS_ (SNoLev x0)) (fun x1 : set => SNoLt x1 x0)).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Axiom SNoL_SNoS_ : (forall x0, SNoL x0 c= SNoS_ (SNoLev x0)).
Definition SNoR : set -> set :=
 (fun x0 : set => Sep (SNoS_ (SNoLev x0)) (SNoLt x0)).
Axiom SNoR_SNoS_ : (forall x0, SNoR x0 c= SNoS_ (SNoLev x0)).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Axiom SNoLev_ind2 : (forall x0 : set -> set -> prop, (forall x1 x2, SNo x1 -> SNo x2 -> (forall x3, x3 :e SNoS_ (SNoLev x1) -> x0 x3 x2) -> (forall x3, x3 :e SNoS_ (SNoLev x2) -> x0 x1 x3) -> (forall x3, x3 :e SNoS_ (SNoLev x1) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> x0 x3 x4)) -> x0 x1 x2) -> (forall x1 x2, SNo x1 -> SNo x2 -> x0 x1 x2)).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom add_SNo_eq : (forall x0, SNo x0 -> (forall x1, SNo x1 -> add_SNo x0 x1 = SNoCut (binunion {add_SNo x3 x1 | x3 :e SNoL x0} (Repl (SNoL x1) (add_SNo x0))) (binunion {add_SNo x3 x1 | x3 :e SNoR x0} (Repl (SNoR x1) (add_SNo x0))))).
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom SNoCutP_SNoCut_L : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x0 -> SNoLt x2 (SNoCut x0 x1))).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom SNoCutP_SNoCut_R : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x1 -> SNoLt (SNoCut x0 x1) x2)).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SNoCutP_SNo_SNoCut : (forall x0 x1, SNoCutP x0 x1 -> SNo (SNoCut x0 x1)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Theorem add_SNo_prop1 : (forall x0 x1, SNo x0 -> SNo x1 -> and (and (and (and (and (SNo (add_SNo x0 x1)) (forall x2, x2 :e SNoL x0 -> SNoLt (add_SNo x2 x1) (add_SNo x0 x1))) (forall x2, x2 :e SNoR x0 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1))) (forall x2, x2 :e SNoL x1 -> SNoLt (add_SNo x0 x2) (add_SNo x0 x1))) (forall x2, x2 :e SNoR x1 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2))) (SNoCutP (binunion {add_SNo x2 x1 | x2 :e SNoL x0} (Repl (SNoL x1) (add_SNo x0))) (binunion {add_SNo x2 x1 | x2 :e SNoR x0} (Repl (SNoR x1) (add_SNo x0))))).
admit.
Qed.
Theorem SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
admit.
Qed.
Theorem add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Theorem add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
admit.
Qed.
Theorem add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
admit.
Qed.
Theorem add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
admit.
Qed.
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Theorem add_SNo_Lt3a : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x0 x2 -> SNoLe x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
admit.
Qed.
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Theorem add_SNo_Lt3b : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
admit.
Qed.
Theorem add_SNo_Lt3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
admit.
Qed.
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Theorem add_SNo_Le3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x3)).
admit.
Qed.
Theorem add_SNo_SNoCutP : (forall x0 x1, SNo x0 -> SNo x1 -> SNoCutP (binunion {add_SNo x2 x1 | x2 :e SNoL x0} (Repl (SNoL x1) (add_SNo x0))) (binunion {add_SNo x2 x1 | x2 :e SNoR x0} (Repl (SNoR x1) (add_SNo x0)))).
admit.
Qed.
Theorem add_SNo_SNoCutP_gen : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> SNoCutP (binunion {add_SNo x4 (SNoCut x2 x3) | x4 :e x0} (Repl x2 (add_SNo (SNoCut x0 x1)))) (binunion {add_SNo x4 (SNoCut x2 x3) | x4 :e x1} (Repl x3 (add_SNo (SNoCut x0 x1))))).
admit.
Qed.
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Axiom ReplEq_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Repl x0 x1 = Repl x0 x2).
Theorem add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
admit.
Qed.
Axiom SNoLev_ind : (forall x0 : set -> prop, (forall x1, SNo x1 -> (forall x2, x2 :e SNoS_ (SNoLev x1) -> x0 x2) -> x0 x1) -> (forall x1, SNo x1 -> x0 x1)).
Axiom SNo_0 : SNo Empty.
Axiom SNo_eta : (forall x0, SNo x0 -> x0 = SNoCut (SNoL x0) (SNoR x0)).
Axiom SNoR_0 : SNoR Empty = Empty.
Axiom Repl_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (Repl Empty x0) Empty -> x1 Empty (Repl Empty x0)).
Axiom binunion_idl : (forall x0, forall x1 : set -> set -> prop, x1 (binunion Empty x0) x0 -> x1 x0 (binunion Empty x0)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom SNoL_0 : SNoL Empty = Empty.
Theorem add_SNo_0L : (forall x0, SNo x0 -> add_SNo Empty x0 = x0).
admit.
Qed.
Theorem add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 Empty = x0).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
Axiom ordinal_Empty : ordinal Empty.
Axiom Subq_Empty : (forall x0, Empty c= x0).
Axiom SNoCutP_SNoCut_fst : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, SNo x2 -> (forall x3, x3 :e x0 -> SNoLt x3 x2) -> (forall x3, x3 :e x1 -> SNoLt x2 x3) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x2) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x2))).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom minus_SNo_Lt_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt (minus_SNo x1) (minus_SNo x0)).
Axiom minus_SNo_Lev : (forall x0, SNo x0 -> SNoLev (minus_SNo x0) = SNoLev x0).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = Empty).
admit.
Qed.
Theorem add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = Empty).
admit.
Qed.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom ordinal_SNo : (forall x0, ordinal x0 -> SNo x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Theorem add_SNo_ordinal_SNoCutP : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> SNoCutP (binunion {add_SNo x2 x1 | x2 :e SNoS_ x0} (Repl (SNoS_ x1) (add_SNo x0))) Empty)).
admit.
Qed.
Axiom ordinal_SNoL : (forall x0, ordinal x0 -> SNoL x0 = SNoS_ x0).
Axiom ordinal_SNoR : (forall x0, ordinal x0 -> SNoR x0 = Empty).
Theorem add_SNo_ordinal_eq : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> add_SNo x0 x1 = SNoCut (binunion {add_SNo x3 x1 | x3 :e SNoS_ x0} (Repl (SNoS_ x1) (add_SNo x0))) Empty)).
admit.
Qed.
Axiom SNo_max_ordinal : (forall x0, SNo x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLt x1 x0) -> ordinal x0).
Axiom SNoLt_trichotomy_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (or (SNoLt x0 x1) (x0 = x1)) (SNoLt x1 x0)).
Axiom In_irref : (forall x0, nIn x0 x0).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Axiom SNoCutP_SNoCut : (forall x0 x1, SNoCutP x0 x1 -> and (and (and (and (SNo (SNoCut x0 x1)) (SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x2 : set => ordsucc (SNoLev x2))) (famunion x1 (fun x2 : set => ordsucc (SNoLev x2)))))) (forall x2, x2 :e x0 -> SNoLt x2 (SNoCut x0 x1))) (forall x2, x2 :e x1 -> SNoLt (SNoCut x0 x1) x2)) (forall x2, SNo x2 -> (forall x3, x3 :e x0 -> SNoLt x3 x2) -> (forall x3, x3 :e x1 -> SNoLt x2 x3) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x2) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x2))).
Theorem add_SNo_ordinal_ordinal : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> ordinal (add_SNo x0 x1))).
admit.
Qed.
Axiom ordinal_ind : (forall x0 : set -> prop, (forall x1, ordinal x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, ordinal x1 -> x0 x1)).
Axiom ordinal_ordsucc_In_eq : (forall x0 x1, ordinal x0 -> x1 :e x0 -> or (ordsucc x1 :e x0) (x0 = ordsucc x1)).
Axiom ordinal_SNoLev_max_2 : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e ordsucc x0 -> SNoLe x1 x0)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom ordinal_Subq_SNoLe : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoLe x0 x1).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom ordinal_SNoLt_In : (forall x0 x1, ordinal x0 -> ordinal x1 -> SNoLt x0 x1 -> x0 :e x1).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom ordinal_SNo_ : (forall x0, ordinal x0 -> SNo_ x0 x0).
Theorem add_SNo_ordinal_SL : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> add_SNo (ordsucc x0) x1 = ordsucc (add_SNo x0 x1))).
admit.
Qed.
Theorem add_SNo_ordinal_SR : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> add_SNo x0 (ordsucc x1) = ordsucc (add_SNo x0 x1))).
admit.
Qed.
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Theorem add_SNo_ordinal_InL : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> (forall x2, x2 :e x0 -> add_SNo x2 x1 :e add_SNo x0 x1))).
admit.
Qed.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoCut_Le : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoLe (SNoCut x0 x1) (SNoCut x2 x3)).
Axiom SNoCutP_SNoL_SNoR : (forall x0, SNo x0 -> SNoCutP (SNoL x0) (SNoR x0)).
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Theorem add_SNo_SNoL_interpolate : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoL (add_SNo x0 x1) -> or (forall x3 : prop, (forall x4, and (x4 :e SNoL x0) (SNoLe x2 (add_SNo x4 x1)) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e SNoL x1) (SNoLe x2 (add_SNo x0 x4)) -> x3) -> x3))).
admit.
Qed.
Theorem add_SNo_SNoR_interpolate : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoR (add_SNo x0 x1) -> or (forall x3 : prop, (forall x4, and (x4 :e SNoR x0) (SNoLe (add_SNo x4 x1) x2) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e SNoR x1) (SNoLe (add_SNo x0 x4) x2) -> x3) -> x3))).
admit.
Qed.
Axiom SNoLev_ind3 : (forall x0 : set -> set -> set -> prop, (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> x0 x4 x2 x3) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> x0 x1 x4 x3) -> (forall x4, x4 :e SNoS_ (SNoLev x3) -> x0 x1 x2 x4) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> x0 x4 x5 x3)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x4 x2 x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x1 x4 x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> (forall x6, x6 :e SNoS_ (SNoLev x3) -> x0 x4 x5 x6))) -> x0 x1 x2 x3) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> x0 x1 x2 x3)).
Axiom SNoCut_ext : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x1 -> SNoLt (SNoCut x2 x3) x4) -> (forall x4, x4 :e x2 -> SNoLt x4 (SNoCut x0 x1)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoCut x0 x1 = SNoCut x2 x3).
Theorem add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
admit.
Qed.
Theorem add_SNo_cancel_L : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 x1 = add_SNo x0 x2 -> x1 = x2).
admit.
Qed.
Theorem minus_SNo_0 : minus_SNo 0 = 0.
admit.
Qed.
Theorem minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition div_SNo : set -> set -> set :=
 (fun x0 x1 : set => If_i (x1 = 0) 0 (Eps_i (fun x2 : set => and (SNo x2) (mul_SNo x2 x1 = x0)))).
(* Parameter SNo_pair "42f58f2a7ea537e615b65875895df2f1fc42b140b7652f8ea8e9c6893053be73" "0c801be26da5c0527e04f5b1962551a552dab2d2643327b86105925953cf3b06" *)
Parameter SNo_pair : set -> set -> set.
(* Parameter CSNo_Re "1be0cda46d38c27e57488fdb9a2e54ccd2b8f9c133cbfc27af57bf54206ada12" "9481cf9deb6efcbb12eccc74f82acf453997c8e75adb5cd83311956bcc85d828" *)
Parameter CSNo_Re : set -> set.
(* Parameter CSNo_Im "8bf86a17c9a6ce157ed3de4762edc8cbee3acc11e18b41f458f34ca9d1983803" "5dad3f55c3f3177e2d18188b94536551b7bfd38a80850f4314ba8abb3fd78138" *)
Parameter CSNo_Im : set -> set.
Definition minus_CSNo : set -> set :=
 (fun x0 : set => SNo_pair (minus_SNo (CSNo_Re x0)) (minus_SNo (CSNo_Im x0))).
(* Parameter CSNo "4a34d6ddf18af8c0c2f637afb2ddadaa240273c85b9410fcb82cd0782bab13d7" "c35281fa7c11775a593d536c7fec2695f764921632445fa772f3a2a45bdf4257" *)
Parameter CSNo : set -> prop.
Axiom CSNo_I : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo (SNo_pair x0 x1)).
Axiom CSNo_ReR : (forall x0, CSNo x0 -> SNo (CSNo_Re x0)).
Axiom CSNo_ImR : (forall x0, CSNo x0 -> SNo (CSNo_Im x0)).
Theorem CSNo_minus_CSNo : (forall x0, CSNo x0 -> CSNo (minus_CSNo x0)).
admit.
Qed.
Axiom SNo_pair_0 : (forall x0, forall x1 : set -> set -> prop, x1 (SNo_pair x0 0) x0 -> x1 x0 (SNo_pair x0 0)).
Axiom CSNo_Re2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Re (SNo_pair x0 x1) = x0).
Theorem SNo_Re : (forall x0, SNo x0 -> CSNo_Re x0 = x0).
admit.
Qed.
Axiom CSNo_Im2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Im (SNo_pair x0 x1) = x1).
Theorem SNo_Im : (forall x0, SNo x0 -> CSNo_Im x0 = 0).
admit.
Qed.
Theorem Re_0 : CSNo_Re 0 = 0.
admit.
Qed.
Theorem Im_0 : CSNo_Im 0 = 0.
admit.
Qed.
Axiom SNo_1 : SNo 1.
Theorem Re_1 : CSNo_Re 1 = 1.
admit.
Qed.
Theorem Im_1 : CSNo_Im 1 = 0.
admit.
Qed.
Definition Complex_i : set :=
 SNo_pair 0 1.
Theorem Re_i : CSNo_Re Complex_i = 0.
admit.
Qed.
Theorem Im_i : CSNo_Im Complex_i = 1.
admit.
Qed.
Definition add_CSNo : set -> set -> set :=
 (fun x0 x1 : set => SNo_pair (add_SNo (CSNo_Re x0) (CSNo_Re x1)) (add_SNo (CSNo_Im x0) (CSNo_Im x1))).
Theorem add_SNo_add_CSNo : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_CSNo x0 x1).
admit.
Qed.
Theorem CSNo_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (add_CSNo x0 x1)).
admit.
Qed.
Axiom CSNo_ReIm : (forall x0, CSNo x0 -> x0 = SNo_pair (CSNo_Re x0) (CSNo_Im x0)).
Theorem add_CSNo_0L : (forall x0, CSNo x0 -> add_CSNo 0 x0 = x0).
admit.
Qed.
Theorem add_CSNo_0R : (forall x0, CSNo x0 -> add_CSNo x0 0 = x0).
admit.
Qed.
Theorem add_CSNo_minus_CSNo_linv : (forall x0, CSNo x0 -> add_CSNo (minus_CSNo x0) x0 = 0).
admit.
Qed.
Theorem add_CSNo_minus_CSNo_rinv : (forall x0, CSNo x0 -> add_CSNo x0 (minus_CSNo x0) = 0).
admit.
Qed.
Theorem minus_SNo_minus_CSNo : (forall x0, SNo x0 -> minus_SNo x0 = minus_CSNo x0).
admit.
Qed.
(* Parameter mul_CSNo "be6a968dce01facef568dc993eb13308d0ad11a1122ff3b96873947b912d1ffe" "e40da52d94418bf12fcea785e96229c7cfb23420a48e78383b914917ad3fa626" *)
Parameter mul_CSNo : set -> set -> set.
Definition div_CSNo : set -> set -> set :=
 (fun x0 x1 : set => If_i (x1 = 0) 0 (Eps_i (fun x2 : set => and (CSNo x2) (mul_CSNo x2 x1 = x0)))).
