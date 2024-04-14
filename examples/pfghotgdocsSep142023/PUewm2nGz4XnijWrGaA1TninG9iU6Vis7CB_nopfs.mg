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
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Theorem famunion_Subq : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 c= x2 x3) -> famunion x0 x1 c= famunion x0 x2).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom Subq_ref : (forall x0, x0 c= x0).
Theorem famunion_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> famunion x0 x1 = famunion x0 x2).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Axiom nat_inv_impred : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Theorem nat_Subq_add_ex : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> x0 c= x1 -> (forall x2 : prop, (forall x3, and (nat_p x3) (x1 = add_nat x3 x0) -> x2) -> x2))).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Theorem SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
admit.
Qed.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom SNo_0 : SNo 0.
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (mul_SNo x0 x1)).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Theorem mul_SNo_nonneg_nonneg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe 0 (mul_SNo x0 x1)).
admit.
Qed.
Axiom pos_mul_SNo_Lt2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (mul_SNo x0 x1) (mul_SNo x2 x3)).
Theorem SNo_pos_sqr_uniq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> mul_SNo x0 x0 = mul_SNo x1 x1 -> x0 = x1).
admit.
Qed.
Axiom SNo_zero_or_sqr_pos : (forall x0, SNo x0 -> or (x0 = 0) (SNoLt 0 (mul_SNo x0 x0))).
Theorem SNo_nonneg_sqr_uniq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe 0 x1 -> mul_SNo x0 x0 = mul_SNo x1 x1 -> x0 = x1).
admit.
Qed.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Definition PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)).
Definition SNoEq_ : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => PNoEq_ x0 (fun x3 : set => x3 :e x1) (fun x3 : set => x3 :e x2)).
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom andEL : (forall x0 x1 : prop, and x0 x1 -> x0).
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Theorem SNoL_SNoCutP_ex : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e SNoL (SNoCut x0 x1) -> (forall x3 : prop, (forall x4, and (x4 :e x0) (SNoLe x2 x4) -> x3) -> x3))).
admit.
Qed.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Theorem SNoR_SNoCutP_ex : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e SNoR (SNoCut x0 x1) -> (forall x3 : prop, (forall x4, and (x4 :e x1) (SNoLe x4 x2) -> x3) -> x3))).
admit.
Qed.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
Axiom ordinal_Empty : ordinal 0.
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Axiom SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
Axiom SNo_1 : SNo 1.
Axiom nat_1 : nat_p 1.
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom In_0_1 : 0 :e 1.
Theorem pos_low_eq_one : (forall x0, SNo x0 -> SNoLt 0 x0 -> SNoLev x0 c= 1 -> x0 = 1).
admit.
Qed.
Axiom mul_SNo_neg_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 0 -> SNoLt 0 x1 -> SNoLt (mul_SNo x0 x1) 0).
Axiom SNoLe_antisym : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe x1 x0 -> x0 = x1).
Theorem mul_SNo_nonpos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 0 -> SNoLt 0 x1 -> SNoLe (mul_SNo x0 x1) 0).
admit.
Qed.
Axiom mul_SNo_neg_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 0 -> SNoLt x1 0 -> SNoLt 0 (mul_SNo x0 x1)).
Theorem mul_SNo_nonpos_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 0 -> SNoLt x1 0 -> SNoLe 0 (mul_SNo x0 x1)).
admit.
Qed.
Axiom neg_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt x0 0 -> SNo x1 -> SNo x2 -> SNoLt x2 x1 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem nonpos_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe x0 0 -> SNo x1 -> SNo x2 -> SNoLe x2 x1 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition SNoL_pos : set -> set :=
 (fun x0 : set => Sep (SNoL x0) (SNoLt 0)).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom SNoLt_0_1 : SNoLt 0 1.
