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
Theorem missingprop_dd12bbe0d4a49d4392f0cf8bc87d132f205c2fd6bffb6ab963d1738be94e2fba : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x0 (x3 (x2 x4))))).
admit.
Qed.
Theorem missingprop_726efda9cb61df3d507e02dc56ec2bf2c23da8346c61158565a39fe76654a6c4 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> (forall x5, x0 x5 -> x0 (x4 (x3 (x2 x5)))))).
admit.
Qed.
Theorem missingprop_ab41805a8a4ab7c7c01a1df079c60a640aa70314c21617f5f9dfae767cc5368c : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> (forall x6, x0 x6 -> x0 (x5 (x4 (x3 (x2 x6))))))).
admit.
Qed.
Theorem missingprop_f50d30ec41a9ed1eb36047ef858083f2c1ecab3e502982a12fc1b061c8d0fdfb : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> (forall x7, x0 x7 -> x0 (x6 (x5 (x4 (x3 (x2 x7)))))))).
admit.
Qed.
Theorem missingprop_9df0051fe5649d34dd14e90f9946f82bcfe3445ae6c6fefd9c7d30607b4a3534 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> (forall x8, x0 x8 -> x0 (x7 (x6 (x5 (x4 (x3 (x2 x8))))))))).
admit.
Qed.
Theorem missingprop_f9dac9dcb632653e5daff02aecdc1b2454f714ec934721e932ed39cedb936920 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> (forall x9, x0 x9 -> x0 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x9)))))))))).
admit.
Qed.
Theorem missingprop_6998f1967a37ce79bf145b799234d391f8f1c42a3dd1f19ca25be7477a1f0225 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> (forall x10, x0 x10 -> x0 (x9 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x10))))))))))).
admit.
Qed.
Theorem missingprop_f3ee2282a86eeaf035e1d1caa2ca12d6384afd439c32bea91d3897ba37fdf73a : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> (forall x11, x0 x11 -> x0 (x10 (x9 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x11)))))))))))).
admit.
Qed.
Theorem missingprop_a9fbb61ed2ab91cd44a7d8d4e0447a0208b969e07a62975d787db35bc82caf92 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> (forall x12, x0 x12 -> x0 (x11 (x10 (x9 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x12))))))))))))).
admit.
Qed.
Theorem missingprop_885020d5bd16b798a0b8fa9e314bf21d0bc0abd97031458c182ae74eedd29270 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> (forall x13, x0 x13 -> x0 (x12 (x11 (x10 (x9 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x13)))))))))))))).
admit.
Qed.
Theorem missingprop_086267184dda37afca08da7fe438b3755de5cdc1fb58396ed2fd97812756df4c : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> (forall x14, x0 x14 -> x0 (x13 (x12 (x11 (x10 (x9 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x14))))))))))))))).
admit.
Qed.
Theorem missingprop_4c73735480229ba74e284a25411855470baa4a9c090937f3c99b5d37a5dcfa2b : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> (forall x15, x0 x15 -> x0 (x14 (x13 (x12 (x11 (x10 (x9 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x15)))))))))))))))).
admit.
Qed.
Theorem missingprop_7c73a40f167c5d3a53688ddf9ace04d94ef041d34ef6cb13446c6a5adf502fcd : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> x1 x15 -> (forall x16, x0 x16 -> x0 (x15 (x14 (x13 (x12 (x11 (x10 (x9 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x16))))))))))))))))).
admit.
Qed.
Theorem missingprop_2bdb4c5556be2b32d7566dc3af4be72cefa9996183118366c05e6a28b5f3d57a : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> x1 x15 -> x1 x16 -> (forall x17, x0 x17 -> x0 (x16 (x15 (x14 (x13 (x12 (x11 (x10 (x9 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x17)))))))))))))))))).
admit.
Qed.
Theorem missingprop_393bb07f421d66ba678a176080026d14893d69589d3d84ada02e7f802d98bf05 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> x1 x15 -> x1 x16 -> x1 x17 -> (forall x18, x0 x18 -> x0 (x17 (x16 (x15 (x14 (x13 (x12 (x11 (x10 (x9 (x8 (x7 (x6 (x5 (x4 (x3 (x2 x18))))))))))))))))))).
admit.
Qed.
Theorem missingprop_369fdf31a84537fcb40325ca4cd3b1e1dc3070515a73465cd8b13adde8b5da0f : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> (forall x5, x0 x5 -> x2 (x3 (x4 x5)) = x3 (x2 (x4 x5))))).
admit.
Qed.
Theorem missingprop_89fd83854c5f1d85e8a25a695cd9584e2107dbdc7c3e9ce5049e96e430f178b4 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> (forall x6, x0 x6 -> x2 (x3 (x4 (x5 x6))) = x3 (x2 (x4 (x5 x6)))))).
admit.
Qed.
Theorem missingprop_b8e8ce276b0a4954b7e17dd000c98a79a19bb4d9ffcc3cb7010552b09dee084c : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> (forall x7, x0 x7 -> x2 (x3 (x4 (x5 (x6 x7)))) = x3 (x2 (x4 (x5 (x6 x7))))))).
admit.
Qed.
Theorem missingprop_ee7da36f82fa829b0612052894e469865a8742ba83804da207df2963b0cf406c : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> (forall x8, x0 x8 -> x2 (x3 (x4 (x5 (x6 (x7 x8))))) = x3 (x2 (x4 (x5 (x6 (x7 x8)))))))).
admit.
Qed.
Theorem missingprop_8971d5c3d3ec85f7bcd27406d1467f71ab95463af3555f5657ce6f94caca4ef9 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> (forall x9, x0 x9 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 x9)))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 x9))))))))).
admit.
Qed.
Theorem missingprop_a70534b578015d586aa8a72b37829114d577ac778b073fd6e581372f02ba67c0 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> (forall x10, x0 x10 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 x10))))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 (x9 x10)))))))))).
admit.
Qed.
Theorem missingprop_b1aaba33db17a303ddb30941ee77351426bfd4f0c7e33f15d2b477db9de4e3f2 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> (forall x11, x0 x11 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 x11)))))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 (x9 (x10 x11))))))))))).
admit.
Qed.
Theorem missingprop_216c21008b53699563e016b4d44226f2247a3ea7e821bb40c3e9ffcc5f5e9eae : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> (forall x12, x0 x12 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 x12))))))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 x12)))))))))))).
admit.
Qed.
Theorem missingprop_49730781d2cd8e079c94e39f886b1363640d9d7a8c2850c05d4ec426ef0bdc83 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> (forall x13, x0 x13 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 x13)))))))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 x13))))))))))))).
admit.
Qed.
Theorem missingprop_1ffc9071a1eb892280fc9b428d18d0cbca1f67de9a2954bc0c3ef11a987ec602 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> (forall x14, x0 x14 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 x14))))))))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 x14)))))))))))))).
admit.
Qed.
Theorem missingprop_86856dc53557f43006395c497f2d178842a6b138bf2819d1af92de475faaf5a9 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> (forall x15, x0 x15 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 x15)))))))))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 x15))))))))))))))).
admit.
Qed.
Theorem missingprop_c48c2ffe63051d3a3d504be2de7d9e2348eb28873b3d277c84ecf8a9c561c8f3 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> x1 x15 -> (forall x16, x0 x16 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 x16))))))))))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 x16)))))))))))))))).
admit.
Qed.
Theorem missingprop_f4261d2423e2fa93234a33bd2c6052b7ce91a954416cff98b0ebeff815f86267 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> x1 x15 -> x1 x16 -> (forall x17, x0 x17 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 (x16 x17)))))))))))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 (x16 x17))))))))))))))))).
admit.
Qed.
Theorem missingprop_881ed4292d0fde4f1ef290b36f032f3e136888b8590dddc1bb4900cbd64b4d0b : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> x1 x15 -> x1 x16 -> x1 x17 -> (forall x18, x0 x18 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 (x16 (x17 x18))))))))))))))) = x3 (x2 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 (x16 (x17 x18)))))))))))))))))).
admit.
Qed.
Theorem missingprop_83a891a4a926cbdce37fd271221fb0ce58c8a724c37c2abb7450afddc5f40841 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> (forall x5, x0 x5 -> x2 (x3 (x4 x5)) = x4 (x2 (x3 x5))))).
admit.
Qed.
Theorem missingprop_26c80302b0a528fdb44581b0f4aaf59dc81bfaf868c43274bd7cba42973a25dc : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> (forall x6, x0 x6 -> x2 (x3 (x4 (x5 x6))) = x5 (x2 (x3 (x4 x6)))))).
admit.
Qed.
Theorem missingprop_0521dbe368717571f9f850eaad919a29f7906fa75f981f32010220d29ca2b6a8 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> (forall x7, x0 x7 -> x2 (x3 (x4 (x5 (x6 x7)))) = x6 (x2 (x3 (x4 (x5 x7))))))).
admit.
Qed.
Theorem missingprop_20e3d9daad10643da9c438809a1434b9a92a41c6d51d090ecc225b58bb198311 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> (forall x8, x0 x8 -> x2 (x3 (x4 (x5 (x6 (x7 x8))))) = x7 (x2 (x3 (x4 (x5 (x6 x8)))))))).
admit.
Qed.
Theorem missingprop_46d319e806423f3dd208e718ffec9ba385835fad7940dfe5f10e1efe5a189ac9 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> (forall x9, x0 x9 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 x9)))))) = x8 (x2 (x3 (x4 (x5 (x6 (x7 x9))))))))).
admit.
Qed.
Theorem missingprop_21c06cce548a4df9c9e16000463af5090a8e642f7e7cc473868276ae6a47442e : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> (forall x10, x0 x10 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 x10))))))) = x9 (x2 (x3 (x4 (x5 (x6 (x7 (x8 x10)))))))))).
admit.
Qed.
Theorem missingprop_5ea5e5e87ca5ac3d9ab74ca494dd3a423bfc2b4265c66c45529456ec00a69802 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> (forall x11, x0 x11 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 x11)))))))) = x10 (x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 x11))))))))))).
admit.
Qed.
Theorem missingprop_2bb7e2b8b1d6c03f5ec8d3310acff393b6f23d539a10a09170ab6ce8840032f3 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> (forall x12, x0 x12 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 x12))))))))) = x11 (x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 x12)))))))))))).
admit.
Qed.
Theorem missingprop_71fd44a88b6517c6e2eab9ece368aa2cf87e4b657522ab1b9bac0c163646ef49 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> (forall x13, x0 x13 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 x13)))))))))) = x12 (x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 x13))))))))))))).
admit.
Qed.
Theorem missingprop_b28518e2b47087ec7db607a987a2cdda4df2e443928065dcfcb1da19a6240b8c : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> (forall x14, x0 x14 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 x14))))))))))) = x13 (x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 x14)))))))))))))).
admit.
Qed.
Theorem missingprop_4a640d485327c6e3e7815d4af8329e6a908da058b2b110e9449d3fd016d72f38 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> (forall x15, x0 x15 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 x15)))))))))))) = x14 (x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 x15))))))))))))))).
admit.
Qed.
Theorem missingprop_fbde377f4f33c71ff9b381974dbc53fc264553fd28a9a1bb1a3bb6379581c231 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> x1 x15 -> (forall x16, x0 x16 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 x16))))))))))))) = x15 (x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 x16)))))))))))))))).
admit.
Qed.
Theorem missingprop_debf939be39f54f876e685c8babfb70efa53203928267efcef19bf8e5ea489e7 : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> x1 x15 -> x1 x16 -> (forall x17, x0 x17 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 (x16 x17)))))))))))))) = x16 (x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 x17))))))))))))))))).
admit.
Qed.
Theorem missingprop_d2baa6f9ea20f05e89314518e2bda84fad50390ea01a7bbfa3634ba23f53725c : (forall x0 : set -> prop, forall x1 : (set -> set) -> prop, (forall x2 : set -> set, x1 x2 -> (forall x3, x0 x3 -> x0 (x2 x3))) -> (forall x2 x3 : set -> set, x1 x2 -> x1 x3 -> (forall x4, x0 x4 -> x2 (x3 x4) = x3 (x2 x4))) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set -> set, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> x1 x6 -> x1 x7 -> x1 x8 -> x1 x9 -> x1 x10 -> x1 x11 -> x1 x12 -> x1 x13 -> x1 x14 -> x1 x15 -> x1 x16 -> x1 x17 -> (forall x18, x0 x18 -> x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 (x16 (x17 x18))))))))))))))) = x17 (x2 (x3 (x4 (x5 (x6 (x7 (x8 (x9 (x10 (x11 (x12 (x13 (x14 (x15 (x16 x18)))))))))))))))))).
admit.
Qed.
