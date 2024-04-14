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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition MetaCat_equalizer_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 : set => fun x10 : set -> set -> set => and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (Hom x4 x5 x7)) (Obj x8)) (Hom x8 x4 x9)) (Comp x8 x4 x5 x6 x9 = Comp x8 x4 x5 x7 x9)) (forall x11, Obj x11 -> (forall x12, Hom x11 x4 x12 -> Comp x11 x4 x5 x6 x12 = Comp x11 x4 x5 x7 x12 -> and (and (Hom x11 x8 (x10 x11 x12)) (Comp x11 x8 x4 x9 (x10 x11 x12) = x12)) (forall x13, Hom x11 x8 x13 -> Comp x11 x8 x4 x9 x13 = x12 -> x13 = x10 x11 x12)))).
Definition MetaCat_equalizer_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 : set -> set -> set -> set -> set => fun x6 : set -> set -> set -> set -> set -> set -> set => forall x7 x8, Obj x7 -> Obj x8 -> (forall x9 x10, Hom x7 x8 x9 -> Hom x7 x8 x10 -> MetaCat_equalizer_p Obj Hom Id Comp x7 x8 x9 x10 (x4 x7 x8 x9 x10) (x5 x7 x8 x9 x10) (x6 x7 x8 x9 x10))).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Definition HomSet : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => x2 :e setexp x1 x0).
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition lam_id : set -> set :=
 (fun x0 : set => lam x0 (fun x1 : set => x1)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom missingprop_9981628fee84bcf70587ffb7933bd9c35042a1a594a2ae21c28e38ea11e09d6a : (forall x0 x1 x2 x3 x4 x5 x6 x7 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Theorem missingprop_ddd882da3ecb083533c5169d9ba0d589c2851738e8d8ddd48b103e4363b8bfa8 : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 HomSet lam_id (fun x7 x8 x9 : set => lam_comp x7) x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
(* Parameter ZF_closed "43f34d6a2314b56cb12bf5cf84f271f3f02a3e68417b09404cc73152523dbfa0" "1bd4aa0ec0b5e627dce9a8a1ddae929e58109ccbb6f4bb3d08614abf740280c0" *)
Parameter ZF_closed : set -> prop.
(* Parameter Union_closed "54850182033d0575e98bc2b12aa8b9baaa7a541e9d5abc7fddeb74fc5d0a19ac" "57561da78767379e0c78b7935a6858f63c7c4be20fe81fe487471b6f2b30c085" *)
Parameter Union_closed : set -> prop.
Definition Power_closed : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> Power x1 :e x0).
(* Parameter Repl_closed "962d14a92fc8c61bb8319f6fe1508fa2dfbe404fd3a3766ebce0c6db17eeeaa1" "5574bbcac2e27d8e3345e1dc66374aa209740ff86c1db14104bc6c6129aee558" *)
Parameter Repl_closed : set -> prop.
Axiom ZF_closed_E : (forall x0, ZF_closed x0 -> (forall x1 : prop, (Union_closed x0 -> Power_closed x0 -> Repl_closed x0 -> x1) -> x1)).
Axiom UnivOf_ZF_closed : (forall x0, ZF_closed (UnivOf x0)).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom UnivOf_TransSet : (forall x0, TransSet (UnivOf x0)).
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Theorem missingprop_418e3543d02db1b7c7ac4d09709f59514c15951ea4e81ad72458786f4b38330e : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p (fun x7 : set => x7 :e UnivOf Empty) HomSet lam_id (fun x7 x8 x9 : set => lam_comp x7) x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_01368d5a05ea819f1ccb8994cea497269e63e3abc273972c914537bb5bf1f718 : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p (fun x7 : set => x7 :e UnivOf (UnivOf Empty)) HomSet lam_id (fun x7 x8 x9 : set => lam_comp x7) x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
(* Parameter setprod "ecef5cea93b11859a42b1ea5e8a89184202761217017f3a5cdce1b91d10b34a7" "fc0b600a21afd76820f1fb74092d9aa81687f3b0199e9b493dafd3e283c6e8ca" *)
Parameter setprod : set -> set -> set.
(* Parameter MetaCat_pullback_struct_p "0aae59672cd58c2e839eeb483f6d823f8c69400c45e67edc458d965b50b1e024" "c0b415a5b0463ba8aadaf1461fdc1f965c8255153af1d823b1bbd04f8393b554" *)
Parameter MetaCat_pullback_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
(* Parameter MetaCat_product_constr_p "174a19a576b89f1308ff59f6dd7de2117117f98e28682f4bbd15fbb1975ae6f0" "8627a945e60408d81c3094008f07f651db6b692c34fa1ffa9753e39b66d38044" *)
Parameter MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_9a59ecd7e83aeba0d4be9a32b55c5c57c6083b63a3b259e3f5889e4923a1993d : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 x1 x2 x3 x5 x7 x9 -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4)).
Axiom missingprop_2d427e86e80080bca0cd1cdb7569c48ac3ebc7f720e53d0aef56ae9082c9d013 : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setprod x1 x2))) -> (forall x1 : prop, (forall x2 : set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 HomSet (fun x9 : set => lam x9 (fun x10 : set => x10)) (fun x9 x10 x11 x12 x13 : set => lam x9 (fun x14 : set => ap x12 (ap x13 x14))) x2 x4 x6 x8 -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Theorem missingprop_a58587398f78cc19e584d164063d8a42566021285e8019a61cbb09a5b9caeb5a : (forall x0 : set -> prop, MetaCat x0 HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) -> (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setprod x1 x2))) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p x0 HomSet lam_id (fun x9 x10 x11 : set => lam_comp x9) x2 x4 x6 x8 -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Definition True : prop :=
 (forall x0 : prop, x0 -> x0).
