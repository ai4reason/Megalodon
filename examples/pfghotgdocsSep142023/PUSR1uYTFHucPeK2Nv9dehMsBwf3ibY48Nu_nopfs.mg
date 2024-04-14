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
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom add_SNo_minus_R2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 x1) (minus_SNo x1) = x0).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem add_SNo_Le1_cancel : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1) -> SNoLe x0 x2).
admit.
Qed.
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = Empty).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 Empty = x0).
Theorem add_SNo_minus_Le1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 (add_SNo x2 x1) -> SNoLe (add_SNo x0 (minus_SNo x1)) x2).
admit.
Qed.
Theorem add_SNo_minus_Le1b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe (add_SNo x0 x1) (add_SNo x3 x2) -> SNoLe (add_SNo x0 (add_SNo x1 (minus_SNo x2))) x3).
admit.
Qed.
Axiom SNo_add_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (add_SNo x0 (add_SNo x1 x2))).
Axiom add_SNo_com_3b_1_2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo (add_SNo x0 x1) x2 = add_SNo (add_SNo x0 x2) x1).
Axiom add_SNo_minus_Le2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (add_SNo x2 x1) x0 -> SNoLe x2 (add_SNo x0 (minus_SNo x1))).
Theorem add_SNo_minus_Le12b3 : (forall x0 x1 x2 x3 x4 x5, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNoLe (add_SNo x0 (add_SNo x1 x5)) (add_SNo x3 (add_SNo x4 x2)) -> SNoLe (add_SNo x0 (add_SNo x1 (minus_SNo x2))) (add_SNo x3 (add_SNo x4 (minus_SNo x5)))).
admit.
Qed.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom add_SNo_minus_Lt1b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x0 x1) (add_SNo x3 x2) -> SNoLt (add_SNo x0 (add_SNo x1 (minus_SNo x2))) x3).
Axiom add_SNo_minus_Lt2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x2 x1) x0 -> SNoLt x2 (add_SNo x0 (minus_SNo x1))).
Theorem add_SNo_minus_Lt12b3 : (forall x0 x1 x2 x3 x4 x5, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNoLt (add_SNo x0 (add_SNo x1 x5)) (add_SNo x3 (add_SNo x4 x2)) -> SNoLt (add_SNo x0 (add_SNo x1 (minus_SNo x2))) (add_SNo x3 (add_SNo x4 (minus_SNo x5)))).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom mul_SNo_eq_3 : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (forall x3 x4, SNoCutP x3 x4 -> (forall x5, x5 :e x3 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e x4 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> mul_SNo x0 x1 = SNoCut x3 x4 -> x2) -> x2)).
Axiom SNoCut_ext : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x1 -> SNoLt (SNoCut x2 x3) x4) -> (forall x4, x4 :e x2 -> SNoLt x4 (SNoCut x0 x1)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoCut x0 x1 = SNoCut x2 x3).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom mul_SNo_Le : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x2 x0 -> SNoLe x3 x1 -> SNoLe (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom add_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x1 (add_SNo x0 x2)).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom add_SNo_rotate_3_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x2 (add_SNo x0 x1)).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom binunionE' : (forall x0 x1 x2, forall x3 : prop, (x2 :e x0 -> x3) -> (x2 :e x1 -> x3) -> x2 :e binunion x0 x1 -> x3).
Axiom mul_SNo_Lt : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x2 x0 -> SNoLt x3 x1 -> SNoLt (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
Axiom add_SNo_minus_Lt2b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x3 x2) (add_SNo x0 x1) -> SNoLt x3 (add_SNo x0 (add_SNo x1 (minus_SNo x2)))).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Theorem mul_SNoCutP_lem : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> and (and (SNoCutP (binunion {add_SNo (mul_SNo (ap x6 0) x5) (add_SNo (mul_SNo x4 (ap x6 1)) (minus_SNo (mul_SNo (ap x6 0) (ap x6 1)))) | x6 :e setprod x0 x2} {add_SNo (mul_SNo (ap x6 0) x5) (add_SNo (mul_SNo x4 (ap x6 1)) (minus_SNo (mul_SNo (ap x6 0) (ap x6 1)))) | x6 :e setprod x1 x3}) (binunion {add_SNo (mul_SNo (ap x6 0) x5) (add_SNo (mul_SNo x4 (ap x6 1)) (minus_SNo (mul_SNo (ap x6 0) (ap x6 1)))) | x6 :e setprod x0 x3} {add_SNo (mul_SNo (ap x6 0) x5) (add_SNo (mul_SNo x4 (ap x6 1)) (minus_SNo (mul_SNo (ap x6 0) (ap x6 1)))) | x6 :e setprod x1 x2})) (mul_SNo x4 x5 = SNoCut (binunion {add_SNo (mul_SNo (ap x7 0) x5) (add_SNo (mul_SNo x4 (ap x7 1)) (minus_SNo (mul_SNo (ap x7 0) (ap x7 1)))) | x7 :e setprod x0 x2} {add_SNo (mul_SNo (ap x7 0) x5) (add_SNo (mul_SNo x4 (ap x7 1)) (minus_SNo (mul_SNo (ap x7 0) (ap x7 1)))) | x7 :e setprod x1 x3}) (binunion {add_SNo (mul_SNo (ap x7 0) x5) (add_SNo (mul_SNo x4 (ap x7 1)) (minus_SNo (mul_SNo (ap x7 0) (ap x7 1)))) | x7 :e setprod x0 x3} {add_SNo (mul_SNo (ap x7 0) x5) (add_SNo (mul_SNo x4 (ap x7 1)) (minus_SNo (mul_SNo (ap x7 0) (ap x7 1)))) | x7 :e setprod x1 x2}))) (forall x6 : prop, (forall x7 x8 x9 x10, (forall x11, x11 :e x7 -> (forall x12 : prop, (forall x13, x13 :e x0 -> (forall x14, x14 :e x2 -> SNo x13 -> SNo x14 -> SNoLt x13 x4 -> SNoLt x14 x5 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x0 -> (forall x12, x12 :e x2 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x7)) -> (forall x11, x11 :e x8 -> (forall x12 : prop, (forall x13, x13 :e x1 -> (forall x14, x14 :e x3 -> SNo x13 -> SNo x14 -> SNoLt x4 x13 -> SNoLt x5 x14 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x1 -> (forall x12, x12 :e x3 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x8)) -> (forall x11, x11 :e x9 -> (forall x12 : prop, (forall x13, x13 :e x0 -> (forall x14, x14 :e x3 -> SNo x13 -> SNo x14 -> SNoLt x13 x4 -> SNoLt x5 x14 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x0 -> (forall x12, x12 :e x3 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x9)) -> (forall x11, x11 :e x10 -> (forall x12 : prop, (forall x13, x13 :e x1 -> (forall x14, x14 :e x2 -> SNo x13 -> SNo x14 -> SNoLt x4 x13 -> SNoLt x14 x5 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x1 -> (forall x12, x12 :e x2 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x10)) -> SNoCutP (binunion x7 x8) (binunion x9 x10) -> mul_SNo x4 x5 = SNoCut (binunion x7 x8) (binunion x9 x10) -> x6) -> x6)).
admit.
Qed.
Theorem mul_SNoCutP_gen : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> SNoCutP (binunion {add_SNo (mul_SNo (ap x6 0) x5) (add_SNo (mul_SNo x4 (ap x6 1)) (minus_SNo (mul_SNo (ap x6 0) (ap x6 1)))) | x6 :e setprod x0 x2} {add_SNo (mul_SNo (ap x6 0) x5) (add_SNo (mul_SNo x4 (ap x6 1)) (minus_SNo (mul_SNo (ap x6 0) (ap x6 1)))) | x6 :e setprod x1 x3}) (binunion {add_SNo (mul_SNo (ap x6 0) x5) (add_SNo (mul_SNo x4 (ap x6 1)) (minus_SNo (mul_SNo (ap x6 0) (ap x6 1)))) | x6 :e setprod x0 x3} {add_SNo (mul_SNo (ap x6 0) x5) (add_SNo (mul_SNo x4 (ap x6 1)) (minus_SNo (mul_SNo (ap x6 0) (ap x6 1)))) | x6 :e setprod x1 x2})).
admit.
Qed.
Theorem mul_SNoCut_eq : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> mul_SNo x4 x5 = SNoCut (binunion {add_SNo (mul_SNo (ap x7 0) x5) (add_SNo (mul_SNo x4 (ap x7 1)) (minus_SNo (mul_SNo (ap x7 0) (ap x7 1)))) | x7 :e setprod x0 x2} {add_SNo (mul_SNo (ap x7 0) x5) (add_SNo (mul_SNo x4 (ap x7 1)) (minus_SNo (mul_SNo (ap x7 0) (ap x7 1)))) | x7 :e setprod x1 x3}) (binunion {add_SNo (mul_SNo (ap x7 0) x5) (add_SNo (mul_SNo x4 (ap x7 1)) (minus_SNo (mul_SNo (ap x7 0) (ap x7 1)))) | x7 :e setprod x0 x3} {add_SNo (mul_SNo (ap x7 0) x5) (add_SNo (mul_SNo x4 (ap x7 1)) (minus_SNo (mul_SNo (ap x7 0) (ap x7 1)))) | x7 :e setprod x1 x2})).
admit.
Qed.
Theorem mul_SNoCut_abs : (forall x0 x1 x2 x3 x4 x5, SNoCutP x0 x1 -> SNoCutP x2 x3 -> x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> (forall x6 : prop, (forall x7 x8 x9 x10, (forall x11, x11 :e x7 -> (forall x12 : prop, (forall x13, x13 :e x0 -> (forall x14, x14 :e x2 -> SNo x13 -> SNo x14 -> SNoLt x13 x4 -> SNoLt x14 x5 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x0 -> (forall x12, x12 :e x2 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x7)) -> (forall x11, x11 :e x8 -> (forall x12 : prop, (forall x13, x13 :e x1 -> (forall x14, x14 :e x3 -> SNo x13 -> SNo x14 -> SNoLt x4 x13 -> SNoLt x5 x14 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x1 -> (forall x12, x12 :e x3 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x8)) -> (forall x11, x11 :e x9 -> (forall x12 : prop, (forall x13, x13 :e x0 -> (forall x14, x14 :e x3 -> SNo x13 -> SNo x14 -> SNoLt x13 x4 -> SNoLt x5 x14 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x0 -> (forall x12, x12 :e x3 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x9)) -> (forall x11, x11 :e x10 -> (forall x12 : prop, (forall x13, x13 :e x1 -> (forall x14, x14 :e x2 -> SNo x13 -> SNo x14 -> SNoLt x4 x13 -> SNoLt x14 x5 -> x11 = add_SNo (mul_SNo x13 x5) (add_SNo (mul_SNo x4 x14) (minus_SNo (mul_SNo x13 x14))) -> x12)) -> x12)) -> (forall x11, x11 :e x1 -> (forall x12, x12 :e x2 -> add_SNo (mul_SNo x11 x5) (add_SNo (mul_SNo x4 x12) (minus_SNo (mul_SNo x11 x12))) :e x10)) -> SNoCutP (binunion x7 x8) (binunion x9 x10) -> mul_SNo x4 x5 = SNoCut (binunion x7 x8) (binunion x9 x10) -> x6) -> x6)).
admit.
Qed.
