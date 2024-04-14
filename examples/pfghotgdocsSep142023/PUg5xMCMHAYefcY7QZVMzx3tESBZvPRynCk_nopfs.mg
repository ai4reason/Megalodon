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
Theorem missingprop_9e4a4e86d499216c8785bdcb6ea98c9ec4aee7ee82bde465e88bf0a451f2bef0 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 x13 : set -> set, MetaAdjunction_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 -> (forall x14, forall x15 : set -> set, MetaCat_initial_p x0 x1 x2 x3 x14 x15 -> (forall x16 : prop, (forall x17 : set -> set, MetaCat_initial_p x4 x5 x6 x7 (x8 x14) x17 -> x16) -> x16))).
admit.
Qed.
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
Theorem missingprop_8c45f43b3a7c6d3767ad083957f82b64589c49473de42219d5fda89b0e8df666 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p struct_p UnaryPredHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
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
Theorem missingprop_4a7569130b0744627293f75f7a4be4d4d3b60645f0dd8b29a371a1704336b96b : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p struct_p UnaryPredHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_712520f713b96d5afd10321cea9a3c978868fc53aa35a29461e902d5b5a4ba79 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 x13 : set -> set, MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor x4 x5 x6 x7 x0 x1 x2 x3 x10 x11 -> MetaNatTrans x0 x1 x2 x3 x0 x1 x2 x3 (fun x14 : set => x14) (fun x14 x15 x16 : set => x16) (fun x14 : set => x10 (x8 x14)) (fun x14 x15 x16 : set => x11 (x8 x14) (x8 x15) (x9 x14 x15 x16)) x12 -> MetaNatTrans x4 x5 x6 x7 x4 x5 x6 x7 (fun x14 : set => x8 (x10 x14)) (fun x14 x15 x16 : set => x9 (x10 x14) (x10 x15) (x11 x14 x15 x16)) (fun x14 : set => x14) (fun x14 x15 x16 : set => x16) x13 -> MetaAdjunction x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 -> MetaAdjunction_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13).
Axiom missingprop_3d05796578cdc17ebd2096167db48ecef934256d250d1637eb5dd67225cdfe05 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> MetaCat x4 x5 x6 x7 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9).
Axiom missingprop_dcf5739aa5fe0adc626fd983737b233fe68652dff14c53b3d75823dcf2542d41 : MetaCat (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
Axiom missingprop_795e291855a044d4d636c961caa1600704603cc02e33a7b37aa66e8d7f6512db : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, (forall x10, x0 x10 -> x4 (x8 x10)) -> (forall x10 x11 x12, x0 x10 -> x0 x11 -> x1 x10 x11 x12 -> x5 (x8 x10) (x8 x11) (x9 x10 x11 x12)) -> (forall x10, x0 x10 -> x9 x10 x10 (x2 x10) = x6 (x8 x10)) -> (forall x10 x11 x12 x13 x14, x0 x10 -> x0 x11 -> x0 x12 -> x1 x10 x11 x13 -> x1 x11 x12 x14 -> x9 x10 x12 (x3 x10 x11 x12 x14 x13) = x7 (x8 x10) (x8 x11) (x8 x12) (x9 x11 x12 x14) (x9 x10 x11 x13)) -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9).
Axiom missingprop_8286b81a8fdd3c2d94c8171b33b1d824cef15a2de614f485e1ddaf3274d514b3 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 : set -> set, (forall x13, x0 x13 -> x5 (x8 x13) (x10 x13) (x12 x13)) -> (forall x13 x14 x15, x0 x13 -> x0 x14 -> x1 x13 x14 x15 -> x7 (x8 x13) (x10 x13) (x10 x14) (x11 x13 x14 x15) (x12 x13) = x7 (x8 x13) (x8 x14) (x10 x14) (x12 x14) (x9 x13 x14 x15)) -> MetaNatTrans x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12).
Axiom lam_id_exp_In : (forall x0, lam_id x0 :e setexp x0 x0).
Axiom lam_comp_id_R : (forall x0 x1 x2, x2 :e setexp x1 x0 -> lam_comp x0 x2 (lam_id x0) = x2).
Axiom lam_comp_id_L : (forall x0 x1 x2, x2 :e setexp x1 x0 -> lam_comp x0 (lam_id x1) x2 = x2).
Axiom missingprop_1ed38896bfc54bf06ebfdf4c1203efc09707d065530eefdfbe6f0a87b8e29dd3 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 x13 : set -> set, (forall x14, x0 x14 -> x7 (x8 x14) (x8 (x10 (x8 x14))) (x8 x14) (x13 (x8 x14)) (x9 x14 (x10 (x8 x14)) (x12 x14)) = x6 (x8 x14)) -> (forall x14, x4 x14 -> x3 (x10 x14) (x10 (x8 (x10 x14))) (x10 x14) (x11 (x8 (x10 x14)) x14 (x13 x14)) (x12 (x10 x14)) = x2 (x10 x14)) -> MetaAdjunction x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13).
Theorem missingprop_86c8a5ee3ff64efbac34e70abe3bae486327adbbc648267452411b3e936eed0a : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) struct_p UnaryPredHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_p_o "4b92ca0383b3989d01ddc4ec8bdf940b54163f9a29e460dfd502939eb880162f" "30f11fc88aca72af37fd2a4235aa22f28a552bbc44f1fb01f4edf7f2b7e376ac" *)
Parameter unpack_p_o : set -> (set -> (set -> prop) -> prop) -> prop.
Definition PtdPred : set -> prop :=
 (fun x0 : set => and (struct_p x0) (unpack_p_o x0 (fun x1 : set => fun x2 : set -> prop => forall x3 : prop, (forall x4, and (x4 :e x1) (x2 x4) -> x3) -> x3))).
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Theorem missingprop_b2592fa24ced3d84e007e876699c34520860460028b2dc9144c228a16f98ce34 : (forall x0, forall x1 x2 : set -> prop, (forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)) -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5) -> x4) -> x4) = (forall x4 : prop, (forall x5, and (x5 :e x0) (x1 x5) -> x4) -> x4)).
admit.
Qed.
Axiom unpack_p_o_eq : (forall x0 : set -> (set -> prop) -> prop, forall x1, forall x2 : set -> prop, (forall x3 : set -> prop, (forall x4, x4 :e x1 -> iff (x2 x4) (x3 x4)) -> x0 x1 x3 = x0 x1 x2) -> unpack_p_o (pack_p x1 x2) x0 = x0 x1 x2).
Theorem missingprop_2576d2815b46016e5e13a9989b4e9789629d83c56ed1c92a4cda0de077a20752 : (forall x0, forall x1 : set -> prop, (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 x3) -> x2) -> x2) -> PtdPred (pack_p x0 x1)).
admit.
Qed.
Theorem missingprop_c86200a2eefb0ff844f50b29d5cbeaa2ee14856a2db63542bcbf63218f0d0f1e : (forall x0, PtdPred x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> prop, forall x4, x4 :e x2 -> x3 x4 -> x1 (pack_p x2 x3)) -> x1 x0)).
admit.
Qed.
Axiom missingprop_f74def15ebcd798c28df1e61a6def4cb18bc6a8807c08bb7cae966345d85be99 : MetaCat PtdPred UnaryPredHom struct_id struct_comp.
Axiom missingprop_996d2ca5294d954837ab194fae84867f90f5006f06aab9f6fe20cb8048b5fc59 : MetaFunctor PtdPred UnaryPredHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom In_1_2 : 1 :e 2.
Axiom In_0_2 : 0 :e 2.
Theorem missingprop_e7d0e73f0fd8df389090892f84b60355df0c321c30ea4583f35d20a9812c638b : not (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_6482952e7e0a4bf00d28fb92ecd380f707bb40e0d65cb44f18a4b021cf4cfdbf : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p (fun x4 : set => True) HomSet (fun x4 : set => lam x4 (fun x5 : set => x5)) (fun x4 x5 x6 x7 x8 : set => lam x4 (fun x9 : set => ap x7 (ap x8 x9))) x1 x3 -> x2) -> x2) -> x0) -> x0).
Theorem missingprop_c5a999af56def26985ee6c8f5d63ad45cd6c5603d193ea71daabe34c06c77a89 : not (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) PtdPred UnaryPredHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_a3d382262eeb653576a38b7d912965ec2c8fd2bbaf6c9b264618fda7094a7065 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
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
Theorem missingprop_f195ff2e45aabd89fb68e8518cdfb24c43f7f52126b192f510cb60bcc74b7d0c : MetaFunctor struct_e PtdSetHom (fun x0 : set => lam_id (ap x0 0)) (fun x0 x1 x2 : set => lam_comp (ap x0 0)) PtdPred UnaryPredHom (fun x0 : set => lam_id (ap x0 0)) (fun x0 x1 x2 : set => lam_comp (ap x0 0)) (fun x0 : set => unpack_e_i x0 (fun x1 x2 : set => pack_p x1 (fun x3 : set => forall x4 : set -> set -> prop, x4 x3 x2 -> x4 x2 x3))) (fun x0 x1 x2 : set => x2).
admit.
Qed.
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
Theorem missingprop_78f3b6a11ab9c81e1f933ab88ad6bcedaa06a56cd69731bb115fccd12e154d32 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p struct_r BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom pack_r_0_eq2 : (forall x0, forall x1 x2 : set -> set -> prop, x2 x0 (ap (pack_r x0 x1) 0) -> x2 (ap (pack_r x0 x1) 0) x0).
Theorem missingprop_5b445e7a9baf6e3fa9adcd59c3ae3701d3970b698d8bc528633b268fd3a62c34 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p struct_r BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_cf23bcf6784ccd53b2df6cd22238a7069e0da26ca2ebabee7bb6106eab0d73ab : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) struct_r BinRelnHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_r_o "8d2ef9c9e522891d1fe605a62dffeab8aefb6325650e4eab14135e7eee8002c5" "e3e6af0984cda0a02912e4f3e09614b67fc0167c625954f0ead4110f52ede086" *)
Parameter unpack_r_o : set -> (set -> (set -> set -> prop) -> prop) -> prop.
Definition PER : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom unpack_r_o_eq : (forall x0 : set -> (set -> set -> prop) -> prop, forall x1, forall x2 : set -> set -> prop, (forall x3 : set -> set -> prop, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> iff (x2 x4 x5) (x3 x4 x5))) -> x0 x1 x3 = x0 x1 x2) -> unpack_r_o (pack_r x1 x2) x0 = x0 x1 x2).
Theorem missingprop_ed5f95f7ca609681b080d91be739054c14d15634788b7dc2197ab4853361212c : (forall x0, forall x1 : set -> set -> prop, forall x2 : prop -> prop -> prop, x2 (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 x6 -> x4 x6 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7))))) (and (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 -> x1 x4 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) -> x2 (and (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 -> x1 x4 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 x6 -> x4 x6 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7)))))).
admit.
Qed.
Theorem missingprop_b2515235786361aea7c15ac6711d5751cd13b11988163a3b347abdb56aff828a : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> PER (pack_r x0 x1)).
admit.
Qed.
Axiom missingprop_a9109a2e2c7b58d168a345c3d559fa6cefbb8aaf51b02c98b368d0383e86b3cc : MetaCat PER BinRelnHom struct_id struct_comp.
Axiom missingprop_fc754cc25772f9312446186f16acac038bb691c1d0e64a70b198917a8c8a09d8 : MetaFunctor PER BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Theorem missingprop_c1d3826129d2eb54a8f1e40a6116497a0cdb00a6ee455a0b01d56d09477d50d0 : (forall x0, PER x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
admit.
Qed.
Theorem missingprop_825c024351e602348dae6f40ff28b070795480db9f30ebf237f48128cca9e2a6 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p PER BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_94e18cb52d423f94309a6ab8f02355b6064c4d9b57f9bfdd278f2f76a10b4896 : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) PER BinRelnHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_5aca84658b2652447b6e489fe5484a2343b7bb63b468af9f03be1df8441506dc : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p PER BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition EquivReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (and (forall x3, x3 :e x1 -> x2 x3 x3) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem missingprop_f2fd2dc1110d448d4f07550eb7e519d4a54ff9bc8af712fc75384622bff0fff8 : (forall x0, forall x1 : set -> set -> prop, forall x2 : prop -> prop -> prop, x2 (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (and (forall x5, x5 :e x3 -> x4 x5 x5) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 x6 -> x4 x6 x5))) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7))))) (and (and (forall x3, x3 :e x0 -> x1 x3 x3) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 -> x1 x4 x3))) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) -> x2 (and (and (forall x3, x3 :e x0 -> x1 x3 x3) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 -> x1 x4 x3))) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (and (forall x5, x5 :e x3 -> x4 x5 x5) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 x6 -> x4 x6 x5))) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7)))))).
admit.
Qed.
Theorem missingprop_46185b99972d7cc500b0fcea77da3881e5aca4376b72d7aefbcc4420b07dadec : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> x1 x2 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> EquivReln (pack_r x0 x1)).
admit.
Qed.
Theorem missingprop_6402afcf89af96ded942e84b9859aeeef4ba7eaef1979737905398451311e541 : (forall x0, EquivReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> x3 x4 x4) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 -> x3 x5 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
admit.
Qed.
Axiom missingprop_9b87477ddae5e1dddee7ca772cf97e36225e0c4d6c64a3a14907f878e8629023 : MetaCat EquivReln BinRelnHom struct_id struct_comp.
Axiom missingprop_8e8ae782537890ab679749dd806ea82b1da6b0d38dd2351f32fc18a7716be868 : MetaFunctor EquivReln BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Theorem missingprop_ff2837e5a21fd4c4327dfde43a292fd546c59cc3bd0c11f9a8d7c9186b2d8f62 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p EquivReln BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_d9aa9b9eefe69fcb1547c6d0a72dc23fdc58939ecb48b57c7307edb196c6e653 : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) EquivReln BinRelnHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_34ae2ff7952570a6f619419ffbcf9953ee22f0892110279e3b5865c18adc0d82 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p EquivReln BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition IrreflexiveTransitiveReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Theorem missingprop_028e9e8080154ab4e6df84be4860eb47de3328414cd34f802ca99d48a462f1ba : (forall x0, forall x1 : set -> set -> prop, forall x2 : prop -> prop -> prop, x2 (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7))))) (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) -> x2 (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x1 x3 x4 -> x1 x4 x5 -> x1 x3 x5)))) (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> (forall x7, x7 :e x3 -> x4 x5 x6 -> x4 x6 x7 -> x4 x5 x7)))))).
admit.
Qed.
Theorem missingprop_dbb6377af3127d2bf8cd888143d856b4a86f0ec975822a440e0313d91ee07474 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> IrreflexiveTransitiveReln (pack_r x0 x1)).
admit.
Qed.
Theorem missingprop_2d7c7a9916fa2967cfb4d546f4e37c43b64368ed4a60618379328e066e9b7e0e : (forall x0, IrreflexiveTransitiveReln x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x2 -> not (x3 x4 x4)) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6))) -> x1 (pack_r x2 x3)) -> x1 x0)).
admit.
Qed.
Axiom missingprop_3cfb35338d6b874e5c5bd0760253f7ac65e99ffc814bd52eef4adff85a56dbe0 : MetaCat IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp.
Axiom missingprop_347730a107ad01e8eb1d3a56a2f2876fd9ba740226ba5733aa92ff38dc78556e : MetaFunctor IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Theorem missingprop_921e165a5e3021bc01faa484e5d01732ec57a2a635de505ac5d0e187102ef29b : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_7cfa54f8676a5efd1323e23237a5841c458a51c097238ff2662cebb913de88f0 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p IrreflexiveTransitiveReln BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition IrreflexiveSymmetricReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> not (x2 x3 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))))).
Theorem missingprop_ee6d5f0119c23d2d365410bede08f376d1ae2b56e8e57cf05f64e993f9b9e31e : (forall x0, forall x1 : set -> set -> prop, forall x2 : prop -> prop -> prop, x2 (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 x6 -> x4 x6 x5)))) (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 -> x1 x4 x3))) -> x2 (and (forall x3, x3 :e x0 -> not (x1 x3 x3)) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 -> x1 x4 x3))) (unpack_r_o (pack_r x0 x1) (fun x3 : set => fun x4 : set -> set -> prop => and (forall x5, x5 :e x3 -> not (x4 x5 x5)) (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 x6 -> x4 x6 x5))))).
admit.
Qed.
Theorem missingprop_d442b731cc8a623579f119dd4140f334acbb8f35c49c35a487654154f8239ef6 : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> not (x1 x2 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> IrreflexiveSymmetricReln (pack_r x0 x1)).
admit.
Qed.
Axiom missingprop_53ea818e2021d87ac705f8683274896fc426e94dc27b29259138e0d21bd2ebcf : MetaCat IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp.
Axiom missingprop_6c92db6e8cc20b6a909a603bcecb2d4d3d7f943212ea87182e49707d9b14f672 : MetaFunctor IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 0) (fun x0 x1 x2 : set => x2).
Theorem missingprop_682a6e3bfae66afd75fc5c265d954412aaafdb6e595d01de829deb4961a51590 : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_bedfaceb142b3da7b20954527ef42fee351f82e5258142f65c80cbbfc200f62d : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p IrreflexiveSymmetricReln BinRelnHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
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
Theorem missingprop_bbf6e8373c0a57bf49c84261ed513cc421f162478efb54623026296c21446b04 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p struct_c PreContinuousHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_07cb7203eb82c35f78d2b82ee060ddce4dfcc58a96a4d3b0ba23df65d398c4da : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) struct_c PreContinuousHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 0) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_1cdb7bf1ea3c8e4ec69418154a1f0d4f1afef9b07de2b580b7f32c4659477570 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p struct_c PreContinuousHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
