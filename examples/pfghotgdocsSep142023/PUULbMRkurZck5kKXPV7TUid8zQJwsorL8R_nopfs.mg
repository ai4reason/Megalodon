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
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Theorem binunionE' : (forall x0 x1 x2, forall x3 : prop, (x2 :e x0 -> x3) -> (x2 :e x1 -> x3) -> x2 :e binunion x0 x1 -> x3).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem ReplE' : (forall x0, forall x1 : set -> set, forall x2 : set -> prop, (forall x3, x3 :e x0 -> x2 (x1 x3)) -> (forall x3, x3 :e Repl x0 x1 -> x2 x3)).
admit.
Qed.
Theorem missingprop_ee14b1c0e2719b296340c9d3805977363a7a308df8391effbcfc733f6128ccee : (forall x0 x1, forall x2 x3 : set -> set, forall x4 : set -> prop, (forall x5, x5 :e x0 -> x4 (x2 x5)) -> (forall x5, x5 :e x1 -> x4 (x3 x5)) -> (forall x5, x5 :e binunion (Repl x0 x2) (Repl x1 x3) -> x4 x5)).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter SNo_extend0 "e94a939c86c866ea378958089db656d350c86095197c9912d4e9d0f1ea317f09" "997d9126455d5de46368f27620eca2e5ad3b0f0ecdffdc7703aa4aafb77eafb6" *)
Parameter SNo_extend0 : set -> set.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_extend0_SNo : (forall x0, SNo x0 -> SNo (SNo_extend0 x0)).
Axiom SNoLtI2 : (forall x0 x1, SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> SNoLt x0 x1).
Axiom SNo_extend0_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend0 x0) = ordsucc (SNoLev x0)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom SNoEq_tra_ : (forall x0 x1 x2 x3, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x3 -> SNoEq_ x0 x1 x3).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom SNoEq_antimon_ : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> (forall x2 x3, SNoEq_ x0 x2 x3 -> SNoEq_ x1 x2 x3))).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom SNoEq_sym_ : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x1).
Axiom SNo_extend0_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend0 x0) x0).
Axiom SNoEq_E2 : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> (forall x3, x3 :e x0 -> x3 :e x2 -> x3 :e x1)).
Axiom binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem missingprop_0f17e90c8c02e3e331fab1a99299a4b7a0c0043a224742c1652724db69a667d7 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x1 :e ordsucc (SNoLev x0) -> SNoLt (SNo_extend0 x0) x1 -> SNoLe x0 x1).
admit.
Qed.
(* Parameter SNo_extend1 "680d7652d15d54f0a766df3f997236fe6ea93db85d1c85bee2fa1d84b02d9c1d" "464e47790f44cd38285279f563a5a918d73224c78a9ef17ae1a46e62a95b2a41" *)
Parameter SNo_extend1 : set -> set.
Axiom SNo_extend1_SNo : (forall x0, SNo x0 -> SNo (SNo_extend1 x0)).
Axiom SNoLtI3 : (forall x0 x1, SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> SNoLt x0 x1).
Axiom SNo_extend1_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend1 x0) = ordsucc (SNoLev x0)).
Axiom SNo_extend1_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend1 x0) x0).
Axiom SNoEq_E1 : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> (forall x3, x3 :e x0 -> x3 :e x1 -> x3 :e x2)).
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Theorem missingprop_6306cb8ff16a2299e00908412fe21d036f69cd3839aa5e4085945887d96046db : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x1 :e ordsucc (SNoLev x0) -> SNoLt x1 (SNo_extend1 x0) -> SNoLe x1 x0).
admit.
Qed.