Axiom mul_SNo_pos_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt x1 0 -> SNoLt (mul_SNo x0 x1) 0).
Theorem SNo_recip_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> mul_SNo x0 x1 = 1 -> SNoLt 0 x1).
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom add_SNo_minus_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x0 (minus_SNo x1)) x2 -> SNoLt x0 (add_SNo x2 x1)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom add_SNo_minus_Lt2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x2 x1) x0 -> SNoLt x2 (add_SNo x0 (minus_SNo x1))).
Axiom add_SNo_minus_Lt1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 (add_SNo x2 x1) -> SNoLt (add_SNo x0 (minus_SNo x1)) x2).
Theorem SNo_recip_lem1 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNoLt 0 x0 -> x1 :e SNoL_pos x0 -> SNo x2 -> mul_SNo x1 x2 = 1 -> SNo x3 -> SNoLt (mul_SNo x0 x3) 1 -> SNo x4 -> add_SNo 1 (minus_SNo (mul_SNo x0 x4)) = mul_SNo (add_SNo 1 (minus_SNo (mul_SNo x0 x3))) (mul_SNo (add_SNo x1 (minus_SNo x0)) x2) -> SNoLt 1 (mul_SNo x0 x4)).
admit.
Qed.
Axiom add_SNo_minus_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x2 (add_SNo x0 (minus_SNo x1)) -> SNoLt (add_SNo x2 x1) x0).
Theorem SNo_recip_lem2 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNoLt 0 x0 -> x1 :e SNoL_pos x0 -> SNo x2 -> mul_SNo x1 x2 = 1 -> SNo x3 -> SNoLt 1 (mul_SNo x0 x3) -> SNo x4 -> add_SNo 1 (minus_SNo (mul_SNo x0 x4)) = mul_SNo (add_SNo 1 (minus_SNo (mul_SNo x0 x3))) (mul_SNo (add_SNo x1 (minus_SNo x0)) x2) -> SNoLt (mul_SNo x0 x4) 1).
admit.
Qed.
Theorem SNo_recip_lem3 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNoLt 0 x0 -> x1 :e SNoR x0 -> SNo x2 -> mul_SNo x1 x2 = 1 -> SNo x3 -> SNoLt (mul_SNo x0 x3) 1 -> SNo x4 -> add_SNo 1 (minus_SNo (mul_SNo x0 x4)) = mul_SNo (add_SNo 1 (minus_SNo (mul_SNo x0 x3))) (mul_SNo (add_SNo x1 (minus_SNo x0)) x2) -> SNoLt (mul_SNo x0 x4) 1).
admit.
Qed.
Theorem SNo_recip_lem4 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNoLt 0 x0 -> x1 :e SNoR x0 -> SNo x2 -> mul_SNo x1 x2 = 1 -> SNo x3 -> SNoLt 1 (mul_SNo x0 x3) -> SNo x4 -> add_SNo 1 (minus_SNo (mul_SNo x0 x4)) = mul_SNo (add_SNo 1 (minus_SNo (mul_SNo x0 x3))) (mul_SNo (add_SNo x1 (minus_SNo x0)) x2) -> SNoLt 1 (mul_SNo x0 x4)).
admit.
Qed.
Definition SNo_recipauxset : set -> set -> set -> (set -> set) -> set :=
 (fun x0 x1 x2 : set => fun x3 : set -> set => famunion x0 (fun x4 : set => {mul_SNo (add_SNo 1 (mul_SNo (add_SNo x5 (minus_SNo x1)) x4)) (x3 x5) | x5 :e x2})).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem SNo_recipauxset_I : (forall x0 x1 x2, forall x3 : set -> set, forall x4, x4 :e x0 -> (forall x5, x5 :e x2 -> mul_SNo (add_SNo 1 (mul_SNo (add_SNo x5 (minus_SNo x1)) x4)) (x3 x5) :e SNo_recipauxset x0 x1 x2 x3)).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem SNo_recipauxset_E : (forall x0 x1 x2, forall x3 : set -> set, forall x4, x4 :e SNo_recipauxset x0 x1 x2 x3 -> (forall x5 : prop, (forall x6, x6 :e x0 -> (forall x7, x7 :e x2 -> x4 = mul_SNo (add_SNo 1 (mul_SNo (add_SNo x7 (minus_SNo x1)) x6)) (x3 x7) -> x5)) -> x5)).
