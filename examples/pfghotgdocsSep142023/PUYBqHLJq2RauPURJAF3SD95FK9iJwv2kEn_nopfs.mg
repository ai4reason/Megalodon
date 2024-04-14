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
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom mul_SNo_Subq_lem : (forall x0 x1 x2 x3 x4 x5 x6 x7, (forall x8, x8 :e x6 -> (forall x9 : prop, (forall x10, x10 :e x2 -> (forall x11, x11 :e x3 -> x8 = add_SNo (mul_SNo x10 x1) (add_SNo (mul_SNo x0 x11) (minus_SNo (mul_SNo x10 x11))) -> x9)) -> (forall x10, x10 :e x4 -> (forall x11, x11 :e x5 -> x8 = add_SNo (mul_SNo x10 x1) (add_SNo (mul_SNo x0 x11) (minus_SNo (mul_SNo x10 x11))) -> x9)) -> x9)) -> (forall x8, x8 :e x2 -> (forall x9, x9 :e x3 -> add_SNo (mul_SNo x8 x1) (add_SNo (mul_SNo x0 x9) (minus_SNo (mul_SNo x8 x9))) :e x7)) -> (forall x8, x8 :e x4 -> (forall x9, x9 :e x5 -> add_SNo (mul_SNo x8 x1) (add_SNo (mul_SNo x0 x9) (minus_SNo (mul_SNo x8 x9))) :e x7)) -> x6 c= x7).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom add_SNo_Lt1_cancel : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1) -> SNoLt x0 x2).
Theorem add_SNo_Lt2_cancel : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2) -> SNoLt x1 x2).
admit.
Qed.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom mul_SNo_prop_1 : (forall x0, SNo x0 -> (forall x1, SNo x1 -> (forall x2 : prop, (SNo (mul_SNo x0 x1) -> (forall x3, x3 :e SNoL x0 -> (forall x4, x4 :e SNoL x1 -> SNoLt (add_SNo (mul_SNo x3 x1) (mul_SNo x0 x4)) (add_SNo (mul_SNo x0 x1) (mul_SNo x3 x4)))) -> (forall x3, x3 :e SNoR x0 -> (forall x4, x4 :e SNoR x1 -> SNoLt (add_SNo (mul_SNo x3 x1) (mul_SNo x0 x4)) (add_SNo (mul_SNo x0 x1) (mul_SNo x3 x4)))) -> (forall x3, x3 :e SNoL x0 -> (forall x4, x4 :e SNoR x1 -> SNoLt (add_SNo (mul_SNo x0 x1) (mul_SNo x3 x4)) (add_SNo (mul_SNo x3 x1) (mul_SNo x0 x4)))) -> (forall x3, x3 :e SNoR x0 -> (forall x4, x4 :e SNoL x1 -> SNoLt (add_SNo (mul_SNo x0 x1) (mul_SNo x3 x4)) (add_SNo (mul_SNo x3 x1) (mul_SNo x0 x4)))) -> x2) -> x2))).
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
(* Parameter nIn "2f8b7f287504f141b0f821928ac62823a377717763a224067702eee02fc1f359" "36808cca33f2b3819497d3a1f10fcc77486a0cddbcb304e44cbf2d818e181c3e" *)
Parameter nIn : set -> set -> prop.
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Axiom add_SNo_Lt3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom add_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x1 (add_SNo x0 x2)).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom add_SNo_rotate_3_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x2 (add_SNo x0 x1)).
Theorem mul_SNo_Lt : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x2 x0 -> SNoLt x3 x1 -> SNoLt (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Theorem mul_SNo_Le : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x2 x0 -> SNoLe x3 x1 -> SNoLe (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
admit.
Qed.
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom add_SNo_minus_Lt1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 (add_SNo x2 x1) -> SNoLt (add_SNo x0 (minus_SNo x1)) x2).
Theorem add_SNo_minus_Lt1b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x0 x1) (add_SNo x3 x2) -> SNoLt (add_SNo x0 (add_SNo x1 (minus_SNo x2))) x3).
admit.
Qed.
Axiom add_SNo_minus_Lt2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x2 x1) x0 -> SNoLt x2 (add_SNo x0 (minus_SNo x1))).
Theorem add_SNo_minus_Lt2b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x3 x2) (add_SNo x0 x1) -> SNoLt x3 (add_SNo x0 (add_SNo x1 (minus_SNo x2)))).
admit.
Qed.
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
(* Parameter SNoCutP "b102ccc5bf572aba76b2c5ff3851795ba59cb16151277dbee9ce5a1aad694334" "c083d829a4633f1bc9aeab80859255a8d126d7c6824bf5fd520d6daabfbbe976" *)
Parameter SNoCutP : set -> set -> prop.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
Axiom mul_SNo_eq_3 : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (forall x3 x4, SNoCutP x3 x4 -> (forall x5, x5 :e x3 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e x4 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> mul_SNo x0 x1 = SNoCut x3 x4 -> x2) -> x2)).
Axiom SNo_eta : (forall x0, SNo x0 -> x0 = SNoCut (SNoL x0) (SNoR x0)).
Axiom SNoCut_Le : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoLe (SNoCut x0 x1) (SNoCut x2 x3)).
Axiom SNoCutP_SNoL_SNoR : (forall x0, SNo x0 -> SNoCutP (SNoL x0) (SNoR x0)).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Theorem mul_SNo_SNoL_interpolate : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoL (mul_SNo x0 x1) -> or (forall x3 : prop, (forall x4, and (x4 :e SNoL x0) (forall x5 : prop, (forall x6, and (x6 :e SNoL x1) (SNoLe (add_SNo x2 (mul_SNo x4 x6)) (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x6))) -> x5) -> x5) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e SNoR x0) (forall x5 : prop, (forall x6, and (x6 :e SNoR x1) (SNoLe (add_SNo x2 (mul_SNo x4 x6)) (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x6))) -> x5) -> x5) -> x3) -> x3))).
admit.
Qed.
Theorem mul_SNo_SNoL_interpolate_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoL (mul_SNo x0 x1) -> (forall x3 : prop, (forall x4, x4 :e SNoL x0 -> (forall x5, x5 :e SNoL x1 -> SNoLe (add_SNo x2 (mul_SNo x4 x5)) (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) -> x3)) -> (forall x4, x4 :e SNoR x0 -> (forall x5, x5 :e SNoR x1 -> SNoLe (add_SNo x2 (mul_SNo x4 x5)) (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) -> x3)) -> x3))).
admit.
Qed.
Theorem mul_SNo_SNoR_interpolate : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoR (mul_SNo x0 x1) -> or (forall x3 : prop, (forall x4, and (x4 :e SNoL x0) (forall x5 : prop, (forall x6, and (x6 :e SNoR x1) (SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x6)) (add_SNo x2 (mul_SNo x4 x6))) -> x5) -> x5) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e SNoR x0) (forall x5 : prop, (forall x6, and (x6 :e SNoL x1) (SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x6)) (add_SNo x2 (mul_SNo x4 x6))) -> x5) -> x5) -> x3) -> x3))).
admit.
Qed.
Theorem mul_SNo_SNoR_interpolate_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoR (mul_SNo x0 x1) -> (forall x3 : prop, (forall x4, x4 :e SNoL x0 -> (forall x5, x5 :e SNoR x1 -> SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) (add_SNo x2 (mul_SNo x4 x5)) -> x3)) -> (forall x4, x4 :e SNoR x0 -> (forall x5, x5 :e SNoL x1 -> SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) (add_SNo x2 (mul_SNo x4 x5)) -> x3)) -> x3))).
admit.
Qed.
