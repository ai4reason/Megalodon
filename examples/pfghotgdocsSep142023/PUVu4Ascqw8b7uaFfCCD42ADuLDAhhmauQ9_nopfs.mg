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
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Definition PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)).
Definition SNoEq_ : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => PNoEq_ x0 (fun x3 : set => x3 :e x1) (fun x3 : set => x3 :e x2)).
Axiom SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
Axiom SNo_0 : SNo Empty.
Axiom SNoLev_0 : SNoLev Empty = Empty.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Theorem SNoLev_0_eq_0 : (forall x0, SNo x0 -> SNoLev x0 = Empty -> x0 = Empty).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition SNoElts_ : set -> set :=
 (fun x0 : set => binunion x0 {SetAdjoin x1 (Sing 1) | x1 :e x0}).
(* Parameter exactly1of2 "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" "163602f90de012a7426ee39176523ca58bc964ccde619b652cb448bd678f7e21" *)
Parameter exactly1of2 : prop -> prop -> prop.
Definition SNo_ : set -> set -> prop :=
 (fun x0 x1 : set => and (x1 c= SNoElts_ x0) (forall x2, x2 :e x0 -> exactly1of2 (SetAdjoin x2 (Sing 1) :e x1) (x2 :e x1))).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom binintersect_Subq_2 : (forall x0 x1, binintersect x0 x1 c= x1).
Axiom exactly1of2_E : (forall x0 x1 : prop, exactly1of2 x0 x1 -> (forall x2 : prop, (x0 -> not x1 -> x2) -> (not x0 -> x1 -> x2) -> x2)).
Axiom exactly1of2_I1 : (forall x0 x1 : prop, x0 -> not x1 -> exactly1of2 x0 x1).
Axiom binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Axiom exactly1of2_I2 : (forall x0 x1 : prop, not x0 -> x1 -> exactly1of2 x0 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Theorem restr_SNo_ : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNo_ x1 (binintersect x0 (SNoElts_ x1)))).
admit.
Qed.
Axiom SNo_SNo : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNo x1)).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Theorem restr_SNo : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNo (binintersect x0 (SNoElts_ x1)))).
admit.
Qed.
Axiom SNoLev_uniq2 : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNoLev x1 = x0)).
Theorem restr_SNoLev : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNoLev (binintersect x0 (SNoElts_ x1)) = x1)).
admit.
Qed.
Axiom SNoEq_I : (forall x0 x1 x2, (forall x3, x3 :e x0 -> iff (x3 :e x1) (x3 :e x2)) -> SNoEq_ x0 x1 x2).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem restr_SNoEq : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNoEq_ x1 (binintersect x0 (SNoElts_ x1)) x0)).
admit.
Qed.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
Axiom SNo_eta : (forall x0, SNo x0 -> x0 = SNoCut (SNoL x0) (SNoR x0)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNoLtI2 : (forall x0 x1, SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> SNoLt x0 x1).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
Axiom SNoLtI3 : (forall x0 x1, SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> SNoLt x0 x1).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem restr_SNo_SNoCut : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> (forall x2 : prop, (SNoCutP (Sep (SNoL x0) (fun x3 : set => SNoLev x3 :e x1)) (Sep (SNoR x0) (fun x3 : set => SNoLev x3 :e x1)) -> binintersect x0 (SNoElts_ x1) = SNoCut (Sep (SNoL x0) (fun x4 : set => SNoLev x4 :e x1)) (Sep (SNoR x0) (fun x4 : set => SNoLev x4 :e x1)) -> x2) -> x2))).
admit.
Qed.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom omega_ordinal : ordinal omega.
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom minus_SNo_Lev : (forall x0, SNo x0 -> SNoLev (minus_SNo x0) = SNoLev x0).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem minus_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> minus_SNo x0 :e SNoS_ omega).
admit.
Qed.
Definition eps_ : set -> set :=
 (fun x0 : set => binunion (Sing 0) {SetAdjoin (ordsucc x1) (Sing 1) | x1 :e x0}).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom tagged_not_ordinal : (forall x0, not (ordinal (SetAdjoin x0 (Sing 1)))).
