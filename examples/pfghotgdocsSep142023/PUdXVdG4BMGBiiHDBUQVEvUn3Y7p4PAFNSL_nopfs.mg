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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition MetaFunctor : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set -> prop => fun x5 : set -> set -> set -> prop => fun x6 : set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 : set -> set => fun x9 : set -> set -> set -> set => and (and (and (forall x10, Obj x10 -> x4 (x8 x10)) (forall x10 x11 x12, Obj x10 -> Obj x11 -> Hom x10 x11 x12 -> x5 (x8 x10) (x8 x11) (x9 x10 x11 x12))) (forall x10, Obj x10 -> x9 x10 x10 (Id x10) = x6 (x8 x10))) (forall x10 x11 x12 x13 x14, Obj x10 -> Obj x11 -> Obj x12 -> Hom x10 x11 x13 -> Hom x11 x12 x14 -> x9 x10 x12 (Comp x10 x11 x12 x14 x13) = x7 (x8 x10) (x8 x11) (x8 x12) (x9 x11 x12 x14) (x9 x10 x11 x13))).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Theorem missingprop_795e291855a044d4d636c961caa1600704603cc02e33a7b37aa66e8d7f6512db : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, (forall x10, x0 x10 -> x4 (x8 x10)) -> (forall x10 x11 x12, x0 x10 -> x0 x11 -> x1 x10 x11 x12 -> x5 (x8 x10) (x8 x11) (x9 x10 x11 x12)) -> (forall x10, x0 x10 -> x9 x10 x10 (x2 x10) = x6 (x8 x10)) -> (forall x10 x11 x12 x13 x14, x0 x10 -> x0 x11 -> x0 x12 -> x1 x10 x11 x13 -> x1 x11 x12 x14 -> x9 x10 x12 (x3 x10 x11 x12 x14 x13) = x7 (x8 x10) (x8 x11) (x8 x12) (x9 x11 x12 x14) (x9 x10 x11 x13)) -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9).
admit.
Qed.
Axiom and4E : (forall x0 x1 x2 x3 : prop, and (and (and x0 x1) x2) x3 -> (forall x4 : prop, (x0 -> x1 -> x2 -> x3 -> x4) -> x4)).
Theorem missingprop_d4b40e23fc0295f5b3315cbc1d218fe48d2b71569cbf77e67c33e2487a1d9a24 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> (forall x10 : prop, ((forall x11, x0 x11 -> x4 (x8 x11)) -> (forall x11 x12 x13, x0 x11 -> x0 x12 -> x1 x11 x12 x13 -> x5 (x8 x11) (x8 x12) (x9 x11 x12 x13)) -> (forall x11, x0 x11 -> x9 x11 x11 (x2 x11) = x6 (x8 x11)) -> (forall x11 x12 x13 x14 x15, x0 x11 -> x0 x12 -> x0 x13 -> x1 x11 x12 x14 -> x1 x12 x13 x15 -> x9 x11 x13 (x3 x11 x12 x13 x15 x14) = x7 (x8 x11) (x8 x12) (x8 x13) (x9 x12 x13 x15) (x9 x11 x12 x14)) -> x10) -> x10)).
admit.
Qed.
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Definition MetaFunctor_strict : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set -> prop => fun x5 : set -> set -> set -> prop => fun x6 : set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 : set -> set => fun x9 : set -> set -> set -> set => and (and (MetaCat Obj Hom Id Comp) (MetaCat x4 x5 x6 x7)) (MetaFunctor Obj Hom Id Comp x4 x5 x6 x7 x8 x9)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem missingprop_3d05796578cdc17ebd2096167db48ecef934256d250d1637eb5dd67225cdfe05 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> MetaCat x4 x5 x6 x7 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9).
admit.
Qed.
Axiom and3E : (forall x0 x1 x2 : prop, and (and x0 x1) x2 -> (forall x3 : prop, (x0 -> x1 -> x2 -> x3) -> x3)).
Theorem missingprop_b9f4ecece16a3f4b44463b508cc3b9f5d1731684163a4bbdbf54ad9580b00fef : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, MetaFunctor_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> (forall x10 : prop, (MetaCat x0 x1 x2 x3 -> MetaCat x4 x5 x6 x7 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> x10) -> x10)).
admit.
Qed.
Definition MetaNatTrans_buggy : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set -> prop => fun x5 : set -> set -> set -> prop => fun x6 : set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 : set -> set => fun x9 : set -> set -> set -> set => fun x10 : set -> set => fun x11 : set -> set -> set -> set => fun x12 : set -> set => and (forall x13, Obj x13 -> Hom (x8 x13) (x10 x13) (x12 x13)) (forall x13 x14 x15, Obj x13 -> Obj x14 -> Hom x13 x14 x15 -> x7 (x8 x13) (x10 x13) (x10 x14) (x11 x13 x14 x15) (x12 x13) = x7 (x8 x13) (x8 x14) (x10 x14) (x12 x14) (x9 x13 x14 x15))).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_0cb20c756ea7b0705b3a06116751ce45083df737029475edebe18ff39b69824e : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 : set -> set, (forall x13, x0 x13 -> x1 (x8 x13) (x10 x13) (x12 x13)) -> (forall x13 x14 x15, x0 x13 -> x0 x14 -> x1 x13 x14 x15 -> x7 (x8 x13) (x10 x13) (x10 x14) (x11 x13 x14 x15) (x12 x13) = x7 (x8 x13) (x8 x14) (x10 x14) (x12 x14) (x9 x13 x14 x15)) -> MetaNatTrans_buggy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12).
admit.
Qed.
Theorem missingprop_584a9d8e82d2e9a22469cea6370af947473a0a439f863ddb3118ec0461e9e839 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 : set -> set, MetaNatTrans_buggy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 -> (forall x13 : prop, ((forall x14, x0 x14 -> x1 (x8 x14) (x10 x14) (x12 x14)) -> (forall x14 x15 x16, x0 x14 -> x0 x15 -> x1 x14 x15 x16 -> x7 (x8 x14) (x10 x14) (x10 x15) (x11 x14 x15 x16) (x12 x14) = x7 (x8 x14) (x8 x15) (x10 x15) (x12 x15) (x9 x14 x15 x16)) -> x13) -> x13)).
admit.
Qed.
Definition MetaNatTrans_buggy_strict : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set -> prop => fun x5 : set -> set -> set -> prop => fun x6 : set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 : set -> set => fun x9 : set -> set -> set -> set => fun x10 : set -> set => fun x11 : set -> set -> set -> set => fun x12 : set -> set => and (and (and (and (MetaCat Obj Hom Id Comp) (MetaCat x4 x5 x6 x7)) (MetaFunctor Obj Hom Id Comp x4 x5 x6 x7 x8 x9)) (MetaFunctor Obj Hom Id Comp x4 x5 x6 x7 x10 x11)) (MetaNatTrans_buggy Obj Hom Id Comp x4 x5 x6 x7 x8 x9 x10 x11 x12)).
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Theorem missingprop_07ee682fb0720d01991427642a3a4d5174c4a212d9212957ef468f6823e8e992 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 : set -> set, MetaCat x0 x1 x2 x3 -> MetaCat x4 x5 x6 x7 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x10 x11 -> MetaNatTrans_buggy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 -> MetaNatTrans_buggy_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12).
admit.
Qed.
Axiom and5E : (forall x0 x1 x2 x3 x4 : prop, and (and (and (and x0 x1) x2) x3) x4 -> (forall x5 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5) -> x5)).
Theorem missingprop_71e1aa39466ad3031ba4fc1d5de71cc34ba9e358708c2aacde94a333bd25aab8 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, forall x4 : set -> prop, forall x5 : set -> set -> set -> prop, forall x6 : set -> set, forall x7 : set -> set -> set -> set -> set -> set, forall x8 : set -> set, forall x9 : set -> set -> set -> set, forall x10 : set -> set, forall x11 : set -> set -> set -> set, forall x12 : set -> set, MetaNatTrans_buggy_strict x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 -> (forall x13 : prop, (MetaCat x0 x1 x2 x3 -> MetaCat x4 x5 x6 x7 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 -> MetaFunctor x0 x1 x2 x3 x4 x5 x6 x7 x10 x11 -> MetaNatTrans_buggy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 -> x13) -> x13)).
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition lam_id : set -> set :=
 (fun x0 : set => lam x0 (fun x1 : set => x1)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Definition MetaFunctor_prop1 : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (forall x4, Obj x4 -> Hom x4 x4 (Id x4)).
Definition MetaFunctor_prop2 : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (forall x4 x5 x6 x7 x8, Obj x4 -> Obj x5 -> Obj x6 -> Hom x4 x5 x7 -> Hom x5 x6 x8 -> Hom x4 x6 (Comp x4 x5 x6 x8 x7)).
Axiom missingprop_fc5379bc4ad65dc1954d6f65361b9d804f439ab0844013155adf361a615275a6 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaFunctor_prop1 x0 x1 x2 x3 -> MetaFunctor_prop2 x0 x1 x2 x3 -> (forall x4 x5 x6, x0 x4 -> x0 x5 -> x1 x4 x5 x6 -> x3 x4 x4 x5 x6 (x2 x4) = x6) -> (forall x4 x5 x6, x0 x4 -> x0 x5 -> x1 x4 x5 x6 -> x3 x4 x5 x5 (x2 x5) x6 = x6) -> (forall x4 x5 x6 x7 x8 x9 x10, x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x4 x5 x8 -> x1 x5 x6 x9 -> x1 x6 x7 x10 -> x3 x4 x5 x7 (x3 x5 x6 x7 x10 x9) x8 = x3 x4 x6 x7 x10 (x3 x4 x5 x6 x9 x8)) -> MetaCat x0 x1 x2 x3).
Axiom lam_comp_id_R : (forall x0 x1 x2, x2 :e setexp x1 x0 -> lam_comp x0 x2 (lam_id x0) = x2).
Axiom lam_comp_id_L : (forall x0 x1 x2, x2 :e setexp x1 x0 -> lam_comp x0 (lam_id x1) x2 = x2).
Axiom lam_comp_assoc : (forall x0 x1 x2, x2 :e setexp x1 x0 -> (forall x3 x4, forall x5 : set -> set -> prop, x5 (lam_comp x0 x4 (lam_comp x0 x3 x2)) (lam_comp x0 (lam_comp x1 x4 x3) x2) -> x5 (lam_comp x0 (lam_comp x1 x4 x3) x2) (lam_comp x0 x4 (lam_comp x0 x3 x2)))).
Theorem missingprop_1db1571afe8c01990252b7801041a0001ba1fedff9d78947d027d61a0ff0ae7f : (forall x0 : set -> prop, forall x1 : set -> set, forall x2 : set -> set -> set -> prop, (forall x3 x4 x5, x0 x3 -> x0 x4 -> x2 x3 x4 x5 -> x5 :e setexp (x1 x4) (x1 x3)) -> (forall x3, x0 x3 -> x2 x3 x3 (lam_id (x1 x3))) -> (forall x3 x4 x5 x6 x7, x0 x3 -> x0 x4 -> x0 x5 -> x2 x3 x4 x6 -> x2 x4 x5 x7 -> x2 x3 x5 (lam_comp (x1 x3) x7 x6)) -> MetaCat x0 x2 (fun x3 : set => lam_id (x1 x3)) (fun x3 x4 x5 : set => lam_comp (x1 x3))).
admit.
Qed.
Definition True : prop :=
 (forall x0 : prop, x0 -> x0).
