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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom In_0_1 : 0 :e 1.
Theorem not_TransSet_Sing1 : not (TransSet (Sing 1)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Theorem not_ordinal_Sing1 : not (ordinal (Sing 1)).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Theorem tagged_not_ordinal : (forall x0, not (ordinal (SetAdjoin x0 (Sing 1)))).
admit.
Qed.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Theorem tagged_notin_ordinal : (forall x0 x1, ordinal x0 -> nIn (SetAdjoin x1 (Sing 1)) x0).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Theorem tagged_eqE_Subq : (forall x0 x1, ordinal x0 -> SetAdjoin x0 (Sing 1) = SetAdjoin x1 (Sing 1) -> x0 c= x1).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem tagged_eqE_eq : (forall x0 x1, ordinal x0 -> ordinal x1 -> SetAdjoin x0 (Sing 1) = SetAdjoin x1 (Sing 1) -> x0 = x1).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem tagged_ReplE : (forall x0 x1, ordinal x0 -> ordinal x1 -> SetAdjoin x1 (Sing 1) :e {SetAdjoin x2 (Sing 1) | x2 :e x0} -> x1 :e x0).
admit.
Qed.
Theorem ordinal_notin_tagged_Repl : (forall x0 x1, ordinal x0 -> nIn x0 {SetAdjoin x2 (Sing 1) | x2 :e x1}).
admit.
Qed.
Definition SNoElts_ : set -> set :=
 (fun x0 : set => binunion x0 {SetAdjoin x1 (Sing 1) | x1 :e x0}).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem SNoElts_mon : (forall x0 x1, x0 c= x1 -> SNoElts_ x0 c= SNoElts_ x1).
admit.
Qed.
(* Parameter exactly1of2 "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" "163602f90de012a7426ee39176523ca58bc964ccde619b652cb448bd678f7e21" *)
Parameter exactly1of2 : prop -> prop -> prop.
Definition SNo_ : set -> set -> prop :=
 (fun x0 x1 : set => and (x1 c= SNoElts_ x0) (forall x2, x2 :e x0 -> exactly1of2 (SetAdjoin x2 (Sing 1) :e x1) (x2 :e x1))).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set -> (set -> prop) -> (set -> set) -> set.
Definition PSNo : set -> (set -> prop) -> set :=
 (fun x0 : set => fun x1 : set -> prop => binunion (Sep x0 x1) (ReplSep x0 (fun x2 : set => not (x1 x2)) (fun x2 : set => SetAdjoin x2 (Sing 1)))).
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Definition PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Theorem PNoEq_PSNo : (forall x0, ordinal x0 -> (forall x1 : set -> prop, PNoEq_ x0 (fun x2 : set => x2 :e PSNo x0 x1) x1)).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom exactly1of2_I2 : (forall x0 x1 : prop, not x0 -> x1 -> exactly1of2 x0 x1).
Axiom exactly1of2_I1 : (forall x0 x1 : prop, x0 -> not x1 -> exactly1of2 x0 x1).
Axiom ReplSepI : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e x0 -> x1 x3 -> x2 x3 :e ReplSep x0 x1 x2).
Theorem SNo_PSNo : (forall x0, ordinal x0 -> (forall x1 : set -> prop, SNo_ x0 (PSNo x0 x1))).
admit.
Qed.
Axiom exactly1of2_E : (forall x0 x1 : prop, exactly1of2 x0 x1 -> (forall x2 : prop, (x0 -> not x1 -> x2) -> (not x0 -> x1 -> x2) -> x2)).
Theorem SNo_PSNo_eta_ : (forall x0 x1, ordinal x0 -> SNo_ x0 x1 -> x1 = PSNo x0 (fun x3 : set => x3 :e x1)).
admit.
Qed.
Definition SNo : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (ordinal x2) (SNo_ x2 x0) -> x1) -> x1).
Theorem SNo_SNo : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNo x1)).
admit.
Qed.
Definition SNoLev : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (ordinal x1) (SNo_ x1 x0))).
Axiom exactly1of2_or : (forall x0 x1 : prop, exactly1of2 x0 x1 -> or x0 x1).
Theorem SNoLev_uniq_Subq : (forall x0 x1 x2, ordinal x1 -> ordinal x2 -> SNo_ x1 x0 -> SNo_ x2 x0 -> x1 c= x2).
admit.
Qed.
Theorem SNoLev_uniq : (forall x0 x1 x2, ordinal x1 -> ordinal x2 -> SNo_ x1 x0 -> SNo_ x2 x0 -> x1 = x2).
admit.
Qed.
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem SNoLev_prop : (forall x0, SNo x0 -> and (ordinal (SNoLev x0)) (SNo_ (SNoLev x0) x0)).
admit.
Qed.
Theorem SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
admit.
Qed.
Theorem SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
admit.
Qed.
Theorem SNo_PSNo_eta : (forall x0, SNo x0 -> x0 = PSNo (SNoLev x0) (fun x2 : set => x2 :e x0)).
admit.
Qed.
Theorem SNoLev_PSNo : (forall x0, ordinal x0 -> (forall x1 : set -> prop, forall x2 : set -> set -> prop, x2 (SNoLev (PSNo x0 x1)) x0 -> x2 x0 (SNoLev (PSNo x0 x1)))).
admit.
Qed.
Theorem SNo_Subq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 c= SNoLev x1 -> (forall x2, x2 :e SNoLev x0 -> iff (x2 :e x0) (x2 :e x1)) -> x0 c= x1).
admit.
Qed.
Definition SNoEq_ : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => PNoEq_ x0 (fun x3 : set => x3 :e x1) (fun x3 : set => x3 :e x2)).
Theorem SNoEq_I : (forall x0 x1 x2, (forall x3, x3 :e x0 -> iff (x3 :e x1) (x3 :e x2)) -> SNoEq_ x0 x1 x2).
admit.
Qed.
Theorem SNoEq_E : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> (forall x3, x3 :e x0 -> iff (x3 :e x1) (x3 :e x2))).
admit.
Qed.
Theorem SNoEq_E1 : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> (forall x3, x3 :e x0 -> x3 :e x1 -> x3 :e x2)).
admit.
Qed.
Theorem SNoEq_E2 : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> (forall x3, x3 :e x0 -> x3 :e x2 -> x3 :e x1)).
admit.
Qed.
Axiom PNoEq_antimon_ : (forall x0 x1 : set -> prop, forall x2, ordinal x2 -> (forall x3, x3 :e x2 -> PNoEq_ x2 x0 x1 -> PNoEq_ x3 x0 x1)).
Theorem SNoEq_antimon_ : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> (forall x2 x3, SNoEq_ x0 x2 x3 -> SNoEq_ x1 x2 x3))).
admit.
Qed.
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom iff_sym : (forall x0 x1 : prop, iff x0 x1 -> iff x1 x0).
Theorem SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
admit.
Qed.
(* Parameter PNoLt "2336eb45d48549dd8a6a128edc17a8761fd9043c180691483bcf16e1acc9f00a" "8f57a05ce4764eff8bc94b278352b6755f1a46566cd7220a5488a4a595a47189" *)
Parameter PNoLt : set -> (set -> prop) -> set -> (set -> prop) -> prop.
Definition SNoLt : set -> set -> prop :=
 (fun x0 x1 : set => PNoLt (SNoLev x0) (fun x2 : set => x2 :e x0) (SNoLev x1) (fun x2 : set => x2 :e x1)).
