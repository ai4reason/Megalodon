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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition If_Vo3 : prop -> (((set -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop :=
 (fun x0 : prop => fun x1 x2 : ((set -> prop) -> prop) -> prop => fun x3 : (set -> prop) -> prop => and (x0 -> x1 x3) (not x0 -> x2 x3)).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Axiom andEL : (forall x0 x1 : prop, and x0 x1 -> x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom notE : (forall x0 : prop, not x0 -> x0 -> False).
Theorem If_Vo3_1 : (forall x0 : prop, forall x1 x2 : ((set -> prop) -> prop) -> prop, x0 -> If_Vo3 x0 x1 x2 = x1).
admit.
Qed.
Axiom andER : (forall x0 x1 : prop, and x0 x1 -> x1).
Theorem If_Vo3_0 : (forall x0 : prop, forall x1 x2 : ((set -> prop) -> prop) -> prop, not x0 -> If_Vo3 x0 x1 x2 = x2).
admit.
Qed.
Definition Descr_Vo3 : ((((set -> prop) -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop :=
 (fun x0 : (((set -> prop) -> prop) -> prop) -> prop => fun x1 : (set -> prop) -> prop => forall x2 : ((set -> prop) -> prop) -> prop, x0 x2 -> x2 x1).
Theorem Descr_Vo3_prop : (forall x0 : (((set -> prop) -> prop) -> prop) -> prop, (forall x1 : prop, (forall x2 : ((set -> prop) -> prop) -> prop, x0 x2 -> x1) -> x1) -> (forall x1 x2 : ((set -> prop) -> prop) -> prop, x0 x1 -> x0 x2 -> x1 = x2) -> x0 (Descr_Vo3 x0)).
admit.
Qed.
Definition missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe : (set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop) -> set -> (((set -> prop) -> prop) -> prop) -> prop :=
 (fun x0 : set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop => fun x1 : set => fun x2 : ((set -> prop) -> prop) -> prop => forall x3 : set -> (((set -> prop) -> prop) -> prop) -> prop, (forall x4, forall x5 : set -> ((set -> prop) -> prop) -> prop, (forall x6, x6 :e x4 -> x3 x6 (x5 x6)) -> x3 x4 (x0 x4 x5)) -> x3 x1 x2).
Definition In_rec_Vo3 : (set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop) -> set -> ((set -> prop) -> prop) -> prop :=
 (fun x0 : set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop => fun x1 : set => Descr_Vo3 (missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe x0 x1)).
Theorem missingprop_19e14cfefa9c62802c3472f7b613074ec9e1720289fb25abc9d15e165cea68de : (forall x0 : set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop, forall x1, forall x2 : set -> ((set -> prop) -> prop) -> prop, (forall x3, x3 :e x1 -> missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe x0 x3 (x2 x3)) -> missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe x0 x1 (x0 x1 x2)).
admit.
Qed.
Theorem missingprop_70e0b3e19e71633a5089c4fe6e041cdfa72d2379ee60f95f14de305a8bd1bd2c : (forall x0 : set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop, forall x1, forall x2 : ((set -> prop) -> prop) -> prop, missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe x0 x1 x2 -> (forall x3 : prop, (forall x4 : set -> ((set -> prop) -> prop) -> prop, and (forall x5, x5 :e x1 -> missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe x0 x5 (x4 x5)) (x2 = x0 x1 x4) -> x3) -> x3)).
admit.
Qed.
Axiom In_ind : (forall x0 : set -> prop, (forall x1, (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, x0 x1)).
Theorem missingprop_e3fd7e34e0da9eea44164f3141ff6fc232704ab917a0a07eb8451b62e6e7b7c2 : (forall x0 : set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop, (forall x1, forall x2 x3 : set -> ((set -> prop) -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 x3 : ((set -> prop) -> prop) -> prop, missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe x0 x1 x2 -> missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe x0 x1 x3 -> x2 = x3)).
admit.
Qed.
Theorem missingprop_fd514410ca8da3fccfdb89525bf3bbb90dae0114fbbe4b92682d3ee2a566d218 : (forall x0 : set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop, (forall x1, forall x2 x3 : set -> ((set -> prop) -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe x0 x1 (In_rec_Vo3 x0 x1))).
admit.
Qed.
Theorem missingprop_2983c239ee68f51430d1cd05a4be8270ac120251debbce08fe470ec64aa3d910 : (forall x0 : set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop, (forall x1, forall x2 x3 : set -> ((set -> prop) -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_ad0cc56dd99cfeec4a9c7d3a4f4737fb52354235c926fa642551aa9a1e9883fe x0 x1 (x0 x1 (In_rec_Vo3 x0)))).
admit.
Qed.
Theorem In_rec_Vo3_eq : (forall x0 : set -> (set -> ((set -> prop) -> prop) -> prop) -> ((set -> prop) -> prop) -> prop, (forall x1, forall x2 x3 : set -> ((set -> prop) -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : (((set -> prop) -> prop) -> prop) -> (((set -> prop) -> prop) -> prop) -> prop, x2 (In_rec_Vo3 x0 x1) (x0 x1 (In_rec_Vo3 x0)) -> x2 (x0 x1 (In_rec_Vo3 x0)) (In_rec_Vo3 x0 x1))).
admit.
Qed.
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Definition inv : set -> (set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set => fun x2 : set => Eps_i (fun x3 : set => and (x3 :e x0) (x1 x3 = x2))).
Axiom Eps_i_ax : (forall x0 : set -> prop, forall x1, x0 x1 -> x0 (Eps_i x0)).
Axiom surj_rinv : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> (forall x3, x3 :e x1 -> and (inv x0 x2 x3 :e x0) (x2 (inv x0 x2 x3) = x3))).
Axiom missingprop_f9fc2fb6cfb4eb217cfd90f255fb35b64bd1729aa515ae6c662014a80909baf4 : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x0 -> inv x0 x2 (x2 x3) = x3)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom bij_inv : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> bij x1 x0 (inv x0 x2)).
Axiom bij_comp : (forall x0 x1 x2, forall x3 x4 : set -> set, bij x0 x1 x3 -> bij x1 x2 x4 -> bij x0 x2 (fun x5 : set => x4 (x3 x5))).
Axiom bij_id : (forall x0, bij x0 x0 (fun x1 : set => x1)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition exactly1of2 : prop -> prop -> prop :=
 (fun x0 x1 : prop => or (and x0 (not x1)) (and (not x0) x1)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom exactly1of2_I1 : (forall x0 x1 : prop, x0 -> not x1 -> exactly1of2 x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom exactly1of2_I2 : (forall x0 x1 : prop, not x0 -> x1 -> exactly1of2 x0 x1).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom exactly1of2_impI1 : (forall x0 x1 : prop, (x0 -> not x1) -> (not x0 -> x1) -> exactly1of2 x0 x1).
Axiom exactly1of2_impI2 : (forall x0 x1 : prop, (x1 -> not x0) -> (not x1 -> x0) -> exactly1of2 x0 x1).
Axiom exactly1of2_E : (forall x0 x1 : prop, exactly1of2 x0 x1 -> (forall x2 : prop, (x0 -> not x1 -> x2) -> (not x0 -> x1 -> x2) -> x2)).
Axiom exactly1of2_or : (forall x0 x1 : prop, exactly1of2 x0 x1 -> or x0 x1).
Axiom exactly1of2_impn12 : (forall x0 x1 : prop, exactly1of2 x0 x1 -> x0 -> not x1).
Axiom exactly1of2_impn21 : (forall x0 x1 : prop, exactly1of2 x0 x1 -> x1 -> not x0).
Axiom exactly1of2_nimp12 : (forall x0 x1 : prop, exactly1of2 x0 x1 -> not x0 -> x1).
Axiom exactly1of2_nimp21 : (forall x0 x1 : prop, exactly1of2 x0 x1 -> not x1 -> x0).
Definition exactly1of3 : prop -> prop -> prop -> prop :=
 (fun x0 x1 x2 : prop => or (and (exactly1of2 x0 x1) (not x2)) (and (and (not x0) (not x1)) x2)).
Axiom exactly1of3_I1 : (forall x0 x1 x2 : prop, x0 -> not x1 -> not x2 -> exactly1of3 x0 x1 x2).
Axiom exactly1of3_I2 : (forall x0 x1 x2 : prop, not x0 -> x1 -> not x2 -> exactly1of3 x0 x1 x2).
Axiom exactly1of3_I3 : (forall x0 x1 x2 : prop, not x0 -> not x1 -> x2 -> exactly1of3 x0 x1 x2).
Axiom exactly1of3_impI1 : (forall x0 x1 x2 : prop, (x0 -> not x1) -> (x0 -> not x2) -> (x1 -> not x2) -> (not x0 -> or x1 x2) -> exactly1of3 x0 x1 x2).
Axiom exactly1of3_impI2 : (forall x0 x1 x2 : prop, (x1 -> not x0) -> (x1 -> not x2) -> (x0 -> not x2) -> (not x1 -> or x0 x2) -> exactly1of3 x0 x1 x2).
Axiom exactly1of3_impI3 : (forall x0 x1 x2 : prop, (x2 -> not x0) -> (x2 -> not x1) -> (x0 -> not x1) -> (not x0 -> x1) -> exactly1of3 x0 x1 x2).
Axiom and3E : (forall x0 x1 x2 : prop, and (and x0 x1) x2 -> (forall x3 : prop, (x0 -> x1 -> x2 -> x3) -> x3)).
Axiom exactly1of3_E : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> (forall x3 : prop, (x0 -> not x1 -> not x2 -> x3) -> (not x0 -> x1 -> not x2 -> x3) -> (not x0 -> not x1 -> x2 -> x3) -> x3)).
Axiom or3I1 : (forall x0 x1 x2 : prop, x0 -> or (or x0 x1) x2).
Axiom or3I2 : (forall x0 x1 x2 : prop, x1 -> or (or x0 x1) x2).
Axiom or3I3 : (forall x0 x1 x2 : prop, x2 -> or (or x0 x1) x2).
Axiom exactly1of3_or : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> or (or x0 x1) x2).
Axiom exactly1of3_impn12 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x0 -> not x1).
Axiom exactly1of3_impn13 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x0 -> not x2).
Axiom exactly1of3_impn21 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x1 -> not x0).
Axiom exactly1of3_impn23 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x1 -> not x2).
Axiom exactly1of3_impn31 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x2 -> not x0).
Axiom exactly1of3_impn32 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x2 -> not x1).
Axiom exactly1of3_nimp1 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> not x0 -> or x1 x2).
Axiom exactly1of3_nimp2 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> not x1 -> or x0 x2).
Axiom exactly1of3_nimp3 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> not x2 -> or x0 x1).
Definition Descr_Vo1 : ((set -> prop) -> prop) -> set -> prop :=
 (fun x0 : (set -> prop) -> prop => fun x1 : set => forall x2 : set -> prop, x0 x2 -> x2 x1).
Definition reflexive : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1, x0 x1 x1).
Definition irreflexive : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1, not (x0 x1 x1)).
Definition symmetric : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2, x0 x1 x2 -> x0 x2 x1).
Definition antisymmetric : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2, x0 x1 x2 -> x0 x2 x1 -> x1 = x2).
Definition transitive : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2 x3, x0 x1 x2 -> x0 x2 x3 -> x0 x1 x3).
Definition eqreln : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => and (and (reflexive x0) (symmetric x0)) (transitive x0)).
Definition per : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => and (symmetric x0) (transitive x0)).
Definition linear : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2, or (x0 x1 x2) (x0 x2 x1)).
Definition trichotomous_or : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2, or (or (x0 x1 x2) (x1 = x2)) (x0 x2 x1)).
Definition partialorder : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => and (and (reflexive x0) (antisymmetric x0)) (transitive x0)).
Definition totalorder : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => and (partialorder x0) (linear x0)).
Definition strictpartialorder : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => and (irreflexive x0) (transitive x0)).
Definition stricttotalorder : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => and (strictpartialorder x0) (trichotomous_or x0)).
Theorem per_sym : (forall x0 : set -> set -> prop, per x0 -> symmetric x0).
admit.
Qed.
Theorem per_tra : (forall x0 : set -> set -> prop, per x0 -> transitive x0).
admit.
Qed.
Theorem per_stra1 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2 x3, x0 x2 x1 -> x0 x2 x3 -> x0 x1 x3)).
admit.
Qed.
Theorem per_stra2 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2 x3, x0 x1 x2 -> x0 x3 x2 -> x0 x1 x3)).
admit.
Qed.
Theorem per_stra3 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2 x3, x0 x2 x1 -> x0 x3 x2 -> x0 x1 x3)).
admit.
Qed.
Theorem per_ref1 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2, x0 x1 x2 -> x0 x1 x1)).
admit.
Qed.
Theorem per_ref2 : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2, x0 x1 x2 -> x0 x2 x2)).
admit.
Qed.
Theorem partialorder_strictpartialorder : (forall x0 : set -> set -> prop, partialorder x0 -> strictpartialorder (fun x1 x2 : set => and (x0 x1 x2) (x1 = x2 -> (forall x3 : prop, x3)))).
admit.
Qed.
Definition reflclos : (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 : set -> set -> prop => fun x1 x2 : set => or (x0 x1 x2) (x1 = x2)).
Theorem reflclos_refl : (forall x0 : set -> set -> prop, reflexive (reflclos x0)).
admit.
Qed.
Theorem reflclos_min : (forall x0 x1 : set -> set -> prop, (forall x2 x3, x0 x2 x3 -> x1 x2 x3) -> reflexive x1 -> (forall x2 x3, reflclos x0 x2 x3 -> x1 x2 x3)).
admit.
Qed.
Theorem strictpartialorder_partialorder_reflclos : (forall x0 : set -> set -> prop, strictpartialorder x0 -> partialorder (reflclos x0)).
admit.
Qed.
Axiom or3E : (forall x0 x1 x2 : prop, or (or x0 x1) x2 -> (forall x3 : prop, (x0 -> x3) -> (x1 -> x3) -> (x2 -> x3) -> x3)).
Theorem stricttotalorder_totalorder_reflclos : (forall x0 : set -> set -> prop, stricttotalorder x0 -> totalorder (reflclos x0)).
admit.
Qed.
Theorem missingprop_fc736d24ae94a3d5b74b9d45d9b476e94667edaaace7b4a17220d5e3dcc346ea : (forall x0 : set -> prop, (forall x1 : (set -> prop) -> prop, (forall x2 : set -> prop, x1 x2 -> x1 (fun x3 : set => and (x2 x3) (x3 = Eps_i x2 -> (forall x4 : prop, x4)))) -> (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x1 x3) -> x1 (Descr_Vo1 x2)) -> x1 x0) -> (forall x1 : (set -> prop) -> prop, (forall x2 : set -> prop, x1 x2 -> x1 (fun x3 : set => and (x2 x3) (x3 = Eps_i x2 -> (forall x4 : prop, x4)))) -> (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x1 x3) -> x1 (Descr_Vo1 x2)) -> x1 (fun x2 : set => and (x0 x2) (x2 = Eps_i x0 -> (forall x3 : prop, x3))))).
admit.
Qed.
Theorem missingprop_493b888cf0a805cead4e0248c971e6024ce25a1b7b03912f4ef24a0673efc991 : (forall x0 : (set -> prop) -> prop, (forall x1 : set -> prop, x0 x1 -> (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x2 (fun x4 : set => and (x3 x4) (x4 = Eps_i x3 -> (forall x5 : prop, x5)))) -> (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x2 x4) -> x2 (Descr_Vo1 x3)) -> x2 x1)) -> (forall x1 : (set -> prop) -> prop, (forall x2 : set -> prop, x1 x2 -> x1 (fun x3 : set => and (x2 x3) (x3 = Eps_i x2 -> (forall x4 : prop, x4)))) -> (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x1 x3) -> x1 (Descr_Vo1 x2)) -> x1 (Descr_Vo1 x0))).
admit.
Qed.
Theorem missingprop_8b6c35c0be5cf8f722ca2f225499fd1f64fbc0efe96a58d22f31aad0a1ec0140 : (forall x0 : (set -> prop) -> prop, (forall x1 : set -> prop, (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x2 (fun x4 : set => and (x3 x4) (x4 = Eps_i x3 -> (forall x5 : prop, x5)))) -> (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x2 x4) -> x2 (Descr_Vo1 x3)) -> x2 x1) -> x0 x1 -> x0 (fun x2 : set => and (x1 x2) (x2 = Eps_i x1 -> (forall x3 : prop, x3)))) -> (forall x1 : (set -> prop) -> prop, (forall x2 : set -> prop, x1 x2 -> (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x3 (fun x5 : set => and (x4 x5) (x5 = Eps_i x4 -> (forall x6 : prop, x6)))) -> (forall x4 : (set -> prop) -> prop, (forall x5 : set -> prop, x4 x5 -> x3 x5) -> x3 (Descr_Vo1 x4)) -> x3 x2)) -> (forall x2 : set -> prop, x1 x2 -> x0 x2) -> x0 (Descr_Vo1 x1)) -> (forall x1 : set -> prop, (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x2 (fun x4 : set => and (x3 x4) (x4 = Eps_i x3 -> (forall x5 : prop, x5)))) -> (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x2 x4) -> x2 (Descr_Vo1 x3)) -> x2 x1) -> x0 x1)).
admit.
Qed.
Axiom pred_ext_2 : (forall x0 x1 : set -> prop, (forall x2, x0 x2 -> x1 x2) -> (forall x2, x1 x2 -> x0 x2) -> x0 = x1).
Theorem missingprop_55ac2036b2594a1420c3213980e6cc84263d48ba5c2b4b8c0dc5b53adbf2cdcc : (forall x0 : set -> prop, (forall x1 : (set -> prop) -> prop, (forall x2 : set -> prop, x1 x2 -> x1 (fun x3 : set => and (x2 x3) (x3 = Eps_i x2 -> (forall x4 : prop, x4)))) -> (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x1 x3) -> x1 (Descr_Vo1 x2)) -> x1 x0) -> (forall x1 : set -> prop, (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x2 (fun x4 : set => and (x3 x4) (x4 = Eps_i x3 -> (forall x5 : prop, x5)))) -> (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x2 x4) -> x2 (Descr_Vo1 x3)) -> x2 x1) -> or (forall x2, x1 x2 -> x0 x2) (forall x2, x0 x2 -> x1 x2))).
admit.
Qed.
Theorem missingprop_9bbafade8c95a6fa6c2d448ec50d6cabcf2c6815bbb0987f878a1d6174f064ea : (forall x0 : set -> prop, (forall x1 : (set -> prop) -> prop, (forall x2 : set -> prop, x1 x2 -> x1 (fun x3 : set => and (x2 x3) (x3 = Eps_i x2 -> (forall x4 : prop, x4)))) -> (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x1 x3) -> x1 (Descr_Vo1 x2)) -> x1 x0) -> (forall x1 : set -> prop, (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x2 (fun x4 : set => and (x3 x4) (x4 = Eps_i x3 -> (forall x5 : prop, x5)))) -> (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x2 x4) -> x2 (Descr_Vo1 x3)) -> x2 x1) -> x1 (Eps_i x0) -> (forall x2, x0 x2 -> x1 x2))).
admit.
Qed.
Theorem missingprop_f62490cb6c28606f6d4e62da0ae9dc55ce95c3c5eef5b209414e8f9ac0f29308 : (forall x0 : set -> prop, forall x1 : (set -> prop) -> prop, (forall x2 : set -> prop, x1 x2 -> x1 (fun x3 : set => and (x2 x3) (x3 = Eps_i x2 -> (forall x4 : prop, x4)))) -> (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x1 x3) -> x1 (Descr_Vo1 x2)) -> x1 (Descr_Vo1 (fun x2 : set -> prop => and (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x3 (fun x5 : set => and (x4 x5) (x5 = Eps_i x4 -> (forall x6 : prop, x6)))) -> (forall x4 : (set -> prop) -> prop, (forall x5 : set -> prop, x4 x5 -> x3 x5) -> x3 (Descr_Vo1 x4)) -> x3 x2) (forall x3, x0 x3 -> x2 x3)))).
admit.
Qed.
Theorem missingprop_12c325de194b6cb07f2546d320f00cc8914eb929d52dcb23b6a6cdd6f5064d98 : (forall x0 : set -> prop, forall x1, x0 x1 -> Descr_Vo1 (fun x2 : set -> prop => and (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x3 (fun x5 : set => and (x4 x5) (x5 = Eps_i x4 -> (forall x6 : prop, x6)))) -> (forall x4 : (set -> prop) -> prop, (forall x5 : set -> prop, x4 x5 -> x3 x5) -> x3 (Descr_Vo1 x4)) -> x3 x2) (forall x3, x0 x3 -> x2 x3)) x1).
admit.
Qed.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem missingprop_e010b3a19747f7c1717c62914b4ab66c3d63ab0bd9893159907133d88739bd12 : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i (Descr_Vo1 (fun x1 : set -> prop => and (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x2 (fun x4 : set => and (x3 x4) (x4 = Eps_i x3 -> (forall x5 : prop, x5)))) -> (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x2 x4) -> x2 (Descr_Vo1 x3)) -> x2 x1) (forall x2, x0 x2 -> x1 x2))))).
admit.
Qed.
Definition ZermeloWO : set -> set -> prop :=
 (fun x0 : set => Descr_Vo1 (fun x1 : set -> prop => and (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x2 (fun x4 : set => and (x3 x4) (x4 = Eps_i x3 -> (forall x5 : prop, x5)))) -> (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, x3 x4 -> x2 x4) -> x2 (Descr_Vo1 x3)) -> x2 x1) (forall x2, x2 = x0 -> x1 x2))).
