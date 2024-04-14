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
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Axiom pair_tuple_fun : setsum = (fun x1 x2 : set => lam 2 (fun x3 : set => If_i (x3 = 0) x1 x2)).
Axiom tupleI0 : (forall x0 x1 x2, x2 :e x0 -> lam 2 (fun x3 : set => If_i (x3 = 0) 0 x2) :e lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)).
Theorem missingprop_23bdf2db675ee76d4aebbf91805a1a14ae78d57fab3a5ac23a472e431a816ffd : (forall x0 x1 x2, x2 :e x0 -> lam 2 (fun x3 : set => If_i (x3 = 0) 0 x2) :e setsum x0 x1).
admit.
Qed.
Axiom tupleI1 : (forall x0 x1 x2, x2 :e x1 -> lam 2 (fun x3 : set => If_i (x3 = 0) 1 x2) :e lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)).
Theorem missingprop_997672a141b90a927246a9d6aa700d384cdfdb23c7d9ecc37deb251190465d3f : (forall x0 x1 x2, x2 :e x1 -> lam 2 (fun x3 : set => If_i (x3 = 0) 1 x2) :e setsum x0 x1).
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom Pi_cod_mon : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 c= x2 x3) -> Pi x0 x1 c= Pi x0 x2).
Theorem missingprop_0bf330dc795f95138b168f53efa15fd956d4a1128caa54db6b8ec6b98192c4b7 : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Pi x0 x1 = Pi x0 x2).
admit.
Qed.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
Definition MetaCat_product_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x6 x4 x7)) (Hom x6 x5 x8)) (forall x10, Obj x10 -> (forall x11 x12, Hom x10 x4 x11 -> Hom x10 x5 x12 -> and (and (and (Hom x10 x6 (x9 x10 x11 x12)) (Comp x10 x6 x4 x7 (x9 x10 x11 x12) = x11)) (Comp x10 x6 x5 x8 (x9 x10 x11 x12) = x12)) (forall x13, Hom x10 x6 x13 -> Comp x10 x6 x4 x7 x13 = x11 -> Comp x10 x6 x5 x8 x13 = x12 -> x13 = x9 x10 x11 x12)))).
Definition MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => forall x8 x9, Obj x8 -> Obj x9 -> MetaCat_product_p Obj Hom Id Comp x8 x9 (x4 x8 x9) (x5 x8 x9) (x6 x8 x9) (x7 x8 x9)).
Definition MetaCat_exp_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 x10 x11 : set => fun x12 : set -> set -> set => and (and (and (and (Obj x8) (Obj x9)) (Obj x10)) (Hom (x4 x10 x8) x9 x11)) (forall x13, Obj x13 -> (forall x14, Hom (x4 x13 x8) x9 x14 -> and (and (Hom x13 x10 (x12 x13 x14)) (Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 (x12 x13 x14) (x5 x13 x8)) (x6 x13 x8)) = x14)) (forall x15, Hom x13 x10 x15 -> Comp (x4 x13 x8) (x4 x10 x8) x9 x11 (x7 x10 x8 (x4 x13 x8) (Comp (x4 x13 x8) x13 x10 x15 (x5 x13 x8)) (x6 x13 x8)) = x14 -> x15 = x12 x13 x14)))).
Definition MetaCat_exp_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> set -> set -> set => and (MetaCat_product_constr_p Obj Hom Id Comp x4 x5 x6 x7) (forall x11 x12, Obj x11 -> Obj x12 -> MetaCat_exp_p Obj Hom Id Comp x4 x5 x6 x7 x11 x12 (x8 x11 x12) (x9 x11 x12) (x10 x11 x12))).
Definition HomSet : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => x2 :e setexp x1 x0).
(* Parameter lam_id "00e0580a8881b84ea1ef7f67247f59ec145448a850064052345ecd4ecb637071" "6271864c471837aeded4c4e7dc37b9735f9fc4828a34ac9c7979945da815a3c7" *)
Parameter lam_id : set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom tuple_2_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e lam x0 x1)).
Theorem missingprop_f79156a8a8181d804009ef1c91f092c4dd0063005b2881d8f761de04759e3ce6 : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setprod x1 x2))) -> (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setexp x2 x1))) -> MetaCat_exp_constr_p x0 HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) setprod (fun x1 x2 : set => lam (setprod x1 x2) (fun x3 : set => ap x3 0)) (fun x1 x2 : set => lam (setprod x1 x2) (fun x3 : set => ap x3 1)) (fun x1 x2 x3 x4 x5 : set => lam x3 (fun x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (ap x4 x6) (ap x5 x6)))) (fun x1 x2 : set => setexp x2 x1) (fun x1 x2 : set => lam (setprod (setexp x2 x1) x1) (fun x3 : set => ap (ap x3 0) (ap x3 1))) (fun x1 x2 x3 x4 : set => lam x3 (fun x5 : set => lam x1 (fun x6 : set => ap x4 (lam 2 (fun x7 : set => If_i (x7 = 0) x5 x6)))))).
admit.
Qed.
Theorem missingprop_d378b2c894939b96acaefeb7b90d3a62ba779e2a2ea4390f7801c59b07291ce2 : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setprod x1 x2))) -> (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setexp x2 x1))) -> (forall x1 : prop, (forall x2 : set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set, (forall x9 : prop, (forall x10 : set -> set -> set, (forall x11 : prop, (forall x12 : set -> set -> set, (forall x13 : prop, (forall x14 : set -> set -> set -> set -> set, MetaCat_exp_constr_p x0 HomSet lam_id (fun x15 x16 x17 : set => lam_comp x15) x2 x4 x6 x8 x10 x12 x14 -> x13) -> x13) -> x11) -> x11) -> x9) -> x9) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Definition True : prop :=
 (forall x0 : prop, x0 -> x0).
Axiom TrueI : True.
Theorem missingprop_72326fe987962eb659f799cf742a48bbc311f148390659a19e6928a628a05b6e : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p (fun x14 : set => True) HomSet lam_id (fun x14 x15 x16 : set => lam_comp x14) x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter TransSet "e7493d5f5a73b6cb40310f6fcb87d02b2965921a25ab96d312adf7eb8157e4b3" "538bb76a522dc0736106c2b620bfc2d628d5ec8a27fe62fc505e3a0cdb60a5a2" *)
Parameter TransSet : set -> prop.
(* Parameter ZF_closed "43f34d6a2314b56cb12bf5cf84f271f3f02a3e68417b09404cc73152523dbfa0" "1bd4aa0ec0b5e627dce9a8a1ddae929e58109ccbb6f4bb3d08614abf740280c0" *)
Parameter ZF_closed : set -> prop.
Axiom missingprop_2485261293fc9246221e480807168b56c614ccc7ff1e05b547a7c25cb11fc16e : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> setexp x2 x1 :e x0))).
Axiom UnivOf_TransSet : (forall x0, TransSet (UnivOf x0)).
Axiom UnivOf_ZF_closed : (forall x0, ZF_closed (UnivOf x0)).
Axiom missingprop_168889ac2767512e36c59c4d8bc32e41d805ce681fce6d41f1fc82bd258fd1a7 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> setprod x1 x2 :e x0))).
Theorem missingprop_b7e68ee3fbd854b4362073782cebc40794acd2345c159d6e75dc2e77b6d28f47 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p (fun x14 : set => x14 :e UnivOf 0) HomSet lam_id (fun x14 x15 x16 : set => lam_comp x14) x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
