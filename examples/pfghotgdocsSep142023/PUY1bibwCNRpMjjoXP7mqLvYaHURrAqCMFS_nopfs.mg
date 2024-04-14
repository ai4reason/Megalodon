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
Axiom missingprop_515047c02fed97c50f69ea07f84c55a116d5435d48e441446058ba601add8797 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x2 x7)))))).
Axiom missingprop_170f036c7a6d7daf14e3aff6b686b81c7c5831ebc8fc29a57081f8eaa089e9ff : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x2 (x1 x3 (x1 x5 (x1 x4 x9)))))))).
Theorem missingprop_9826890aa1138792bfe486f2e38f09be393f993fed42f828d6dfd86a6bdfa813 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_a1a2b3b601b2f937cf427c68ec13bbb7a1310db5e31b9df49ea02afff97d8cd6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Axiom missingprop_2ce9a82c8ef9efc0240c60d5f07d019e2f7a44da8d6114bc529d6fb2d8f3a783 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x3 (x1 x4 (x1 x5 (x1 x2 x6))))).
Theorem missingprop_dbd3d8ff86748e3736764be3b8ad9870627107d958f91f129545435753c65578 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_69e4ba00d30dace3b3123e6838f3163f92b0aa9f27af4f9872daf9b124edd613 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Axiom missingprop_4833083dacb275088801eefc314de3b06425b36764d4feccac8504873350e4b9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x3 (x1 x5 (x1 x2 (x1 x4 x9)))))))).
Theorem missingprop_f75c0bdb37a8c4317a788644f62c884f240267af72f0dcc1e42c01f3b9fe6a1a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_a3196872023a95e4e08327c716946e9d517d3c51a8d70217b24baccc21a87bf2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_522d0b3109965630c9e5d90da35da0eac47300f94fde38535c71d09ac86aaf8f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_3265e95b14cb672d24e00e8c6e5614caa4c7c8eb2cfc8b1918024c205e71ae0a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x4 x5)))))))).
admit.
Qed.
Axiom missingprop_53daba9aebc2b99fb50db3666ccf860790d9a934df185ea547a54c2615a86652 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x5 (x1 x7 (x1 x6 (x1 x4 (x1 x3 (x1 x2 x9)))))))).
Theorem missingprop_e8bc58c32784fc3579c311503900dcd1297c97ec5b88514a087e903f026917fd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x4 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_5b68775f4a8b049ecae235c8d597f6bfc071bba4131da7200ef57f043d11e691 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x4 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_1028ea3ca474a1ac3b76516e4b4d4a9e55eea17c75d2e109630a64c27a44486b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x5 (x1 x2 x4)))))))).
admit.
Qed.
Theorem missingprop_6cbc153700c9faae6cbd861ca9080a267383146079dd6e55f6fb6af975f7e8b3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x5 (x1 x2 x4)))))))).
admit.
Qed.
Axiom missingprop_d52e9b2e331e6b4e81b09bb4b576d0bfad4bd15b60f980fecfcc094e76c18eb8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x3 (x1 x4 (x1 x2 (x1 x5 x9)))))))).
Theorem missingprop_90614a2704bcedf6c0cf7deb2a59887972d8c094a69aad7e88a9eeecfaccead3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_e2eca05bc261c87fe77b3523bc9a1c2dd0564e18339651eebca769a71d968fcd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x6 x4)))))))).
admit.
Qed.
Axiom missingprop_6df806693864a23a378ddbca02cda4bb4bc233ff1daa8914d51c06eb72ff2550 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x3 (x1 x4 (x1 x2 x5)))).
Theorem missingprop_9b0971a2dfd498328465db56692d4e825f7b63a7978091a71db74cd93240629a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_240d8fff1f80fda242d20b1f24e9ee141dd8928b02e55c9a9d3659ced85743b0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_b2621fc73aded42efecc4b39387f9507f2320124ad1a0d0530409453444cd628 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x4 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_45048ed091cd0106fa2c2bacd4dff65df51fa7a934f8c13dbcb7e26bd8193279 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x4 (x1 x2 x6)))))))).
admit.
Qed.
Axiom missingprop_21c25afad44a78b86f59c68ff9b0d47a99601b0f31e2045adc42944c8fccabf1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x5 (x1 x6 (x1 x7 (x1 x4 (x1 x3 (x1 x2 x9)))))))).
Theorem missingprop_29008a96a3173439c5d0eb192c0f2be5a8cf15679884c9ead4a5f6b7949e507f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x6 (x1 x2 x4)))))))).
admit.
Qed.
Theorem missingprop_7cc465d8e50d076f789b01066035be7cb3480fbf00648abdf859e4fbe0f2c917 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x6 (x1 x2 x4)))))))).
admit.
Qed.
Theorem missingprop_fd70c15a9a0c40deecd30f7758fcf748c817c9c5e6911f05fe4c53b09bf3962c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_a20aa570ab1ce030782f489fee8370f0a3eb39e361f5e6a46831f511b990e01d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_f3e58e7ab2a476a7187ab895f475a2517a905a443f54fb0c4a09d2f7eeb253c1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_dd7eebb3228e9ea2893e17c8238db24ec0b9f60f109e33429e0c9379275a51ab : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_1693392362789d1e57055c74513ca12ce1032d2aa360198cc9011f9b3fbc9cf0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x5 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_97704c76a889782a04e9079eb10c60a72659e2478397be5ea7c04295ed6352af : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x5 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_8968024280652d2055d6bdfa2e7d85d00b8ef63a5831a87319443acbcb283aa3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x6 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_3f54168586ac99feeb59dcc53cc592d6e25537b2abe924dc20284026dea60da2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x6 (x1 x2 x5)))))))).
admit.
Qed.
Axiom missingprop_431d5c91b1f7c8d9d8391e6e8fafd8909229383d365c4ded5abe4f8a63865c4f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x3 (x1 x2 (x1 x4 (x1 x5 x9)))))))).
Theorem missingprop_7902446536dba2016a50484a3dd08ee61515471e37317921fc86f37b1964dbb3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_ec05a82b662d87a414e71076b705d6a53905520811dd4e2fcc75ee4f5651dd62 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_4b272f605651855e8c9ce20a168dbc439254fb373ce5a59aaa58e44ef95b1e41 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_f51e8d768a2f40d422c36af5b9384e8182fe16df67318e8b20e9f4b3f091e924 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_d77a62cbeffe2d820c483b7b3a9ba497a6237b538dedb2d53e1903d28333ac94 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x5 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_ad88db0f38c8931954eb810c77dd5dc59f45efd5923c2701eb902a5c957b572b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x5 (x1 x6 x4)))))))).
admit.
Qed.
Axiom missingprop_488e62b51483863e4fb19b4c01c1d57859a3460e4978022f555a649e58937e0a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x3 (x1 x2 (x1 x5 (x1 x4 x9)))))))).
Theorem missingprop_df5d5d334c75d1a4f44df9bd2dd3f62fea3959931e874b4ed689f2f924a15019 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x5 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_4022a538cd1a224997174ffdba348ab502dc475ae106a56a8aa132ff659d3dca : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x5 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_905c71d5b5687c90f65d51cdbbf3367d9cca18723df9361f296bc4265e91d017 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_27d4202234e210d6f4ac2d9883a0398479b3ef615aba40369e8abfd728f9608d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_3644a3f4b5615b4faee45498299f4a8532833b9503243f4d73e729c602694a09 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_d477756f624c8bf655d13e9658f2e0236f66ccaa09c0291f532336977c62a034 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Axiom missingprop_9b08836e02c4ecab23ffe407c500b75674d8128928669b1aa1e6670ede61d6f8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x2 x8))))))).
Theorem missingprop_057957adccd77db8129f43735be90ab60d841242d5179dd21d5c7414d2e9e16c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x2 (x1 x5 x3)))))))).
admit.
Qed.
Theorem missingprop_8c5b41128ad5e6e78574a93e91d9fea9a63df123a094649473645f2c54e04e68 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x2 (x1 x5 x3)))))))).
admit.
Qed.
Axiom missingprop_2986c331072ce432d72644306986a15fb6d01bb1528374ce9d588bafff0d2781 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x4 (x1 x5 (x1 x2 (x1 x3 x9)))))))).
Theorem missingprop_de19640920e9182d0e3806dad1bc1bdf15523a5830854e5963919a95d7ff5eab : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x2 (x1 x3 x5)))))))).
admit.
Qed.
Theorem missingprop_1c3021cad749aa8c4c72a1de25819499e4a5edcdd4abf9333010435456e67305 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x2 (x1 x3 x5)))))))).
admit.
Qed.
Axiom missingprop_687cf0b142c8c750691cfd44d2b9e0c6b59dd5975b21d9fe0bd130dbabc8d984 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x4 (x1 x5 (x1 x3 (x1 x2 x9)))))))).
Theorem missingprop_3d98019418582121f0402285b967d397b22572e4749f5caaee3dc7e0c2ce6326 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x3 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_78baaede0a4bb46e773dc0c7ff883851de9486c3c65d676d0be2b8e527ac6581 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x3 (x1 x2 x5)))))))).
admit.
Qed.
Axiom missingprop_e032662aa31d0d7c6cd21c7ec8f978be1dee32c5d8585622c751063506e260f9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x2 x9)))))))).
Theorem missingprop_83e5d0a8e7c7408ed27df1528cc7e7c952b0bd3a64cca298310e44794e032a25 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x5 (x1 x3 x2)))))))).
admit.
Qed.
Theorem missingprop_bb4c2eee3b45c26bd89425eb9d2db9a1af8967d2e87a8fd6032ecb88238d3ebf : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x5 (x1 x3 x2)))))))).
admit.
Qed.
Theorem missingprop_1582d9349ae7762afd3ec7f7cdd2d74aab2249af98f0e354c7d84bd281d873aa : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x5 (x1 x2 x3)))))))).
admit.
Qed.
Theorem missingprop_9441cc3c3702dddf04fbb2e23653d60670849bec3057bbfee2450c2afbbd35f0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x6 (x1 x5 (x1 x2 x3)))))))).
admit.
Qed.
Theorem missingprop_0f6c683046fa4a86813ef0beb26c71e96a87036725ebd466514d991d330dba60 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x2 (x1 x6 x3)))))))).
admit.
Qed.
Theorem missingprop_4ee2362d280c39543636908d2dc59be346b9bc0b8fca2485eb8df064340ef244 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x2 (x1 x6 x3)))))))).
admit.
Qed.
Theorem missingprop_e2e8f72edc421425b505c72ebd75be3dc8374c35be6325f0b64045e9ea78989f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x2 (x1 x3 x6)))))))).
admit.
Qed.
Theorem missingprop_b6f8c6779d4f233cd83b015081d19e25d2daf29d2508627127b7526a2e7c57fb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x2 (x1 x3 x6)))))))).
admit.
Qed.
Theorem missingprop_6fac060326f9684892a3a41d6f09906027cef601af73c4fd46e663cf0324a24f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x3 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_4e63c4b00524445bb266674a63530e1bb802e4802e781977c83f40157f6daa69 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x3 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_b7b060267c4c253c037d01562b15cdc42adf55fe51bc6ca0c9eaae67eca1bb9c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x6 (x1 x3 x2)))))))).
admit.
Qed.
Theorem missingprop_bab68c5805d3278fab519f92083458957c2a2b6a13c31304719ea53e7554eaf2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x6 (x1 x3 x2)))))))).
admit.
Qed.
Theorem missingprop_af4d5969fb314755628a4c12b90242f2479148f63f0544949c6afe718fecae3c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x6 (x1 x2 x3)))))))).
admit.
Qed.
Theorem missingprop_658d6d56004e59ce443be8b1764dc9647834ec21c86d1b03aad2f11017851203 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x5 (x1 x6 (x1 x2 x3)))))))).
admit.
Qed.
Axiom missingprop_1ebc6ea100d985caba3ca36fd467134ef1ed56b1b801f42c3ede7564c07b04bc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x4 (x1 x3 (x1 x2 (x1 x5 x9)))))))).
Theorem missingprop_f05f1abe6f1bae1f0ea14e03b3c10df6d51448704722dd8b0e7399c345683adb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x3 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_677d188080ba805ecdbdc7aa85bc00deec14cd08b2b054780f448309838bc9f0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x3 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_34046ef5820af0b842a7c8fe03e6b5e2eabe7abe273ae2d056853a5d4ea0b86a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x3 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_a539e027870aff2c56d5ee91ac6a7c76a557aeca4a245d581f88e682ea05ce1b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x3 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Axiom missingprop_b1104d67e7677d35dbb23baf9f6cb355008c4ee57fd3b4453a548735a4f6f2a2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x6 (x1 x5 (x1 x7 (x1 x4 (x1 x3 (x1 x2 x9)))))))).
Theorem missingprop_aa2eb7fbcf6307a0eea1653fe30bda7fc88ccd199e879d2452c259dc8ca7d82f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x3 (x1 x5 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_b71b83f6feb00da03e399a20c5f280a4cb7393e4e3a18bc536d832748377230d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x3 (x1 x5 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_57c1f2ec4aa26bd2413a47c77f97f4f257144bfb5c839a0663ee74747ce5da53 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x3 (x1 x6 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_90295041654cc0a7eea11664d7abbeff3fa3f6e98f5f83b5e37d359a63b1e021 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x3 (x1 x6 (x1 x2 x5)))))))).
admit.
Qed.
Axiom missingprop_b3ece6e3cae4829a7349191da2ba1264d8fc72d1a0e6d0af88ed4d1580e0562b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x4 (x1 x2 (x1 x3 (x1 x5 x9)))))))).
Theorem missingprop_9b857bc61a1411f1659c9fd14768b63c7c8fb3630463837342f1c0cd710e6edb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x3 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_3569f290e4ccc67dd4085d0965163fa52a78e51ecd566a34f0b49c86de84d058 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x3 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_8500ecc17d70ee60336fd72793942c5a876ac6bf650cf90b883430bdfbf964ec : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x3 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_19af034ce037e1cfcf6f5d4d6ae67d0ac6171ddaec4d9c11a04ba1d6f71672c7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x3 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_413548578b4d3039a7d423871b9e5dcee3a72a713b467589111d516b2c570e3d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x5 (x1 x6 x3)))))))).
admit.
Qed.
Theorem missingprop_22bfe5ff0186ce1eb561f1fcb59048b289885a3fffc5699caa081aff23b8974b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x5 (x1 x6 x3)))))))).
admit.
Qed.
Axiom missingprop_2d82201bdd7ae593d1f0e7671322f6a68c3f04922ece479f3635293052024c47 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x4 (x1 x2 (x1 x5 (x1 x3 x9)))))))).
Theorem missingprop_364222dd63704838067748a5ef7e672ff3fcb04cdf369aa1f440dbd48d436a61 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x5 (x1 x3 x6)))))))).
admit.
Qed.
Theorem missingprop_0952d7dc7188be5c5384324bdf22b331c352024847d5b166b449b16b03071159 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x5 (x1 x3 x6)))))))).
admit.
Qed.
Theorem missingprop_14aaaee0a571aecc794b7b6f8e1592e342a5163399679a268131f2789280c5b0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x6 (x1 x5 x3)))))))).
admit.
Qed.
Theorem missingprop_c9c07fca35b044a20bfe994e7db1fac2fc0385af83b9e288e5e2fc50408c18a1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x6 (x1 x5 x3)))))))).
admit.
Qed.
Theorem missingprop_679ae63398d7f125c4a7e608724be623c207cbecb25c1a3b2ab1158fbb76e8da : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x6 (x1 x3 x5)))))))).
admit.
Qed.
Theorem missingprop_954de9c92ce00797013d41ec81b9f7137cac73c5827a6427740df418b89456fc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x4 (x1 x2 (x1 x6 (x1 x3 x5)))))))).
admit.
Qed.
Theorem missingprop_ec031d98dd5f22ce8e6a7d96879cf381cf6bba5841f2ca330b2b096429bc4164 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x2 (x1 x4 x3)))))))).
admit.
Qed.
Theorem missingprop_92a304ab911dc47692937a31083e44491abccd564b1601b8f1dcbeb829fcfa45 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x2 (x1 x4 x3)))))))).
admit.
Qed.
Theorem missingprop_29ac722496dcc51d1e606d4cb1c845838ab6d81b156f2640a82e036335f78a2e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x2 (x1 x3 x4)))))))).
admit.
Qed.
Theorem missingprop_64ff2452ecb74744553910db0548d39538733f0784ae36fd83f01cd25ad5514c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x2 (x1 x3 x4)))))))).
admit.
Qed.
Theorem missingprop_e225b615bd1e8d6f6a0693e39a40e3a2cc5085c0851370d267cc8763e910dcb7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x3 (x1 x2 x4)))))))).
admit.
Qed.
Theorem missingprop_b6a4b015c09fd0aedd674dee7e50710daa268429d52421ab56375894ddfd4068 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x3 (x1 x2 x4)))))))).
admit.
Qed.
Theorem missingprop_4d9017bf2b11ac0326a9bea7c9e9425aa1e3eacbcd687418750ac8d947106291 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x4 (x1 x3 x2)))))))).
admit.
Qed.
Theorem missingprop_bfaaa1a2eb4b05a9aa6d9fea6905da1b7eb3cd4e1b9b9486b987d0e90be22c7e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x4 (x1 x3 x2)))))))).
admit.
Qed.
Theorem missingprop_43549c09ff48bd1034ef5b70290e85bd49d1558e122429830831dadfb6e34ecf : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x4 (x1 x2 x3)))))))).
admit.
Qed.
Theorem missingprop_19d722daf15b50661afe1e555151798e622de921f42f9ca4cc623ac39160cd2f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x6 (x1 x4 (x1 x2 x3)))))))).
admit.
Qed.
Theorem missingprop_2ee726fc31bb72bc5651c7f9825c655a4d5e8940e6430abf79255d0b961cd08c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x2 (x1 x6 x3)))))))).
admit.
Qed.
Theorem missingprop_e205400534da508f526232ceb64e213d8ab7ab0d4a7feb7a46875d21398f3296 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x2 (x1 x6 x3)))))))).
admit.
Qed.
Axiom missingprop_65b3e570d8ac835a176ab3ef862b8d135a3c0c1fbaceefc01f93084fbf00c8ea : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x5 (x1 x4 (x1 x2 (x1 x3 x9)))))))).
Theorem missingprop_261521ceb6ccbb15e41fc5f6a21e5ee35531f79bf5171405cb4d3904d3a69f97 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x2 (x1 x3 x6)))))))).
admit.
Qed.
Theorem missingprop_4cdd2f7bb9454edee9d6952c4745e0be58defe84afe0e91ba91416b16ab72672 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x2 (x1 x3 x6)))))))).
admit.
Qed.
Axiom missingprop_f102789d46edc7c0bc712685d61d5e938b5a043c08a1cfbe5fdb97f37a4cf80e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x5 (x1 x4 (x1 x3 (x1 x2 x9)))))))).
Theorem missingprop_c6185bb885060f49767c28ed0432d66dad7f69f82e7b297389d2c1257b7c7d09 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x3 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_e81778d7cbc97a7be6eea8d1b9c9f4a15a2dcfc44c40b699688c1b505165e270 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x3 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_3f1f4df90307838e9c3c8448cb68e97c4397521485a0cc2c95c721e906df2ca3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x6 (x1 x3 x2)))))))).
admit.
Qed.
Theorem missingprop_34bf6dfe200de1cef93a6ed82d377f06c7eda767e7ff3cfa2ab62de94d751682 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x6 (x1 x3 x2)))))))).
admit.
Qed.
Theorem missingprop_b3f07c9109536be5f2fbb411ab0ce9a6dae8156b6fa582a68ac42093da1555e9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x6 (x1 x2 x3)))))))).
admit.
Qed.
Theorem missingprop_284e2a108525a108cb64b8ce88891902ac82671cb9e32725729c823f16e1ca04 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x4 (x1 x6 (x1 x2 x3)))))))).
admit.
Qed.
Theorem missingprop_6d754f00eeffeb1c41c2ffa469f1e5aee39a83ac7e82d0e92c641e54677e85fe : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x3 (x1 x2 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_dff8e5759d9b52cdb5c4cc8f10512a394b86a09e17cf116950ba72617f56925e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x3 (x1 x2 (x1 x6 x4)))))))).
admit.
Qed.
Axiom missingprop_669056af5a85891fca8f2efd81ddd7726887c5e55b1452f782c1ea9865cf692a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x6 (x1 x5 (x1 x3 (x1 x2 (x1 x4 x9)))))))).
Theorem missingprop_7b7e2067a5c05e576de36a61383923f1261ab430965d8186edd5bdedff579725 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x3 (x1 x2 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_2c4df4eaa31a31770c6ae83e53fcf9d179b3e686dc92d3618bbc933ca9f47d8b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x3 (x1 x2 (x1 x4 x6)))))))).
admit.
Qed.
Axiom missingprop_83a95b1fda840fdfc1a244568229beeef2477a7bdc3e00c9b4b99ac8bbc17f73 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x6 (x1 x7 (x1 x5 (x1 x4 (x1 x3 (x1 x2 x9)))))))).
Theorem missingprop_00303a60f288f904f68d974f276a4e7ac9b6aa642a7839f12d769ec18d4518f7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x3 (x1 x4 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_10eaad1d747f30764fc3ddf687e1b00aeed325af90857573256399c4d0f8c78c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x8 (x1 x7 (x1 x5 (x1 x3 (x1 x4 (x1 x2 x6)))))))).
admit.
Qed.
