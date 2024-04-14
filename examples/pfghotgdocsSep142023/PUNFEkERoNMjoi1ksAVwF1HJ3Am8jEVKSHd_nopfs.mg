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
Axiom missingprop_11278145386dd85f714f31121ec2805e154e2e3ecae4d7cd701d70d0cf5007ab : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8).
Definition MetaFunctor_prop1 : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (forall x4, Obj x4 -> Hom x4 x4 (Id x4)).
Definition MetaFunctor_prop2 : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (forall x4 x5 x6 x7 x8, Obj x4 -> Obj x5 -> Obj x6 -> Hom x4 x5 x7 -> Hom x5 x6 x8 -> Hom x4 x6 (Comp x4 x5 x6 x8 x7)).
Definition MetaCat_IdR_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (forall x4 x5 x6, Obj x4 -> Obj x5 -> Hom x4 x5 x6 -> Comp x4 x4 x5 x6 (Id x4) = x6).
Definition MetaCat_IdL_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (forall x4 x5 x6, Obj x4 -> Obj x5 -> Hom x4 x5 x6 -> Comp x4 x5 x5 (Id x5) x6 = x6).
Definition MetaCat_Comp_assoc_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (forall x4 x5 x6 x7 x8 x9 x10, Obj x4 -> Obj x5 -> Obj x6 -> Obj x7 -> Hom x4 x5 x8 -> Hom x5 x6 x9 -> Hom x6 x7 x10 -> Comp x4 x5 x7 (Comp x5 x6 x7 x10 x9) x8 = Comp x4 x6 x7 x10 (Comp x4 x5 x6 x9 x8)).
Definition MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => and (and (and (MetaFunctor_prop1 Obj Hom Id Comp) (MetaFunctor_prop2 Obj Hom Id Comp)) (and (MetaCat_IdR_p Obj Hom Id Comp) (MetaCat_IdL_p Obj Hom Id Comp))) (MetaCat_Comp_assoc_p Obj Hom Id Comp).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_fc5379bc4ad65dc1954d6f65361b9d804f439ab0844013155adf361a615275a6 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaFunctor_prop1 x0 x1 x2 x3 -> MetaFunctor_prop2 x0 x1 x2 x3 -> (forall x4 x5 x6, x0 x4 -> x0 x5 -> x1 x4 x5 x6 -> x3 x4 x4 x5 x6 (x2 x4) = x6) -> (forall x4 x5 x6, x0 x4 -> x0 x5 -> x1 x4 x5 x6 -> x3 x4 x5 x5 (x2 x5) x6 = x6) -> (forall x4 x5 x6 x7 x8 x9 x10, x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x4 x5 x8 -> x1 x5 x6 x9 -> x1 x6 x7 x10 -> x3 x4 x5 x7 (x3 x5 x6 x7 x10 x9) x8 = x3 x4 x6 x7 x10 (x3 x4 x5 x6 x9 x8)) -> MetaCat x0 x1 x2 x3).
admit.
Qed.
Theorem missingprop_d158dd0ee7cd129998fef286b8e8d5798d9fdd1daf331b8339c3836f8066dce4 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (MetaFunctor_prop1 x0 x1 x2 x3 -> MetaFunctor_prop2 x0 x1 x2 x3 -> (forall x5 x6 x7, x0 x5 -> x0 x6 -> x1 x5 x6 x7 -> x3 x5 x5 x6 x7 (x2 x5) = x7) -> (forall x5 x6 x7, x0 x5 -> x0 x6 -> x1 x5 x6 x7 -> x3 x5 x6 x6 (x2 x6) x7 = x7) -> (forall x5 x6 x7 x8 x9 x10 x11, x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x5 x6 x9 -> x1 x6 x7 x10 -> x1 x7 x8 x11 -> x3 x5 x6 x8 (x3 x6 x7 x8 x11 x10) x9 = x3 x5 x7 x8 x11 (x3 x5 x6 x7 x10 x9)) -> x4) -> x4)).
admit.
Qed.
Theorem missingprop_e74d2abe5a1e30f6a719b289885351f18b3a36d32b938dab696ee27d1cef86e5 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> MetaCat x0 (fun x4 x5 : set => x1 x5 x4) x2 (fun x4 x5 x6 x7 x8 : set => x3 x6 x5 x4 x8 x7)).
admit.
Qed.
Definition MetaCat_monic_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set => and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (forall x7, Obj x7 -> (forall x8 x9, Hom x7 x4 x8 -> Hom x7 x4 x9 -> Comp x7 x4 x5 x6 x8 = Comp x7 x4 x5 x6 x9 -> x8 = x9))).
Definition MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x6 x4 (x5 x6)) (forall x7, Hom x6 x4 x7 -> x7 = x5 x6))).
Definition MetaCat_initial_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x4 x6 (x5 x6)) (forall x7, Hom x4 x6 x7 -> x7 = x5 x6))).
Definition MetaCat_product_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x6 x4 x7)) (Hom x6 x5 x8)) (forall x10, Obj x10 -> (forall x11 x12, Hom x10 x4 x11 -> Hom x10 x5 x12 -> and (and (and (Hom x10 x6 (x9 x10 x11 x12)) (Comp x10 x6 x4 x7 (x9 x10 x11 x12) = x11)) (Comp x10 x6 x5 x8 (x9 x10 x11 x12) = x12)) (forall x13, Hom x10 x6 x13 -> Comp x10 x6 x4 x7 x13 = x11 -> Comp x10 x6 x5 x8 x13 = x12 -> x13 = x9 x10 x11 x12)))).
Definition MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => forall x8 x9, Obj x8 -> Obj x9 -> MetaCat_product_p Obj Hom Id Comp x8 x9 (x4 x8 x9) (x5 x8 x9) (x6 x8 x9) (x7 x8 x9)).
Definition MetaCat_coproduct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x4 x6 x7)) (Hom x5 x6 x8)) (forall x10, Obj x10 -> (forall x11 x12, Hom x4 x10 x11 -> Hom x5 x10 x12 -> and (and (and (Hom x6 x10 (x9 x10 x11 x12)) (Comp x4 x6 x10 (x9 x10 x11 x12) x7 = x11)) (Comp x5 x6 x10 (x9 x10 x11 x12) x8 = x12)) (forall x13, Hom x6 x10 x13 -> Comp x4 x6 x10 x13 x7 = x11 -> Comp x5 x6 x10 x13 x8 = x12 -> x13 = x9 x10 x11 x12)))).
Definition MetaCat_coproduct_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => forall x8 x9, Obj x8 -> Obj x9 -> MetaCat_coproduct_p Obj Hom Id Comp x8 x9 (x4 x8 x9) (x5 x8 x9) (x6 x8 x9) (x7 x8 x9)).
Definition MetaCat_equalizer_buggy_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 : set => fun x10 : set -> set -> set => and (and (and (and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (Hom x4 x5 x7)) (Obj x8)) (Hom x8 x4 x9)) (forall x11, Obj x11 -> (forall x12, Hom x11 x4 x12 -> Comp x11 x4 x5 x6 x12 = Comp x11 x4 x5 x7 x12 -> and (and (Hom x11 x8 (x10 x11 x12)) (Comp x11 x8 x4 x9 (x10 x11 x12) = x12)) (forall x13, Hom x11 x8 x13 -> Comp x11 x8 x4 x9 x13 = x12 -> x13 = x10 x11 x12)))).
Definition MetaCat_equalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 : set -> set -> set -> set -> set => fun x6 : set -> set -> set -> set -> set -> set -> set => forall x7 x8, Obj x7 -> Obj x8 -> (forall x9 x10, Hom x7 x8 x9 -> Hom x7 x8 x10 -> MetaCat_equalizer_buggy_p Obj Hom Id Comp x7 x8 x9 x10 (x4 x7 x8 x9 x10) (x5 x7 x8 x9 x10) (x6 x7 x8 x9 x10))).
Definition MetaCat_coequalizer_buggy_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 : set => fun x10 : set -> set -> set => and (and (and (and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (Hom x4 x5 x7)) (Obj x8)) (Hom x5 x8 x9)) (forall x11, Obj x11 -> (forall x12, Hom x5 x11 x12 -> Comp x4 x5 x11 x12 x6 = Comp x4 x5 x11 x12 x7 -> and (and (Hom x8 x11 (x10 x11 x12)) (Comp x5 x8 x11 (x10 x11 x12) x9 = x12)) (forall x13, Hom x8 x11 x13 -> Comp x5 x8 x11 x13 x9 = x12 -> x13 = x10 x11 x12)))).
Definition MetaCat_coequalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 : set -> set -> set -> set -> set => fun x6 : set -> set -> set -> set -> set -> set -> set => forall x7 x8, Obj x7 -> Obj x8 -> (forall x9 x10, Hom x7 x8 x9 -> Hom x7 x8 x10 -> MetaCat_coequalizer_buggy_p Obj Hom Id Comp x7 x8 x9 x10 (x4 x7 x8 x9 x10) (x5 x7 x8 x9 x10) (x6 x7 x8 x9 x10))).
Definition MetaCat_pullback_buggy_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 x10 x11 : set => fun x12 : set -> set -> set -> set => and (and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x4 x6 x7)) (Hom x5 x6 x8)) (Obj x9)) (Hom x9 x4 x10)) (Hom x9 x5 x11)) (forall x13, Obj x13 -> (forall x14, Hom x13 x4 x14 -> (forall x15, Hom x13 x5 x15 -> Comp x13 x4 x6 x7 x14 = Comp x13 x5 x6 x8 x15 -> and (and (and (Hom x13 x9 (x12 x13 x14 x15)) (Comp x13 x9 x4 x10 (x12 x13 x14 x15) = x14)) (Comp x13 x9 x5 x11 (x12 x13 x14 x15) = x15)) (forall x16, Hom x13 x9 x16 -> Comp x13 x9 x4 x10 x16 = x14 -> Comp x13 x9 x5 x11 x16 = x15 -> x16 = x12 x13 x14 x15))))).
Definition MetaCat_pullback_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set -> set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set -> set -> set -> set => forall x8 x9 x10, Obj x8 -> Obj x9 -> Obj x10 -> (forall x11 x12, Hom x8 x10 x11 -> Hom x9 x10 x12 -> MetaCat_pullback_buggy_p Obj Hom Id Comp x8 x9 x10 x11 x12 (x4 x8 x9 x10 x11 x12) (x5 x8 x9 x10 x11 x12) (x6 x8 x9 x10 x11 x12) (x7 x8 x9 x10 x11 x12))).
Definition MetaCat_pushout_buggy_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 x10 x11 : set => fun x12 : set -> set -> set -> set => and (and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x6 x4 x7)) (Hom x6 x5 x8)) (Obj x9)) (Hom x4 x9 x10)) (Hom x5 x9 x11)) (forall x13, Obj x13 -> (forall x14, Hom x4 x13 x14 -> (forall x15, Hom x5 x13 x15 -> Comp x6 x4 x13 x14 x7 = Comp x6 x5 x13 x15 x8 -> and (and (and (Hom x9 x13 (x12 x13 x14 x15)) (Comp x4 x9 x13 (x12 x13 x14 x15) x10 = x14)) (Comp x5 x9 x13 (x12 x13 x14 x15) x11 = x15)) (forall x16, Hom x9 x13 x16 -> Comp x4 x9 x13 x16 x10 = x14 -> Comp x5 x9 x13 x16 x11 = x15 -> x16 = x12 x13 x14 x15))))).
Definition MetaCat_pushout_buggy_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set -> set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set -> set -> set -> set => forall x8 x9 x10, Obj x8 -> Obj x9 -> Obj x10 -> (forall x11 x12, Hom x10 x8 x11 -> Hom x10 x9 x12 -> MetaCat_pushout_buggy_p Obj Hom Id Comp x8 x9 x10 x11 x12 (x4 x8 x9 x10 x11 x12) (x5 x8 x9 x10 x11 x12) (x6 x8 x9 x10 x11 x12) (x7 x8 x9 x10 x11 x12))).
Definition MetaCat_exp_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 x10 x11 : set => fun x12 : set -> set -> set => and (and (and (and (Obj x8) (Obj x9)) (Obj x10)) (Hom (x4 x10 x8) x9 x11)) (forall x13, Obj x13 -> (forall x14, Hom (x4 x13 x8) x9 x14 -> and (and (Hom x13 x10 (x12 x13 x14)) (Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 (x12 x13 x14) (x5 x13 x8)) (x6 x13 x8)) = x14)) (forall x15, Hom x13 x10 x15 -> Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 x15 (x5 x13 x8)) (x6 x13 x8)) = x14 -> x15 = x12 x13 x14)))).
Definition MetaCat_exp_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> set -> set -> set => and (MetaCat_product_constr_p Obj Hom Id Comp x4 x5 x6 x7) (forall x11 x12, Obj x11 -> Obj x12 -> MetaCat_exp_p Obj Hom Id Comp x4 x5 x6 x7 x11 x12 (x8 x11 x12) (x9 x11 x12) (x10 x11 x12))).
Definition MetaCat_subobject_classifier_buggy_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> (set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => fun x6 x7 : set => fun x8 : set -> set -> set -> set => fun x9 : set -> set -> set -> set -> set -> set -> set => and (and (MetaCat_terminal_p Obj Hom Id Comp x4 x5) (Hom x4 x6 x7)) (forall x10 x11 x12, MetaCat_monic_p Obj Hom Id Comp x10 x11 x12 -> and (Hom x11 x6 (x8 x10 x11 x12)) (MetaCat_pullback_buggy_p Obj Hom Id Comp x4 x11 x6 x7 (x8 x10 x11 x12) x10 (x5 x10) x12 (x9 x10 x11 x12)))).
Definition MetaCat_nno_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => fun x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (MetaCat_terminal_p Obj Hom Id Comp x4 x5) (Obj x6)) (Hom x4 x6 x7)) (Hom x6 x6 x8)) (forall x10 x11 x12, Obj x10 -> Hom x4 x10 x11 -> Hom x10 x10 x12 -> and (and (and (Hom x6 x10 (x9 x10 x11 x12)) (Comp x4 x6 x10 (x9 x10 x11 x12) x7 = x11)) (Comp x6 x6 x10 (x9 x10 x11 x12) x8 = Comp x6 x10 x10 x12 (x9 x10 x11 x12))) (forall x13, Hom x6 x10 x13 -> Comp x4 x6 x10 x13 x7 = x11 -> Comp x6 x6 x10 x13 x8 = Comp x6 x10 x10 x12 x13 -> x13 = x9 x10 x11 x12))).
Theorem missingprop_38cf5b96036d3a2d9128e29a4d85a2a50b4569ed52b5108c71f70c2d95f1e871 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 x6 x7 x8, forall x9 : set -> set -> set -> set, MetaCat_product_p x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaCat_coproduct_p x0 (fun x10 x11 : set => x1 x11 x10) x2 (fun x10 x11 x12 x13 x14 : set => x3 x12 x11 x10 x14 x13) x4 x5 x6 x7 x8 x9).
admit.
Qed.
Theorem missingprop_5f1c74d4f264e49868bccd7bd709bb1de47b788db9298d9f2d35e2bd8002f035 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 x6 : set -> set -> set, forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 x1 x2 x3 x4 x5 x6 x7 -> MetaCat_coproduct_constr_p x0 (fun x8 x9 : set => x1 x9 x8) x2 (fun x8 x9 x10 x11 x12 : set => x3 x10 x9 x8 x12 x11) x4 x5 x6 x7).
admit.
Qed.
Theorem missingprop_84a847c4fc48322ada46a13f15c26e5c703839a2aa67166593fdcc011c706021 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 x6 x7 x8, forall x9 : set -> set -> set -> set, MetaCat_coproduct_p x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaCat_product_p x0 (fun x10 x11 : set => x1 x11 x10) x2 (fun x10 x11 x12 x13 x14 : set => x3 x12 x11 x10 x14 x13) x4 x5 x6 x7 x8 x9).
admit.
Qed.
Theorem missingprop_3e498f82534b580a88318238b6efe39f38e2659211a00044ec22608822e6b2ec : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 x6 : set -> set -> set, forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p x0 x1 x2 x3 x4 x5 x6 x7 -> MetaCat_product_constr_p x0 (fun x8 x9 : set => x1 x9 x8) x2 (fun x8 x9 x10 x11 x12 : set => x3 x10 x9 x8 x12 x11) x4 x5 x6 x7).
admit.
Qed.
Axiom and7I : (forall x0 x1 x2 x3 x4 x5 x6 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6).
Theorem missingprop_405763a49e2d1f210c8b00fd575b98396d06b49bcd8c281974349607fadf4178 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> set, MetaCat_equalizer_buggy_p x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 -> MetaCat_coequalizer_buggy_p x0 (fun x11 x12 : set => x1 x12 x11) x2 (fun x11 x12 x13 x14 x15 : set => x3 x13 x12 x11 x15 x14) x5 x4 x6 x7 x8 x9 x10).
admit.
Qed.
Theorem missingprop_c5fd498c5af378331168ee451515ea46b282edf2a9d6d67a116ba07ba5ba35be : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 : set -> set -> set -> set -> set, forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p x0 x1 x2 x3 x4 x5 x6 -> MetaCat_coequalizer_buggy_struct_p x0 (fun x7 x8 : set => x1 x8 x7) x2 (fun x7 x8 x9 x10 x11 : set => x3 x9 x8 x7 x11 x10) (fun x7 x8 : set => x4 x8 x7) (fun x7 x8 : set => x5 x8 x7) (fun x7 x8 : set => x6 x8 x7)).
admit.
Qed.
Theorem missingprop_c24183eccc3e65803d127fabb5f50ba8a680819dfa1c453f312d7647ddec571b : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> set, MetaCat_coequalizer_buggy_p x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 -> MetaCat_equalizer_buggy_p x0 (fun x11 x12 : set => x1 x12 x11) x2 (fun x11 x12 x13 x14 x15 : set => x3 x13 x12 x11 x15 x14) x5 x4 x6 x7 x8 x9 x10).
admit.
Qed.
Theorem missingprop_57735d507f4630dcf18a0fdf1ddb2fe3788bcd32c228a3049543fe6953cbe7a3 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 : set -> set -> set -> set -> set, forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p x0 x1 x2 x3 x4 x5 x6 -> MetaCat_equalizer_buggy_struct_p x0 (fun x7 x8 : set => x1 x8 x7) x2 (fun x7 x8 x9 x10 x11 : set => x3 x9 x8 x7 x11 x10) (fun x7 x8 : set => x4 x8 x7) (fun x7 x8 : set => x5 x8 x7) (fun x7 x8 : set => x6 x8 x7)).
admit.
Qed.
Theorem missingprop_47e19018e7eedad0cec703a28fa63310beb239431f1691d08413cb7ee2fe7d47 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 x6 x7 x8 x9 x10 x11, forall x12 : set -> set -> set -> set, MetaCat_pullback_buggy_p x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 -> MetaCat_pushout_buggy_p x0 (fun x13 x14 : set => x1 x14 x13) x2 (fun x13 x14 x15 x16 x17 : set => x3 x15 x14 x13 x17 x16) x4 x5 x6 x7 x8 x9 x10 x11 x12).
admit.
Qed.
Theorem missingprop_4bd58e58196fb7f9157c6ae3d8bfaab750131ab5c106693b3bf313a6ed49b37c : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 x4 x5 x6 : set -> set -> set -> set -> set -> set, forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p x0 x1 x2 x3 x4 x5 x6 x7 -> MetaCat_pushout_buggy_constr_p x0 (fun x8 x9 : set => x1 x9 x8) x2 (fun x8 x9 x10 x11 x12 : set => x3 x10 x9 x8 x12 x11) x4 x5 x6 x7).
admit.
Qed.
Theorem missingprop_daf353d935f744b0db6b1146cfcf7d7a089d467adea671e4230d49d07d524a74 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 x5 x6 x7 x8 x9 x10 x11, forall x12 : set -> set -> set -> set, MetaCat_pushout_buggy_p x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 -> MetaCat_pullback_buggy_p x0 (fun x13 x14 : set => x1 x14 x13) x2 (fun x13 x14 x15 x16 x17 : set => x3 x15 x14 x13 x17 x16) x4 x5 x6 x7 x8 x9 x10 x11 x12).
admit.
Qed.
Theorem missingprop_d2761b769b786be3d0905a5bbed5b132781cb0b0e59b14cafdd09c50ee5414e5 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 x4 x5 x6 : set -> set -> set -> set -> set -> set, forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p x0 x1 x2 x3 x4 x5 x6 x7 -> MetaCat_pullback_buggy_struct_p x0 (fun x8 x9 : set => x1 x9 x8) x2 (fun x8 x9 x10 x11 x12 : set => x3 x10 x9 x8 x12 x11) x4 x5 x6 x7).
admit.
Qed.
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Theorem missingprop_a85adc84b4440906b718b460d16f4260910975230e5a26ea683f6e56068993a7 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 x5 : set -> set -> set -> set -> set, forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p x0 x1 x2 x3 x4 x5 x6 -> (forall x7 x8 x9 : set -> set -> set, forall x10 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 x1 x2 x3 x7 x8 x9 x10 -> MetaCat_pullback_buggy_struct_p x0 x1 x2 x3 (fun x11 x12 x13 x14 x15 : set => x4 (x7 x11 x12) x13 (x3 (x7 x11 x12) x11 x13 x14 (x8 x11 x12)) (x3 (x7 x11 x12) x12 x13 x15 (x9 x11 x12))) (fun x11 x12 x13 x14 x15 : set => x3 (x4 (x7 x11 x12) x13 (x3 (x7 x11 x12) x11 x13 x14 (x8 x11 x12)) (x3 (x7 x11 x12) x12 x13 x15 (x9 x11 x12))) (x7 x11 x12) x11 (x8 x11 x12) (x5 (x7 x11 x12) x13 (x3 (x7 x11 x12) x11 x13 x14 (x8 x11 x12)) (x3 (x7 x11 x12) x12 x13 x15 (x9 x11 x12)))) (fun x11 x12 x13 x14 x15 : set => x3 (x4 (x7 x11 x12) x13 (x3 (x7 x11 x12) x11 x13 x14 (x8 x11 x12)) (x3 (x7 x11 x12) x12 x13 x15 (x9 x11 x12))) (x7 x11 x12) x12 (x9 x11 x12) (x5 (x7 x11 x12) x13 (x3 (x7 x11 x12) x11 x13 x14 (x8 x11 x12)) (x3 (x7 x11 x12) x12 x13 x15 (x9 x11 x12)))) (fun x11 x12 x13 x14 x15 x16 x17 x18 : set => x6 (x7 x11 x12) x13 (x3 (x7 x11 x12) x11 x13 x14 (x8 x11 x12)) (x3 (x7 x11 x12) x12 x13 x15 (x9 x11 x12)) x16 (x10 x11 x12 x16 x17 x18))))).
admit.
Qed.
Theorem missingprop_9fcad064802ee84e427d18a2850fbc0e1c42de54c2d7308529f7d585ae33f8a0 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p x0 x1 x2 x3 x5 x7 x9 -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4)).
admit.
Qed.
Theorem missingprop_bc6a6a25f03a04c90ec75d3a4831ab611592f3e2fb7ed64e1fa86dae76d3ac0b : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p x0 x1 x2 x3 x5 x7 x9 -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4)).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition famunion : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => Union (Repl x0 x1)).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
Definition Inj0 : set -> set :=
 (fun x0 : set => Repl x0 Inj1).