Definition PNoLe : set -> (set -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => fun x3 : set -> prop => or (PNoLt x0 x1 x2 x3) (and (x0 = x2) (PNoEq_ x0 x1 x3))).
Definition SNoLe : set -> set -> prop :=
 (fun x0 x1 : set => PNoLe (SNoLev x0) (fun x2 : set => x2 :e x0) (SNoLev x1) (fun x2 : set => x2 :e x1)).
Axiom PNoLeI1 : (forall x0 x1, forall x2 x3 : set -> prop, PNoLt x0 x2 x1 x3 -> PNoLe x0 x2 x1 x3).
Theorem SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
admit.
Qed.
Axiom PNoEq_ref_ : (forall x0, forall x1 : set -> prop, PNoEq_ x0 x1 x1).
Theorem SNoEq_ref_ : (forall x0 x1, SNoEq_ x0 x1 x1).
admit.
Qed.
Axiom PNoEq_sym_ : (forall x0, forall x1 x2 : set -> prop, PNoEq_ x0 x1 x2 -> PNoEq_ x0 x2 x1).
Theorem SNoEq_sym_ : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x1).
admit.
Qed.
Axiom PNoEq_tra_ : (forall x0, forall x1 x2 x3 : set -> prop, PNoEq_ x0 x1 x2 -> PNoEq_ x0 x2 x3 -> PNoEq_ x0 x1 x3).
Theorem SNoEq_tra_ : (forall x0 x1 x2 x3, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x3 -> SNoEq_ x0 x1 x3).
admit.
Qed.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Definition PNoLt_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3 : prop, (forall x4, and (x4 :e x0) (and (and (PNoEq_ x4 x1 x2) (not (x1 x4))) (x2 x4)) -> x3) -> x3).
Axiom PNoLtE : (forall x0 x1, forall x2 x3 : set -> prop, PNoLt x0 x2 x1 x3 -> (forall x4 : prop, (PNoLt_ (binintersect x0 x1) x2 x3 -> x4) -> (x0 :e x1 -> PNoEq_ x0 x2 x3 -> x3 x0 -> x4) -> (x1 :e x0 -> PNoEq_ x1 x2 x3 -> not (x2 x1) -> x4) -> x4)).
Axiom PNoLt_E_ : (forall x0, forall x1 x2 : set -> prop, PNoLt_ x0 x1 x2 -> (forall x3 : prop, (forall x4, x4 :e x0 -> PNoEq_ x4 x1 x2 -> not (x1 x4) -> x2 x4 -> x3) -> x3)).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom PNoLtI3 : (forall x0 x1, forall x2 x3 : set -> prop, x1 :e x0 -> PNoEq_ x1 x2 x3 -> not (x2 x1) -> PNoLt x0 x2 x1 x3).
Axiom PNoLtI2 : (forall x0 x1, forall x2 x3 : set -> prop, x0 :e x1 -> PNoEq_ x0 x2 x3 -> x3 x0 -> PNoLt x0 x2 x1 x3).
Theorem SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
admit.
Qed.
Theorem SNoLtI2 : (forall x0 x1, SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> SNoLt x0 x1).
admit.
Qed.
Theorem SNoLtI3 : (forall x0 x1, SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> SNoLt x0 x1).
admit.
Qed.
Axiom PNoLt_irref : (forall x0, forall x1 : set -> prop, not (PNoLt x0 x1 x0 x1)).
Theorem SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
admit.
Qed.
Axiom PNoLt_trichotomy_or : (forall x0 x1, forall x2 x3 : set -> prop, ordinal x0 -> ordinal x1 -> or (or (PNoLt x0 x2 x1 x3) (and (x0 = x1) (PNoEq_ x0 x2 x3))) (PNoLt x1 x3 x0 x2)).
Axiom or3I1 : (forall x0 x1 x2 : prop, x0 -> or (or x0 x1) x2).
Axiom or3I2 : (forall x0 x1 x2 : prop, x1 -> or (or x0 x1) x2).
Axiom or3I3 : (forall x0 x1 x2 : prop, x2 -> or (or x0 x1) x2).
Theorem SNoLt_trichotomy_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (or (SNoLt x0 x1) (x0 = x1)) (SNoLt x1 x0)).
admit.
Qed.
Axiom PNoLt_tra : (forall x0 x1 x2, ordinal x0 -> ordinal x1 -> ordinal x2 -> (forall x3 x4 x5 : set -> prop, PNoLt x0 x3 x1 x4 -> PNoLt x1 x4 x2 x5 -> PNoLt x0 x3 x2 x5)).
Theorem SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
admit.
Qed.
Axiom PNoLe_ref : (forall x0, forall x1 : set -> prop, PNoLe x0 x1 x0 x1).
Theorem SNoLe_ref : (forall x0, SNoLe x0 x0).
admit.
Qed.
Axiom PNoLe_antisym : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 x3 : set -> prop, PNoLe x0 x2 x1 x3 -> PNoLe x1 x3 x0 x2 -> and (x0 = x1) (PNoEq_ x0 x2 x3))).
Theorem SNoLe_antisym : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe x1 x0 -> x0 = x1).
admit.
Qed.
Axiom PNoLtLe_tra : (forall x0 x1 x2, ordinal x0 -> ordinal x1 -> ordinal x2 -> (forall x3 x4 x5 : set -> prop, PNoLt x0 x3 x1 x4 -> PNoLe x1 x4 x2 x5 -> PNoLt x0 x3 x2 x5)).
Theorem SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
admit.
Qed.
Axiom PNoLeLt_tra : (forall x0 x1 x2, ordinal x0 -> ordinal x1 -> ordinal x2 -> (forall x3 x4 x5 : set -> prop, PNoLe x0 x3 x1 x4 -> PNoLt x1 x4 x2 x5 -> PNoLt x0 x3 x2 x5)).
Theorem SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
admit.
Qed.
Axiom PNoLe_tra : (forall x0 x1 x2, ordinal x0 -> ordinal x1 -> ordinal x2 -> (forall x3 x4 x5 : set -> prop, PNoLe x0 x3 x1 x4 -> PNoLe x1 x4 x2 x5 -> PNoLe x0 x3 x2 x5)).
Theorem SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
admit.
Qed.
Theorem SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
admit.
Qed.
Axiom PNoEqLt_tra : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 x3 x4 : set -> prop, PNoEq_ x0 x2 x3 -> PNoLt x0 x3 x1 x4 -> PNoLt x0 x2 x1 x4)).
Axiom PNoLtEq_tra : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 x3 x4 : set -> prop, PNoLt x0 x2 x1 x3 -> PNoEq_ x1 x3 x4 -> PNoLt x0 x2 x1 x4)).
Theorem SNoLt_PSNo_PNoLt : (forall x0 x1, forall x2 x3 : set -> prop, ordinal x0 -> ordinal x1 -> SNoLt (PSNo x0 x2) (PSNo x1 x3) -> PNoLt x0 x2 x1 x3).
admit.
Qed.
Theorem PNoLt_SNoLt_PSNo : (forall x0 x1, forall x2 x3 : set -> prop, ordinal x0 -> ordinal x1 -> PNoLt x0 x2 x1 x3 -> SNoLt (PSNo x0 x2) (PSNo x1 x3)).
admit.
Qed.
(* Parameter PNo_bd "1b39e85278dd9e820e7b6258957386ac55934d784aa3702c57a28ec807453b01" "ed76e76de9b58e621daa601cca73b4159a437ba0e73114924cb92ec8044f2aa2" *)
Parameter PNo_bd : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set.
(* Parameter PNo_pred "be07c39b18a3aa93f066f4c064fee3941ec27cfd07a4728b6209135c77ce5704" "b2d51dcfccb9527e9551b0d0c47d891c9031a1d4ee87bba5a9ae5215025d107a" *)
Parameter PNo_pred : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> prop.
Definition SNoCut : set -> set -> set :=
 (fun x0 x1 : set => PSNo (PNo_bd (fun x2 : set => fun x3 : set -> prop => and (ordinal x2) (PSNo x2 x3 :e x0)) (fun x2 : set => fun x3 : set -> prop => and (ordinal x2) (PSNo x2 x3 :e x1))) (PNo_pred (fun x2 : set => fun x3 : set -> prop => and (ordinal x2) (PSNo x2 x3 :e x0)) (fun x2 : set => fun x3 : set -> prop => and (ordinal x2) (PSNo x2 x3 :e x1)))).
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Definition PNoLt_pwise : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => forall x2, ordinal x2 -> (forall x3 : set -> prop, x0 x2 x3 -> (forall x4, ordinal x4 -> (forall x5 : set -> prop, x1 x4 x5 -> PNoLt x2 x3 x4 x5)))).
Definition PNo_lenbdd : set -> (set -> (set -> prop) -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> prop) -> prop => forall x2, forall x3 : set -> prop, x1 x2 x3 -> x2 :e x0).
Definition PNo_strict_upperbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> prop) -> prop => fun x1 : set => fun x2 : set -> prop => forall x3, ordinal x3 -> (forall x4 : set -> prop, x0 x3 x4 -> PNoLt x3 x4 x1 x2)).
Definition PNo_strict_lowerbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> prop) -> prop => fun x1 : set => fun x2 : set -> prop => forall x3, ordinal x3 -> (forall x4 : set -> prop, x0 x3 x4 -> PNoLt x1 x2 x3 x4)).
Definition PNo_strict_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => fun x2 : set => fun x3 : set -> prop => and (PNo_strict_upperbd x0 x2 x3) (PNo_strict_lowerbd x1 x2 x3)).
Definition PNo_least_rep : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => fun x2 : set => fun x3 : set -> prop => and (and (ordinal x2) (PNo_strict_imv x0 x1 x2 x3)) (forall x4, x4 :e x2 -> (forall x5 : set -> prop, not (PNo_strict_imv x0 x1 x4 x5)))).
Axiom PNo_bd_pred : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> PNo_least_rep x0 x1 (PNo_bd x0 x1) (PNo_pred x0 x1))).
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Axiom PNoLt_trichotomy_or_ : (forall x0 x1 : set -> prop, forall x2, ordinal x2 -> or (or (PNoLt_ x2 x0 x1) (PNoEq_ x2 x0 x1)) (PNoLt_ x2 x1 x0)).
(* Parameter PNo_rel_strict_imv "59afcfba9fdd03aeaf46e2c6e78357750119f49ceee909d654321be1842de7c6" "64ce9962d0a17b3b694666ef1fda22a8c5635c61382ad7ae5a322890710bc5f8" *)
Parameter PNo_rel_strict_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop.
Definition PNo_rel_strict_split_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => fun x2 : set => fun x3 : set -> prop => and (PNo_rel_strict_imv x0 x1 (ordsucc x2) (fun x4 : set => and (x3 x4) (x4 = x2 -> (forall x5 : prop, x5)))) (PNo_rel_strict_imv x0 x1 (ordsucc x2) (fun x4 : set => or (x3 x4) (x4 = x2)))).
Axiom PNo_rel_split_imv_imp_strict_imv : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> (forall x3 : set -> prop, PNo_rel_strict_split_imv x0 x1 x2 x3 -> PNo_strict_imv x0 x1 x2 x3)).
Axiom PNoEq_rel_strict_imv : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> (forall x3 x4 : set -> prop, PNoEq_ x2 x3 x4 -> PNo_rel_strict_imv x0 x1 x2 x3 -> PNo_rel_strict_imv x0 x1 x2 x4)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom iff_trans : (forall x0 x1 x2 : prop, iff x0 x1 -> iff x1 x2 -> iff x0 x2).
Axiom PNo_extend0_eq : (forall x0, forall x1 : set -> prop, PNoEq_ x0 x1 (fun x2 : set => and (x1 x2) (x2 = x0 -> (forall x3 : prop, x3)))).
Axiom PNo_strict_imv_imp_rel_strict_imv : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> (forall x3, x3 :e ordsucc x2 -> (forall x4 : set -> prop, PNo_strict_imv x0 x1 x2 x4 -> PNo_rel_strict_imv x0 x1 x3 x4))).
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom PNo_extend1_eq : (forall x0, forall x1 : set -> prop, PNoEq_ x0 x1 (fun x2 : set => or (x1 x2) (x2 = x0))).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom PNo_bd_In : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> PNo_bd x0 x1 :e ordsucc x2)).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom ordinal_linear : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 c= x1) (x1 c= x0)).
Axiom Subq_binunion_eq : (forall x0 x1, forall x2 : prop -> prop -> prop, x2 (x0 c= x1) (binunion x0 x1 = x1) -> x2 (binunion x0 x1 = x1) (x0 c= x1)).
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Axiom ordinal_famunion : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> ordinal (x1 x2)) -> ordinal (famunion x0 x1)).
Theorem SNoCutP_SNoCut : (forall x0 x1, SNoCutP x0 x1 -> and (and (and (and (SNo (SNoCut x0 x1)) (SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x2 : set => ordsucc (SNoLev x2))) (famunion x1 (fun x2 : set => ordsucc (SNoLev x2)))))) (forall x2, x2 :e x0 -> SNoLt x2 (SNoCut x0 x1))) (forall x2, x2 :e x1 -> SNoLt (SNoCut x0 x1) x2)) (forall x2, SNo x2 -> (forall x3, x3 :e x0 -> SNoLt x3 x2) -> (forall x3, x3 :e x1 -> SNoLt x2 x3) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x2) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x2))).
admit.
Qed.
Definition SNoS_ : set -> set :=
 (fun x0 : set => Sep (Power (SNoElts_ x0)) (fun x1 : set => forall x2 : prop, (forall x3, and (x3 :e x0) (SNo_ x3 x1) -> x2) -> x2)).
