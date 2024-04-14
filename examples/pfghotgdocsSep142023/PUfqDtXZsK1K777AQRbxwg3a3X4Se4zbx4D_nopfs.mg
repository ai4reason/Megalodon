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
(* Parameter unpack_p_i "e24c519b20075049733185165766605b441fbcc5ee0900c9bd48c0c792ba5859" "dda44134499f98b412d13481678ca2262d520390676ab6b40e0cb0e0768412f6" *)
Parameter unpack_p_i : set -> (set -> (set -> prop) -> set) -> set.
(* Parameter pack_p "3c539dbbee9d5ff440b9024180e52e9c2adde77bbaa8264d8f67d724d8c8cb25" "d5afae717eff5e7035dc846b590d96bd5a7727284f8ff94e161398c148ab897f" *)
Parameter pack_p : set -> (set -> prop) -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 : set -> set -> set :=
 (fun x0 x1 : set => unpack_p_i x0 (fun x2 : set => fun x3 : set -> prop => unpack_p_i x1 (fun x4 : set => fun x5 : set -> prop => pack_p (setprod x2 x4) (fun x6 : set => and (x3 (ap x6 0)) (x5 (ap x6 1)))))).
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom unpack_p_i_eq : (forall x0 : set -> (set -> prop) -> set, forall x1, forall x2 : set -> prop, (forall x3 : set -> prop, (forall x4, x4 :e x1 -> iff (x2 x4) (x3 x4)) -> x0 x1 x3 = x0 x1 x2) -> unpack_p_i (pack_p x1 x2) x0 = x0 x1 x2).
Axiom pack_p_ext : (forall x0, forall x1 x2 : set -> prop, (forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)) -> pack_p x0 x1 = pack_p x0 x2).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem missingprop_775d1626b874a8f77d588c43955b37a0757af291713072b79761686565010acc : (forall x0, forall x1 : set -> prop, forall x2, forall x3 : set -> prop, forall x4 : set -> set -> prop, x4 (missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 (pack_p x0 x1) (pack_p x2 x3)) (pack_p (setprod x0 x2) (fun x5 : set => and (x1 (ap x5 0)) (x3 (ap x5 1)))) -> x4 (pack_p (setprod x0 x2) (fun x5 : set => and (x1 (ap x5 0)) (x3 (ap x5 1)))) (missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 (pack_p x0 x1) (pack_p x2 x3))).
admit.
Qed.
Definition struct_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> prop, x1 (pack_p x2 x3)) -> x1 x0).
Axiom pack_struct_p_I : (forall x0, forall x1 : set -> prop, struct_p (pack_p x0 x1)).
Theorem missingprop_a8e710c43d2d421a4e74fd1a35a2aa81549a76aa8b6394f6178a5202ccb14044 : (forall x0 x1, struct_p x0 -> struct_p x1 -> struct_p (missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 x0 x1)).
admit.
Qed.
Definition MetaCat_product_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x6 x4 x7)) (Hom x6 x5 x8)) (forall x10, Obj x10 -> (forall x11 x12, Hom x10 x4 x11 -> Hom x10 x5 x12 -> and (and (and (Hom x10 x6 (x9 x10 x11 x12)) (Comp x10 x6 x4 x7 (x9 x10 x11 x12) = x11)) (Comp x10 x6 x5 x8 (x9 x10 x11 x12) = x12)) (forall x13, Hom x10 x6 x13 -> Comp x10 x6 x4 x7 x13 = x11 -> Comp x10 x6 x5 x8 x13 = x12 -> x13 = x9 x10 x11 x12)))).
Definition MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => forall x8 x9, Obj x8 -> Obj x9 -> MetaCat_product_p Obj Hom Id Comp x8 x9 (x4 x8 x9) (x5 x8 x9) (x6 x8 x9) (x7 x8 x9)).
(* Parameter UnaryPredHom "44ed079d6a65865657792e1cc515b76a1121cfdc9af8f6c21f8cc848fa700837" "5d0201189805d03fc856c2fa62f35171b88a531f7deeee6199625094c02eddd7" *)
Parameter UnaryPredHom : set -> set -> set -> prop.
(* Parameter struct_id "ddbfe293c94f63568d97903ab92695c5b104ee51e1b7d4e7dd29a87510065054" "ac22e99093b43e0b6246d1a60c33b72b22acf28c29494701ebd52fa3ba6ac8bc" *)
Parameter struct_id : set -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Definition struct_comp : set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam_comp (ap x0 0)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Axiom pack_p_0_eq2 : (forall x0, forall x1 : set -> prop, forall x2 : set -> set -> prop, x2 x0 (ap (pack_p x0 x1) 0) -> x2 (ap (pack_p x0 x1) 0) x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom missingprop_63c01b8f599732ba7bc3b48c28c0f10755230e5cc9f0717c7895602d2eaf01d3 : (forall x0 x1, forall x2 x3 : set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e lam x0 x1)).
Theorem missingprop_92ad80f77e0e0f57984196a1c5b97eaceff60da34aaa2014f3d9d81cba2d8285 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 x1 x2)) -> MetaCat_product_constr_p x0 UnaryPredHom struct_id struct_comp missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 0)) (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 1)) (fun x1 x2 x3 x4 x5 : set => lam (ap x3 0) (fun x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (ap x4 x6) (ap x5 x6))))).
admit.
Qed.
Theorem missingprop_568849b200a6db1803481a4b522b7d0974e19ca60346679f010be1ef4325a125 : MetaCat_product_constr_p struct_p UnaryPredHom struct_id struct_comp missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 0)) (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 1)) (fun x0 x1 x2 x3 x4 : set => lam (ap x2 0) (fun x5 : set => lam 2 (fun x6 : set => If_i (x6 = 0) (ap x3 x5) (ap x4 x5)))).
admit.
Qed.
Theorem missingprop_097713311b3a8f262dee5be9217eb9add9c303ef2514caa7f22ffa90c0bd6955 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p struct_p UnaryPredHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition missingname_3f5e4d7dac06de0843f46dc4b68109cc39578ead061dad92d8a4b8042c6b2488 : set -> set -> set :=
 (fun x0 x1 : set => unpack_p_i x0 (fun x2 : set => fun x3 : set -> prop => unpack_p_i x1 (fun x4 : set => fun x5 : set -> prop => pack_p (setexp x4 x2) (fun x6 : set => forall x7, x7 :e x2 -> x3 x7 -> x5 (ap x6 x7))))).