Theorem missingprop_1c5184f86aa281587f2541b20dafbf0fb59ed16c97a848ba15b898cfd0b2908e : (forall x0, forall x1 : (set -> prop) -> prop, (forall x2 : set -> prop, x1 x2 -> x1 (fun x3 : set => and (x2 x3) (x3 = Eps_i x2 -> (forall x4 : prop, x4)))) -> (forall x2 : (set -> prop) -> prop, (forall x3 : set -> prop, x2 x3 -> x1 x3) -> x1 (Descr_Vo1 x2)) -> x1 (ZermeloWO x0)).
admit.
Qed.
Theorem ZermeloWO_ref : reflexive ZermeloWO.
admit.
Qed.
Theorem ZermeloWO_Eps : (forall x0, forall x1 : set -> set -> prop, x1 (Eps_i (ZermeloWO x0)) x0 -> x1 x0 (Eps_i (ZermeloWO x0))).
admit.
Qed.
Theorem ZermeloWO_lin : linear ZermeloWO.
admit.
Qed.
Theorem ZermeloWO_tra : transitive ZermeloWO.
admit.
Qed.
Theorem ZermeloWO_antisym : antisymmetric ZermeloWO.
admit.
Qed.
Theorem ZermeloWO_partialorder : partialorder ZermeloWO.
admit.
Qed.
Theorem ZermeloWO_totalorder : totalorder ZermeloWO.
admit.
Qed.
Theorem ZermeloWO_wo : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> (forall x1 : prop, (forall x2, and (x0 x2) (forall x3, x0 x3 -> ZermeloWO x2 x3) -> x1) -> x1)).
admit.
Qed.
Definition ZermeloWOstrict : set -> set -> prop :=
 (fun x0 x1 : set => and (ZermeloWO x0 x1) (x0 = x1 -> (forall x2 : prop, x2))).