Theorem SNoS_E : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (forall x3, and (x3 :e x0) (SNo_ x3 x1) -> x2) -> x2))).
admit.
Qed.
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Theorem SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
admit.
Qed.
Theorem SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
admit.
Qed.
Theorem SNoS_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoS_ x0 c= SNoS_ x1).
admit.
Qed.
Theorem SNoLev_uniq2 : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNoLev x1 = x0)).
admit.
Qed.
Theorem SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
admit.
Qed.
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem SNoS_In_neq : (forall x0, SNo x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> x1 = x0 -> (forall x2 : prop, x2))).
admit.
Qed.
Theorem SNoS_SNoLev : (forall x0, SNo x0 -> x0 :e SNoS_ (ordsucc (SNoLev x0))).
admit.
Qed.
Definition SNoL : set -> set :=
 (fun x0 : set => Sep (SNoS_ (SNoLev x0)) (fun x1 : set => SNoLt x1 x0)).
Definition SNoR : set -> set :=
 (fun x0 : set => Sep (SNoS_ (SNoLev x0)) (SNoLt x0)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Theorem SNoCutP_SNoL_SNoR : (forall x0, SNo x0 -> SNoCutP (SNoL x0) (SNoR x0)).
admit.
Qed.
Theorem SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
admit.
Qed.
Theorem SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
admit.
Qed.
Theorem SNoL_SNoS : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> x1 :e SNoS_ (SNoLev x0))).
admit.
Qed.
Theorem SNoR_SNoS : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> x1 :e SNoS_ (SNoLev x0))).
admit.
Qed.
Theorem SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
admit.
Qed.
Theorem SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
admit.
Qed.
Axiom ordinal_trichotomy_or : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (or (x0 :e x1) (x0 = x1)) (x1 :e x0)).
Theorem SNo_eta : (forall x0, SNo x0 -> x0 = SNoCut (SNoL x0) (SNoR x0)).
admit.
Qed.
Theorem SNoCutP_SNo_SNoCut : (forall x0 x1, SNoCutP x0 x1 -> SNo (SNoCut x0 x1)).
admit.
Qed.
Theorem SNoCutP_SNoCut_L : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x0 -> SNoLt x2 (SNoCut x0 x1))).
admit.
Qed.
Theorem SNoCutP_SNoCut_R : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x1 -> SNoLt (SNoCut x0 x1) x2)).
admit.
Qed.
Theorem SNoCutP_SNoCut_fst : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, SNo x2 -> (forall x3, x3 :e x0 -> SNoLt x3 x2) -> (forall x3, x3 :e x1 -> SNoLt x2 x3) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x2) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x2))).
admit.
Qed.
Axiom binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
Theorem SNoCut_Le : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoLe (SNoCut x0 x1) (SNoCut x2 x3)).
admit.
Qed.
Theorem SNoCut_ext : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x1 -> SNoLt (SNoCut x2 x3) x4) -> (forall x4, x4 :e x2 -> SNoLt x4 (SNoCut x0 x1)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoCut x0 x1 = SNoCut x2 x3).
admit.
Qed.
Theorem ordinal_SNo_ : (forall x0, ordinal x0 -> SNo_ x0 x0).
admit.
Qed.
Definition SNo_extend0 : set -> set :=
 (fun x0 : set => PSNo (ordsucc (SNoLev x0)) (fun x1 : set => and (x1 :e x0) (x1 = SNoLev x0 -> (forall x2 : prop, x2)))).