Theorem eps_ordinal_In_eq_0 : (forall x0 x1, ordinal x1 -> x1 :e eps_ x0 -> x1 = 0).
admit.
Qed.
Axiom In_0_1 : 0 :e 1.
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Theorem eps_0_1 : eps_ 0 = 1.
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom neq_0_ordsucc : (forall x0, 0 = ordsucc x0 -> (forall x1 : prop, x1)).
Axiom tagged_eqE_eq : (forall x0 x1, ordinal x0 -> ordinal x1 -> SetAdjoin x0 (Sing 1) = SetAdjoin x1 (Sing 1) -> x0 = x1).
Axiom ordinal_Empty : ordinal 0.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem SNo__eps_ : (forall x0, x0 :e omega -> SNo_ (ordsucc x0) (eps_ x0)).
admit.
Qed.
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Theorem SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
admit.
Qed.
Theorem SNoLev_eps_ : (forall x0, x0 :e omega -> SNoLev (eps_ x0) = ordsucc x0).
admit.
Qed.
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Theorem SNo_eps_SNoS_omega : (forall x0, x0 :e omega -> eps_ x0 :e SNoS_ omega).
admit.
Qed.
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Theorem SNo_eps_decr : (forall x0, x0 :e omega -> (forall x1, x1 :e x0 -> SNoLt (eps_ x0) (eps_ x1))).
admit.
Qed.
Theorem SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
admit.
Qed.
Axiom nat_complete_ind : (forall x0 : set -> prop, (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom ordinal_ordsucc_In_Subq : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 c= x0)).
Axiom In_no3cycle : (forall x0 x1 x2, x0 :e x1 -> x1 :e x2 -> x2 :e x0 -> False).
Theorem missingprop_575b837b657e6e7a9b06a3cf27feee72addd6cc960da74d3e2bbceddc997f016 : (forall x0, nat_p x0 -> (forall x1, x1 :e SNoS_ x0 -> SNoLt 0 x1 -> SNoLt (eps_ x0) x1)).
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom add_SNo_minus_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x2 (add_SNo x0 (minus_SNo x1)) -> SNoLt (add_SNo x2 x1) x0).
Axiom add_SNo_minus_Lt2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x2 x1) x0 -> SNoLt x2 (add_SNo x0 (minus_SNo x1))).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom add_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> add_SNo x0 x1 :e SNoS_ omega)).
Theorem add_SNo_omega_eps_Lt : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, and (x3 :e omega) (SNoLt (add_SNo x0 (eps_ x3)) x1) -> x2) -> x2))).
admit.
Qed.
Definition missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c : set -> prop :=
 (fun x0 : set => and (x0 c= SNoS_ omega) (forall x1, x1 :e x0 -> (forall x2 : prop, (forall x3, and (x3 :e omega) (forall x4, x4 :e SNoS_ omega -> SNoLt (add_SNo x1 (minus_SNo (eps_ x3))) x4 -> SNoLt x4 (add_SNo x1 (eps_ x3)) -> x4 :e x0) -> x2) -> x2))).
Theorem missingprop_690598e6fd4ea25bb12e3b584dc4b13fe6c60343f666f02f1641e57297d2d891 : (forall x0, x0 c= SNoS_ omega -> (forall x1, x1 :e x0 -> (forall x2 : prop, (forall x3, and (x3 :e omega) (forall x4, x4 :e SNoS_ omega -> SNoLt (add_SNo x1 (minus_SNo (eps_ x3))) x4 -> SNoLt x4 (add_SNo x1 (eps_ x3)) -> x4 :e x0) -> x2) -> x2)) -> missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c x0).
admit.
Qed.
Definition SNoL_omega : set -> set :=
 (fun x0 : set => Sep (SNoS_ omega) (fun x1 : set => SNoLt x1 x0)).
Definition SNoR_omega : set -> set :=
 (fun x0 : set => Sep (SNoS_ omega) (SNoLt x0)).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Theorem missingprop_f034141f72d6c4eb35d80a2119f7efda32b3a2da588de397b25001b9c4cc72d9 : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL_omega x0 -> (forall x2 : prop, (forall x3, and (x3 :e omega) (SNoLt (add_SNo x1 (eps_ x3)) x0) -> x2) -> x2)) -> missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c (SNoL_omega x0)).