Definition setsum : set -> set -> set :=
 (fun x0 x1 : set => binunion (Repl x0 Inj0) (Repl x1 Inj1)).
Definition lam : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => famunion x0 (fun x2 : set => Repl (x1 x2) (setsum x2))).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition Pi : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => Sep (Power (lam x0 (fun x2 : set => Union (x1 x2)))) (fun x2 : set => forall x3, x3 :e x0 -> ap x2 x3 :e x1 x3)).
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Definition HomSet : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => x2 :e setexp x1 x0).
Definition True : prop :=
 (forall x0 : prop, x0 -> x0).
Theorem missingprop_29d4145dd4c077c4963402c7b8e047e8730e4c9edf6a32b09958d7d791a04513 : MetaCat (fun x0 : set => True) HomSet (fun x0 : set => lam x0 (fun x1 : set => x1)) (fun x0 x1 x2 x3 x4 : set => lam x0 (fun x5 : set => ap x3 (ap x4 x5))).
Admitted.
Theorem missingprop_5e63f064aff725314603de7d7df2a23ac8b1dbdcbbedd3d75170d5063ec7a6ce : MetaCat (fun x0 : set => x0 :e UnivOf Empty) HomSet (fun x0 : set => lam x0 (fun x1 : set => x1)) (fun x0 x1 x2 x3 x4 : set => lam x0 (fun x5 : set => ap x3 (ap x4 x5))).
Admitted.
Theorem missingprop_0ab6c96c4580951a6f12deec8a2372fa15c6ebdd77819f89c859fbf5381aa96d : MetaCat (fun x0 : set => x0 :e UnivOf (UnivOf Empty)) HomSet (fun x0 : set => lam x0 (fun x1 : set => x1)) (fun x0 x1 x2 x3 x4 : set => lam x0 (fun x5 : set => ap x3 (ap x4 x5))).
Admitted.
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Theorem missingprop_31dcb8d5525508863c1b21cc955e4d494ebb1701faf26ee1ff3607fb19489de7 : (forall x0 : set -> prop, x0 Empty -> (forall x1 : prop, (forall x2, (forall x3 : prop, (forall x4 : set -> set, MetaCat_initial_p x0 HomSet (fun x5 : set => lam x5 (fun x6 : set => x6)) (fun x5 x6 x7 x8 x9 : set => lam x5 (fun x10 : set => ap x8 (ap x9 x10))) x2 x4 -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Axiom TrueI : True.
Theorem missingprop_6482952e7e0a4bf00d28fb92ecd380f707bb40e0d65cb44f18a4b021cf4cfdbf : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p (fun x4 : set => True) HomSet (fun x4 : set => lam x4 (fun x5 : set => x5)) (fun x4 x5 x6 x7 x8 : set => lam x4 (fun x9 : set => ap x7 (ap x8 x9))) x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom In_0_1 : 0 :e 1.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom eq_1_Sing0 : 1 = Sing 0.
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Theorem missingprop_b6fb54fab4516b035f62dacd09064964d22d891fcede06066aa8011a5caac6b6 : (forall x0 : set -> prop, x0 1 -> (forall x1 : prop, (forall x2, (forall x3 : prop, (forall x4 : set -> set, MetaCat_terminal_p x0 HomSet (fun x5 : set => lam x5 (fun x6 : set => x6)) (fun x5 x6 x7 x8 x9 : set => lam x5 (fun x10 : set => ap x8 (ap x9 x10))) x2 x4 -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_bf77832c7d156b8ccc4f0fffbec59e593d6559d66a7e9d9ac9a44ea9aa0ac962 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p (fun x4 : set => True) HomSet (fun x4 : set => lam x4 (fun x5 : set => x5)) (fun x4 x5 x6 x7 x8 : set => lam x4 (fun x9 : set => ap x7 (ap x8 x9))) x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter combine_funcs "f0267e2cbae501ea3433aecadbe197ba8f39c96e80326cc5981a1630fda29909" "ccac4354446ce449bb1c967fa332cdf48b070fc032d9733e4c1305fb864cb72a" *)
Parameter combine_funcs : set -> set -> (set -> set) -> (set -> set) -> set -> set.
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Axiom Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
Axiom Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom setsum_Inj_inv : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = Inj0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = Inj1 x4) -> x3) -> x3)).
Axiom combine_funcs_eq1 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj0 x4)) (x2 x4) -> x5 (x2 x4) (combine_funcs x0 x1 x2 x3 (Inj0 x4))).
Axiom combine_funcs_eq2 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj1 x4)) (x3 x4) -> x5 (x3 x4) (combine_funcs x0 x1 x2 x3 (Inj1 x4))).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Theorem missingprop_7e80016cd90eba8cfb22e412d51217cbc5f2eeece9405f5140e2181ec01c4b9a : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setsum x1 x2))) -> (forall x1 : prop, (forall x2 : set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p x0 HomSet (fun x9 : set => lam x9 (fun x10 : set => x10)) (fun x9 x10 x11 x12 x13 : set => lam x9 (fun x14 : set => ap x12 (ap x13 x14))) x2 x4 x6 x8 -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_2c4f22a91db29194c445bcd6d03bd4d8a28e2ca068110adc6df3c2eb893080af : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p (fun x8 : set => True) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Theorem missingprop_2d427e86e80080bca0cd1cdb7569c48ac3ebc7f720e53d0aef56ae9082c9d013 : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setprod x1 x2))) -> (forall x1 : prop, (forall x2 : set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 HomSet (fun x9 : set => lam x9 (fun x10 : set => x10)) (fun x9 x10 x11 x12 x13 : set => lam x9 (fun x14 : set => ap x12 (ap x13 x14))) x2 x4 x6 x8 -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_8c56c9455848c30a0f622e89a2d9c7a8537f163e06421338cfb31fd1bd9e22ad : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p (fun x8 : set => True) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter ZF_closed "43f34d6a2314b56cb12bf5cf84f271f3f02a3e68417b09404cc73152523dbfa0" "1bd4aa0ec0b5e627dce9a8a1ddae929e58109ccbb6f4bb3d08614abf740280c0" *)
Parameter ZF_closed : set -> prop.
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom UnivOf_TransSet : (forall x0, TransSet (UnivOf x0)).
Axiom ZF_Power_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> Power x1 :e x0)).
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Axiom UnivOf_ZF_closed : (forall x0, ZF_closed (UnivOf x0)).
Theorem missingprop_1bcb0376aad766d016ee9f0693d3212cc24924141721dea50bf523c306096bab : (forall x0 x1, x1 :e UnivOf x0 -> (forall x2, x2 c= x1 -> x2 :e UnivOf x0)).
admit.
Qed.
Definition missingname_caf77a9d03a55ac210982b45133e78c616ab36004eb6ecb2e934df299c57d151 : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> famunion x1 x2 :e x0)).
Definition Union_closed : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> Union x1 :e x0).
Definition Repl_closed : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> Repl x1 x2 :e x0)).
Theorem missingprop_35501a83bb6c9c59dcb9d44470dcdf3c218c38f27dfa8ed8220429e4939efed1 : (forall x0, Union_closed x0 -> Repl_closed x0 -> missingname_caf77a9d03a55ac210982b45133e78c616ab36004eb6ecb2e934df299c57d151 x0).
admit.
Qed.
Definition Power_closed : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> Power x1 :e x0).
Axiom ZF_closed_E : (forall x0, ZF_closed x0 -> (forall x1 : prop, (Union_closed x0 -> Power_closed x0 -> Repl_closed x0 -> x1) -> x1)).
Axiom Empty_In_Power : (forall x0, 0 :e Power x0).
Theorem missingprop_e747e5ba1c4c5fc029f52d44d14d3be2d06759ee5e8f12e8b1e65810154eb535 : (forall x0 x1, TransSet x0 -> ZF_closed x0 -> x1 :e x0 -> 0 :e x0).
admit.
Qed.
Axiom In_ind : (forall x0 : set -> prop, (forall x1, (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, x0 x1)).
Axiom Inj1_eq : (forall x0, forall x1 : set -> set -> prop, x1 (Inj1 x0) (binunion (Sing 0) (Repl x0 Inj1)) -> x1 (binunion (Sing 0) (Repl x0 Inj1)) (Inj1 x0)).
Axiom ZF_binunion_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> binunion x1 x2 :e x0))).
Axiom ZF_Sing_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> Sing x1 :e x0)).
Axiom ZF_Repl_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> Repl x1 x2 :e x0))).
Theorem missingprop_6171474f197c8259ed73c167f3350e99942e9d4302f7776e81339ae25ce09a62 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> Inj1 x1 :e x0)).
admit.
Qed.
Theorem missingprop_219267f188d024efd66eafc845ecebe18fbe0d2f7334f1cc009aec407d26a1f3 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> Inj0 x1 :e x0)).
admit.
Qed.
Theorem missingprop_527cc5ff4380236ca54e2a0208bde8411cd2e1124e14f7764871099a03bebf91 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> setsum x1 x2 :e x0))).
admit.
Qed.
Theorem missingprop_d9ae82204b18e6cf15c85d865639887282bf3ebbe7f609859927820b6a09adb1 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> lam x1 x2 :e x0))).
admit.
Qed.
Theorem missingprop_168889ac2767512e36c59c4d8bc32e41d805ce681fce6d41f1fc82bd258fd1a7 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> setprod x1 x2 :e x0))).
admit.
Qed.
Axiom Sep_In_Power : (forall x0, forall x1 : set -> prop, Sep x0 x1 :e Power x0).
Theorem missingprop_6323045ebedfbecdac210168ec22c507cbdbf850a8b686493a31552efc6a28a8 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> Pi x1 x2 :e x0))).
admit.
Qed.
Theorem missingprop_2485261293fc9246221e480807168b56c614ccc7ff1e05b547a7c25cb11fc16e : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> setexp x2 x1 :e x0))).
admit.
Qed.
Axiom UnivOf_In : (forall x0, x0 :e UnivOf x0).
Theorem missingprop_0741fe2348d1702d161a58b64c02f323ed2a0247a811f6beb73a307268bec529 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p (fun x4 : set => x4 :e UnivOf 0) HomSet (fun x4 : set => lam x4 (fun x5 : set => x5)) (fun x4 x5 x6 x7 x8 : set => lam x4 (fun x9 : set => ap x7 (ap x8 x9))) x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_964635c6ddfd8117d0c48848e890e5bd51f691763eb265a430a567a4406a7502 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p (fun x4 : set => x4 :e UnivOf (UnivOf 0)) HomSet (fun x4 : set => lam x4 (fun x5 : set => x5)) (fun x4 x5 x6 x7 x8 : set => lam x4 (fun x9 : set => ap x7 (ap x8 x9))) x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom ZF_ordsucc_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e x0)).
Theorem missingprop_703b92d40ecd723980c17d67fc0f7f1ff4f9a975f8d97d701fc138d65d235eda : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p (fun x4 : set => x4 :e UnivOf 0) HomSet (fun x4 : set => lam x4 (fun x5 : set => x5)) (fun x4 x5 x6 x7 x8 : set => lam x4 (fun x9 : set => ap x7 (ap x8 x9))) x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_1f7930e4a84f0abf66a8631a79a75bad4308f520fd71548588ce641780adf1e0 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p (fun x4 : set => x4 :e UnivOf (UnivOf 0)) HomSet (fun x4 : set => lam x4 (fun x5 : set => x5)) (fun x4 x5 x6 x7 x8 : set => lam x4 (fun x9 : set => ap x7 (ap x8 x9))) x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_df899b7f089f31188395c67eee086d3bb63a01977fe467268600a8ed51865292 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p (fun x8 : set => x8 :e UnivOf 0) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_15e47c4df03b56c280c2c40875ac93a29c682865c9aaf758b6236b5102f1d6ad : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p (fun x8 : set => x8 :e UnivOf (UnivOf 0)) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_2bef5b7c61c75b3f8ecaa7255ce21428f762f8a068715762db11d6afe4856294 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p (fun x8 : set => x8 :e UnivOf 0) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_2285d1bd06ceba59ce81866c0787896a4118aa1855c2a51ed3015b76e34240aa : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p (fun x8 : set => x8 :e UnivOf (UnivOf 0)) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_cff14fdbf0584be7a699a339f2eaafa8a07ffe4086de52464d7ea1692ffedecd : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p x0 HomSet (fun x7 : set => lam x7 (fun x8 : set => x8)) (fun x7 x8 x9 x10 x11 : set => lam x7 (fun x12 : set => ap x10 (ap x11 x12))) x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Admitted.
Theorem missingprop_3ee8892084c5fc874cbbddccad8e497fa45eb697e7fe76d169f11738ae7f38ae : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p (fun x6 : set => True) HomSet (fun x6 : set => lam x6 (fun x7 : set => x7)) (fun x6 x7 x8 x9 x10 : set => lam x6 (fun x11 : set => ap x9 (ap x10 x11))) x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_9517d1a3106261ebe91f1194afd85d80a938581cd33d87087404e82e9a0f208c : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p (fun x6 : set => x6 :e UnivOf 0) HomSet (fun x6 : set => lam x6 (fun x7 : set => x7)) (fun x6 x7 x8 x9 x10 : set => lam x6 (fun x11 : set => ap x9 (ap x10 x11))) x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_1a66443f58fc8bf52b4c561d39f967bc853c41fd95e5eef4d8fa18c9716e1703 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p (fun x6 : set => x6 :e UnivOf (UnivOf 0)) HomSet (fun x6 : set => lam x6 (fun x7 : set => x7)) (fun x6 x7 x8 x9 x10 : set => lam x6 (fun x11 : set => ap x9 (ap x10 x11))) x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_e5eb5bf6f9207cff9a7438a5760c678315493a3abf4e1278ef0ae99d67ba064c : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p x0 HomSet (fun x7 : set => lam x7 (fun x8 : set => x8)) (fun x7 x8 x9 x10 x11 : set => lam x7 (fun x12 : set => ap x10 (ap x11 x12))) x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Admitted.
Theorem missingprop_4621f06d38e9c1716e3250c8a4d8e3a86a411e23d656feb334a894a3348ac0dc : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p (fun x7 : set => x7 :e UnivOf 0) HomSet (fun x7 : set => lam x7 (fun x8 : set => x8)) (fun x7 x8 x9 x10 x11 : set => lam x7 (fun x12 : set => ap x10 (ap x11 x12))) x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Admitted.
Theorem missingprop_45388248c8e51167d1f69092d81120d197c41165068cafc2deee1ee87c57188a : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p (fun x7 : set => x7 :e UnivOf (UnivOf 0)) HomSet (fun x7 : set => lam x7 (fun x8 : set => x8)) (fun x7 x8 x9 x10 x11 : set => lam x7 (fun x12 : set => ap x10 (ap x11 x12))) x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Admitted.
Theorem missingprop_6afd87d7e4857020d5b383915ff898de5ba8123078a2e99c3c54f0c2baf478e9 : (forall x0 : set -> prop, MetaCat x0 HomSet (fun x1 : set => lam x1 (fun x2 : set => x2)) (fun x1 x2 x3 x4 x5 : set => lam x1 (fun x6 : set => ap x4 (ap x5 x6))) -> (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setprod x1 x2))) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p x0 HomSet (fun x9 : set => lam x9 (fun x10 : set => x10)) (fun x9 x10 x11 x12 x13 : set => lam x9 (fun x14 : set => ap x12 (ap x13 x14))) x2 x4 x6 x8 -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Admitted.
Theorem missingprop_1b4f63360b7a240cfb39a7ce0edf348d43a11a1e4b64070c1efd20a22388ef16 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p (fun x8 : set => True) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_95dd7961c110d903951058a60a9dc8f89f8fe444e3ff90d31b117c2e3656d572 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p (fun x8 : set => x8 :e UnivOf 0) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_4f76227c02f96320ad1e276f842a31cec4ff44e80b664c0480b3cae156808230 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p (fun x8 : set => x8 :e UnivOf (UnivOf 0)) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_497cdcdc3c197a09105b0ff6f14972ba192a96f40cefdfa4009052859a0a5aeb : (forall x0 : set -> prop, MetaCat x0 HomSet (fun x1 : set => lam x1 (fun x2 : set => x2)) (fun x1 x2 x3 x4 x5 : set => lam x1 (fun x6 : set => ap x4 (ap x5 x6))) -> (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setsum x1 x2))) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p x0 HomSet (fun x9 : set => lam x9 (fun x10 : set => x10)) (fun x9 x10 x11 x12 x13 : set => lam x9 (fun x14 : set => ap x12 (ap x13 x14))) x2 x4 x6 x8 -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Admitted.
Theorem missingprop_ec6923333d2dcfe43aeefcd7aa707cd923cbd9a2064d3ba7e3d58fae1c21b6ef : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p (fun x8 : set => True) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_3cc3745eadcfec7c486430e930c804d3b81e0bfca28f1ea2f382f162c2274ef9 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p (fun x8 : set => x8 :e UnivOf 0) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_dd55ed291f92b810f880a8949aee034f052adaea83baa7a1f8cf99442afb8356 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p (fun x8 : set => x8 :e UnivOf (UnivOf 0)) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_b40aeb2280ed5b5f6cfc008c693c2c470333013194b5c64eb51414566ffc3356 : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setprod x1 x2))) -> (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setexp x2 x1))) -> MetaCat_exp_constr_p x0 HomSet (fun x1 : set => lam x1 (fun x2 : set => x2)) (fun x1 x2 x3 x4 x5 : set => lam x1 (fun x6 : set => ap x4 (ap x5 x6))) setprod (fun x1 x2 : set => lam (setprod x1 x2) (fun x3 : set => ap x3 0)) (fun x1 x2 : set => lam (setprod x1 x2) (fun x3 : set => ap x3 1)) (fun x1 x2 x3 x4 x5 : set => lam x3 (fun x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (ap x4 x6) (ap x5 x6)))) (fun x1 x2 : set => setexp x2 x1) (fun x1 x2 : set => lam (setprod (setexp x2 x1) x1) (fun x3 : set => ap (ap x3 0) (ap x3 1))) (fun x1 x2 x3 x4 : set => lam x3 (fun x5 : set => lam x1 (fun x6 : set => ap x4 (lam 2 (fun x7 : set => If_i (x7 = 0) x5 x6)))))).
Admitted.
Theorem missingprop_21624bff8869b979ae322816379cb8a4873e62cdca348f4a3ad261f529d7f7f3 : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setprod x1 x2))) -> (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setexp x2 x1))) -> (forall x1 : prop, (forall x2 : set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set, (forall x9 : prop, (forall x10 : set -> set -> set, (forall x11 : prop, (forall x12 : set -> set -> set, (forall x13 : prop, (forall x14 : set -> set -> set -> set -> set, MetaCat_exp_constr_p x0 HomSet (fun x15 : set => lam x15 (fun x16 : set => x16)) (fun x15 x16 x17 x18 x19 : set => lam x15 (fun x20 : set => ap x18 (ap x19 x20))) x2 x4 x6 x8 x10 x12 x14 -> x13) -> x13) -> x11) -> x11) -> x9) -> x9) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Admitted.
Theorem missingprop_57a8a76a23cb23cb3357979a3250b59696202c18728b07dc8c7f4522fdc7f9e9 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p (fun x14 : set => True) HomSet (fun x14 : set => lam x14 (fun x15 : set => x15)) (fun x14 x15 x16 x17 x18 : set => lam x14 (fun x19 : set => ap x17 (ap x18 x19))) x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_1fe36c407617ff5df568a92a389f37e6aa963b157429fbe59ee251ab1c1190b0 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p (fun x14 : set => x14 :e UnivOf 0) HomSet (fun x14 : set => lam x14 (fun x15 : set => x15)) (fun x14 x15 x16 x17 x18 : set => lam x14 (fun x19 : set => ap x17 (ap x18 x19))) x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_16e4aed1557e06d5c037e7c66c0df5ff6a6c1c58ee11553b5945daab7de342a5 : (forall x0 : set -> prop, forall x1 x2 x3, MetaCat_monic_p x0 HomSet (fun x4 : set => lam x4 (fun x5 : set => x5)) (fun x4 x5 x6 x7 x8 : set => lam x4 (fun x9 : set => ap x7 (ap x8 x9))) x1 x2 x3 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> ap x3 x4 = ap x3 x5 -> x4 = x5))).
Admitted.
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
Theorem missingprop_3f5122ee268dcd48b3ce7702addd7a66401116188ed409954781691024265d75 : (forall x0 : set -> prop, x0 1 -> x0 2 -> MetaCat_subobject_classifier_buggy_p x0 HomSet (fun x1 : set => lam x1 (fun x2 : set => x2)) (fun x1 x2 x3 x4 x5 : set => lam x1 (fun x6 : set => ap x4 (ap x5 x6))) 1 (fun x1 : set => lam x1 (fun x2 : set => 0)) 2 (lam 1 (fun x1 : set => 1)) (fun x1 x2 x3 : set => lam x2 (fun x4 : set => If_i (forall x5 : prop, (forall x6, and (x6 :e x1) (ap x3 x6 = x4) -> x5) -> x5) 1 0)) (fun x1 x2 x3 x4 x5 x6 : set => lam x4 (fun x7 : set => inv x1 (ap x3) (ap x6 x7)))).
Admitted.
Theorem missingprop_aca14f3709ff49d00c3cb26f7bec6d681b38d1208936cea85fc5085c1f4c68e1 : (forall x0 : set -> prop, x0 1 -> x0 2 -> (forall x1 : prop, (forall x2, (forall x3 : prop, (forall x4 : set -> set, (forall x5 : prop, (forall x6, (forall x7 : prop, (forall x8, (forall x9 : prop, (forall x10 : set -> set -> set -> set, (forall x11 : prop, (forall x12 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_buggy_p x0 HomSet (fun x13 : set => lam x13 (fun x14 : set => x14)) (fun x13 x14 x15 x16 x17 : set => lam x13 (fun x18 : set => ap x16 (ap x17 x18))) x2 x4 x6 x8 x10 x12 -> x11) -> x11) -> x9) -> x9) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Admitted.
Theorem missingprop_52f7597b9b14c26b8ec1189061c110c24b08a24a1eafccc54e97a332231a17a7 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_buggy_p (fun x12 : set => True) HomSet (fun x12 : set => lam x12 (fun x13 : set => x13)) (fun x12 x13 x14 x15 x16 : set => lam x12 (fun x17 : set => ap x15 (ap x16 x17))) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_45bd005ff8629d0ccf5a938dffa3c8299be729a63be3230541993fa7c529d6bf : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_buggy_p (fun x12 : set => x12 :e UnivOf 0) HomSet (fun x12 : set => lam x12 (fun x13 : set => x13)) (fun x12 x13 x14 x15 x16 : set => lam x12 (fun x17 : set => ap x15 (ap x16 x17))) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_c2f07a272596582f314ed2ba9d44aec0146ac38a0b84e227edbc0b3bf004f0bd : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_buggy_p (fun x12 : set => x12 :e UnivOf (UnivOf 0)) HomSet (fun x12 : set => lam x12 (fun x13 : set => x13)) (fun x12 x13 x14 x15 x16 : set => lam x12 (fun x17 : set => ap x15 (ap x16 x17))) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Theorem missingprop_0d4eb7aa99d7da80efa1a03a16c31a478efb87ae92e272f1d1f371fb9c255695 : (forall x0 : set -> prop, x0 1 -> x0 omega -> MetaCat_nno_p x0 HomSet (fun x1 : set => lam x1 (fun x2 : set => x2)) (fun x1 x2 x3 x4 x5 : set => lam x1 (fun x6 : set => ap x4 (ap x5 x6))) 1 (fun x1 : set => lam x1 (fun x2 : set => 0)) omega (lam 1 (fun x1 : set => 0)) (lam omega ordsucc) (fun x1 x2 x3 : set => lam omega (nat_primrec (ap x2 0) (fun x4 : set => ap x3)))).
Admitted.
Theorem missingprop_d680fdd06c32040d3d45531281479039b169d07b345b48d8e2e36e6f7b0b9303 : (forall x0 : set -> prop, x0 1 -> x0 omega -> (forall x1 : prop, (forall x2, (forall x3 : prop, (forall x4 : set -> set, (forall x5 : prop, (forall x6, (forall x7 : prop, (forall x8, (forall x9 : prop, (forall x10, (forall x11 : prop, (forall x12 : set -> set -> set -> set, MetaCat_nno_p x0 HomSet (fun x13 : set => lam x13 (fun x14 : set => x14)) (fun x13 x14 x15 x16 x17 : set => lam x13 (fun x18 : set => ap x16 (ap x17 x18))) x2 x4 x6 x8 x10 x12 -> x11) -> x11) -> x9) -> x9) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Admitted.
Theorem missingprop_a8a7ef8b3e9a24ceea3c6ec5e6c5e2470e83504b42f90588959c89d44feb530d : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p (fun x12 : set => True) HomSet (fun x12 : set => lam x12 (fun x13 : set => x13)) (fun x12 x13 x14 x15 x16 : set => lam x12 (fun x17 : set => ap x15 (ap x16 x17))) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
Theorem missingprop_aa9f7749a8e775f0248ab0ad179f04b916b0daacff3d18d7c2cab4e39f062ae3 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p (fun x12 : set => x12 :e UnivOf (UnivOf 0)) HomSet (fun x12 : set => lam x12 (fun x13 : set => x13)) (fun x12 x13 x14 x15 x16 : set => lam x12 (fun x17 : set => ap x15 (ap x16 x17))) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
