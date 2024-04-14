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
Theorem FalseE : False -> (forall x0 : prop, x0).
admit.
Qed.
Definition True : prop :=
 (forall x0 : prop, x0 -> x0).
Theorem TrueI : True.
admit.
Qed.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Theorem notI : (forall x0 : prop, (x0 -> False) -> not x0).
admit.
Qed.
Theorem notE : (forall x0 : prop, not x0 -> x0 -> False).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Theorem andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
admit.
Qed.
Theorem andEL : (forall x0 x1 : prop, and x0 x1 -> x0).
admit.
Qed.
Theorem andER : (forall x0 x1 : prop, and x0 x1 -> x1).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Theorem orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
admit.
Qed.
Theorem orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
admit.
Qed.
Theorem orE : (forall x0 x1 x2 : prop, (x0 -> x2) -> (x1 -> x2) -> or x0 x1 -> x2).
admit.
Qed.
Theorem and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
admit.
Qed.
Theorem and3E : (forall x0 x1 x2 : prop, and (and x0 x1) x2 -> (forall x3 : prop, (x0 -> x1 -> x2 -> x3) -> x3)).
admit.
Qed.
Theorem or3I1 : (forall x0 x1 x2 : prop, x0 -> or (or x0 x1) x2).
admit.
Qed.
Theorem or3I2 : (forall x0 x1 x2 : prop, x1 -> or (or x0 x1) x2).
admit.
Qed.
Theorem or3I3 : (forall x0 x1 x2 : prop, x2 -> or (or x0 x1) x2).
admit.
Qed.
Theorem or3E : (forall x0 x1 x2 : prop, or (or x0 x1) x2 -> (forall x3 : prop, (x0 -> x3) -> (x1 -> x3) -> (x2 -> x3) -> x3)).
admit.
Qed.
Theorem and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
admit.
Qed.
Theorem and4E : (forall x0 x1 x2 x3 : prop, and (and (and x0 x1) x2) x3 -> (forall x4 : prop, (x0 -> x1 -> x2 -> x3 -> x4) -> x4)).
admit.
Qed.
Theorem or4I1 : (forall x0 x1 x2 x3 : prop, x0 -> or (or (or x0 x1) x2) x3).
admit.
Qed.
Theorem or4I2 : (forall x0 x1 x2 x3 : prop, x1 -> or (or (or x0 x1) x2) x3).
admit.
Qed.
Theorem or4I3 : (forall x0 x1 x2 x3 : prop, x2 -> or (or (or x0 x1) x2) x3).
admit.
Qed.
Theorem or4I4 : (forall x0 x1 x2 x3 : prop, x3 -> or (or (or x0 x1) x2) x3).
admit.
Qed.
Theorem or4E : (forall x0 x1 x2 x3 : prop, or (or (or x0 x1) x2) x3 -> (forall x4 : prop, (x0 -> x4) -> (x1 -> x4) -> (x2 -> x4) -> (x3 -> x4) -> x4)).
admit.
Qed.
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Theorem iffEL : (forall x0 x1 : prop, iff x0 x1 -> x0 -> x1).
admit.
Qed.
Theorem iffER : (forall x0 x1 : prop, iff x0 x1 -> x1 -> x0).
admit.
Qed.
Theorem iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
admit.
Qed.
Theorem iff_refl : (forall x0 : prop, iff x0 x0).
admit.
Qed.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Eps_i_ax : (forall x0 : set -> prop, forall x1, x0 x1 -> x0 (Eps_i x0)).
Theorem Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
admit.
Qed.
Axiom prop_ext : (forall x0 x1 : prop, iff x0 x1 -> x0 = x1).
Theorem pred_ext : (forall x0 x1 : set -> prop, (forall x2, iff (x0 x2) (x1 x2)) -> x0 = x1).
admit.
Qed.
Theorem prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
admit.
Qed.
Theorem pred_ext_2 : (forall x0 x1 : set -> prop, (forall x2, x0 x2 -> x1 x2) -> (forall x2, x1 x2 -> x0 x2) -> x0 = x1).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Theorem Subq_ref : (forall x0, x0 c= x0).
admit.
Qed.
Theorem Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
admit.
Qed.
Theorem Subq_contra : (forall x0 x1 x2, x0 c= x1 -> nIn x2 x1 -> nIn x2 x0).
admit.
Qed.
Axiom EmptyAx : not (forall x0 : prop, (forall x1, x1 :e Empty -> x0) -> x0).
Theorem EmptyE : (forall x0, nIn x0 Empty).
admit.
Qed.
Theorem Subq_Empty : (forall x0, Empty c= x0).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem Empty_Subq_eq : (forall x0, x0 c= Empty -> x0 = Empty).
admit.
Qed.
Theorem Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = Empty).
admit.
Qed.
Axiom UnionEq : (forall x0 x1, iff (x1 :e Union x0) (forall x2 : prop, (forall x3, and (x1 :e x3) (x3 :e x0) -> x2) -> x2)).
Theorem UnionI : (forall x0 x1 x2, x1 :e x2 -> x2 :e x0 -> x1 :e Union x0).
admit.
Qed.
Theorem UnionE : (forall x0 x1, x1 :e Union x0 -> (forall x2 : prop, (forall x3, and (x1 :e x3) (x3 :e x0) -> x2) -> x2)).
admit.
Qed.
Theorem UnionE_impred : (forall x0 x1, x1 :e Union x0 -> (forall x2 : prop, (forall x3, x1 :e x3 -> x3 :e x0 -> x2) -> x2)).
admit.
Qed.
Theorem Union_Empty : Union Empty = Empty.
admit.
Qed.
Axiom PowerEq : (forall x0 x1, iff (x1 :e Power x0) (x1 c= x0)).
Theorem PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
admit.
Qed.
Theorem PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
admit.
Qed.
Theorem Power_Subq : (forall x0 x1, x0 c= x1 -> Power x0 c= Power x1).
admit.
Qed.
Theorem Empty_In_Power : (forall x0, Empty :e Power x0).
admit.
Qed.
Theorem Self_In_Power : (forall x0, x0 :e Power x0).
admit.
Qed.
Theorem Union_Power_Subq : (forall x0, Union (Power x0) c= x0).
admit.
Qed.
Theorem xm : (forall x0 : prop, or x0 (not x0)).
admit.
Qed.
Theorem dneg : (forall x0 : prop, not (not x0) -> x0).
admit.
Qed.
Theorem imp_not_or : (forall x0 x1 : prop, (x0 -> x1) -> or (not x0) x1).
admit.
Qed.
Theorem not_and_or_demorgan : (forall x0 x1 : prop, not (and x0 x1) -> or (not x0) (not x1)).
admit.
Qed.
Definition exactly1of2 : prop -> prop -> prop :=
 (fun x0 x1 : prop => or (and x0 (not x1)) (and (not x0) x1)).
