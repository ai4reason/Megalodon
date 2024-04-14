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
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Theorem missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_b985bb030ad120a923f32a58b20eca46185cd1d118dc49cd751ca3fb2c7d9cc1 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 x1 x0).
admit.
Qed.
Definition Church13_perm_1_2_3_4_5_6_7_8_9_10_11_12_0 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x1).
Theorem missingprop_8fb3724bdbb3c5ecf278da23741ea89123ac92b2f2457be6608d21a3bd72d9fd : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_1_2_3_4_5_6_7_8_9_10_11_12_0 x0)).
admit.
Qed.
Theorem missingprop_53ef5c9e09df067c5099a86782972b79f8c57397692f4f44c9fd9dbb43b731ee : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_1_2_3_4_5_6_7_8_9_10_11_12_0 x0) (Church13_perm_1_2_3_4_5_6_7_8_9_10_11_12_0 x1)).
admit.
Qed.
Definition Church13_perm_2_3_4_5_6_7_8_9_10_11_12_0_1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x1 x2).
Theorem missingprop_6fba23bff0618ffdd28c52d04baf6ddc093f905c8d2601df14d0f3e9f83eb2cf : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_2_3_4_5_6_7_8_9_10_11_12_0_1 x0)).
admit.
Qed.
Theorem missingprop_405f0857a73281603eaeeb4d0ba21cfa6190f9562498c7911a5143afecb42aab : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_2_3_4_5_6_7_8_9_10_11_12_0_1 x0) (Church13_perm_2_3_4_5_6_7_8_9_10_11_12_0_1 x1)).
admit.
Qed.
Definition Church13_perm_3_4_5_6_7_8_9_10_11_12_0_1_2 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x1 x2 x3).
Theorem missingprop_182bbf1bf5abe73a1b65f3ff16b502bf3bedcaf9d305956e3198111bbf60b64b : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_3_4_5_6_7_8_9_10_11_12_0_1_2 x0)).
admit.
Qed.
Theorem missingprop_cd98af441a42672e03027a58f063c565c9666be2b4bdfc21f68dc04f6c33482c : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_3_4_5_6_7_8_9_10_11_12_0_1_2 x0) (Church13_perm_3_4_5_6_7_8_9_10_11_12_0_1_2 x1)).
admit.
Qed.
Definition Church13_perm_4_5_6_7_8_9_10_11_12_0_1_2_3 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x5 x6 x7 x8 x9 x10 x11 x12 x13 x1 x2 x3 x4).
Theorem missingprop_0a6dd722c244d6c219f0593f03657402e4f4a1ddc6e5cddcdacf8f585464a8cd : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_4_5_6_7_8_9_10_11_12_0_1_2_3 x0)).
admit.
Qed.
Theorem missingprop_380c99791c39d6411d037d1e92a6bbb0afd7ecedee22d253570ae75071c7df40 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_4_5_6_7_8_9_10_11_12_0_1_2_3 x0) (Church13_perm_4_5_6_7_8_9_10_11_12_0_1_2_3 x1)).
admit.
Qed.
Definition Church13_perm_5_6_7_8_9_10_11_12_0_1_2_3_4 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x6 x7 x8 x9 x10 x11 x12 x13 x1 x2 x3 x4 x5).
Theorem missingprop_e3e0664e3e9675b15a1ba08129d57c68bd7dee31e19bded98d8e2f9e13a542be : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_5_6_7_8_9_10_11_12_0_1_2_3_4 x0)).
admit.
Qed.
Theorem missingprop_5e379ee7f330d1c6f51b09efdace8e53d679168f985d3429fe1ab315fe44b9a6 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_5_6_7_8_9_10_11_12_0_1_2_3_4 x0) (Church13_perm_5_6_7_8_9_10_11_12_0_1_2_3_4 x1)).
admit.
Qed.
Definition Church13_perm_6_7_8_9_10_11_12_0_1_2_3_4_5 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set => x0 x7 x8 x9 x10 x11 x12 x13 x1 x2 x3 x4 x5 x6).
Theorem missingprop_aa32acac305f85083f86ebbc8ae63c64a29bb3a5b4fe88ea62f9c54183a4bd6a : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p (Church13_perm_6_7_8_9_10_11_12_0_1_2_3_4_5 x0)).
admit.
Qed.
Theorem missingprop_91693a1740c8633dbe238e3f61b393c4d731a588fef5e301c5b842126f8cefb7 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> TwoRamseyGraph_3_5_Church13 x0 x1 = TwoRamseyGraph_3_5_Church13 (Church13_perm_6_7_8_9_10_11_12_0_1_2_3_4_5 x0) (Church13_perm_6_7_8_9_10_11_12_0_1_2_3_4_5 x1)).
admit.
Qed.
