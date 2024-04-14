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
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter Inj0 "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" "8143218ffde429ff34b20ee5c938914c75e40d59cd52cc5db4114971d231ca73" *)
Parameter Inj0 : set -> set.
(* Parameter Unj "d3f7df13cbeb228811efe8a7c7fce2918025a8321cdfe4521523dc066cca9376" "f202c1f30355001f3665c854acb4fdae117f5ac555d2616236548c8309e59026" *)
Parameter Unj : set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
Axiom setsum_Inj_inv : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = Inj0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = Inj1 x4) -> x3) -> x3)).
Axiom Unj_Inj0_eq : (forall x0, forall x1 : set -> set -> prop, x1 (Unj (Inj0 x0)) x0 -> x1 x0 (Unj (Inj0 x0))).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom Inj0_Inj1_neq : (forall x0 x1, Inj0 x0 = Inj1 x1 -> (forall x2 : prop, x2)).
Theorem missingprop_a1351ecfb734f293edaa7a2a1deacea3d12ea3fcea03c54c4adf3fc8eb170319 : (forall x0 x1 x2, x2 :e setsum x0 x1 -> x2 = Inj0 (Unj x2) -> Unj x2 :e x0).
admit.
Qed.
Axiom Unj_Inj1_eq : (forall x0, forall x1 : set -> set -> prop, x1 (Unj (Inj1 x0)) x0 -> x1 x0 (Unj (Inj1 x0))).
Theorem missingprop_0dc0fe146e97c5519bac4dc732d9fc3b2b4e9eb678283090a46963d0da80d880 : (forall x0 x1 x2, x2 :e setsum x0 x1 -> x2 = Inj1 (Unj x2) -> Unj x2 :e x1).
admit.
Qed.
(* Parameter unpack_p_i "e24c519b20075049733185165766605b441fbcc5ee0900c9bd48c0c792ba5859" "dda44134499f98b412d13481678ca2262d520390676ab6b40e0cb0e0768412f6" *)
Parameter unpack_p_i : set -> (set -> (set -> prop) -> set) -> set.
(* Parameter pack_p "3c539dbbee9d5ff440b9024180e52e9c2adde77bbaa8264d8f67d724d8c8cb25" "d5afae717eff5e7035dc846b590d96bd5a7727284f8ff94e161398c148ab897f" *)
Parameter pack_p : set -> (set -> prop) -> set.
Definition missingname_caf61c7199210c7507eff890169958acb5b238174ab4a49e10bf1ce72ac26725 : set -> set -> set :=
 (fun x0 x1 : set => unpack_p_i x0 (fun x2 : set => fun x3 : set -> prop => unpack_p_i x1 (fun x4 : set => fun x5 : set -> prop => pack_p (setsum x2 x4) (fun x6 : set => or (and (x6 = Inj0 (Unj x6)) (x3 (Unj x6))) (and (x6 = Inj1 (Unj x6)) (x5 (Unj x6))))))).
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom unpack_p_i_eq : (forall x0 : set -> (set -> prop) -> set, forall x1, forall x2 : set -> prop, (forall x3 : set -> prop, (forall x4, x4 :e x1 -> iff (x2 x4) (x3 x4)) -> x0 x1 x3 = x0 x1 x2) -> unpack_p_i (pack_p x1 x2) x0 = x0 x1 x2).
Axiom pack_p_ext : (forall x0, forall x1 x2 : set -> prop, (forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)) -> pack_p x0 x1 = pack_p x0 x2).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_b136686cda57813ec105d14134466864c52e8c5ca85ea4790197540126814cf6 : (forall x0, forall x1 : set -> prop, forall x2, forall x3 : set -> prop, forall x4 : set -> set -> prop, x4 (missingname_caf61c7199210c7507eff890169958acb5b238174ab4a49e10bf1ce72ac26725 (pack_p x0 x1) (pack_p x2 x3)) (pack_p (setsum x0 x2) (fun x5 : set => or (and (x5 = Inj0 (Unj x5)) (x1 (Unj x5))) (and (x5 = Inj1 (Unj x5)) (x3 (Unj x5))))) -> x4 (pack_p (setsum x0 x2) (fun x5 : set => or (and (x5 = Inj0 (Unj x5)) (x1 (Unj x5))) (and (x5 = Inj1 (Unj x5)) (x3 (Unj x5))))) (missingname_caf61c7199210c7507eff890169958acb5b238174ab4a49e10bf1ce72ac26725 (pack_p x0 x1) (pack_p x2 x3))).
admit.
Qed.
Definition struct_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> prop, x1 (pack_p x2 x3)) -> x1 x0).
Axiom pack_struct_p_I : (forall x0, forall x1 : set -> prop, struct_p (pack_p x0 x1)).
Theorem missingprop_1173f252c04f1e26dd932c58949a3d54b001764c56ceceb60de241154a660c4d : (forall x0 x1, struct_p x0 -> struct_p x1 -> struct_p (missingname_caf61c7199210c7507eff890169958acb5b238174ab4a49e10bf1ce72ac26725 x0 x1)).
admit.
Qed.
Definition MetaCat_coproduct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x4 x6 x7)) (Hom x5 x6 x8)) (forall x10, Obj x10 -> (forall x11 x12, Hom x4 x10 x11 -> Hom x5 x10 x12 -> and (and (and (Hom x6 x10 (x9 x10 x11 x12)) (Comp x4 x6 x10 (x9 x10 x11 x12) x7 = x11)) (Comp x5 x6 x10 (x9 x10 x11 x12) x8 = x12)) (forall x13, Hom x6 x10 x13 -> Comp x4 x6 x10 x13 x7 = x11 -> Comp x5 x6 x10 x13 x8 = x12 -> x13 = x9 x10 x11 x12)))).
Definition MetaCat_coproduct_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => forall x8 x9, Obj x8 -> Obj x9 -> MetaCat_coproduct_p Obj Hom Id Comp x8 x9 (x4 x8 x9) (x5 x8 x9) (x6 x8 x9) (x7 x8 x9)).
(* Parameter UnaryPredHom "44ed079d6a65865657792e1cc515b76a1121cfdc9af8f6c21f8cc848fa700837" "5d0201189805d03fc856c2fa62f35171b88a531f7deeee6199625094c02eddd7" *)
Parameter UnaryPredHom : set -> set -> set -> prop.
(* Parameter struct_id "ddbfe293c94f63568d97903ab92695c5b104ee51e1b7d4e7dd29a87510065054" "ac22e99093b43e0b6246d1a60c33b72b22acf28c29494701ebd52fa3ba6ac8bc" *)
Parameter struct_id : set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Definition struct_comp : set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam_comp (ap x0 Empty)).
(* Parameter combine_funcs "f0267e2cbae501ea3433aecadbe197ba8f39c96e80326cc5981a1630fda29909" "ccac4354446ce449bb1c967fa332cdf48b070fc032d9733e4c1305fb864cb72a" *)
Parameter combine_funcs : set -> set -> (set -> set) -> (set -> set) -> set -> set.
Axiom pack_p_0_eq2 : (forall x0, forall x1 : set -> prop, forall x2 : set -> set -> prop, x2 x0 (ap (pack_p x0 x1) Empty) -> x2 (ap (pack_p x0 x1) Empty) x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom missingprop_63c01b8f599732ba7bc3b48c28c0f10755230e5cc9f0717c7895602d2eaf01d3 : (forall x0 x1, forall x2 x3 : set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom combine_funcs_eq1 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj0 x4)) (x2 x4) -> x5 (x2 x4) (combine_funcs x0 x1 x2 x3 (Inj0 x4))).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom combine_funcs_eq2 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj1 x4)) (x3 x4) -> x5 (x3 x4) (combine_funcs x0 x1 x2 x3 (Inj1 x4))).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Theorem missingprop_eb8fa85f1ab6d587c913965e3b03d2a9bd8d29f88f55fc57c7ee9d90282aeead : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (missingname_caf61c7199210c7507eff890169958acb5b238174ab4a49e10bf1ce72ac26725 x1 x2)) -> MetaCat_coproduct_constr_p x0 UnaryPredHom struct_id struct_comp missingname_caf61c7199210c7507eff890169958acb5b238174ab4a49e10bf1ce72ac26725 (fun x1 x2 : set => lam (ap x1 Empty) Inj0) (fun x1 x2 : set => lam (ap x2 Empty) Inj1) (fun x1 x2 x3 x4 x5 : set => lam (setsum (ap x1 Empty) (ap x2 Empty)) (combine_funcs (ap x1 Empty) (ap x2 Empty) (ap x4) (ap x5)))).
admit.
Qed.
Theorem missingprop_58314cb04c736501b241fbb2554ec9ac727c12a75b0a735cd24f5f3e545e2c0f : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p struct_p UnaryPredHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_p_o "4b92ca0383b3989d01ddc4ec8bdf940b54163f9a29e460dfd502939eb880162f" "30f11fc88aca72af37fd2a4235aa22f28a552bbc44f1fb01f4edf7f2b7e376ac" *)
Parameter unpack_p_o : set -> (set -> (set -> prop) -> prop) -> prop.
Definition PtdPred : set -> prop :=
 (fun x0 : set => and (struct_p x0) (unpack_p_o x0 (fun x1 : set => fun x2 : set -> prop => forall x3 : prop, (forall x4, and (x4 :e x1) (x2 x4) -> x3) -> x3))).