Theorem exactly1of2_I1 : (forall x0 x1 : prop, x0 -> not x1 -> exactly1of2 x0 x1).
admit.
Qed.
Theorem exactly1of2_I2 : (forall x0 x1 : prop, not x0 -> x1 -> exactly1of2 x0 x1).
admit.
Qed.
Theorem exactly1of2_impI1 : (forall x0 x1 : prop, (x0 -> not x1) -> (not x0 -> x1) -> exactly1of2 x0 x1).
admit.
Qed.
Theorem exactly1of2_impI2 : (forall x0 x1 : prop, (x1 -> not x0) -> (not x1 -> x0) -> exactly1of2 x0 x1).
admit.
Qed.
Theorem exactly1of2_E : (forall x0 x1 : prop, exactly1of2 x0 x1 -> (forall x2 : prop, (x0 -> not x1 -> x2) -> (not x0 -> x1 -> x2) -> x2)).
admit.
Qed.
Theorem exactly1of2_or : (forall x0 x1 : prop, exactly1of2 x0 x1 -> or x0 x1).
admit.
Qed.
Theorem exactly1of2_impn12 : (forall x0 x1 : prop, exactly1of2 x0 x1 -> x0 -> not x1).
admit.
Qed.
Theorem exactly1of2_impn21 : (forall x0 x1 : prop, exactly1of2 x0 x1 -> x1 -> not x0).
admit.
Qed.
Theorem exactly1of2_nimp12 : (forall x0 x1 : prop, exactly1of2 x0 x1 -> not x0 -> x1).
admit.
Qed.
Theorem exactly1of2_nimp21 : (forall x0 x1 : prop, exactly1of2 x0 x1 -> not x1 -> x0).
admit.
Qed.
Definition exactly1of3 : prop -> prop -> prop -> prop :=
 (fun x0 x1 x2 : prop => or (and (exactly1of2 x0 x1) (not x2)) (and (and (not x0) (not x1)) x2)).
