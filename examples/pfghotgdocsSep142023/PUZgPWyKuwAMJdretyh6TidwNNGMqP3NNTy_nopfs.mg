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
Definition ChurchNum_8ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => forall x1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x9) -> x1 x0).
Definition ChurchNum_3ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => forall x1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x2) -> x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x3) -> x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x4) -> x1 x0).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition ChurchNums_3x8_to_u24 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => x0 (x1 (fun x2 : set -> set => fun x3 : set => x3) (fun x2 : set -> set => x2) (fun x2 : set -> set => fun x3 : set => x2 (x2 x3)) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 x3))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 x3)))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 x3))))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 (x2 x3)))))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 (x2 (x2 x3)))))))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x1 (fun x4 : set -> set => fun x5 : set => x5) (fun x4 : set -> set => x4) (fun x4 : set -> set => fun x5 : set => x4 (x4 x5)) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 x5))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 x5)))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 x5))))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 (x4 x5)))))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 (x4 (x4 x5))))))) x2 x3))))))))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x1 (fun x4 : set -> set => fun x5 : set => x5) (fun x4 : set -> set => x4) (fun x4 : set -> set => fun x5 : set => x4 (x4 x5)) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 x5))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 x5)))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 x5))))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 (x4 x5)))))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 (x4 (x4 x5))))))) x2 x3))))))))))))))))) ordsucc 0).
Definition ChurchNums_8x3_to_3_lt4_id_ge4_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x2 x3 x4 : (set -> set) -> set -> set => x0 (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x3 x4 x2) (x1 x3 x4 x2) (x1 x3 x4 x2) (x1 x3 x4 x2)).
Definition ChurchNums_8_perm_4_5_6_7_0_1_2_3 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 : (set -> set) -> set -> set => x0 x5 x6 x7 x8 x1 x2 x3 x4).
Definition ChurchNums_8x3_to_3_lt7_id_ge7_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x2 x3 x4 : (set -> set) -> set -> set => x0 (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x3 x4 x2)).
Definition ChurchNums_8_perm_1_2_3_4_5_6_7_0 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 : (set -> set) -> set -> set => x0 x2 x3 x4 x5 x6 x7 x8 x1).
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
Definition ChurchNums_8x3_to_3_lt5_id_ge5_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x2 x3 x4 : (set -> set) -> set -> set => x0 (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x3 x4 x2) (x1 x3 x4 x2) (x1 x3 x4 x2)).
Definition ChurchNums_8_perm_3_4_5_6_7_0_1_2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 : (set -> set) -> set -> set => x0 x4 x5 x6 x7 x8 x1 x2 x3).
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Axiom neq_4_1 : u4 = u1 -> (forall x0 : prop, x0).
Axiom neq_4_2 : u4 = u2 -> (forall x0 : prop, x0).
Axiom neq_4_3 : u4 = u3 -> (forall x0 : prop, x0).
Definition u5 : set :=
 ordsucc u4.
Axiom neq_5_4 : u5 = u4 -> (forall x0 : prop, x0).
Definition u6 : set :=
 ordsucc u5.
Axiom neq_6_4 : u6 = u4 -> (forall x0 : prop, x0).
Definition u7 : set :=
 ordsucc u6.
Axiom neq_7_4 : u7 = u4 -> (forall x0 : prop, x0).
Definition u8 : set :=
 ordsucc u7.
Axiom neq_8_4 : u8 = u4 -> (forall x0 : prop, x0).
Definition u9 : set :=
 ordsucc u8.
Axiom neq_9_4 : u9 = u4 -> (forall x0 : prop, x0).
Definition u10 : set :=
 ordsucc u9.
Axiom missingprop_ccc1fa6cae49dec573eda0a7cb35b2ad4debf37b10463565ebc6d1385353f388 : u10 = u4 -> (forall x0 : prop, x0).
Definition u11 : set :=
 ordsucc u10.
Axiom missingprop_a386dcc739aba4ef656c3a82802ebcbe7e87dae1ec14c96538c3fd461f6a0883 : u11 = u4 -> (forall x0 : prop, x0).
Definition u12 : set :=
 ordsucc u11.
Axiom missingprop_0aa1897333a9220b7c647af2a5a102d331686166cd7d81d697467978bffb14b8 : u12 = u4 -> (forall x0 : prop, x0).
Definition u13 : set :=
 ordsucc u12.
Axiom missingprop_0b3e3e45ef080c7b7a49c00c4067713ad08b47ab8b0713e5aaab56e6d7a5b982 : u13 = u4 -> (forall x0 : prop, x0).
Definition u14 : set :=
 ordsucc u13.