Theorem missingprop_8a66e4bdb214ee413447ac05cf120a4276b1afb59a2fc210ec5bfee37471a43f : (forall x0, forall x1 : set -> prop, forall x2, forall x3 : set -> prop, forall x4 : set -> set -> prop, x4 (missingname_3f5e4d7dac06de0843f46dc4b68109cc39578ead061dad92d8a4b8042c6b2488 (pack_p x0 x1) (pack_p x2 x3)) (pack_p (setexp x2 x0) (fun x5 : set => forall x6, x6 :e x0 -> x1 x6 -> x3 (ap x5 x6))) -> x4 (pack_p (setexp x2 x0) (fun x5 : set => forall x6, x6 :e x0 -> x1 x6 -> x3 (ap x5 x6))) (missingname_3f5e4d7dac06de0843f46dc4b68109cc39578ead061dad92d8a4b8042c6b2488 (pack_p x0 x1) (pack_p x2 x3))).
admit.
Qed.
Theorem missingprop_212755d361abab85d95d00353f4e5610e7e57f114b7f880731df7207110460de : (forall x0 x1, struct_p x0 -> struct_p x1 -> struct_p (missingname_3f5e4d7dac06de0843f46dc4b68109cc39578ead061dad92d8a4b8042c6b2488 x0 x1)).
admit.
Qed.
Definition MetaCat_exp_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 x10 x11 : set => fun x12 : set -> set -> set => and (and (and (and (Obj x8) (Obj x9)) (Obj x10)) (Hom (x4 x10 x8) x9 x11)) (forall x13, Obj x13 -> (forall x14, Hom (x4 x13 x8) x9 x14 -> and (and (Hom x13 x10 (x12 x13 x14)) (Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 (x12 x13 x14) (x5 x13 x8)) (x6 x13 x8)) = x14)) (forall x15, Hom x13 x10 x15 -> Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 x15 (x5 x13 x8)) (x6 x13 x8)) = x14 -> x15 = x12 x13 x14)))).
Definition MetaCat_exp_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> set -> set -> set => and (MetaCat_product_constr_p Obj Hom Id Comp x4 x5 x6 x7) (forall x11 x12, Obj x11 -> Obj x12 -> MetaCat_exp_p Obj Hom Id Comp x4 x5 x6 x7 x11 x12 (x8 x11 x12) (x9 x11 x12) (x10 x11 x12))).
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Theorem missingprop_e80d3ff9e076a49894fea651aedbf5efa870beadd926687cbeb5a1675dfa0669 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 x1 x2)) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (missingname_3f5e4d7dac06de0843f46dc4b68109cc39578ead061dad92d8a4b8042c6b2488 x1 x2)) -> MetaCat_exp_constr_p x0 UnaryPredHom struct_id struct_comp missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 0)) (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 1)) (fun x1 x2 x3 x4 x5 : set => lam (ap x3 0) (fun x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (ap x4 x6) (ap x5 x6)))) missingname_3f5e4d7dac06de0843f46dc4b68109cc39578ead061dad92d8a4b8042c6b2488 (fun x1 x2 : set => lam (setprod (setexp (ap x2 0) (ap x1 0)) (ap x1 0)) (fun x3 : set => ap (ap x3 0) (ap x3 1))) (fun x1 x2 x3 x4 : set => lam (ap x3 0) (fun x5 : set => lam (ap x1 0) (fun x6 : set => ap x4 (lam 2 (fun x7 : set => If_i (x7 = 0) x5 x6)))))).
admit.
Qed.
Theorem missingprop_f0bec4b232a3925836856d927d8b3e9ee95e281b95c8c1cf3ec1df830dcc5be2 : MetaCat_exp_constr_p struct_p UnaryPredHom struct_id struct_comp missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 0)) (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 1)) (fun x0 x1 x2 x3 x4 : set => lam (ap x2 0) (fun x5 : set => lam 2 (fun x6 : set => If_i (x6 = 0) (ap x3 x5) (ap x4 x5)))) missingname_3f5e4d7dac06de0843f46dc4b68109cc39578ead061dad92d8a4b8042c6b2488 (fun x0 x1 : set => lam (setprod (setexp (ap x1 0) (ap x0 0)) (ap x0 0)) (fun x2 : set => ap (ap x2 0) (ap x2 1))) (fun x0 x1 x2 x3 : set => lam (ap x2 0) (fun x4 : set => lam (ap x0 0) (fun x5 : set => ap x3 (lam 2 (fun x6 : set => If_i (x6 = 0) x4 x5))))).
admit.
Qed.
Theorem missingprop_36f6f121792f275d6f84c8aec52634632890a5acd3934ae0d4cb7153104b2be6 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p struct_p UnaryPredHom struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_p_o "4b92ca0383b3989d01ddc4ec8bdf940b54163f9a29e460dfd502939eb880162f" "30f11fc88aca72af37fd2a4235aa22f28a552bbc44f1fb01f4edf7f2b7e376ac" *)
Parameter unpack_p_o : set -> (set -> (set -> prop) -> prop) -> prop.
Definition PtdPred : set -> prop :=
 (fun x0 : set => and (struct_p x0) (unpack_p_o x0 (fun x1 : set => fun x2 : set -> prop => forall x3 : prop, (forall x4, and (x4 :e x1) (x2 x4) -> x3) -> x3))).