Theorem exactly1of3_I1 : (forall x0 x1 x2 : prop, x0 -> not x1 -> not x2 -> exactly1of3 x0 x1 x2).
admit.
Qed.
Theorem exactly1of3_I2 : (forall x0 x1 x2 : prop, not x0 -> x1 -> not x2 -> exactly1of3 x0 x1 x2).
admit.
Qed.
Theorem exactly1of3_I3 : (forall x0 x1 x2 : prop, not x0 -> not x1 -> x2 -> exactly1of3 x0 x1 x2).
admit.
Qed.
Theorem exactly1of3_impI1 : (forall x0 x1 x2 : prop, (x0 -> not x1) -> (x0 -> not x2) -> (x1 -> not x2) -> (not x0 -> or x1 x2) -> exactly1of3 x0 x1 x2).
admit.
Qed.
Theorem exactly1of3_impI2 : (forall x0 x1 x2 : prop, (x1 -> not x0) -> (x1 -> not x2) -> (x0 -> not x2) -> (not x1 -> or x0 x2) -> exactly1of3 x0 x1 x2).
admit.
Qed.
Theorem exactly1of3_impI3 : (forall x0 x1 x2 : prop, (x2 -> not x0) -> (x2 -> not x1) -> (x0 -> not x1) -> (not x0 -> x1) -> exactly1of3 x0 x1 x2).
admit.
Qed.
Theorem exactly1of3_E : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> (forall x3 : prop, (x0 -> not x1 -> not x2 -> x3) -> (not x0 -> x1 -> not x2 -> x3) -> (not x0 -> not x1 -> x2 -> x3) -> x3)).
admit.
Qed.
Theorem exactly1of3_or : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> or (or x0 x1) x2).
admit.
Qed.
Theorem exactly1of3_impn12 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x0 -> not x1).
admit.
Qed.
Theorem exactly1of3_impn13 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x0 -> not x2).
admit.
Qed.
Theorem exactly1of3_impn21 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x1 -> not x0).
admit.
Qed.
Theorem exactly1of3_impn23 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x1 -> not x2).
admit.
Qed.
Theorem exactly1of3_impn31 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x2 -> not x0).
admit.
Qed.
Theorem exactly1of3_impn32 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> x2 -> not x1).
admit.
Qed.
Theorem exactly1of3_nimp1 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> not x0 -> or x1 x2).
admit.
Qed.
Theorem exactly1of3_nimp2 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> not x1 -> or x0 x2).
admit.
Qed.
Theorem exactly1of3_nimp3 : (forall x0 x1 x2 : prop, exactly1of3 x0 x1 x2 -> not x2 -> or x0 x1).
admit.
Qed.
Axiom ReplEq : (forall x0, forall x1 : set -> set, forall x2, iff (x2 :e Repl x0 x1) (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = x1 x4) -> x3) -> x3)).
Theorem ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
admit.
Qed.
Theorem ReplE : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = x1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
admit.
Qed.
Theorem Repl_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (Repl Empty x0) Empty -> x1 Empty (Repl Empty x0)).
admit.
Qed.
Theorem ReplEq_ext_sub : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Repl x0 x1 c= Repl x0 x2).
admit.
Qed.
Theorem ReplEq_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Repl x0 x1 = Repl x0 x2).
admit.
Qed.
Definition If_i : prop -> set -> set -> set :=
 (fun x0 : prop => fun x1 x2 : set => Eps_i (fun x3 : set => or (and x0 (x3 = x1)) (and (not x0) (x3 = x2)))).
Theorem If_i_correct : (forall x0 : prop, forall x1 x2, or (and x0 (If_i x0 x1 x2 = x1)) (and (not x0) (If_i x0 x1 x2 = x2))).
admit.
Qed.
Theorem If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
admit.
Qed.
Theorem If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
admit.
Qed.
Theorem If_i_or : (forall x0 : prop, forall x1 x2, or (If_i x0 x1 x2 = x1) (If_i x0 x1 x2 = x2)).
admit.
Qed.
Theorem If_i_eta : (forall x0 : prop, forall x1, forall x2 : set -> set -> prop, x2 (If_i x0 x1 x1) x1 -> x2 x1 (If_i x0 x1 x1)).
admit.
Qed.
Definition UPair : set -> set -> set :=
 (fun x0 x1 : set => {If_i (Empty :e x2) x0 x1 | x2 :e Power (Power Empty)}).
