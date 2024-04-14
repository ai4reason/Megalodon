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
Theorem missingprop_77decf6bf1332e51bcea19ab2a61784f9a76d4bc1da5ba5642776f807627043b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 (x1 x2 (x1 x3 x4)) x5 = x1 x2 (x1 x3 (x1 x4 x5)))).
admit.
Qed.
Axiom missingprop_a6006624829d7d44dfef146f097f47f429351018787d2b11ce9751df54eb1332 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x0 (x1 x2 (x1 x3 x4)))).
Theorem missingprop_c3af028adb093906f05778689ae9fc77f45e6f5023196e33f45d38dc06071320 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 (x1 x2 (x1 x3 (x1 x4 x5))) x6 = x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))))).
admit.
Qed.
Axiom missingprop_b48d4480a5526e51a91293fec1b0b9440be4280265441ce358bda14cced12479 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 (x1 x2 (x1 x3 (x1 x4 x5))))).
Theorem missingprop_b833aa06c1faed5d76aa7b67b54605577d0e95ae20c23cac91bc46748e38d0cb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))) x7 = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))))).
admit.
Qed.
Axiom missingprop_d7ce6357a8261c6a4be44f579bedcb1c2d65cec14964ea078af8f02cc5aab85a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))))).
Theorem missingprop_c4ddb10955189acaa0e73a79092d08be51c123dc1e586344a586ed01c4dfb456 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))) x8 = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))))).
admit.
Qed.
Axiom missingprop_14619fcdadc5a43502995316176da02be54150d716fe5c9727e811d162c28b04 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))))).
Theorem missingprop_414eed97531e870b4b344143e4355e4406dc96eea8bc42f6a67b6ab434153348 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))) x9 = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))))).
admit.
Qed.
Axiom missingprop_025d233877239fdf8667e3ba4d630729f1334dc236b8bf7cefec04c2fd303300 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))))).
Theorem missingprop_120974defda5a3fe230b978b318a4933d1851a82690280278a0c3a7271279902 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))) x10 = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))))).
admit.
Qed.
Axiom missingprop_edbdc31c8b550a683544e2ad315a13cf7bd7f44068be39efa27faf89c5105937 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))))).
Theorem missingprop_f9821c5bf17fe69a7bbbaf6eeae5ac13f7453dcebf12a7c80cb773df0edf4ab9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10)))))))) x11 = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
admit.
Qed.
Axiom missingprop_e3761daa583c62dd19e21ac5ecc36db62b544996e686d7070ae47678e3d87642 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10)))))))))).
Theorem missingprop_e77e6662925b2c2c197139476f21d21a87873360587d0884ac54656526833984 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11))))))))) x12 = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))))).
admit.
Qed.
Axiom missingprop_5b486140b3675dc9982aecd3fd8b54170f576a6488bd9894cf4b35517b5b2768 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11))))))))))).
Theorem missingprop_4d8682f84af9c39bce68aeddde79980ed18f2bc7d072be75d3440e1ad037c2b8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12)))))))))) x13 = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))))).
admit.
Qed.
Axiom missingprop_3110297454f8d445696fa1ff6d16fb16e6639939f8e803a0cc7ed7a2132c96cf : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12)))))))))))).
Theorem missingprop_e7d7ab2afe35fa7121f31cf3ebeaaac140410fc5c046236464208d7f2f385d9f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13))))))))))) x14 = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))))).
admit.
Qed.
Theorem missingprop_ae400e77ab330c56df5b03b16c49908c970b882498a961345b0aed1773f36956 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4))).
admit.
Qed.
Axiom missingprop_4aef431da355638d092d1af3952763e46a0de88399b3400cacc13c5390d4cf48 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 (x1 x2 x3) (x1 x4 x5) = x1 x2 (x1 x3 (x1 x4 x5)))).
Theorem missingprop_0667e75d653c20843afa85cedfc1b5a2af164fb2ac3771faa0d6c581d9e1983c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x3 (x1 x2 (x1 x4 x5)))).
admit.
Qed.
Axiom missingprop_c1138762243f92f9929761f5486cb68feb113061102de6c98d30b7c79400b203 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 x6)) = x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))))).
Theorem missingprop_9fd91cb3481e5ab60bae0642e3a6f5d3cabb900d893cd4283220ac817695461a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x3 (x1 x2 (x1 x4 (x1 x5 x6))))).
admit.
Qed.
Axiom missingprop_3357afebd81483279cf67f1b7f967421c587ef898cabdea64b1348e221c1d50f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 x7))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))))).
Theorem missingprop_55bcc856f709b9c00e953040787c2dc445d48604a1e79989c08c9aa807e24bfa : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x3 (x1 x2 (x1 x4 (x1 x5 (x1 x6 x7)))))).
admit.
Qed.
Axiom missingprop_8ac7aa74b49b55d22730bc6bbed06370224f3acc68f362fcf7eae3895f34347e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))))).
Theorem missingprop_8784c19cca2eea4c25490980f56140eeea296da0cce7950e2548b2cf14dd838e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x3 (x1 x2 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))))).
admit.
Qed.
Axiom missingprop_e85c506c33654ffa12a67980252528aea9e3cce0d835474a16829c54d4c3786f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))))).
Theorem missingprop_942d4775c5ba26cbc3626cd317b018074f6c5fe8244e7baa095bff2a802193a7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x3 (x1 x2 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))))).
admit.
Qed.
Axiom missingprop_e4b074928db308f7714399b2450e738f50ff691adae6c3a8e91b656e119c69d9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10)))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))))).
Theorem missingprop_92a76d8035d6f6326102c7476f6d6b577399efa2d66644d90058963aa12b4e9b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))) = x1 x3 (x1 x2 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))))).
admit.
Qed.
Axiom missingprop_3d8be1424c68a4fbd2fc7519d72600a7ea80f1b1c348d71d7a49f22dc43384aa : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11))))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
Theorem missingprop_c4dbbbb51c788e8536a4514fb62f234e2ead122e498cf344782fba873587b98b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))) = x1 x3 (x1 x2 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
admit.
Qed.
Theorem missingprop_ae303a8d0cab343f95e0be158bf945462f9c4cc9682540de91545edc76f520ff : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x4 x2))).
admit.
Qed.
Theorem missingprop_77b4d4df99acd26da01b3d17a9d3db16e9a142757eeed4d0180646664896d9b9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x3 (x1 x4 (x1 x5 x2)))).
admit.
Qed.
Theorem missingprop_5cd1e251a67e909038b6cb5128d6d5df4579a859c5c9034831506ee9093c675c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 x2))))).
admit.
Qed.
Theorem missingprop_a5a0b5f004ccc99fdeda6fbfdcaf9ef5e595b3191018a091a58f7a9b00f57ae1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x2)))))).
admit.
Qed.
Theorem missingprop_721fae8449ac68dc5462a68a8c06fba79c9fe1aa34dcfdfa8deca4b4b148b4f7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x2))))))).
admit.
Qed.
Theorem missingprop_357877d91434976f4ed371d93b075af0e527107ca4da1ff6f29bd9744e748f43 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x2)))))))).
admit.
Qed.
Theorem missingprop_aaf61a7cfe5aacdff38d51796a472d7685d6089328b225bd648214a117c3c64e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x2))))))))).
admit.
Qed.
Theorem missingprop_40473cd7a180ec28ad9c002675177ac6744bbbd799b0566a08330b61b9322b7f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x2)))))))))).
admit.
Qed.
Theorem missingprop_46d3e44975f3ecade481a2af0d8577c059537308401949cdec866cf7484652af : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x4 (x1 x3 x2))).
admit.
Qed.
Theorem missingprop_d8e7baa091022c77c58267efb50a7b2c2026310b8fe0f6af8d2bfd3e7856ea8c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x5 (x1 x2 (x1 x4 x3)))).
admit.
Qed.
Theorem missingprop_90bbac62bad037cd3f5141812c524982590d50a3c583b53acd431c87fc3966ff : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x5 (x1 x3 (x1 x4 x2)))).
admit.
Qed.
Theorem missingprop_d0b4d4d4918b7218ce8225ff7bb2db362271f11164184f84ddb17cd6456a22a9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x5 (x1 x3 (x1 x2 x4)))).
admit.
Qed.
Theorem missingprop_1ed835615252dd5c9d2ff17c4d1b2715e0b1808ba71fa0bd36b593f0a238900c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x5 (x1 x4 (x1 x3 x2)))).
admit.
Qed.
Theorem missingprop_30981b7590515699a08684083a8d04c1f4a419a6155abf924a14b1ba3d34a218 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x5 (x1 x4 (x1 x2 x3)))).
admit.
Qed.
Theorem missingprop_7bc71fd9578b03a880df6eefd32a9b31c36ca06c2e8f662c76029333a8b53e4f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x4 (x1 x2 (x1 x5 x3)))).
admit.
Qed.
Theorem missingprop_d613eb187274e7a0f4edf2ef76a2a7db2b0d4be33311895feb4f67c7b6e1a815 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x4 (x1 x5 (x1 x2 x3)))).
admit.
Qed.
Theorem missingprop_b78c90246d5ec60efb4a61da770b6c042bbf55df9c0e5dbdb655346d0ac06479 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x4 (x1 x2 (x1 x3 x5)))).
admit.
Qed.
Theorem missingprop_6f316d3cbe859ae922e48f3e08d9a888686e74b7e98e7377d23bddae02677602 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x4 (x1 x3 (x1 x2 x5)))).
admit.
Qed.
Theorem missingprop_3861037bdec7a36a920ebbd8b0a55084dde66eed4750b9b9f3106781819a2462 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x3 (x1 x2 (x1 x5 x4)))).
admit.
Qed.
