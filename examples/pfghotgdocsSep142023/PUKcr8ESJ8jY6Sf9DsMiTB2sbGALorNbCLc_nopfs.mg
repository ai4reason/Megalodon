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
(* Parameter unpack_r_i "8e3580f89907c6b36f6b57ad7234db3561b008aa45f8fa86d5e51a7a85cd74b6" "3ace9e6e064ec2b6e839b94e81788f9c63b22e51ec9dec8ee535d50649401cf4" *)
Parameter unpack_r_i : set -> (set -> (set -> set -> prop) -> set) -> set.
(* Parameter pack_r "39d80099e1b48aed4548f424ae4f1ff25b2d595828aff4b3a5abe232ca0348b5" "217a7f92acc207b15961c90039aa929f0bd5d9212f66ce5595c3af1dd8b9737e" *)
Parameter pack_r : set -> (set -> set -> prop) -> set.
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
Definition BinReln_product : set -> set -> set :=
 (fun x0 x1 : set => unpack_r_i x0 (fun x2 : set => fun x3 : set -> set -> prop => unpack_r_i x1 (fun x4 : set => fun x5 : set -> set -> prop => pack_r (setprod x2 x4) (fun x6 x7 : set => and (x3 (ap x6 0) (ap x7 0)) (x5 (ap x6 1) (ap x7 1)))))).
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom unpack_r_i_eq : (forall x0 : set -> (set -> set -> prop) -> set, forall x1, forall x2 : set -> set -> prop, (forall x3 : set -> set -> prop, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> iff (x2 x4 x5) (x3 x4 x5))) -> x0 x1 x3 = x0 x1 x2) -> unpack_r_i (pack_r x1 x2) x0 = x0 x1 x2).
Axiom pack_r_ext : (forall x0, forall x1 x2 : set -> set -> prop, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> iff (x1 x3 x4) (x2 x3 x4))) -> pack_r x0 x1 = pack_r x0 x2).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem missingprop_efcdca50692a8e5dea3b2dabd19b7c98b28ec0cd127c886a2f9539f6c2a2ba01 : (forall x0, forall x1 : set -> set -> prop, forall x2, forall x3 x4 : set -> set -> prop, x4 (BinReln_product (pack_r x0 x1) (pack_r x2 x3)) (pack_r (setprod x0 x2) (fun x5 x6 : set => and (x1 (ap x5 0) (ap x6 0)) (x3 (ap x5 1) (ap x6 1)))) -> x4 (pack_r (setprod x0 x2) (fun x5 x6 : set => and (x1 (ap x5 0) (ap x6 0)) (x3 (ap x5 1) (ap x6 1)))) (BinReln_product (pack_r x0 x1) (pack_r x2 x3))).
admit.
Qed.
Definition struct_r : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, x1 (pack_r x2 x3)) -> x1 x0).
Axiom pack_struct_r_I : (forall x0, forall x1 : set -> set -> prop, struct_r (pack_r x0 x1)).
Theorem missingprop_82d75d63f26b09ba7055fe0e3dd6cbd0c974eae3e394476d956067df4f96debf : (forall x0 x1, struct_r x0 -> struct_r x1 -> struct_r (BinReln_product x0 x1)).
admit.
Qed.
Definition MetaCat_product_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x6 x4 x7)) (Hom x6 x5 x8)) (forall x10, Obj x10 -> (forall x11 x12, Hom x10 x4 x11 -> Hom x10 x5 x12 -> and (and (and (Hom x10 x6 (x9 x10 x11 x12)) (Comp x10 x6 x4 x7 (x9 x10 x11 x12) = x11)) (Comp x10 x6 x5 x8 (x9 x10 x11 x12) = x12)) (forall x13, Hom x10 x6 x13 -> Comp x10 x6 x4 x7 x13 = x11 -> Comp x10 x6 x5 x8 x13 = x12 -> x13 = x9 x10 x11 x12)))).
Definition MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => forall x8 x9, Obj x8 -> Obj x9 -> MetaCat_product_p Obj Hom Id Comp x8 x9 (x4 x8 x9) (x5 x8 x9) (x6 x8 x9) (x7 x8 x9)).
(* Parameter BinRelnHom "352304ebb6c77dbc4e2a952e767857a98538e43de1c35fb4bcd6c99fca02ae7e" "acf0f04c6a55a143e3ed8404c0fa6b09b323d938c83532f081b47091e31c4eb3" *)
Parameter BinRelnHom : set -> set -> set -> prop.
(* Parameter struct_id "ddbfe293c94f63568d97903ab92695c5b104ee51e1b7d4e7dd29a87510065054" "ac22e99093b43e0b6246d1a60c33b72b22acf28c29494701ebd52fa3ba6ac8bc" *)
Parameter struct_id : set -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Definition struct_comp : set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam_comp (ap x0 0)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Axiom pack_r_0_eq2 : (forall x0, forall x1 x2 : set -> set -> prop, x2 x0 (ap (pack_r x0 x1) 0) -> x2 (ap (pack_r x0 x1) 0) x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom missingprop_4e486761c3790f4990f398ce8c16ea7ac5915924a294f8e5b06e45030e68e983 : (forall x0 x1, forall x2 x3 : set -> set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4)).
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
Theorem missingprop_5f5149dc445b1bf6ca4a7f60e27b87771b4704fa8e9610ac4ab806ac27b93c0b : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (BinReln_product x1 x2)) -> MetaCat_product_constr_p x0 BinRelnHom struct_id struct_comp BinReln_product (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 0)) (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 1)) (fun x1 x2 x3 x4 x5 : set => lam (ap x3 0) (fun x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (ap x4 x6) (ap x5 x6))))).
admit.
Qed.
Theorem missingprop_2e9ebbd3ca3566feb8efd61fe8bb5f0f7176bdb0789fa8bc2201aa9af67bb516 : MetaCat_product_constr_p struct_r BinRelnHom struct_id struct_comp BinReln_product (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 0)) (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 1)) (fun x0 x1 x2 x3 x4 : set => lam (ap x2 0) (fun x5 : set => lam 2 (fun x6 : set => If_i (x6 = 0) (ap x3 x5) (ap x4 x5)))).
admit.
Qed.
Theorem missingprop_907117947d3e5122f17dc0ad87d42ef61641eaa3908e950d289d200dd82717a4 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p struct_r BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition BinReln_exp : set -> set -> set :=
 (fun x0 x1 : set => unpack_r_i x0 (fun x2 : set => fun x3 : set -> set -> prop => unpack_r_i x1 (fun x4 : set => fun x5 : set -> set -> prop => pack_r (setexp x4 x2) (fun x6 x7 : set => forall x8, x8 :e x2 -> (forall x9, x9 :e x2 -> x3 x8 x9 -> x5 (ap x6 x8) (ap x7 x9)))))).
