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
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition missingname_6f9cb45c83a4901157879a734e306c45f26a9a3eff7d5eef50474588c2cba8cd : set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 : set => unpack_r_i x0 (fun x4 : set => pack_r (Sep x4 (fun x5 : set => forall x6 : set -> set -> prop, x6 (ap x2 x5) (ap x3 x5) -> x6 (ap x3 x5) (ap x2 x5))))).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom unpack_r_i_eq : (forall x0 : set -> (set -> set -> prop) -> set, forall x1, forall x2 : set -> set -> prop, (forall x3 : set -> set -> prop, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> iff (x2 x4 x5) (x3 x4 x5))) -> x0 x1 x3 = x0 x1 x2) -> unpack_r_i (pack_r x1 x2) x0 = x0 x1 x2).
Axiom pack_r_ext : (forall x0, forall x1 x2 : set -> set -> prop, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> iff (x1 x3 x4) (x2 x3 x4))) -> pack_r x0 x1 = pack_r x0 x2).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem missingprop_f1f0d0235cc3f72918ba3b7bc6e671feb556f667a17378616f96007dc95611ad : (forall x0, forall x1 : set -> set -> prop, forall x2 x3 x4, forall x5 : set -> set -> prop, x5 (missingname_6f9cb45c83a4901157879a734e306c45f26a9a3eff7d5eef50474588c2cba8cd (pack_r x0 x1) x2 x3 x4) (pack_r (Sep x0 (fun x6 : set => forall x7 : set -> set -> prop, x7 (ap x3 x6) (ap x4 x6) -> x7 (ap x4 x6) (ap x3 x6))) x1) -> x5 (pack_r (Sep x0 (fun x6 : set => forall x7 : set -> set -> prop, x7 (ap x3 x6) (ap x4 x6) -> x7 (ap x4 x6) (ap x3 x6))) x1) (missingname_6f9cb45c83a4901157879a734e306c45f26a9a3eff7d5eef50474588c2cba8cd (pack_r x0 x1) x2 x3 x4)).
admit.
Qed.
Definition struct_r : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, x1 (pack_r x2 x3)) -> x1 x0).
(* Parameter BinRelnHom "352304ebb6c77dbc4e2a952e767857a98538e43de1c35fb4bcd6c99fca02ae7e" "acf0f04c6a55a143e3ed8404c0fa6b09b323d938c83532f081b47091e31c4eb3" *)
Parameter BinRelnHom : set -> set -> set -> prop.
Definition MetaCat_equalizer_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 : set => fun x10 : set -> set -> set => and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (Hom x4 x5 x7)) (Obj x8)) (Hom x8 x4 x9)) (Comp x8 x4 x5 x6 x9 = Comp x8 x4 x5 x7 x9)) (forall x11, Obj x11 -> (forall x12, Hom x11 x4 x12 -> Comp x11 x4 x5 x6 x12 = Comp x11 x4 x5 x7 x12 -> and (and (Hom x11 x8 (x10 x11 x12)) (Comp x11 x8 x4 x9 (x10 x11 x12) = x12)) (forall x13, Hom x11 x8 x13 -> Comp x11 x8 x4 x9 x13 = x12 -> x13 = x10 x11 x12)))).
Definition MetaCat_equalizer_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 : set -> set -> set -> set -> set => fun x6 : set -> set -> set -> set -> set -> set -> set => forall x7 x8, Obj x7 -> Obj x8 -> (forall x9 x10, Hom x7 x8 x9 -> Hom x7 x8 x10 -> MetaCat_equalizer_p Obj Hom Id Comp x7 x8 x9 x10 (x4 x7 x8 x9 x10) (x5 x7 x8 x9 x10) (x6 x7 x8 x9 x10))).
(* Parameter struct_id "ddbfe293c94f63568d97903ab92695c5b104ee51e1b7d4e7dd29a87510065054" "ac22e99093b43e0b6246d1a60c33b72b22acf28c29494701ebd52fa3ba6ac8bc" *)
Parameter struct_id : set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Definition struct_comp : set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam_comp (ap x0 Empty)).
Axiom missingprop_9981628fee84bcf70587ffb7933bd9c35042a1a594a2ae21c28e38ea11e09d6a : (forall x0 x1 x2 x3 x4 x5 x6 x7 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom missingprop_4e486761c3790f4990f398ce8c16ea7ac5915924a294f8e5b06e45030e68e983 : (forall x0 x1, forall x2 x3 : set -> set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4)).
Axiom pack_r_0_eq2 : (forall x0, forall x1 x2 : set -> set -> prop, x2 x0 (ap (pack_r x0 x1) Empty) -> x2 (ap (pack_r x0 x1) Empty) x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Theorem missingprop_2aabccf4699c9f902dcc37be8ad1f3aaa001e5f2bb081556c38a4bbd69d3e5c6 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> (forall x1 x2 x3 x4, x0 x1 -> x0 x2 -> BinRelnHom x1 x2 x3 -> BinRelnHom x1 x2 x4 -> x0 (missingname_6f9cb45c83a4901157879a734e306c45f26a9a3eff7d5eef50474588c2cba8cd x1 x2 x3 x4)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 BinRelnHom struct_id struct_comp x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Axiom pack_struct_r_I : (forall x0, forall x1 : set -> set -> prop, struct_r (pack_r x0 x1)).
Theorem missingprop_0bffcbc5d86f4ba074fd813ba32990cab76e7a4512be26e82f93761494dc7f3f : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p struct_r BinRelnHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_c743d500597c886f8c9f734201e1e33c3ed6306ca10b5ca232711b87a9244d05 : MetaCat struct_r BinRelnHom struct_id struct_comp.
(* Parameter MetaCat_pullback_struct_p "0aae59672cd58c2e839eeb483f6d823f8c69400c45e67edc458d965b50b1e024" "c0b415a5b0463ba8aadaf1461fdc1f965c8255153af1d823b1bbd04f8393b554" *)
Parameter MetaCat_pullback_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
(* Parameter MetaCat_product_constr_p "174a19a576b89f1308ff59f6dd7de2117117f98e28682f4bbd15fbb1975ae6f0" "8627a945e60408d81c3094008f07f651db6b692c34fa1ffa9753e39b66d38044" *)
Parameter MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_9a59ecd7e83aeba0d4be9a32b55c5c57c6083b63a3b259e3f5889e4923a1993d : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 x1 x2 x3 x5 x7 x9 -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4)).
Axiom missingprop_907117947d3e5122f17dc0ad87d42ef61641eaa3908e950d289d200dd82717a4 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p struct_r BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Theorem missingprop_fdf584f8c9b92d3913172889456203bfbb37ac698975b21d9598eb83c93911f4 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p struct_r BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_r_o "8d2ef9c9e522891d1fe605a62dffeab8aefb6325650e4eab14135e7eee8002c5" "e3e6af0984cda0a02912e4f3e09614b67fc0167c625954f0ead4110f52ede086" *)
Parameter unpack_r_o : set -> (set -> (set -> set -> prop) -> prop) -> prop.
(* Parameter not "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" "f30435b6080d786f27e1adaca219d7927ddce994708aacaf4856c5b701fe9fa1" *)
Parameter not : prop -> prop.
Definition IrreflexiveSymmetricReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))))).
Axiom missingprop_034efb78ebb5063d16d232d7a2af450524a44508ccd003479f3d4a1b105247b8 : (forall x0, IrreflexiveSymmetricReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> not (x3 x4 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> x1 (pack_r x2 x3)) -> x1 x0)).
Axiom missingprop_d442b731cc8a623579f119dd4140f334acbb8f35c49c35a487654154f8239ef6 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> IrreflexiveSymmetricReln (pack_r x0 x1)).
Theorem missingprop_df7a794afb6d0bc6aaf84f69a53154c30ebbe8d384f15e54a0f441d1cc9d4a7d : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_53ea818e2021d87ac705f8683274896fc426e94dc27b29259138e0d21bd2ebcf : MetaCat IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp.
Axiom missingprop_3c8643c587af8b76606b3bd4c132b0669b42e58d4e2858afde92b9385ea31cd1 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Theorem missingprop_ace795a930cabd032ac08610dc6bc9d6b366f7b03ff1c206d1fae311571efe18 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition PER : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_c1d3826129d2eb54a8f1e40a6116497a0cdb00a6ee455a0b01d56d09477d50d0 : (forall x0, PER x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
Axiom missingprop_b2515235786361aea7c15ac6711d5751cd13b11988163a3b347abdb56aff828a : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> PER (pack_r x0 x1)).
Theorem missingprop_da50e7cfd4a6aa1a481b29d9a258b6246a088ccf7431433a7c842df63c835f1e : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p PER BinRelnHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_a9109a2e2c7b58d168a345c3d559fa6cefbb8aaf51b02c98b368d0383e86b3cc : MetaCat PER BinRelnHom struct_id struct_comp.
Axiom missingprop_7424d1576845fd7b3796312ad5767cec794f06149f4f042f760ca6e0fb95d565 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p PER BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Theorem missingprop_9f0f8025bf1db8e9a8f6e94c14f0536d64157caaaaee926768f86caaaaf6e54c : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p PER BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition EquivReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (and (forall x3, x3 :e x1 -> x2 x3 x3) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_6402afcf89af96ded942e84b9859aeeef4ba7eaef1979737905398451311e541 : (forall x0, EquivReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> x3 x4 x4) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
Axiom missingprop_46185b99972d7cc500b0fcea77da3881e5aca4376b72d7aefbcc4420b07dadec : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> x1 x2 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> EquivReln (pack_r x0 x1)).
Theorem missingprop_88bfe6d781381f29ef043aee3e2988fe3a72374427e3637d5ac3993ada29fd2a : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p EquivReln BinRelnHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_9b87477ddae5e1dddee7ca772cf97e36225e0c4d6c64a3a14907f878e8629023 : MetaCat EquivReln BinRelnHom struct_id struct_comp.
Axiom missingprop_78f231cfd5c3d9e0f310265d5b946c5362d2175a87918560d372a043b147dbaa : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p EquivReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Theorem missingprop_f66e64366cd08b59e8912357491a4ca8bd36863d8f709b24ea4fc102a44bf4e7 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p EquivReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition IrreflexiveTransitiveReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_2d7c7a9916fa2967cfb4d546f4e37c43b64368ed4a60618379328e066e9b7e0e : (forall x0, IrreflexiveTransitiveReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> not (x3 x4 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
Axiom missingprop_dbb6377af3127d2bf8cd888143d856b4a86f0ec975822a440e0313d91ee07474 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> IrreflexiveTransitiveReln (pack_r x0 x1)).
Theorem missingprop_14b52454f5a18387af00a1d4328cd05914b39197586f3c2e7f3300991bab3049 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_3cfb35338d6b874e5c5bd0760253f7ac65e99ffc814bd52eef4adff85a56dbe0 : MetaCat IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp.
Axiom missingprop_7acdd2f9b1867396a4dd5041feef2b8c5c998d6a5f4d3538435fc4641df31065 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Theorem missingprop_de0ba522d6fd9f634fd1c94c4e3245b20b453d656466349f003cae39a3e55d82 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