Axiom missingprop_5c17fff000510475687b445d243a8658952ee19ef7f469feb3e238dfb5022180 : u14 = u4 -> (forall x0 : prop, x0).
Definition u15 : set :=
 ordsucc u14.
Axiom missingprop_a504807aba1f063c619c47c7790e6a97b78d6221a696d3a06eab792e3bc4d832 : u15 = u4 -> (forall x0 : prop, x0).
Definition u16 : set :=
 ordsucc u15.
Axiom missingprop_0cb59343f7ca2c0440165ef2670fd7644d9775c5a4a86baf53d90bca3bd63cc9 : u16 = u4 -> (forall x0 : prop, x0).
Definition u17 : set :=
 ordsucc u16.
Axiom missingprop_38e0b36ff0df3d6b667701d4ef47c86c5e393d438215664e91e75aa95d5e54b0 : u17 = u4 -> (forall x0 : prop, x0).
Definition u18 : set :=
 ordsucc u17.
Axiom missingprop_7a2a7d79f58f1a8ab2a9c85b1353d3c76c2bde99aca8f458ec796bdb22fd6792 : u18 = u4 -> (forall x0 : prop, x0).
Definition u19 : set :=
 ordsucc u18.
Axiom missingprop_7cef4da175a1a28f6d93e755ff21bf5c4f572cedc33b9a9449f114cf5e596796 : u19 = u4 -> (forall x0 : prop, x0).
Definition u20 : set :=
 ordsucc u19.
Axiom missingprop_617ded5945d02521c4f1fa7542987fa17505128e7afceb8852fff1bc6624651f : u20 = u4 -> (forall x0 : prop, x0).
Definition u21 : set :=
 ordsucc u20.
Axiom missingprop_910ea61894799bfdae8ca9f717f476c6d5bfd6d7e489370036cabbd2c53ceaa0 : u21 = u4 -> (forall x0 : prop, x0).
Definition u22 : set :=
 ordsucc u21.
Axiom missingprop_b14270c6e356f8504a4450c57fb8502917b12328f75898e11efb35b8d4f61ae2 : u22 = u4 -> (forall x0 : prop, x0).
Definition u23 : set :=
 ordsucc u22.
