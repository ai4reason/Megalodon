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
Theorem missingprop_a619d41e7dd73fd2fd7a22e345cc585bca94f0a556dabdde7ba613d280fc1bb9 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x0).
admit.
Qed.
Theorem missingprop_56e5b078b135657df6b920f8c41633bbbc869255cbf04817b1c0569e953798ea : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x1).
admit.
Qed.
Theorem missingprop_64a05e04ff07f2333eab12fcce0b713bfb051cbbce19306572d78b255c2f5222 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x2).
admit.
Qed.
Theorem missingprop_ccf2dc8baa5a60239d2b334119b91cb320d200e197fef0daa6705ddcacfec32a : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x3).
admit.
Qed.
Theorem missingprop_ec3bfa3241ab3c5244e2af2ff034529622ae6db8f50ffa68a44651955e5adb06 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x4).
admit.
Qed.
Theorem missingprop_2275c30730a86a8b5e92c69a3cf62226cb91c94f842745d885aae952e4aec475 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x5).
admit.
Qed.
Theorem missingprop_af2a1b54824c0bcac106e306823cdf745ddadb1cb4ff3d16a82269625fefc7d4 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x6).
admit.
Qed.
Theorem missingprop_596dfb802632adb73ea48164c53a57c30f1012fe27955d11686758a101b7149d : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x7).
admit.
Qed.
Theorem missingprop_50472d7abd1881ae03e9d8bb4157df2bf5b1683170237a2acc8397347adcb4f4 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x8).
admit.
Qed.
Theorem missingprop_1f56b45f0c7c3bae8d2fefe625ddc5f2e352f95a05bc1ddcbe2a1e6319b2efb1 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x9).
admit.
Qed.
Theorem missingprop_1705677bb2891af01232540762f936ba15268cba2c18878c91db2fc6b9de2c54 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x10).
admit.
Qed.
Theorem missingprop_1b90f1280b68f731b1e6847827f5b51bc26aad732250097484d79ba832396c44 : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x11).
admit.
Qed.
Theorem missingprop_ed489a2212f16ff8acf2018142cb5229cb5c399f8206cf8e20e508de6a09ab2c : Church13_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set => x12).
admit.
Qed.
Definition TwoRamseyGraph_3_5_Church13 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2) (x1 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3) (x1 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3) (x1 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3) (x1 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x3) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2) (x1 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x3) (x1 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3) (x1 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3) (x1 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x2 x3)).
Definition Church13_perm_7_8_9_10_11_12_0_1_2_3_4_5_6 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x8 x9 x10 x11 x12 x13 x1 x2 x3 x4 x5 x6 x7).
Theorem missingprop_1d3b70fe615faaa81921bd8ea3d800ff4a8e019bb9655fcbffcc3417f7fae0e3 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_7_8_9_10_11_12_0_1_2_3_4_5_6 x0)).
admit.
Qed.
Theorem missingprop_eab7694094e3b8a746449877d99e475e69d9ed99af56008583a47b19fd001c3c : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_7_8_9_10_11_12_0_1_2_3_4_5_6 x0) (Church13_perm_7_8_9_10_11_12_0_1_2_3_4_5_6 x1)).
admit.
Qed.
Definition Church13_perm_8_9_10_11_12_0_1_2_3_4_5_6_7 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x9 x10 x11 x12 x13 x1 x2 x3 x4 x5 x6 x7 x8).
Theorem missingprop_b4ef93e889b64aa0b0fa72af715e9f31be0e5a4c06188b004d8c5416d36338ff : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_8_9_10_11_12_0_1_2_3_4_5_6_7 x0)).
admit.
Qed.
Theorem missingprop_0ee2658c715db1dd9fec96cb9eb6fea53aa6e76cc374da1a81516e8f581a7fd0 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_8_9_10_11_12_0_1_2_3_4_5_6_7 x0) (Church13_perm_8_9_10_11_12_0_1_2_3_4_5_6_7 x1)).
admit.
Qed.
Definition Church13_perm_9_10_11_12_0_1_2_3_4_5_6_7_8 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x10 x11 x12 x13 x1 x2 x3 x4 x5 x6 x7 x8 x9).
Theorem missingprop_7da4c77927f52dea06751c4fb8872a3733c3eb0587fabc1a65e7dcb8c6957828 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_9_10_11_12_0_1_2_3_4_5_6_7_8 x0)).
admit.
Qed.
Theorem missingprop_a1ac5ef3bc6007982ff3a2ace254be9e1e54899a857124d99c3b64697da4ffd8 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_9_10_11_12_0_1_2_3_4_5_6_7_8 x0) (Church13_perm_9_10_11_12_0_1_2_3_4_5_6_7_8 x1)).
admit.
Qed.
Definition Church13_perm_10_11_12_0_1_2_3_4_5_6_7_8_9 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x11 x12 x13 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10).
Theorem missingprop_4af87dfd5137b052167a53a146dc488ebe7616c2c621f533fb7f4e7faf7026a5 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_10_11_12_0_1_2_3_4_5_6_7_8_9 x0)).
admit.
Qed.
Theorem missingprop_d1f68a06e9798bd655bbe02d5620e63a18f56bb99101bb5200f01f83f4b14cd5 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_10_11_12_0_1_2_3_4_5_6_7_8_9 x0) (Church13_perm_10_11_12_0_1_2_3_4_5_6_7_8_9 x1)).
admit.
Qed.
Definition Church13_perm_11_12_0_1_2_3_4_5_6_7_8_9_10 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x12 x13 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11).
Theorem missingprop_3d72831100221701b1d70e86da0ff5bba95b147a570c7ad09ee52f85141282c7 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_11_12_0_1_2_3_4_5_6_7_8_9_10 x0)).
admit.
Qed.
Theorem missingprop_5a98f280d2ff8aa0f72540ff0e4d0532b69a75fff2a881843b87902383821929 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_11_12_0_1_2_3_4_5_6_7_8_9_10 x0) (Church13_perm_11_12_0_1_2_3_4_5_6_7_8_9_10 x1)).
admit.
Qed.
Definition Church13_perm_12_0_1_2_3_4_5_6_7_8_9_10_11 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x13 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12).
Theorem missingprop_b16b38441259a05332428d0f2db526e9dc2ef83fe954c8261623fb4dabc28885 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_12_0_1_2_3_4_5_6_7_8_9_10_11 x0)).
admit.
Qed.
Theorem missingprop_a67316d10aad2fcfe2011af2c3e928a517dd9c91671f11a2a49f83f5fccb4741 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_12_0_1_2_3_4_5_6_7_8_9_10_11 x0) (Church13_perm_12_0_1_2_3_4_5_6_7_8_9_10_11 x1)).
admit.
Qed.