Definition HomSet : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => x2 :e setexp x1 x0).
Axiom TrueI : True.
Theorem missingprop_cb7abf829499aec888363ff9292dd7680786c42dc92f10fdd88dc16ada048723 : (forall x0 : set -> prop, forall x1 : set -> set, forall x2 : set -> set -> set -> prop, (forall x3 x4 x5, x0 x3 -> x0 x4 -> x2 x3 x4 x5 -> x5 :e setexp (x1 x4) (x1 x3)) -> MetaFunctor x0 x2 (fun x3 : set => lam_id (x1 x3)) (fun x3 x4 x5 : set => lam_comp (x1 x3)) (fun x3 : set => True) HomSet lam_id (fun x3 x4 x5 : set => lam_comp x3) x1 (fun x3 x4 x5 : set => x5)).
admit.
Qed.
Axiom lam_id_exp_In : (forall x0, lam_id x0 :e setexp x0 x0).
Axiom lam_comp_exp_In : (forall x0 x1 x2 x3, x3 :e setexp x1 x0 -> (forall x4, x4 :e setexp x2 x1 -> lam_comp x0 x4 x3 :e setexp x2 x0)).
Theorem missingprop_dcf5739aa5fe0adc626fd983737b233fe68652dff14c53b3d75823dcf2542d41 : MetaCat (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
admit.
Qed.
Theorem missingprop_3e43f750deb2d98e7d0d32ebe1012d901da879d02f0dfbd6228355bf7705c8b9 : MetaCat (fun x0 : set => x0 :e UnivOf Empty) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
admit.
Qed.
Theorem missingprop_ea08c803821fdb965d694deab91a57c59674f0d5893e9652ca739817958ed900 : MetaCat (fun x0 : set => x0 :e UnivOf (UnivOf Empty)) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
admit.
Qed.
Theorem missingprop_b158c728e6eeb84a30e1a2314f98edd7d121e2b58e5975e748162a974c0bbff7 : (forall x0 : set -> prop, forall x1 : set -> set, forall x2 : set -> set -> set -> prop, (forall x3 x4 x5, x0 x3 -> x0 x4 -> x2 x3 x4 x5 -> x5 :e setexp (x1 x4) (x1 x3)) -> (forall x3, x0 x3 -> x2 x3 x3 (lam_id (x1 x3))) -> (forall x3 x4 x5 x6 x7, x0 x3 -> x0 x4 -> x0 x5 -> x2 x3 x4 x6 -> x2 x4 x5 x7 -> x2 x3 x5 (lam_comp (x1 x3) x7 x6)) -> MetaFunctor_strict x0 x2 (fun x3 : set => lam_id (x1 x3)) (fun x3 x4 x5 : set => lam_comp (x1 x3)) (fun x3 : set => True) HomSet lam_id (fun x3 x4 x5 : set => lam_comp x3) x1 (fun x3 x4 x5 : set => x5)).
admit.
Qed.
(* Parameter unpack_e_o "f3affb534ca9027c56d1a15dee5adcbb277a5c372d01209261fee22c6dd6eab2" "8e748578991012f665a61609fe4f951aa5e3791f69c71f5a551e29e39855416c" *)
Parameter unpack_e_o : set -> (set -> set -> prop) -> prop.
Definition PtdSetHom : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => unpack_e_o x0 (fun x3 x4 : set => unpack_e_o x1 (fun x5 x6 : set => and (x2 :e setexp x5 x3) (ap x2 x4 = x6)))).
(* Parameter unpack_u_o "22baf0455fa7619b6958e5bd762f4085bae580997860844329722650209d24bf" "eb32c2161bb5020efad8203cd45aa4738a4908823619b55963cc2fd1f9830098" *)
Parameter unpack_u_o : set -> (set -> (set -> set) -> prop) -> prop.
Definition UnaryFuncHom : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => unpack_u_o x0 (fun x3 : set => fun x4 : set -> set => unpack_u_o x1 (fun x5 : set => fun x6 : set -> set => and (x2 :e setexp x5 x3) (forall x7, x7 :e x3 -> ap x2 (x4 x7) = x6 (ap x2 x7))))).
(* Parameter unpack_b_o "0fa2c67750f22ef718feacbb3375b43caa7129d02200572180f9cfe7abf54cec" "0601c1c35ff2c84ae36acdecfae98d553546d98a227f007481baf6b962cc1dc8" *)
Parameter unpack_b_o : set -> (set -> (set -> set -> set) -> prop) -> prop.
Definition MagmaHom : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => unpack_b_o x0 (fun x3 : set => fun x4 : set -> set -> set => unpack_b_o x1 (fun x5 : set => fun x6 : set -> set -> set => and (x2 :e setexp x5 x3) (forall x7, x7 :e x3 -> (forall x8, x8 :e x3 -> ap x2 (x4 x7 x8) = x6 (ap x2 x7) (ap x2 x8)))))).
(* Parameter unpack_p_o "4b92ca0383b3989d01ddc4ec8bdf940b54163f9a29e460dfd502939eb880162f" "30f11fc88aca72af37fd2a4235aa22f28a552bbc44f1fb01f4edf7f2b7e376ac" *)
Parameter unpack_p_o : set -> (set -> (set -> prop) -> prop) -> prop.
Definition UnaryPredHom : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => unpack_p_o x0 (fun x3 : set => fun x4 : set -> prop => unpack_p_o x1 (fun x5 : set => fun x6 : set -> prop => and (x2 :e setexp x5 x3) (forall x7, x7 :e x3 -> x4 x7 -> x6 (ap x2 x7))))).
(* Parameter unpack_r_o "8d2ef9c9e522891d1fe605a62dffeab8aefb6325650e4eab14135e7eee8002c5" "e3e6af0984cda0a02912e4f3e09614b67fc0167c625954f0ead4110f52ede086" *)
Parameter unpack_r_o : set -> (set -> (set -> set -> prop) -> prop) -> prop.
Definition BinRelnHom : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => unpack_r_o x0 (fun x3 : set => fun x4 : set -> set -> prop => unpack_r_o x1 (fun x5 : set => fun x6 : set -> set -> prop => and (x2 :e setexp x5 x3) (forall x7, x7 :e x3 -> (forall x8, x8 :e x3 -> x4 x7 x8 -> x6 (ap x2 x7) (ap x2 x8)))))).
(* Parameter unpack_c_o "de068dc4f75465842d1d600bf2bf3a79223eb41ba14d4767bbaf047938e706ec" "939baef108d0de16a824c79fc4e61d99b3a9047993a202a0f47c60d551b65834" *)
Parameter unpack_c_o : set -> (set -> ((set -> prop) -> prop) -> prop) -> prop.
Definition PreContinuousHom : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => unpack_c_o x0 (fun x3 : set => fun x4 : (set -> prop) -> prop => unpack_c_o x1 (fun x5 : set => fun x6 : (set -> prop) -> prop => and (x2 :e setexp x5 x3) (forall x7 : set -> prop, (forall x8, x7 x8 -> x8 :e x5) -> x6 x7 -> x4 (fun x8 : set => and (x8 :e x3) (x7 (ap x2 x8))))))).
(* Parameter unpack_b_b_e_o "81ac7e6231b8c316b5c2cb16fbb5f8038e2425b2efd9bd0fc382bc3d448a259d" "b94d6880c1961cc8323e2d6df4491604a11b5f2bf723511a06e0ab22f677364d" *)
Parameter unpack_b_b_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> prop) -> prop.
Definition Hom_b_b_e : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => unpack_b_b_e_o x0 (fun x3 : set => fun x4 x5 : set -> set -> set => fun x6 : set => unpack_b_b_e_o x1 (fun x7 : set => fun x8 x9 : set -> set -> set => fun x10 : set => and (and (and (x2 :e setexp x7 x3) (forall x11, x11 :e x3 -> (forall x12, x12 :e x3 -> ap x2 (x4 x11 x12) = x8 (ap x2 x11) (ap x2 x12)))) (forall x11, x11 :e x3 -> (forall x12, x12 :e x3 -> ap x2 (x5 x11 x12) = x9 (ap x2 x11) (ap x2 x12)))) (ap x2 x6 = x10)))).
(* Parameter unpack_b_b_e_e_o "eb93435a79c01148fc12dd7779795d68cc2251130dc7633623f16664d25ed072" "1bcc21b2f13824c926a364c5b001d252d630f39a0ebe1f8af790facbe0f63a11" *)
Parameter unpack_b_b_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop) -> prop.
Definition Hom_b_b_e_e : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => unpack_b_b_e_e_o x0 (fun x3 : set => fun x4 x5 : set -> set -> set => fun x6 x7 : set => unpack_b_b_e_e_o x1 (fun x8 : set => fun x9 x10 : set -> set -> set => fun x11 x12 : set => and (and (and (and (x2 :e setexp x8 x3) (forall x13, x13 :e x3 -> (forall x14, x14 :e x3 -> ap x2 (x4 x13 x14) = x9 (ap x2 x13) (ap x2 x14)))) (forall x13, x13 :e x3 -> (forall x14, x14 :e x3 -> ap x2 (x5 x13 x14) = x10 (ap x2 x13) (ap x2 x14)))) (ap x2 x6 = x11)) (ap x2 x7 = x12)))).
(* Parameter unpack_b_b_r_e_e_o "3db063fdbe07c7344b83deebc95b091786045a06e01e2ce6e2eae1d885f574af" "b3a2fc60275daf51e6cbe3161abaeed96cb2fc4e1d5fe26b5e3e58d0eb93c477" *)
Parameter unpack_b_b_r_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop) -> prop.
Definition Hom_b_b_r_e_e : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => unpack_b_b_r_e_e_o x0 (fun x3 : set => fun x4 x5 : set -> set -> set => fun x6 : set -> set -> prop => fun x7 x8 : set => unpack_b_b_r_e_e_o x1 (fun x9 : set => fun x10 x11 : set -> set -> set => fun x12 : set -> set -> prop => fun x13 x14 : set => and (and (and (and (and (x2 :e setexp x9 x3) (forall x15, x15 :e x3 -> (forall x16, x16 :e x3 -> ap x2 (x4 x15 x16) = x10 (ap x2 x15) (ap x2 x16)))) (forall x15, x15 :e x3 -> (forall x16, x16 :e x3 -> ap x2 (x5 x15 x16) = x11 (ap x2 x15) (ap x2 x16)))) (forall x15, x15 :e x3 -> (forall x16, x16 :e x3 -> x6 x15 x16 -> x12 (ap x2 x15) (ap x2 x16)))) (ap x2 x7 = x13)) (ap x2 x8 = x14)))).
(* Parameter pack_e "faab5f334ba3328f24def7e6fcb974000058847411a2eb0618014eca864e537f" "dd8f2d332fef3b4d27898ab88fa5ddad0462180c8d64536ce201f5a9394f40dd" *)
Parameter pack_e : set -> set -> set.
Axiom unpack_e_o_eq : (forall x0 : set -> set -> prop, forall x1 x2, forall x3 : prop -> prop -> prop, x3 (unpack_e_o (pack_e x1 x2) x0) (x0 x1 x2) -> x3 (x0 x1 x2) (unpack_e_o (pack_e x1 x2) x0)).
Theorem missingprop_266cf3934e79ff708b43f6101066886a004a8b2cb57b38750ae943dbc174c7c9 : (forall x0 x1 x2 x3 x4, forall x5 : prop -> prop -> prop, x5 (PtdSetHom (pack_e x0 x2) (pack_e x1 x3) x4) (and (x4 :e setexp x1 x0) (ap x4 x2 = x3)) -> x5 (and (x4 :e setexp x1 x0) (ap x4 x2 = x3)) (PtdSetHom (pack_e x0 x2) (pack_e x1 x3) x4)).
admit.
Qed.
(* Parameter pack_u "9575c80a2655d3953184d74d13bd5860d4f415acbfc25d279378b4036579af65" "119d13725af3373dd508f147836c2eff5ff5acf92a1074ad6c114b181ea8a933" *)
Parameter pack_u : set -> (set -> set) -> set.
Axiom unpack_u_o_eq : (forall x0 : set -> (set -> set) -> prop, forall x1, forall x2 : set -> set, (forall x3 : set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x3 = x0 x1 x2) -> unpack_u_o (pack_u x1 x2) x0 = x0 x1 x2).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Theorem missingprop_c0506b7ce99ca057359584255bdeac2239c78bf84c4390e2fc4c72ca99c22cfa : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : prop -> prop -> prop, x5 (UnaryFuncHom (pack_u x0 x2) (pack_u x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> ap x4 (x2 x6) = x3 (ap x4 x6))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> ap x4 (x2 x6) = x3 (ap x4 x6))) (UnaryFuncHom (pack_u x0 x2) (pack_u x1 x3) x4)).
admit.
Qed.
(* Parameter pack_b "e007d96601771e291e9083ce21b5e97703bce4ff5257fec59b7ed3dbb05b5319" "855387af88aad68b5f942a3a97029fcd79fe0a4e781cdf546d058297f8a483ce" *)
Parameter pack_b : set -> (set -> set -> set) -> set.
Axiom unpack_b_o_eq : (forall x0 : set -> (set -> set -> set) -> prop, forall x1, forall x2 : set -> set -> set, (forall x3 : set -> set -> set, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x4 x5 = x3 x4 x5)) -> x0 x1 x3 = x0 x1 x2) -> unpack_b_o (pack_b x1 x2) x0 = x0 x1 x2).
Theorem missingprop_7ee20a9b005b9d1cb4acab7f037a1615344131a99780aaa35f8fa78a1fc7660f : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4, forall x5 : prop -> prop -> prop, x5 (MagmaHom (pack_b x0 x2) (pack_b x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> ap x4 (x2 x6 x7) = x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> ap x4 (x2 x6 x7) = x3 (ap x4 x6) (ap x4 x7)))) (MagmaHom (pack_b x0 x2) (pack_b x1 x3) x4)).
admit.
Qed.
(* Parameter pack_p "3c539dbbee9d5ff440b9024180e52e9c2adde77bbaa8264d8f67d724d8c8cb25" "d5afae717eff5e7035dc846b590d96bd5a7727284f8ff94e161398c148ab897f" *)
Parameter pack_p : set -> (set -> prop) -> set.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom unpack_p_o_eq : (forall x0 : set -> (set -> prop) -> prop, forall x1, forall x2 : set -> prop, (forall x3 : set -> prop, (forall x4, x4 :e x1 -> iff (x2 x4) (x3 x4)) -> x0 x1 x3 = x0 x1 x2) -> unpack_p_o (pack_p x1 x2) x0 = x0 x1 x2).
Axiom iffEL : (forall x0 x1 : prop, iff x0 x1 -> x0 -> x1).
Axiom iffER : (forall x0 x1 : prop, iff x0 x1 -> x1 -> x0).
Theorem missingprop_63c01b8f599732ba7bc3b48c28c0f10755230e5cc9f0717c7895602d2eaf01d3 : (forall x0 x1, forall x2 x3 : set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4)).
admit.
Qed.
(* Parameter pack_r "39d80099e1b48aed4548f424ae4f1ff25b2d595828aff4b3a5abe232ca0348b5" "217a7f92acc207b15961c90039aa929f0bd5d9212f66ce5595c3af1dd8b9737e" *)
Parameter pack_r : set -> (set -> set -> prop) -> set.
Axiom unpack_r_o_eq : (forall x0 : set -> (set -> set -> prop) -> prop, forall x1, forall x2 : set -> set -> prop, (forall x3 : set -> set -> prop, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> iff (x2 x4 x5) (x3 x4 x5))) -> x0 x1 x3 = x0 x1 x2) -> unpack_r_o (pack_r x1 x2) x0 = x0 x1 x2).
Theorem missingprop_4e486761c3790f4990f398ce8c16ea7ac5915924a294f8e5b06e45030e68e983 : (forall x0 x1, forall x2 x3 : set -> set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4)).
admit.
Qed.
(* Parameter pack_c "545700730c93ce350b761ead914d98adf2edbd5c9f253d9a6df972641fee3aed" "cd75b74e4a07d881da0b0eda458a004806ed5c24b08fd3fef0f43e91f64c4633" *)
Parameter pack_c : set -> ((set -> prop) -> prop) -> set.
Axiom unpack_c_o_eq : (forall x0 : set -> ((set -> prop) -> prop) -> prop, forall x1, forall x2 : (set -> prop) -> prop, (forall x3 : (set -> prop) -> prop, (forall x4 : set -> prop, (forall x5, x4 x5 -> x5 :e x1) -> iff (x2 x4) (x3 x4)) -> x0 x1 x3 = x0 x1 x2) -> unpack_c_o (pack_c x1 x2) x0 = x0 x1 x2).
Axiom andEL : (forall x0 x1 : prop, and x0 x1 -> x0).
Theorem missingprop_147946d52b6747e7a3735111f3622ca84b157f241b7b107aab3bab9bb651af48 : (forall x0 x1, forall x2 x3 : (set -> prop) -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (PreContinuousHom (pack_c x0 x2) (pack_c x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6 : set -> prop, (forall x7, x6 x7 -> x7 :e x1) -> x3 x6 -> x2 (fun x7 : set => and (x7 :e x0) (x6 (ap x4 x7))))) -> x5 (and (x4 :e setexp x1 x0) (forall x6 : set -> prop, (forall x7, x6 x7 -> x7 :e x1) -> x3 x6 -> x2 (fun x7 : set => and (x7 :e x0) (x6 (ap x4 x7))))) (PreContinuousHom (pack_c x0 x2) (pack_c x1 x3) x4)).
admit.
Qed.
(* Parameter pack_b_b_e "0c2f8a60f76952627b3e2c9597ef5771553931819c727dea75b98b59b548b5ec" "c9ca029e75ae9f47e0821539f84775cc07258db662e0b5ccf4a423c45a480766" *)
Parameter pack_b_b_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set.
Axiom unpack_b_b_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> prop, forall x1, forall x2 x3 : set -> set -> set, forall x4, (forall x5 : set -> set -> set, (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x2 x6 x7 = x5 x6 x7)) -> (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x3 x7 x8 = x6 x7 x8)) -> x0 x1 x5 x6 x4 = x0 x1 x2 x3 x4)) -> unpack_b_b_e_o (pack_b_b_e x1 x2 x3 x4) x0 = x0 x1 x2 x3 x4).
Theorem missingprop_10267d1d502dfe147b6d457a56b873d600165a3fde1bf35785171c85aa221639 : (forall x0 x1, forall x2 x3 x4 x5 : set -> set -> set, forall x6 x7 x8, forall x9 : prop -> prop -> prop, x9 (Hom_b_b_e (pack_b_b_e x0 x2 x3 x6) (pack_b_b_e x1 x4 x5 x7) x8) (and (and (and (x8 :e setexp x1 x0) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> ap x8 (x2 x10 x11) = x4 (ap x8 x10) (ap x8 x11)))) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> ap x8 (x3 x10 x11) = x5 (ap x8 x10) (ap x8 x11)))) (ap x8 x6 = x7)) -> x9 (and (and (and (x8 :e setexp x1 x0) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> ap x8 (x2 x10 x11) = x4 (ap x8 x10) (ap x8 x11)))) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> ap x8 (x3 x10 x11) = x5 (ap x8 x10) (ap x8 x11)))) (ap x8 x6 = x7)) (Hom_b_b_e (pack_b_b_e x0 x2 x3 x6) (pack_b_b_e x1 x4 x5 x7) x8)).
admit.
Qed.
(* Parameter pack_b_b_e_e "0ca5ba562d2ab04221b86aded545ed077bf3a2f06e21344f04ba0b43521b231e" "6859fb13a44929ca6d7c0e598ffc6a6f82969c8cfe5edda33f1c1d81187b9d31" *)
Parameter pack_b_b_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
Axiom unpack_b_b_e_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop, forall x1, forall x2 x3 : set -> set -> set, forall x4 x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> set, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> x3 x8 x9 = x7 x8 x9)) -> x0 x1 x6 x7 x4 x5 = x0 x1 x2 x3 x4 x5)) -> unpack_b_b_e_e_o (pack_b_b_e_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
Theorem missingprop_c390c3300969ceff9fa6146a517f8bd0892446bb27336e3269cdaa03d494c7b4 : (forall x0 x1, forall x2 x3 x4 x5 : set -> set -> set, forall x6 x7 x8 x9 x10, forall x11 : prop -> prop -> prop, x11 (Hom_b_b_e_e (pack_b_b_e_e x0 x2 x3 x6 x7) (pack_b_b_e_e x1 x4 x5 x8 x9) x10) (and (and (and (and (x10 :e setexp x1 x0) (forall x12, x12 :e x0 -> (forall x13, x13 :e x0 -> ap x10 (x2 x12 x13) = x4 (ap x10 x12) (ap x10 x13)))) (forall x12, x12 :e x0 -> (forall x13, x13 :e x0 -> ap x10 (x3 x12 x13) = x5 (ap x10 x12) (ap x10 x13)))) (ap x10 x6 = x8)) (ap x10 x7 = x9)) -> x11 (and (and (and (and (x10 :e setexp x1 x0) (forall x12, x12 :e x0 -> (forall x13, x13 :e x0 -> ap x10 (x2 x12 x13) = x4 (ap x10 x12) (ap x10 x13)))) (forall x12, x12 :e x0 -> (forall x13, x13 :e x0 -> ap x10 (x3 x12 x13) = x5 (ap x10 x12) (ap x10 x13)))) (ap x10 x6 = x8)) (ap x10 x7 = x9)) (Hom_b_b_e_e (pack_b_b_e_e x0 x2 x3 x6 x7) (pack_b_b_e_e x1 x4 x5 x8 x9) x10)).
admit.
Qed.
(* Parameter pack_b_b_r_e_e "94ec6541b5d420bf167196743d54143ff9e46d4022e0ccecb059cf098af4663d" "8efb1973b4a9b292951aa9ca2922b7aa15d8db021bfada9c0f07fc9bb09b65fb" *)
Parameter pack_b_b_r_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set.
Axiom unpack_b_b_r_e_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop, forall x1, forall x2 x3 : set -> set -> set, forall x4 : set -> set -> prop, forall x5 x6, (forall x7 : set -> set -> set, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> x2 x8 x9 = x7 x8 x9)) -> (forall x8 : set -> set -> set, (forall x9, x9 :e x1 -> (forall x10, x10 :e x1 -> x3 x9 x10 = x8 x9 x10)) -> (forall x9 : set -> set -> prop, (forall x10, x10 :e x1 -> (forall x11, x11 :e x1 -> iff (x4 x10 x11) (x9 x10 x11))) -> x0 x1 x7 x8 x9 x5 x6 = x0 x1 x2 x3 x4 x5 x6))) -> unpack_b_b_r_e_e_o (pack_b_b_r_e_e x1 x2 x3 x4 x5 x6) x0 = x0 x1 x2 x3 x4 x5 x6).
Axiom and6E : (forall x0 x1 x2 x3 x4 x5 : prop, and (and (and (and (and x0 x1) x2) x3) x4) x5 -> (forall x6 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6) -> x6)).
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Theorem missingprop_3b7da8c0bd80210288926533162c56f13aa350f06168ea4a8789f8cd5ca03194 : (forall x0 x1, forall x2 x3 x4 x5 : set -> set -> set, forall x6 x7 : set -> set -> prop, forall x8 x9 x10 x11 x12, forall x13 : prop -> prop -> prop, x13 (Hom_b_b_r_e_e (pack_b_b_r_e_e x0 x2 x3 x6 x8 x9) (pack_b_b_r_e_e x1 x4 x5 x7 x10 x11) x12) (and (and (and (and (and (x12 :e setexp x1 x0) (forall x14, x14 :e x0 -> (forall x15, x15 :e x0 -> ap x12 (x2 x14 x15) = x4 (ap x12 x14) (ap x12 x15)))) (forall x14, x14 :e x0 -> (forall x15, x15 :e x0 -> ap x12 (x3 x14 x15) = x5 (ap x12 x14) (ap x12 x15)))) (forall x14, x14 :e x0 -> (forall x15, x15 :e x0 -> x6 x14 x15 -> x7 (ap x12 x14) (ap x12 x15)))) (ap x12 x8 = x10)) (ap x12 x9 = x11)) -> x13 (and (and (and (and (and (x12 :e setexp x1 x0) (forall x14, x14 :e x0 -> (forall x15, x15 :e x0 -> ap x12 (x2 x14 x15) = x4 (ap x12 x14) (ap x12 x15)))) (forall x14, x14 :e x0 -> (forall x15, x15 :e x0 -> ap x12 (x3 x14 x15) = x5 (ap x12 x14) (ap x12 x15)))) (forall x14, x14 :e x0 -> (forall x15, x15 :e x0 -> x6 x14 x15 -> x7 (ap x12 x14) (ap x12 x15)))) (ap x12 x8 = x10)) (ap x12 x9 = x11)) (Hom_b_b_r_e_e (pack_b_b_r_e_e x0 x2 x3 x6 x8 x9) (pack_b_b_r_e_e x1 x4 x5 x7 x10 x11) x12)).
admit.
Qed.
Definition struct_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2 x3, x3 :e x2 -> x1 (pack_e x2 x3)) -> x1 x0).
Axiom pack_e_0_eq2 : (forall x0 x1, forall x2 : set -> set -> prop, x2 x0 (ap (pack_e x0 x1) Empty) -> x2 (ap (pack_e x0 x1) Empty) x0).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Theorem missingprop_f2377bbdcf1599eea76afec3fd7eab2ae5834953315849b5fb79930303088894 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_e x1) -> MetaCat x0 PtdSetHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
admit.
Qed.
Theorem missingprop_7938f413b613d0d0c75ef55fa10d2044621c1f1cd2fd8d0c2e5b548d072582ea : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_e x1) -> MetaFunctor x0 PtdSetHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
admit.
Qed.
Definition struct_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> prop, x1 (pack_p x2 x3)) -> x1 x0).
Axiom pack_p_0_eq2 : (forall x0, forall x1 : set -> prop, forall x2 : set -> set -> prop, x2 x0 (ap (pack_p x0 x1) Empty) -> x2 (ap (pack_p x0 x1) Empty) x0).
Theorem missingprop_8e7946e14374f929755e19a1c44c77701625a3b4110f6a053a055efef5fccc73 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> MetaCat x0 UnaryPredHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
admit.
Qed.
Theorem missingprop_59e3f3dce052073bbe68f49c7125d7f995693bb360ddfee771c0265ad2f4452d : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> MetaFunctor x0 UnaryPredHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
admit.
Qed.
Definition struct_r : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, x1 (pack_r x2 x3)) -> x1 x0).
Axiom pack_r_0_eq2 : (forall x0, forall x1 x2 : set -> set -> prop, x2 x0 (ap (pack_r x0 x1) Empty) -> x2 (ap (pack_r x0 x1) Empty) x0).
Theorem missingprop_cbfb7b0a858ebd43603219779360cb4b49636cdfaa135c2740cff97583aabee7 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> MetaCat x0 BinRelnHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
admit.
Qed.
Theorem missingprop_8faf0f6f6af4c6811dc2a9fddf49a6de91e15ce9a8949ea3d00ad9c7e8345ae0 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> MetaFunctor x0 BinRelnHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
admit.
Qed.
Definition struct_u : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set, (forall x4, x4 :e x2 -> x3 x4 :e x2) -> x1 (pack_u x2 x3)) -> x1 x0).
Axiom pack_u_0_eq2 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 x0 (ap (pack_u x0 x1) Empty) -> x2 (ap (pack_u x0 x1) Empty) x0).
Theorem missingprop_137f848bdb78f472068da9f3e5698255d8403888e1b30f209fd7da0af03ad2f1 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> MetaCat x0 UnaryFuncHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
admit.
Qed.
Theorem missingprop_6809a8ae9ac2e08c74bb19682836f899f1647bfb19e1beda778b023f38a68650 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> MetaFunctor x0 UnaryFuncHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
admit.
Qed.
Definition struct_b : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> x1 (pack_b x2 x3)) -> x1 x0).
Axiom pack_b_0_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 x0 (ap (pack_b x0 x1) Empty) -> x2 (ap (pack_b x0 x1) Empty) x0).
Theorem missingprop_be2503b86c1e5792746c6adc58383e3972a7c1b0d953c88e847e4de130b06873 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> MetaCat x0 MagmaHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
admit.
Qed.
Theorem missingprop_5ef6db00f3c15a86c1e221d4a4c3ce606c4d873a1f90dd0b36114bf603c362c9 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> MetaFunctor x0 MagmaHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
admit.
Qed.
Definition struct_c : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : (set -> prop) -> prop, x1 (pack_c x2 x3)) -> x1 x0).
Axiom pack_c_0_eq2 : (forall x0, forall x1 : (set -> prop) -> prop, forall x2 : set -> set -> prop, x2 x0 (ap (pack_c x0 x1) Empty) -> x2 (ap (pack_c x0 x1) Empty) x0).
Axiom pred_ext_2 : (forall x0 x1 : set -> prop, (forall x2, x0 x2 -> x1 x2) -> (forall x2, x1 x2 -> x0 x2) -> x0 = x1).
Theorem missingprop_a1cc131d97c1cb4ea1bea720376dc4603c3356b62894acb7a7ad88a6d0c56407 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_c x1) -> MetaCat x0 PreContinuousHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
admit.
Qed.
Theorem missingprop_c43bbf00058fbe34f3ecc7b49a3531eeda4c0acfd8a791089e308c67a98989de : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_c x1) -> MetaFunctor x0 PreContinuousHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
admit.
Qed.
Definition struct_b_b_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> set, (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x4 x5 x6 :e x2)) -> (forall x5, x5 :e x2 -> x1 (pack_b_b_e x2 x3 x4 x5)))) -> x1 x0).
Axiom pack_b_b_e_0_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3, forall x4 : set -> set -> prop, x4 x0 (ap (pack_b_b_e x0 x1 x2 x3) Empty) -> x4 (ap (pack_b_b_e x0 x1 x2 x3) Empty) x0).
Theorem missingprop_c7aff8a258081ead27bbcfd1253378c01beaa0edda67f8a38bea5872be2d604f : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_e x1) -> MetaCat x0 Hom_b_b_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
admit.
Qed.
Theorem missingprop_f8aa78094125b50fb4c2bb67306c535ef34713dd1b79d9c3a86af7333c45e8da : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_e x1) -> MetaFunctor x0 Hom_b_b_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
admit.
Qed.
Definition struct_b_b_e_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> set, (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x4 x5 x6 :e x2)) -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x1 (pack_b_b_e_e x2 x3 x4 x5 x6))))) -> x1 x0).
Axiom pack_b_b_e_e_0_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x0 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) Empty) -> x5 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) Empty) x0).
Theorem missingprop_d576838b332114c90b2af560b99977995a2da890fc52757cf56c82a16d1c86c8 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_e_e x1) -> MetaCat x0 Hom_b_b_e_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
admit.
Qed.
Theorem missingprop_45b4495cd670852170dc3fe96ab30b08a69267996b7bee43e50ace860cabc334 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_e_e x1) -> MetaFunctor x0 Hom_b_b_e_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
admit.
Qed.
Definition struct_b_b_r_e_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> set, (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x4 x5 x6 :e x2)) -> (forall x5 : set -> set -> prop, forall x6, x6 :e x2 -> (forall x7, x7 :e x2 -> x1 (pack_b_b_r_e_e x2 x3 x4 x5 x6 x7))))) -> x1 x0).
Axiom pack_b_b_r_e_e_0_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, forall x6 : set -> set -> prop, x6 x0 (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) Empty) -> x6 (ap (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) Empty) x0).
Theorem missingprop_d69e51cf98d725801d3c48c79c52281c3ff7cc9a4590111d9bd4316b558f0db1 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_r_e_e x1) -> MetaCat x0 Hom_b_b_r_e_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
admit.
Qed.
Theorem missingprop_de2d15ec1a8706291df52b9be0c3b5a1251c48871e332f302880d36281797b83 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_r_e_e x1) -> MetaFunctor x0 Hom_b_b_r_e_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
admit.
Qed.
