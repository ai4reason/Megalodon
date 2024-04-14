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
Theorem missingprop_a6006624829d7d44dfef146f097f47f429351018787d2b11ce9751df54eb1332 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x0 (x1 x2 (x1 x3 x4)))).
admit.
Qed.
Theorem missingprop_b48d4480a5526e51a91293fec1b0b9440be4280265441ce358bda14cced12479 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 (x1 x2 (x1 x3 (x1 x4 x5))))).
admit.
Qed.
Theorem missingprop_d7ce6357a8261c6a4be44f579bedcb1c2d65cec14964ea078af8f02cc5aab85a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))))).
admit.
Qed.
Theorem missingprop_14619fcdadc5a43502995316176da02be54150d716fe5c9727e811d162c28b04 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))))).
admit.
Qed.
Theorem missingprop_025d233877239fdf8667e3ba4d630729f1334dc236b8bf7cefec04c2fd303300 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))))).
admit.
Qed.
Theorem missingprop_edbdc31c8b550a683544e2ad315a13cf7bd7f44068be39efa27faf89c5105937 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))))).
admit.
Qed.
Theorem missingprop_e3761daa583c62dd19e21ac5ecc36db62b544996e686d7070ae47678e3d87642 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10)))))))))).
admit.
Qed.
Theorem missingprop_5b486140b3675dc9982aecd3fd8b54170f576a6488bd9894cf4b35517b5b2768 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11))))))))))).
admit.
Qed.
Theorem missingprop_3110297454f8d445696fa1ff6d16fb16e6639939f8e803a0cc7ed7a2132c96cf : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12)))))))))))).
admit.
Qed.
Theorem missingprop_b6011236e1a22312171fb30ea3d87ed0b785ea60d02f5f2a289674442a86dda0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13))))))))))))).
admit.
Qed.
Theorem missingprop_4aef431da355638d092d1af3952763e46a0de88399b3400cacc13c5390d4cf48 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 (x1 x2 x3) (x1 x4 x5) = x1 x2 (x1 x3 (x1 x4 x5)))).
admit.
Qed.
Theorem missingprop_c1138762243f92f9929761f5486cb68feb113061102de6c98d30b7c79400b203 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 x6)) = x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))))).
admit.
Qed.
Theorem missingprop_3357afebd81483279cf67f1b7f967421c587ef898cabdea64b1348e221c1d50f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 x7))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))))).
admit.
Qed.
Theorem missingprop_8ac7aa74b49b55d22730bc6bbed06370224f3acc68f362fcf7eae3895f34347e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))))).
admit.
Qed.
Theorem missingprop_e85c506c33654ffa12a67980252528aea9e3cce0d835474a16829c54d4c3786f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))))).
admit.
Qed.
Theorem missingprop_e4b074928db308f7714399b2450e738f50ff691adae6c3a8e91b656e119c69d9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10)))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))))).
admit.
Qed.
Theorem missingprop_2d20c41fcc9a118a0c3b9c5b1baa7c68fc24a7eb196062ddabd928ab672e2748 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 (x1 x2 (x1 x3 x4)) (x1 x5 x6) = x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))))).
admit.
Qed.
Theorem missingprop_15c431ceaba103d0f1b38ad69d2d9fb3fc0d806dc9533577ab3f7d79f4d15397 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 (x1 x2 (x1 x3 x4)) (x1 x5 (x1 x6 x7)) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))))).
admit.
Qed.
Theorem missingprop_44aef7945610194a27d8af383be6b7fcc8cdf6125b80eab7af2e50396d77299d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 (x1 x2 (x1 x3 x4)) (x1 x5 (x1 x6 (x1 x7 x8))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))))).
admit.
Qed.
Theorem missingprop_b8c22e1ae6a330f9091f7c2a6e09322205b7ab553965b32415611fa4230c6492 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 (x1 x2 (x1 x3 x4)) (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))))).
admit.
Qed.
Theorem missingprop_9a8e2e8472615826e1d22fac8a0e4ed673c3973845398c07c8191e7cfc9e370d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 (x1 x2 (x1 x3 x4)) (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))))).
admit.
Qed.
Theorem missingprop_ae7abd10ec305ff88802831faf9391c03759f1cccbb7e90fb857e3e2b78bf7d5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 (x1 x2 (x1 x3 x4)) (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
admit.
Qed.
Theorem missingprop_bf930e617b141826958a7d9d5468272bf73eb8daaf626dfe20697bf6415a3b51 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 (x1 x2 (x1 x3 (x1 x4 x5))) (x1 x6 x7) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))))).
admit.
Qed.
Theorem missingprop_19d91cdccdc7bb924253ad382bebc51380c489c5a063ed24daf0e11c50144339 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 (x1 x2 (x1 x3 (x1 x4 x5))) (x1 x6 (x1 x7 x8)) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))))).
admit.
Qed.
Theorem missingprop_cb47cfc423cf7efda97b4744781e9876675ababf9ff6eee93d13013fa81540c5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 (x1 x2 (x1 x3 (x1 x4 x5))) (x1 x6 (x1 x7 (x1 x8 x9))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))))).
admit.
Qed.
Theorem missingprop_fdea05fe2f14594cdc759943a0a7eb5173dd7502a34d0ceadceaef015101c94d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 (x1 x2 (x1 x3 (x1 x4 x5))) (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10)))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))))).
admit.
Qed.
Theorem missingprop_8c8c3135174694ad2f87a0bb50b9e66cf5870c26aa9fedbe41faca929f9fabd6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 (x1 x2 (x1 x3 (x1 x4 x5))) (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
admit.
Qed.
Theorem missingprop_cb30e57110e5852aa25faf54267352dd98378649546178da4069c3a771bff753 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 (x1 x2 (x1 x3 (x1 x4 x5))) (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12)))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))))).
admit.
Qed.
Theorem missingprop_3ca134a19cf015f53883d5110009b2043bd1804f66e2ef223744b96b4812e6cd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))) (x1 x7 x8) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))))).
admit.
Qed.
Theorem missingprop_35087b5ace0cb9af1b2b60bd0e55f43624594c9996c49201d0f614736acdb5b2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))) (x1 x7 (x1 x8 x9)) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))))).
admit.
Qed.
Theorem missingprop_798f133d143c4d6aa570c006fa6d27b11a9add737107a254f7be9bbeabe9ef1c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))) (x1 x7 (x1 x8 (x1 x9 x10))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))))).
admit.
Qed.
Theorem missingprop_fdc68dd4933cc3a12c032f422909418ba626bce6f25bb1fa234a89f8a9b71060 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))) (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
admit.
Qed.
Theorem missingprop_24da121853a8673eb7ea28f7c412eea01249811050e02cdeb217e95c2e7437fb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))) (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))))).
admit.
Qed.
Theorem missingprop_6f2ad17cb90e69c3d8a3f1ad770acb80ab46e8888cc83a37ddce705b8721f1e3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))) (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))))).
admit.
Qed.
Theorem missingprop_510b31dd0339aec840c19fb69c6737274f8c23d5a45191e11f8aaf7ceaa137c9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))) (x1 x8 x9) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))))).
admit.
Qed.
Theorem missingprop_ff456e71b87152339ea0ca1269b1eba8b8a3bd7fb1ddc9631e54a389bb3aea6f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))) (x1 x8 (x1 x9 x10)) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))))).
admit.
Qed.
Theorem missingprop_3ec92bbc15fac1152768813b156f54bb6f7486cff6fa8c946bf7dde0ea840b46 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))) (x1 x8 (x1 x9 (x1 x10 x11))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
admit.
Qed.
Theorem missingprop_a86595d3b14d72236aa52e7edf6e8abb1eaa9a0bcdf899a8e57431335b553d1e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))) (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12)))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))))).
admit.
Qed.
Theorem missingprop_f00aa8b419b150d81138fbe3656bc2a7f388b6a8fd1bcb5e8b0400fcff9d4c4e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))) (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))))).
admit.
Qed.
Theorem missingprop_ee6e48beb5677461252f960f6ed2c56430ca13384e260d72fbbac0f92d71e6e0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))) (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14)))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))))).
admit.
Qed.
Theorem missingprop_a3dc646a3957ef41aa3900f732ba2cb2ede42a23cf46d988ba85bc5ae48c040a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))) (x1 x9 x10) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))))).
admit.
Qed.
Theorem missingprop_e6f80983ed3f9fbb961e93db3b1d2deab1749e182817e2868f5a8b06ee9ef4d9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))) (x1 x9 (x1 x10 x11)) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
admit.
Qed.
Theorem missingprop_15c254ca4becb68f7bdcd04ef549a40b8cdf2c4d56a3b7f1969b633f90155c66 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))) (x1 x9 (x1 x10 (x1 x11 x12))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))))).
admit.
Qed.
Theorem missingprop_a60db5224d95ceffbcc506500473c16eb819aeef0c7d511c8d9e972fe29d8691 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))) (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))))).
admit.
Qed.
Theorem missingprop_2216732e86f12ee0de0ea53c7467c4c36834ed330eb226604ff536d07674c854 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))) (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))))).
admit.
Qed.
Theorem missingprop_ca79a32e40f093a27d9806cf6523b6675444a25fc5b880c231b916d71b16951a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))) (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))))))))))).
admit.
Qed.
Theorem missingprop_3d8be1424c68a4fbd2fc7519d72600a7ea80f1b1c348d71d7a49f22dc43384aa : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 (x1 x2 x3) (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11))))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
admit.
Qed.
Theorem missingprop_f9546c692bb88007c6c104cc64489be41632339a791f25401ddbd01bf10325fc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 (x1 x2 (x1 x3 x4)) (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))))).
admit.
Qed.
Theorem missingprop_8f16f7c7b633df994a3bb0fa9f0f14cba1c2a5f7ecc0fade617a7909461ba76c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 (x1 x2 (x1 x3 (x1 x4 x5))) (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13))))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))))).
admit.
Qed.
Theorem missingprop_411b0ab6cf80d34fa8db863a346d25a4f73e5c279c1354b873cfb968530f02d4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x6)))) (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))))).
admit.
Qed.
Theorem missingprop_9669053311ba885a97411718834307403c499759a55b5da9aba1243db715a5c3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7))))) (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15))))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))))))))))).
admit.
Qed.
Theorem missingprop_c819d9fe0b971c685ed06e93cdd41fe703c54013a34015a7921cbbb9f1fb52f6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8)))))) (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))))))))))).
admit.
Qed.
Theorem missingprop_8ac85daae17fdbfc8ff47a3afd09055c02d79bb3aece0a735127f757c600bfc9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))) (x1 x10 x11) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))))).
admit.
Qed.
Theorem missingprop_f9862e94ca1517ce7830ae2604055554deb148c319d1ff28d3645db89f9649bc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))) (x1 x10 (x1 x11 x12)) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))))).
admit.
Qed.
Theorem missingprop_c77e11899950679fff447548c0616824d0dc323ba0d79c4a5797afe34932bfda : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))) (x1 x10 (x1 x11 (x1 x12 x13))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))))).
admit.
Qed.
Theorem missingprop_8f77ba669c73da8eae3cf21bb58a0b975521d124962990d6511b7aaeeea1358e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))) (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14)))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))))).
admit.
Qed.
Theorem missingprop_7962f9dcfc86f09c082be5d8409b85754fe83ea0d0aeba7dc896649c97d2787c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))) (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))))))))))).
admit.
Qed.
Theorem missingprop_acf25387ac6bac4aeeac6d3917d581e867910d1179fa0e80599895b823962a23 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))) (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16)))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))))))))))).
admit.
Qed.
Theorem missingprop_a6aad9e2b475e584727427654aaf752f3180f6f324ab92b85f66202090d4aaf8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 (x1 x2 x3) x4 = x1 x2 (x1 x3 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x1 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9))))))) (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 x17))))))) = x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 x17)))))))))))))))).
admit.
Qed.
