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
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition explicit_Group : set -> (set -> set -> set) -> prop :=
 (fun x0 : set => fun x1 : set -> set -> set => and (and (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4)))) (forall x2 : prop, (forall x3, and (x3 :e x0) (and (forall x4, x4 :e x0 -> and (x1 x3 x4 = x4) (x1 x4 x3 = x4)) (forall x4, x4 :e x0 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (and (x1 x4 x6 = x3) (x1 x6 x4 = x3)) -> x5) -> x5))) -> x2) -> x2)).
Theorem explicit_Group_identity_unique : (forall x0, forall x1 : set -> set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x4 = x4) -> (forall x4, x4 :e x0 -> x1 x4 x3 = x4) -> x2 = x3)).
admit.
Qed.
Definition explicit_Group_identity : set -> (set -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set -> set => Eps_i (fun x2 : set => and (x2 :e x0) (and (forall x3, x3 :e x0 -> and (x1 x2 x3 = x3) (x1 x3 x2 = x3)) (forall x3, x3 :e x0 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (and (x1 x3 x5 = x2) (x1 x5 x3 = x2)) -> x4) -> x4))))).
Definition explicit_Group_inverse : set -> (set -> set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> set => fun x2 : set => Eps_i (fun x3 : set => and (x3 :e x0) (and (x1 x2 x3 = explicit_Group_identity x0 x1) (x1 x3 x2 = explicit_Group_identity x0 x1)))).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem explicit_Group_identity_prop : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> and (explicit_Group_identity x0 x1 :e x0) (and (forall x2, x2 :e x0 -> and (x1 (explicit_Group_identity x0 x1) x2 = x2) (x1 x2 (explicit_Group_identity x0 x1) = x2)) (forall x2, x2 :e x0 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (and (x1 x2 x4 = explicit_Group_identity x0 x1) (x1 x4 x2 = explicit_Group_identity x0 x1)) -> x3) -> x3)))).
admit.
Qed.
Theorem explicit_Group_identity_in : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> explicit_Group_identity x0 x1 :e x0).
admit.
Qed.
Theorem explicit_Group_identity_lid : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> x1 (explicit_Group_identity x0 x1) x2 = x2)).
admit.
Qed.
Theorem explicit_Group_identity_rid : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> x1 x2 (explicit_Group_identity x0 x1) = x2)).
admit.
Qed.
Theorem explicit_Group_identity_invex : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (and (x1 x2 x4 = explicit_Group_identity x0 x1) (x1 x4 x2 = explicit_Group_identity x0 x1)) -> x3) -> x3))).
admit.
Qed.
Theorem explicit_Group_inverse_prop : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> and (explicit_Group_inverse x0 x1 x2 :e x0) (and (x1 x2 (explicit_Group_inverse x0 x1 x2) = explicit_Group_identity x0 x1) (x1 (explicit_Group_inverse x0 x1 x2) x2 = explicit_Group_identity x0 x1)))).
admit.
Qed.
Theorem explicit_Group_inverse_in : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> explicit_Group_inverse x0 x1 x2 :e x0)).
admit.
Qed.
Theorem explicit_Group_inverse_rinv : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> x1 x2 (explicit_Group_inverse x0 x1 x2) = explicit_Group_identity x0 x1)).
admit.
Qed.
Theorem explicit_Group_inverse_linv : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> x1 (explicit_Group_inverse x0 x1 x2) x2 = explicit_Group_identity x0 x1)).
admit.
Qed.
Theorem explicit_Group_lcancel : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 = x1 x2 x4 -> x3 = x4)))).
admit.
Qed.
Theorem explicit_Group_rcancel : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x4 = x1 x3 x4 -> x2 = x3)))).
admit.
Qed.
Theorem explicit_Group_rinv_rev : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 = explicit_Group_identity x0 x1 -> x3 = explicit_Group_inverse x0 x1 x2))).
admit.
Qed.
Theorem explicit_Group_inv_com : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 = explicit_Group_identity x0 x1 -> x1 x3 x2 = explicit_Group_identity x0 x1))).
admit.
Qed.
Theorem explicit_Group_inv_rev2 : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 (x1 x2 x3) (x1 x2 x3) = explicit_Group_identity x0 x1 -> x1 (x1 x3 x2) (x1 x3 x2) = explicit_Group_identity x0 x1))).
admit.
Qed.
Definition explicit_abelian : set -> (set -> set -> set) -> prop :=
 (fun x0 : set => fun x1 : set -> set -> set => forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 = x1 x3 x2)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem explicit_Group_repindep_imp : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> explicit_Group x0 x1 -> explicit_Group x0 x2).
