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
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom iff_refl : (forall x0 : prop, iff x0 x0).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem iff_sym : (forall x0 x1 : prop, iff x0 x1 -> iff x1 x0).
admit.
Qed.
Theorem iff_trans : (forall x0 x1 x2 : prop, iff x0 x1 -> iff x1 x2 -> iff x0 x2).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem not_or_and_demorgan : (forall x0 x1 : prop, not (or x0 x1) -> and (not x0) (not x1)).
admit.
Qed.
Theorem and_not_or_demorgan : (forall x0 x1 : prop, and (not x0) (not x1) -> not (or x0 x1)).
admit.
Qed.
Theorem not_ex_all_demorgan_i : (forall x0 : set -> prop, not (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> (forall x1, not (x0 x1))).
admit.
Qed.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Theorem not_all_ex_demorgan_i : (forall x0 : set -> prop, not (forall x1, x0 x1) -> (forall x1 : prop, (forall x2, not (x0 x2) -> x1) -> x1)).
admit.
Qed.
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Theorem eq_or_nand : or = (fun x1 x2 : prop => not (and (not x1) (not x2))).
admit.
Qed.
Definition EpsR_i_i_1 : (set -> set -> prop) -> set :=
 (fun x0 : set -> set -> prop => Eps_i (fun x1 : set => forall x2 : prop, (forall x3, x0 x1 x3 -> x2) -> x2)).
Definition EpsR_i_i_2 : (set -> set -> prop) -> set :=
 (fun x0 : set -> set -> prop => Eps_i (x0 (EpsR_i_i_1 x0))).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem EpsR_i_i_12 : (forall x0 : set -> set -> prop, (forall x1 : prop, (forall x2, (forall x3 : prop, (forall x4, x0 x2 x4 -> x3) -> x3) -> x1) -> x1) -> x0 (EpsR_i_i_1 x0) (EpsR_i_i_2 x0)).
admit.
Qed.
Definition DescrR_i_io_1 : (set -> (set -> prop) -> prop) -> set :=
 (fun x0 : set -> (set -> prop) -> prop => Eps_i (fun x1 : set => and (forall x2 : prop, (forall x3 : set -> prop, x0 x1 x3 -> x2) -> x2) (forall x2 x3 : set -> prop, x0 x1 x2 -> x0 x1 x3 -> x2 = x3))).
(* Parameter Descr_Vo1 "322bf09a1711d51a4512e112e1767cb2616a7708dc89d7312c8064cfee6e3315" "615c0ac7fca2b62596ed34285f29a77b39225d1deed75d43b7ae87c33ba37083" *)
Parameter Descr_Vo1 : ((set -> prop) -> prop) -> set -> prop.
Definition DescrR_i_io_2 : (set -> (set -> prop) -> prop) -> set -> prop :=
 (fun x0 : set -> (set -> prop) -> prop => Descr_Vo1 (x0 (DescrR_i_io_1 x0))).
Axiom Descr_Vo1_prop : (forall x0 : (set -> prop) -> prop, (forall x1 : prop, (forall x2 : set -> prop, x0 x2 -> x1) -> x1) -> (forall x1 x2 : set -> prop, x0 x1 -> x0 x2 -> x1 = x2) -> x0 (Descr_Vo1 x0)).
Theorem DescrR_i_io_12 : (forall x0 : set -> (set -> prop) -> prop, (forall x1 : prop, (forall x2, and (forall x3 : prop, (forall x4 : set -> prop, x0 x2 x4 -> x3) -> x3) (forall x3 x4 : set -> prop, x0 x2 x3 -> x0 x2 x4 -> x3 = x4) -> x1) -> x1) -> x0 (DescrR_i_io_1 x0) (DescrR_i_io_2 x0)).
admit.
Qed.
Definition PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)).
Theorem PNoEq_ref_ : (forall x0, forall x1 : set -> prop, PNoEq_ x0 x1 x1).
admit.
Qed.
Theorem PNoEq_sym_ : (forall x0, forall x1 x2 : set -> prop, PNoEq_ x0 x1 x2 -> PNoEq_ x0 x2 x1).
admit.
Qed.
Theorem PNoEq_tra_ : (forall x0, forall x1 x2 x3 : set -> prop, PNoEq_ x0 x1 x2 -> PNoEq_ x0 x2 x3 -> PNoEq_ x0 x1 x3).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Theorem PNoEq_antimon_ : (forall x0 x1 : set -> prop, forall x2, ordinal x2 -> (forall x3, x3 :e x2 -> PNoEq_ x2 x0 x1 -> PNoEq_ x3 x0 x1)).
admit.
Qed.
Definition PNoLt_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3 : prop, (forall x4, and (x4 :e x0) (and (and (PNoEq_ x4 x1 x2) (not (x1 x4))) (x2 x4)) -> x3) -> x3).
Theorem PNoLt_E_ : (forall x0, forall x1 x2 : set -> prop, PNoLt_ x0 x1 x2 -> (forall x3 : prop, (forall x4, x4 :e x0 -> PNoEq_ x4 x1 x2 -> not (x1 x4) -> x2 x4 -> x3) -> x3)).
admit.
Qed.
Theorem PNoLt_irref_ : (forall x0, forall x1 : set -> prop, not (PNoLt_ x0 x1 x1)).
admit.
Qed.
Theorem PNoLt_mon_ : (forall x0 x1 : set -> prop, forall x2, ordinal x2 -> (forall x3, x3 :e x2 -> PNoLt_ x3 x0 x1 -> PNoLt_ x2 x0 x1)).
admit.
Qed.
Axiom ordinal_ind : (forall x0 : set -> prop, (forall x1, ordinal x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, ordinal x1 -> x0 x1)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Theorem PNoLt_trichotomy_or_ : (forall x0 x1 : set -> prop, forall x2, ordinal x2 -> or (or (PNoLt_ x2 x0 x1) (PNoEq_ x2 x0 x1)) (PNoLt_ x2 x1 x0)).
admit.
Qed.
Axiom ordinal_trichotomy_or : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (or (x0 :e x1) (x0 = x1)) (x1 :e x0)).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Theorem PNoLt_tra_ : (forall x0, ordinal x0 -> (forall x1 x2 x3 : set -> prop, PNoLt_ x0 x1 x2 -> PNoLt_ x0 x2 x3 -> PNoLt_ x0 x1 x3)).
admit.
Qed.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Definition PNoLt : set -> (set -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => fun x3 : set -> prop => or (or (PNoLt_ (binintersect x0 x2) x1 x3) (and (and (x0 :e x2) (PNoEq_ x0 x1 x3)) (x3 x0))) (and (and (x2 :e x0) (PNoEq_ x2 x1 x3)) (not (x1 x2)))).
Axiom or3I1 : (forall x0 x1 x2 : prop, x0 -> or (or x0 x1) x2).
Theorem PNoLtI1 : (forall x0 x1, forall x2 x3 : set -> prop, PNoLt_ (binintersect x0 x1) x2 x3 -> PNoLt x0 x2 x1 x3).
admit.
Qed.
Axiom or3I2 : (forall x0 x1 x2 : prop, x1 -> or (or x0 x1) x2).
Theorem PNoLtI2 : (forall x0 x1, forall x2 x3 : set -> prop, x0 :e x1 -> PNoEq_ x0 x2 x3 -> x3 x0 -> PNoLt x0 x2 x1 x3).
admit.
Qed.
Axiom or3I3 : (forall x0 x1 x2 : prop, x2 -> or (or x0 x1) x2).
Theorem PNoLtI3 : (forall x0 x1, forall x2 x3 : set -> prop, x1 :e x0 -> PNoEq_ x1 x2 x3 -> not (x2 x1) -> PNoLt x0 x2 x1 x3).
admit.
Qed.
Theorem PNoLtE : (forall x0 x1, forall x2 x3 : set -> prop, PNoLt x0 x2 x1 x3 -> (forall x4 : prop, (PNoLt_ (binintersect x0 x1) x2 x3 -> x4) -> (x0 :e x1 -> PNoEq_ x0 x2 x3 -> x3 x0 -> x4) -> (x1 :e x0 -> PNoEq_ x1 x2 x3 -> not (x2 x1) -> x4) -> x4)).
admit.
Qed.
Axiom binintersect_idem : (forall x0, forall x1 : set -> set -> prop, x1 (binintersect x0 x0) x0 -> x1 x0 (binintersect x0 x0)).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem PNoLtE2 : (forall x0, forall x1 x2 : set -> prop, PNoLt x0 x1 x0 x2 -> PNoLt_ x0 x1 x2).
admit.
Qed.
Theorem PNoLt_irref : (forall x0, forall x1 : set -> prop, not (PNoLt x0 x1 x0 x1)).
admit.
Qed.
Axiom binintersect_Subq_eq_1 : (forall x0 x1, x0 c= x1 -> binintersect x0 x1 = x0).
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom binintersect_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binintersect x0 x1) (binintersect x1 x0) -> x2 (binintersect x1 x0) (binintersect x0 x1)).
Axiom ordinal_binintersect : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binintersect x0 x1)).
Theorem PNoLt_trichotomy_or : (forall x0 x1, forall x2 x3 : set -> prop, ordinal x0 -> ordinal x1 -> or (or (PNoLt x0 x2 x1 x3) (and (x0 = x1) (PNoEq_ x0 x2 x3))) (PNoLt x1 x3 x0 x2)).
admit.
Qed.
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom iffEL : (forall x0 x1 : prop, iff x0 x1 -> x0 -> x1).
Theorem PNoLtEq_tra : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 x3 x4 : set -> prop, PNoLt x0 x2 x1 x3 -> PNoEq_ x1 x3 x4 -> PNoLt x0 x2 x1 x4)).
admit.
Qed.
Theorem PNoEqLt_tra : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 x3 x4 : set -> prop, PNoEq_ x0 x2 x3 -> PNoLt x0 x3 x1 x4 -> PNoLt x0 x2 x1 x4)).
admit.
Qed.
Axiom binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
Theorem PNoLt_tra : (forall x0 x1 x2, ordinal x0 -> ordinal x1 -> ordinal x2 -> (forall x3 x4 x5 : set -> prop, PNoLt x0 x3 x1 x4 -> PNoLt x1 x4 x2 x5 -> PNoLt x0 x3 x2 x5)).
admit.
Qed.
Definition PNoLe : set -> (set -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => fun x3 : set -> prop => or (PNoLt x0 x1 x2 x3) (and (x0 = x2) (PNoEq_ x0 x1 x3))).
Theorem PNoLeI1 : (forall x0 x1, forall x2 x3 : set -> prop, PNoLt x0 x2 x1 x3 -> PNoLe x0 x2 x1 x3).
admit.
Qed.
Theorem PNoLeI2 : (forall x0, forall x1 x2 : set -> prop, PNoEq_ x0 x1 x2 -> PNoLe x0 x1 x0 x2).
admit.
Qed.
Theorem PNoLe_ref : (forall x0, forall x1 : set -> prop, PNoLe x0 x1 x0 x1).
admit.
Qed.
Theorem PNoLe_antisym : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 x3 : set -> prop, PNoLe x0 x2 x1 x3 -> PNoLe x1 x3 x0 x2 -> and (x0 = x1) (PNoEq_ x0 x2 x3))).
admit.
Qed.
Theorem PNoLtLe_tra : (forall x0 x1 x2, ordinal x0 -> ordinal x1 -> ordinal x2 -> (forall x3 x4 x5 : set -> prop, PNoLt x0 x3 x1 x4 -> PNoLe x1 x4 x2 x5 -> PNoLt x0 x3 x2 x5)).
admit.
Qed.
Theorem PNoLeLt_tra : (forall x0 x1 x2, ordinal x0 -> ordinal x1 -> ordinal x2 -> (forall x3 x4 x5 : set -> prop, PNoLe x0 x3 x1 x4 -> PNoLt x1 x4 x2 x5 -> PNoLt x0 x3 x2 x5)).
admit.
Qed.
Theorem PNoEqLe_tra : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 x3 x4 : set -> prop, PNoEq_ x0 x2 x3 -> PNoLe x0 x3 x1 x4 -> PNoLe x0 x2 x1 x4)).
admit.
Qed.
Theorem PNoLeEq_tra : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 x3 x4 : set -> prop, PNoLe x0 x2 x1 x3 -> PNoEq_ x1 x3 x4 -> PNoLe x0 x2 x1 x4)).
admit.
Qed.
Theorem PNoLe_tra : (forall x0 x1 x2, ordinal x0 -> ordinal x1 -> ordinal x2 -> (forall x3 x4 x5 : set -> prop, PNoLe x0 x3 x1 x4 -> PNoLe x1 x4 x2 x5 -> PNoLe x0 x3 x2 x5)).
admit.
Qed.
Definition PNo_downc : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> prop) -> prop => fun x1 : set => fun x2 : set -> prop => forall x3 : prop, (forall x4, and (ordinal x4) (forall x5 : prop, (forall x6 : set -> prop, and (x0 x4 x6) (PNoLe x1 x2 x4 x6) -> x5) -> x5) -> x3) -> x3).
Definition PNo_upc : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> prop) -> prop => fun x1 : set => fun x2 : set -> prop => forall x3 : prop, (forall x4, and (ordinal x4) (forall x5 : prop, (forall x6 : set -> prop, and (x0 x4 x6) (PNoLe x4 x6 x1 x2) -> x5) -> x5) -> x3) -> x3).
Theorem PNoLe_downc : (forall x0 : set -> (set -> prop) -> prop, forall x1 x2, forall x3 x4 : set -> prop, ordinal x1 -> ordinal x2 -> PNo_downc x0 x1 x3 -> PNoLe x2 x4 x1 x3 -> PNo_downc x0 x2 x4).
admit.
Qed.
Theorem PNo_downc_ref : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2 : set -> prop, x0 x1 x2 -> PNo_downc x0 x1 x2)).
admit.
Qed.
Theorem PNo_upc_ref : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2 : set -> prop, x0 x1 x2 -> PNo_upc x0 x1 x2)).
admit.
Qed.
Theorem PNoLe_upc : (forall x0 : set -> (set -> prop) -> prop, forall x1 x2, forall x3 x4 : set -> prop, ordinal x1 -> ordinal x2 -> PNo_upc x0 x1 x3 -> PNoLe x1 x3 x2 x4 -> PNo_upc x0 x2 x4).
admit.
Qed.
Definition PNoLt_pwise : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => forall x2, ordinal x2 -> (forall x3 : set -> prop, x0 x2 x3 -> (forall x4, ordinal x4 -> (forall x5 : set -> prop, x1 x4 x5 -> PNoLt x2 x3 x4 x5)))).
Theorem PNoLt_pwise_downc_upc : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> PNoLt_pwise (PNo_downc x0) (PNo_upc x1)).
admit.
Qed.
Definition PNo_rel_strict_upperbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> prop) -> prop => fun x1 : set => fun x2 : set -> prop => forall x3, x3 :e x1 -> (forall x4 : set -> prop, PNo_downc x0 x3 x4 -> PNoLt x3 x4 x1 x2)).
Definition PNo_rel_strict_lowerbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> prop) -> prop => fun x1 : set => fun x2 : set -> prop => forall x3, x3 :e x1 -> (forall x4 : set -> prop, PNo_upc x0 x3 x4 -> PNoLt x1 x2 x3 x4)).
Definition PNo_rel_strict_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => fun x2 : set => fun x3 : set -> prop => and (PNo_rel_strict_upperbd x0 x2 x3) (PNo_rel_strict_lowerbd x1 x2 x3)).
Theorem PNoEq_rel_strict_upperbd : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2 x3 : set -> prop, PNoEq_ x1 x2 x3 -> PNo_rel_strict_upperbd x0 x1 x2 -> PNo_rel_strict_upperbd x0 x1 x3)).
admit.
Qed.
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Theorem PNo_rel_strict_upperbd_antimon : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2 : set -> prop, forall x3, x3 :e x1 -> PNo_rel_strict_upperbd x0 x1 x2 -> PNo_rel_strict_upperbd x0 x3 x2)).
admit.
Qed.
Theorem PNoEq_rel_strict_lowerbd : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2 x3 : set -> prop, PNoEq_ x1 x2 x3 -> PNo_rel_strict_lowerbd x0 x1 x2 -> PNo_rel_strict_lowerbd x0 x1 x3)).
admit.
Qed.
Theorem PNo_rel_strict_lowerbd_antimon : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2 : set -> prop, forall x3, x3 :e x1 -> PNo_rel_strict_lowerbd x0 x1 x2 -> PNo_rel_strict_lowerbd x0 x3 x2)).
admit.
Qed.
Theorem PNoEq_rel_strict_imv : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> (forall x3 x4 : set -> prop, PNoEq_ x2 x3 x4 -> PNo_rel_strict_imv x0 x1 x2 x3 -> PNo_rel_strict_imv x0 x1 x2 x4)).
admit.
Qed.
Theorem PNo_rel_strict_imv_antimon : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> (forall x3 : set -> prop, forall x4, x4 :e x2 -> PNo_rel_strict_imv x0 x1 x2 x3 -> PNo_rel_strict_imv x0 x1 x4 x3)).
admit.
Qed.
Definition PNo_rel_strict_uniq_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => fun x2 : set => fun x3 : set -> prop => and (PNo_rel_strict_imv x0 x1 x2 x3) (forall x4 : set -> prop, PNo_rel_strict_imv x0 x1 x2 x4 -> PNoEq_ x2 x3 x4)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition PNo_rel_strict_split_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => fun x2 : set => fun x3 : set -> prop => and (PNo_rel_strict_imv x0 x1 (ordsucc x2) (fun x4 : set => and (x3 x4) (x4 = x2 -> (forall x5 : prop, x5)))) (PNo_rel_strict_imv x0 x1 (ordsucc x2) (fun x4 : set => or (x3 x4) (x4 = x2)))).
Theorem PNo_extend0_eq : (forall x0, forall x1 : set -> prop, PNoEq_ x0 x1 (fun x2 : set => and (x1 x2) (x2 = x0 -> (forall x3 : prop, x3)))).
admit.
Qed.
Theorem PNo_extend1_eq : (forall x0, forall x1 : set -> prop, PNoEq_ x0 x1 (fun x2 : set => or (x1 x2) (x2 = x0))).
admit.
Qed.
Axiom ordinal_lim_or_succ : (forall x0, ordinal x0 -> or (forall x1, x1 :e x0 -> ordsucc x1 :e x0) (forall x1 : prop, (forall x2, and (x2 :e x0) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom iffER : (forall x0 x1 : prop, iff x0 x1 -> x1 -> x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom ordinal_ordsucc_In_eq : (forall x0 x1, ordinal x0 -> x1 :e x0 -> or (ordsucc x1 :e x0) (x0 = ordsucc x1)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem PNo_rel_imv_ex : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> or (forall x3 : prop, (forall x4 : set -> prop, PNo_rel_strict_uniq_imv x0 x1 x2 x4 -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x2) (forall x5 : prop, (forall x6 : set -> prop, PNo_rel_strict_split_imv x0 x1 x4 x6 -> x5) -> x5) -> x3) -> x3))).
admit.
Qed.
Definition PNo_lenbdd : set -> (set -> (set -> prop) -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> prop) -> prop => forall x2, forall x3 : set -> prop, x1 x2 x3 -> x2 :e x0).
Theorem PNo_lenbdd_strict_imv_extend0 : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> (forall x3 : set -> prop, PNo_rel_strict_imv x0 x1 x2 x3 -> PNo_rel_strict_imv x0 x1 (ordsucc x2) (fun x4 : set => and (x3 x4) (x4 = x2 -> (forall x5 : prop, x5))))).
admit.
Qed.
Theorem PNo_lenbdd_strict_imv_extend1 : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> (forall x3 : set -> prop, PNo_rel_strict_imv x0 x1 x2 x3 -> PNo_rel_strict_imv x0 x1 (ordsucc x2) (fun x4 : set => or (x3 x4) (x4 = x2)))).
admit.
Qed.
Theorem PNo_lenbdd_strict_imv_split : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> (forall x3 : set -> prop, PNo_rel_strict_imv x0 x1 x2 x3 -> PNo_rel_strict_split_imv x0 x1 x2 x3)).
admit.
Qed.
Theorem PNo_rel_imv_bdd_ex : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> (forall x3 : prop, (forall x4, and (x4 :e ordsucc x2) (forall x5 : prop, (forall x6 : set -> prop, PNo_rel_strict_split_imv x0 x1 x4 x6 -> x5) -> x5) -> x3) -> x3))).
admit.
Qed.
Definition PNo_strict_upperbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> prop) -> prop => fun x1 : set => fun x2 : set -> prop => forall x3, ordinal x3 -> (forall x4 : set -> prop, x0 x3 x4 -> PNoLt x3 x4 x1 x2)).
Definition PNo_strict_lowerbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> prop) -> prop => fun x1 : set => fun x2 : set -> prop => forall x3, ordinal x3 -> (forall x4 : set -> prop, x0 x3 x4 -> PNoLt x1 x2 x3 x4)).
Definition PNo_strict_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => fun x2 : set => fun x3 : set -> prop => and (PNo_strict_upperbd x0 x2 x3) (PNo_strict_lowerbd x1 x2 x3)).
Theorem PNoEq_strict_upperbd : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2 x3 : set -> prop, PNoEq_ x1 x2 x3 -> PNo_strict_upperbd x0 x1 x2 -> PNo_strict_upperbd x0 x1 x3)).
admit.
Qed.
Theorem PNoEq_strict_lowerbd : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2 x3 : set -> prop, PNoEq_ x1 x2 x3 -> PNo_strict_lowerbd x0 x1 x2 -> PNo_strict_lowerbd x0 x1 x3)).
admit.
Qed.
Theorem PNoEq_strict_imv : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> (forall x3 x4 : set -> prop, PNoEq_ x2 x3 x4 -> PNo_strict_imv x0 x1 x2 x3 -> PNo_strict_imv x0 x1 x2 x4)).
admit.
Qed.
Theorem PNo_strict_upperbd_imp_rel_strict_upperbd : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2, x2 :e ordsucc x1 -> (forall x3 : set -> prop, PNo_strict_upperbd x0 x1 x3 -> PNo_rel_strict_upperbd x0 x2 x3))).
admit.
Qed.
Theorem PNo_strict_lowerbd_imp_rel_strict_lowerbd : (forall x0 : set -> (set -> prop) -> prop, forall x1, ordinal x1 -> (forall x2, x2 :e ordsucc x1 -> (forall x3 : set -> prop, PNo_strict_lowerbd x0 x1 x3 -> PNo_rel_strict_lowerbd x0 x2 x3))).
admit.
Qed.
Theorem PNo_strict_imv_imp_rel_strict_imv : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> (forall x3, x3 :e ordsucc x2 -> (forall x4 : set -> prop, PNo_strict_imv x0 x1 x2 x4 -> PNo_rel_strict_imv x0 x1 x3 x4))).
admit.
Qed.
Theorem PNo_rel_split_imv_imp_strict_imv : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> (forall x3 : set -> prop, PNo_rel_strict_split_imv x0 x1 x2 x3 -> PNo_strict_imv x0 x1 x2 x3)).
admit.
Qed.
Theorem ordinal_PNo_strict_imv : (forall x0 x1 : set -> (set -> prop) -> prop, forall x2, ordinal x2 -> (forall x3 : set -> prop, (forall x4, x4 :e x2 -> x3 x4) -> (forall x4, ordinal x4 -> (forall x5 : set -> prop, x0 x4 x5 -> x4 :e x2)) -> (forall x4, x4 :e x2 -> x0 x4 x3) -> (forall x4, ordinal x4 -> (forall x5 : set -> prop, not (x1 x4 x5))) -> PNo_strict_imv x0 x1 x2 x3)).
admit.
Qed.
Theorem PNo_lenbdd_strict_imv_ex : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> (forall x3 : prop, (forall x4, and (x4 :e ordsucc x2) (forall x5 : prop, (forall x6 : set -> prop, PNo_strict_imv x0 x1 x4 x6 -> x5) -> x5) -> x3) -> x3))).
admit.
Qed.
Definition PNo_least_rep : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => fun x2 : set => fun x3 : set -> prop => and (and (ordinal x2) (PNo_strict_imv x0 x1 x2 x3)) (forall x4, x4 :e x2 -> (forall x5 : set -> prop, not (PNo_strict_imv x0 x1 x4 x5)))).
Axiom least_ordinal_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, and (ordinal x2) (x0 x2) -> x1) -> x1) -> (forall x1 : prop, (forall x2, and (and (ordinal x2) (x0 x2)) (forall x3, x3 :e x2 -> not (x0 x3)) -> x1) -> x1)).
Theorem PNo_lenbdd_least_rep_ex : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> (forall x3 : prop, (forall x4, (forall x5 : prop, (forall x6 : set -> prop, PNo_least_rep x0 x1 x4 x6 -> x5) -> x5) -> x3) -> x3))).
admit.
Qed.
Definition PNo_least_rep2 : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => fun x2 : set => fun x3 : set -> prop => and (PNo_least_rep x0 x1 x2 x3) (forall x4, nIn x4 x2 -> not (x3 x4))).
Theorem PNo_strict_imv_pred_eq : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> (forall x3 x4 : set -> prop, PNo_least_rep x0 x1 x2 x3 -> PNo_strict_imv x0 x1 x2 x4 -> (forall x5, x5 :e x2 -> iff (x3 x5) (x4 x5))))).
admit.
Qed.
Axiom pred_ext : (forall x0 x1 : set -> prop, (forall x2, iff (x0 x2) (x1 x2)) -> x0 = x1).
Theorem PNo_lenbdd_least_rep2_exuniq2 : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> (forall x3 : prop, (forall x4, and (forall x5 : prop, (forall x6 : set -> prop, PNo_least_rep2 x0 x1 x4 x6 -> x5) -> x5) (forall x5 x6 : set -> prop, PNo_least_rep2 x0 x1 x4 x5 -> PNo_least_rep2 x0 x1 x4 x6 -> x5 = x6) -> x3) -> x3))).
admit.
Qed.
Definition PNo_bd : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set :=
 (fun x0 x1 : set -> (set -> prop) -> prop => DescrR_i_io_1 (PNo_least_rep2 x0 x1)).