Axiom missingprop_c86200a2eefb0ff844f50b29d5cbeaa2ee14856a2db63542bcbf63218f0d0f1e : (forall x0, PtdPred x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> prop, forall x4, x4 :e x2 -> x3 x4 -> x1 (pack_p x2 x3)) -> x1 x0)).
Axiom missingprop_2576d2815b46016e5e13a9989b4e9789629d83c56ed1c92a4cda0de077a20752 : (forall x0, forall x1 : set -> prop, (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 x3) -> x2) -> x2) -> PtdPred (pack_p x0 x1)).
Theorem missingprop_dc308ee8a01bc9c118a40e3847136558e9049ce9b24530e2eed803b39708f061 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_r_i "8e3580f89907c6b36f6b57ad7234db3561b008aa45f8fa86d5e51a7a85cd74b6" "3ace9e6e064ec2b6e839b94e81788f9c63b22e51ec9dec8ee535d50649401cf4" *)
Parameter unpack_r_i : set -> (set -> (set -> set -> prop) -> set) -> set.
(* Parameter pack_r "39d80099e1b48aed4548f424ae4f1ff25b2d595828aff4b3a5abe232ca0348b5" "217a7f92acc207b15961c90039aa929f0bd5d9212f66ce5595c3af1dd8b9737e" *)
Parameter pack_r : set -> (set -> set -> prop) -> set.
Definition missingname_0d2c36ac908b378127a3a97d8d5798f7754f2d5c8a94402767b1062ee06da0dc : set -> set -> set :=
 (fun x0 x1 : set => unpack_r_i x0 (fun x2 : set => fun x3 : set -> set -> prop => unpack_r_i x1 (fun x4 : set => fun x5 : set -> set -> prop => pack_r (setsum x2 x4) (fun x6 x7 : set => or (and (and (x6 = Inj0 (Unj x6)) (x7 = Inj0 (Unj x7))) (x3 (Unj x6) (Unj x7))) (and (and (x6 = Inj1 (Unj x6)) (x7 = Inj1 (Unj x7))) (x5 (Unj x6) (Unj x7))))))).
