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
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
Axiom SNoLev_ind : (forall x0 : set -> prop, (forall x1, SNo x1 -> (forall x2, x2 :e SNoS_ (SNoLev x1) -> x0 x2) -> x0 x1) -> (forall x1, SNo x1 -> x0 x1)).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom mul_SNoCut_abs : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> (forall x6 : prop, (forall x7 x8 x9 x10, (forall x11, x11 :e x7 -> (forall x12 : prop, (forall x13, x13 :e x0 -> (forall x14, x14 :e x2 -> SNo x13 -> SNo x14 -> SNoLt x13 x4 -> SNoLt x14 x5 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x0 -> (forall x12, x12 :e x2 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x7)) -> (forall x11, x11 :e x8 -> (forall x12 : prop, (forall x13, x13 :e x1 -> (forall x14, x14 :e x3 -> SNo x13 -> SNo x14 -> SNoLt x4 x13 -> SNoLt x5 x14 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x1 -> (forall x12, x12 :e x3 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x8)) -> (forall x11, x11 :e x9 -> (forall x12 : prop, (forall x13, x13 :e x0 -> (forall x14, x14 :e x3 -> SNo x13 -> SNo x14 -> SNoLt x13 x4 -> SNoLt x5 x14 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x0 -> (forall x12, x12 :e x3 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x9)) -> (forall x11, x11 :e x10 -> (forall x12 : prop, (forall x13, x13 :e x1 -> (forall x14, x14 :e x2 -> SNo x13 -> SNo x14 -> SNoLt x4 x13 -> SNoLt x14 x5 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x1 -> (forall x12, x12 :e x2 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x10)) -> SNoCutP (binunion x7 x8) (binunion x9 x10) -> mul_SNo x4 x5 = SNoCut (binunion x7 x8) (binunion x9 x10) -> x6) -> x6)).
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom SNo_eta : (forall x0, SNo x0 -> x0 = SNoCut (SNoL x0) (SNoR x0)).
Axiom SNoCut_Le : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoLe (SNoCut x0 x1) (SNoCut x2 x3)).
Axiom SNoCutP_SNoL_SNoR : (forall x0, SNo x0 -> SNoCutP (SNoL x0) (SNoR x0)).
Axiom binunionE' : (forall x0 x1 x2, forall x3 : prop, (x2 :e x0 -> x3) -> (x2 :e x1 -> x3) -> x2 :e binunion x0 x1 -> x3).
Axiom add_SNo_minus_Lt1b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x0 x1) (add_SNo x3 x2) -> SNoLt (add_SNo x0 (add_SNo x1 (minus_SNo x2))) x3).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Lt1_cancel : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1) -> SNoLt x0 x2).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Theorem mul_SNo_SNoCut_SNoL_interpolate : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4 x5, x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> (forall x6, x6 :e SNoL (mul_SNo x4 x5) -> or (forall x7 : prop, (forall x8, and (x8 :e x0) (forall x9 : prop, (forall x10, and (x10 :e x2) (SNoLe (add_SNo x6 (mul_SNo x8 x10)) (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x10))) -> x9) -> x9) -> x7) -> x7) (forall x7 : prop, (forall x8, and (x8 :e x1) (forall x9 : prop, (forall x10, and (x10 :e x3) (SNoLe (add_SNo x6 (mul_SNo x8 x10)) (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x10))) -> x9) -> x9) -> x7) -> x7)))).
admit.
Qed.
Theorem mul_SNo_SNoCut_SNoL_interpolate_impred : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4 x5, x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> (forall x6, x6 :e SNoL (mul_SNo x4 x5) -> (forall x7 : prop, (forall x8, x8 :e x0 -> (forall x9, x9 :e x2 -> SNoLe (add_SNo x6 (mul_SNo x8 x9)) (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x9)) -> x7)) -> (forall x8, x8 :e x1 -> (forall x9, x9 :e x3 -> SNoLe (add_SNo x6 (mul_SNo x8 x9)) (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x9)) -> x7)) -> x7)))).
admit.
Qed.
Axiom add_SNo_minus_Lt2b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x3 x2) (add_SNo x0 x1) -> SNoLt x3 (add_SNo x0 (add_SNo x1 (minus_SNo x2)))).
Theorem mul_SNo_SNoCut_SNoR_interpolate : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4 x5, x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> (forall x6, x6 :e SNoR (mul_SNo x4 x5) -> or (forall x7 : prop, (forall x8, and (x8 :e x0) (forall x9 : prop, (forall x10, and (x10 :e x3) (SNoLe (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x10)) (add_SNo x6 (mul_SNo x8 x10))) -> x9) -> x9) -> x7) -> x7) (forall x7 : prop, (forall x8, and (x8 :e x1) (forall x9 : prop, (forall x10, and (x10 :e x2) (SNoLe (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x10)) (add_SNo x6 (mul_SNo x8 x10))) -> x9) -> x9) -> x7) -> x7)))).
admit.
Qed.
Theorem mul_SNo_SNoCut_SNoR_interpolate_impred : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4 x5, x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> (forall x6, x6 :e SNoR (mul_SNo x4 x5) -> (forall x7 : prop, (forall x8, x8 :e x0 -> (forall x9, x9 :e x3 -> SNoLe (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x9)) (add_SNo x6 (mul_SNo x8 x9)) -> x7)) -> (forall x8, x8 :e x1 -> (forall x9, x9 :e x2 -> SNoLe (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x9)) (add_SNo x6 (mul_SNo x8 x9)) -> x7)) -> x7)))).
admit.
Qed.