Definition PNo_pred : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> prop :=
 (fun x0 x1 : set -> (set -> prop) -> prop => DescrR_i_io_2 (PNo_least_rep2 x0 x1)).
Theorem PNo_bd_pred_lem : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> PNo_least_rep2 x0 x1 (PNo_bd x0 x1) (PNo_pred x0 x1))).
admit.
Qed.
Theorem PNo_bd_pred : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> PNo_least_rep x0 x1 (PNo_bd x0 x1) (PNo_pred x0 x1))).
admit.
Qed.
Theorem PNo_bd_ord : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> ordinal (PNo_bd x0 x1))).
admit.
Qed.
Theorem PNo_bd_pred_strict_imv : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> PNo_strict_imv x0 x1 (PNo_bd x0 x1) (PNo_pred x0 x1))).
admit.
Qed.
Theorem PNo_bd_least_imv : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> (forall x3, x3 :e PNo_bd x0 x1 -> (forall x4 : set -> prop, not (PNo_strict_imv x0 x1 x3 x4))))).
admit.
Qed.
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Theorem PNo_bd_In : (forall x0 x1 : set -> (set -> prop) -> prop, PNoLt_pwise x0 x1 -> (forall x2, ordinal x2 -> PNo_lenbdd x2 x0 -> PNo_lenbdd x2 x1 -> PNo_bd x0 x1 :e ordsucc x2)).
admit.
Qed.
Definition PNoCutL : set -> (set -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => fun x3 : set -> prop => and (x2 :e x0) (PNoLt x2 x3 x0 x1)).
Definition PNoCutR : set -> (set -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => fun x3 : set -> prop => and (x2 :e x0) (PNoLt x0 x1 x2 x3)).
Theorem PNoCutL_lenbdd : (forall x0, forall x1 : set -> prop, PNo_lenbdd x0 (PNoCutL x0 x1)).
admit.
Qed.
Theorem PNoCutR_lenbdd : (forall x0, forall x1 : set -> prop, PNo_lenbdd x0 (PNoCutR x0 x1)).
admit.
Qed.
Theorem PNoCut_pwise : (forall x0, ordinal x0 -> (forall x1 : set -> prop, PNoLt_pwise (PNoCutL x0 x1) (PNoCutR x0 x1))).
admit.
Qed.
Theorem PNoCut_strict_imv : (forall x0, ordinal x0 -> (forall x1 : set -> prop, PNo_strict_imv (PNoCutL x0 x1) (PNoCutR x0 x1) x0 x1)).
admit.
Qed.
Theorem PNoCut_bd_eq : (forall x0, ordinal x0 -> (forall x1 : set -> prop, forall x2 : set -> set -> prop, x2 (PNo_bd (PNoCutL x0 x1) (PNoCutR x0 x1)) x0 -> x2 x0 (PNo_bd (PNoCutL x0 x1) (PNoCutR x0 x1)))).
admit.
Qed.
Theorem PNoCut_pred_eq : (forall x0, ordinal x0 -> (forall x1 : set -> prop, PNoEq_ x0 x1 (PNo_pred (PNoCutL x0 x1) (PNoCutR x0 x1)))).
admit.
Qed.
