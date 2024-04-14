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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition surj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Sep_In_Power : (forall x0, forall x1 : set -> prop, Sep x0 x1 :e Power x0).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Theorem missingprop_eb4dfa082fe8ff2ce88364ea3029d6fc7f15c110eace04afc58cb450effe9d02 : (forall x0, forall x1 : set -> set, not (surj x0 (Power x0) x1)).
admit.
Qed.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set -> (set -> prop) -> (set -> set) -> set.
Axiom ReplSepI : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e x0 -> x1 x3 -> x2 x3 :e ReplSep x0 x1 x2).
Axiom ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Theorem inj_Cantor : (forall x0, forall x1 : set -> set, not (inj (Power x0) x0 x1)).
admit.
Qed.
Definition MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x6 x4 (x5 x6)) (forall x7, Hom x6 x4 x7 -> x7 = x5 x6))).
(* Parameter IrreflexiveSymmetricReln "a290dddd19b77391bcdbb970300fedc33af288c11500743c0157cf51badb17eb" "fa6fcaff8c08d173f4c5fc1c7d3d3384bb0b907765662ba5613feb3ec9203b80" *)
Parameter IrreflexiveSymmetricReln : set -> prop.
(* Parameter BinRelnHom "352304ebb6c77dbc4e2a952e767857a98538e43de1c35fb4bcd6c99fca02ae7e" "acf0f04c6a55a143e3ed8404c0fa6b09b323d938c83532f081b47091e31c4eb3" *)
Parameter BinRelnHom : set -> set -> set -> prop.
(* Parameter struct_id "ddbfe293c94f63568d97903ab92695c5b104ee51e1b7d4e7dd29a87510065054" "ac22e99093b43e0b6246d1a60c33b72b22acf28c29494701ebd52fa3ba6ac8bc" *)
Parameter struct_id : set -> set.
(* Parameter struct_comp "083de41b8563c219f20c031d31476936c0d8efb368f1cc435222350877aea8c7" "1d1c1c340eef2e4f17fd68c23ff42742c492212f4387d13a5eb5c85697990717" *)
Parameter struct_comp : set -> set -> set -> set -> set -> set.
(* Parameter pack_r "39d80099e1b48aed4548f424ae4f1ff25b2d595828aff4b3a5abe232ca0348b5" "217a7f92acc207b15961c90039aa929f0bd5d9212f66ce5595c3af1dd8b9737e" *)
Parameter pack_r : set -> (set -> set -> prop) -> set.
Axiom missingprop_034efb78ebb5063d16d232d7a2af450524a44508ccd003479f3d4a1b105247b8 : (forall x0, IrreflexiveSymmetricReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> not (x3 x4 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> x1 (pack_r x2 x3)) -> x1 x0)).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom missingprop_4e486761c3790f4990f398ce8c16ea7ac5915924a294f8e5b06e45030e68e983 : (forall x0 x1, forall x2 x3 : set -> set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom missingprop_d442b731cc8a623579f119dd4140f334acbb8f35c49c35a487654154f8239ef6 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> IrreflexiveSymmetricReln (pack_r x0 x1)).
Theorem missingprop_c6008f43624eb6c4b09a7144765a3baa9ea4e73894a9257401b400183472b666 : not (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter MetaCat_monic_p "f533207f71a5177d7249765eaeade947ad50cf92e2283c0da9dc069894f6f162" "bb42af02625c947315da0cad8dfb202966b1ecd2386812628852e0adf9c04c16" *)
Parameter MetaCat_monic_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> prop.
(* Parameter MetaCat_pullback_p "78ffabab9f01508fc81bc36a5c0dfcc5d2cace556d216f6d6aab9389f42d4476" "aa77e5577fc2ce6a3c73b87382bd659aefd97ffae837e35547f34b606166c999" *)
Parameter MetaCat_pullback_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop.
Definition MetaCat_subobject_classifier_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> (set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => fun x6 x7 : set => fun x8 : set -> set -> set -> set => fun x9 : set -> set -> set -> set -> set -> set -> set => and (and (and (MetaCat_terminal_p Obj Hom Id Comp x4 x5) (Obj x6)) (Hom x4 x6 x7)) (forall x10 x11 x12, MetaCat_monic_p Obj Hom Id Comp x10 x11 x12 -> and (Hom x11 x6 (x8 x10 x11 x12)) (MetaCat_pullback_p Obj Hom Id Comp x4 x11 x6 x7 (x8 x10 x11 x12) x10 (x5 x10) x12 (x9 x10 x11 x12)))).
Theorem missingprop_50d206f747d1c57a7c32a09d88c61e2b3449b97c8b022598ba144ee538e164bc : not (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_p IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_nno_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => fun x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (MetaCat_terminal_p Obj Hom Id Comp x4 x5) (Obj x6)) (Hom x4 x6 x7)) (Hom x6 x6 x8)) (forall x10 x11 x12, Obj x10 -> Hom x4 x10 x11 -> Hom x10 x10 x12 -> and (and (and (Hom x6 x10 (x9 x10 x11 x12)) (Comp x4 x6 x10 (x9 x10 x11 x12) x7 = x11)) (Comp x6 x6 x10 (x9 x10 x11 x12) x8 = Comp x6 x10 x10 x12 (x9 x10 x11 x12))) (forall x13, Hom x6 x10 x13 -> Comp x4 x6 x10 x13 x7 = x11 -> Comp x6 x6 x10 x13 x8 = Comp x6 x10 x10 x12 x13 -> x13 = x9 x10 x11 x12))).
Theorem missingprop_2e999c0f550dc447316d702e0dce99d4cbadce986626c38f3dd26a31204a448d : not (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter IrreflexiveTransitiveReln "71ade8643726a6e7f38cc8ef90bf356e854b17e60a87a5799b556e53a948c155" "64673bc8a8882720c2818d2bf776ca95f2a94e00547422df4e502e2c1ea48675" *)
Parameter IrreflexiveTransitiveReln : set -> prop.
Axiom missingprop_2d7c7a9916fa2967cfb4d546f4e37c43b64368ed4a60618379328e066e9b7e0e : (forall x0, IrreflexiveTransitiveReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> not (x3 x4 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
(* Parameter ZermeloWO "dc4124cb3e699eb9154ce37eaa547c4d08adc8fd41c311d706024418f4f1c8d6" "36a362f5d7e56550e98a38468fb4fc4d70ea17f4707cfdd2f69fc2cce37a9643" *)
Parameter ZermeloWO : set -> set -> prop.
Definition ZermeloWOstrict : set -> set -> prop :=
 (fun x0 x1 : set => and (ZermeloWO x0 x1) (x0 = x1 -> (forall x2 : prop, x2))).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition trichotomous_or : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2, or (or (x0 x1 x2) (x1 = x2)) (x0 x2 x1)).
Axiom ZermeloWOstrict_trich : trichotomous_or ZermeloWOstrict.
Axiom missingprop_dbb6377af3127d2bf8cd888143d856b4a86f0ec975822a440e0313d91ee07474 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> IrreflexiveTransitiveReln (pack_r x0 x1)).
Definition transitive : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2 x3, x0 x1 x2 -> x0 x2 x3 -> x0 x1 x3).
Axiom ZermeloWO_tra : transitive ZermeloWO.
Definition antisymmetric : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2, x0 x1 x2 -> x0 x2 x1 -> x1 = x2).
Axiom ZermeloWO_antisym : antisymmetric ZermeloWO.
Theorem missingprop_e71abc4a02dfd6eab4eff97b6494f847efef36c41e6b6541b41589dda8be92cb : not (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_4b817722e1708cba3bac9bae3f70ae020fab38eb23fb650bbe9d007ae313c138 : not (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_p IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_257a047b4f530cc76af08e8c063b0d3c0ec305b3b5bfc28ec8f3f5783cc79e91 : not (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