Theorem UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
admit.
Qed.
Theorem UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
admit.
Qed.
Theorem UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
admit.
Qed.
Theorem missingprop_41df03d7391f8ab64a94521b5b73d37be1e15da3e6364796447f828200c63f8e : (forall x0 x1, UPair x0 x1 c= UPair x1 x0).
admit.
Qed.
Theorem UPair_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (UPair x0 x1) (UPair x1 x0) -> x2 (UPair x1 x0) (UPair x0 x1)).
admit.
Qed.
Definition Sing : set -> set :=
 (fun x0 : set => UPair x0 x0).
Theorem SingI : (forall x0, x0 :e Sing x0).
admit.
Qed.
Theorem SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
admit.
Qed.
Definition binunion : set -> set -> set :=
 (fun x0 x1 : set => Union (UPair x0 x1)).
Theorem binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
admit.
Qed.
Theorem binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
admit.
Qed.
Theorem binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
admit.
Qed.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Theorem Power_0_Sing_0 : Power Empty = Sing Empty.
admit.
Qed.
Theorem Repl_UPair : (forall x0 : set -> set, forall x1 x2, forall x3 : set -> set -> prop, x3 (Repl (UPair x1 x2) x0) (UPair (x0 x1) (x0 x2)) -> x3 (UPair (x0 x1) (x0 x2)) (Repl (UPair x1 x2) x0)).
admit.
Qed.
Theorem Repl_Sing : (forall x0 : set -> set, forall x1, forall x2 : set -> set -> prop, x2 (Repl (Sing x1) x0) (Sing (x0 x1)) -> x2 (Sing (x0 x1)) (Repl (Sing x1) x0)).
admit.
Qed.
Definition famunion : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => Union (Repl x0 x1)).
Theorem famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
admit.
Qed.
Theorem famunionE : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 :e x1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
admit.
Qed.
Theorem UnionEq_famunionId : (forall x0, forall x1 : set -> set -> prop, x1 (Union x0) (famunion x0 (fun x2 : set => x2)) -> x1 (famunion x0 (fun x2 : set => x2)) (Union x0)).
admit.
Qed.
Theorem ReplEq_famunion_Sing : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (Repl x0 x1) (famunion x0 (fun x3 : set => Sing (x1 x3))) -> x2 (famunion x0 (fun x3 : set => Sing (x1 x3))) (Repl x0 x1)).
admit.
Qed.
Theorem Power_Sing : (forall x0, forall x1 : set -> set -> prop, x1 (Power (Sing x0)) (UPair Empty (Sing x0)) -> x1 (UPair Empty (Sing x0)) (Power (Sing x0))).
admit.
Qed.
Theorem Power_Sing_0 : Power (Sing Empty) = UPair Empty (Sing Empty).
admit.
Qed.
Definition Sep : set -> (set -> prop) -> set :=
 (fun x0 : set => fun x1 : set -> prop => If_i (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 x3) -> x2) -> x2) {If_i (x1 x2) x2 (Eps_i (fun x3 : set => and (x3 :e x0) (x1 x3))) | x2 :e x0} Empty).
