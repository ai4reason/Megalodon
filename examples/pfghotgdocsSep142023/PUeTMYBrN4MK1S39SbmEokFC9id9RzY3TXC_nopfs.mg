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
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => or (x0 :e x2) (and (x0 = x2) (x1 :e x3))).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem missingprop_5802723b51de5d36493c37aa6c4d2fac77d4ea3a2a610b451893e8a6b670c703 : (forall x0 x1, not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 x1 x0 x1)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_a67609dafe291b86ed5ffe86bc2d9e73193ce035c5d8655f0bae66083efe51cb : (forall x0 x1 x2 x3 x4 x5, TransSet x4 -> TransSet x5 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 x1 x2 x3 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x2 x3 x4 x5 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 x1 x4 x5).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
Definition TwoRamseyGraph_4_6_Church6_squared_a : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set => fun x4 x5 : set => x0 (x1 (x2 (x3 x4 x5 x4 x5 x4 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x4 x4 x5 x4 x5) (x3 x5 x5 x4 x4 x5 x5) (x3 x4 x5 x4 x4 x5 x4)) (x2 (x3 x5 x4 x5 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x5 x4 x4 x5 x4) (x3 x4 x5 x5 x4 x5 x4) (x3 x5 x5 x4 x4 x5 x5) (x3 x5 x4 x4 x4 x5 x4)) (x2 (x3 x4 x5 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x4 x5 x5 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x5) (x3 x4 x4 x4 x5 x5 x4)) (x2 (x3 x5 x4 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x4 x4 x5 x4 x5) (x3 x4 x4 x5 x5 x5 x5) (x3 x4 x4 x5 x4 x5 x4)) (x2 (x3 x4 x5 x5 x4 x4 x5) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x5 x5 x4 x4 x4) (x3 x4 x5 x5 x4 x4 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x5 x5 x5 x5 x4 x4)) (x2 (x3 x5 x4 x4 x5 x5 x4) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x4 x4 x5 x4 x4) (x3 x5 x4 x4 x5 x4 x4) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x5 x5 x5 x4 x4))) (x1 (x2 (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x5 x4 x5 x5 x4) (x3 x4 x5 x5 x5 x4 x5) (x3 x5 x4 x4 x4 x4 x5) (x3 x5 x4 x4 x5 x5 x4) (x3 x5 x4 x5 x5 x5 x4)) (x2 (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x4 x5 x4 x4 x5) (x3 x5 x4 x5 x5 x5 x4) (x3 x4 x5 x4 x4 x5 x4) (x3 x4 x5 x5 x4 x4 x5) (x3 x4 x5 x5 x5 x5 x4)) (x2 (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x4 x5 x5 x4) (x3 x5 x5 x4 x5 x4 x5) (x3 x4 x4 x5 x4 x5 x4) (x3 x4 x5 x5 x4 x5 x4) (x3 x5 x5 x5 x4 x5 x4)) (x2 (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x5 x4 x4 x5) (x3 x5 x5 x5 x4 x5 x4) (x3 x4 x4 x4 x5 x4 x5) (x3 x5 x4 x4 x5 x4 x5) (x3 x5 x5 x4 x5 x5 x4)) (x2 (x3 x4 x5 x4 x5 x5 x5) (x3 x5 x4 x5 x4 x4 x4) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x5 x4) (x3 x5 x4 x5 x4 x4 x4)) (x2 (x3 x5 x4 x5 x4 x5 x5) (x3 x4 x5 x4 x5 x4 x4) (x3 x4 x5 x4 x5 x5 x5) (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x4 x5) (x3 x4 x5 x4 x5 x4 x4))) (x1 (x2 (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x5 x5 x5 x4) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x4 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x5 x5) (x3 x5 x5 x4 x5 x4 x4)) (x2 (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x5 x5 x4 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x5 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x5) (x3 x5 x5 x5 x4 x4 x4)) (x2 (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x5 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x5 x4 x4 x5) (x3 x4 x4 x5 x5 x5 x5) (x3 x4 x5 x5 x5 x4 x4)) (x2 (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x5 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x4 x5 x5 x4) (x3 x4 x4 x5 x5 x5 x5) (x3 x5 x4 x5 x5 x4 x4)) (x2 (x3 x4 x5 x4 x5 x4 x4) (x3 x4 x5 x4 x5 x5 x5) (x3 x4 x5 x4 x5 x4 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x5 x5 x5 x5 x4)) (x2 (x3 x5 x4 x5 x4 x4 x4) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x4 x5 x4 x4 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x4 x5 x5 x5) (x3 x5 x5 x5 x5 x5 x4))) (x1 (x2 (x3 x5 x4 x4 x5 x4 x5) (x3 x5 x4 x4 x4 x5 x5) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x5 x4 x5 x5 x4) (x3 x4 x4 x5 x5 x4 x4)) (x2 (x3 x4 x5 x5 x4 x5 x4) (x3 x4 x5 x4 x4 x5 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x5 x5 x4 x4 x5) (x3 x4 x4 x5 x5 x4 x4)) (x2 (x3 x4 x5 x5 x4 x5 x4) (x3 x4 x4 x5 x4 x5 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x4 x5 x5 x5 x5 x4) (x3 x5 x5 x4 x4 x4 x4)) (x2 (x3 x5 x4 x4 x5 x4 x5) (x3 x4 x4 x4 x5 x5 x5) (x3 x5 x4 x4 x5 x5 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x4 x5 x5 x4 x5) (x3 x5 x5 x4 x4 x4 x4)) (x2 (x3 x4 x5 x5 x4 x4 x4) (x3 x4 x5 x5 x4 x4 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x5 x5 x4 x4 x5) (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x4 x5 x5 x4)) (x2 (x3 x5 x4 x4 x5 x4 x4) (x3 x5 x4 x4 x5 x4 x4) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x4 x4 x5 x5 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x5 x4 x5 x4))) (x1 (x2 (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x5 x4 x5 x5 x5) (x3 x4 x5 x4 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x4)) (x2 (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x5 x5 x4 x5 x5) (x3 x5 x4 x4 x4 x4 x5) (x3 x4 x4 x5 x5 x5 x4)) (x2 (x3 x4 x4 x5 x5 x4 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x5 x5 x5 x5 x5) (x3 x4 x4 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x5 x4)) (x2 (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x4 x5 x5 x5 x5) (x3 x4 x4 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x4)) (x2 (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x5 x4 x5 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x4 x5 x4 x4 x5) (x3 x4 x4 x4 x4 x4 x4)) (x2 (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x4 x5 x4 x5) (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x4 x5 x5 x5) (x3 x4 x5 x4 x5 x5 x4) (x3 x4 x4 x4 x4 x4 x4))) (x1 (x2 (x3 x4 x5 x4 x4 x5 x5) (x3 x5 x4 x5 x5 x5 x4) (x3 x5 x5 x4 x5 x5 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x4 x5 x5 x4 x4) (x3 x4 x5 x5 x4 x5 x4)) (x2 (x3 x5 x4 x4 x4 x5 x5) (x3 x4 x5 x5 x5 x4 x5) (x3 x5 x5 x5 x4 x5 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x4 x4 x5 x5 x4 x4) (x3 x5 x4 x4 x5 x5 x4)) (x2 (x3 x4 x4 x4 x5 x5 x5) (x3 x5 x5 x5 x4 x5 x4) (x3 x4 x5 x5 x5 x5 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x5 x4 x4 x4 x4) (x3 x5 x4 x4 x5 x5 x4)) (x2 (x3 x4 x4 x5 x4 x5 x5) (x3 x5 x5 x4 x5 x4 x5) (x3 x5 x4 x5 x5 x5 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x5 x4 x4 x4 x4) (x3 x4 x5 x5 x4 x5 x4)) (x2 (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x4 x4) (x3 x4 x4 x4 x4 x5 x5) (x3 x4 x4 x4 x4 x5 x5) (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x4 x4)) (x2 (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4)))).
(* Parameter nth_6_tuple "368935f3a5f424f35961c43f39985442e0a4fe403f656e92d8a87b20af68c0d7" "d45c1fe6a3dff7795ce0a3b891aea8946efc8dceebae3c8b8977b41878b0e841" *)
Parameter nth_6_tuple : set -> set -> set -> set -> set -> set -> set -> set.
Definition TwoRamseyGraph_4_6_35_a : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => forall x4 : (set -> set -> set) -> (set -> set -> set) -> prop, x4 (TwoRamseyGraph_4_6_Church6_squared_a (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3)) (fun x5 x6 : set => x5) -> x4 (fun x5 x6 : set => x5) (TwoRamseyGraph_4_6_Church6_squared_a (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3))).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom missingprop_c92c0588de1ba6f1a5352aaa897a2358c5ed2f086efe24dfed8c7d8036084229 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> TwoRamseyGraph_4_6_35_a x0 x1 x0 x1)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_6 : nat_p 6.
Theorem missingprop_e9c856a0749bcc44622ee59e16fc8cc423cab4a47d2dfda91d2a7b241a11d1d5 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> not (TwoRamseyGraph_4_6_35_a x0 x1 x2 x3) -> or (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 x1 x2 x3) (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x2 x3 x0 x1))))).
admit.
Qed.
Axiom In_0_1 : 0 :e 1.
Theorem missingprop_aa95ae197366bdd7af9578caebeffb755902f2048c5698b44809d1487b2caed3 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 0 x0 u1 x1)).
admit.
Qed.
Axiom In_0_2 : 0 :e 2.
Theorem missingprop_bc3b511b08f8b3f53da00f8fccffdaa7e2bc8aaa23af28436f39d920dc0891c1 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 0 x0 u2 x1)).
admit.
Qed.
Axiom In_1_2 : 1 :e 2.
Theorem missingprop_dadac1e7b0e2702b8bd2e23336ce4dd3fb26599670c725f531c97507afdd22b9 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u1 x0 u2 x1)).
admit.
Qed.
Axiom In_0_3 : 0 :e 3.
Theorem missingprop_5b07726cc0c0341b0ac64f2a9516c1e5d9f956b5d19647bb6a04d4fc4cb10606 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 0 x0 u3 x1)).
admit.
Qed.
Axiom In_1_3 : 1 :e 3.
Theorem missingprop_1b97bfce4e2e9c939a93d49d9ac898b9496b155179f0132e0a900c170feead26 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u1 x0 u3 x1)).
admit.
Qed.
Axiom In_2_3 : 2 :e 3.
Theorem missingprop_10769ab7408ebe3c52fd04b34c5b0cb8dd87f3dabbd595460856d83e161d9749 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u2 x0 u3 x1)).
admit.
Qed.
Axiom In_0_4 : 0 :e 4.
Theorem missingprop_cc62f40dfe1b1276c511fee958913bbd16e736e49110f57f18c4824b513ba144 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 0 x0 u4 x1)).
admit.
Qed.
Axiom In_1_4 : 1 :e 4.
Theorem missingprop_3735b41c96039c37989f2a849ac3650f8ad5cd0e030a2ae7c35789c6d014f3a4 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u1 x0 u4 x1)).
admit.
Qed.
Axiom In_2_4 : 2 :e 4.
Theorem missingprop_10848d71146ecada1855512655be0cee04fc72f95aecee465640ded369c72afe : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u2 x0 u4 x1)).
admit.
Qed.
Axiom In_3_4 : 3 :e 4.
Theorem missingprop_230e04567f017ef2478d6e8c56b2b311f773706d8511278bf8684b2c52589bae : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u3 x0 u4 x1)).
admit.
Qed.
Axiom In_0_5 : 0 :e 5.
Theorem missingprop_edbb9b630d5cb7799d06b014d77198d4a1ff72a119ad51a600540359994ff13e : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 0 x0 u5 x1)).
admit.
Qed.
Axiom In_1_5 : 1 :e 5.
Theorem missingprop_a4b2f24c298c54349b5bac9d191fa47370ab3de90866b6b03669fc95dc0fde83 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u1 x0 u5 x1)).
admit.
Qed.
Axiom In_2_5 : 2 :e 5.
Theorem missingprop_18d7e6a1e6d4bd6fe55d6edfd1436c8ea0017601e1638b728200910abb3e5f04 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u2 x0 u5 x1)).
admit.
Qed.
Axiom In_3_5 : 3 :e 5.
Theorem missingprop_1c836ce17256583e0e374738505583c305fe7bd86cb78ef06b409fd810e068a2 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u3 x0 u5 x1)).
admit.
Qed.
Axiom In_4_5 : 4 :e 5.
Theorem missingprop_a9ac86ce0aa6d1c8d54ab6c814a168bef76f716264cae3b050de91e1e454e4ee : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u4 x0 u5 x1)).
admit.
Qed.
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Theorem missingprop_53cab53fbfd89a2e53fb86052a36979dbae90d51f871cfb4d9b6d8fbff698f94 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u1 x0 0 x1))).
admit.
Qed.
Theorem missingprop_3a2290fd8ca8423b4bf2e2bdce2adb40dcb24c80267608b75240a3f3ede36932 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u2 x0 0 x1))).
admit.
Qed.
Theorem missingprop_940a024c5cd543ea752be616f37170fa7ab0dc4b2b273e01fe19e63048f35e14 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u3 x0 0 x1))).
admit.
Qed.
Theorem missingprop_0dd27769bde4fea44400ffeb26206d2601026fae853f995a365ce889b59c971d : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u4 x0 0 x1))).
admit.
Qed.
Theorem missingprop_9a4630e1fe550a6015edbe2d352bb377095b99050943610048bb488bcf4b8851 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u5 x0 0 x1))).
admit.
Qed.
Theorem missingprop_e733f5da0729935b31484c38db8be9c518f0d6254de81ea3d483396e831c38db : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u2 x0 u1 x1))).
admit.
Qed.
Theorem missingprop_405568e6ab949fa3828255bc3a50cbb457ce24fd836720dc8675c916e645a129 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u3 x0 u1 x1))).
admit.
Qed.
Theorem missingprop_b6ae7d6fe4ca76624cc78469b45da659073f28beec70967b08c409868f313a4c : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u4 x0 u1 x1))).
admit.
Qed.
Theorem missingprop_055e134ab3edfe6c608e3e926fa4a098e862273d9b5d332ee63097c5e5933043 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u5 x0 u1 x1))).
admit.
Qed.
Theorem missingprop_2e42fff90fb2a06d773f7b3e89c8891d9b8d56d803014aa27515ff3224bf257f : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u3 x0 u2 x1))).
admit.
Qed.
Theorem missingprop_1c9b45f157cf3b8802a28e1aa0f67310bedb9e0ac23adb14d7b6703de35948a9 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u4 x0 u2 x1))).
admit.
Qed.
Theorem missingprop_14be7ced1dd3f445b9da813642cc55016162b347d5cf79759f978655bb5470c4 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u5 x0 u2 x1))).
admit.
Qed.
Theorem missingprop_b7b7b5dcf830e5b5a3e955f86f760a2e4754772663d9fdc28f03fba37e0b90cb : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u4 x0 u3 x1))).
admit.
Qed.
Theorem missingprop_998fef76a97518d9fbf9e6a43cfb955f2e86d75d2063fc879f426344712abc4f : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u5 x0 u3 x1))).
admit.
Qed.
Theorem missingprop_7ac85815fa09d0b836a6c08510f4b8101beb1044faa968c9ab2f1805bc917279 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 u5 x0 u4 x1))).
admit.
Qed.
Theorem missingprop_1437d141921832ed9c55f2d378fd70ea7d766d2f7544d35ac14f9d74ca6209f3 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 0 x0 u1).
admit.
Qed.
Theorem missingprop_a54cc415e76a8aadb990a7076e07422d21852a2467e41d4e78fa1ab804f9f053 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 0 x0 u2).
admit.
Qed.
Theorem missingprop_33ddd9d63ce87ef02de94639b5b698bc90790b006dd2df20ed376f0efab9d930 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u1 x0 u2).
admit.
Qed.
Theorem missingprop_97bc96bc4344efd325210d5e5a56648b83856d95c515547399f58a3664f9f616 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 0 x0 u3).
admit.
Qed.
Theorem missingprop_070ea0a9877f2a9a83de5ae1c8136a7c31b7d929f3ff2fef7633fdf19c6cb9c3 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u1 x0 u3).
admit.
Qed.
Theorem missingprop_4c49fd40dc5c7fc1d3ffbf59c4a2701c96afaf187bc02aae14bdaefb6fa009be : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u2 x0 u3).
admit.
Qed.
Theorem missingprop_216ad4a4b91e12b59a9a66a0739dd10621d4fd6a807f205602f903d8c9a08b31 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 0 x0 u4).
admit.
Qed.
Theorem missingprop_5ace589a9c198b7825a470611a64ed37d70ace53ca9b089726086f9343bef9fa : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u1 x0 u4).
admit.
Qed.
Theorem missingprop_97e418d40565500d634fe41adce77e9a2c92fc21284f742d01b1be4247e01067 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u2 x0 u4).
admit.
Qed.
Theorem missingprop_6190f9dd85569ac57d7481abc43ddb13c85c465ffeb1798afb826c2f9e101aa3 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u3 x0 u4).
admit.
Qed.
Theorem missingprop_89a97514fcec2254144014ed3895292ec3a55fff69b0ca9ff2c07f46c3a91108 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 0 x0 u5).
admit.
Qed.
Theorem missingprop_f22043eb23350079637bf32c84a239cad53018acf814d2f60206399f23408897 : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u1 x0 u5).
admit.
Qed.
Theorem missingprop_acb5b545d6195ecdb17109889b29fa352bcb615b6b9b98b84edff3a56a411e8d : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u2 x0 u5).
admit.
Qed.
Theorem missingprop_8ca3332e118dffb91a102c5825f7208db60e8bff959cf8ba52eb93361f0d967b : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u3 x0 u5).
admit.
Qed.
Theorem missingprop_cfefb6070335ae49ddb49cedcd47a8df5d92be03b687da84435d70120b52d07f : (forall x0, x0 :e u6 -> missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u4 x0 u5).
admit.
Qed.
Theorem missingprop_15da6373ce4b4c2b91f5119f527e589e2152b271b074f73dca1a38325d8ecae1 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 0 x0 0)).
admit.
Qed.
Theorem missingprop_61c4188dbb2a1d337a4412b1dcdcdf668b008e069eb1ab0bc785e069f18942df : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u1 x0 0)).
admit.
Qed.
Theorem missingprop_a732c897f90e88486691866af57d4f80a685c77f8fbee3bf77d694ce952ca156 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u2 x0 0)).
admit.
Qed.
Theorem missingprop_abd1f90d1ef16cf38667afb99371e16b6c5fdf3a4408566cac901438695adf66 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u3 x0 0)).
admit.
Qed.
Theorem missingprop_0089a12c301440a399488ed02e37863bb653ec7658c7b064e6c1b0238cca3f53 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u4 x0 0)).
admit.
Qed.
Theorem missingprop_d0f7b5f9660ba00c51cb18211d5cc2821e7214aaa335029c97466bff02d0fbbf : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u5 x0 0)).
admit.
Qed.
Theorem missingprop_d8b35836a2c5061bdf9b97906ce68c2fd25ed02d5f7fb0583b0100398026650b : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u1 x0 u1)).
admit.
Qed.
Theorem missingprop_140377b14fa5953d7fec1a10bb3a7f08f0348fcf79b5c79493c7bb80271ce93e : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u2 x0 u1)).
admit.
Qed.
Theorem missingprop_3d5ab861ea4bce05da6a4392cc4c49b04ee8a7cf11f0e323e584cc002e3477c5 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u3 x0 u1)).
admit.
Qed.
Theorem missingprop_cce20fd302ad9521fc5dba3d7560820008e2a011060b1c1e6e702fdfea256b91 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u4 x0 u1)).
admit.
Qed.
Theorem missingprop_8acd542ae644ef988027637b637354b8835d867afffe657d296fad32301b9b0f : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u5 x0 u1)).
admit.
Qed.
Theorem missingprop_aa9b765fea7a2acd56f24f9615e4a93a72ac95a94c5ce172349991efaf61d15a : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u2 x0 u2)).
admit.
Qed.
Theorem missingprop_c13224cfaa915121ed0a74b023e751cee5473a6939b7ba13567ea8d5e9f7576b : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u3 x0 u2)).
admit.
Qed.
Theorem missingprop_6bb61ce746e63f549926b11064c53822f40e2042927a02ba7758fe1cae4c0db1 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u4 x0 u2)).
admit.
Qed.
Theorem missingprop_055a8893bfe1d200ce89be1f53e1d73ccc2f0609b4e64c03bde9fa36bf78792d : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u5 x0 u2)).
admit.
Qed.
Theorem missingprop_f03d88b469fc59b728f90be0518e749a6d4aac5152e1e7b89790a4f7588bedc8 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u3 x0 u3)).
admit.
Qed.
Theorem missingprop_2be829d5953d6a37dcb646dbe3e339d48c21df9335033594b86d9b1aea6d1b2f : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u4 x0 u3)).
admit.
Qed.
Theorem missingprop_eee1bc351a044bbaeb0a86009353dbcaa428283a27d1c4dcf6c83d4841419ea6 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u5 x0 u3)).
admit.
Qed.
Theorem missingprop_04cd4cf5a881e6976c9a5cdf2a7ec13b6e79a0c943ae3f22f3d94149eb5bdd42 : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u4 x0 u4)).
admit.
Qed.
Theorem missingprop_5f91bb361b061303b4dbdc18ef131293912fc5ae76eed278e1ab00f7e1cf4bdf : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u5 x0 u4)).
admit.
Qed.
Theorem missingprop_838887897f485815309573cecf294f1ab3c550789cdd159362b3d4db4b9edbbf : (forall x0, x0 :e u6 -> not (missingname_4ce65ead716f3b8765163c90661070cc96dba600264b8366d9c24c0dd3e2a8e9 x0 u5 x0 u5)).
admit.
Qed.
Axiom missingprop_d3b792af1adffec16ce4fc340f1433694e312f9a299dc66e7bdd660386d0095e : nth_6_tuple u4 = (fun x1 x2 x3 x4 x5 x6 : set => x5).
Axiom missingprop_d1ab6c05d827ab2f0497648eeb2e74b0b0260f4e004a74cbc06a5c0a175e4a2a : nth_6_tuple u5 = (fun x1 x2 x3 x4 x5 x6 : set => x6).
Axiom cases_6 : (forall x0, x0 :e u6 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 x0)).
Axiom missingprop_5e063b347ef5ac56a92183cc00c589df53087ab1e0b6353a236a973dc2f46966 : nth_6_tuple 0 = (fun x1 x2 x3 x4 x5 x6 : set => x1).
Axiom missingprop_487e017004ecabac0b8e518f0fcaf45b502b6f60f5af04ddefe015bde12eaf50 : nth_6_tuple u1 = (fun x1 x2 x3 x4 x5 x6 : set => x2).
Axiom missingprop_9205282ef77caa3eed787eb4fa460a34079ef649c9bf4aa55e938da8cedd6fa2 : nth_6_tuple u2 = (fun x1 x2 x3 x4 x5 x6 : set => x3).
Axiom missingprop_d77aca9102a0a7995bbfb825c57cbe3520e1f56683b5c476fb6c9389a8c86331 : nth_6_tuple u3 = (fun x1 x2 x3 x4 x5 x6 : set => x4).
Theorem missingprop_3977bf1090f933d3709f6b2041283bba6d87781a8eeab5f92047019ad110a939 : (forall x0, x0 :e u6 -> TwoRamseyGraph_4_6_35_a u4 u4 u5 x0).
admit.
Qed.
Theorem missingprop_7cb93b98f252f18e4c77c51e548e5d9375b06b17a1739279bbecb77acb7c3a44 : (forall x0, x0 :e u6 -> TwoRamseyGraph_4_6_35_a u4 u5 u5 x0).
admit.
Qed.
