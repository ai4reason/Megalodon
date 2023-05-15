Definition connectives_initial_sigp : (set -> set -> prop) -> prop := fun S => sttfa_final_sigp S /\ True.
Definition connectives_rule0_rewp : (set -> set -> prop) -> prop := fun R => sttfa_final_rewp R /\ True.
Definition connectives_True := "connectives_True".
Definition connectives_True_tp := (ap sttfa_etap (ap sttfa_p sttfa_bool)).
Definition connectives_True_tm := (ap (ap sttfa_forall sttfa_bool) (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun z => (ap (ap sttfa_impl z) z)))).
Definition connectives_True_sigp : (set -> set -> prop) -> prop := fun S => connectives_initial_sigp S /\ S connectives_True connectives_True_tp.
Theorem valid_sig_tp_connectives_True_sigp : forall S R : set -> set -> prop, connectives_initial_sigp S -> connectives_rule0_rewp R -> valid_sig_tp S R connectives_True_tp.
Admitted.
Theorem valid_sig_tm_connectives_True_sigp : forall S R : set -> set -> prop, connectives_initial_sigp S -> connectives_rule0_rewp R -> of S R emp2 connectives_True_tm connectives_True_tp.
Admitted.
Definition connectives_rule1_rewp : (set -> set -> prop) -> prop := fun R => connectives_rule0_rewp R /\ R connectives_True connectives_True_tm.
Definition connectives_False := "connectives_False".
Definition connectives_False_tp := (ap sttfa_etap (ap sttfa_p sttfa_bool)).
Definition connectives_False_tm := (ap (ap sttfa_forall sttfa_bool) (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun z => z))).
Definition connectives_False_sigp : (set -> set -> prop) -> prop := fun S => connectives_True_sigp S /\ S connectives_False connectives_False_tp.
Theorem valid_sig_tp_connectives_False_sigp : forall S R : set -> set -> prop, connectives_True_sigp S -> connectives_rule1_rewp R -> valid_sig_tp S R connectives_False_tp.
Admitted.
Theorem valid_sig_tm_connectives_False_sigp : forall S R : set -> set -> prop, connectives_True_sigp S -> connectives_rule1_rewp R -> of S R emp2 connectives_False_tm connectives_False_tp.
Admitted.
Definition connectives_rule2_rewp : (set -> set -> prop) -> prop := fun R => connectives_rule1_rewp R /\ R connectives_False connectives_False_tm.
Definition connectives_Imp := "connectives_Imp".
Definition connectives_Imp_tp := (ap sttfa_etap (ap sttfa_p (ap (ap sttfa_arrow sttfa_bool) (ap (ap sttfa_arrow sttfa_bool) sttfa_bool)))).
Definition connectives_Imp_tm := (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun x => (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun y => (ap (ap sttfa_impl x) y))))).
Definition connectives_Imp_sigp : (set -> set -> prop) -> prop := fun S => connectives_False_sigp S /\ S connectives_Imp connectives_Imp_tp.
Theorem valid_sig_tp_connectives_Imp_sigp : forall S R : set -> set -> prop, connectives_False_sigp S -> connectives_rule2_rewp R -> valid_sig_tp S R connectives_Imp_tp.
Admitted.
Theorem valid_sig_tm_connectives_Imp_sigp : forall S R : set -> set -> prop, connectives_False_sigp S -> connectives_rule2_rewp R -> of S R emp2 connectives_Imp_tm connectives_Imp_tp.
Admitted.
Definition connectives_rule3_rewp : (set -> set -> prop) -> prop := fun R => connectives_rule2_rewp R /\ R connectives_Imp connectives_Imp_tm.
Definition connectives_Not := "connectives_Not".
Definition connectives_Not_tp := (ap sttfa_etap (ap sttfa_p (ap (ap sttfa_arrow sttfa_bool) sttfa_bool))).
Definition connectives_Not_tm := (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun x => (ap (ap sttfa_impl x) connectives_False))).
Definition connectives_Not_sigp : (set -> set -> prop) -> prop := fun S => connectives_Imp_sigp S /\ S connectives_Not connectives_Not_tp.
Theorem valid_sig_tp_connectives_Not_sigp : forall S R : set -> set -> prop, connectives_Imp_sigp S -> connectives_rule3_rewp R -> valid_sig_tp S R connectives_Not_tp.
Admitted.
Theorem valid_sig_tm_connectives_Not_sigp : forall S R : set -> set -> prop, connectives_Imp_sigp S -> connectives_rule3_rewp R -> of S R emp2 connectives_Not_tm connectives_Not_tp.
Admitted.
Definition connectives_rule4_rewp : (set -> set -> prop) -> prop := fun R => connectives_rule3_rewp R /\ R connectives_Not connectives_Not_tm.
Definition connectives_And := "connectives_And".
Definition connectives_And_tp := (ap sttfa_etap (ap sttfa_p (ap (ap sttfa_arrow sttfa_bool) (ap (ap sttfa_arrow sttfa_bool) sttfa_bool)))).
Definition connectives_And_tm := (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun x => (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun y => (ap (ap sttfa_forall sttfa_bool) (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun z => (ap (ap sttfa_impl (ap (ap sttfa_impl x) (ap (ap sttfa_impl y) z))) z)))))))).
Definition connectives_And_sigp : (set -> set -> prop) -> prop := fun S => connectives_Not_sigp S /\ S connectives_And connectives_And_tp.
Theorem valid_sig_tp_connectives_And_sigp : forall S R : set -> set -> prop, connectives_Not_sigp S -> connectives_rule4_rewp R -> valid_sig_tp S R connectives_And_tp.
Admitted.
Theorem valid_sig_tm_connectives_And_sigp : forall S R : set -> set -> prop, connectives_Not_sigp S -> connectives_rule4_rewp R -> of S R emp2 connectives_And_tm connectives_And_tp.
Admitted.
Definition connectives_rule5_rewp : (set -> set -> prop) -> prop := fun R => connectives_rule4_rewp R /\ R connectives_And connectives_And_tm.
Definition connectives_Or := "connectives_Or".
Definition connectives_Or_tp := (ap sttfa_etap (ap sttfa_p (ap (ap sttfa_arrow sttfa_bool) (ap (ap sttfa_arrow sttfa_bool) sttfa_bool)))).
Definition connectives_Or_tm := (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun x => (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun y => (ap (ap sttfa_forall sttfa_bool) (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun z => (ap (ap sttfa_impl (ap (ap sttfa_impl x) z)) (ap (ap sttfa_impl (ap (ap sttfa_impl y) z)) z))))))))).
Definition connectives_Or_sigp : (set -> set -> prop) -> prop := fun S => connectives_And_sigp S /\ S connectives_Or connectives_Or_tp.
Theorem valid_sig_tp_connectives_Or_sigp : forall S R : set -> set -> prop, connectives_And_sigp S -> connectives_rule5_rewp R -> valid_sig_tp S R connectives_Or_tp.
Admitted.
Theorem valid_sig_tm_connectives_Or_sigp : forall S R : set -> set -> prop, connectives_And_sigp S -> connectives_rule5_rewp R -> of S R emp2 connectives_Or_tm connectives_Or_tp.
Admitted.
Definition connectives_rule6_rewp : (set -> set -> prop) -> prop := fun R => connectives_rule5_rewp R /\ R connectives_Or connectives_Or_tm.
Definition connectives_Ex := "connectives_Ex".
Definition connectives_Ex_tp := (ap sttfa_etap (ap sttfa_forallK (lam sttfa_type (fun A => (ap sttfa_p (ap (ap sttfa_arrow (ap (ap sttfa_arrow A) sttfa_bool)) sttfa_bool)))))).
Definition connectives_Ex_tm := (lam sttfa_type (fun A => (lam (ap sttfa_etap (ap sttfa_p (ap (ap sttfa_arrow A) sttfa_bool))) (fun f => (ap (ap sttfa_forall sttfa_bool) (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun z => (ap (ap sttfa_impl (ap (ap sttfa_forall A) (lam (ap sttfa_etap (ap sttfa_p A)) (fun x => (ap (ap sttfa_impl (ap f x)) z))))) z)))))))).
Definition connectives_Ex_sigp : (set -> set -> prop) -> prop := fun S => connectives_Or_sigp S /\ S connectives_Ex connectives_Ex_tp.
Theorem valid_sig_tp_connectives_Ex_sigp : forall S R : set -> set -> prop, connectives_Or_sigp S -> connectives_rule6_rewp R -> valid_sig_tp S R connectives_Ex_tp.
Admitted.
Theorem valid_sig_tm_connectives_Ex_sigp : forall S R : set -> set -> prop, connectives_Or_sigp S -> connectives_rule6_rewp R -> of S R emp2 connectives_Ex_tm connectives_Ex_tp.
Admitted.
Definition connectives_rule7_rewp : (set -> set -> prop) -> prop := fun R => connectives_rule6_rewp R /\ R connectives_Ex connectives_Ex_tm.
Definition connectives_I := "connectives_I".
Definition connectives_I_tp := (ap sttfa_eps connectives_True).
Definition connectives_I_tm := (lam (ap sttfa_etap (ap sttfa_p sttfa_bool)) (fun z => (lam (ap sttfa_eps z) (fun p => p)))).
Definition connectives_I_sigp : (set -> set -> prop) -> prop := fun S => connectives_Ex_sigp S /\ S connectives_I connectives_I_tp.
Theorem valid_sig_tp_connectives_I_sigp : forall S R : set -> set -> prop, connectives_Ex_sigp S -> connectives_rule7_rewp R -> valid_sig_tp S R connectives_I_tp.
Admitted.
Theorem valid_sig_tm_connectives_I_sigp : forall S R : set -> set -> prop, connectives_Ex_sigp S -> connectives_rule7_rewp R -> of S R emp2 connectives_I_tm connectives_I_tp.
Admitted.
Definition connectives_rule8_rewp : (set -> set -> prop) -> prop := fun R => connectives_rule7_rewp R /\ R connectives_I connectives_I_tm.
Definition connectives_final_sigp := connectives_I_sigp.
Definition connectives_final_rewp := connectives_rule8_rewp.