Axiom missingprop_2576d2815b46016e5e13a9989b4e9789629d83c56ed1c92a4cda0de077a20752 : (forall x0, forall x1 : set -> prop, (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 x3) -> x2) -> x2) -> PtdPred (pack_p x0 x1)).
Axiom missingprop_c86200a2eefb0ff844f50b29d5cbeaa2ee14856a2db63542bcbf63218f0d0f1e : (forall x0, PtdPred x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> prop, forall x4, x4 :e x2 -> x3 x4 -> x1 (pack_p x2 x3)) -> x1 x0)).
Theorem missingprop_01e5ba77601a47d7c937d2e2e0b4445cbf9fd1d2ec0d1e2494cce43f1d84adff : (forall x0, PtdPred x0 -> struct_p x0).
admit.
Qed.
Theorem missingprop_9d22e38701f1d009ba8d0dac3195f52759ba42243f1b9e00065f29dedcc46115 : (forall x0 x1, PtdPred x0 -> PtdPred x1 -> PtdPred (missingname_ec3b38eb44d1158a2e27de9482cf619ff5dcd2ad4b67fc94102b7316d1962666 x0 x1)).
admit.
Qed.
Theorem missingprop_27a094e80b986cdf42eccdde9b4537715ea93d2b8fd49aebc0b351655f2e6700 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_fd96b04c0c9428d85d7827201684dd871d1a3c8b2bd5dd3d0c364486e0e9d4fe : (forall x0 x1, PtdPred x0 -> PtdPred x1 -> PtdPred (missingname_3f5e4d7dac06de0843f46dc4b68109cc39578ead061dad92d8a4b8042c6b2488 x0 x1)).
admit.
Qed.
Theorem missingprop_9bd4d5c9759a225b04c509687ce9c39cf37014cec87fcf869e11cc9c143f9fc1 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