Axiom unpack_r_i_eq : (forall x0 : set -> (set -> set -> prop) -> set, forall x1, forall x2 : set -> set -> prop, (forall x3 : set -> set -> prop, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> iff (x2 x4 x5) (x3 x4 x5))) -> x0 x1 x3 = x0 x1 x2) -> unpack_r_i (pack_r x1 x2) x0 = x0 x1 x2).
Axiom pack_r_ext : (forall x0, forall x1 x2 : set -> set -> prop, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> iff (x1 x3 x4) (x2 x3 x4))) -> pack_r x0 x1 = pack_r x0 x2).
Theorem missingprop_2b21d9fc231c558646c467d14a820e3bc5f0cce785ca7db2a0cb0c92dadc07f5 : (forall x0, forall x1 : set -> set -> prop, forall x2, forall x3 x4 : set -> set -> prop, x4 (missingname_0d2c36ac908b378127a3a97d8d5798f7754f2d5c8a94402767b1062ee06da0dc (pack_r x0 x1) (pack_r x2 x3)) (pack_r (setsum x0 x2) (fun x5 x6 : set => or (and (and (x5 = Inj0 (Unj x5)) (x6 = Inj0 (Unj x6))) (x1 (Unj x5) (Unj x6))) (and (and (x5 = Inj1 (Unj x5)) (x6 = Inj1 (Unj x6))) (x3 (Unj x5) (Unj x6))))) -> x4 (pack_r (setsum x0 x2) (fun x5 x6 : set => or (and (and (x5 = Inj0 (Unj x5)) (x6 = Inj0 (Unj x6))) (x1 (Unj x5) (Unj x6))) (and (and (x5 = Inj1 (Unj x5)) (x6 = Inj1 (Unj x6))) (x3 (Unj x5) (Unj x6))))) (missingname_0d2c36ac908b378127a3a97d8d5798f7754f2d5c8a94402767b1062ee06da0dc (pack_r x0 x1) (pack_r x2 x3))).
admit.
Qed.
Definition struct_r : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, x1 (pack_r x2 x3)) -> x1 x0).
Axiom pack_struct_r_I : (forall x0, forall x1 : set -> set -> prop, struct_r (pack_r x0 x1)).
Theorem missingprop_a69d20d3ecb56be7161eda7f44e43ecc2760c2c8bbc1729b0822a57a8b1a28bb : (forall x0 x1, struct_r x0 -> struct_r x1 -> struct_r (missingname_0d2c36ac908b378127a3a97d8d5798f7754f2d5c8a94402767b1062ee06da0dc x0 x1)).
admit.
Qed.
(* Parameter BinRelnHom "352304ebb6c77dbc4e2a952e767857a98538e43de1c35fb4bcd6c99fca02ae7e" "acf0f04c6a55a143e3ed8404c0fa6b09b323d938c83532f081b47091e31c4eb3" *)
Parameter BinRelnHom : set -> set -> set -> prop.
Axiom pack_r_0_eq2 : (forall x0, forall x1 x2 : set -> set -> prop, x2 x0 (ap (pack_r x0 x1) Empty) -> x2 (ap (pack_r x0 x1) Empty) x0).
Axiom missingprop_4e486761c3790f4990f398ce8c16ea7ac5915924a294f8e5b06e45030e68e983 : (forall x0 x1, forall x2 x3 : set -> set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4)).
Theorem missingprop_8014f2189a8e9a90722a83ab5f5b4d52ecd6d5c686aac8aa2eb5343a4f9f7780 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (missingname_0d2c36ac908b378127a3a97d8d5798f7754f2d5c8a94402767b1062ee06da0dc x1 x2)) -> MetaCat_coproduct_constr_p x0 BinRelnHom struct_id struct_comp missingname_0d2c36ac908b378127a3a97d8d5798f7754f2d5c8a94402767b1062ee06da0dc (fun x1 x2 : set => lam (ap x1 Empty) Inj0) (fun x1 x2 : set => lam (ap x2 Empty) Inj1) (fun x1 x2 x3 x4 x5 : set => lam (setsum (ap x1 Empty) (ap x2 Empty)) (combine_funcs (ap x1 Empty) (ap x2 Empty) (ap x4) (ap x5)))).
admit.
Qed.
Theorem missingprop_b2a0d3647834c1dea7fa9cceda32637ffe5f363d7147e04150ebe3051b350642 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p struct_r BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_r_o "8d2ef9c9e522891d1fe605a62dffeab8aefb6325650e4eab14135e7eee8002c5" "e3e6af0984cda0a02912e4f3e09614b67fc0167c625954f0ead4110f52ede086" *)
Parameter unpack_r_o : set -> (set -> (set -> set -> prop) -> prop) -> prop.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition IrreflexiveSymmetricReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))))).
Axiom missingprop_034efb78ebb5063d16d232d7a2af450524a44508ccd003479f3d4a1b105247b8 : (forall x0, IrreflexiveSymmetricReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> not (x3 x4 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> x1 (pack_r x2 x3)) -> x1 x0)).
Axiom missingprop_d442b731cc8a623579f119dd4140f334acbb8f35c49c35a487654154f8239ef6 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> IrreflexiveSymmetricReln (pack_r x0 x1)).
Theorem missingprop_ae33e330a775c54c248eec2e1cf3034b895b9f642d6eb964b4fa1b7f5fbf572b : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition PER : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_c1d3826129d2eb54a8f1e40a6116497a0cdb00a6ee455a0b01d56d09477d50d0 : (forall x0, PER x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
Axiom missingprop_b2515235786361aea7c15ac6711d5751cd13b11988163a3b347abdb56aff828a : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> PER (pack_r x0 x1)).
Theorem missingprop_aabb17f8fff210d740b8041d9c9fe7500f231e72671fbe3855ef8b4de9d62eb6 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p PER BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition EquivReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (and (forall x3, x3 :e x1 -> x2 x3 x3) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_6402afcf89af96ded942e84b9859aeeef4ba7eaef1979737905398451311e541 : (forall x0, EquivReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> x3 x4 x4) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
Axiom missingprop_46185b99972d7cc500b0fcea77da3881e5aca4376b72d7aefbcc4420b07dadec : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> x1 x2 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> EquivReln (pack_r x0 x1)).
Theorem missingprop_d99afa31926a0050591e7969b11f8e55125f7d2d85cf0e57bcc2362c7d336a0a : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p EquivReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition IrreflexiveTransitiveReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_2d7c7a9916fa2967cfb4d546f4e37c43b64368ed4a60618379328e066e9b7e0e : (forall x0, IrreflexiveTransitiveReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> not (x3 x4 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
Axiom missingprop_dbb6377af3127d2bf8cd888143d856b4a86f0ec975822a440e0313d91ee07474 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> IrreflexiveTransitiveReln (pack_r x0 x1)).
Theorem missingprop_3f5001a72163974136426bcc5f2d7c351f6bd8749b8ac0680fe704489738e04d : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