admit.
Qed.
Theorem missingprop_76200c785beb8c7d3f1ca8ae3c4cf9b46875e0cfc933a9cb2834cf5dfa366c76 : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR_omega x0 -> (forall x2 : prop, (forall x3, and (x3 :e omega) (SNoLt x0 (add_SNo x1 (minus_SNo (eps_ x3)))) -> x2) -> x2)) -> missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c (SNoR_omega x0)).
admit.
Qed.
Definition missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4 : set :=
 Sep (SNoS_ (ordsucc omega)) (fun x0 : set => and (and (and (SNoL_omega x0 = 0 -> (forall x1 : prop, x1)) (SNoR_omega x0 = 0 -> (forall x1 : prop, x1))) (missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c (SNoL_omega x0))) (missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c (SNoR_omega x0))).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Theorem missingprop_09fffc7b9e5d0b1d7f15cd56209324363defbb3ebe9c272e83a66e2590b7bd24 : (forall x0, x0 :e SNoS_ (ordsucc omega) -> (SNoL_omega x0 = 0 -> (forall x1 : prop, x1)) -> (SNoR_omega x0 = 0 -> (forall x1 : prop, x1)) -> missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c (SNoL_omega x0) -> missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c (SNoR_omega x0) -> x0 :e missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4).