Definition SNo_extend1 : set -> set :=
 (fun x0 : set => PSNo (ordsucc (SNoLev x0)) (fun x1 : set => or (x1 :e x0) (x1 = SNoLev x0))).
Theorem SNo_extend0_SNo_ : (forall x0, SNo x0 -> SNo_ (ordsucc (SNoLev x0)) (SNo_extend0 x0)).
admit.
Qed.
Theorem SNo_extend1_SNo_ : (forall x0, SNo x0 -> SNo_ (ordsucc (SNoLev x0)) (SNo_extend1 x0)).
admit.
Qed.
Theorem SNo_extend0_SNo : (forall x0, SNo x0 -> SNo (SNo_extend0 x0)).
admit.
Qed.
Theorem SNo_extend1_SNo : (forall x0, SNo x0 -> SNo (SNo_extend1 x0)).
admit.
Qed.
Theorem SNo_extend0_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend0 x0) = ordsucc (SNoLev x0)).
admit.
Qed.
Theorem SNo_extend1_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend1 x0) = ordsucc (SNoLev x0)).
admit.
Qed.
Theorem SNo_extend0_nIn : (forall x0, SNo x0 -> nIn (SNoLev x0) (SNo_extend0 x0)).
admit.
Qed.
Theorem SNo_extend1_In : (forall x0, SNo x0 -> SNoLev x0 :e SNo_extend1 x0).
admit.
Qed.
Theorem SNo_extend0_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend0 x0) x0).
admit.
Qed.
Theorem SNo_extend1_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend1 x0) x0).
admit.
Qed.
Theorem ordinal_SNo : (forall x0, ordinal x0 -> SNo x0).
admit.
Qed.
Theorem ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
admit.
Qed.
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Theorem ordinal_SNoLev_max : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e x0 -> SNoLt x1 x0)).
admit.
Qed.
Theorem ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
admit.
Qed.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom ordinal_ind : (forall x0 : set -> prop, (forall x1, ordinal x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, ordinal x1 -> x0 x1)).
Theorem ordinal_SNoLev_max_2 : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e ordsucc x0 -> SNoLe x1 x0)).
admit.
Qed.
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem ordinal_Subq_SNoLe : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoLe x0 x1).
admit.
Qed.
Theorem SNo_etaE : (forall x0, SNo x0 -> (forall x1 : prop, (forall x2 x3, SNoCutP x2 x3 -> (forall x4, x4 :e x2 -> SNoLev x4 :e SNoLev x0) -> (forall x4, x4 :e x3 -> SNoLev x4 :e SNoLev x0) -> x0 = SNoCut x2 x3 -> x1) -> x1)).
admit.
Qed.
Theorem SNo_ind : (forall x0 : set -> prop, (forall x1 x2, SNoCutP x1 x2 -> (forall x3, x3 :e x1 -> x0 x3) -> (forall x3, x3 :e x2 -> x0 x3) -> x0 (SNoCut x1 x2)) -> (forall x1, SNo x1 -> x0 x1)).
admit.
Qed.
