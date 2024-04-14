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
(* Parameter MetaAdjunction_strict "be3dc11d683b255bfbd9127adb3c6087d074a17cb0e31c91d602b5ae49893e97" "c8ed7d3ad63a4a29ebc88ac0ccb02bfd5f4c0141eebc8a7a349ed7115a3a3eb9" *)
Parameter MetaAdjunction_strict : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set) -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition MetaCat_initial_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x4 x6 (x5 x6)) (forall x7, Hom x4 x6 x7 -> x7 = x5 x6))).
(* Parameter MetaFunctor_strict "dd69f4b569545c4beb1b440df404a181508406955eb862b17b28cf09de44afcf" "8085cf0170b86729cab30e095b013215757a3930981428ca9b33ed00255b3e5b" *)
Parameter MetaFunctor_strict : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> prop.
(* Parameter MetaFunctor "3f1821f85d08e8012e699b09efeb0773942fcc2adacfea48bc8f23b31eb6673d" "f35b679c6bab1e6cf0fdcf922094790594854b8da194ab1c6b10991183d51c1a" *)
Parameter MetaFunctor : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> prop.
(* Parameter MetaNatTrans "8a2958081ef9384f7ae14223d1b2eae8a7b40e054a6e8404700b3282c5cc73fc" "cf0ad1ee32827718afb13bd3eaf6f0a23dac224e237a5287cf6770bed71314d0" *)
Parameter MetaNatTrans : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> prop.
(* Parameter MetaAdjunction "cecdcdbb34d99cbd63719b23fce489fa60013beaacbc82f82b45e1606f0d1426" "e8b6c46a7320708ff26c3ecf5b9d4028cd895a2df98bc04c5a259452e7b00b34" *)
Parameter MetaAdjunction : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set) -> prop.
Axiom missingprop_9a5dd92d37ccfa65696c11e832d98097811bf4001ca7eb00f4f9586fc6e6bb6b : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 x13 : set -> set, MetaAdjunction_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 -> (forall x14 : prop, (MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor x4 x5 x6 x7 x0 x1 x2 x3 x10 x11 -> MetaNatTrans x0 x1 x2 x3 x0 x1 x2 x3 (fun x15 : set => x15) (fun x15 x16 x17 : set => x17) (fun x15 : set => x10 (x8 x15)) (fun x15 x16 x17 : set => x11 (x8 x15) (x8 x16) (x9 x15 x16 x17)) x12 -> MetaNatTrans x4 x5 x6 x7 x4 x5 x6 x7 (fun x15 : set => x8 (x10 x15)) (fun x15 x16 x17 : set => x9 (x10 x15) (x10 x16) (x11 x15 x16 x17)) (fun x15 : set => x15) (fun x15 x16 x17 : set => x17) x13 -> MetaAdjunction x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 -> x14) -> x14)).
Axiom missingprop_67ed42aa94f161ee21a2e65a66bf8b96dc66d4484eee9eeb2abcb112d8b49161 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 x13 : set -> set, MetaAdjunction x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 -> (forall x14 : prop, ((forall x15, x0 x15 -> x7 (x8 x15) (x8 (x10 (x8 x15))) (x8 x15) (x13 (x8 x15)) (x9 x15 (x10 (x8 x15)) (x12 x15)) = x6 (x8 x15)) -> (forall x15, x4 x15 -> x3 (x10 x15) (x10 (x8 (x10 x15))) (x10 x15) (x11 (x8 (x10 x15)) x15 (x13 x15)) (x12 (x10 x15)) = x2 (x10 x15)) -> x14) -> x14)).
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_b9f4ecece16a3f4b44463b508cc3b9f5d1731684163a4bbdbf54ad9580b00fef : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> (forall x10 : prop, (MetaCat x0 x1 x2 x3 -> MetaCat x4 x5 x6 x7 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> x10) -> x10)).
(* Parameter MetaFunctor_prop1 "d93492debcc941aa529306666dc15e8b90e1c35700eba39acf35c9b597743caf" "5b5295c9462608ca7d9fadeeeb12ef2ff33e0abce6c5f3d21bb914b84b707340" *)
Parameter MetaFunctor_prop1 : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Definition MetaFunctor_prop2 : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (forall x4 x5 x6 x7 x8, Obj x4 -> Obj x5 -> Obj x6 -> Hom x4 x5 x7 -> Hom x5 x6 x8 -> Hom x4 x6 (Comp x4 x5 x6 x8 x7)).
Axiom missingprop_d158dd0ee7cd129998fef286b8e8d5798d9fdd1daf331b8339c3836f8066dce4 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (MetaFunctor_prop1 x0 x1 x2 x3 -> MetaFunctor_prop2 x0 x1 x2 x3 -> (forall x5 x6 x7, x0 x5 -> x0 x6 -> x1 x5 x6 x7 -> x3 x5 x5 x6 x7 (x2 x5) = x7) -> (forall x5 x6 x7, x0 x5 -> x0 x6 -> x1 x5 x6 x7 -> x3 x5 x6 x6 (x2 x6) x7 = x7) -> (forall x5 x6 x7 x8 x9 x10 x11, x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x5 x6 x9 -> x1 x6 x7 x10 -> x1 x7 x8 x11 -> x3 x5 x6 x8 (x3 x6 x7 x8 x11 x10) x9 = x3 x5 x7 x8 x11 (x3 x5 x6 x7 x10 x9)) -> x4) -> x4)).
Axiom missingprop_d4b40e23fc0295f5b3315cbc1d218fe48d2b71569cbf77e67c33e2487a1d9a24 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> (forall x10 : prop, ((forall x11, x0 x11 -> x4 (x8 x11)) -> (forall x11 x12 x13, x0 x11 -> x0 x12 -> x1 x11 x12 x13 -> x5 (x8 x11) (x8 x12) (x9 x11 x12 x13)) -> (forall x11, x0 x11 -> x9 x11 x11 (x2 x11) = x6 (x8 x11)) -> (forall x11 x12 x13 x14 x15, x0 x11 -> x0 x12 -> x0 x13 -> x1 x11 x12 x14 -> x1 x12 x13 x15 -> x9 x11 x13 (x3 x11 x12 x13 x15 x14) = x7 (x8 x11) (x8 x12) (x8 x13) (x9 x12 x13 x15) (x9 x11 x12 x14)) -> x10) -> x10)).
Axiom missingprop_60c5d36105bfcc8198cf1e849b691d909717c94b81b3fd20887e1f1d9372a027 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 : set -> set, MetaNatTrans x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 -> (forall x13 : prop, ((forall x14, x0 x14 -> x5 (x8 x14) (x10 x14) (x12 x14)) -> (forall x14 x15 x16, x0 x14 -> x0 x15 -> x1 x14 x15 x16 -> x7 (x8 x14) (x10 x14) (x10 x15) (x11 x14 x15 x16) (x12 x14) = x7 (x8 x14) (x8 x15) (x10 x15) (x12 x15) (x9 x14 x15 x16)) -> x13) -> x13)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
(* Parameter pack_p "3c539dbbee9d5ff440b9024180e52e9c2adde77bbaa8264d8f67d724d8c8cb25" "d5afae717eff5e7035dc846b590d96bd5a7727284f8ff94e161398c148ab897f" *)
Parameter pack_p : set -> (set -> prop) -> set.
Definition struct_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> prop, x1 (pack_p x2 x3)) -> x1 x0).
(* Parameter UnaryPredHom "44ed079d6a65865657792e1cc515b76a1121cfdc9af8f6c21f8cc848fa700837" "5d0201189805d03fc856c2fa62f35171b88a531f7deeee6199625094c02eddd7" *)
Parameter UnaryPredHom : set -> set -> set -> prop.
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
Axiom missingprop_edb0bbc1cf315b54e2af6e88f0ad67b20f207887129fd2bc159319d8845a3b71 : MetaCat struct_p UnaryPredHom struct_id struct_comp.
Definition True : prop :=
 (forall x0 : prop, x0 -> x0).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Definition HomSet : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => x2 :e setexp x1 x0).