Theorem SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
admit.
Qed.
Theorem SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
admit.
Qed.
Theorem SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
admit.
Qed.
Theorem SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
admit.
Qed.
Theorem Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
admit.
Qed.
Theorem Sep_In_Power : (forall x0, forall x1 : set -> prop, Sep x0 x1 :e Power x0).
admit.
Qed.
Definition ReplSep : set -> (set -> prop) -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> prop => Repl (Sep x0 x1)).
Theorem ReplSepI : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e x0 -> x1 x3 -> x2 x3 :e ReplSep x0 x1 x2).
admit.
Qed.
Theorem ReplSepE : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, and (and (x5 :e x0) (x1 x5)) (x3 = x2 x5) -> x4) -> x4)).
admit.
Qed.
Theorem ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
admit.
Qed.
Definition ReplSep2 : set -> (set -> set) -> (set -> set -> prop) -> (set -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => fun x2 : set -> set -> prop => fun x3 : set -> set -> set => Union {ReplSep (x1 x4) (x2 x4) (x3 x4) | x4 :e x0}).
Theorem ReplSep2I : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, forall x3 : set -> set -> set, forall x4, x4 :e x0 -> (forall x5, x5 :e x1 x4 -> x2 x4 x5 -> x3 x4 x5 :e ReplSep2 x0 x1 x2 x3)).
admit.
Qed.
Theorem ReplSep2E_impred : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, forall x3 : set -> set -> set, forall x4, x4 :e ReplSep2 x0 x1 x2 x3 -> (forall x5 : prop, (forall x6, x6 :e x0 -> (forall x7, x7 :e x1 x6 -> x2 x6 x7 -> x4 = x3 x6 x7 -> x5)) -> x5)).
admit.
Qed.
Theorem ReplSep2E : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, forall x3 : set -> set -> set, forall x4, x4 :e ReplSep2 x0 x1 x2 x3 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (forall x7 : prop, (forall x8, and (x8 :e x1 x6) (and (x2 x6 x8) (x4 = x3 x6 x8)) -> x7) -> x7) -> x5) -> x5)).
admit.
Qed.
Theorem binunion_asso : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (binunion x0 (binunion x1 x2)) (binunion (binunion x0 x1) x2) -> x3 (binunion (binunion x0 x1) x2) (binunion x0 (binunion x1 x2))).
admit.
Qed.
Theorem binunion_com_Subq : (forall x0 x1, binunion x0 x1 c= binunion x1 x0).
admit.
Qed.
Theorem binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
admit.
Qed.
Theorem binunion_idl : (forall x0, forall x1 : set -> set -> prop, x1 (binunion Empty x0) x0 -> x1 x0 (binunion Empty x0)).
admit.
Qed.
Theorem binunion_idr : (forall x0, forall x1 : set -> set -> prop, x1 (binunion x0 Empty) x0 -> x1 x0 (binunion x0 Empty)).
admit.
Qed.
Theorem binunion_idem : (forall x0, forall x1 : set -> set -> prop, x1 (binunion x0 x0) x0 -> x1 x0 (binunion x0 x0)).
admit.
Qed.
Theorem binunion_Subq_1 : (forall x0 x1, x0 c= binunion x0 x1).
admit.
Qed.
Theorem binunion_Subq_2 : (forall x0 x1, x1 c= binunion x0 x1).
admit.
Qed.
Theorem binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
admit.
Qed.
Theorem Subq_binunion_eq : (forall x0 x1, forall x2 : prop -> prop -> prop, x2 (x0 c= x1) (binunion x0 x1 = x1) -> x2 (binunion x0 x1 = x1) (x0 c= x1)).
admit.
Qed.
Theorem binunion_nIn_I : (forall x0 x1 x2, nIn x2 x0 -> nIn x2 x1 -> nIn x2 (binunion x0 x1)).
admit.
Qed.
Theorem binunion_nIn_E : (forall x0 x1 x2, nIn x2 (binunion x0 x1) -> and (nIn x2 x0) (nIn x2 x1)).
admit.
Qed.
Definition binintersect : set -> set -> set :=
 (fun x0 x1 : set => Sep x0 (fun x2 : set => x2 :e x1)).
