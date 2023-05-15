Definition sttfa_initial_sigp : (set -> set -> prop) -> prop := fun S => True.
Definition sttfa_rule0_rewp : (set -> set -> prop) -> prop := fun R => True.
Definition sttfa_type := "sttfa_type".
Definition sttfa_type_tp := Type.
Definition sttfa_type_sigp : (set -> set -> prop) -> prop := fun S => sttfa_initial_sigp S /\ S sttfa_type sttfa_type_tp.
Theorem valid_sig_tp_sttfa_type_sigp : forall S R : set -> set -> prop, sttfa_initial_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_type_tp.
Admitted.
Definition sttfa_arrow := "sttfa_arrow".
Definition sttfa_arrow_tp := (arr sttfa_type (arr sttfa_type sttfa_type)).
Definition sttfa_arrow_sigp : (set -> set -> prop) -> prop := fun S => sttfa_type_sigp S /\ S sttfa_arrow sttfa_arrow_tp.
Theorem valid_sig_tp_sttfa_arrow_sigp : forall S R : set -> set -> prop, sttfa_type_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_arrow_tp.
Admitted.
Definition sttfa_bool := "sttfa_bool".
Definition sttfa_bool_tp := sttfa_type.
Definition sttfa_bool_sigp : (set -> set -> prop) -> prop := fun S => sttfa_arrow_sigp S /\ S sttfa_bool sttfa_bool_tp.
Theorem valid_sig_tp_sttfa_bool_sigp : forall S R : set -> set -> prop, sttfa_arrow_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_bool_tp.
Admitted.
Definition sttfa_eta := "sttfa_eta".
Definition sttfa_eta_tp := (arr sttfa_type Type).
Definition sttfa_eta_sigp : (set -> set -> prop) -> prop := fun S => sttfa_bool_sigp S /\ S sttfa_eta sttfa_eta_tp.
Theorem valid_sig_tp_sttfa_eta_sigp : forall S R : set -> set -> prop, sttfa_bool_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_eta_tp.
Admitted.
Definition sttfa_ptype := "sttfa_ptype".
Definition sttfa_ptype_tp := Type.
Definition sttfa_ptype_sigp : (set -> set -> prop) -> prop := fun S => sttfa_eta_sigp S /\ S sttfa_ptype sttfa_ptype_tp.
Theorem valid_sig_tp_sttfa_ptype_sigp : forall S R : set -> set -> prop, sttfa_eta_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_ptype_tp.
Admitted.
Definition sttfa_p := "sttfa_p".
Definition sttfa_p_tp := (arr sttfa_type sttfa_ptype).
Definition sttfa_p_sigp : (set -> set -> prop) -> prop := fun S => sttfa_ptype_sigp S /\ S sttfa_p sttfa_p_tp.
Theorem valid_sig_tp_sttfa_p_sigp : forall S R : set -> set -> prop, sttfa_ptype_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_p_tp.
Admitted.
Definition sttfa_etap := "sttfa_etap".
Definition sttfa_etap_tp := (arr sttfa_ptype Type).
Definition sttfa_etap_sigp : (set -> set -> prop) -> prop := fun S => sttfa_p_sigp S /\ S sttfa_etap sttfa_etap_tp.
Theorem valid_sig_tp_sttfa_etap_sigp : forall S R : set -> set -> prop, sttfa_p_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_etap_tp.
Admitted.
Definition sttfa_forallK := "sttfa_forallK".
Definition sttfa_forallK_tp := (arr (arr sttfa_type sttfa_ptype) sttfa_ptype).
Definition sttfa_forallK_sigp : (set -> set -> prop) -> prop := fun S => sttfa_etap_sigp S /\ S sttfa_forallK sttfa_forallK_tp.
Theorem valid_sig_tp_sttfa_forallK_sigp : forall S R : set -> set -> prop, sttfa_etap_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_forallK_tp.
Admitted.
Definition sttfa_eps := "sttfa_eps".
Definition sttfa_eps_tp := (arr (ap sttfa_eta sttfa_bool) Type).
Definition sttfa_eps_sigp : (set -> set -> prop) -> prop := fun S => sttfa_forallK_sigp S /\ S sttfa_eps sttfa_eps_tp.
Theorem valid_sig_tp_sttfa_eps_sigp : forall S R : set -> set -> prop, sttfa_forallK_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_eps_tp.
Admitted.
Definition sttfa_impl := "sttfa_impl".
Definition sttfa_impl_tp := (arr (ap sttfa_eta sttfa_bool) (arr (ap sttfa_eta sttfa_bool) (ap sttfa_eta sttfa_bool))).
Definition sttfa_impl_sigp : (set -> set -> prop) -> prop := fun S => sttfa_eps_sigp S /\ S sttfa_impl sttfa_impl_tp.
Theorem valid_sig_tp_sttfa_impl_sigp : forall S R : set -> set -> prop, sttfa_eps_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_impl_tp.
Admitted.
Definition sttfa_forall := "sttfa_forall".
Definition sttfa_forall_tp := (Pi sttfa_type (fun t => (arr (arr (ap sttfa_eta t) (ap sttfa_eta sttfa_bool)) (ap sttfa_eta sttfa_bool)))).
Definition sttfa_forall_sigp : (set -> set -> prop) -> prop := fun S => sttfa_impl_sigp S /\ S sttfa_forall sttfa_forall_tp.
Theorem valid_sig_tp_sttfa_forall_sigp : forall S R : set -> set -> prop, sttfa_impl_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_forall_tp.
Admitted.
Definition sttfa_forallP := "sttfa_forallP".
Definition sttfa_forallP_tp := (arr (arr sttfa_type (ap sttfa_eta sttfa_bool)) (ap sttfa_eta sttfa_bool)).
Definition sttfa_forallP_sigp : (set -> set -> prop) -> prop := fun S => sttfa_forall_sigp S /\ S sttfa_forallP sttfa_forallP_tp.
Theorem valid_sig_tp_sttfa_forallP_sigp : forall S R : set -> set -> prop, sttfa_forall_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_forallP_tp.
Admitted.
Definition sttfa_rule1_rewp : (set -> set -> prop) -> prop := fun R => sttfa_rule0_rewp R /\ R sttfa_eta (lam nil (fun t => (ap sttfa_etap (ap sttfa_p t)))).
Definition sttfa_rule2_rewp : (set -> set -> prop) -> prop := fun R => sttfa_rule1_rewp R /\ forall l r, R (ap sttfa_etap (ap sttfa_p (ap (ap sttfa_arrow l) r))) (arr (ap sttfa_eta l) (ap sttfa_eta r)).
Definition sttfa_rule3_rewp : (set -> set -> prop) -> prop := fun R => sttfa_rule2_rewp R /\ forall f, R (ap sttfa_etap (ap sttfa_forallK f)) (Pi sttfa_type (fun x => (ap sttfa_etap (ap f x)))).
Definition sttfa_rule4_rewp : (set -> set -> prop) -> prop := fun R => sttfa_rule3_rewp R /\ forall t f, R (ap sttfa_eps (ap (ap sttfa_forall t) f)) (Pi (ap sttfa_eta t) (fun x => (ap sttfa_eps (ap f x)))).
Definition sttfa_rule5_rewp : (set -> set -> prop) -> prop := fun R => sttfa_rule4_rewp R /\ forall l r, R (ap sttfa_eps (ap (ap sttfa_impl l) r)) (arr (ap sttfa_eps l) (ap sttfa_eps r)).
Definition sttfa_rule6_rewp : (set -> set -> prop) -> prop := fun R => sttfa_rule5_rewp R /\ forall f, R (ap sttfa_eps (ap sttfa_forallP f)) (Pi sttfa_type (fun x => (ap sttfa_eps (ap f x)))).
Definition sttfa_leibniz := "sttfa_leibniz".
Definition sttfa_leibniz_tp := (ap sttfa_etap (ap sttfa_forallK (lam sttfa_type (fun X => (ap sttfa_p (ap (ap sttfa_arrow X) (ap (ap sttfa_arrow X) sttfa_bool))))))).
Definition sttfa_leibniz_tm := (lam sttfa_type (fun X => (lam (ap sttfa_eta X) (fun x => (lam (ap sttfa_eta X) (fun y => (ap (ap sttfa_forall (ap (ap sttfa_arrow X) sttfa_bool)) (lam nil (fun P => (ap (ap sttfa_impl (ap P x)) (ap P y))))))))))).
Definition sttfa_leibniz_sigp : (set -> set -> prop) -> prop := fun S => sttfa_forallP_sigp S /\ S sttfa_leibniz sttfa_leibniz_tp.
Theorem valid_sig_tp_sttfa_leibniz_sigp : forall S R : set -> set -> prop, sttfa_forallP_sigp S -> sttfa_rule6_rewp R -> valid_sig_tp S R sttfa_leibniz_tp.
Admitted.
Theorem valid_sig_tm_sttfa_leibniz_sigp : forall S R : set -> set -> prop, sttfa_forallP_sigp S -> sttfa_rule6_rewp R -> of S R emp2 sttfa_leibniz_tm sttfa_leibniz_tp.
Admitted.
Definition sttfa_rule7_rewp : (set -> set -> prop) -> prop := fun R => sttfa_rule6_rewp R /\ R sttfa_leibniz sttfa_leibniz_tm.
Definition sttfa_refl := "sttfa_refl".
Definition sttfa_refl_tp := (ap sttfa_eps (ap sttfa_forallP (lam nil (fun X => (ap (ap sttfa_forall X) (lam (ap sttfa_eta X) (fun x => (ap (ap (ap sttfa_leibniz X) x) x)))))))).
Definition sttfa_refl_tm := (lam sttfa_type (fun X => (lam (ap sttfa_eta X) (fun x => (lam (ap sttfa_eta (ap (ap sttfa_arrow X) sttfa_bool)) (fun P => (lam (ap sttfa_eps (ap P x)) (fun p => p)))))))).
Definition sttfa_refl_sigp : (set -> set -> prop) -> prop := fun S => sttfa_leibniz_sigp S /\ S sttfa_refl sttfa_refl_tp.
Theorem valid_sig_tp_sttfa_refl_sigp : forall S R : set -> set -> prop, sttfa_leibniz_sigp S -> sttfa_rule7_rewp R -> valid_sig_tp S R sttfa_refl_tp.
Admitted.
Theorem valid_sig_tm_sttfa_refl_sigp : forall S R : set -> set -> prop, sttfa_leibniz_sigp S -> sttfa_rule7_rewp R -> of S R emp2 sttfa_refl_tm sttfa_refl_tp.
Admitted.
Definition sttfa_rule8_rewp : (set -> set -> prop) -> prop := fun R => sttfa_rule7_rewp R /\ R sttfa_refl sttfa_refl_tm.
Definition sttfa_sym_leibniz := "sttfa_sym_leibniz".
Definition sttfa_sym_leibniz_tp := (ap sttfa_eps (ap sttfa_forallP (lam sttfa_type (fun X => (ap (ap sttfa_forall X) (lam (ap sttfa_eta X) (fun x => (ap (ap sttfa_forall X) (lam (ap sttfa_eta X) (fun y => (ap (ap sttfa_impl (ap (ap (ap sttfa_leibniz X) x) y)) (ap (ap (ap sttfa_leibniz X) y) x)))))))))))).
Definition sttfa_sym_leibniz_sigp : (set -> set -> prop) -> prop := fun S => sttfa_refl_sigp S /\ S sttfa_sym_leibniz sttfa_sym_leibniz_tp.
Theorem valid_sig_tp_sttfa_sym_leibniz_sigp : forall S R : set -> set -> prop, sttfa_refl_sigp S -> sttfa_rule8_rewp R -> valid_sig_tp S R sttfa_sym_leibniz_tp.
Admitted.
Definition sttfa_final_sigp := sttfa_sym_leibniz_sigp.
Definition sttfa_final_rewp := sttfa_rule8_rewp.