Axiom missingprop_94d90abb2e4f8def35ed3e9c49d7f5a2823da9f3a93b02b69864d66cdd4e562f : u23 = u4 -> (forall x0 : prop, x0).
Axiom neq_4_0 : u4 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_1 : u5 = u1 -> (forall x0 : prop, x0).
Axiom neq_5_2 : u5 = u2 -> (forall x0 : prop, x0).
Axiom neq_5_3 : u5 = u3 -> (forall x0 : prop, x0).
Axiom neq_6_5 : u6 = u5 -> (forall x0 : prop, x0).
Axiom neq_7_5 : u7 = u5 -> (forall x0 : prop, x0).
Axiom neq_8_5 : u8 = u5 -> (forall x0 : prop, x0).
Axiom neq_9_5 : u9 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_1a168a095e76e59ad83d93a60c30f2a4b23a38b25f72b379498ed6c0a6728b15 : u10 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_7ad531d6eaae09cf142317793b067ab02fe09b619a36a2cbc6f0876a1fd1ba74 : u11 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_01c5167c045808e88e705b476ce2dd0e57d03d1d5f6a26f61825a32395c242ea : u12 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_708a12eb026e4d3c08fc829f55688c54d28c54b0af95cbb973e74a0d726eddda : u13 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_8e078aa58d96c679c691026d3dbd3c5ddf82d7052472d7ebfc54e4b027091692 : u14 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_6be75df4f14c9bfa3abf6ed370fc5224c8cd92769e2571dbc7f3e2b0899c3f2a : u15 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_ca26de1b59c322d42d6f3d7e731e4e561915afe66882738ab608ff1268374915 : u16 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_59d0e14977704774062693c254c6ccfc80426c45e29c2388a3b7f1ee2fe268d9 : u17 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_d83dad648efc18d38402e1c2bed2c4218fb94161d6f09d73e65dd826ebcdade1 : u18 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_0dd50f4d116b52218f20eed44696e4dc1eb1af8c398cff0ede31c8f12b1df7cb : u19 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_16d3859a968c41b5d7a6a72b19fbdd2fc41293fd397b17f2f0d866514da73a4d : u20 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_474678d10c6651308785c425ec0f4ec4fae0ba2b89c92c45cc5b34f72aa4bcfa : u21 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_925dd8e943cc0c8ff15733ac2c293a4432f654b493287cbdde052cbeb2cc4407 : u22 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_32e04f4ae4f17c71c444b04526b8428b323e4d7824387ab7a39d84b38543d04d : u23 = u5 -> (forall x0 : prop, x0).
Axiom neq_5_0 : u5 = 0 -> (forall x0 : prop, x0).
Axiom neq_6_1 : u6 = u1 -> (forall x0 : prop, x0).
Axiom neq_6_2 : u6 = u2 -> (forall x0 : prop, x0).
Axiom neq_6_3 : u6 = u3 -> (forall x0 : prop, x0).
Axiom neq_7_6 : u7 = u6 -> (forall x0 : prop, x0).
Axiom neq_8_6 : u8 = u6 -> (forall x0 : prop, x0).
Axiom neq_9_6 : u9 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_1caafcfab421a8bbf73edb3267db1f6908bd5029c181663700c5c637b54bb883 : u10 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_a218356df980789875659155b1ed2b3563be2916e1184b396ad2583b0b523a18 : u11 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_3de237895f633cd0c01630052cea1ce37b395b2138c60358b21cdd63976e7e77 : u12 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_10123744e9181acb5f4770c4e7c8d274437210700731399dc702b025f786eb1e : u13 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_521d57c2f7a8a26330ae69c04fff1b24cc86e4837a4836a4fefa73fad1a725cc : u14 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_6163c724a9d7981c89b6bf365a0bebe9efec08b9eff4bb6184424f2ae3577228 : u15 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_d390a940e0d8b8c681ccbf6c46f5374ccc304295ccc2cd1522dd66f6c32997a7 : u16 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_85b2adc94c49bab8c1d22cc2a4a0b91d88be95ce8e4a8f670459b5e66783cdc8 : u17 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_bfa78384ac30acdfb4ec29b6c82e28746fbf661532a214abaa8063172ead9db8 : u18 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_597c22e2aab3a6e2ffbdc7fe889a854131926294e9275de243b6522178c570b6 : u19 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_8e0ae80abde104b2158032c1bd706d90d9be4907040682846c5ec08e754649e9 : u20 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_b0b253a23221775c0895b3df81870aa85de69fe16667385e39307bb1011c4b25 : u21 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_b998e83fd732a075c67f08f28f38284301bacc47da5d14e18c44e74250b8af33 : u22 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_f180f489d6967f08b885b67e856ec9aa31688bdf1d36c49ea82b0d284dc4541d : u23 = u6 -> (forall x0 : prop, x0).
Axiom neq_6_0 : u6 = 0 -> (forall x0 : prop, x0).
Axiom neq_7_1 : u7 = u1 -> (forall x0 : prop, x0).
Axiom neq_7_2 : u7 = u2 -> (forall x0 : prop, x0).
Axiom neq_7_3 : u7 = u3 -> (forall x0 : prop, x0).
Axiom neq_8_7 : u8 = u7 -> (forall x0 : prop, x0).
Axiom neq_9_7 : u9 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_f90d6a14135c76785343d196a602714aaebc8f848035cb3fc7d99e4a8069fa52 : u10 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_10a35d241244d98b266514a8fe38926cbcc9f4c51c46fbe5923bab64f9db063e : u11 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_944319b563f360f8276cf6ed579bfd97549280496ef3a59878dc7367e0289497 : u12 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_128d4a775d786f77bf13bb7dd7cb9742308ad661f9914b0ba314109642dc74a2 : u13 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_6b6d879f9198c0f8972b1370a6b60ca474de18dcfd00d1cbe42fb36343cfa178 : u14 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_03bfa5a110b404de8380cbf91407efa16bc92e74bb78c456f8556ff689d59c2c : u15 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_a0bdf0079e7b1581b89ab957e2cd7f488793d97d1d94621d3aa6a4fac9f22b96 : u16 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_3c9a2120714f6700d4a7aaab84df2b3570d7b0bac6641e679a646725f1f1cb75 : u17 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_a87a3028f64709be51c5175d14a7642f5bef9d6fb8552482a68d3b5ad1bb9fc7 : u18 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_16ed18176d2f3b371c0649663a9aa610541baf2b5992183b45e2862c0cca0895 : u19 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_1da364b9799c552ea62d37691fe41f39149eeb259e0f35cf2ce732f0b9a775c4 : u20 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_dde3231b90d94ea6cf99454dc2e9899d7655e810c32260432b6ef45d9b585e7d : u21 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_a2542908abdf53f904b6e5f9152b60e61b8a2f2253a62977330437aba06869fc : u22 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_65b2d9f8447f26f98a13ecedfc75c7bfeb12f78009a508fb3b6f9195edc138fd : u23 = u7 -> (forall x0 : prop, x0).
Axiom neq_7_0 : u7 = 0 -> (forall x0 : prop, x0).
Axiom neq_8_1 : u8 = u1 -> (forall x0 : prop, x0).
Axiom neq_8_2 : u8 = u2 -> (forall x0 : prop, x0).
Axiom neq_8_3 : u8 = u3 -> (forall x0 : prop, x0).
Axiom neq_9_8 : u9 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_00ce3e990e394696d648599b893a93cd3cb153c371b93008eddec6849fd2aaa9 : u10 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_e3e7876f64d57e7b4aae114d87715d9a64fc4129a1a28df53f278ae0d8499348 : u11 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_405ba169154d9d42445b73345355e3c1ff4a4c35ee248b0842bd8e1a26057bf4 : u12 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_e20a3f49533352fe1b05bebbb2ae624ad084f8a027d8217543b43ae55b811240 : u13 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_9cd8c17074dbeec0fef19f04ec8a941cf429e15b37b6046a94fab0afa09de770 : u14 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_85105fca2bacc886dc8c29d2893d8d6f48bf2df156b5c5ec0c4e6b02418bc580 : u15 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_14e13a8771031ad5c0fbcddcde043936c377ce19df59c8a5042720afd8292b32 : u16 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_027e16179ffa873e39aef19aef614c18046cbcf4d3543939e625bd021d996281 : u17 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_548faab671fbcbca5c8c96c40ed3ea4775dd638976a2683d16e484be5d3edb57 : u18 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_7e1998002f147e67b6c81ea460bfd50c546c68a418cf87ccb0a0af7cf4a5d049 : u19 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_9b7253bd274e82a0ab8a76f06b1d2af1490a86965b12d700a55a77d6121ae00f : u20 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_467cb22013b1262e120fb5c86902f981ac82ad72edd1fd87728ef896df8db79e : u21 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_4b3d420f7386068b1074ea2441fc8aeef970c26a7970933b539da3a194682160 : u22 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_bc86fd6357a8aeb21fb5fe4e713bf52143dbb0f763449e33a83169178586b74e : u23 = u8 -> (forall x0 : prop, x0).
Axiom neq_8_0 : u8 = 0 -> (forall x0 : prop, x0).
Axiom neq_9_1 : u9 = u1 -> (forall x0 : prop, x0).
Axiom neq_9_2 : u9 = u2 -> (forall x0 : prop, x0).
Axiom neq_9_3 : u9 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_36b306548a78300032c69ad94745ff48aa8608e8a430eca548c144b9c231bda4 : u10 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_eee73695077ff6070731183421778635002a71c030b9e35e65d114074acaa597 : u11 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_e9452875caa538a193e13eb1accc0d1d2221ffa1eb64478ef4b831d0c7fb8587 : u12 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_2f6e5b1338db3ff412e38a1ecfa4d466e2517777a8bbed02c867df317c357933 : u13 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_16378467aced8215056140af611424a7d8477e41af2c1f3af8bef49b9f0df0b7 : u14 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_a4ffe2c5c180b0a50257540c321c6d0ac174e6dcf67a517314fd5483733bd52b : u15 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_ce4f8ce5934f96e0a92d8234aa49fd2e8ec60a5807531af02b0c19b05dffb12a : u16 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_b4b3a0dfa06748759f5a505b09d8dd0c2a7429c04dab53e0f6653afd1b6dfda2 : u17 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_7cc4617dc6a7b9b7b4cec660f935312e4b995dbb2f6599889fcacbe5b8ec47f7 : u18 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_9825e8665431405b206ed8cedffeadeb2d4b2f428f40d25755c948a533f94754 : u19 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_ea953fbc75fa838e348c5988aed9a19630f1f44d6bc3fae8f7f1313a792e039a : u20 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_e77690fa902359d016a459a1dbae51c5afa3a53af050fe17e51251ebdc52f528 : u21 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_9ccfcb22d5d9d8693342f555c022b74c5fc462d926f3aae2fb26326609fc84b1 : u22 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_24039cdd5f48d58b81a9f1c8f708ada7473e5caa7189d4735a4c8130133c0a61 : u23 = u9 -> (forall x0 : prop, x0).
Axiom neq_9_0 : u9 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_a7fa19a834d529db93c1b2300b41b17f336102b7793b24e9a750d6e03dec690c : u10 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_5f3179724a6e8ef693da33b4da734e3c0d8d3295b89093b2f129371490f35854 : u10 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_155e8a92a8ae96b946418659d12b00e3fef62dadc1bc31d4f074bcb712786356 : u10 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_4ab2aef55b95fb08a1edd1a27d2fff79c4fc64f365bf3591ff27be743265541f : u11 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_a52e53b541a40078b90241258be0a0067f5bc813eb10693b9b961df0bbb05001 : u12 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_611c167b8d8d5c2c171ede951fd79aafcb1fd16fb816a3f0e5c0edff9bd7addf : u13 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_3e7054688acb8ba4a0f18423b649f383cf90ecfc4f6200e2e049d580ebc2dc1f : u14 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_c2d8fac90c753ba98b910dfebba93313752c3581721985e0c507115f57afbe2d : u15 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_728a499fa827f2373d0f5f59b334ba8b9cac6c83450172e25304b57de1e9058f : u16 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_188cfa634d7792bd8dc29273791ddd9c2cc6f62f72e402ad8af062f1bf4a9fe0 : u17 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_06cb0ea543f1131f3e8888a6c830beba57dd4d090b172cbec554e85157657538 : u18 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_b8f9d436cada92bb5706d58b3abdb2fdd8828ac9348fb88bbc431043cd38f19b : u19 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_4c44e9910de1ccdd79adf74018ddb18e905f381c61d9473af47382c1483f4394 : u20 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_4e08fb9268e7317e322f86bd0dde127d3b7b95da8719753d5c104a6982cc063e : u21 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_db48afe6d81cca8de5f9f48fe0446680943dac9826858fd3cbbf5e4280bafdcf : u22 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_9e6cdea540787e99cebc610658340827c0bf3b4820b1b40cd9790c67977dd4c4 : u23 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_871e92d1e015b90191f05be741b9ed2cc4491066cf0bf7b2d76c5d141ce801a4 : u10 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_da9cd2315b0ab3b3dbcd7c4069c6d07f8e8a7c3b5321d78acb9ddfea02c56e54 : u11 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_93bd155ae66f9293399dab321235e159c709aa50be6b4209e260d5c571069bc3 : u11 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_6c307483f1e9d79cbd1be8f99cb0623b215d2a96dd7ca22776b1132e2b377d33 : u11 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_dd600363d78f5191d99ddf5f03f668be69bef6f49770dc87b299c981791e709b : u12 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_0a910a83fae7c1219e51ae6f441b8120dc6f2353f129945859e5867a1d5c1be3 : u13 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_00afc3423aeef527fa52daa0e685caaf0adcec70a4145f09454ed0ecaf166b37 : u14 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_ee5d720135ac2a1e6675f04fc296d39836826d1754aace8d3d88db80c3a9bf7b : u15 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_47b0549db93ebcad72e3d90923d72379e5655902a485807edad02af70ddd3445 : u16 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_914edee65675f074ac22e4efdf62b56d906e2295ea6417cdabcb9106e39ee5b7 : u17 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_da971a7415a7263658d47e8afc4b6794d759a8c7957d4366d64b0d2d75db1ebf : u18 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_154a30b1ba8ed32508f5174ba5885dce8daae06cb35a638aeda5f521f1a436ed : u19 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_79d2fca345eda4af691531ad5682523df90b5c0b299e09c9d4285223605ce63c : u20 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_c6f79178ace284c233acbca2f2bfe44b665a0e85286917e8a76d1fb24d2247cb : u21 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_84eafe0d1b390e2c8ff6926ca29d0a2cfa95e4e3cceeadff53b06e532c7ee510 : u22 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_edc90758b6bceec12cd2852605ab6c0cf318cd2093fdeb237fe64673c166de16 : u23 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_363035042db213d82b8567e67d435ec9f0597b9e71631d1860566db3f413fe41 : u11 = 0 -> (forall x0 : prop, x0).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_7bea65489b9a4965499d3b965b74bf879a52239254ee12ba9cc342399ede9ad2 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 x2 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x1 -> ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x2 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt4_id_ge4_rot2 x1 (fun x4 x5 x6 : (set -> set) -> set -> set => x4)) (ChurchNums_8_perm_4_5_6_7_0_1_2_3 x1) = ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x2 x0) (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x2) -> and (x0 = ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x1 (fun x4 x5 x6 : (set -> set) -> set -> set => x4)) (x2 = ChurchNums_8_perm_3_4_5_6_7_0_1_2 x1)).
admit.
Qed.