admit.
Qed.
Axiom ReplEq_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Repl x0 x1 = Repl x0 x2).
Theorem SNo_recipauxset_ext : (forall x0 x1 x2, forall x3 x4 : set -> set, (forall x5, x5 :e x2 -> x3 x5 = x4 x5) -> SNo_recipauxset x0 x1 x2 x3 = SNo_recipauxset x0 x1 x2 x4).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition SNo_recipaux : set -> (set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set => nat_primrec (lam 2 (fun x2 : set => If_i (x2 = 0) (Sing 0) 0)) (fun x2 x3 : set => lam 2 (fun x4 : set => If_i (x4 = 0) (binunion (binunion (ap x3 0) (SNo_recipauxset (ap x3 0) x0 (SNoR x0) x1)) (SNo_recipauxset (ap x3 1) x0 (SNoL_pos x0) x1)) (binunion (binunion (ap x3 1) (SNo_recipauxset (ap x3 0) x0 (SNoL_pos x0) x1)) (SNo_recipauxset (ap x3 1) x0 (SNoR x0) x1))))).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem SNo_recipaux_0 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (SNo_recipaux x0 x1 0) (lam 2 (fun x3 : set => If_i (x3 = 0) (Sing 0) 0)) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) (Sing 0) 0)) (SNo_recipaux x0 x1 0)).
admit.
Qed.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Theorem SNo_recipaux_S : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> SNo_recipaux x0 x1 (ordsucc x2) = lam 2 (fun x4 : set => If_i (x4 = 0) (binunion (binunion (ap (SNo_recipaux x0 x1 x2) 0) (SNo_recipauxset (ap (SNo_recipaux x0 x1 x2) 0) x0 (SNoR x0) x1)) (SNo_recipauxset (ap (SNo_recipaux x0 x1 x2) 1) x0 (SNoL_pos x0) x1)) (binunion (binunion (ap (SNo_recipaux x0 x1 x2) 1) (SNo_recipauxset (ap (SNo_recipaux x0 x1 x2) 0) x0 (SNoL_pos x0) x1)) (SNo_recipauxset (ap (SNo_recipaux x0 x1 x2) 1) x0 (SNoR x0) x1)))).
admit.
Qed.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom SNo_foil : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (mul_SNo x0 x2) (add_SNo (mul_SNo x0 x3) (add_SNo (mul_SNo x1 x2) (mul_SNo x1 x3)))).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Theorem SNo_recipaux_lem1 : (forall x0, SNo x0 -> SNoLt 0 x0 -> (forall x1 : set -> set, (forall x2, x2 :e SNoS_ (SNoLev x0) -> SNoLt 0 x2 -> and (SNo (x1 x2)) (mul_SNo x2 (x1 x2) = 1)) -> (forall x2, nat_p x2 -> and (forall x3, x3 :e ap (SNo_recipaux x0 x1 x2) 0 -> and (SNo x3) (SNoLt (mul_SNo x0 x3) 1)) (forall x3, x3 :e ap (SNo_recipaux x0 x1 x2) 1 -> and (SNo x3) (SNoLt 1 (mul_SNo x0 x3)))))).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom nonneg_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe 0 x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem SNo_recipaux_lem2 : (forall x0, SNo x0 -> SNoLt 0 x0 -> (forall x1 : set -> set, (forall x2, x2 :e SNoS_ (SNoLev x0) -> SNoLt 0 x2 -> and (SNo (x1 x2)) (mul_SNo x2 (x1 x2) = 1)) -> SNoCutP (famunion omega (fun x2 : set => ap (SNo_recipaux x0 x1 x2) 0)) (famunion omega (fun x2 : set => ap (SNo_recipaux x0 x1 x2) 1)))).
admit.
Qed.
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Theorem SNo_recipaux_ext : (forall x0, SNo x0 -> (forall x1 x2 : set -> set, (forall x3, x3 :e SNoS_ (SNoLev x0) -> x1 x3 = x2 x3) -> (forall x3, nat_p x3 -> SNo_recipaux x0 x1 x3 = SNo_recipaux x0 x2 x3))).
admit.
Qed.
(* Parameter SNo_rec_i "352082c509ab97c1757375f37a2ac62ed806c7b39944c98161720a584364bfaf" "be45dfaed6c479503a967f3834400c4fd18a8a567c8887787251ed89579f7be3" *)
Parameter SNo_rec_i : (set -> (set -> set) -> set) -> set -> set.
Definition recip_SNo_pos : set -> set :=
 SNo_rec_i (fun x0 : set => fun x1 : set -> set => SNoCut (famunion omega (fun x2 : set => ap (SNo_recipaux x0 x1 x2) 0)) (famunion omega (fun x2 : set => ap (SNo_recipaux x0 x1 x2) 1))).