admit.
Qed.
Theorem explicit_Group_identity_repindep : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> explicit_Group x0 x1 -> explicit_Group_identity x0 x1 = explicit_Group_identity x0 x2).
admit.
Qed.
Theorem explicit_Group_inverse_repindep : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> explicit_Group x0 x1 -> (forall x3, x3 :e x0 -> explicit_Group_inverse x0 x1 x3 = explicit_Group_inverse x0 x2 x3)).
admit.
Qed.
Theorem explicit_abelian_repindep_imp : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> explicit_abelian x0 x1 -> explicit_abelian x0 x2).
admit.
Qed.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem explicit_Group_repindep : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> iff (explicit_Group x0 x1) (explicit_Group x0 x2)).
admit.
Qed.
Theorem explicit_abelian_repindep : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> iff (explicit_abelian x0 x1) (explicit_abelian x0 x2)).
admit.
Qed.
(* Parameter pack_b "e007d96601771e291e9083ce21b5e97703bce4ff5257fec59b7ed3dbb05b5319" "855387af88aad68b5f942a3a97029fcd79fe0a4e781cdf546d058297f8a483ce" *)
Parameter pack_b : set -> (set -> set -> set) -> set.
Definition struct_b : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> x1 (pack_b x2 x3)) -> x1 x0).
(* Parameter unpack_b_o "0fa2c67750f22ef718feacbb3375b43caa7129d02200572180f9cfe7abf54cec" "0601c1c35ff2c84ae36acdecfae98d553546d98a227f007481baf6b962cc1dc8" *)
Parameter unpack_b_o : set -> (set -> (set -> set -> set) -> prop) -> prop.
Definition Group : set -> prop :=
 (fun x0 : set => and (struct_b x0) (unpack_b_o x0 explicit_Group)).
Definition abelian_Group : set -> prop :=
 (fun x0 : set => and (Group x0) (unpack_b_o x0 explicit_abelian)).
