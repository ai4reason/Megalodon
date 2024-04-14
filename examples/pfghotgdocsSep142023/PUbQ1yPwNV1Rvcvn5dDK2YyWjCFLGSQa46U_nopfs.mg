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
Definition Church13_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x9) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x10) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x11) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x12) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x13) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set => x14) -> x1 x0).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
(* Parameter u4 "7a516cda4555ee314bd599299eac983d7d569296583a629b47918e19d4a0f71f" "66241e5ccfbbd32429c1f14526f03d9d37590fe4ddf66171a76fae8bb5f8b113" *)
Parameter u4 : set.
(* Parameter u5 "2a783d5aa30540222437cf12bcd2250d09379447bbcfb2424ca047f449bf06b4" "81fa4107fe53377c8e9932359ab17b6be1f49b6646daa701ee0c5525e8489bca" *)
Parameter u5 : set.
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
(* Parameter u7 "af2de1d69c59ef5054cf8b6dce9a93a630001f055010b2d9b5c0f0945e37d127" "3cbeb3771776e1d1a12e3cb64dcc555d3ff2cc4de57d951cb6799fd09f57d004" *)
Parameter u7 : set.
(* Parameter u8 "4d5ccc56a929ac0c8f71c494d50309dfb6da04c7178c3bc993cde3ebf042a891" "ce0f39eb54c9fcc3c8025cbe688bc7bd697a0c77e023c724aa4ea22edcdfaa0f" *)
Parameter u8 : set.
(* Parameter u9 "09c26abdb88570cbb608edfbe57d30576c9a90b0d04071630aa0d3b62d9c634b" "f7b5ffe5245726f4af7381ced353e716ac8d1afab440daf56cd884ec8e25f3ac" *)
Parameter u9 : set.
(* Parameter u10 "992db04f3545ca6059e54ab6da6f2ea553db0f23228f7fec0d787191aaa7a699" "dacefbd6851dd6711e6ed263045ec145efad7c6f5bfe7e5223ba6c7c5533e61e" *)
Parameter u10 : set.
(* Parameter u11 "8d98a4d4dfcb8d45bfdcd349a4735f18958f85477c7c78e7af7b858830ea91e7" "fe7b8011fa04942e98e7459bad1082ace0dfdd32285ea0719af3aef0e9417e40" *)
Parameter u11 : set.
(* Parameter u12 "95f5d0914858066458ab42966efbfe1dd0f032e802a54f602e8e5407ac56ace7" "c03c309131c67756afa0fda4d4c84047a8defc43f47980c44c05639208cbaa8e" *)
Parameter u12 : set.
Definition TwoRamseyGraph_3_5_Church13 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2) (x1 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3) (x1 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3) (x1 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3) (x1 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2) (x1 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3) (x1 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3) (x1 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3) (x1 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3)).
Definition TwoRamseyGraph_3_5_13 : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 x3 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x2 -> Church13_p x3 -> x0 = x2 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 -> x1 = x3 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 -> TwoRamseyGraph_3_5_Church13 x2 x3 = (fun x5 x6 : set => x5)).
Axiom missingprop_b985bb030ad120a923f32a58b20eca46185cd1d118dc49cd751ca3fb2c7d9cc1 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 x1 x0).
Theorem missingprop_6691451906f37677ba45db254ad43a055bbea9a71de659c8291ba833ff1f99a2 : (forall x0 x1, TwoRamseyGraph_3_5_13 x0 x1 -> TwoRamseyGraph_3_5_13 x1 x0).
admit.
Qed.
(* Parameter u13 "5fc070d127ffae798f70b712dd801ce996aeab3cec7aa3b427979e46f34030ae" "5e6da24eb2e380feb39c79acefdce29d92c5faf26abed0e1ca071eaf6e391f2f" *)
Parameter u13 : set.
Axiom missingprop_713be0ad5efeb9da26a66462505f19060bd4cc2891c0c4c304dba8053e47660a : (forall x0, x0 :e u13 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 x0)).
Axiom missingprop_a619d41e7dd73fd2fd7a22e345cc585bca94f0a556dabdde7ba613d280fc1bb9 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x0).
Axiom missingprop_56e5b078b135657df6b920f8c41633bbbc869255cbf04817b1c0569e953798ea : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x1).
Axiom missingprop_64a05e04ff07f2333eab12fcce0b713bfb051cbbce19306572d78b255c2f5222 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x2).
Axiom missingprop_ccf2dc8baa5a60239d2b334119b91cb320d200e197fef0daa6705ddcacfec32a : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x3).
Axiom missingprop_ec3bfa3241ab3c5244e2af2ff034529622ae6db8f50ffa68a44651955e5adb06 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x4).
Axiom missingprop_2275c30730a86a8b5e92c69a3cf62226cb91c94f842745d885aae952e4aec475 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x5).
Axiom missingprop_af2a1b54824c0bcac106e306823cdf745ddadb1cb4ff3d16a82269625fefc7d4 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x6).
Axiom missingprop_596dfb802632adb73ea48164c53a57c30f1012fe27955d11686758a101b7149d : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x7).
Axiom missingprop_50472d7abd1881ae03e9d8bb4157df2bf5b1683170237a2acc8397347adcb4f4 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x8).
Axiom missingprop_1f56b45f0c7c3bae8d2fefe625ddc5f2e352f95a05bc1ddcbe2a1e6319b2efb1 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x9).
Axiom missingprop_1705677bb2891af01232540762f936ba15268cba2c18878c91db2fc6b9de2c54 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x10).
Axiom missingprop_1b90f1280b68f731b1e6847827f5b51bc26aad732250097484d79ba832396c44 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x11).
Axiom missingprop_ed489a2212f16ff8acf2018142cb5229cb5c399f8206cf8e20e508de6a09ab2c : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x12).
Theorem missingprop_f13b7928572ea386063941f294a7de5e613d504b56c8df5d720e8c3911580df6 : (forall x0, x0 :e u13 -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x2 -> x0 = x2 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 -> x1) -> x1)).
admit.
Qed.
Definition Church13_perm_1_2_3_4_5_6_7_8_9_10_11_12_0 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x1).
Definition Church13_perm_12_0_1_2_3_4_5_6_7_8_9_10_11 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x13 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12).
Axiom missingprop_b16b38441259a05332428d0f2db526e9dc2ef83fe954c8261623fb4dabc28885 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_12_0_1_2_3_4_5_6_7_8_9_10_11 x0)).
Axiom missingprop_8fb3724bdbb3c5ecf278da23741ea89123ac92b2f2457be6608d21a3bd72d9fd : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_1_2_3_4_5_6_7_8_9_10_11_12_0 x0)).
Axiom missingprop_a67316d10aad2fcfe2011af2c3e928a517dd9c91671f11a2a49f83f5fccb4741 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_12_0_1_2_3_4_5_6_7_8_9_10_11 x0) (Church13_perm_12_0_1_2_3_4_5_6_7_8_9_10_11 x1)).
Definition Church13_perm_2_3_4_5_6_7_8_9_10_11_12_0_1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x1 x2).
Definition Church13_perm_11_12_0_1_2_3_4_5_6_7_8_9_10 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x12 x13 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11).
Axiom missingprop_3d72831100221701b1d70e86da0ff5bba95b147a570c7ad09ee52f85141282c7 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_11_12_0_1_2_3_4_5_6_7_8_9_10 x0)).
Axiom missingprop_6fba23bff0618ffdd28c52d04baf6ddc093f905c8d2601df14d0f3e9f83eb2cf : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_2_3_4_5_6_7_8_9_10_11_12_0_1 x0)).
Axiom missingprop_5a98f280d2ff8aa0f72540ff0e4d0532b69a75fff2a881843b87902383821929 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_11_12_0_1_2_3_4_5_6_7_8_9_10 x0) (Church13_perm_11_12_0_1_2_3_4_5_6_7_8_9_10 x1)).
Definition Church13_perm_3_4_5_6_7_8_9_10_11_12_0_1_2 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x1 x2 x3).
Definition Church13_perm_10_11_12_0_1_2_3_4_5_6_7_8_9 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x11 x12 x13 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10).
Axiom missingprop_4af87dfd5137b052167a53a146dc488ebe7616c2c621f533fb7f4e7faf7026a5 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_10_11_12_0_1_2_3_4_5_6_7_8_9 x0)).
Axiom missingprop_182bbf1bf5abe73a1b65f3ff16b502bf3bedcaf9d305956e3198111bbf60b64b : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_3_4_5_6_7_8_9_10_11_12_0_1_2 x0)).
Axiom missingprop_d1f68a06e9798bd655bbe02d5620e63a18f56bb99101bb5200f01f83f4b14cd5 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_10_11_12_0_1_2_3_4_5_6_7_8_9 x0) (Church13_perm_10_11_12_0_1_2_3_4_5_6_7_8_9 x1)).
Definition Church13_perm_4_5_6_7_8_9_10_11_12_0_1_2_3 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x5 x6 x7 x8 x9 x10 x11 x12 x13 x1 x2 x3 x4).
Definition Church13_perm_9_10_11_12_0_1_2_3_4_5_6_7_8 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x10 x11 x12 x13 x1 x2 x3 x4 x5 x6 x7 x8 x9).
Axiom missingprop_7da4c77927f52dea06751c4fb8872a3733c3eb0587fabc1a65e7dcb8c6957828 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_9_10_11_12_0_1_2_3_4_5_6_7_8 x0)).
Axiom missingprop_0a6dd722c244d6c219f0593f03657402e4f4a1ddc6e5cddcdacf8f585464a8cd : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_4_5_6_7_8_9_10_11_12_0_1_2_3 x0)).
Axiom missingprop_a1ac5ef3bc6007982ff3a2ace254be9e1e54899a857124d99c3b64697da4ffd8 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_9_10_11_12_0_1_2_3_4_5_6_7_8 x0) (Church13_perm_9_10_11_12_0_1_2_3_4_5_6_7_8 x1)).
Definition Church13_perm_5_6_7_8_9_10_11_12_0_1_2_3_4 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x6 x7 x8 x9 x10 x11 x12 x13 x1 x2 x3 x4 x5).
Definition Church13_perm_8_9_10_11_12_0_1_2_3_4_5_6_7 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x9 x10 x11 x12 x13 x1 x2 x3 x4 x5 x6 x7 x8).
Axiom missingprop_b4ef93e889b64aa0b0fa72af715e9f31be0e5a4c06188b004d8c5416d36338ff : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_8_9_10_11_12_0_1_2_3_4_5_6_7 x0)).
Axiom missingprop_e3e0664e3e9675b15a1ba08129d57c68bd7dee31e19bded98d8e2f9e13a542be : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_5_6_7_8_9_10_11_12_0_1_2_3_4 x0)).
Axiom missingprop_0ee2658c715db1dd9fec96cb9eb6fea53aa6e76cc374da1a81516e8f581a7fd0 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_8_9_10_11_12_0_1_2_3_4_5_6_7 x0) (Church13_perm_8_9_10_11_12_0_1_2_3_4_5_6_7 x1)).
Definition Church13_perm_6_7_8_9_10_11_12_0_1_2_3_4_5 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x7 x8 x9 x10 x11 x12 x13 x1 x2 x3 x4 x5 x6).
Definition Church13_perm_7_8_9_10_11_12_0_1_2_3_4_5_6 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x8 x9 x10 x11 x12 x13 x1 x2 x3 x4 x5 x6 x7).
Axiom missingprop_1d3b70fe615faaa81921bd8ea3d800ff4a8e019bb9655fcbffcc3417f7fae0e3 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_7_8_9_10_11_12_0_1_2_3_4_5_6 x0)).
Axiom missingprop_aa32acac305f85083f86ebbc8ae63c64a29bb3a5b4fe88ea62f9c54183a4bd6a : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_6_7_8_9_10_11_12_0_1_2_3_4_5 x0)).
Axiom missingprop_eab7694094e3b8a746449877d99e475e69d9ed99af56008583a47b19fd001c3c : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_7_8_9_10_11_12_0_1_2_3_4_5_6 x0) (Church13_perm_7_8_9_10_11_12_0_1_2_3_4_5_6 x1)).
Axiom missingprop_91693a1740c8633dbe238e3f61b393c4d731a588fef5e301c5b842126f8cefb7 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_6_7_8_9_10_11_12_0_1_2_3_4_5 x0) (Church13_perm_6_7_8_9_10_11_12_0_1_2_3_4_5 x1)).
Axiom missingprop_5e379ee7f330d1c6f51b09efdace8e53d679168f985d3429fe1ab315fe44b9a6 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_5_6_7_8_9_10_11_12_0_1_2_3_4 x0) (Church13_perm_5_6_7_8_9_10_11_12_0_1_2_3_4 x1)).
Axiom missingprop_380c99791c39d6411d037d1e92a6bbb0afd7ecedee22d253570ae75071c7df40 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_4_5_6_7_8_9_10_11_12_0_1_2_3 x0) (Church13_perm_4_5_6_7_8_9_10_11_12_0_1_2_3 x1)).
Axiom missingprop_cd98af441a42672e03027a58f063c565c9666be2b4bdfc21f68dc04f6c33482c : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_3_4_5_6_7_8_9_10_11_12_0_1_2 x0) (Church13_perm_3_4_5_6_7_8_9_10_11_12_0_1_2 x1)).
Axiom missingprop_405f0857a73281603eaeeb4d0ba21cfa6190f9562498c7911a5143afecb42aab : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_2_3_4_5_6_7_8_9_10_11_12_0_1 x0) (Church13_perm_2_3_4_5_6_7_8_9_10_11_12_0_1 x1)).
Axiom missingprop_53ef5c9e09df067c5099a86782972b79f8c57397692f4f44c9fd9dbb43b731ee : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_1_2_3_4_5_6_7_8_9_10_11_12_0 x0) (Church13_perm_1_2_3_4_5_6_7_8_9_10_11_12_0 x1)).
Theorem missingprop_37c1c08bb86d5b4e33948419b156e3861ea73d89bb0a60079717ef1ce7fe0047 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> (forall x1 : prop, (forall x2 x3 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, (forall x4 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x4 -> Church13_p (x2 x4)) -> (forall x4 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x4 -> Church13_p (x3 x4)) -> (forall x4 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, forall x5 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x5 (x2 (x3 x4)) x4 -> x5 x4 (x2 (x3 x4))) -> (forall x4 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, forall x5 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x5 (x3 (x2 x4)) x4 -> x5 x4 (x3 (x2 x4))) -> (forall x4 x5 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x4 -> Church13_p x5 -> TwoRamseyGraph_3_5_Church13 x4 x5 = TwoRamseyGraph_3_5_Church13 (x2 x4) (x2 x5)) -> x2 x0 = (fun x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x5) -> x1) -> x1)).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
Theorem missingprop_ab84de89d5602abf23d4f25476840d5800c1a057ab19ebfe5fa8eab4afa3e505 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> ((fun x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 : set => x3) = x0 -> (forall x2 : prop, x2)) -> ((fun x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 : set => x3) = x1 -> (forall x2 : prop, x2)) -> (x0 = x1 -> (forall x2 : prop, x2)) -> TwoRamseyGraph_3_5_Church13 (fun x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 : set => x3) x0 = (fun x3 x4 : set => x3) -> TwoRamseyGraph_3_5_Church13 x0 x1 = (fun x3 x4 : set => x3) -> TwoRamseyGraph_3_5_Church13 (fun x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 : set => x3) x1 = (fun x3 x4 : set => x3) -> False).
admit.
Qed.
Theorem missingprop_873d0c5e2eeb5a2985fa84b3e7b54248cf283ca6d92cca41f458c7c4e6e2a64b : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> Church13_p x2 -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_5_Church13 x0 x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_5_Church13 x1 x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_5_Church13 x0 x2 = (fun x4 x5 : set => x4) -> False).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom missingprop_95c6cbd2308b27a7edcd2a1d9389b377988e902d740d05dc7c88e6b8da945ab9 : (forall x0, atleastp 3 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1))) -> x1)).
Theorem missingprop_611e3f668a310864e980350cd8f2559c41b2ec84dbf2aad8dbbd2fc90ee63435 : (forall x0, x0 c= u13 -> atleastp u3 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_5_13 x1 x2))).
admit.
Qed.