Axiom missingprop_31890113ffae60f7b7ecb6b47676f4323e643b5df3c206911d1387bd73eaf251 : MetaFunctor struct_p UnaryPredHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom pack_struct_p_I : (forall x0, forall x1 : set -> prop, struct_p (pack_p x0 x1)).
Axiom missingprop_63c01b8f599732ba7bc3b48c28c0f10755230e5cc9f0717c7895602d2eaf01d3 : (forall x0 x1, forall x2 x3 : set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Definition MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x6 x4 (x5 x6)) (forall x7, Hom x6 x4 x7 -> x7 = x5 x6))).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom pack_p_0_eq2 : (forall x0, forall x1 : set -> prop, forall x2 : set -> set -> prop, x2 x0 (ap (pack_p x0 x1) 0) -> x2 (ap (pack_p x0 x1) 0) x0).
Axiom In_0_1 : 0 :e 1.
Axiom TrueI : True.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom eq_1_Sing0 : 1 = Sing 0.
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom missingprop_712520f713b96d5afd10321cea9a3c978868fc53aa35a29461e902d5b5a4ba79 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 x13 : set -> set, MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor x4 x5 x6 x7 x0 x1 x2 x3 x10 x11 -> MetaNatTrans x0 x1 x2 x3 x0 x1 x2 x3 (fun x14 : set => x14) (fun x14 x15 x16 : set => x16) (fun x14 : set => x10 (x8 x14)) (fun x14 x15 x16 : set => x11 (x8 x14) (x8 x15) (x9 x14 x15 x16)) x12 -> MetaNatTrans x4 x5 x6 x7 x4 x5 x6 x7 (fun x14 : set => x8 (x10 x14)) (fun x14 x15 x16 : set => x9 (x10 x14) (x10 x15) (x11 x14 x15 x16)) (fun x14 : set => x14) (fun x14 x15 x16 : set => x16) x13 -> MetaAdjunction x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 -> MetaAdjunction_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13).
Axiom missingprop_3d05796578cdc17ebd2096167db48ecef934256d250d1637eb5dd67225cdfe05 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> MetaCat x4 x5 x6 x7 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9).
Axiom missingprop_dcf5739aa5fe0adc626fd983737b233fe68652dff14c53b3d75823dcf2542d41 : MetaCat (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
Axiom missingprop_795e291855a044d4d636c961caa1600704603cc02e33a7b37aa66e8d7f6512db : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, (forall x10, x0 x10 -> x4 (x8 x10)) -> (forall x10 x11 x12, x0 x10 -> x0 x11 -> x1 x10 x11 x12 -> x5 (x8 x10) (x8 x11) (x9 x10 x11 x12)) -> (forall x10, x0 x10 -> x9 x10 x10 (x2 x10) = x6 (x8 x10)) -> (forall x10 x11 x12 x13 x14, x0 x10 -> x0 x11 -> x0 x12 -> x1 x10 x11 x13 -> x1 x11 x12 x14 -> x9 x10 x12 (x3 x10 x11 x12 x14 x13) = x7 (x8 x10) (x8 x11) (x8 x12) (x9 x11 x12 x14) (x9 x10 x11 x13)) -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9).
Axiom missingprop_8286b81a8fdd3c2d94c8171b33b1d824cef15a2de614f485e1ddaf3274d514b3 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 : set -> set, (forall x13, x0 x13 -> x5 (x8 x13) (x10 x13) (x12 x13)) -> (forall x13 x14 x15, x0 x13 -> x0 x14 -> x1 x13 x14 x15 -> x7 (x8 x13) (x10 x13) (x10 x14) (x11 x13 x14 x15) (x12 x13) = x7 (x8 x13) (x8 x14) (x10 x14) (x12 x14) (x9 x13 x14 x15)) -> MetaNatTrans x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12).
Axiom lam_id_exp_In : (forall x0, lam_id x0 :e setexp x0 x0).
Axiom lam_comp_id_R : (forall x0 x1 x2, x2 :e setexp x1 x0 -> lam_comp x0 x2 (lam_id x0) = x2).
Axiom lam_comp_id_L : (forall x0 x1 x2, x2 :e setexp x1 x0 -> lam_comp x0 (lam_id x1) x2 = x2).
Axiom missingprop_1ed38896bfc54bf06ebfdf4c1203efc09707d065530eefdfbe6f0a87b8e29dd3 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 x13 : set -> set, (forall x14, x0 x14 -> x7 (x8 x14) (x8 (x10 (x8 x14))) (x8 x14) (x13 (x8 x14)) (x9 x14 (x10 (x8 x14)) (x12 x14)) = x6 (x8 x14)) -> (forall x14, x4 x14 -> x3 (x10 x14) (x10 (x8 (x10 x14))) (x10 x14) (x11 (x8 (x10 x14)) x14 (x13 x14)) (x12 (x10 x14)) = x2 (x10 x14)) -> MetaAdjunction x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13).
(* Parameter unpack_p_o "4b92ca0383b3989d01ddc4ec8bdf940b54163f9a29e460dfd502939eb880162f" "30f11fc88aca72af37fd2a4235aa22f28a552bbc44f1fb01f4edf7f2b7e376ac" *)
Parameter unpack_p_o : set -> (set -> (set -> prop) -> prop) -> prop.
Definition PtdPred : set -> prop :=
 (fun x0 : set => and (struct_p x0) (unpack_p_o x0 (fun x1 : set => fun x2 : set -> prop => forall x3 : prop, (forall x4, and (x4 :e x1) (x2 x4) -> x3) -> x3))).
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Axiom unpack_p_o_eq : (forall x0 : set -> (set -> prop) -> prop, forall x1, forall x2 : set -> prop, (forall x3 : set -> prop, (forall x4, x4 :e x1 -> iff (x2 x4) (x3 x4)) -> x0 x1 x3 = x0 x1 x2) -> unpack_p_o (pack_p x1 x2) x0 = x0 x1 x2).
Axiom missingprop_f74def15ebcd798c28df1e61a6def4cb18bc6a8807c08bb7cae966345d85be99 : MetaCat PtdPred UnaryPredHom struct_id struct_comp.
Axiom missingprop_996d2ca5294d954837ab194fae84867f90f5006f06aab9f6fe20cb8048b5fc59 : MetaFunctor PtdPred UnaryPredHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom In_1_2 : 1 :e 2.
Axiom In_0_2 : 0 :e 2.
Axiom missingprop_6482952e7e0a4bf00d28fb92ecd380f707bb40e0d65cb44f18a4b021cf4cfdbf : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p (fun x4 : set => True) HomSet (fun x4 : set => lam x4 (fun x5 : set => x5)) (fun x4 x5 x6 x7 x8 : set => lam x4 (fun x9 : set => ap x7 (ap x8 x9))) x1 x3 -> x2) -> x2) -> x0) -> x0).
(* Parameter pack_e "faab5f334ba3328f24def7e6fcb974000058847411a2eb0618014eca864e537f" "dd8f2d332fef3b4d27898ab88fa5ddad0462180c8d64536ce201f5a9394f40dd" *)
Parameter pack_e : set -> set -> set.
Definition struct_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2 x3, x3 :e x2 -> x1 (pack_e x2 x3)) -> x1 x0).
(* Parameter PtdSetHom "e62fb376978eab6f3a437ccbcbf7db7e720c6d825a9ac34a47cc1290a4483e8a" "d6f688b87f520e20f883436520c684182d8140f8ad0fdc595e075122f758500e" *)
Parameter PtdSetHom : set -> set -> set -> prop.
(* Parameter unpack_e_i "933a1383079fba002694718ec8040dc85a8cca2bd54c5066c99fff135594ad7c" "91fff70be2f95d6e5e3fe9071cbd57d006bdee7d805b0049eefb19947909cc4e" *)
Parameter unpack_e_i : set -> (set -> set -> set) -> set.
Axiom unpack_e_i_eq : (forall x0 : set -> set -> set, forall x1 x2, forall x3 : set -> set -> prop, x3 (unpack_e_i (pack_e x1 x2) x0) (x0 x1 x2) -> x3 (x0 x1 x2) (unpack_e_i (pack_e x1 x2) x0)).
Axiom missingprop_266cf3934e79ff708b43f6101066886a004a8b2cb57b38750ae943dbc174c7c9 : (forall x0 x1 x2 x3 x4, forall x5 : prop -> prop -> prop, x5 (PtdSetHom (pack_e x0 x2) (pack_e x1 x3) x4) (and (x4 :e setexp x1 x0) (ap x4 x2 = x3)) -> x5 (and (x4 :e setexp x1 x0) (ap x4 x2 = x3)) (PtdSetHom (pack_e x0 x2) (pack_e x1 x3) x4)).
Axiom pack_e_0_eq2 : (forall x0 x1, forall x2 : set -> set -> prop, x2 x0 (ap (pack_e x0 x1) 0) -> x2 (ap (pack_e x0 x1) 0) x0).
(* Parameter pack_r "39d80099e1b48aed4548f424ae4f1ff25b2d595828aff4b3a5abe232ca0348b5" "217a7f92acc207b15961c90039aa929f0bd5d9212f66ce5595c3af1dd8b9737e" *)
Parameter pack_r : set -> (set -> set -> prop) -> set.
Definition struct_r : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, x1 (pack_r x2 x3)) -> x1 x0).
(* Parameter BinRelnHom "352304ebb6c77dbc4e2a952e767857a98538e43de1c35fb4bcd6c99fca02ae7e" "acf0f04c6a55a143e3ed8404c0fa6b09b323d938c83532f081b47091e31c4eb3" *)
Parameter BinRelnHom : set -> set -> set -> prop.
Axiom missingprop_c743d500597c886f8c9f734201e1e33c3ed6306ca10b5ca232711b87a9244d05 : MetaCat struct_r BinRelnHom struct_id struct_comp.
Axiom missingprop_697cf9d22958b9b03cfc87a57f8b554e5a1d18a1d07ae9d28ec5fd399c76edb1 : MetaFunctor struct_r BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Axiom pack_struct_r_I : (forall x0, forall x1 : set -> set -> prop, struct_r (pack_r x0 x1)).
Axiom missingprop_4e486761c3790f4990f398ce8c16ea7ac5915924a294f8e5b06e45030e68e983 : (forall x0 x1, forall x2 x3 : set -> set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4)).
Axiom pack_r_0_eq2 : (forall x0, forall x1 x2 : set -> set -> prop, x2 x0 (ap (pack_r x0 x1) 0) -> x2 (ap (pack_r x0 x1) 0) x0).
(* Parameter unpack_r_o "8d2ef9c9e522891d1fe605a62dffeab8aefb6325650e4eab14135e7eee8002c5" "e3e6af0984cda0a02912e4f3e09614b67fc0167c625954f0ead4110f52ede086" *)
Parameter unpack_r_o : set -> (set -> (set -> set -> prop) -> prop) -> prop.
Definition PER : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom unpack_r_o_eq : (forall x0 : set -> (set -> set -> prop) -> prop, forall x1, forall x2 : set -> set -> prop, (forall x3 : set -> set -> prop, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> iff (x2 x4 x5) (x3 x4 x5))) -> x0 x1 x3 = x0 x1 x2) -> unpack_r_o (pack_r x1 x2) x0 = x0 x1 x2).
Axiom missingprop_a9109a2e2c7b58d168a345c3d559fa6cefbb8aaf51b02c98b368d0383e86b3cc : MetaCat PER BinRelnHom struct_id struct_comp.
Axiom missingprop_fc754cc25772f9312446186f16acac038bb691c1d0e64a70b198917a8c8a09d8 : MetaFunctor PER BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Definition EquivReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (and (forall x3, x3 :e x1 -> x2 x3 x3) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom missingprop_9b87477ddae5e1dddee7ca772cf97e36225e0c4d6c64a3a14907f878e8629023 : MetaCat EquivReln BinRelnHom struct_id struct_comp.
Axiom missingprop_8e8ae782537890ab679749dd806ea82b1da6b0d38dd2351f32fc18a7716be868 : MetaFunctor EquivReln BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Definition IrreflexiveTransitiveReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_3cfb35338d6b874e5c5bd0760253f7ac65e99ffc814bd52eef4adff85a56dbe0 : MetaCat IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp.
Axiom missingprop_347730a107ad01e8eb1d3a56a2f2876fd9ba740226ba5733aa92ff38dc78556e : MetaFunctor IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Definition IrreflexiveSymmetricReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))))).
Axiom missingprop_53ea818e2021d87ac705f8683274896fc426e94dc27b29259138e0d21bd2ebcf : MetaCat IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp.
Axiom missingprop_6c92db6e8cc20b6a909a603bcecb2d4d3d7f943212ea87182e49707d9b14f672 : MetaFunctor IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
(* Parameter pack_c "545700730c93ce350b761ead914d98adf2edbd5c9f253d9a6df972641fee3aed" "cd75b74e4a07d881da0b0eda458a004806ed5c24b08fd3fef0f43e91f64c4633" *)
Parameter pack_c : set -> ((set -> prop) -> prop) -> set.
Definition struct_c : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : (set -> prop) -> prop, x1 (pack_c x2 x3)) -> x1 x0).
(* Parameter PreContinuousHom "c0f03c208aec64069e4148d3c2de0500d5aa1784cfb14b2ca8b0b012e330b7dd" "9dfc2adb8ff80515a79ba1b90379bbd0cea718993442413b2cb120bb9bf2d4fe" *)
Parameter PreContinuousHom : set -> set -> set -> prop.
Axiom missingprop_4f44ef23563f367d8f9eeba28ee18b03a0e102cb5b8461a180a26553b732c5dd : MetaCat struct_c PreContinuousHom struct_id struct_comp.
Axiom missingprop_f3e562025558e319014f28fceefea667a747c4b0cd56d445b6c465e3f15b630f : MetaFunctor struct_c PreContinuousHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Axiom pack_struct_c_I : (forall x0, forall x1 : (set -> prop) -> prop, struct_c (pack_c x0 x1)).
Axiom pack_c_0_eq2 : (forall x0, forall x1 : (set -> prop) -> prop, forall x2 : set -> set -> prop, x2 x0 (ap (pack_c x0 x1) 0) -> x2 (ap (pack_c x0 x1) 0) x0).
Axiom missingprop_147946d52b6747e7a3735111f3622ca84b157f241b7b107aab3bab9bb651af48 : (forall x0 x1, forall x2 x3 : (set -> prop) -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (PreContinuousHom (pack_c x0 x2) (pack_c x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6 : set -> prop, (forall x7, x6 x7 -> x7 :e x1) -> x3 x6 -> x2 (fun x7 : set => and (x7 :e x0) (x6 (ap x4 x7))))) -> x5 (and (x4 :e setexp x1 x0) (forall x6 : set -> prop, (forall x7, x6 x7 -> x7 :e x1) -> x3 x6 -> x2 (fun x7 : set => and (x7 :e x0) (x6 (ap x4 x7))))) (PreContinuousHom (pack_c x0 x2) (pack_c x1 x3) x4)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> or (x2 x3 x4) (x2 x4 x3)))) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_a4bb8825cdd8d49d4389d22179d1719a0b873e5d71045f76904774492ae46207 : (forall x0, forall x1 : set -> set -> prop, forall x2 : prop -> prop -> prop, x2 (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> or (x4 x5 x6) (x4 x6 x5)))) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7))))) (and (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> or (x1 x3 x4) (x1 x4 x3)))) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) -> x2 (and (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> or (x1 x3 x4) (x1 x4 x3)))) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> or (x4 x5 x6) (x4 x6 x5)))) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7)))))).
admit.
Qed.
Theorem missingprop_bbb555763e6e7f53b06b19e95753422afe722fa972cbf31421a5a3f727a41285 : (forall x0, forall x1 : set -> set -> prop, x0 = 0 -> missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 (pack_r x0 x1)).
admit.
Qed.
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Theorem missingprop_2dc9e26456bb41cf29ae85d63c3e8887dbdb5a0601149d8bd58cb1df95ffb8a5 : (forall x0, missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, x2 = 0 -> x1 (pack_r x2 x3)) -> x1 x0)).
admit.
Qed.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Axiom lamE : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, and (x6 :e x1 x4) (x2 = setsum x4 x6) -> x5) -> x5) -> x3) -> x3)).
(* Parameter pair_p "dac986a57e8eb6cc7f35dc0ecc031b9ba0403416fabe2dbe130edd287a499231" "ade2bb455de320054265fc5dccac77731c4aa2464b054286194d634707d2e120" *)
Parameter pair_p : set -> prop.
Axiom PiI : (forall x0, forall x1 : set -> set, forall x2, (forall x3, x3 :e x2 -> and (pair_p x3) (ap x3 0 :e x0)) -> (forall x3, x3 :e x0 -> ap x2 x3 :e x1 x3) -> x2 :e Pi x0 x1).
Theorem missingprop_589446c7eb1e0f49f9a1c9ecf95332e51a36bcf398bd883c8295d2920f123b6b : (forall x0 x1 x2, missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x0 -> missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x1 -> BinRelnHom x0 x1 x2 = (x2 = 0)).
admit.
Qed.
Theorem missingprop_06330ad4577537b89d8bc7f3dd9af89eeb13201f8e7445ce2fcc61fa6af556c9 : (forall x0 x1 x2, missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x0 -> missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x1 -> x2 = 0 -> BinRelnHom x0 x1 x2).
admit.
Qed.
Theorem missingprop_db29be70f626d907819defaaafb0849de7b3b2be132ffdec2cf3d6bf6e7f756a : (forall x0 x1, missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x0 -> missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x1 -> BinRelnHom x0 x1 0).
admit.
Qed.
Theorem missingprop_71eb862dd9b92fca1b74f2ed11352ebfaddd1140461b48d95a30dd80b70e4e22 : (forall x0 x1 x2, missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x0 -> missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x1 -> BinRelnHom x0 x1 x2 -> x2 = 0).
admit.
Qed.
Theorem missingprop_5736344b7d284a9649eb6faf34b80cb36768415f9f81d6299bc87373d889656d : (forall x0 x1 x2 x3, missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x0 -> missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x1 -> BinRelnHom x0 x1 x2 -> BinRelnHom x0 x1 x3 -> x2 = x3).
admit.
Qed.
Theorem missingprop_765d413c5d1a8be896fb2d38fda75f9803185335550bf0cbde813c254ddda463 : (forall x0 x1 x2 x3 x4, missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 x0 -> struct_comp x0 x1 x2 x3 x4 = 0).
admit.
Qed.
Theorem missingprop_368e92f67c0383aee9043344ceeddddb8cd4a69474da241bb811d114c3a8b2be : missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 (pack_r 0 (fun x0 x1 : set => False)).
admit.
Qed.
Theorem missingprop_db4d4d2dce6d1759ae97ec7294283ede59556dc462544894abce8c7cebac50c8 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_514665144b987ef3e2c35b4201554137120b3d6854f649ddac3441af9b8a3362 : MetaCat_terminal_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp (pack_r 0 (fun x0 x1 : set => False)) (fun x0 : set => 0).
admit.
Qed.
Theorem missingprop_36fa7646c22d164a501937d51e7038469e5f9388e634cea48bc990fe78430ade : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_coproduct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x4 x6 x7)) (Hom x5 x6 x8)) (forall x10, Obj x10 -> (forall x11 x12, Hom x4 x10 x11 -> Hom x5 x10 x12 -> and (and (and (Hom x6 x10 (x9 x10 x11 x12)) (Comp x4 x6 x10 (x9 x10 x11 x12) x7 = x11)) (Comp x5 x6 x10 (x9 x10 x11 x12) x8 = x12)) (forall x13, Hom x6 x10 x13 -> Comp x4 x6 x10 x13 x7 = x11 -> Comp x5 x6 x10 x13 x8 = x12 -> x13 = x9 x10 x11 x12)))).
Definition MetaCat_coproduct_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => forall x8 x9, Obj x8 -> Obj x9 -> MetaCat_coproduct_p Obj Hom Id Comp x8 x9 (x4 x8 x9) (x5 x8 x9) (x6 x8 x9) (x7 x8 x9)).
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Theorem missingprop_cc32407ae1faf05974a956744abef80cf58ecbb903f70dc288c52477d3040d3e : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_product_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x6 x4 x7)) (Hom x6 x5 x8)) (forall x10, Obj x10 -> (forall x11 x12, Hom x10 x4 x11 -> Hom x10 x5 x12 -> and (and (and (Hom x10 x6 (x9 x10 x11 x12)) (Comp x10 x6 x4 x7 (x9 x10 x11 x12) = x11)) (Comp x10 x6 x5 x8 (x9 x10 x11 x12) = x12)) (forall x13, Hom x10 x6 x13 -> Comp x10 x6 x4 x7 x13 = x11 -> Comp x10 x6 x5 x8 x13 = x12 -> x13 = x9 x10 x11 x12)))).
Definition MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => forall x8 x9, Obj x8 -> Obj x9 -> MetaCat_product_p Obj Hom Id Comp x8 x9 (x4 x8 x9) (x5 x8 x9) (x6 x8 x9) (x7 x8 x9)).
Theorem missingprop_bab06722b95d9bfeb5f47bd12c980207aa4ecb908298635ec81d8f167d979164 : MetaCat_product_constr_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp (fun x0 x1 : set => pack_r 0 (fun x2 x3 : set => False)) (fun x0 x1 : set => 0) (fun x0 x1 : set => 0) (fun x0 x1 x2 x3 x4 : set => 0).
admit.
Qed.
Theorem missingprop_e6c1f21e5255ef4e9844242f83793f26af05251eb9abaabe54a1d352d3738314 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_coequalizer_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 : set => fun x10 : set -> set -> set => and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (Hom x4 x5 x7)) (Obj x8)) (Hom x5 x8 x9)) (Comp x4 x5 x8 x9 x6 = Comp x4 x5 x8 x9 x7)) (forall x11, Obj x11 -> (forall x12, Hom x5 x11 x12 -> Comp x4 x5 x11 x12 x6 = Comp x4 x5 x11 x12 x7 -> and (and (Hom x8 x11 (x10 x11 x12)) (Comp x5 x8 x11 (x10 x11 x12) x9 = x12)) (forall x13, Hom x8 x11 x13 -> Comp x5 x8 x11 x13 x9 = x12 -> x13 = x10 x11 x12)))).
Definition MetaCat_coequalizer_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 : set -> set -> set -> set -> set => fun x6 : set -> set -> set -> set -> set -> set -> set => forall x7 x8, Obj x7 -> Obj x8 -> (forall x9 x10, Hom x7 x8 x9 -> Hom x7 x8 x10 -> MetaCat_coequalizer_p Obj Hom Id Comp x7 x8 x9 x10 (x4 x7 x8 x9 x10) (x5 x7 x8 x9 x10) (x6 x7 x8 x9 x10))).
Axiom missingprop_9981628fee84bcf70587ffb7933bd9c35042a1a594a2ae21c28e38ea11e09d6a : (forall x0 x1 x2 x3 x4 x5 x6 x7 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7).
Theorem missingprop_95501749e113a54b366920da4b3e3d29a5af64d38c27e9e8bae09c987949db22 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_struct_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_equalizer_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 : set => fun x10 : set -> set -> set => and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (Hom x4 x5 x7)) (Obj x8)) (Hom x8 x4 x9)) (Comp x8 x4 x5 x6 x9 = Comp x8 x4 x5 x7 x9)) (forall x11, Obj x11 -> (forall x12, Hom x11 x4 x12 -> Comp x11 x4 x5 x6 x12 = Comp x11 x4 x5 x7 x12 -> and (and (Hom x11 x8 (x10 x11 x12)) (Comp x11 x8 x4 x9 (x10 x11 x12) = x12)) (forall x13, Hom x11 x8 x13 -> Comp x11 x8 x4 x9 x13 = x12 -> x13 = x10 x11 x12)))).
Definition MetaCat_equalizer_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 : set -> set -> set -> set -> set => fun x6 : set -> set -> set -> set -> set -> set -> set => forall x7 x8, Obj x7 -> Obj x8 -> (forall x9 x10, Hom x7 x8 x9 -> Hom x7 x8 x10 -> MetaCat_equalizer_p Obj Hom Id Comp x7 x8 x9 x10 (x4 x7 x8 x9 x10) (x5 x7 x8 x9 x10) (x6 x7 x8 x9 x10))).
Theorem missingprop_c3148827bf6d90c5ca1fde988e16f9ef4d41b8278c635d669d0eba6ece522710 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_pushout_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 x10 x11 : set => fun x12 : set -> set -> set -> set => and (and (and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x6 x4 x7)) (Hom x6 x5 x8)) (Obj x9)) (Hom x4 x9 x10)) (Hom x5 x9 x11)) (Comp x6 x4 x9 x10 x7 = Comp x6 x5 x9 x11 x8)) (forall x13, Obj x13 -> (forall x14, Hom x4 x13 x14 -> (forall x15, Hom x5 x13 x15 -> Comp x6 x4 x13 x14 x7 = Comp x6 x5 x13 x15 x8 -> and (and (and (Hom x9 x13 (x12 x13 x14 x15)) (Comp x4 x9 x13 (x12 x13 x14 x15) x10 = x14)) (Comp x5 x9 x13 (x12 x13 x14 x15) x11 = x15)) (forall x16, Hom x9 x13 x16 -> Comp x4 x9 x13 x16 x10 = x14 -> Comp x5 x9 x13 x16 x11 = x15 -> x16 = x12 x13 x14 x15))))).
Definition MetaCat_pushout_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set -> set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set -> set -> set -> set => forall x8 x9 x10, Obj x8 -> Obj x9 -> Obj x10 -> (forall x11 x12, Hom x10 x8 x11 -> Hom x10 x9 x12 -> MetaCat_pushout_p Obj Hom Id Comp x8 x9 x10 x11 x12 (x4 x8 x9 x10 x11 x12) (x5 x8 x9 x10 x11 x12) (x6 x8 x9 x10 x11 x12) (x7 x8 x9 x10 x11 x12))).
Axiom missingprop_d818050ba2f8af7e5df3c2818d15e1b858ad10296faac92a7847146e94c87036 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> x9 -> and (and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8) x9).
Theorem missingprop_a62226778b5438561e2d01d2073dd559ace25afd3e155564b0d4ed2664a45748 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_constr_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_pullback_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 x10 x11 : set => fun x12 : set -> set -> set -> set => and (and (and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x4 x6 x7)) (Hom x5 x6 x8)) (Obj x9)) (Hom x9 x4 x10)) (Hom x9 x5 x11)) (Comp x9 x4 x6 x7 x10 = Comp x9 x5 x6 x8 x11)) (forall x13, Obj x13 -> (forall x14, Hom x13 x4 x14 -> (forall x15, Hom x13 x5 x15 -> Comp x13 x4 x6 x7 x14 = Comp x13 x5 x6 x8 x15 -> and (and (and (Hom x13 x9 (x12 x13 x14 x15)) (Comp x13 x9 x4 x10 (x12 x13 x14 x15) = x14)) (Comp x13 x9 x5 x11 (x12 x13 x14 x15) = x15)) (forall x16, Hom x13 x9 x16 -> Comp x13 x9 x4 x10 x16 = x14 -> Comp x13 x9 x5 x11 x16 = x15 -> x16 = x12 x13 x14 x15))))).
Definition MetaCat_pullback_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set -> set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set -> set -> set -> set => forall x8 x9 x10, Obj x8 -> Obj x9 -> Obj x10 -> (forall x11 x12, Hom x8 x10 x11 -> Hom x9 x10 x12 -> MetaCat_pullback_p Obj Hom Id Comp x8 x9 x10 x11 x12 (x4 x8 x9 x10 x11 x12) (x5 x8 x9 x10 x11 x12) (x6 x8 x9 x10 x11 x12) (x7 x8 x9 x10 x11 x12))).
Theorem missingprop_8a70de1f604080787d5554c6e77155c728adfb4cc2fcf3629a3ef386ea84a59c : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_exp_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 x10 x11 : set => fun x12 : set -> set -> set => and (and (and (and (Obj x8) (Obj x9)) (Obj x10)) (Hom (x4 x10 x8) x9 x11)) (forall x13, Obj x13 -> (forall x14, Hom (x4 x13 x8) x9 x14 -> and (and (Hom x13 x10 (x12 x13 x14)) (Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 (x12 x13 x14) (x5 x13 x8)) (x6 x13 x8)) = x14)) (forall x15, Hom x13 x10 x15 -> Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 x15 (x5 x13 x8)) (x6 x13 x8)) = x14 -> x15 = x12 x13 x14)))).
Definition MetaCat_exp_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> set -> set -> set => and (MetaCat_product_constr_p Obj Hom Id Comp x4 x5 x6 x7) (forall x11 x12, Obj x11 -> Obj x12 -> MetaCat_exp_p Obj Hom Id Comp x4 x5 x6 x7 x11 x12 (x8 x11 x12) (x9 x11 x12) (x10 x11 x12))).
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Theorem missingprop_3db465a5c3b0e9a163fcd3ba29e50276d3dd929fe814327b4046f574be9d5d46 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_monic_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set => and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (forall x7, Obj x7 -> (forall x8 x9, Hom x7 x4 x8 -> Hom x7 x4 x9 -> Comp x7 x4 x5 x6 x8 = Comp x7 x4 x5 x6 x9 -> x8 = x9))).
Definition MetaCat_subobject_classifier_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> (set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => fun x6 x7 : set => fun x8 : set -> set -> set -> set => fun x9 : set -> set -> set -> set -> set -> set -> set => and (and (and (MetaCat_terminal_p Obj Hom Id Comp x4 x5) (Obj x6)) (Hom x4 x6 x7)) (forall x10 x11 x12, MetaCat_monic_p Obj Hom Id Comp x10 x11 x12 -> and (Hom x11 x6 (x8 x10 x11 x12)) (MetaCat_pullback_p Obj Hom Id Comp x4 x11 x6 x7 (x8 x10 x11 x12) x10 (x5 x10) x12 (x9 x10 x11 x12)))).
Theorem missingprop_0443f590114bcde508ddc1395cbc3aac29bc389873beee511afff606655cd830 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition MetaCat_nno_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => fun x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (MetaCat_terminal_p Obj Hom Id Comp x4 x5) (Obj x6)) (Hom x4 x6 x7)) (Hom x6 x6 x8)) (forall x10 x11 x12, Obj x10 -> Hom x4 x10 x11 -> Hom x10 x10 x12 -> and (and (and (Hom x6 x10 (x9 x10 x11 x12)) (Comp x4 x6 x10 (x9 x10 x11 x12) x7 = x11)) (Comp x6 x6 x10 (x9 x10 x11 x12) x8 = Comp x6 x10 x10 x12 (x9 x10 x11 x12))) (forall x13, Hom x6 x10 x13 -> Comp x4 x6 x10 x13 x7 = x11 -> Comp x6 x6 x10 x13 x8 = Comp x6 x10 x10 x12 x13 -> x13 = x9 x10 x11 x12))).
Theorem missingprop_33e3468a66323a6ad6dbabc7ac0c50d0a564d1e002d7422f5a5f4bcf510b13fc : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_91e835cd99806e5af620a2f5b97b78765bbfc165bd5db14ca609bcdb90b1a9ef : not (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) missingname_8d0d9cf1964756488df42d4d5626c938343caad15d945c8e45b8f2b2d2fdc383 BinRelnHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (and (and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> or (x2 x3 x4) (x2 x4 x3)))) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))) (forall x3 : set -> prop, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x5 x4 -> x3 x5) -> x3 x4) -> (forall x4, x4 :e x1 -> x3 x4))))).
Theorem missingprop_34cda175c3cf01af70382673b777a4c5af85834006efe174637b2bbd21ba85af : (forall x0, forall x1 : set -> set -> prop, forall x2 : prop -> prop -> prop, x2 (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (and (and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> or (x4 x5 x6) (x4 x6 x5)))) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7)))) (forall x5 : set -> prop, (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x7 x6 -> x5 x7) -> x5 x6) -> (forall x6, x6 :e x3 -> x5 x6)))) (and (and (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> or (x1 x3 x4) (x1 x4 x3)))) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) (forall x3 : set -> prop, (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x5 x4 -> x3 x5) -> x3 x4) -> (forall x4, x4 :e x0 -> x3 x4))) -> x2 (and (and (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> or (x1 x3 x4) (x1 x4 x3)))) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) (forall x3 : set -> prop, (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x5 x4 -> x3 x5) -> x3 x4) -> (forall x4, x4 :e x0 -> x3 x4))) (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (and (and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> or (x4 x5 x6) (x4 x6 x5)))) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7)))) (forall x5 : set -> prop, (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x7 x6 -> x5 x7) -> x5 x6) -> (forall x6, x6 :e x3 -> x5 x6))))).
admit.
Qed.
Theorem missingprop_5bd83220fa1a732a5a08e517e2096e36b8a60317f6909c1ebfda1fc376a58a90 : (forall x0, forall x1 : set -> set -> prop, x0 = 0 -> missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb (pack_r x0 x1)).
admit.
Qed.
Theorem missingprop_e4a7e3420545a36b478dd0d69a54fa8f902e5ce6dd8d02edf43f0567b77d93e7 : (forall x0, missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, x2 = 0 -> x1 (pack_r x2 x3)) -> x1 x0)).
admit.
Qed.
Theorem missingprop_0f872579da7879e9b32e4dbae6096b7cb722a0eb30e05326e317c49ae84fb9cd : (forall x0 x1 x2, missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x0 -> missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x1 -> BinRelnHom x0 x1 x2 = (x2 = 0)).
admit.
Qed.
Theorem missingprop_a83a343bd1c37cfcde9bf6877db624d30932834f3356dee8d1e1d14154bec4cf : (forall x0 x1 x2, missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x0 -> missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x1 -> x2 = 0 -> BinRelnHom x0 x1 x2).
admit.
Qed.
Theorem missingprop_5d29dee76dbe631c3e61c3da6506dfaf505efc5a4aa6bec582f8fe5c402e18fa : (forall x0 x1, missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x0 -> missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x1 -> BinRelnHom x0 x1 0).
admit.
Qed.
Theorem missingprop_72cb3020b94231425440e4e0abda48b7be66a643aed78169e1ad7d7b0bb32aa3 : (forall x0 x1 x2, missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x0 -> missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x1 -> BinRelnHom x0 x1 x2 -> x2 = 0).
admit.
Qed.
Theorem missingprop_c951e728dd8eb4a598d328309cb80eceb171255c706467a30b67ec63a10511c4 : (forall x0 x1 x2 x3, missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x0 -> missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x1 -> BinRelnHom x0 x1 x2 -> BinRelnHom x0 x1 x3 -> x2 = x3).
admit.
Qed.
Theorem missingprop_855630a9ca3bf83255aeb46420d3f193d0ec4f94e0114bb36269b45f3f5768aa : (forall x0 x1 x2 x3 x4, missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb x0 -> struct_comp x0 x1 x2 x3 x4 = 0).
admit.
Qed.
Theorem missingprop_4ed7a81e7da08b24cbf091182aaff18f08045d39edd0aa7cc41b5f7440278cb1 : missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb (pack_r 0 (fun x0 x1 : set => False)).
admit.
Qed.
Theorem missingprop_6b40b84e42c95a266c6d65f4a814833b54e6c056f016aac874ccb1bd8842f984 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_5bb34f24f2cd19372c7320ae989b74f2bde5b45cd80a2a08b7da9db21d137956 : MetaCat_terminal_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp (pack_r 0 (fun x0 x1 : set => False)) (fun x0 : set => 0).
admit.
Qed.
Theorem missingprop_7e884229d4b6222265af2823c7acd697bad4881db9c8f35b228689cbf2e70fce : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_70ffe18298cb5c5a81b8c9bb44dce739a1e2cd1b3deb740398358e0a837e1091 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_019eb3b7cc5b1d8119b16df5b31478f2fc6984523484e01d24620556dcd20e19 : MetaCat_product_constr_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp (fun x0 x1 : set => pack_r 0 (fun x2 x3 : set => False)) (fun x0 x1 : set => 0) (fun x0 x1 : set => 0) (fun x0 x1 x2 x3 x4 : set => 0).
admit.
Qed.
Theorem missingprop_088808a15920a0f23f54230a23f067deff84d0470d4d96799fc2a69c67edecfb : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_3692d7857c5734bb1d674f6f9e994768d0140df20b2b810be65eeb944d5e1cc5 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_struct_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_1016d0953b54aac1e18afc41fdf359709efad72e126face28100baeaa4024c55 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_c1d3dec2f57f5e790ac1ebf69ad7dd9db66c1b9f114b9e3e32feb0321da0b08a : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_constr_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_fced61edf15351e0a585dc9882c6f4aa6560d38b3936ff84af787d7d71420546 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_44f22525131436d3e36e1bb15724fb0a6a8b56cdca8dc007f45a0fcd1b12700c : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_7fa73e305d9acf03e627eddefdc62e766b87af99d38e4ffa79446b160075a391 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_75815b34747fc9944c3cb3261049a0fbdffd63b4cd7a5add8a26916944fba578 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_6cc20fc99d815403eb32cacd28e454a2701d98e94667a42ff62feaab19d32429 : not (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) missingname_db327cd543066326bb45dc67bfcc985dc294b4385263e93b2af4265149541ffb BinRelnHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
