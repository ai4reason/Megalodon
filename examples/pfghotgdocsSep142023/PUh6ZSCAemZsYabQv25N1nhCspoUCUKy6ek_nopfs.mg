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
Definition ChurchNum_3ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => forall x1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x2) -> x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x3) -> x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x4) -> x1 x0).
Definition ChurchNum_8ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => forall x1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x9) -> x1 x0).
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
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
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
Axiom missingprop_59d0e14977704774062693c254c6ccfc80426c45e29c2388a3b7f1ee2fe268d9 : u17 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_d83dad648efc18d38402e1c2bed2c4218fb94161d6f09d73e65dd826ebcdade1 : u18 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_0dd50f4d116b52218f20eed44696e4dc1eb1af8c398cff0ede31c8f12b1df7cb : u19 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_16d3859a968c41b5d7a6a72b19fbdd2fc41293fd397b17f2f0d866514da73a4d : u20 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_474678d10c6651308785c425ec0f4ec4fae0ba2b89c92c45cc5b34f72aa4bcfa : u21 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_925dd8e943cc0c8ff15733ac2c293a4432f654b493287cbdde052cbeb2cc4407 : u22 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_32e04f4ae4f17c71c444b04526b8428b323e4d7824387ab7a39d84b38543d04d : u23 = u5 -> (forall x0 : prop, x0).
Axiom neq_5_0 : u5 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_85b2adc94c49bab8c1d22cc2a4a0b91d88be95ce8e4a8f670459b5e66783cdc8 : u17 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_bfa78384ac30acdfb4ec29b6c82e28746fbf661532a214abaa8063172ead9db8 : u18 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_597c22e2aab3a6e2ffbdc7fe889a854131926294e9275de243b6522178c570b6 : u19 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_8e0ae80abde104b2158032c1bd706d90d9be4907040682846c5ec08e754649e9 : u20 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_b0b253a23221775c0895b3df81870aa85de69fe16667385e39307bb1011c4b25 : u21 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_b998e83fd732a075c67f08f28f38284301bacc47da5d14e18c44e74250b8af33 : u22 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_f180f489d6967f08b885b67e856ec9aa31688bdf1d36c49ea82b0d284dc4541d : u23 = u6 -> (forall x0 : prop, x0).
Axiom neq_6_0 : u6 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_3c9a2120714f6700d4a7aaab84df2b3570d7b0bac6641e679a646725f1f1cb75 : u17 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_a87a3028f64709be51c5175d14a7642f5bef9d6fb8552482a68d3b5ad1bb9fc7 : u18 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_16ed18176d2f3b371c0649663a9aa610541baf2b5992183b45e2862c0cca0895 : u19 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_1da364b9799c552ea62d37691fe41f39149eeb259e0f35cf2ce732f0b9a775c4 : u20 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_dde3231b90d94ea6cf99454dc2e9899d7655e810c32260432b6ef45d9b585e7d : u21 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_a2542908abdf53f904b6e5f9152b60e61b8a2f2253a62977330437aba06869fc : u22 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_65b2d9f8447f26f98a13ecedfc75c7bfeb12f78009a508fb3b6f9195edc138fd : u23 = u7 -> (forall x0 : prop, x0).
Axiom neq_7_0 : u7 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_027e16179ffa873e39aef19aef614c18046cbcf4d3543939e625bd021d996281 : u17 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_548faab671fbcbca5c8c96c40ed3ea4775dd638976a2683d16e484be5d3edb57 : u18 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_7e1998002f147e67b6c81ea460bfd50c546c68a418cf87ccb0a0af7cf4a5d049 : u19 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_9b7253bd274e82a0ab8a76f06b1d2af1490a86965b12d700a55a77d6121ae00f : u20 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_467cb22013b1262e120fb5c86902f981ac82ad72edd1fd87728ef896df8db79e : u21 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_4b3d420f7386068b1074ea2441fc8aeef970c26a7970933b539da3a194682160 : u22 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_bc86fd6357a8aeb21fb5fe4e713bf52143dbb0f763449e33a83169178586b74e : u23 = u8 -> (forall x0 : prop, x0).
Axiom neq_8_0 : u8 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_b4b3a0dfa06748759f5a505b09d8dd0c2a7429c04dab53e0f6653afd1b6dfda2 : u17 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_7cc4617dc6a7b9b7b4cec660f935312e4b995dbb2f6599889fcacbe5b8ec47f7 : u18 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_9825e8665431405b206ed8cedffeadeb2d4b2f428f40d25755c948a533f94754 : u19 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_ea953fbc75fa838e348c5988aed9a19630f1f44d6bc3fae8f7f1313a792e039a : u20 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_e77690fa902359d016a459a1dbae51c5afa3a53af050fe17e51251ebdc52f528 : u21 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_9ccfcb22d5d9d8693342f555c022b74c5fc462d926f3aae2fb26326609fc84b1 : u22 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_24039cdd5f48d58b81a9f1c8f708ada7473e5caa7189d4735a4c8130133c0a61 : u23 = u9 -> (forall x0 : prop, x0).
Axiom neq_9_0 : u9 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_188cfa634d7792bd8dc29273791ddd9c2cc6f62f72e402ad8af062f1bf4a9fe0 : u17 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_06cb0ea543f1131f3e8888a6c830beba57dd4d090b172cbec554e85157657538 : u18 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_b8f9d436cada92bb5706d58b3abdb2fdd8828ac9348fb88bbc431043cd38f19b : u19 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_4c44e9910de1ccdd79adf74018ddb18e905f381c61d9473af47382c1483f4394 : u20 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_4e08fb9268e7317e322f86bd0dde127d3b7b95da8719753d5c104a6982cc063e : u21 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_db48afe6d81cca8de5f9f48fe0446680943dac9826858fd3cbbf5e4280bafdcf : u22 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_9e6cdea540787e99cebc610658340827c0bf3b4820b1b40cd9790c67977dd4c4 : u23 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_871e92d1e015b90191f05be741b9ed2cc4491066cf0bf7b2d76c5d141ce801a4 : u10 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_914edee65675f074ac22e4efdf62b56d906e2295ea6417cdabcb9106e39ee5b7 : u17 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_da971a7415a7263658d47e8afc4b6794d759a8c7957d4366d64b0d2d75db1ebf : u18 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_154a30b1ba8ed32508f5174ba5885dce8daae06cb35a638aeda5f521f1a436ed : u19 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_79d2fca345eda4af691531ad5682523df90b5c0b299e09c9d4285223605ce63c : u20 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_c6f79178ace284c233acbca2f2bfe44b665a0e85286917e8a76d1fb24d2247cb : u21 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_84eafe0d1b390e2c8ff6926ca29d0a2cfa95e4e3cceeadff53b06e532c7ee510 : u22 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_edc90758b6bceec12cd2852605ab6c0cf318cd2093fdeb237fe64673c166de16 : u23 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_363035042db213d82b8567e67d435ec9f0597b9e71631d1860566db3f413fe41 : u11 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_fac08972bb876bc2457930272ed91a55b92fbe2a965f8dbfa94c531b056fd466 : u12 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_9925a94179f9b96e15bb2f5f3151446cc17d0f38ddaec97b207a42442fb0efed : u12 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_21d350f752803e70816c84c0f32485027c6c1878657f7263a7ebfa87995c9b6a : u12 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_0aa1897333a9220b7c647af2a5a102d331686166cd7d81d697467978bffb14b8 : u12 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_01c5167c045808e88e705b476ce2dd0e57d03d1d5f6a26f61825a32395c242ea : u12 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_3de237895f633cd0c01630052cea1ce37b395b2138c60358b21cdd63976e7e77 : u12 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_944319b563f360f8276cf6ed579bfd97549280496ef3a59878dc7367e0289497 : u12 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_405ba169154d9d42445b73345355e3c1ff4a4c35ee248b0842bd8e1a26057bf4 : u12 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_718815618fb408e7f9b6a92ac99a4e34c4c560dd6f617b4e7a3baae4d71063ec : u13 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_0563767a7ae8cf0f38a2ce998f4f61c0f4d5f10bd129b2c62e0e73969f860e28 : u13 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_f23c647528c9edaac83020c9ff5a3f2c5a7a4a9b995a628c2a71b9eb6cd8e669 : u13 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_0b3e3e45ef080c7b7a49c00c4067713ad08b47ab8b0713e5aaab56e6d7a5b982 : u13 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_708a12eb026e4d3c08fc829f55688c54d28c54b0af95cbb973e74a0d726eddda : u13 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_10123744e9181acb5f4770c4e7c8d274437210700731399dc702b025f786eb1e : u13 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_128d4a775d786f77bf13bb7dd7cb9742308ad661f9914b0ba314109642dc74a2 : u13 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_e20a3f49533352fe1b05bebbb2ae624ad084f8a027d8217543b43ae55b811240 : u13 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_3ec40051a51fd9abd0f1ea045695fd96747c0b44c83f1a0d528b4d75589d7df9 : u14 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_2451f846ade20c2c83b68d6ca07174f7098b4b15fe1ab38e4417b5ec5afc3945 : u14 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_8d07e49985de556386320c4394a4f81f882951458280531346f93de382828ccf : u14 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_5c17fff000510475687b445d243a8658952ee19ef7f469feb3e238dfb5022180 : u14 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_8e078aa58d96c679c691026d3dbd3c5ddf82d7052472d7ebfc54e4b027091692 : u14 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_521d57c2f7a8a26330ae69c04fff1b24cc86e4837a4836a4fefa73fad1a725cc : u14 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_6b6d879f9198c0f8972b1370a6b60ca474de18dcfd00d1cbe42fb36343cfa178 : u14 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_9cd8c17074dbeec0fef19f04ec8a941cf429e15b37b6046a94fab0afa09de770 : u14 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_033f55ba76fb230c8269a9f3dfb9ab5f1debf38df2ed6a8204e88ab225544563 : u15 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_638ca97253dde1f6c05ae5a7b43aa5519bcb932d746f1ff6c11c6149deab9734 : u15 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_c966e250c9e0036300c545a4c37f99c2c56d590f24ba184faeb741ac623ddc71 : u15 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_a504807aba1f063c619c47c7790e6a97b78d6221a696d3a06eab792e3bc4d832 : u15 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_6be75df4f14c9bfa3abf6ed370fc5224c8cd92769e2571dbc7f3e2b0899c3f2a : u15 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_6163c724a9d7981c89b6bf365a0bebe9efec08b9eff4bb6184424f2ae3577228 : u15 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_03bfa5a110b404de8380cbf91407efa16bc92e74bb78c456f8556ff689d59c2c : u15 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_85105fca2bacc886dc8c29d2893d8d6f48bf2df156b5c5ec0c4e6b02418bc580 : u15 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_dd20a269eccc8405cd94f4653428a5da7b33d3be25fb8510f632ef3230f1eaee : u16 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_400b33ea5b5f2607d4b48b99be02261c15c83e529ac6bfd70aa57fb0ff63c531 : u16 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_1cbb58c41f118085219f3b586c887a5ff408369fe6b52ca74e9366bfb8457cff : u16 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_0cb59343f7ca2c0440165ef2670fd7644d9775c5a4a86baf53d90bca3bd63cc9 : u16 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_ca26de1b59c322d42d6f3d7e731e4e561915afe66882738ab608ff1268374915 : u16 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_d390a940e0d8b8c681ccbf6c46f5374ccc304295ccc2cd1522dd66f6c32997a7 : u16 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_a0bdf0079e7b1581b89ab957e2cd7f488793d97d1d94621d3aa6a4fac9f22b96 : u16 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_14e13a8771031ad5c0fbcddcde043936c377ce19df59c8a5042720afd8292b32 : u16 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_b50d58026fa33219aaaeb728c67b0b8c499309c16668e3e93aafc6ea809d6263 : u17 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_adfda4bbbea6ce7896bcce20701756c0ad035e3d8423139fd5e3887e46248125 : u17 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_d73e6f3c75d5b61b17d9e7d6d295600c0d01ea70ebf65e2417dfd86ee0ffbb16 : u17 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_bfc47753cc6814de196bab2dfc7b00ef059e8fcc866c0bdc69a80fa88efd67fc : u18 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_efa1d73733dbc5a8ae5a619684c14c29ddbe77bafcb128cb54636ceeb244a607 : u18 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_3a7b934d7ddbd20a9e0903f2e32b7a26618ef93ffbea28de94535c59de69b9d2 : u18 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_2b643d529cbe64b9d5c06a17f68356af79094ca9e64ae17d5638290279e7fec2 : u19 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_0a926f3257e3e75e3bae57ff1d33d9d41cd5be64bd452ae63bdcf3291db86460 : u19 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_07e454a581ae12456411a99180327bb4cb9a5e9e31166fb37c99add73f8af102 : u19 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_4eeb91a845b6b9854e48c0871432d0561dea9e45a9f24a85d7c8d3788f407651 : u20 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_0eac7fc454478f7b687086f18421926bcaaf224abcdefcf063ff4a9abef243bd : u20 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_79b0dbf24671f736fe70e30d17885727c5f25bc18332c2b053cee7681f648b02 : u20 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_5245e3a3c3ee6620a813736bf4eb5de53c89de5d8d032cfe0debc9762d766677 : u20 = u15 -> (forall x0 : prop, x0).
Axiom missingprop_e5a105866bd0ded6c3644380e06b833d4aba44e9391e3fab11d8053b9f135f2f : u20 = u16 -> (forall x0 : prop, x0).
Axiom missingprop_b966820c7aa93ffebe633e360c4479000585c1fd468b8e479371445e5051ff71 : u21 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_7bff456dcf0c6179c7c7c0cb5bf08d4b612cd3ffda36c7c8e882abbc5bab0d88 : u21 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_08e11a2a6bed574d1c0692f34f5fb14bd32197aeecc2aa08355941b3c0042b2d : u21 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_d3a41f529304a3c6ae5de6189696cf17a256527213078248f0fd9b71e146d699 : u21 = u15 -> (forall x0 : prop, x0).
Axiom missingprop_27b04c6ef66b613766daae2a56f7236acc35ce71d168daa18f380fbaac44960e : u21 = u16 -> (forall x0 : prop, x0).
Axiom missingprop_7e8a63e62facb395416e18e6390ddb6e54414ca309ab080ad6c05b1cba7169d6 : u22 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_4bda510fa59565c972daf3b7894de1634e3beb70c17fd84fc8f96681845e717c : u22 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_1f3ba6ce64d22904fe3f03c25b93125cef371fad4d06cee0d696df58b78120b4 : u22 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_6053772f7ee32a099a8e5854a9ccbc1e2e362a2a8f7cef6f83414f07562a002c : u22 = u15 -> (forall x0 : prop, x0).
Axiom missingprop_66817c3b10a41b0e371b4ee5ce61c4a47e756f50ae3e08598bb53ffa5828daf9 : u22 = u16 -> (forall x0 : prop, x0).
Axiom missingprop_f3350d540e6867a7972a4724037660c5998ce0128ad87813a498c55bf9b5e591 : u23 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_8b2525a889d10b2b37df4af1f93109cc5d7cb5f1147f3d65577292744da4c69f : u23 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_d82e765d00a8799463c324ef9ec7c7c436edcee826c7fc1ed50b0c5cd110e221 : u23 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_bb52478d225379f7724a33bf76ceb0cd21e2b61279405cff8ab60082cbd3a678 : u23 = u15 -> (forall x0 : prop, x0).
Axiom missingprop_3d25ef54f895cf3695807c8f92ea140325d7c1ae464bbeff3ea915feb94176c2 : u23 = u16 -> (forall x0 : prop, x0).
Axiom missingprop_c9b4e12fb0aac9a865933938cbf5882f899389d7530b1a6017a25523b517d77b : u12 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_c12285364f107ae7d5ef016a23e15f3c94608acd035dd4eab6e840e77bdc8e61 : u13 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_786d05e7abced1a9dc9d53bbc0ccf61863e522b5215ae9f11752fff2bf124321 : u14 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_9777c32431e56f82c3c2627629f063e7a7752ce2500aecd27c072fd538c564d1 : u15 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_60f83cb2d5e8fad8ed3c2af8b6c5009dbe5ca939fa34d10ed5528a8ef488fb1c : u16 = 0 -> (forall x0 : prop, x0).
Axiom neq_9_1 : u9 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_a7fa19a834d529db93c1b2300b41b17f336102b7793b24e9a750d6e03dec690c : u10 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_da9cd2315b0ab3b3dbcd7c4069c6d07f8e8a7c3b5321d78acb9ddfea02c56e54 : u11 = u1 -> (forall x0 : prop, x0).
Axiom neq_9_2 : u9 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_5f3179724a6e8ef693da33b4da734e3c0d8d3295b89093b2f129371490f35854 : u10 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_93bd155ae66f9293399dab321235e159c709aa50be6b4209e260d5c571069bc3 : u11 = u2 -> (forall x0 : prop, x0).
Axiom neq_9_3 : u9 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_155e8a92a8ae96b946418659d12b00e3fef62dadc1bc31d4f074bcb712786356 : u10 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_6c307483f1e9d79cbd1be8f99cb0623b215d2a96dd7ca22776b1132e2b377d33 : u11 = u3 -> (forall x0 : prop, x0).
Theorem missingprop_57db8c4a0f258f3583eb427322e46dfe7fbdd0b3d4ccf6cc1f1cebdaab4dc903 : (forall x0 x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x2 x3 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x2 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_8ary_proj_p x3 -> x0 = (fun x5 x6 x7 : (set -> set) -> set -> set => x1 x6 x7 x5) -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt4_id_ge4_rot2 x2 x0) (ChurchNums_8_perm_4_5_6_7_0_1_2_3 x2) = ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x3 x1) (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x3) -> (forall x4 : prop, x4)).
admit.
Qed.
