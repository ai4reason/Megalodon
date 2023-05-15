Theorem valid_sig_tp_sttfa_type_sigp : forall S R : set -> set -> prop, sttfa_initial_sigp S -> sttfa_rule0_rewp R -> valid_sig_tp S R sttfa_type_tp.
let S R. assume _ _.
apply valid_sig_tp_Kind.
prove of S R emp2 Type Kind.
apply of_Type.
Qed.