Axiom SNo_rec_i_eq : (forall x0 : set -> (set -> set) -> set, (forall x1, SNo x1 -> (forall x2 x3 : set -> set, (forall x4, x4 :e SNoS_ (SNoLev x1) -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3)) -> (forall x1, SNo x1 -> SNo_rec_i x0 x1 = x0 x1 (SNo_rec_i x0))).
Theorem recip_SNo_pos_eq : (forall x0, SNo x0 -> recip_SNo_pos x0 = SNoCut (famunion omega (fun x2 : set => ap (SNo_recipaux x0 recip_SNo_pos x2) 0)) (famunion omega (fun x2 : set => ap (SNo_recipaux x0 recip_SNo_pos x2) 1))).
admit.
Qed.
Definition recip_SNo : set -> set :=
 (fun x0 : set => If_i (SNoLt 0 x0) (recip_SNo_pos x0) (If_i (SNoLt x0 0) (minus_SNo (recip_SNo_pos (minus_SNo x0))) 0)).
Definition div_SNo : set -> set -> set :=
 (fun x0 x1 : set => mul_SNo x0 (recip_SNo x1)).
Definition SNoL_nonneg : set -> set :=
 (fun x0 : set => Sep (SNoL x0) (SNoLe 0)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Theorem Sep_Empty : (forall x0 : set -> prop, forall x1 : set -> set -> prop, x1 (Sep 0 x0) 0 -> x1 0 (Sep 0 x0)).
admit.
Qed.
Axiom SNoL_0 : SNoL 0 = 0.
Theorem SNoL_nonneg_0 : SNoL_nonneg 0 = 0.
admit.
Qed.
Axiom SNoL_1 : SNoL 1 = 1.
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Theorem SNoL_nonneg_1 : SNoL_nonneg 1 = 1.
admit.
Qed.
(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set -> (set -> prop) -> (set -> set) -> set.
Definition SNo_sqrtauxset : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => famunion x0 (fun x3 : set => ReplSep x1 (fun x4 : set => SNoLt 0 (add_SNo x3 x4)) (fun x4 : set => div_SNo (add_SNo x2 (mul_SNo x3 x4)) (add_SNo x3 x4)))).
Axiom ReplSepI : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e x0 -> x1 x3 -> x2 x3 :e ReplSep x0 x1 x2).
Theorem SNo_sqrtauxset_I : (forall x0 x1 x2 x3, x3 :e x0 -> (forall x4, x4 :e x1 -> SNoLt 0 (add_SNo x3 x4) -> div_SNo (add_SNo x2 (mul_SNo x3 x4)) (add_SNo x3 x4) :e SNo_sqrtauxset x0 x1 x2)).
admit.
Qed.
Axiom ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
Theorem SNo_sqrtauxset_E : (forall x0 x1 x2 x3, x3 :e SNo_sqrtauxset x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> (forall x6, x6 :e x1 -> SNoLt 0 (add_SNo x5 x6) -> x3 = div_SNo (add_SNo x2 (mul_SNo x5 x6)) (add_SNo x5 x6) -> x4)) -> x4)).
admit.
Qed.
Theorem SNo_sqrtauxset_0 : (forall x0 x1, forall x2 : set -> set -> prop, x2 (SNo_sqrtauxset 0 x0 x1) 0 -> x2 0 (SNo_sqrtauxset 0 x0 x1)).
admit.
Qed.
Theorem SNo_sqrtauxset_0' : (forall x0 x1, forall x2 : set -> set -> prop, x2 (SNo_sqrtauxset x0 0 x1) 0 -> x2 0 (SNo_sqrtauxset x0 0 x1)).
admit.
Qed.
Definition SNo_sqrtaux : set -> (set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set => nat_primrec (lam 2 (fun x2 : set => If_i (x2 = 0) (Repl (SNoL_nonneg x0) x1) (Repl (SNoR x0) x1))) (fun x2 x3 : set => lam 2 (fun x4 : set => If_i (x4 = 0) (binunion (ap x3 0) (SNo_sqrtauxset (ap x3 0) (ap x3 1) x0)) (binunion (binunion (ap x3 1) (SNo_sqrtauxset (ap x3 0) (ap x3 0) x0)) (SNo_sqrtauxset (ap x3 1) (ap x3 1) x0))))).
Theorem SNo_sqrtaux_0 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (SNo_sqrtaux x0 x1 0) (lam 2 (fun x3 : set => If_i (x3 = 0) (Repl (SNoL_nonneg x0) x1) (Repl (SNoR x0) x1))) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) (Repl (SNoL_nonneg x0) x1) (Repl (SNoR x0) x1))) (SNo_sqrtaux x0 x1 0)).
admit.
Qed.
Theorem SNo_sqrtaux_S : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> SNo_sqrtaux x0 x1 (ordsucc x2) = lam 2 (fun x4 : set => If_i (x4 = 0) (binunion (ap (SNo_sqrtaux x0 x1 x2) 0) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)) (binunion (binunion (ap (SNo_sqrtaux x0 x1 x2) 1) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 0) x0)) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 1) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)))).
admit.
Qed.
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom binunion_Subq_1 : (forall x0 x1, x0 c= binunion x0 x1).
Theorem SNo_sqrtaux_mon_lem : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> (forall x3, nat_p x3 -> and (ap (SNo_sqrtaux x0 x1 x2) 0 c= ap (SNo_sqrtaux x0 x1 (add_nat x2 x3)) 0) (ap (SNo_sqrtaux x0 x1 x2) 1 c= ap (SNo_sqrtaux x0 x1 (add_nat x2 x3)) 1))).
admit.
Qed.
Axiom add_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = add_nat x1 x0)).
Theorem SNo_sqrtaux_mon : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> (forall x3, nat_p x3 -> x2 c= x3 -> and (ap (SNo_sqrtaux x0 x1 x2) 0 c= ap (SNo_sqrtaux x0 x1 x3) 0) (ap (SNo_sqrtaux x0 x1 x2) 1 c= ap (SNo_sqrtaux x0 x1 x3) 1))).
admit.
Qed.
Theorem SNo_sqrtaux_ext : (forall x0, SNo x0 -> (forall x1 x2 : set -> set, (forall x3, x3 :e SNoS_ (SNoLev x0) -> x1 x3 = x2 x3) -> (forall x3, nat_p x3 -> SNo_sqrtaux x0 x1 x3 = SNo_sqrtaux x0 x2 x3))).
admit.
Qed.
Definition sqrt_SNo_nonneg : set -> set :=
 SNo_rec_i (fun x0 : set => fun x1 : set -> set => SNoCut (famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 x1 x2) 0)) (famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 x1 x2) 1))).
Theorem sqrt_SNo_nonneg_eq : (forall x0, SNo x0 -> sqrt_SNo_nonneg x0 = SNoCut (famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 0)) (famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 1))).
admit.
Qed.