Theorem binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
admit.
Qed.
Theorem binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
admit.
Qed.
Theorem binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
admit.
Qed.
Theorem binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
admit.
Qed.
Theorem binintersect_Subq_1 : (forall x0 x1, binintersect x0 x1 c= x0).
admit.
Qed.
Theorem binintersect_Subq_2 : (forall x0 x1, binintersect x0 x1 c= x1).
admit.
Qed.
Theorem binintersect_Subq_eq_1 : (forall x0 x1, x0 c= x1 -> binintersect x0 x1 = x0).
admit.
Qed.
Theorem binintersect_Subq_max : (forall x0 x1 x2, x2 c= x0 -> x2 c= x1 -> x2 c= binintersect x0 x1).
admit.
Qed.
Theorem binintersect_asso : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (binintersect x0 (binintersect x1 x2)) (binintersect (binintersect x0 x1) x2) -> x3 (binintersect (binintersect x0 x1) x2) (binintersect x0 (binintersect x1 x2))).
admit.
Qed.
Theorem binintersect_com_Subq : (forall x0 x1, binintersect x0 x1 c= binintersect x1 x0).
admit.
Qed.
Theorem binintersect_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binintersect x0 x1) (binintersect x1 x0) -> x2 (binintersect x1 x0) (binintersect x0 x1)).
admit.
Qed.
Theorem binintersect_annil : (forall x0, forall x1 : set -> set -> prop, x1 (binintersect Empty x0) Empty -> x1 Empty (binintersect Empty x0)).
admit.
Qed.
Theorem binintersect_annir : (forall x0, forall x1 : set -> set -> prop, x1 (binintersect x0 Empty) Empty -> x1 Empty (binintersect x0 Empty)).
admit.
Qed.
Theorem binintersect_idem : (forall x0, forall x1 : set -> set -> prop, x1 (binintersect x0 x0) x0 -> x1 x0 (binintersect x0 x0)).
admit.
Qed.
Theorem binintersect_binunion_distr : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (binintersect x0 (binunion x1 x2)) (binunion (binintersect x0 x1) (binintersect x0 x2)) -> x3 (binunion (binintersect x0 x1) (binintersect x0 x2)) (binintersect x0 (binunion x1 x2))).
admit.
Qed.
Theorem binunion_binintersect_distr : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (binunion x0 (binintersect x1 x2)) (binintersect (binunion x0 x1) (binunion x0 x2)) -> x3 (binintersect (binunion x0 x1) (binunion x0 x2)) (binunion x0 (binintersect x1 x2))).
admit.
Qed.
Theorem Subq_binintersection_eq : (forall x0 x1, forall x2 : prop -> prop -> prop, x2 (x0 c= x1) (binintersect x0 x1 = x0) -> x2 (binintersect x0 x1 = x0) (x0 c= x1)).
admit.
Qed.
Theorem binintersect_nIn_I1 : (forall x0 x1 x2, nIn x2 x0 -> nIn x2 (binintersect x0 x1)).
admit.
Qed.
Theorem binintersect_nIn_I2 : (forall x0 x1 x2, nIn x2 x1 -> nIn x2 (binintersect x0 x1)).
admit.
Qed.
Theorem binintersect_nIn_E : (forall x0 x1 x2, nIn x2 (binintersect x0 x1) -> or (nIn x2 x0) (nIn x2 x1)).
admit.
Qed.
Definition setminus : set -> set -> set :=
 (fun x0 x1 : set => Sep x0 (fun x2 : set => nIn x2 x1)).