admit.
Qed.
Axiom and4E : (forall x0 x1 x2 x3 : prop, and (and (and x0 x1) x2) x3 -> (forall x4 : prop, (x0 -> x1 -> x2 -> x3 -> x4) -> x4)).
Theorem missingprop_44069e352f5036a86127073abddc29a0ac5cf4eb6f4d81d6ec3a0209c2755103 : (forall x0, x0 :e missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4 -> (forall x1 : prop, (x0 :e SNoS_ (ordsucc omega) -> (SNoL_omega x0 = 0 -> (forall x2 : prop, x2)) -> (SNoR_omega x0 = 0 -> (forall x2 : prop, x2)) -> missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c (SNoL_omega x0) -> missingname_16a206dc52b4bb55b4a6c92782a08f06f95014669558c00b452a0ba01b887b1c (SNoR_omega x0) -> x1) -> x1)).
admit.
Qed.
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Theorem missingprop_78ab2f997523a88bf0249dfd2d26b12d3641ee1e1b29b0fe0b6ecbe2bcb9ba5e : missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4 c= SNoS_ (ordsucc omega).
admit.
Qed.
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
(* Parameter SNo_extend0 "e94a939c86c866ea378958089db656d350c86095197c9912d4e9d0f1ea317f09" "997d9126455d5de46368f27620eca2e5ad3b0f0ecdffdc7703aa4aafb77eafb6" *)
Parameter SNo_extend0 : set -> set.
Axiom SNo_extend0_SNo_ : (forall x0, SNo x0 -> SNo_ (ordsucc (SNoLev x0)) (SNo_extend0 x0)).
Axiom SNo_extend0_Lt : (forall x0, SNo x0 -> SNoLt (SNo_extend0 x0) x0).
(* Parameter SNo_extend1 "680d7652d15d54f0a766df3f997236fe6ea93db85d1c85bee2fa1d84b02d9c1d" "464e47790f44cd38285279f563a5a918d73224c78a9ef17ae1a46e62a95b2a41" *)
Parameter SNo_extend1 : set -> set.
Axiom SNo_extend1_SNo_ : (forall x0, SNo x0 -> SNo_ (ordsucc (SNoLev x0)) (SNo_extend1 x0)).
Axiom SNo_extend1_Gt : (forall x0, SNo x0 -> SNoLt x0 (SNo_extend1 x0)).
Theorem missingprop_db92898b58c469e9ad58b8b3729b507e8cadb7c632fb9757b051ec3b47524b67 : (forall x0, x0 :e SNoS_ omega -> x0 :e missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4).
admit.
Qed.
Theorem missingprop_15b221ba0c4ae0e05ed8cc21a7cdf61ac684525faddd1c477ed29fb7cbd9ee7b : (forall x0, SNo x0 -> SNoCutP (SNoL_omega x0) (SNoR_omega x0)).
admit.
Qed.
Axiom SNoS_E : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (forall x3, and (x3 :e x0) (SNo_ x3 x1) -> x2) -> x2))).
Axiom ordsucc_omega_ordinal : ordinal (ordsucc omega).
Axiom SNoCut_ext : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x1 -> SNoLt (SNoCut x2 x3) x4) -> (forall x4, x4 :e x2 -> SNoLt x4 (SNoCut x0 x1)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoCut x0 x1 = SNoCut x2 x3).
Axiom SNoCutP_SNoL_SNoR : (forall x0, SNo x0 -> SNoCutP (SNoL x0) (SNoR x0)).
Axiom SNoCutP_SNoCut_L : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x0 -> SNoLt x2 (SNoCut x0 x1))).
Axiom SNoCutP_SNoCut_R : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x1 -> SNoLt (SNoCut x0 x1) x2)).
Axiom TransSet_In_ordsucc_Subq : (forall x0 x1, TransSet x1 -> x0 :e ordsucc x1 -> x0 c= x1).
Axiom omega_TransSet : TransSet omega.
Axiom SNoLev_uniq : (forall x0 x1 x2, ordinal x1 -> ordinal x2 -> SNo_ x1 x0 -> SNo_ x2 x0 -> x1 = x2).
Theorem missingprop_0e7b9203cc682cd4470f749df0d7773bb56f7d49172a681a31039c99f4c6190e : (forall x0, x0 :e SNoS_ (ordsucc omega) -> x0 = SNoCut (SNoL_omega x0) (SNoR_omega x0)).
admit.
Qed.
Theorem missingprop_e3f60c2768e445b24135a40107035ad21c03de45130bcda31e71da16caa4c99c : (forall x0, x0 :e missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4 -> x0 = SNoCut (SNoL_omega x0) (SNoR_omega x0)).
admit.
Qed.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Theorem missingprop_8a1a82ac356e457f7d6fea412cc602e7bf973ae5a3d1fe392acbd6183e111060 : (forall x0, x0 :e missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4 -> (forall x1 : prop, (forall x2, and (x2 :e SNoS_ omega) (SNoLt x2 x0) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_edbfff85c909fe0b9cc4f471ef0cb3f4b241c89ff5fdc0aac267048126f79d55 : (forall x0, x0 :e missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4 -> (forall x1 : prop, (forall x2, and (x2 :e SNoS_ omega) (SNoLt x0 x2) -> x1) -> x1)).
admit.
Qed.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom mul_SNo_Lt : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x2 x0 -> SNoLt x3 x1 -> SNoLt (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
Theorem mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (mul_SNo x0 x1)).
admit.
Qed.
Theorem mul_SNo_pos_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt x1 0 -> SNoLt (mul_SNo x0 x1) 0).
admit.
Qed.
Theorem mul_SNo_neg_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 0 -> SNoLt 0 x1 -> SNoLt (mul_SNo x0 x1) 0).
admit.
Qed.
Theorem mul_SNo_neg_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 0 -> SNoLt x1 0 -> SNoLt 0 (mul_SNo x0 x1)).
admit.
Qed.
Theorem mul_SNo_nonzero : (forall x0 x1, SNo x0 -> SNo x1 -> (x0 = 0 -> (forall x2 : prop, x2)) -> (x1 = 0 -> (forall x2 : prop, x2)) -> mul_SNo x0 x1 = 0 -> (forall x2 : prop, x2)).
admit.
Qed.
Axiom minus_SNoCut_eq : (forall x0 x1, SNoCutP x0 x1 -> minus_SNo (SNoCut x0 x1) = SNoCut (Repl x1 minus_SNo) (Repl x0 minus_SNo)).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom minus_SNo_Lt_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt (minus_SNo x1) (minus_SNo x0)).
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Theorem minus_SNo_restr_SNo : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> binintersect (minus_SNo x0) (SNoElts_ x1) = minus_SNo (binintersect x0 (SNoElts_ x1)))).
admit.
Qed.
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom SNoEq_sym_ : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x1).
Theorem minus_SNo_exactly1of2 : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> exactly1of2 (x1 :e x0) (x1 :e minus_SNo x0))).
admit.
Qed.
Theorem minus_SNo_In : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> x1 :e x0 -> nIn x1 (minus_SNo x0))).
admit.
Qed.
Theorem minus_SNo_nIn : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> nIn x1 x0 -> x1 :e minus_SNo x0)).
admit.
Qed.
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom add_SNo_minus_Lt1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 (add_SNo x2 x1) -> SNoLt (add_SNo x0 (minus_SNo x1)) x2).
Axiom add_SNo_minus_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 (minus_SNo x1)) x2 -> SNoLt x0 (add_SNo x2 x1)).
Theorem missingprop_5ba504335f94f103b4e4f4b4128f81159e7d57c6f6e51ddf1aac116c6bc3d844 : (forall x0, x0 :e missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4 -> minus_SNo x0 :e missingname_1bd1ac4ee8852db6f99d372f1c27ef21bca430b1c9c4c4d184e017f6a4d8d1b4).
admit.
Qed.
