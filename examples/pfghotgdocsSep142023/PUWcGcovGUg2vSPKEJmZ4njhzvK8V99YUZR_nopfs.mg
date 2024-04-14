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
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition lam_id : set -> set :=
 (fun x0 : set => lam x0 (fun x1 : set => x1)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition struct_id : set -> set :=
 (fun x0 : set => lam_id (ap x0 Empty)).
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Definition struct_comp : set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam_comp (ap x0 Empty)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition MetaCat_initial_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x4 x6 (x5 x6)) (forall x7, Hom x4 x6 x7 -> x7 = x5 x6))).
(* Parameter pack_e "faab5f334ba3328f24def7e6fcb974000058847411a2eb0618014eca864e537f" "dd8f2d332fef3b4d27898ab88fa5ddad0462180c8d64536ce201f5a9394f40dd" *)
Parameter pack_e : set -> set -> set.
Definition struct_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2 x3, x3 :e x2 -> x1 (pack_e x2 x3)) -> x1 x0).
(* Parameter PtdSetHom "e62fb376978eab6f3a437ccbcbf7db7e720c6d825a9ac34a47cc1290a4483e8a" "d6f688b87f520e20f883436520c684182d8140f8ad0fdc595e075122f758500e" *)
Parameter PtdSetHom : set -> set -> set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom pack_struct_e_I : (forall x0 x1, x1 :e x0 -> struct_e (pack_e x0 x1)).
Axiom In_0_1 : 0 :e 1.
Axiom pack_e_1_eq2 : (forall x0 x1, forall x2 : set -> set -> prop, x2 x1 (ap (pack_e x0 x1) 1) -> x2 (ap (pack_e x0 x1) 1) x1).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom missingprop_266cf3934e79ff708b43f6101066886a004a8b2cb57b38750ae943dbc174c7c9 : (forall x0 x1 x2 x3 x4, forall x5 : prop -> prop -> prop, x5 (PtdSetHom (pack_e x0 x2) (pack_e x1 x3) x4) (and (x4 :e setexp x1 x0) (ap x4 x2 = x3)) -> x5 (and (x4 :e setexp x1 x0) (ap x4 x2 = x3)) (PtdSetHom (pack_e x0 x2) (pack_e x1 x3) x4)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Theorem missingprop_0c84ddd838d7290683d94bc3f86181a92c6889385deca399d089e68ff85806b5 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p struct_e PtdSetHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter MetaCat_terminal_p "e188a394359450645dfdce85a0b30e951da4f945117188395c3ab12bb228e33d" "fdae77d1a5079ae1a09aaeb23343f4bd6081907e9fe81a573b7244a35af0d909" *)
Parameter MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
Theorem missingprop_1e0c736c8a9c45284baa559720ed83c5fc0b742355a59cd112c741f3f321910f : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p struct_e PtdSetHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_coproduct_constr_p "8f2fbe77e432c151f468828696bc88cfbde14365208ec6d40c57d57f47201c42" "9283cafc90df46790d36399d9c4a27aec79cadc0fd1a9b2f654b0465ca1d1659" *)
Parameter MetaCat_coproduct_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_29ade104809db97d40b07bec4cb66844b56549ceb16f96a2ea55d78e05c4a978 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p struct_e PtdSetHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_product_constr_p "174a19a576b89f1308ff59f6dd7de2117117f98e28682f4bbd15fbb1975ae6f0" "8627a945e60408d81c3094008f07f651db6b692c34fa1ffa9753e39b66d38044" *)
Parameter MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_bbe71c5cff59bb21e9dc4634b0dd3297f1fcfa0000094df812fb5ec731f63b20 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p struct_e PtdSetHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_coequalizer_buggy_struct_p "b635bdf22563c31dfe7ebe5ef5db6659c84c46d4448fbd36c50ffb05669d7a72" "90c303e6b6cca396b2d8ddeff62cda2c0954a43d45ad666e7b8ea21c1d8fa73a" *)
Parameter MetaCat_coequalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_2a0f5ef8bc339404a8715086329c35b6e38f6e133842fddf9480bb1cb6cac25a : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p struct_e PtdSetHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_equalizer_buggy_struct_p "e67bc4d0a725995ed2ec3098468550e926fee1bce25684449381d154f0ee8440" "0cc8a8cbd38e8ba1ee07ccfd5533e5863ca3585fcd0f824fb201b116adadea99" *)
Parameter MetaCat_equalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_13c2e008b5c8fe2f69f02a8748e42980d7ebe463f019d77574bb43b1b6f65e92 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p struct_e PtdSetHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_pushout_buggy_constr_p "a40e2bf43bfaedcb235fbe9cf70798d807af253c9fbdaca746d406eede069a95" "e4ed700f88c7356f166d3aaad35c3007fde4361ccaa00c752a1b65ddb538052e" *)
Parameter MetaCat_pushout_buggy_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_1d2e5cde151aa4ec215d29f51b4d6b2280d6287ca8433028d39a907c1fdc7825 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p struct_e PtdSetHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_pullback_buggy_struct_p "d911abc76bc46c5334e7c773fdba8df1c33d0156234b37084c9e6526851c30b9" "944de6e799f202bde0a6c9ed7626d6a7b2530cb8ff1b9c9a979548e02c1a4b81" *)
Parameter MetaCat_pullback_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_9270061357d7200225cacb839ea1380c536224fd97b7c7097bc8cf3e76165549 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p struct_e PtdSetHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_exp_constr_p "9f6ce4075c92a59821f6cfbfc8f86cc2c3b8a00b532253e0c92520fca04ab97b" "b618dfe4a17334147263c506b2138f51d0d2c7b154efad7f4f29ccbe49e432f3" *)
Parameter MetaCat_exp_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set) -> prop.
Theorem missingprop_83907c8fa38ebbd7da2dea28830531b93f509a33de455a19faba0d60bfb40cf3 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p struct_e PtdSetHom struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_subobject_classifier_buggy_p "b430b61db2900bb60168d91af644ce9e8886b53b9fc1d812f4f50f301fbaf2ad" "b25dda61a9e31c2b6c19744c16c5af120939ef77a89fe6bcea622a7b6ba6ce78" *)
Parameter MetaCat_subobject_classifier_buggy_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> (set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_f3cc4a9136f9ecfbd8277ad99eeca42f9151aeca899dc134a4ccb7b1f39b5548 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_buggy_p struct_e PtdSetHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_nno_p "5b8f1bcabb96c729d6120f7525c02179f8baf007a2bc04b7f8efb36fff497cf6" "037a74a15834f7850061137e15b24c1545b3cec27cea76d5a22e5f66ad2e9ff1" *)
Parameter MetaCat_nno_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> set -> (set -> set -> set -> set) -> prop.
Theorem missingprop_637643f7fe98d49116dccfdf8c0e523aa9d3b0d6d779d30e3140efbf10ed2630 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p struct_e PtdSetHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaAdjunction_strict "be3dc11d683b255bfbd9127adb3c6087d074a17cb0e31c91d602b5ae49893e97" "c8ed7d3ad63a4a29ebc88ac0ccb02bfd5f4c0141eebc8a7a349ed7115a3a3eb9" *)
Parameter MetaAdjunction_strict : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set) -> prop.
(* Parameter True "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" "f81b3934a73154a8595135f10d1564b0719278d3976cc83da7fda60151d770da" *)
Parameter True : prop.
Definition HomSet : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => x2 :e setexp x1 x0).
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter combine_funcs "f0267e2cbae501ea3433aecadbe197ba8f39c96e80326cc5981a1630fda29909" "ccac4354446ce449bb1c967fa332cdf48b070fc032d9733e4c1305fb864cb72a" *)
Parameter combine_funcs : set -> set -> (set -> set) -> (set -> set) -> set -> set.
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
(* Parameter Inj0 "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" "8143218ffde429ff34b20ee5c938914c75e40d59cd52cc5db4114971d231ca73" *)
Parameter Inj0 : set -> set.
(* Parameter MetaFunctor_strict "dd69f4b569545c4beb1b440df404a181508406955eb862b17b28cf09de44afcf" "8085cf0170b86729cab30e095b013215757a3930981428ca9b33ed00255b3e5b" *)
Parameter MetaFunctor_strict : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> prop.
(* Parameter MetaFunctor "3f1821f85d08e8012e699b09efeb0773942fcc2adacfea48bc8f23b31eb6673d" "f35b679c6bab1e6cf0fdcf922094790594854b8da194ab1c6b10991183d51c1a" *)
Parameter MetaFunctor : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> prop.
(* Parameter MetaNatTrans "8a2958081ef9384f7ae14223d1b2eae8a7b40e054a6e8404700b3282c5cc73fc" "cf0ad1ee32827718afb13bd3eaf6f0a23dac224e237a5287cf6770bed71314d0" *)
Parameter MetaNatTrans : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> prop.
(* Parameter MetaAdjunction "cecdcdbb34d99cbd63719b23fce489fa60013beaacbc82f82b45e1606f0d1426" "e8b6c46a7320708ff26c3ecf5b9d4028cd895a2df98bc04c5a259452e7b00b34" *)
Parameter MetaAdjunction : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set) -> prop.
Axiom missingprop_712520f713b96d5afd10321cea9a3c978868fc53aa35a29461e902d5b5a4ba79 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 x13 : set -> set, MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor x4 x5 x6 x7 x0 x1 x2 x3 x10 x11 -> MetaNatTrans x0 x1 x2 x3 x0 x1 x2 x3 (fun x14 : set => x14) (fun x14 x15 x16 : set => x16) (fun x14 : set => x10 (x8 x14)) (fun x14 x15 x16 : set => x11 (x8 x14) (x8 x15) (x9 x14 x15 x16)) x12 -> MetaNatTrans x4 x5 x6 x7 x4 x5 x6 x7 (fun x14 : set => x8 (x10 x14)) (fun x14 x15 x16 : set => x9 (x10 x14) (x10 x15) (x11 x14 x15 x16)) (fun x14 : set => x14) (fun x14 x15 x16 : set => x16) x13 -> MetaAdjunction x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 -> MetaAdjunction_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13).
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_3d05796578cdc17ebd2096167db48ecef934256d250d1637eb5dd67225cdfe05 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> MetaCat x4 x5 x6 x7 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9).
Axiom missingprop_dcf5739aa5fe0adc626fd983737b233fe68652dff14c53b3d75823dcf2542d41 : MetaCat (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
Axiom missingprop_f2377bbdcf1599eea76afec3fd7eab2ae5834953315849b5fb79930303088894 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_e x1) -> MetaCat x0 PtdSetHom (fun x1 : set => lam_id (ap x1 0)) (fun x1 x2 x3 : set => lam_comp (ap x1 0))).
Axiom missingprop_795e291855a044d4d636c961caa1600704603cc02e33a7b37aa66e8d7f6512db : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, (forall x10, x0 x10 -> x4 (x8 x10)) -> (forall x10 x11 x12, x0 x10 -> x0 x11 -> x1 x10 x11 x12 -> x5 (x8 x10) (x8 x11) (x9 x10 x11 x12)) -> (forall x10, x0 x10 -> x9 x10 x10 (x2 x10) = x6 (x8 x10)) -> (forall x10 x11 x12 x13 x14, x0 x10 -> x0 x11 -> x0 x12 -> x1 x10 x11 x13 -> x1 x11 x12 x14 -> x9 x10 x12 (x3 x10 x11 x12 x14 x13) = x7 (x8 x10) (x8 x11) (x8 x12) (x9 x11 x12 x14) (x9 x10 x11 x13)) -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom setsum_Inj_inv : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = Inj0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = Inj1 x4) -> x3) -> x3)).
Axiom combine_funcs_eq1 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj0 x4)) (x2 x4) -> x5 (x2 x4) (combine_funcs x0 x1 x2 x3 (Inj0 x4))).
Axiom Inj0_0 : Inj0 0 = 0.
Axiom combine_funcs_eq2 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj1 x4)) (x3 x4) -> x5 (x3 x4) (combine_funcs x0 x1 x2 x3 (Inj1 x4))).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom missingprop_7938f413b613d0d0c75ef55fa10d2044621c1f1cd2fd8d0c2e5b548d072582ea : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_e x1) -> MetaFunctor x0 PtdSetHom (fun x1 : set => lam_id (ap x1 0)) (fun x1 x2 x3 : set => lam_comp (ap x1 0)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 0) (fun x1 x2 x3 : set => x3)).
Axiom missingprop_8286b81a8fdd3c2d94c8171b33b1d824cef15a2de614f485e1ddaf3274d514b3 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 : set -> set, (forall x13, x0 x13 -> x5 (x8 x13) (x10 x13) (x12 x13)) -> (forall x13 x14 x15, x0 x13 -> x0 x14 -> x1 x13 x14 x15 -> x7 (x8 x13) (x10 x13) (x10 x14) (x11 x13 x14 x15) (x12 x13) = x7 (x8 x13) (x8 x14) (x10 x14) (x12 x14) (x9 x13 x14 x15)) -> MetaNatTrans x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12).
Axiom Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
Axiom pack_e_0_eq2 : (forall x0 x1, forall x2 : set -> set -> prop, x2 x0 (ap (pack_e x0 x1) 0) -> x2 (ap (pack_e x0 x1) 0) x0).
Axiom missingprop_1ed38896bfc54bf06ebfdf4c1203efc09707d065530eefdfbe6f0a87b8e29dd3 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 x13 : set -> set, (forall x14, x0 x14 -> x7 (x8 x14) (x8 (x10 (x8 x14))) (x8 x14) (x13 (x8 x14)) (x9 x14 (x10 (x8 x14)) (x12 x14)) = x6 (x8 x14)) -> (forall x14, x4 x14 -> x3 (x10 x14) (x10 (x8 (x10 x14))) (x10 x14) (x11 (x8 (x10 x14)) x14 (x13 x14)) (x12 (x10 x14)) = x2 (x10 x14)) -> MetaAdjunction x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13).
Axiom Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
Theorem missingprop_1272ed8ef2a01d1e60cc0101c7ffcaf990d9d23ca91c20d6d6ec5d7f680b167f : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) struct_e PtdSetHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
