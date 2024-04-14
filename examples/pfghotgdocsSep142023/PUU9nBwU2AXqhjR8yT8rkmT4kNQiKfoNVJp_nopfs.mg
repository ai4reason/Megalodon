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
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom Empty_Subq_eq : (forall x0, x0 c= Empty -> x0 = Empty).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Theorem famunion_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (famunion Empty x0) Empty -> x1 Empty (famunion Empty x0)).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem SNoCutP_L_0 : (forall x0, (forall x1, x1 :e x0 -> SNo x1) -> SNoCutP x0 Empty).
admit.
Qed.
Theorem SNoCutP_0_R : (forall x0, (forall x1, x1 :e x0 -> SNo x1) -> SNoCutP Empty x0).
admit.
Qed.
Theorem SNoCutP_0_0 : SNoCutP Empty Empty.
admit.
Qed.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Axiom binunion_idl : (forall x0, forall x1 : set -> set -> prop, x1 (binunion 0 x0) x0 -> x1 x0 (binunion 0 x0)).
Axiom SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
Axiom SNo_0 : SNo 0.
Axiom SNoLev_0 : SNoLev 0 = 0.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom SNoEq_I : (forall x0 x1 x2, (forall x3, x3 :e x0 -> iff (x3 :e x1) (x3 :e x2)) -> SNoEq_ x0 x1 x2).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Theorem SNoCut_0_0 : SNoCut 0 0 = 0.
admit.
Qed.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom SNo_1 : SNo 1.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_1 : nat_p 1.
Axiom In_0_1 : 0 :e 1.
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Theorem SNoL_1 : SNoL 1 = 1.
admit.
Qed.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom ordinal_SNoR : (forall x0, ordinal x0 -> SNoR x0 = 0).
Theorem SNoR_1 : SNoR 1 = 0.
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Theorem SNo_add_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (add_SNo x0 (add_SNo x1 x2))).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem SNo_add_SNo_3c : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (add_SNo x0 (add_SNo x1 (minus_SNo x2)))).
admit.
Qed.
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Theorem minus_add_SNo_distr_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> minus_SNo (add_SNo x0 (add_SNo x1 x2)) = add_SNo (minus_SNo x0) (add_SNo (minus_SNo x1) (minus_SNo x2))).
admit.
Qed.
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
Theorem add_SNo_3_3_3_Lt1 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3) -> SNoLt (add_SNo x0 (add_SNo x1 x4)) (add_SNo x2 (add_SNo x3 x4))).
admit.
Qed.
Axiom add_SNo_rotate_3_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x2 (add_SNo x0 x1)).
Theorem add_SNo_3_2_3_Lt1 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNoLt (add_SNo x1 x0) (add_SNo x2 x3) -> SNoLt (add_SNo x0 (add_SNo x4 x1)) (add_SNo x2 (add_SNo x3 x4))).
admit.
Qed.
Axiom add_SNo_Lt1_cancel : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1) -> SNoLt x0 x2).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Theorem add_SNo_minus_Lt1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 (add_SNo x2 x1) -> SNoLt (add_SNo x0 (minus_SNo x1)) x2).
admit.
Qed.
Theorem add_SNo_minus_Lt2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x2 x1) x0 -> SNoLt x2 (add_SNo x0 (minus_SNo x1))).
admit.
Qed.
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Theorem add_SNo_minus_Lt12b3 : (forall x0 x1 x2 x3 x4 x5, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNoLt (add_SNo x0 (add_SNo x1 x5)) (add_SNo x3 (add_SNo x4 x2)) -> SNoLt (add_SNo x0 (add_SNo x1 (minus_SNo x2))) (add_SNo x3 (add_SNo x4 (minus_SNo x5)))).
admit.
Qed.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom mul_SNo_prop_1 : (forall x0, SNo x0 -> (forall x1, SNo x1 -> (forall x2 : prop, (SNo (mul_SNo x0 x1) -> (forall x3, x3 :e SNoL x0 -> (forall x4, x4 :e SNoL x1 -> SNoLt (add_SNo (mul_SNo x3 x1) (mul_SNo x0 x4)) (add_SNo (mul_SNo x0 x1) (mul_SNo x3 x4)))) -> (forall x3, x3 :e SNoR x0 -> (forall x4, x4 :e SNoR x1 -> SNoLt (add_SNo (mul_SNo x3 x1) (mul_SNo x0 x4)) (add_SNo (mul_SNo x0 x1) (mul_SNo x3 x4)))) -> (forall x3, x3 :e SNoL x0 -> (forall x4, x4 :e SNoR x1 -> SNoLt (add_SNo (mul_SNo x0 x1) (mul_SNo x3 x4)) (add_SNo (mul_SNo x3 x1) (mul_SNo x0 x4)))) -> (forall x3, x3 :e SNoR x0 -> (forall x4, x4 :e SNoL x1 -> SNoLt (add_SNo (mul_SNo x0 x1) (mul_SNo x3 x4)) (add_SNo (mul_SNo x3 x1) (mul_SNo x0 x4)))) -> x2) -> x2))).
Theorem SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
admit.
Qed.
Theorem SNo_mul_SNo_lem : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo (add_SNo (mul_SNo x2 x1) (add_SNo (mul_SNo x0 x3) (minus_SNo (mul_SNo x2 x3))))).
admit.
Qed.
Axiom mul_SNo_eq_2 : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (forall x3 x4, (forall x5, x5 :e x3 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e x4 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> mul_SNo x0 x1 = SNoCut x3 x4 -> x2) -> x2)).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Theorem mul_SNo_eq_3 : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (forall x3 x4, SNoCutP x3 x4 -> (forall x5, x5 :e x3 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e x4 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> mul_SNo x0 x1 = SNoCut x3 x4 -> x2) -> x2)).
admit.
Qed.
Theorem mul_SNo_Subq_lem : (forall x0 x1 x2 x3 x4 x5 x6 x7, (forall x8, x8 :e x6 -> (forall x9 : prop, (forall x10, x10 :e x2 -> (forall x11, x11 :e x3 -> x8 = add_SNo (mul_SNo x10 x1) (add_SNo (mul_SNo x0 x11) (minus_SNo (mul_SNo x10 x11))) -> x9)) -> (forall x10, x10 :e x4 -> (forall x11, x11 :e x5 -> x8 = add_SNo (mul_SNo x10 x1) (add_SNo (mul_SNo x0 x11) (minus_SNo (mul_SNo x10 x11))) -> x9)) -> x9)) -> (forall x8, x8 :e x2 -> (forall x9, x9 :e x3 -> add_SNo (mul_SNo x8 x1) (add_SNo (mul_SNo x0 x9) (minus_SNo (mul_SNo x8 x9))) :e x7)) -> (forall x8, x8 :e x4 -> (forall x9, x9 :e x5 -> add_SNo (mul_SNo x8 x1) (add_SNo (mul_SNo x0 x9) (minus_SNo (mul_SNo x8 x9))) :e x7)) -> x6 c= x7).
admit.
Qed.
Axiom SNoR_0 : SNoR 0 = 0.
Axiom SNoL_0 : SNoL 0 = 0.
Theorem mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
admit.
Qed.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
Axiom SNoLev_ind : (forall x0 : set -> prop, (forall x1, SNo x1 -> (forall x2, x2 :e SNoS_ (SNoLev x1) -> x0 x2) -> x0 x1) -> (forall x1, SNo x1 -> x0 x1)).
Axiom SNo_eta : (forall x0, SNo x0 -> x0 = SNoCut (SNoL x0) (SNoR x0)).
Axiom SNoCut_ext : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x1 -> SNoLt (SNoCut x2 x3) x4) -> (forall x4, x4 :e x2 -> SNoLt x4 (SNoCut x0 x1)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoCut x0 x1 = SNoCut x2 x3).
Axiom SNoCutP_SNoL_SNoR : (forall x0, SNo x0 -> SNoCutP (SNoL x0) (SNoR x0)).
Axiom SNoCutP_SNoCut_L : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x0 -> SNoLt x2 (SNoCut x0 x1))).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom SNoL_SNoS : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> x1 :e SNoS_ (SNoLev x0))).
Axiom SNoCutP_SNoCut_R : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x1 -> SNoLt (SNoCut x0 x1) x2)).
Axiom SNoR_SNoS : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> x1 :e SNoS_ (SNoLev x0))).
Theorem mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
admit.
Qed.
Axiom SNoLev_ind2 : (forall x0 : set -> set -> prop, (forall x1 x2, SNo x1 -> SNo x2 -> (forall x3, x3 :e SNoS_ (SNoLev x1) -> x0 x3 x2) -> (forall x3, x3 :e SNoS_ (SNoLev x2) -> x0 x1 x3) -> (forall x3, x3 :e SNoS_ (SNoLev x1) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> x0 x3 x4)) -> x0 x1 x2) -> (forall x1 x2, SNo x1 -> SNo x2 -> x0 x1 x2)).
Axiom add_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x1 (add_SNo x0 x2)).
Theorem mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
admit.
Qed.
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
Axiom minus_SNo_Lev : (forall x0, SNo x0 -> SNoLev (minus_SNo x0) = SNoLev x0).
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom minus_SNo_Lt_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt (minus_SNo x1) (minus_SNo x0)).
Axiom minus_SNoCut_eq : (forall x0 x1, SNoCutP x0 x1 -> minus_SNo (SNoCut x0 x1) = SNoCut (Repl x1 minus_SNo) (Repl x0 minus_SNo)).
Theorem mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
admit.
Qed.