Theorem ZermeloWOstrict_trich : trichotomous_or ZermeloWOstrict.
admit.
Qed.
Theorem ZermeloWOstrict_stricttotalorder : stricttotalorder ZermeloWOstrict.
admit.
Qed.
Theorem ZermeloWOstrict_wo : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> (forall x1 : prop, (forall x2, and (x0 x2) (forall x3, and (x0 x3) (x3 = x2 -> (forall x4 : prop, x4)) -> ZermeloWOstrict x2 x3) -> x1) -> x1)).
admit.
Qed.
Theorem Zermelo_WO : (forall x0 : prop, (forall x1 : set -> set -> prop, and (totalorder x1) (forall x2 : set -> prop, (forall x3 : prop, (forall x4, x2 x4 -> x3) -> x3) -> (forall x3 : prop, (forall x4, and (x2 x4) (forall x5, x2 x5 -> x1 x4 x5) -> x3) -> x3)) -> x0) -> x0).
admit.
Qed.
Theorem Zermelo_WO_strict : (forall x0 : prop, (forall x1 : set -> set -> prop, and (stricttotalorder x1) (forall x2 : set -> prop, (forall x3 : prop, (forall x4, x2 x4 -> x3) -> x3) -> (forall x3 : prop, (forall x4, and (x2 x4) (forall x5, and (x2 x5) (x5 = x4 -> (forall x6 : prop, x6)) -> x1 x4 x5) -> x3) -> x3)) -> x0) -> x0).
admit.
Qed.