Axiom unpack_b_o_eq : (forall x0 : set -> (set -> set -> set) -> prop, forall x1, forall x2 : set -> set -> set, (forall x3 : set -> set -> set, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x4 x5 = x3 x4 x5)) -> x0 x1 x3 = x0 x1 x2) -> unpack_b_o (pack_b x1 x2) x0 = x0 x1 x2).
Axiom prop_ext : (forall x0 x1 : prop, iff x0 x1 -> x0 = x1).
Theorem Group_unpack_eq : (forall x0, forall x1 : set -> set -> set, forall x2 : prop -> prop -> prop, x2 (unpack_b_o (pack_b x0 x1) explicit_Group) (explicit_Group x0 x1) -> x2 (explicit_Group x0 x1) (unpack_b_o (pack_b x0 x1) explicit_Group)).
admit.
Qed.
Axiom pack_struct_b_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> struct_b (pack_b x0 x1)).
Theorem GroupI : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> Group (pack_b x0 x1)).
admit.
Qed.
Theorem GroupE : (forall x0, forall x1 : set -> set -> set, Group (pack_b x0 x1) -> explicit_Group x0 x1).
admit.
Qed.
Theorem abelian_Group_unpack_eq : (forall x0, forall x1 : set -> set -> set, forall x2 : prop -> prop -> prop, x2 (unpack_b_o (pack_b x0 x1) explicit_abelian) (explicit_abelian x0 x1) -> x2 (explicit_abelian x0 x1) (unpack_b_o (pack_b x0 x1) explicit_abelian)).
admit.
Qed.
Theorem abelian_Group_E : (forall x0, forall x1 : set -> set -> set, abelian_Group (pack_b x0 x1) -> and (Group (pack_b x0 x1)) (explicit_abelian x0 x1)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition explicit_subgroup : set -> (set -> set -> set) -> set -> prop :=
 (fun x0 : set => fun x1 : set -> set -> set => fun x2 : set => and (Group (pack_b x2 x1)) (x2 c= x0)).
Definition explicit_normal : set -> (set -> set -> set) -> set -> prop :=
 (fun x0 : set => fun x1 : set -> set -> set => fun x2 : set => forall x3, x3 :e x0 -> {x1 x3 (x1 x4 (explicit_Group_inverse x0 x1 x3)) | x4 :e x2} c= x2).
Theorem explicit_subgroup_test : (forall x0, forall x1 : set -> set -> set, forall x2, Group (pack_b x0 x1) -> x2 c= x0 -> explicit_Group_identity x0 x1 :e x2 -> (forall x3, x3 :e x2 -> explicit_Group_inverse x0 x1 x3 :e x2) -> (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> x1 x3 x4 :e x2)) -> explicit_subgroup x0 x1 x2).
admit.
Qed.
Theorem explicit_subgroup_identity_eq : (forall x0, forall x1 : set -> set -> set, forall x2, Group (pack_b x0 x1) -> explicit_subgroup x0 x1 x2 -> explicit_Group_identity x0 x1 = explicit_Group_identity x2 x1).
admit.
Qed.
Theorem explicit_subgroup_inv_eq : (forall x0, forall x1 : set -> set -> set, forall x2, Group (pack_b x0 x1) -> explicit_subgroup x0 x1 x2 -> (forall x3, x3 :e x2 -> explicit_Group_inverse x0 x1 x3 = explicit_Group_inverse x2 x1 x3)).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem explicit_abelian_normal : (forall x0, forall x1 : set -> set -> set, forall x2, Group (pack_b x0 x1) -> explicit_subgroup x0 x1 x2 -> explicit_abelian x0 x1 -> explicit_normal x0 x1 x2).
admit.
Qed.
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem explicit_normal_repindep_imp : (forall x0 x1, forall x2 x3 : set -> set -> set, explicit_Group x1 x2 -> x0 c= x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x4 x5 = x3 x4 x5)) -> explicit_normal x1 x2 x0 -> explicit_normal x1 x3 x0).
admit.
Qed.
Definition subgroup : set -> set -> prop :=
 (fun x0 x1 : set => and (and (struct_b x1) (struct_b x0)) (unpack_b_o x1 (fun x2 : set => fun x3 : set -> set -> set => unpack_b_o x0 (fun x4 : set => fun x5 : set -> set -> set => and (and (x0 = pack_b x4 x3) (Group (pack_b x4 x3))) (x4 c= x2))))).
(* Parameter unpack_b_i "2890e728fd41ee56580615f32603326f19352dda5a1deea69ef696e560d62300" "b3bb92bcc166500c6f6465bf41e67a407d3435b2ce2ac6763fb02fac8e30640e" *)
Parameter unpack_b_i : set -> (set -> (set -> set -> set) -> set) -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition subgroup_index : set -> set -> set :=
 (fun x0 x1 : set => unpack_b_i x1 (fun x2 : set => fun x3 : set -> set -> set => Sep omega (fun x4 : set => forall x5 : prop, (forall x6, and (x6 :e setexp x2 (ordsucc x4)) (forall x7, x7 :e ordsucc x4 -> (forall x8, x8 :e ordsucc x4 -> (x7 = x8 -> (forall x9 : prop, x9)) -> (forall x9, x9 :e ap x0 0 -> (forall x10, x10 :e ap x0 0 -> x3 (ap x6 x7) x9 = x3 (ap x6 x8) x10 -> (forall x11 : prop, x11))))) -> x5) -> x5))).
