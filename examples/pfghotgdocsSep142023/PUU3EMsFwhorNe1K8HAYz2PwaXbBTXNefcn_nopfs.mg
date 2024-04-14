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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Definition TwoRamseyProp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Theorem not_TwoRamseyProp_3_3_5 : not (TwoRamseyProp 3 3 5).
Admitted.
Theorem TwoRamseyProp_3_3_6 : TwoRamseyProp 3 3 6.
Admitted.
Theorem not_TwoRamseyProp_3_4_8 : not (TwoRamseyProp 3 4 8).
Admitted.
Theorem not_TwoRamseyProp_3_5_13 : not (TwoRamseyProp 3 5 13).
Admitted.
Theorem not_TwoRamseyProp_3_6_17 : not (TwoRamseyProp 3 6 17).
Admitted.
Theorem not_TwoRamseyProp_3_7_22 : not (TwoRamseyProp 3 7 22).
Admitted.
Theorem not_TwoRamseyProp_3_8_27 : not (TwoRamseyProp 3 8 27).
Admitted.
Theorem not_TwoRamseyProp_3_9_35 : not (TwoRamseyProp 3 9 35).
Admitted.
Theorem not_TwoRamseyProp_3_10_39 : not (TwoRamseyProp 3 10 39).
Admitted.
Theorem not_TwoRamseyProp_4_4_17 : not (TwoRamseyProp 4 4 17).
Admitted.
Theorem not_TwoRamseyProp_4_5_24 : not (TwoRamseyProp 4 5 24).
Admitted.
Theorem not_TwoRamseyProp_4_6_35 : not (TwoRamseyProp 4 6 35).
Admitted.
Theorem not_TwoRamseyProp_4_7_48 : not (TwoRamseyProp 4 7 48).
Admitted.
Theorem not_TwoRamseyProp_4_8_58 : not (TwoRamseyProp 4 8 58).
Admitted.
Theorem not_TwoRamseyProp_4_9_72 : not (TwoRamseyProp 4 9 72).
Admitted.
Theorem not_TwoRamseyProp_5_5_42 : not (TwoRamseyProp 5 5 42).
Admitted.
Theorem not_TwoRamseyProp_5_6_57 : not (TwoRamseyProp 5 6 57).
Admitted.
Theorem not_TwoRamseyProp_5_7_79 : not (TwoRamseyProp 5 7 79).
Admitted.
Theorem not_TwoRamseyProp_5_8_100 : not (TwoRamseyProp 5 8 100).
Admitted.
Theorem not_TwoRamseyProp_6_6_101 : not (TwoRamseyProp 6 6 101).
Admitted.
Theorem not_TwoRamseyProp_6_7_114 : not (TwoRamseyProp 6 7 114).
Admitted.
Theorem TwoRamseyProp_3_4_9 : TwoRamseyProp 3 4 9.
Admitted.
Theorem TwoRamseyProp_3_5_14 : TwoRamseyProp 3 5 14.
Admitted.
Theorem TwoRamseyProp_3_6_18 : TwoRamseyProp 3 6 18.
Admitted.
Theorem TwoRamseyProp_3_7_23 : TwoRamseyProp 3 7 23.
Admitted.
Theorem TwoRamseyProp_3_8_28 : TwoRamseyProp 3 8 28.
Admitted.
Theorem TwoRamseyProp_3_9_36 : TwoRamseyProp 3 9 36.
Admitted.
Theorem TwoRamseyProp_3_10_42 : TwoRamseyProp 3 10 42.
Admitted.
Theorem TwoRamseyProp_4_4_18 : TwoRamseyProp 4 4 18.
Admitted.
Theorem TwoRamseyProp_4_5_25 : TwoRamseyProp 4 5 25.
Admitted.
Theorem TwoRamseyProp_4_6_41 : TwoRamseyProp 4 6 41.
Admitted.
Theorem TwoRamseyProp_4_7_61 : TwoRamseyProp 4 7 61.
Admitted.
Theorem TwoRamseyProp_4_8_84 : TwoRamseyProp 4 8 84.
Admitted.
Theorem TwoRamseyProp_4_9_115 : TwoRamseyProp 4 9 115.
Admitted.
Theorem TwoRamseyProp_5_5_48 : TwoRamseyProp 5 5 48.
Admitted.
Theorem TwoRamseyProp_5_6_87 : TwoRamseyProp 5 6 87.
Admitted.
Theorem TwoRamseyProp_5_7_143 : TwoRamseyProp 5 7 143.
Admitted.
Theorem TwoRamseyProp_5_8_216 : TwoRamseyProp 5 8 216.
Admitted.
Theorem TwoRamseyProp_6_6_165 : TwoRamseyProp 6 6 165.
Admitted.
Theorem TwoRamseyProp_6_7_298 : TwoRamseyProp 6 7 298.
Admitted.
Theorem missingprop_2e14db57142b7206241737abc1142fd976987dd219afdf8acc5fb25eded2b7fd : not (TwoRamseyProp 3 5 (Power 3)).
Admitted.
Theorem missingprop_edbe38cedc43eb3cb96e39ed8dd751657658b596c20f9b75f1c9529c9207431f : not (TwoRamseyProp 3 6 (Power 3)).
Admitted.
Theorem missingprop_47c913063b1e4fc5bce3cf3efeba2defffa6033adca73022bfae689ed61125de : not (TwoRamseyProp 3 6 (Power 4)).
Admitted.
Theorem missingprop_453f42be0c19ff4d70edb40a8e665cf0b03dfc91fdff73d1c78ae71b40ae9eff : not (TwoRamseyProp 3 7 (Power 3)).
Admitted.
Theorem missingprop_0b06fe661bcabe7206ab480d053c9a118dc0d4ee32a3c0c6c5348fcca50dc926 : not (TwoRamseyProp 3 7 (Power 4)).
Admitted.
Theorem missingprop_8e31e6a1fbb593962d735ab60376425825b19ead402bb1eacc393ec21fc101ab : not (TwoRamseyProp 3 8 (Power 3)).
Admitted.
Theorem missingprop_7c4c3c41a338314b7ec1fd1f62a9602d0d2926ec172243cf6e4c45ce30191a0a : not (TwoRamseyProp 3 8 (Power 4)).
Admitted.
Theorem missingprop_9579d1496ed0ac82b90912d2d9574c481a2193eda74fb79f1d1a8c2661687353 : not (TwoRamseyProp 3 9 (Power 3)).
Admitted.
Theorem missingprop_a44fd93c3a7af381df06edbe7b673b8904ff55629d4af6ee3134e29617e2dc2a : not (TwoRamseyProp 3 9 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_3_9_Power_5 : not (TwoRamseyProp 3 9 (Power 5)).
Admitted.
Theorem missingprop_edae1d5838e5939f3231af3f23f117c2b2970880efbb46f4a6ea78233d0e0845 : not (TwoRamseyProp 3 10 (Power 3)).
Admitted.
Theorem missingprop_c502247406c83d3dd236c471de0e0633dc617b03a7871e8ec10a50e354027940 : not (TwoRamseyProp 3 10 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_3_10_Power_5 : not (TwoRamseyProp 3 10 (Power 5)).
Admitted.
Theorem missingprop_d1fac1c4cf86f9bf1a1191410f2bc809686eaa0724d726056c2dd7a14d8bd0b7 : not (TwoRamseyProp 4 4 (Power 3)).
Admitted.
Theorem missingprop_1accbadfa50080c0e26d369c4440fc6f34b7e7c33e9c1febe4b4ce000df77472 : not (TwoRamseyProp 4 4 (Power 4)).
Admitted.
Theorem missingprop_efe4e3c3f7c7f4c596224c2211d491802673788db39a203b44f88e754a272488 : not (TwoRamseyProp 4 5 (Power 3)).
Admitted.
Theorem missingprop_73633bed9f6591cd008d4e8992e09b4340f55636ce655a675054042409b47bd2 : not (TwoRamseyProp 4 5 (Power 4)).
Admitted.
Theorem missingprop_b0e56cd4962c4f6672248645c87bf04e9516c5da7a450e51866e320cc6e0c819 : not (TwoRamseyProp 4 6 (Power 3)).
Admitted.
Theorem missingprop_277385155346a4bc633fe5b8391d50ff96ebe1b0bd16f65327fc63db75f24b6c : not (TwoRamseyProp 4 6 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_4_6_Power_5 : not (TwoRamseyProp 4 6 (Power 5)).
Admitted.
Theorem missingprop_9b0d43559546095bc43d1be6d4af13a9f65700c40aabc2c0b564f576cc00fb77 : not (TwoRamseyProp 4 7 (Power 3)).
Admitted.
Theorem missingprop_d0d0d19caeec7ab451c67616456cce2d6c9f7be9893f8b7062f4ece250e433df : not (TwoRamseyProp 4 7 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_4_7_Power_5 : not (TwoRamseyProp 4 7 (Power 5)).
Admitted.
Theorem missingprop_4a26d1ffa7de4a2c107635462cdaddc6e0bcb07b8f11f14ad6e29cdcf9bc038a : not (TwoRamseyProp 4 8 (Power 3)).
Admitted.
Theorem missingprop_219cd9e9ae15be58af11f76b22218f6f910be27cfef2e0b8e92b2b26abb01a58 : not (TwoRamseyProp 4 8 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_4_8_Power_5 : not (TwoRamseyProp 4 8 (Power 5)).
Admitted.
Theorem missingprop_998aceb1b8d94f5cab0df3d9d8c137c685b236dfb9ccedae151bdb46b5cdf045 : not (TwoRamseyProp 4 9 (Power 3)).
Admitted.
Theorem missingprop_6302145d7575133a85279937634c49851399d2c5e77b31d2e52f64c466ec37f4 : not (TwoRamseyProp 4 9 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_4_9_Power_5 : not (TwoRamseyProp 4 9 (Power 5)).
Admitted.
Theorem not_TwoRamseyProp_4_9_Power_6 : not (TwoRamseyProp 4 9 (Power 6)).
Admitted.
Theorem missingprop_b77097b143bbb8267db46b41de2882c885072bbb6e81ca88e6aa367755edb786 : not (TwoRamseyProp 5 5 (Power 3)).
Admitted.
Theorem not_TwoRamseyProp_5_5_Power_4 : not (TwoRamseyProp 5 5 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_5_5_Power_5 : not (TwoRamseyProp 5 5 (Power 5)).
Admitted.
Theorem missingprop_cc9745f7c4d91725f31fc8c96dc2260fef0fe645b43f505847956178b0237820 : not (TwoRamseyProp 5 6 (Power 3)).
Admitted.
Theorem missingprop_5bd1079b775c7d4040b92e5148afc779efe6245ec71d88d08724a0e19224415d : not (TwoRamseyProp 5 6 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_5_6_Power_5 : not (TwoRamseyProp 5 6 (Power 5)).
Admitted.
Theorem missingprop_1c506fd1f65af050f13a4816325d72df1f505a8e4f8db6adf3f164b823601f6c : not (TwoRamseyProp 5 7 (Power 3)).
Admitted.
Theorem missingprop_9229f611e06c05b6b1879d05235a731becf0fc23c9cefc69c65af92da9cd4eae : not (TwoRamseyProp 5 7 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_5_7_Power_5 : not (TwoRamseyProp 5 7 (Power 5)).
Admitted.
Theorem not_TwoRamseyProp_5_7_Power_6 : not (TwoRamseyProp 5 7 (Power 6)).
Admitted.
Theorem missingprop_87e3ca351ea769734a1f23993a4fe38187001790bdc55f9861497456767e37fc : not (TwoRamseyProp 5 8 (Power 3)).
Admitted.
Theorem missingprop_3b8817afe1fed5ea5f0f8fa76123cb273b2eecc5e17709aa02782ffb86f0adc7 : not (TwoRamseyProp 5 8 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_5_8_Power_5 : not (TwoRamseyProp 5 8 (Power 5)).
Admitted.
Theorem not_TwoRamseyProp_5_8_Power_6 : not (TwoRamseyProp 5 8 (Power 6)).
Admitted.
Theorem missingprop_7675d8c467c3bb4bfcb301063bd0269eb4cd34a987d9e02f61bbb360f23b0f2d : not (TwoRamseyProp 6 6 (Power 3)).
Admitted.
Theorem missingprop_1e8eab9e01e2e768f2352fc2034a6fb374eca3aa03e3e4baeee124da4295d4bf : not (TwoRamseyProp 6 6 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_6_6_Power_5 : not (TwoRamseyProp 6 6 (Power 5)).
Admitted.
Theorem not_TwoRamseyProp_6_6_Power_6 : not (TwoRamseyProp 6 6 (Power 6)).
Admitted.
Theorem missingprop_f4f107abbda2bb72d1451aaf8a335dcaa0373ebba60b4c321a44023db48fafab : not (TwoRamseyProp 6 7 (Power 3)).
Admitted.
Theorem missingprop_045e6fd8f8f3d513192f90e2ef662d7a322f7854d64fbb0415b959094ebbc5a8 : not (TwoRamseyProp 6 7 (Power 4)).
Admitted.
Theorem not_TwoRamseyProp_6_7_Power_5 : not (TwoRamseyProp 6 7 (Power 5)).
Admitted.
Theorem not_TwoRamseyProp_6_7_Power_6 : not (TwoRamseyProp 6 7 (Power 6)).
Admitted.
Theorem TwoRamseyProp_3_4_Power_4 : TwoRamseyProp 3 4 (Power 4).
Admitted.
Theorem TwoRamseyProp_3_4_Power_5 : TwoRamseyProp 3 4 (Power 5).
Admitted.
Theorem TwoRamseyProp_3_4_Power_6 : TwoRamseyProp 3 4 (Power 6).
Admitted.
Theorem TwoRamseyProp_3_4_Power_7 : TwoRamseyProp 3 4 (Power 7).
Admitted.
Theorem TwoRamseyProp_3_4_Power_8 : TwoRamseyProp 3 4 (Power 8).
Admitted.
Theorem TwoRamseyProp_3_5_Power_4 : TwoRamseyProp 3 5 (Power 4).
Admitted.
Theorem TwoRamseyProp_3_5_Power_5 : TwoRamseyProp 3 5 (Power 5).
Admitted.
Theorem TwoRamseyProp_3_5_Power_6 : TwoRamseyProp 3 5 (Power 6).
Admitted.
Theorem TwoRamseyProp_3_5_Power_7 : TwoRamseyProp 3 5 (Power 7).
Admitted.
Theorem TwoRamseyProp_3_5_Power_8 : TwoRamseyProp 3 5 (Power 8).
Admitted.
Theorem TwoRamseyProp_3_6_Power_5 : TwoRamseyProp 3 6 (Power 5).
Admitted.
Theorem TwoRamseyProp_3_6_Power_6 : TwoRamseyProp 3 6 (Power 6).
Admitted.
Theorem TwoRamseyProp_3_6_Power_7 : TwoRamseyProp 3 6 (Power 7).
Admitted.
Theorem TwoRamseyProp_3_6_Power_8 : TwoRamseyProp 3 6 (Power 8).
Admitted.
Theorem TwoRamseyProp_3_7_Power_5 : TwoRamseyProp 3 7 (Power 5).
Admitted.
Theorem TwoRamseyProp_3_7_Power_6 : TwoRamseyProp 3 7 (Power 6).
Admitted.
Theorem TwoRamseyProp_3_7_Power_7 : TwoRamseyProp 3 7 (Power 7).
Admitted.
Theorem TwoRamseyProp_3_7_Power_8 : TwoRamseyProp 3 7 (Power 8).
Admitted.
Theorem TwoRamseyProp_3_8_Power_5 : TwoRamseyProp 3 8 (Power 5).
Admitted.
Theorem TwoRamseyProp_3_8_Power_6 : TwoRamseyProp 3 8 (Power 6).
Admitted.
Theorem TwoRamseyProp_3_8_Power_7 : TwoRamseyProp 3 8 (Power 7).
Admitted.
Theorem TwoRamseyProp_3_8_Power_8 : TwoRamseyProp 3 8 (Power 8).
Admitted.
Theorem TwoRamseyProp_3_9_Power_6 : TwoRamseyProp 3 9 (Power 6).
Admitted.
Theorem TwoRamseyProp_3_9_Power_7 : TwoRamseyProp 3 9 (Power 7).
Admitted.
Theorem TwoRamseyProp_3_9_Power_8 : TwoRamseyProp 3 9 (Power 8).
Admitted.
Theorem TwoRamseyProp_3_10_Power_6 : TwoRamseyProp 3 10 (Power 6).
Admitted.
Theorem TwoRamseyProp_3_10_Power_7 : TwoRamseyProp 3 10 (Power 7).
Admitted.
Theorem TwoRamseyProp_3_10_Power_8 : TwoRamseyProp 3 10 (Power 8).
Admitted.
Theorem TwoRamseyProp_4_4_Power_5 : TwoRamseyProp 4 4 (Power 5).
Admitted.
Theorem TwoRamseyProp_4_4_Power_6 : TwoRamseyProp 4 4 (Power 6).
Admitted.
Theorem TwoRamseyProp_4_4_Power_7 : TwoRamseyProp 4 4 (Power 7).
Admitted.
Theorem TwoRamseyProp_4_4_Power_8 : TwoRamseyProp 4 4 (Power 8).
Admitted.
Theorem TwoRamseyProp_4_5_Power_5 : TwoRamseyProp 4 5 (Power 5).
Admitted.
Theorem TwoRamseyProp_4_5_Power_6 : TwoRamseyProp 4 5 (Power 6).
Admitted.
Theorem TwoRamseyProp_4_5_Power_7 : TwoRamseyProp 4 5 (Power 7).
Admitted.
Theorem TwoRamseyProp_4_5_Power_8 : TwoRamseyProp 4 5 (Power 8).
Admitted.
Theorem TwoRamseyProp_4_6_Power_6 : TwoRamseyProp 4 6 (Power 6).
Admitted.
Theorem TwoRamseyProp_4_6_Power_7 : TwoRamseyProp 4 6 (Power 7).
Admitted.
Theorem TwoRamseyProp_4_6_Power_8 : TwoRamseyProp 4 6 (Power 8).
Admitted.
Theorem TwoRamseyProp_4_7_Power_6 : TwoRamseyProp 4 7 (Power 6).
Admitted.
Theorem TwoRamseyProp_4_7_Power_7 : TwoRamseyProp 4 7 (Power 7).
Admitted.
Theorem TwoRamseyProp_4_7_Power_8 : TwoRamseyProp 4 7 (Power 8).
Admitted.
Theorem TwoRamseyProp_4_8_Power_7 : TwoRamseyProp 4 8 (Power 7).
Admitted.
Theorem TwoRamseyProp_4_8_Power_8 : TwoRamseyProp 4 8 (Power 8).
Admitted.
Theorem TwoRamseyProp_4_9_Power_7 : TwoRamseyProp 4 9 (Power 7).
Admitted.
Theorem TwoRamseyProp_4_9_Power_8 : TwoRamseyProp 4 9 (Power 8).
Admitted.
Theorem TwoRamseyProp_5_5_Power_6 : TwoRamseyProp 5 5 (Power 6).
Admitted.
Theorem TwoRamseyProp_5_5_Power_7 : TwoRamseyProp 5 5 (Power 7).
Admitted.
Theorem TwoRamseyProp_5_5_Power_8 : TwoRamseyProp 5 5 (Power 8).
Admitted.
Theorem TwoRamseyProp_5_6_Power_7 : TwoRamseyProp 5 6 (Power 7).
Admitted.
Theorem TwoRamseyProp_5_6_Power_8 : TwoRamseyProp 5 6 (Power 8).
Admitted.
Theorem TwoRamseyProp_5_7_Power_8 : TwoRamseyProp 5 7 (Power 8).
Admitted.
Theorem TwoRamseyProp_5_8_Power_8 : TwoRamseyProp 5 8 (Power 8).
Admitted.
Theorem TwoRamseyProp_6_6_Power_8 : TwoRamseyProp 6 6 (Power 8).
Admitted.
Theorem TwoRamseyProp_3_10_40 : TwoRamseyProp 3 10 40.
Admitted.
Theorem TwoRamseyProp_3_10_41 : TwoRamseyProp 3 10 41.
Admitted.
Theorem TwoRamseyProp_4_6_36 : TwoRamseyProp 4 6 36.
Admitted.
Theorem TwoRamseyProp_4_6_40 : TwoRamseyProp 4 6 40.
Admitted.
Theorem TwoRamseyProp_4_7_49 : TwoRamseyProp 4 7 49.
Admitted.
Theorem TwoRamseyProp_4_7_60 : TwoRamseyProp 4 7 60.
Admitted.
Theorem TwoRamseyProp_4_8_59 : TwoRamseyProp 4 8 59.
Admitted.
Theorem TwoRamseyProp_4_8_83 : TwoRamseyProp 4 8 83.
Admitted.
Theorem TwoRamseyProp_4_9_73 : TwoRamseyProp 4 9 73.
Admitted.
Theorem TwoRamseyProp_4_9_114 : TwoRamseyProp 4 9 114.
Admitted.
Theorem TwoRamseyProp_5_5_43 : TwoRamseyProp 5 5 43.
Admitted.
Theorem TwoRamseyProp_5_5_47 : TwoRamseyProp 5 5 47.
Admitted.
Theorem TwoRamseyProp_5_6_58 : TwoRamseyProp 5 6 58.
Admitted.
Theorem TwoRamseyProp_5_6_86 : TwoRamseyProp 5 6 86.
Admitted.
Theorem TwoRamseyProp_5_7_80 : TwoRamseyProp 5 7 80.
Admitted.
Theorem TwoRamseyProp_5_7_142 : TwoRamseyProp 5 7 142.
Admitted.
Theorem TwoRamseyProp_5_8_101 : TwoRamseyProp 5 8 101.
Admitted.
Theorem TwoRamseyProp_5_8_215 : TwoRamseyProp 5 8 215.
Admitted.
Theorem TwoRamseyProp_6_6_102 : TwoRamseyProp 6 6 102.
Admitted.
Theorem TwoRamseyProp_6_6_164 : TwoRamseyProp 6 6 164.
Admitted.
Theorem TwoRamseyProp_6_7_115 : TwoRamseyProp 6 7 115.
Admitted.
Theorem TwoRamseyProp_6_7_297 : TwoRamseyProp 6 7 297.
Admitted.
