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
(* Parameter ChurchNum_3ary_proj_p "78818644393f655899ed66a6ea1895888ada3b8d13ff9c597d58fa85a63bf0f6" "7456b6c71eb4ddcebbca14f4614c76d44aff25ab9cffb2ae54f53cc5f4f73fab" *)
Parameter ChurchNum_3ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop.
(* Parameter ChurchNum_8ary_proj_p "b8834674a20323fbc2d5825fbc6a8f71f60ca89b2847624a5b6872e9c48e11d4" "a77aece4cebaf8d8bb332a4fb87637d997f5b502af1a67214219293f72df800a" *)
Parameter ChurchNum_8ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop.
(* Parameter TwoRamseyGraph_4_5_24_ChurchNums_3x8 "f4473533e314bd79e52e2ad034f93ae6514ae52d8d531b25e6164bae6fd82270" "f15783baeb7e85a1ff545f53d5ddb4c43d32933da197ebc12c53bd1d42508ff9" *)
Parameter TwoRamseyGraph_4_5_24_ChurchNums_3x8 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Definition u5 : set :=
 ordsucc u4.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition False : prop :=
 (forall x0 : prop, x0).
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Definition u6 : set :=
 ordsucc u5.
Definition u7 : set :=
 ordsucc u6.
Definition u8 : set :=
 ordsucc u7.
Definition u9 : set :=
 ordsucc u8.
Definition u10 : set :=
 ordsucc u9.
Definition u11 : set :=
 ordsucc u10.
Definition u12 : set :=
 ordsucc u11.
Definition u13 : set :=
 ordsucc u12.
Definition u14 : set :=
 ordsucc u13.
Definition u15 : set :=
 ordsucc u14.
Definition u16 : set :=
 ordsucc u15.
Definition u17 : set :=
 ordsucc u16.
Definition u18 : set :=
 ordsucc u17.
Definition u19 : set :=
 ordsucc u18.
Definition u20 : set :=
 ordsucc u19.
Definition u21 : set :=
 ordsucc u20.
Definition u22 : set :=
 ordsucc u21.
Definition u23 : set :=
 ordsucc u22.
Definition u24 : set :=
 ordsucc u23.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom missingprop_a7f3578ada9cacf1cb3296f5290d2c691e8a6f96bb11bbe9193ef025e25fc69a : nat_p u24.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Definition u25 : set :=
 ordsucc u24.