Definition normal_subgroup : set -> set -> prop :=
 (fun x0 x1 : set => and (subgroup x0 x1) (unpack_b_o x1 (fun x2 : set => fun x3 : set -> set -> set => unpack_b_o x0 (fun x4 : set => fun x5 : set -> set -> set => explicit_normal x2 x3 x4)))).
Theorem missingprop_849033760b3699131a909f0571933f68e8c142b844e9ed0e264c912c9933afc7 : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : prop -> prop -> prop, x4 (unpack_b_o (pack_b x0 x2) (fun x5 : set => fun x6 : set -> set -> set => and (and (pack_b x0 x2 = pack_b x5 x3) (Group (pack_b x5 x3))) (x5 c= x1))) (and (and (pack_b x0 x2 = pack_b x0 x3) (Group (pack_b x0 x3))) (x0 c= x1)) -> x4 (and (and (pack_b x0 x2 = pack_b x0 x3) (Group (pack_b x0 x3))) (x0 c= x1)) (unpack_b_o (pack_b x0 x2) (fun x5 : set => fun x6 : set -> set -> set => and (and (pack_b x0 x2 = pack_b x5 x3) (Group (pack_b x5 x3))) (x5 c= x1)))).
admit.
Qed.
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Axiom pack_b_ext : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> pack_b x0 x1 = pack_b x0 x2).
Theorem missingprop_673480a732b2360ba263db6ccd7aafefdf5ff6442062595c967c01560edd61e8 : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : prop -> prop -> prop, x4 (unpack_b_o (pack_b x1 x3) (fun x5 : set => fun x6 : set -> set -> set => unpack_b_o (pack_b x0 x2) (fun x7 : set => fun x8 : set -> set -> set => and (and (pack_b x0 x2 = pack_b x7 x6) (Group (pack_b x7 x6))) (x7 c= x5)))) (and (and (pack_b x0 x2 = pack_b x0 x3) (Group (pack_b x0 x3))) (x0 c= x1)) -> x4 (and (and (pack_b x0 x2 = pack_b x0 x3) (Group (pack_b x0 x3))) (x0 c= x1)) (unpack_b_o (pack_b x1 x3) (fun x5 : set => fun x6 : set -> set -> set => unpack_b_o (pack_b x0 x2) (fun x7 : set => fun x8 : set -> set -> set => and (and (pack_b x0 x2 = pack_b x7 x6) (Group (pack_b x7 x6))) (x7 c= x5))))).
admit.
Qed.
Theorem pack_b_subgroup_E : (forall x0 x1, forall x2 x3 : set -> set -> set, subgroup (pack_b x0 x2) (pack_b x1 x3) -> and (pack_b x0 x2 = pack_b x0 x3) (explicit_subgroup x1 x3 x0)).
admit.
Qed.
Theorem subgroup_E : (forall x0 x1, subgroup x0 x1 -> (forall x2 : set -> set -> prop, (forall x3 x4, forall x5 : set -> set -> set, (forall x6, x6 :e x4 -> (forall x7, x7 :e x4 -> x5 x6 x7 :e x4)) -> Group (pack_b x3 x5) -> x3 c= x4 -> x2 (pack_b x3 x5) (pack_b x4 x5)) -> x2 x0 x1)).
admit.
Qed.
Theorem missingprop_7cb03a255d2fec9c7695b2dda3bc3dd2780cc664df29cae9822c5b34ef1bd688 : (forall x0 x1, forall x2 x3 : set -> set -> set, explicit_Group x1 x2 -> x0 c= x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x4 x5 = x3 x4 x5)) -> explicit_normal x1 x2 x0 = explicit_normal x1 x3 x0).
admit.
Qed.
Theorem missingprop_6f443acda8c525028830077e56d25cc42421b356ff555ec80c66f7077fb21a6f : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 : prop -> prop -> prop, x4 (unpack_b_o (pack_b x0 x2) (fun x5 : set => fun x6 : set -> set -> set => explicit_normal x1 x3 x5)) (explicit_normal x1 x3 x0) -> x4 (explicit_normal x1 x3 x0) (unpack_b_o (pack_b x0 x2) (fun x5 : set => fun x6 : set -> set -> set => explicit_normal x1 x3 x5))).
admit.
Qed.
Theorem missingprop_a38119175a5c7a068cd247f906b2f1feb5daeb7691af95918cb490283a35a18e : (forall x0 x1, forall x2 x3 : set -> set -> set, Group (pack_b x1 x3) -> x0 c= x1 -> unpack_b_o (pack_b x1 x3) (fun x5 : set => fun x6 : set -> set -> set => unpack_b_o (pack_b x0 x2) (fun x7 : set => fun x8 : set -> set -> set => explicit_normal x5 x6 x7)) = explicit_normal x1 x3 x0).
admit.
Qed.
Theorem abelian_group_normal_subgroup : (forall x0, abelian_Group x0 -> (forall x1, subgroup x1 x0 -> normal_subgroup x1 x0)).
admit.
Qed.
Axiom pack_b_inj : (forall x0 x1, forall x2 x3 : set -> set -> set, pack_b x0 x2 = pack_b x1 x3 -> and (x0 = x1) (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 x5 = x3 x4 x5))).
Theorem subgroup_transitive : (forall x0 x1 x2, subgroup x0 x1 -> subgroup x1 x2 -> subgroup x0 x2).
admit.
Qed.
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Theorem missingprop_8c28017e57ab2ec2cae7456a68ed4001fbd633ee80009212ac3e7002fe0a637a : (forall x0 x1, x1 :e Sep (setexp x0 x0) (fun x2 : set => bij x0 x0 (ap x2)) -> (forall x2, x2 :e Sep (setexp x0 x0) (fun x3 : set => bij x0 x0 (ap x3)) -> lam x0 (fun x3 : set => ap x2 (ap x1 x3)) :e Sep (setexp x0 x0) (fun x3 : set => bij x0 x0 (ap x3)))).
admit.
Qed.
Theorem missingprop_5e0fd89c1af2988efb9109729fe2f29a67df0b5d1c5db069bd27d2e54ddad812 : (forall x0, lam x0 (fun x1 : set => x1) :e Sep (setexp x0 x0) (fun x1 : set => bij x0 x0 (ap x1))).
admit.
Qed.
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom missingprop_f9fc2fb6cfb4eb217cfd90f255fb35b64bd1729aa515ae6c662014a80909baf4 : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x0 -> inv x0 x2 (x2 x3) = x3)).
Axiom surj_rinv : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> (forall x3, x3 :e x1 -> and (inv x0 x2 x3 :e x0) (x2 (inv x0 x2 x3) = x3))).
Theorem missingprop_b2dd22a61a18b61173d379dddf1d365ae5cf5bc258fcc9bd0ab516defe84cb3a : (forall x0 x1, x1 :e Sep (setexp x0 x0) (fun x2 : set => bij x0 x0 (ap x2)) -> and (and (lam x0 (inv x0 (ap x1)) :e Sep (setexp x0 x0) (fun x2 : set => bij x0 x0 (ap x2))) (lam x0 (fun x3 : set => ap (lam x0 (inv x0 (ap x1))) (ap x1 x3)) = lam x0 (fun x3 : set => x3))) (lam x0 (fun x3 : set => ap x1 (ap (lam x0 (inv x0 (ap x1))) x3)) = lam x0 (fun x3 : set => x3))).
admit.
Qed.
Axiom Pi_ext : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> (forall x3, x3 :e Pi x0 x1 -> (forall x4, x4 :e x0 -> ap x2 x4 = ap x3 x4) -> x2 = x3)).
Theorem explicit_Group_symgroup : (forall x0, explicit_Group (Sep (setexp x0 x0) (fun x1 : set => bij x0 x0 (ap x1))) (fun x1 x2 : set => lam x0 (fun x3 : set => ap x2 (ap x1 x3)))).
admit.
Qed.
Theorem explicit_Group_symgroup_id_eq : (forall x0, forall x1 : set -> set -> prop, x1 (explicit_Group_identity (Sep (setexp x0 x0) (fun x2 : set => bij x0 x0 (ap x2))) (fun x2 x3 : set => lam x0 (fun x4 : set => ap x3 (ap x2 x4)))) (lam x0 (fun x2 : set => x2)) -> x1 (lam x0 (fun x2 : set => x2)) (explicit_Group_identity (Sep (setexp x0 x0) (fun x2 : set => bij x0 x0 (ap x2))) (fun x2 x3 : set => lam x0 (fun x4 : set => ap x3 (ap x2 x4))))).
admit.
Qed.
Theorem explicit_Group_symgroup_inv_eq : (forall x0 x1, x1 :e Sep (setexp x0 x0) (fun x2 : set => bij x0 x0 (ap x2)) -> explicit_Group_inverse (Sep (setexp x0 x0) (fun x3 : set => bij x0 x0 (ap x3))) (fun x3 x4 : set => lam x0 (fun x5 : set => ap x4 (ap x3 x5))) x1 = lam x0 (inv x0 (ap x1))).
admit.
Qed.
Theorem missingprop_84ca4ed305d5b4e27ce2e93e41baee1fcbe8346e3121687514bb4244ad3fd62a : (forall x0 x1, x1 c= x0 -> (forall x2, x2 :e Sep (setexp x0 x0) (fun x3 : set => and (bij x0 x0 (ap x3)) (forall x4, x4 :e x1 -> ap x3 x4 = x4)) -> (forall x3, x3 :e Sep (setexp x0 x0) (fun x4 : set => and (bij x0 x0 (ap x4)) (forall x5, x5 :e x1 -> ap x4 x5 = x5)) -> lam x0 (fun x4 : set => ap x3 (ap x2 x4)) :e Sep (setexp x0 x0) (fun x4 : set => and (bij x0 x0 (ap x4)) (forall x5, x5 :e x1 -> ap x4 x5 = x5))))).
admit.
Qed.
Theorem explicit_subgroup_symgroup_fixing : (forall x0 x1, x1 c= x0 -> explicit_subgroup (Sep (setexp x0 x0) (fun x2 : set => bij x0 x0 (ap x2))) (fun x2 x3 : set => lam x0 (fun x4 : set => ap x3 (ap x2 x4))) (Sep (setexp x0 x0) (fun x2 : set => and (bij x0 x0 (ap x2)) (forall x3, x3 :e x1 -> ap x2 x3 = x3)))).
admit.
Qed.
Definition symgroup : set -> set :=
 (fun x0 : set => pack_b (Sep (setexp x0 x0) (fun x1 : set => bij x0 x0 (ap x1))) (fun x1 x2 : set => lam x0 (fun x3 : set => ap x2 (ap x1 x3)))).
