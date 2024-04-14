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
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_ind : (forall x0 : set -> prop, (forall x1, (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, x0 x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem missingprop_410dc1ab3df64673c0b96231a2ce63d10324ed7db710c7c2792f880b9d537830 : (forall x0 x1 x2, x0 :e x1 -> x1 :e x2 -> nIn x2 x0).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom Eps_i_ax : (forall x0 : set -> prop, forall x1, x0 x1 -> x0 (Eps_i x0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem Eps_i_set_R : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> and (Eps_i (fun x3 : set => and (x3 :e x0) (x1 x3)) :e x0) (x1 (Eps_i (fun x3 : set => and (x3 :e x0) (x1 x3))))).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition If_i : prop -> set -> set -> set :=
 (fun x0 : prop => fun x1 x2 : set => Eps_i (fun x3 : set => or (and x0 (x3 = x1)) (and (not x0) (x3 = x2)))).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom If_i_correct : (forall x0 : prop, forall x1 x2, or (and x0 (If_i x0 x1 x2 = x1)) (and (not x0) (If_i x0 x1 x2 = x2))).
Axiom andEL : (forall x0 x1 : prop, and x0 x1 -> x0).
Axiom andER : (forall x0 x1 : prop, and x0 x1 -> x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom If_i_or : (forall x0 : prop, forall x1 x2, or (If_i x0 x1 x2 = x1) (If_i x0 x1 x2 = x2)).
Axiom If_i_eta : (forall x0 : prop, forall x1, forall x2 : set -> set -> prop, x2 (If_i x0 x1 x1) x1 -> x2 x1 (If_i x0 x1 x1)).
Theorem exandE_ii : (forall x0 x1 : (set -> set) -> prop, (forall x2 : prop, (forall x3 : set -> set, and (x0 x3) (x1 x3) -> x2) -> x2) -> (forall x2 : prop, (forall x3 : set -> set, x0 x3 -> x1 x3 -> x2) -> x2)).
admit.
Qed.
Theorem exandE_iii : (forall x0 x1 : (set -> set -> set) -> prop, (forall x2 : prop, (forall x3 : set -> set -> set, and (x0 x3) (x1 x3) -> x2) -> x2) -> (forall x2 : prop, (forall x3 : set -> set -> set, x0 x3 -> x1 x3 -> x2) -> x2)).
admit.
Qed.
Theorem exandE_iiii : (forall x0 x1 : (set -> set -> set -> set) -> prop, (forall x2 : prop, (forall x3 : set -> set -> set -> set, and (x0 x3) (x1 x3) -> x2) -> x2) -> (forall x2 : prop, (forall x3 : set -> set -> set -> set, x0 x3 -> x1 x3 -> x2) -> x2)).
admit.
Qed.
Theorem exandE_iio : (forall x0 x1 : (set -> set -> prop) -> prop, (forall x2 : prop, (forall x3 : set -> set -> prop, and (x0 x3) (x1 x3) -> x2) -> x2) -> (forall x2 : prop, (forall x3 : set -> set -> prop, x0 x3 -> x1 x3 -> x2) -> x2)).
admit.
Qed.
Theorem exandE_iiio : (forall x0 x1 : (set -> set -> set -> prop) -> prop, (forall x2 : prop, (forall x3 : set -> set -> set -> prop, and (x0 x3) (x1 x3) -> x2) -> x2) -> (forall x2 : prop, (forall x3 : set -> set -> set -> prop, x0 x3 -> x1 x3 -> x2) -> x2)).
admit.
Qed.
Definition Descr_ii : ((set -> set) -> prop) -> set -> set :=
 (fun x0 : (set -> set) -> prop => fun x1 : set => Eps_i (fun x2 : set => forall x3 : set -> set, x0 x3 -> x3 x1 = x2)).
Theorem Descr_ii_prop : (forall x0 : (set -> set) -> prop, (forall x1 : prop, (forall x2 : set -> set, x0 x2 -> x1) -> x1) -> (forall x1 x2 : set -> set, x0 x1 -> x0 x2 -> x1 = x2) -> x0 (Descr_ii x0)).
admit.
Qed.
Definition Descr_iii : ((set -> set -> set) -> prop) -> set -> set -> set :=
 (fun x0 : (set -> set -> set) -> prop => fun x1 x2 : set => Eps_i (fun x3 : set => forall x4 : set -> set -> set, x0 x4 -> x4 x1 x2 = x3)).
Theorem Descr_iii_prop : (forall x0 : (set -> set -> set) -> prop, (forall x1 : prop, (forall x2 : set -> set -> set, x0 x2 -> x1) -> x1) -> (forall x1 x2 : set -> set -> set, x0 x1 -> x0 x2 -> x1 = x2) -> x0 (Descr_iii x0)).
admit.
Qed.
Definition Descr_iio : ((set -> set -> prop) -> prop) -> set -> set -> prop :=
 (fun x0 : (set -> set -> prop) -> prop => fun x1 x2 : set => forall x3 : set -> set -> prop, x0 x3 -> x3 x1 x2).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Theorem Descr_iio_prop : (forall x0 : (set -> set -> prop) -> prop, (forall x1 : prop, (forall x2 : set -> set -> prop, x0 x2 -> x1) -> x1) -> (forall x1 x2 : set -> set -> prop, x0 x1 -> x0 x2 -> x1 = x2) -> x0 (Descr_iio x0)).
admit.
Qed.
Definition Descr_Vo1 : ((set -> prop) -> prop) -> set -> prop :=
 (fun x0 : (set -> prop) -> prop => fun x1 : set => forall x2 : set -> prop, x0 x2 -> x2 x1).
Theorem Descr_Vo1_prop : (forall x0 : (set -> prop) -> prop, (forall x1 : prop, (forall x2 : set -> prop, x0 x2 -> x1) -> x1) -> (forall x1 x2 : set -> prop, x0 x1 -> x0 x2 -> x1 = x2) -> x0 (Descr_Vo1 x0)).
admit.
Qed.
Definition Descr_Vo2 : (((set -> prop) -> prop) -> prop) -> (set -> prop) -> prop :=
 (fun x0 : ((set -> prop) -> prop) -> prop => fun x1 : set -> prop => forall x2 : (set -> prop) -> prop, x0 x2 -> x2 x1).
Theorem Descr_Vo2_prop : (forall x0 : ((set -> prop) -> prop) -> prop, (forall x1 : prop, (forall x2 : (set -> prop) -> prop, x0 x2 -> x1) -> x1) -> (forall x1 x2 : (set -> prop) -> prop, x0 x1 -> x0 x2 -> x1 = x2) -> x0 (Descr_Vo2 x0)).
admit.
Qed.
Definition If_ii : prop -> (set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : prop => fun x1 x2 : set -> set => fun x3 : set => If_i x0 (x1 x3) (x2 x3)).
Theorem If_ii_1 : (forall x0 : prop, forall x1 x2 : set -> set, x0 -> If_ii x0 x1 x2 = x1).
admit.
Qed.
Theorem If_ii_0 : (forall x0 : prop, forall x1 x2 : set -> set, not x0 -> If_ii x0 x1 x2 = x2).
admit.
Qed.
Definition If_iii : prop -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : prop => fun x1 x2 : set -> set -> set => fun x3 x4 : set => If_i x0 (x1 x3 x4) (x2 x3 x4)).
Theorem If_iii_1 : (forall x0 : prop, forall x1 x2 : set -> set -> set, x0 -> If_iii x0 x1 x2 = x1).
admit.
Qed.
Theorem If_iii_0 : (forall x0 : prop, forall x1 x2 : set -> set -> set, not x0 -> If_iii x0 x1 x2 = x2).
admit.
Qed.
Definition If_Vo1 : prop -> (set -> prop) -> (set -> prop) -> set -> prop :=
 (fun x0 : prop => fun x1 x2 : set -> prop => fun x3 : set => and (x0 -> x1 x3) (not x0 -> x2 x3)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom notE : (forall x0 : prop, not x0 -> x0 -> False).
Theorem If_Vo1_1 : (forall x0 : prop, forall x1 x2 : set -> prop, x0 -> If_Vo1 x0 x1 x2 = x1).
admit.
Qed.
Theorem If_Vo1_0 : (forall x0 : prop, forall x1 x2 : set -> prop, not x0 -> If_Vo1 x0 x1 x2 = x2).
admit.
Qed.
Definition If_iio : prop -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 : prop => fun x1 x2 : set -> set -> prop => fun x3 x4 : set => and (x0 -> x1 x3 x4) (not x0 -> x2 x3 x4)).
Theorem If_iio_1 : (forall x0 : prop, forall x1 x2 : set -> set -> prop, x0 -> If_iio x0 x1 x2 = x1).
admit.
Qed.
Theorem If_iio_0 : (forall x0 : prop, forall x1 x2 : set -> set -> prop, not x0 -> If_iio x0 x1 x2 = x2).
admit.
Qed.
Definition If_Vo2 : prop -> ((set -> prop) -> prop) -> ((set -> prop) -> prop) -> (set -> prop) -> prop :=
 (fun x0 : prop => fun x1 x2 : (set -> prop) -> prop => fun x3 : set -> prop => and (x0 -> x1 x3) (not x0 -> x2 x3)).
Theorem If_Vo2_1 : (forall x0 : prop, forall x1 x2 : (set -> prop) -> prop, x0 -> If_Vo2 x0 x1 x2 = x1).
admit.
Qed.
Theorem If_Vo2_0 : (forall x0 : prop, forall x1 x2 : (set -> prop) -> prop, not x0 -> If_Vo2 x0 x1 x2 = x2).
admit.
Qed.
Definition In_rec_i_G : (set -> (set -> set) -> set) -> set -> set -> prop :=
 (fun x0 : set -> (set -> set) -> set => fun x1 x2 : set => forall x3 : set -> set -> prop, (forall x4, forall x5 : set -> set, (forall x6, x6 :e x4 -> x3 x6 (x5 x6)) -> x3 x4 (x0 x4 x5)) -> x3 x1 x2).
Definition In_rec_i : (set -> (set -> set) -> set) -> set -> set :=
 (fun x0 : set -> (set -> set) -> set => fun x1 : set => Eps_i (In_rec_i_G x0 x1)).
Theorem In_rec_i_G_c : (forall x0 : set -> (set -> set) -> set, forall x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> In_rec_i_G x0 x3 (x2 x3)) -> In_rec_i_G x0 x1 (x0 x1 x2)).
admit.
Qed.
Theorem In_rec_i_G_inv : (forall x0 : set -> (set -> set) -> set, forall x1 x2, In_rec_i_G x0 x1 x2 -> (forall x3 : prop, (forall x4 : set -> set, and (forall x5, x5 :e x1 -> In_rec_i_G x0 x5 (x4 x5)) (x2 = x0 x1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem In_rec_i_G_f : (forall x0 : set -> (set -> set) -> set, (forall x1, forall x2 x3 : set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1 x2 x3, In_rec_i_G x0 x1 x2 -> In_rec_i_G x0 x1 x3 -> x2 = x3)).
admit.
Qed.
Theorem In_rec_i_G_In_rec_i : (forall x0 : set -> (set -> set) -> set, (forall x1, forall x2 x3 : set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, In_rec_i_G x0 x1 (In_rec_i x0 x1))).
admit.
Qed.
Theorem In_rec_i_G_In_rec_i_d : (forall x0 : set -> (set -> set) -> set, (forall x1, forall x2 x3 : set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, In_rec_i_G x0 x1 (x0 x1 (In_rec_i x0)))).
admit.
Qed.
Theorem In_rec_i_eq : (forall x0 : set -> (set -> set) -> set, (forall x1, forall x2 x3 : set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : set -> set -> prop, x2 (In_rec_i x0 x1) (x0 x1 (In_rec_i x0)) -> x2 (x0 x1 (In_rec_i x0)) (In_rec_i x0 x1))).
admit.
Qed.
Definition In_rec_G_ii : (set -> (set -> set -> set) -> set -> set) -> set -> (set -> set) -> prop :=
 (fun x0 : set -> (set -> set -> set) -> set -> set => fun x1 : set => fun x2 : set -> set => forall x3 : set -> (set -> set) -> prop, (forall x4, forall x5 : set -> set -> set, (forall x6, x6 :e x4 -> x3 x6 (x5 x6)) -> x3 x4 (x0 x4 x5)) -> x3 x1 x2).
Definition In_rec_ii : (set -> (set -> set -> set) -> set -> set) -> set -> set -> set :=
 (fun x0 : set -> (set -> set -> set) -> set -> set => fun x1 : set => Descr_ii (In_rec_G_ii x0 x1)).
Theorem In_rec_G_ii_c : (forall x0 : set -> (set -> set -> set) -> set -> set, forall x1, forall x2 : set -> set -> set, (forall x3, x3 :e x1 -> In_rec_G_ii x0 x3 (x2 x3)) -> In_rec_G_ii x0 x1 (x0 x1 x2)).
admit.
Qed.
Theorem In_rec_G_ii_inv : (forall x0 : set -> (set -> set -> set) -> set -> set, forall x1, forall x2 : set -> set, In_rec_G_ii x0 x1 x2 -> (forall x3 : prop, (forall x4 : set -> set -> set, and (forall x5, x5 :e x1 -> In_rec_G_ii x0 x5 (x4 x5)) (x2 = x0 x1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem In_rec_G_ii_f : (forall x0 : set -> (set -> set -> set) -> set -> set, (forall x1, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 x3 : set -> set, In_rec_G_ii x0 x1 x2 -> In_rec_G_ii x0 x1 x3 -> x2 = x3)).
admit.
Qed.
Theorem In_rec_G_ii_In_rec_ii : (forall x0 : set -> (set -> set -> set) -> set -> set, (forall x1, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, In_rec_G_ii x0 x1 (In_rec_ii x0 x1))).
admit.
Qed.
Theorem In_rec_G_ii_In_rec_ii_d : (forall x0 : set -> (set -> set -> set) -> set -> set, (forall x1, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, In_rec_G_ii x0 x1 (x0 x1 (In_rec_ii x0)))).
admit.
Qed.
Theorem In_rec_ii_eq : (forall x0 : set -> (set -> set -> set) -> set -> set, (forall x1, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : (set -> set) -> (set -> set) -> prop, x2 (In_rec_ii x0 x1) (x0 x1 (In_rec_ii x0)) -> x2 (x0 x1 (In_rec_ii x0)) (In_rec_ii x0 x1))).
admit.
Qed.
Definition In_rec_G_iii : (set -> (set -> set -> set -> set) -> set -> set -> set) -> set -> (set -> set -> set) -> prop :=
 (fun x0 : set -> (set -> set -> set -> set) -> set -> set -> set => fun x1 : set => fun x2 : set -> set -> set => forall x3 : set -> (set -> set -> set) -> prop, (forall x4, forall x5 : set -> set -> set -> set, (forall x6, x6 :e x4 -> x3 x6 (x5 x6)) -> x3 x4 (x0 x4 x5)) -> x3 x1 x2).
Definition In_rec_iii : (set -> (set -> set -> set -> set) -> set -> set -> set) -> set -> set -> set -> set :=
 (fun x0 : set -> (set -> set -> set -> set) -> set -> set -> set => fun x1 : set => Descr_iii (In_rec_G_iii x0 x1)).
Theorem In_rec_G_iii_c : (forall x0 : set -> (set -> set -> set -> set) -> set -> set -> set, forall x1, forall x2 : set -> set -> set -> set, (forall x3, x3 :e x1 -> In_rec_G_iii x0 x3 (x2 x3)) -> In_rec_G_iii x0 x1 (x0 x1 x2)).
admit.
Qed.
Theorem In_rec_G_iii_inv : (forall x0 : set -> (set -> set -> set -> set) -> set -> set -> set, forall x1, forall x2 : set -> set -> set, In_rec_G_iii x0 x1 x2 -> (forall x3 : prop, (forall x4 : set -> set -> set -> set, and (forall x5, x5 :e x1 -> In_rec_G_iii x0 x5 (x4 x5)) (x2 = x0 x1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem In_rec_G_iii_f : (forall x0 : set -> (set -> set -> set -> set) -> set -> set -> set, (forall x1, forall x2 x3 : set -> set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 x3 : set -> set -> set, In_rec_G_iii x0 x1 x2 -> In_rec_G_iii x0 x1 x3 -> x2 = x3)).
admit.
Qed.
Theorem In_rec_G_iii_In_rec_iii : (forall x0 : set -> (set -> set -> set -> set) -> set -> set -> set, (forall x1, forall x2 x3 : set -> set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, In_rec_G_iii x0 x1 (In_rec_iii x0 x1))).
admit.
Qed.
Theorem In_rec_G_iii_In_rec_iii_d : (forall x0 : set -> (set -> set -> set -> set) -> set -> set -> set, (forall x1, forall x2 x3 : set -> set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, In_rec_G_iii x0 x1 (x0 x1 (In_rec_iii x0)))).
admit.
Qed.
Theorem In_rec_iii_eq : (forall x0 : set -> (set -> set -> set -> set) -> set -> set -> set, (forall x1, forall x2 x3 : set -> set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : (set -> set -> set) -> (set -> set -> set) -> prop, x2 (In_rec_iii x0 x1) (x0 x1 (In_rec_iii x0)) -> x2 (x0 x1 (In_rec_iii x0)) (In_rec_iii x0 x1))).
admit.
Qed.
Definition missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 : (set -> (set -> set -> set -> prop) -> set -> set -> prop) -> set -> (set -> set -> prop) -> prop :=
 (fun x0 : set -> (set -> set -> set -> prop) -> set -> set -> prop => fun x1 : set => fun x2 : set -> set -> prop => forall x3 : set -> (set -> set -> prop) -> prop, (forall x4, forall x5 : set -> set -> set -> prop, (forall x6, x6 :e x4 -> x3 x6 (x5 x6)) -> x3 x4 (x0 x4 x5)) -> x3 x1 x2).
Definition In_rec_iio : (set -> (set -> set -> set -> prop) -> set -> set -> prop) -> set -> set -> set -> prop :=
 (fun x0 : set -> (set -> set -> set -> prop) -> set -> set -> prop => fun x1 : set => Descr_iio (missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 x0 x1)).
Theorem missingprop_29be8ffdeb96ec095470b8b15a1cf73c6a121f2e284a536ce1994939d01b3111 : (forall x0 : set -> (set -> set -> set -> prop) -> set -> set -> prop, forall x1, forall x2 : set -> set -> set -> prop, (forall x3, x3 :e x1 -> missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 x0 x3 (x2 x3)) -> missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 x0 x1 (x0 x1 x2)).
admit.
Qed.
Theorem missingprop_d9a7c30bbc7df7f9c7418399a45d2dd0d50f90744e9b3fec6cc78c20d37defae : (forall x0 : set -> (set -> set -> set -> prop) -> set -> set -> prop, forall x1, forall x2 : set -> set -> prop, missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 x0 x1 x2 -> (forall x3 : prop, (forall x4 : set -> set -> set -> prop, and (forall x5, x5 :e x1 -> missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 x0 x5 (x4 x5)) (x2 = x0 x1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem missingprop_4eae4cdff7095dc248c158b66a75af5d5d5f509a99307d15479b03b8e365be22 : (forall x0 : set -> (set -> set -> set -> prop) -> set -> set -> prop, (forall x1, forall x2 x3 : set -> set -> set -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 x3 : set -> set -> prop, missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 x0 x1 x2 -> missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 x0 x1 x3 -> x2 = x3)).
admit.
Qed.
Theorem missingprop_4a2f5327815bc8d6b514b716d12bbe30a84529c2301139001d9de9a305fdaf30 : (forall x0 : set -> (set -> set -> set -> prop) -> set -> set -> prop, (forall x1, forall x2 x3 : set -> set -> set -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 x0 x1 (In_rec_iio x0 x1))).
admit.
Qed.
Theorem missingprop_0972079d65757b8b7dea4e78f0f4f964fc8351ee591584a33a89198d1c4fe74e : (forall x0 : set -> (set -> set -> set -> prop) -> set -> set -> prop, (forall x1, forall x2 x3 : set -> set -> set -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_8f2425470cc52a6100bea67794d6ec20808c41b2ce125c9fd0050ee96d550120 x0 x1 (x0 x1 (In_rec_iio x0)))).
admit.
Qed.
Theorem In_rec_iio_eq : (forall x0 : set -> (set -> set -> set -> prop) -> set -> set -> prop, (forall x1, forall x2 x3 : set -> set -> set -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : (set -> set -> prop) -> (set -> set -> prop) -> prop, x2 (In_rec_iio x0 x1) (x0 x1 (In_rec_iio x0)) -> x2 (x0 x1 (In_rec_iio x0)) (In_rec_iio x0 x1))).
admit.
Qed.
Definition missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db : (set -> (set -> set -> prop) -> set -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> set -> prop) -> set -> prop => fun x1 : set => fun x2 : set -> prop => forall x3 : set -> (set -> prop) -> prop, (forall x4, forall x5 : set -> set -> prop, (forall x6, x6 :e x4 -> x3 x6 (x5 x6)) -> x3 x4 (x0 x4 x5)) -> x3 x1 x2).
Definition In_rec_Vo1 : (set -> (set -> set -> prop) -> set -> prop) -> set -> set -> prop :=
 (fun x0 : set -> (set -> set -> prop) -> set -> prop => fun x1 : set => Descr_Vo1 (missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db x0 x1)).
Theorem missingprop_6b9d466c48459997b5943e2bfa8effee1803540eeebe30604246716ec482ccac : (forall x0 : set -> (set -> set -> prop) -> set -> prop, forall x1, forall x2 : set -> set -> prop, (forall x3, x3 :e x1 -> missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db x0 x3 (x2 x3)) -> missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db x0 x1 (x0 x1 x2)).
admit.
Qed.
Theorem missingprop_7aec4f3cba90c67be4e7a781f20a5db922db243b8f8fadf11e2a3765e99bfd7c : (forall x0 : set -> (set -> set -> prop) -> set -> prop, forall x1, forall x2 : set -> prop, missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db x0 x1 x2 -> (forall x3 : prop, (forall x4 : set -> set -> prop, and (forall x5, x5 :e x1 -> missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db x0 x5 (x4 x5)) (x2 = x0 x1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem missingprop_4a87b3b2bcf10bd0616cd3b0459f4ca1014c4bcd0183902ba6aaa9f0fef066b0 : (forall x0 : set -> (set -> set -> prop) -> set -> prop, (forall x1, forall x2 x3 : set -> set -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 x3 : set -> prop, missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db x0 x1 x2 -> missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db x0 x1 x3 -> x2 = x3)).
admit.
Qed.
Theorem missingprop_90514bebae2be376719d62ecd84338b37c0dce3bc117145f4ba9847aabbcea9a : (forall x0 : set -> (set -> set -> prop) -> set -> prop, (forall x1, forall x2 x3 : set -> set -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db x0 x1 (In_rec_Vo1 x0 x1))).
admit.
Qed.
Theorem missingprop_2de7add04e9052570d003c7f0d81aacd226a4576fd14fb0846deaf2686db7396 : (forall x0 : set -> (set -> set -> prop) -> set -> prop, (forall x1, forall x2 x3 : set -> set -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_e791beae5e54ac7cf412fb29ef5286fd5f357aa124b2934ad900a7ceb018d3db x0 x1 (x0 x1 (In_rec_Vo1 x0)))).
admit.
Qed.
Theorem In_rec_Vo1_eq : (forall x0 : set -> (set -> set -> prop) -> set -> prop, (forall x1, forall x2 x3 : set -> set -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : (set -> prop) -> (set -> prop) -> prop, x2 (In_rec_Vo1 x0 x1) (x0 x1 (In_rec_Vo1 x0)) -> x2 (x0 x1 (In_rec_Vo1 x0)) (In_rec_Vo1 x0 x1))).
admit.
Qed.
Definition missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 : (set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop) -> set -> ((set -> prop) -> prop) -> prop :=
 (fun x0 : set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop => fun x1 : set => fun x2 : (set -> prop) -> prop => forall x3 : set -> ((set -> prop) -> prop) -> prop, (forall x4, forall x5 : set -> (set -> prop) -> prop, (forall x6, x6 :e x4 -> x3 x6 (x5 x6)) -> x3 x4 (x0 x4 x5)) -> x3 x1 x2).
Definition In_rec_Vo2 : (set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop => fun x1 : set => Descr_Vo2 (missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 x0 x1)).
Theorem missingprop_4827c395f66ed5e2b9711333b1b1681a1ac1c67519cd7de68052d7f43b6fa12f : (forall x0 : set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop, forall x1, forall x2 : set -> (set -> prop) -> prop, (forall x3, x3 :e x1 -> missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 x0 x3 (x2 x3)) -> missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 x0 x1 (x0 x1 x2)).
admit.
Qed.
Theorem missingprop_d6c01da6ca79df3d5130b3b242188854c35c1c7c5784df3e9a8cee95732dbf77 : (forall x0 : set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop, forall x1, forall x2 : (set -> prop) -> prop, missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 x0 x1 x2 -> (forall x3 : prop, (forall x4 : set -> (set -> prop) -> prop, and (forall x5, x5 :e x1 -> missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 x0 x5 (x4 x5)) (x2 = x0 x1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem missingprop_57bc92e82cd111879864b413f133b93ca2216a7ee2b213ca5d0d3dcd74eef946 : (forall x0 : set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop, (forall x1, forall x2 x3 : set -> (set -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 x3 : (set -> prop) -> prop, missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 x0 x1 x2 -> missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 x0 x1 x3 -> x2 = x3)).
admit.
Qed.
Theorem missingprop_a8c97ae0a017afe69d44636ace2d181933ab2539bdda35cb9471bd768df945ae : (forall x0 : set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop, (forall x1, forall x2 x3 : set -> (set -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 x0 x1 (In_rec_Vo2 x0 x1))).
admit.
Qed.
Theorem missingprop_dae3b4285212b91c2ce9da68d8544d08d0c7b1be3e30666e0091105c9f3f910e : (forall x0 : set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop, (forall x1, forall x2 x3 : set -> (set -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, missingname_d5e263c1c63803eb441b4aef8a3366a018fc9beb8403e21a931432184124c406 x0 x1 (x0 x1 (In_rec_Vo2 x0)))).
admit.
Qed.
Theorem In_rec_Vo2_eq : (forall x0 : set -> (set -> (set -> prop) -> prop) -> (set -> prop) -> prop, (forall x1, forall x2 x3 : set -> (set -> prop) -> prop, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : ((set -> prop) -> prop) -> ((set -> prop) -> prop) -> prop, x2 (In_rec_Vo2 x0 x1) (x0 x1 (In_rec_Vo2 x0)) -> x2 (x0 x1 (In_rec_Vo2 x0)) (In_rec_Vo2 x0 x1))).
admit.
Qed.
