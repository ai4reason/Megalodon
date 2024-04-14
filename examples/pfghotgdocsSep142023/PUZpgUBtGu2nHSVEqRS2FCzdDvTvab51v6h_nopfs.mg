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
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNo_max_ordinal : (forall x0, SNo x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLt x1 x0) -> ordinal x0).
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom mul_SNo_SNoR_interpolate_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoR (mul_SNo x0 x1) -> (forall x3 : prop, (forall x4, x4 :e SNoL x0 -> (forall x5, x5 :e SNoR x1 -> SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) (add_SNo x2 (mul_SNo x4 x5)) -> x3)) -> (forall x4, x4 :e SNoR x0 -> (forall x5, x5 :e SNoL x1 -> SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) (add_SNo x2 (mul_SNo x4 x5)) -> x3)) -> x3))).
Axiom SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom ordinal_SNoLev_max : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e x0 -> SNoLt x1 x0)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom ordinal_SNo : (forall x0, ordinal x0 -> SNo x0).
Theorem mul_SNo_ordinal_ordinal : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> ordinal (mul_SNo x0 x1))).
admit.
Qed.
Axiom ordinal_SNoLt_In : (forall x0 x1, ordinal x0 -> ordinal x1 -> SNoLt x0 x1 -> x0 :e x1).
Axiom add_SNo_ordinal_ordinal : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> ordinal (add_SNo x0 x1))).
Axiom mul_SNo_Lt : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x2 x0 -> SNoLt x3 x1 -> SNoLt (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Theorem missingprop_5fd4344b65027685a6793d5a5886d77192b6f1982337a12c79627f59819f9e3b : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3) :e add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))))).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Theorem missingprop_21fcbb02f8b347d28567534e691cc39dcd7545295c025757bc8e2c9893ad0787 : (forall x0, SNo x0 -> SNoCutP (SNoL x0) (Sing x0)).
admit.
Qed.
(* Parameter SNo_extend0 "e94a939c86c866ea378958089db656d350c86095197c9912d4e9d0f1ea317f09" "997d9126455d5de46368f27620eca2e5ad3b0f0ecdffdc7703aa4aafb77eafb6" *)
Parameter SNo_extend0 : set -> set.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
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
Axiom SNo_extend0_SNo : (forall x0, SNo x0 -> SNo (SNo_extend0 x0)).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom SNoLtI2 : (forall x0 x1, SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> SNoLt x0 x1).
Axiom SNo_extend0_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend0 x0) = ordsucc (SNoLev x0)).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom SNoEq_tra_ : (forall x0 x1 x2 x3, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x3 -> SNoEq_ x0 x1 x3).
Axiom SNoEq_antimon_ : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> (forall x2 x3, SNoEq_ x0 x2 x3 -> SNoEq_ x1 x2 x3))).
Axiom SNoEq_sym_ : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x1).
Axiom SNo_extend0_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend0 x0) x0).
Axiom SNoEq_E2 : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> (forall x3, x3 :e x0 -> x3 :e x2 -> x3 :e x1)).
Axiom binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom SNo_extend0_Lt : (forall x0, SNo x0 -> SNoLt (SNo_extend0 x0) x0).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Theorem missingprop_9a1b92eef2a673441c86495661952352e87fcc58a832c95feffa7633d75c5353 : (forall x0, SNo x0 -> SNo_extend0 x0 = SNoCut (SNoL x0) (Sing x0)).
admit.
Qed.
Theorem missingprop_d513e1fa055b07c519f2449ae6db6528e4c0b356ddbfd75ad29f8540a234c901 : (forall x0, SNo x0 -> SNoCutP (Sing x0) (SNoR x0)).
admit.
Qed.
(* Parameter SNo_extend1 "680d7652d15d54f0a766df3f997236fe6ea93db85d1c85bee2fa1d84b02d9c1d" "464e47790f44cd38285279f563a5a918d73224c78a9ef17ae1a46e62a95b2a41" *)
Parameter SNo_extend1 : set -> set.
Axiom SNo_extend1_SNo : (forall x0, SNo x0 -> SNo (SNo_extend1 x0)).
Axiom SNo_extend1_Gt : (forall x0, SNo x0 -> SNoLt x0 (SNo_extend1 x0)).
Axiom SNoLtI3 : (forall x0 x1, SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> SNoLt x0 x1).
Axiom SNo_extend1_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend1 x0) = ordsucc (SNoLev x0)).
Axiom SNo_extend1_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend1 x0) x0).
Axiom SNoEq_E1 : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> (forall x3, x3 :e x0 -> x3 :e x1 -> x3 :e x2)).
Theorem missingprop_e96c319dd06be3cb046d58355b9af86cc61a52e154bc465e9a8f4506b5d07969 : (forall x0, SNo x0 -> SNo_extend1 x0 = SNoCut (Sing x0) (SNoR x0)).
admit.
Qed.