Definition symgroup_fixing : set -> set -> set :=
 (fun x0 x1 : set => pack_b (Sep (setexp x0 x0) (fun x2 : set => and (bij x0 x0 (ap x2)) (forall x3, x3 :e x1 -> ap x2 x3 = x3))) (fun x2 x3 : set => lam x0 (fun x4 : set => ap x3 (ap x2 x4)))).
Theorem Group_symgroup : (forall x0, Group (symgroup x0)).
admit.
Qed.
Theorem Group_symgroup_fixing : (forall x0 x1, x1 c= x0 -> Group (symgroup_fixing x0 x1)).
admit.
Qed.
Theorem subgroup_symgroup_fixing : (forall x0 x1, x1 c= x0 -> subgroup (symgroup_fixing x0 x1) (symgroup x0)).
admit.
Qed.
Theorem subgroup_symgroup_fixing2 : (forall x0 x1 x2, x2 c= x1 -> x1 c= x0 -> subgroup (symgroup_fixing x0 x1) (symgroup_fixing x0 x2)).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
Axiom tuple_3_0_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0) x0 -> x3 x0 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0)).
Axiom In_2_3 : 2 :e 3.
Axiom tuple_3_2_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2) x2 -> x3 x2 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2)).
Axiom In_0_3 : 0 :e 3.
Axiom In_0_1 : 0 :e 1.
Axiom tuple_3_in_A_3 : (forall x0 x1 x2 x3, x0 :e x3 -> x1 :e x3 -> x2 :e x3 -> lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2)) :e setexp x3 3).
Axiom In_1_3 : 1 :e 3.
Axiom tuple_3_bij_3 : (forall x0 x1 x2, x0 :e 3 -> x1 :e 3 -> x2 :e 3 -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> bij 3 3 (ap (lam 3 (fun x3 : set => If_i (x3 = 0) x0 (If_i (x3 = 1) x1 x2))))).
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem nonnormal_subgroup : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3, and (and (Group x3) (subgroup x1 x3)) (not (normal_subgroup x1 x3)) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition normal_subgroup_equiv : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => unpack_b_o x0 (fun x4 : set => fun x5 : set -> set -> set => and (and (x2 :e x4) (x3 :e x4)) (x5 x2 (explicit_Group_inverse x4 x5 x3) :e ap x1 0))).
(* Parameter quotient "aa0da3fb21dcb8f9e118c9149aed409bb70d0408a316f1cce303813bf2428859" "185d8f16b44939deb8995cbb9be7d1b78b78d5fc4049043a3b6ccc9ec7b33b41" *)
Parameter quotient : (set -> set -> prop) -> set -> prop.
(* Parameter canonical_elt "7830817b065e5068a5d904d993bb45fa4ddb7b1157b85006099fa8b2d1698319" "24615c6078840ea77a483098ef7fecf7d2e10585bf1f31bd0c61fbaeced3ecb8" *)
Parameter canonical_elt : (set -> set -> prop) -> set -> set.
Definition quotient_Group : set -> set -> set :=
 (fun x0 x1 : set => unpack_b_i x0 (fun x2 : set => fun x3 : set -> set -> set => pack_b (Sep x2 (quotient (normal_subgroup_equiv x0 x1))) (fun x4 x5 : set => canonical_elt (normal_subgroup_equiv x0 x1) (x3 x4 x5)))).
Definition trivial_Group_p : set -> prop :=
 (fun x0 : set => and (Group x0) (forall x1, x1 :e ap x0 0 -> (forall x2, x2 :e ap x0 0 -> x1 = x2))).
Definition missingname_0a7f9205c969cba0a2dd6b88053ff6082527eccb1ea43d81d82b4baeee09a337 : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (forall x3 : prop, (forall x4, and (and (and (and (forall x5, x5 :e ordsucc x2 -> Group (ap x4 x5)) (forall x5, x5 :e x2 -> normal_subgroup (ap x4 x5) (ap x4 (ordsucc x5)))) (forall x5, x5 :e x2 -> abelian_Group (quotient_Group (ap x4 (ordsucc x5)) (ap x4 x5)))) (x0 = ap x4 x2)) (trivial_Group_p (ap x4 0)) -> x3) -> x3) -> x1) -> x1).