Axiom missingprop_dcf5739aa5fe0adc626fd983737b233fe68652dff14c53b3d75823dcf2542d41 : MetaCat (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
Axiom TrueI : True.
Theorem missingprop_9e7eef94372186b7108b22ccbed10c8888674fba1484f98788f421b413ab54ea : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_3e43f750deb2d98e7d0d32ebe1012d901da879d02f0dfbd6228355bf7705c8b9 : MetaCat (fun x0 : set => x0 :e UnivOf Empty) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
Axiom missingprop_168889ac2767512e36c59c4d8bc32e41d805ce681fce6d41f1fc82bd258fd1a7 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> setprod x1 x2 :e x0))).
Theorem missingprop_a3e37441dfe93ac35e74e8a2f8ba6cda7dec9f1ce57d21a32b201d2a7762356c : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p (fun x8 : set => x8 :e UnivOf Empty) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_ea08c803821fdb965d694deab91a57c59674f0d5893e9652ca739817958ed900 : MetaCat (fun x0 : set => x0 :e UnivOf (UnivOf Empty)) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
Theorem missingprop_361c485b057d8df861bdec02843f77d21366c9c5dea551ae8f700967c3a4cd3b : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p (fun x8 : set => x8 :e UnivOf (UnivOf Empty)) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x6 x4 (x5 x6)) (forall x7, Hom x6 x4 x7 -> x7 = x5 x6))).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom In_0_1 : 0 :e 1.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom eq_1_Sing0 : 1 = Sing 0.
Theorem missingprop_c631805605639f54c3b6adaa8399cc634c2b0463b565cc1047a5bbf1a7fef49e : (forall x0 : set -> prop, x0 1 -> MetaCat_terminal_p x0 HomSet (fun x1 : set => lam x1 (fun x2 : set => x2)) (fun x1 x2 x3 x4 x5 : set => lam x1 (fun x6 : set => ap x4 (ap x5 x6))) 1 (fun x1 : set => lam x1 (fun x2 : set => 0))).
admit.
Qed.
Definition MetaCat_monic_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set => and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (forall x7, Obj x7 -> (forall x8 x9, Hom x7 x4 x8 -> Hom x7 x4 x9 -> Comp x7 x4 x5 x6 x8 = Comp x7 x4 x5 x6 x9 -> x8 = x9))).
Definition MetaCat_pullback_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 x10 x11 : set => fun x12 : set -> set -> set -> set => and (and (and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x4 x6 x7)) (Hom x5 x6 x8)) (Obj x9)) (Hom x9 x4 x10)) (Hom x9 x5 x11)) (Comp x9 x4 x6 x7 x10 = Comp x9 x5 x6 x8 x11)) (forall x13, Obj x13 -> (forall x14, Hom x13 x4 x14 -> (forall x15, Hom x13 x5 x15 -> Comp x13 x4 x6 x7 x14 = Comp x13 x5 x6 x8 x15 -> and (and (and (Hom x13 x9 (x12 x13 x14 x15)) (Comp x13 x9 x4 x10 (x12 x13 x14 x15) = x14)) (Comp x13 x9 x5 x11 (x12 x13 x14 x15) = x15)) (forall x16, Hom x13 x9 x16 -> Comp x13 x9 x4 x10 x16 = x14 -> Comp x13 x9 x5 x11 x16 = x15 -> x16 = x12 x13 x14 x15))))).
Definition MetaCat_subobject_classifier_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> (set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => fun x6 x7 : set => fun x8 : set -> set -> set -> set => fun x9 : set -> set -> set -> set -> set -> set -> set => and (and (and (MetaCat_terminal_p Obj Hom Id Comp x4 x5) (Obj x6)) (Hom x4 x6 x7)) (forall x10 x11 x12, MetaCat_monic_p Obj Hom Id Comp x10 x11 x12 -> and (Hom x11 x6 (x8 x10 x11 x12)) (MetaCat_pullback_p Obj Hom Id Comp x4 x11 x6 x7 (x8 x10 x11 x12) x10 (x5 x10) x12 (x9 x10 x11 x12)))).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom In_1_2 : 1 :e 2.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom If_i_or : (forall x0 : prop, forall x1 x2, or (If_i x0 x1 x2 = x1) (If_i x0 x1 x2 = x2)).
Axiom In_0_2 : 0 :e 2.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom missingprop_d818050ba2f8af7e5df3c2818d15e1b858ad10296faac92a7847146e94c87036 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> x9 -> and (and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8) x9).
Axiom inj_linv : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> (forall x2, x2 :e x0 -> inv x0 x1 (x1 x2) = x2)).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom If_i_correct : (forall x0 : prop, forall x1 x2, or (and x0 (If_i x0 x1 x2 = x1)) (and (not x0) (If_i x0 x1 x2 = x2))).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_37ccacf65044aaad4e34d83b49209a18a03855b2543d0d1b3289fe130b0ae296 : (forall x0 : set -> prop, x0 1 -> x0 2 -> MetaCat_subobject_classifier_p x0 HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) 1 (fun x1 : set => lam x1 (fun x2 : set => 0)) 2 (lam 1 (fun x1 : set => 1)) (fun x1 x2 x3 : set => lam x2 (fun x4 : set => If_i (forall x5 : prop, (forall x6, and (x6 :e x1) (ap x3 x6 = x4) -> x5) -> x5) 1 0)) (fun x1 x2 x3 x4 x5 x6 : set => lam x4 (fun x7 : set => inv x1 (ap x3) (ap x6 x7)))).
admit.
Qed.
Theorem missingprop_b1a3c96c449f03f4a28581f6960a1c83d6c7a078ae9a00e66ef3586912ebf9b3 : (forall x0 : set -> prop, x0 1 -> x0 2 -> (forall x1 : prop, (forall x2, (forall x3 : prop, (forall x4 : set -> set, (forall x5 : prop, (forall x6, (forall x7 : prop, (forall x8, (forall x9 : prop, (forall x10 : set -> set -> set -> set, (forall x11 : prop, (forall x12 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_p x0 HomSet lam_id (fun x13 x14 x15 : set => lam_comp x13) x2 x4 x6 x8 x10 x12 -> x11) -> x11) -> x9) -> x9) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_2f3ca6284ae933f2c489e401238d7e45f9a2fba7565be047bcbef5230f3b8aed : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_p (fun x12 : set => True) HomSet lam_id (fun x12 x13 x14 : set => lam_comp x12) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_UnivOf_Empty : (forall x0, nat_p x0 -> x0 :e UnivOf 0).
Axiom nat_2 : nat_p 2.
Axiom nat_1 : nat_p 1.
Theorem missingprop_4f56854646cb6ae325ca9dffbf2078dcccd3a5bd8721f61835fee5ee38857ec7 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_p (fun x12 : set => x12 :e UnivOf 0) HomSet lam_id (fun x12 x13 x14 : set => lam_comp x12) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom UnivOf_In : (forall x0, x0 :e UnivOf x0).
Theorem missingprop_2d528c4139c2d1dd93298c1a64e321954c834d3f235fb8de989a2b5f9826cd01 : 1 :e UnivOf (UnivOf 0).
admit.
Qed.
Theorem missingprop_224b81bc9919e354195af318509397e259264e60c86ca74d9a347b2213420078 : 2 :e UnivOf (UnivOf 0).
admit.
Qed.
Theorem missingprop_368ed5bd176468a270731f8d5c14e23bbcd2a506847ad47b068161899522a05f : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_p (fun x12 : set => x12 :e UnivOf (UnivOf 0)) HomSet lam_id (fun x12 x13 x14 : set => lam_comp x12) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Definition MetaCat_nno_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => fun x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (MetaCat_terminal_p Obj Hom Id Comp x4 x5) (Obj x6)) (Hom x4 x6 x7)) (Hom x6 x6 x8)) (forall x10 x11 x12, Obj x10 -> Hom x4 x10 x11 -> Hom x10 x10 x12 -> and (and (and (Hom x6 x10 (x9 x10 x11 x12)) (Comp x4 x6 x10 (x9 x10 x11 x12) x7 = x11)) (Comp x6 x6 x10 (x9 x10 x11 x12) x8 = Comp x6 x10 x10 x12 (x9 x10 x11 x12))) (forall x13, Hom x6 x10 x13 -> Comp x4 x6 x10 x13 x7 = x11 -> Comp x6 x6 x10 x13 x8 = Comp x6 x10 x10 x12 x13 -> x13 = x9 x10 x11 x12))).
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_0 : nat_p 0.
Theorem missingprop_b6c6271c48298d19f3c93efd26efbc828f58047d76fdd16d468ddcd04fb28691 : (forall x0 : set -> prop, x0 1 -> x0 omega -> MetaCat_nno_p x0 HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) 1 (fun x1 : set => lam x1 (fun x2 : set => 0)) omega (lam 1 (fun x1 : set => 0)) (lam omega ordsucc) (fun x1 x2 x3 : set => lam omega (nat_primrec (ap x2 0) (fun x4 : set => ap x3)))).
admit.
Qed.
Theorem missingprop_39316ce080d87a012ee204f2ac1804587ff42553ad17dbec781a566574cc2a25 : (forall x0 : set -> prop, x0 1 -> x0 omega -> (forall x1 : prop, (forall x2, (forall x3 : prop, (forall x4 : set -> set, (forall x5 : prop, (forall x6, (forall x7 : prop, (forall x8, (forall x9 : prop, (forall x10, (forall x11 : prop, (forall x12 : set -> set -> set -> set, MetaCat_nno_p x0 HomSet lam_id (fun x13 x14 x15 : set => lam_comp x13) x2 x4 x6 x8 x10 x12 -> x11) -> x11) -> x9) -> x9) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_2297b4e339e405ca129849a1e2130aabcddc21008567fb31a0d0590b7e2f40cb : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p (fun x12 : set => True) HomSet lam_id (fun x12 x13 x14 : set => lam_comp x12) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_b89e3967a5c3d507a04eb70fb2dec2dc464e0e30b824990a36892573b7bd98c0 : omega :e UnivOf (UnivOf 0).
admit.
Qed.
Theorem missingprop_1603ee4b3f2553e39eff4707eef506f0c110a68b4dc6458f37f51ac053eea276 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p (fun x12 : set => x12 :e UnivOf (UnivOf 0)) HomSet lam_id (fun x12 x13 x14 : set => lam_comp x12) x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