Theorem setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
admit.
Qed.
Theorem setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
admit.
Qed.
Theorem setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
admit.
Qed.
Theorem setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
admit.
Qed.
Theorem setminus_Subq : (forall x0 x1, setminus x0 x1 c= x0).
admit.
Qed.
Theorem setminus_Subq_contra : (forall x0 x1 x2, x2 c= x1 -> setminus x0 x1 c= setminus x0 x2).
admit.
Qed.
Theorem setminus_nIn_I1 : (forall x0 x1 x2, nIn x2 x0 -> nIn x2 (setminus x0 x1)).
admit.
Qed.
Theorem setminus_nIn_I2 : (forall x0 x1 x2, x2 :e x1 -> nIn x2 (setminus x0 x1)).
admit.
Qed.
Theorem setminus_nIn_E : (forall x0 x1 x2, nIn x2 (setminus x0 x1) -> or (nIn x2 x0) (x2 :e x1)).
admit.
Qed.
Theorem setminus_selfannih : (forall x0, forall x1 : set -> set -> prop, x1 (setminus x0 x0) Empty -> x1 Empty (setminus x0 x0)).
admit.
Qed.
Theorem setminus_binintersect : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (setminus x0 (binintersect x1 x2)) (binunion (setminus x0 x1) (setminus x0 x2)) -> x3 (binunion (setminus x0 x1) (setminus x0 x2)) (setminus x0 (binintersect x1 x2))).
admit.
Qed.
Theorem setminus_binunion : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (setminus x0 (binunion x1 x2)) (setminus (setminus x0 x1) x2) -> x3 (setminus (setminus x0 x1) x2) (setminus x0 (binunion x1 x2))).
admit.
Qed.
Theorem binintersect_setminus : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (setminus (binintersect x0 x1) x2) (binintersect x0 (setminus x1 x2)) -> x3 (binintersect x0 (setminus x1 x2)) (setminus (binintersect x0 x1) x2)).
admit.
Qed.
Theorem binunion_setminus : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (setminus (binunion x0 x1) x2) (binunion (setminus x0 x2) (setminus x1 x2)) -> x3 (binunion (setminus x0 x2) (setminus x1 x2)) (setminus (binunion x0 x1) x2)).
admit.
Qed.
Theorem setminus_setminus : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (setminus x0 (setminus x1 x2)) (binunion (setminus x0 x1) (binintersect x0 x2)) -> x3 (binunion (setminus x0 x1) (binintersect x0 x2)) (setminus x0 (setminus x1 x2))).
admit.
Qed.
Theorem setminus_annil : (forall x0, forall x1 : set -> set -> prop, x1 (setminus Empty x0) Empty -> x1 Empty (setminus Empty x0)).
admit.
Qed.
Theorem setminus_idr : (forall x0, forall x1 : set -> set -> prop, x1 (setminus x0 Empty) x0 -> x1 x0 (setminus x0 Empty)).
admit.
Qed.
Axiom In_ind : (forall x0 : set -> prop, (forall x1, (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, x0 x1)).
Theorem In_irref : (forall x0, nIn x0 x0).
admit.
Qed.
Theorem In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
admit.
Qed.
Theorem In_no3cycle : (forall x0 x1 x2, x0 :e x1 -> x1 :e x2 -> x2 :e x0 -> False).
admit.
Qed.
Definition ordsucc : set -> set :=
 (fun x0 : set => binunion x0 (Sing x0)).
Notation Nat Empty ordsucc.
Theorem ordsuccI1 : (forall x0, x0 c= ordsucc x0).
admit.
Qed.
Theorem ordsuccI2 : (forall x0, x0 :e ordsucc x0).
admit.
Qed.
Theorem ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
admit.
Qed.
Theorem neq_0_ordsucc : (forall x0, 0 = ordsucc x0 -> (forall x1 : prop, x1)).
admit.
Qed.
Theorem neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
admit.
Qed.
Theorem neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
admit.
Qed.
Theorem ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
admit.
Qed.
Theorem In_0_1 : 0 :e 1.
admit.
Qed.
Theorem In_0_2 : 0 :e 2.
admit.
Qed.
Theorem In_1_2 : 1 :e 2.
admit.
Qed.
Definition nat_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, x1 0 -> (forall x2, x1 x2 -> x1 (ordsucc x2)) -> x1 x0).
Theorem nat_0 : nat_p 0.
admit.
Qed.
Theorem nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
admit.
Qed.
Theorem nat_1 : nat_p 1.
admit.
Qed.
Theorem nat_2 : nat_p 2.
admit.
Qed.
Theorem nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
admit.
Qed.
Theorem nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
admit.
Qed.
Theorem nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
admit.
Qed.
Theorem nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
admit.
Qed.
Theorem nat_complete_ind : (forall x0 : set -> prop, (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, nat_p x1 -> x0 x1)).
admit.
Qed.
Theorem nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
admit.
Qed.
Theorem nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
admit.
Qed.
Theorem nat_ordsucc_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e ordsucc x0 -> x1 c= x0)).
admit.
Qed.
Theorem Union_ordsucc_eq : (forall x0, nat_p x0 -> Union (ordsucc x0) = x0).
admit.
Qed.
Definition Union_closed : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> Union x1 :e x0).
Definition Power_closed : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> Power x1 :e x0).
Definition Repl_closed : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> Repl x1 x2 :e x0)).
Definition ZF_closed : set -> prop :=
 (fun x0 : set => and (and (Union_closed x0) (Power_closed x0)) (Repl_closed x0)).
Theorem ZF_closed_I : (forall x0, Union_closed x0 -> Power_closed x0 -> Repl_closed x0 -> ZF_closed x0).
admit.
Qed.
Theorem ZF_closed_E : (forall x0, ZF_closed x0 -> (forall x1 : prop, (Union_closed x0 -> Power_closed x0 -> Repl_closed x0 -> x1) -> x1)).
admit.
Qed.
Theorem ZF_Union_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> Union x1 :e x0)).
admit.
Qed.
Theorem ZF_Power_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> Power x1 :e x0)).
admit.
Qed.
Theorem ZF_Repl_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> Repl x1 x2 :e x0))).
admit.
Qed.
Theorem ZF_UPair_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> UPair x1 x2 :e x0))).
admit.
Qed.
Theorem ZF_Sing_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> Sing x1 :e x0)).
admit.
Qed.
Theorem ZF_binunion_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> binunion x1 x2 :e x0))).
admit.
Qed.
Theorem ZF_ordsucc_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e x0)).
admit.
Qed.
Axiom UnivOf_In : (forall x0, x0 :e UnivOf x0).
Axiom UnivOf_ZF_closed : (forall x0, ZF_closed (UnivOf x0)).
Theorem nat_p_UnivOf_Empty : (forall x0, nat_p x0 -> x0 :e UnivOf 0).
admit.
Qed.
Definition omega : set :=
 Sep (UnivOf 0) nat_p.