Theorem missingprop_96b4efd33e0eab34902b0210050a90e84d3feb02930f35613e1732b2c4e43b01 : (forall x0, forall x1 : set -> set -> prop, forall x2, forall x3 x4 : set -> set -> prop, x4 (BinReln_exp (pack_r x0 x1) (pack_r x2 x3)) (pack_r (setexp x2 x0) (fun x5 x6 : set => forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x1 x7 x8 -> x3 (ap x5 x7) (ap x6 x8)))) -> x4 (pack_r (setexp x2 x0) (fun x5 x6 : set => forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x1 x7 x8 -> x3 (ap x5 x7) (ap x6 x8)))) (BinReln_exp (pack_r x0 x1) (pack_r x2 x3))).
admit.
Qed.
Theorem missingprop_32580ce54fffb5b46927efd90ca1dd97b55002b701a978a208d8cf738022c071 : (forall x0 x1, struct_r x0 -> struct_r x1 -> struct_r (BinReln_exp x0 x1)).
admit.
Qed.
Definition MetaCat_exp_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 x10 x11 : set => fun x12 : set -> set -> set => and (and (and (and (Obj x8) (Obj x9)) (Obj x10)) (Hom (x4 x10 x8) x9 x11)) (forall x13, Obj x13 -> (forall x14, Hom (x4 x13 x8) x9 x14 -> and (and (Hom x13 x10 (x12 x13 x14)) (Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 (x12 x13 x14) (x5 x13 x8)) (x6 x13 x8)) = x14)) (forall x15, Hom x13 x10 x15 -> Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 x15 (x5 x13 x8)) (x6 x13 x8)) = x14 -> x15 = x12 x13 x14)))).
Definition MetaCat_exp_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> set -> set -> set => and (MetaCat_product_constr_p Obj Hom Id Comp x4 x5 x6 x7) (forall x11 x12, Obj x11 -> Obj x12 -> MetaCat_exp_p Obj Hom Id Comp x4 x5 x6 x7 x11 x12 (x8 x11 x12) (x9 x11 x12) (x10 x11 x12))).
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Theorem missingprop_ebb79863848e46632cd8c07c8999ac06e4b72b6f254794a2b50220d88403d9cf : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (BinReln_product x1 x2)) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (BinReln_exp x1 x2)) -> MetaCat_exp_constr_p x0 BinRelnHom struct_id struct_comp BinReln_product (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 0)) (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 1)) (fun x1 x2 x3 x4 x5 : set => lam (ap x3 0) (fun x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (ap x4 x6) (ap x5 x6)))) BinReln_exp (fun x1 x2 : set => lam (setprod (setexp (ap x2 0) (ap x1 0)) (ap x1 0)) (fun x3 : set => ap (ap x3 0) (ap x3 1))) (fun x1 x2 x3 x4 : set => lam (ap x3 0) (fun x5 : set => lam (ap x1 0) (fun x6 : set => ap x4 (lam 2 (fun x7 : set => If_i (x7 = 0) x5 x6)))))).
admit.
Qed.
Theorem missingprop_15a03e4511aa5806bc6cf9d6c6abe4a3c7ed876c7d0a86cc945306933a686512 : MetaCat_exp_constr_p struct_r BinRelnHom struct_id struct_comp BinReln_product (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 0)) (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 1)) (fun x0 x1 x2 x3 x4 : set => lam (ap x2 0) (fun x5 : set => lam 2 (fun x6 : set => If_i (x6 = 0) (ap x3 x5) (ap x4 x5)))) BinReln_exp (fun x0 x1 : set => lam (setprod (setexp (ap x1 0) (ap x0 0)) (ap x0 0)) (fun x2 : set => ap (ap x2 0) (ap x2 1))) (fun x0 x1 x2 x3 : set => lam (ap x2 0) (fun x4 : set => lam (ap x0 0) (fun x5 : set => ap x3 (lam 2 (fun x6 : set => If_i (x6 = 0) x4 x5))))).
admit.
Qed.
Theorem missingprop_6e38f16e9cabff486bffe172e93b16c84c26af63dde521044c8880e991d5a558 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p struct_r BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_r_o "8d2ef9c9e522891d1fe605a62dffeab8aefb6325650e4eab14135e7eee8002c5" "e3e6af0984cda0a02912e4f3e09614b67fc0167c625954f0ead4110f52ede086" *)
Parameter unpack_r_o : set -> (set -> (set -> set -> prop) -> prop) -> prop.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition IrreflexiveSymmetricReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))))).
Axiom missingprop_ee6d5f0119c23d2d365410bede08f376d1ae2b56e8e57cf05f64e993f9b9e31e : (forall x0, forall x1 : set -> set -> prop, forall x2 : prop -> prop -> prop, x2 (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 x6 -> x4 x6 x5)))) (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 -> x1 x4 x3))) -> x2 (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 -> x1 x4 x3))) (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 x6 -> x4 x6 x5))))).
Axiom missingprop_d442b731cc8a623579f119dd4140f334acbb8f35c49c35a487654154f8239ef6 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> IrreflexiveSymmetricReln (pack_r x0 x1)).
Theorem missingprop_034efb78ebb5063d16d232d7a2af450524a44508ccd003479f3d4a1b105247b8 : (forall x0, IrreflexiveSymmetricReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> not (x3 x4 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> x1 (pack_r x2 x3)) -> x1 x0)).
admit.
Qed.
Theorem missingprop_05312360653906419ddc5ed690eda929a1e21c95a8d9e0f4553c6198beb226c6 : (forall x0, IrreflexiveSymmetricReln x0 -> struct_r x0).
admit.
Qed.
Theorem missingprop_e62c4beb343b4251ca317ae7bd4b6f6de6cddc4e085121ea257283bbd82236ac : (forall x0 x1, IrreflexiveSymmetricReln x0 -> IrreflexiveSymmetricReln x1 -> IrreflexiveSymmetricReln (BinReln_product x0 x1)).
admit.
Qed.
Theorem missingprop_3c8643c587af8b76606b3bd4c132b0669b42e58d4e2858afde92b9385ea31cd1 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition PER : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_b2515235786361aea7c15ac6711d5751cd13b11988163a3b347abdb56aff828a : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> PER (pack_r x0 x1)).
Axiom missingprop_c1d3826129d2eb54a8f1e40a6116497a0cdb00a6ee455a0b01d56d09477d50d0 : (forall x0, PER x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
Theorem missingprop_b83e21a7ff430273a400fd44f3e1ac3b8adf6ec62400eb66d332c086ffa3a209 : (forall x0, PER x0 -> struct_r x0).
admit.
Qed.
Theorem missingprop_bb224621575baeee79d171262a7dc88360ee4afa8490ed03591370cb68431a54 : (forall x0 x1, PER x0 -> PER x1 -> PER (BinReln_product x0 x1)).
admit.
Qed.
Theorem missingprop_7424d1576845fd7b3796312ad5767cec794f06149f4f042f760ca6e0fb95d565 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p PER BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_6d2631055db1b5a647aa01d9d0b235d480875cd97f5723b47e415b36a3a894b1 : (forall x0 x1, PER x0 -> PER x1 -> PER (BinReln_exp x0 x1)).
admit.
Qed.
Theorem missingprop_88a055e42b69d69b35cca86ef1a1f164b360bedd5a614f06e1f400e013ef910c : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p PER BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition EquivReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (and (forall x3, x3 :e x1 -> x2 x3 x3) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_46185b99972d7cc500b0fcea77da3881e5aca4376b72d7aefbcc4420b07dadec : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> x1 x2 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> EquivReln (pack_r x0 x1)).
Axiom missingprop_6402afcf89af96ded942e84b9859aeeef4ba7eaef1979737905398451311e541 : (forall x0, EquivReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> x3 x4 x4) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
Theorem missingprop_999856ae9112da4d6c02cc0a35b6747ba899604e10f058603fe54a3d0e6dd84e : (forall x0, EquivReln x0 -> struct_r x0).
admit.
Qed.
Theorem missingprop_14dbc7e1c7a78e629c0514eea43ba5e75b81d08d29e9a14a8cd9aa31fb1ce134 : (forall x0 x1, EquivReln x0 -> EquivReln x1 -> EquivReln (BinReln_product x0 x1)).
admit.
Qed.
Theorem missingprop_78f231cfd5c3d9e0f310265d5b946c5362d2175a87918560d372a043b147dbaa : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p EquivReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition IrreflexiveTransitiveReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_dbb6377af3127d2bf8cd888143d856b4a86f0ec975822a440e0313d91ee07474 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> IrreflexiveTransitiveReln (pack_r x0 x1)).
Axiom missingprop_2d7c7a9916fa2967cfb4d546f4e37c43b64368ed4a60618379328e066e9b7e0e : (forall x0, IrreflexiveTransitiveReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> not (x3 x4 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
Theorem missingprop_d843c34578125329414df28865a610fdc4b3dedf56de3dd9e99c774f88282c4d : (forall x0, IrreflexiveTransitiveReln x0 -> struct_r x0).
admit.
Qed.
Theorem missingprop_adf9af6df0ab9ce6906c8af96b0e8b5f458fb0d3ac8ad3a40c928c13a16dac6a : (forall x0 x1, IrreflexiveTransitiveReln x0 -> IrreflexiveTransitiveReln x1 -> IrreflexiveTransitiveReln (BinReln_product x0 x1)).
admit.
Qed.
Theorem missingprop_7acdd2f9b1867396a4dd5041feef2b8c5c998d6a5f4d3538435fc4641df31065 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