Axiom missingprop_cb31ba5b53de7ed1501ccb7838b0596c4806363c08f052d879d991759ac7d059 : mul_nat u5 u5 = u25.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom missingprop_0ff18b7eb504eb7c264f5ad42462c21af832d47f1fcbedf3de67bfbc10c7fdfc : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> equip (mul_nat x0 x1) (setprod x0 x1))).
Axiom nat_5 : nat_p 5.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom cases_5 : (forall x0, x0 :e 5 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 x0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom In_4_5 : 4 :e 5.
Axiom In_3_5 : 3 :e 5.
Axiom In_2_5 : 2 :e 5.
Axiom In_1_5 : 1 :e 5.
Axiom In_0_5 : 0 :e 5.
Theorem missingprop_0ae8d5ca00fc2f65a935bac5830251a0aebf5f21f6803338547a3116d4b15f14 : (forall x0 x1 x2 x3 x4 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x5 x6 x7 x8 x9 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_3ary_proj_p x2 -> ChurchNum_3ary_proj_p x3 -> ChurchNum_3ary_proj_p x4 -> ChurchNum_8ary_proj_p x5 -> ChurchNum_8ary_proj_p x6 -> ChurchNum_8ary_proj_p x7 -> ChurchNum_8ary_proj_p x8 -> ChurchNum_8ary_proj_p x9 -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x1 x6 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x2 x7 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x3 x8 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x4 x9 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x6 x2 x7 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x6 x3 x8 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x6 x4 x9 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x2 x7 x3 x8 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x2 x7 x4 x9 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x3 x8 x4 x9 = (fun x11 x12 : set => x12) -> (forall x10, (forall x11, x11 :e u5 -> (forall x12, x12 :e u5 -> ap (ap x10 x11) x12 :e 24)) -> (forall x11, x11 :e u5 -> (forall x12, x12 :e u5 -> (forall x13, x13 :e u5 -> ap (ap x10 x11) x12 = ap (ap x10 x11) x13 -> x12 = x13))) -> (forall x11, x11 :e u5 -> (forall x12, x12 :e u5 -> (x11 = x12 -> (forall x13 : prop, x13)) -> (forall x13, x13 :e u5 -> (forall x14, x14 :e u5 -> ap (ap x10 x11) x13 = ap (ap x10 x12) x14 -> (forall x15 : prop, x15))))) -> False)).
admit.
Qed.
(* Parameter ChurchNums_3x8_to_u24 "73ee7ba9707457f40d011b81c7652140f63595c4412ae3e192184cad52938e9e" "78a3304952070979d83ccc1dcdd6a714eaa8a23528a717619f46db81dab1b370" *)
Parameter ChurchNums_3x8_to_u24 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> set.
(* Parameter ChurchNums_8x3_to_3_lt7_id_ge7_rot2 "8ed37c1af3aa4c34701bdc05dc70d9cff872020ede24370792b71aafc1a4c346" "344c04a8dc99cbd652cc7bb39079338374d367179e2b0a8ef0f259d7f24cecbf" *)
Parameter ChurchNums_8x3_to_3_lt7_id_ge7_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set.
(* Parameter ChurchNums_8_perm_1_2_3_4_5_6_7_0 "587ac67fa53cfb7918e883326c97d406c8dcb17938eed2ad92b4e5cb4a1b88aa" "23993eac63f1f42057c0efc20dd50b3e0b0121cccf3b7ad419eacb85ac09a4d4" *)
Parameter ChurchNums_8_perm_1_2_3_4_5_6_7_0 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set.
(* Parameter ChurchNums_8x3_to_3_lt6_id_ge6_rot2 "656fb5759c216079c715bdde6aae12d605d2cdb4674ee7d6acf5fb7e80a7215c" "953e3e515ad08a798e7b709ccd8b0b0b72bef9885b73df52b282277033ff10b7" *)
Parameter ChurchNums_8x3_to_3_lt6_id_ge6_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set.
(* Parameter ChurchNums_8_perm_2_3_4_5_6_7_0_1 "6e82609d929cbf65d37ac5c9a63327bfc218bf48484ccd1c1a92959708684c1f" "471876e0ce0238e7e357dc909e9edc26836fc98c4a9d31c4a5dca4903c33f243" *)
Parameter ChurchNums_8_perm_2_3_4_5_6_7_0_1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set.
(* Parameter ChurchNums_8x3_to_3_lt5_id_ge5_rot2 "0a3ef2ada763be6ad4715f754378644a116f0425cc512cca42d557bef370bc82" "8df5963f09ee56878fcd1721c2a6b6d85923ec76837de3fcb1475b38e7950836" *)
Parameter ChurchNums_8x3_to_3_lt5_id_ge5_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set.
(* Parameter ChurchNums_8_perm_3_4_5_6_7_0_1_2 "3bb85a0e759e20dfb0ccbf91dc0e4a0cc2ae61cef5f0cf348e012d671b9c6851" "5723e1bd9769bdc20e653c6593cab5981c06326be07adf7b67065825803f072d" *)
Parameter ChurchNums_8_perm_3_4_5_6_7_0_1_2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set.
(* Parameter ChurchNums_8x3_to_3_lt4_id_ge4_rot2 "b17eb6af7aa4617931c9615a7364c3569b31f15b8b2be887e7fdf9badc8233aa" "21043bfe96f4dd260d43acf312ddc620d72380bb200d8964d2e48ed20d24a035" *)
Parameter ChurchNums_8x3_to_3_lt4_id_ge4_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set.
(* Parameter ChurchNums_8_perm_4_5_6_7_0_1_2_3 "bcab47b2b3d713d80a55ef4b19ca509fea59a061bd4003d15c0d26c951ab04f9" "4ddf969f8959eaa958bf7ffd170b5c201116b0dede4e32eb7f39735e9d390d37" *)
Parameter ChurchNums_8_perm_4_5_6_7_0_1_2_3 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom tuple_5_1_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1) x1 -> x5 x1 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1)).
Axiom tuple_5_0_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0) x0 -> x5 x0 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0)).
Axiom missingprop_e650343e0ce664637e5e811b24d9b4a04e4324947c80e404b88e14219576f1ae : (forall x0 x1 x2 x3 x4 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x5 x6 x7 x8 x9 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x5 -> x1 = ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x5 x0 -> x6 = ChurchNums_8_perm_3_4_5_6_7_0_1_2 x5 -> ChurchNum_3ary_proj_p x2 -> ChurchNum_3ary_proj_p x3 -> ChurchNum_3ary_proj_p x4 -> ChurchNum_8ary_proj_p x7 -> ChurchNum_8ary_proj_p x8 -> ChurchNum_8ary_proj_p x9 -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x2 x7 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x3 x8 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x4 x9 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x6 x2 x7 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x6 x3 x8 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x6 x4 x9 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x2 x7 x3 x8 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x2 x7 x4 x9 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x3 x8 x4 x9 = (fun x11 x12 : set => x12) -> False).
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom tuple_5_2_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2) x2 -> x5 x2 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2)).
Axiom cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
Axiom tuple_5_3_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3) x3 -> x5 x3 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3)).
Axiom cases_4 : (forall x0, x0 :e 4 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 x0)).
Axiom tuple_5_4_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4) x4 -> x5 x4 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4)).
Axiom missingprop_181a8ee5dd2d442dca537df686e4f4d3c055613608d0b734890d85952682b94f : (forall x0 x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x2 x3 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_8ary_proj_p x2 -> ChurchNum_8ary_proj_p x3 -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x2 x1 x3 = TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x3 x0 x2).
Axiom missingprop_90bc63482d3a819c6e087783aee21f3e1234bcffda10fff22d476dd35e7dd23e : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 x0 x1 :e u24).
Axiom missingprop_2eb24842eca1af01a473a7d70b456a32088af46ce59a955c3e1171fe5453acfe : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_3ary_proj_p (ChurchNums_8x3_to_3_lt4_id_ge4_rot2 x0 x1)).
Axiom missingprop_0eb3496ff031982dfcd5abc5bf174762796e7c83210d20f8bb4ebc7eda4e83af : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_8ary_proj_p (ChurchNums_8_perm_4_5_6_7_0_1_2_3 x0)).
Axiom missingprop_ba84a7f1e1da990c89c7b4a20e0c8ea3784f3072fd4d4532a9187e6eebf57222 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_3ary_proj_p (ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x0 x1)).
Axiom missingprop_7755de1b07fa829360026c1a038955e26e3aa4728904dec248e0cd71e05130fb : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_8ary_proj_p (ChurchNums_8_perm_3_4_5_6_7_0_1_2 x0)).
Axiom missingprop_0d5b6abb690da1bfb2910016e873b25c0d313c178c63dbb27e086d5dce1d84b1 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_3ary_proj_p (ChurchNums_8x3_to_3_lt6_id_ge6_rot2 x0 x1)).
Axiom missingprop_b867480bec40f9756d98199319d912522f64381821c17cbb7b81d04e4e7deb1a : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_8ary_proj_p (ChurchNums_8_perm_2_3_4_5_6_7_0_1 x0)).
Axiom missingprop_4107128783ea5c7f56a1519fc9bb83c8edb1c1e721513a60c455c40b3b3ed869 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_3ary_proj_p (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x0 x1)).
Axiom missingprop_5ffaa314d96dd7e0a2f1f62c415fb19c4c4ef09466bee829c3516acc2a1fb18c : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_8ary_proj_p (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x0)).
Theorem missingprop_39301bd614c212adbaebf467cd0b807c24c84feb4d0124878a6e71219c59eaba : (forall x0 x1 x2 x3 x4 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x5 x6 x7 x8 x9 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_3ary_proj_p x2 -> ChurchNum_3ary_proj_p x3 -> ChurchNum_3ary_proj_p x4 -> ChurchNum_8ary_proj_p x5 -> ChurchNum_8ary_proj_p x6 -> ChurchNum_8ary_proj_p x7 -> ChurchNum_8ary_proj_p x8 -> ChurchNum_8ary_proj_p x9 -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x1 x6 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x2 x7 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x3 x8 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x0 x5 x4 x9 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x6 x2 x7 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x6 x3 x8 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x1 x6 x4 x9 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x2 x7 x3 x8 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x2 x7 x4 x9 = (fun x11 x12 : set => x12) -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x3 x8 x4 x9 = (fun x11 x12 : set => x12) -> (forall x10 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> set, (forall x11 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x12 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x13 : set -> set -> prop, x13 (ap (x10 x11 x12) 0) (ChurchNums_3x8_to_u24 x11 x12) -> x13 (ChurchNums_3x8_to_u24 x11 x12) (ap (x10 x11 x12) 0)) -> (forall x11 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x12 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x13 : set -> set -> prop, x13 (ap (x10 x11 x12) u1) (ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x12 x11) (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x12)) -> x13 (ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x12 x11) (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x12)) (ap (x10 x11 x12) u1)) -> (forall x11 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x12 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x13 : set -> set -> prop, x13 (ap (x10 x11 x12) u2) (ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt6_id_ge6_rot2 x12 x11) (ChurchNums_8_perm_2_3_4_5_6_7_0_1 x12)) -> x13 (ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt6_id_ge6_rot2 x12 x11) (ChurchNums_8_perm_2_3_4_5_6_7_0_1 x12)) (ap (x10 x11 x12) u2)) -> (forall x11 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x12 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x13 : set -> set -> prop, x13 (ap (x10 x11 x12) u3) (ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x12 x11) (ChurchNums_8_perm_3_4_5_6_7_0_1_2 x12)) -> x13 (ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x12 x11) (ChurchNums_8_perm_3_4_5_6_7_0_1_2 x12)) (ap (x10 x11 x12) u3)) -> (forall x11 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x12 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x13 : set -> set -> prop, x13 (ap (x10 x11 x12) u4) (ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt4_id_ge4_rot2 x12 x11) (ChurchNums_8_perm_4_5_6_7_0_1_2_3 x12)) -> x13 (ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt4_id_ge4_rot2 x12 x11) (ChurchNums_8_perm_4_5_6_7_0_1_2_3 x12)) (ap (x10 x11 x12) u4)) -> (forall x11 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x12 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x11 -> ChurchNum_8ary_proj_p x12 -> (forall x13, x13 :e u5 -> (forall x14, x14 :e u5 -> ap (x10 x11 x12) x13 = ap (x10 x11 x12) x14 -> x13 = x14))) -> (forall x11 x12 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x13 x14 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x11 -> ChurchNum_8ary_proj_p x13 -> ChurchNum_3ary_proj_p x12 -> ChurchNum_8ary_proj_p x14 -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 x11 x13 x12 x14 = (fun x16 x17 : set => x17) -> (forall x15, x15 :e u5 -> (forall x16, x16 :e u5 -> ap (x10 x11 x13) x15 = ap (x10 x12 x14) x16 -> (forall x17 : prop, (x12 = ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x13 x11 -> x14 = ChurchNums_8_perm_3_4_5_6_7_0_1_2 x13 -> x17) -> (x11 = ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x14 x12 -> x13 = ChurchNums_8_perm_3_4_5_6_7_0_1_2 x14 -> x17) -> x17)))) -> False)).
admit.
Qed.