Theorem omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
admit.
Qed.
Theorem nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
admit.
Qed.
Theorem omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
admit.
Qed.
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Theorem ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
admit.
Qed.
Theorem ordinal_In_TransSet : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> TransSet x1)).
admit.
Qed.
Theorem ordinal_Empty : ordinal 0.
admit.
Qed.
Theorem ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
admit.
Qed.
Theorem TransSet_ordsucc : (forall x0, TransSet x0 -> TransSet (ordsucc x0)).
admit.
Qed.
Theorem ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
admit.
Qed.
Theorem nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
admit.
Qed.
Theorem ordinal_1 : ordinal 1.
admit.
Qed.
Theorem ordinal_2 : ordinal 2.
admit.
Qed.
Theorem omega_TransSet : TransSet omega.
admit.
Qed.
Theorem omega_ordinal : ordinal omega.
admit.
Qed.
Theorem ordsucc_omega_ordinal : ordinal (ordsucc omega).
admit.
Qed.
Theorem TransSet_ordsucc_In_Subq : (forall x0, TransSet x0 -> (forall x1, x1 :e x0 -> ordsucc x1 c= x0)).
admit.
Qed.
Theorem ordinal_ordsucc_In_Subq : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 c= x0)).
admit.
Qed.
Theorem ordinal_trichotomy_or : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (or (x0 :e x1) (x0 = x1)) (x1 :e x0)).
admit.
Qed.
Theorem ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
admit.
Qed.
Theorem ordinal_linear : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 c= x1) (x1 c= x0)).
admit.
Qed.
Theorem ordinal_ordsucc_In_eq : (forall x0 x1, ordinal x0 -> x1 :e x0 -> or (ordsucc x1 :e x0) (x0 = ordsucc x1)).
admit.
Qed.
Theorem ordinal_lim_or_succ : (forall x0, ordinal x0 -> or (forall x1, x1 :e x0 -> ordsucc x1 :e x0) (forall x1 : prop, (forall x2, and (x2 :e x0) (x0 = ordsucc x2) -> x1) -> x1)).
admit.
Qed.
Theorem ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
admit.
Qed.
Theorem ordinal_Union : (forall x0, (forall x1, x1 :e x0 -> ordinal x1) -> ordinal (Union x0)).
admit.
Qed.
Theorem ordinal_famunion : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> ordinal (x1 x2)) -> ordinal (famunion x0 x1)).
admit.
Qed.
Theorem ordinal_binintersect : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binintersect x0 x1)).
admit.
Qed.
Theorem ordinal_binunion : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binunion x0 x1)).
admit.
Qed.
Theorem ordinal_Sep : (forall x0, ordinal x0 -> (forall x1 : set -> prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x2 -> x1 x2 -> x1 x3)) -> ordinal (Sep x0 x1))).
admit.
Qed.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition surj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Definition inv : set -> (set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set => fun x2 : set => Eps_i (fun x3 : set => and (x3 :e x0) (x1 x3 = x2))).
Theorem surj_rinv : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> (forall x3, x3 :e x1 -> and (inv x0 x2 x3 :e x0) (x2 (inv x0 x2 x3) = x3))).
admit.
Qed.
Theorem missingprop_f9fc2fb6cfb4eb217cfd90f255fb35b64bd1729aa515ae6c662014a80909baf4 : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x0 -> inv x0 x2 (x2 x3) = x3)).
admit.
Qed.
Theorem bij_inv : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> bij x1 x0 (inv x0 x2)).
admit.
Qed.
Theorem bij_comp : (forall x0 x1 x2, forall x3 x4 : set -> set, bij x0 x1 x3 -> bij x1 x2 x4 -> bij x0 x2 (fun x5 : set => x4 (x3 x5))).
admit.
Qed.
Theorem bij_id : (forall x0, bij x0 x0 (fun x1 : set => x1)).
admit.
Qed.
Theorem bij_inj : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> inj x0 x1 x2).
admit.
Qed.
Theorem bij_surj : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> surj x0 x1 x2).
admit.
Qed.
Theorem inj_surj_bij : (forall x0 x1, forall x2 : set -> set, inj x0 x1 x2 -> surj x0 x1 x2 -> bij x0 x1 x2).
admit.
Qed.
Theorem surj_inv_inj : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> inj x1 x0 (inv x0 x2)).
admit.
Qed.
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Definition finite : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (equip x0 x2) -> x1) -> x1).
Definition infinite : set -> prop :=
 (fun x0 : set => not (finite x0)).
