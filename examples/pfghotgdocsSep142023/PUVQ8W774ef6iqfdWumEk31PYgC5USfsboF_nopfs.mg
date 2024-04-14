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
Axiom missingprop_6df806693864a23a378ddbca02cda4bb4bc233ff1daa8914d51c06eb72ff2550 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x3 (x1 x4 (x1 x2 x5)))).
Axiom missingprop_8fe28a43d652d273130fa08c46f815aa99d08e046d2acdee16f388635a2216e5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x6 (x1 x3 (x1 x2 (x1 x5 (x1 x8 (x1 x4 x9)))))))).
Theorem missingprop_3e3e593a3ff0d26827734e5845afde7cf867e9fd106174fbe1940271ec25daaf : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x5 (x1 x9 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_5794b25e86404cb09caebe2776cdba1dacc9041b097ec7af1130c5fac884a207 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x5 (x1 x9 (x1 x4 x6)))))))).
admit.
Qed.
Axiom missingprop_25895ee2eb92c205cf1ffcae2a62d11fd4afa3ae66652b20085aedfef3a50163 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x6 (x1 x3 (x1 x2 (x1 x4 (x1 x5 x8))))))).
Theorem missingprop_d664d1701059df7f7d132f4c0b3109f72f7f7ddfb508d578ac1d794471993b2c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x5 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_54068d0186cc75b22a0622b234be8d0e12f8816e488a7d9cdeda4cf3749cecd0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x5 (x1 x9 x6)))))))).
admit.
Qed.
Axiom missingprop_2ce9a82c8ef9efc0240c60d5f07d019e2f7a44da8d6114bc529d6fb2d8f3a783 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x3 (x1 x4 (x1 x5 (x1 x2 x6))))).
Theorem missingprop_a68c6166a85d56eff1eb8cd027df204d45179c93805eb2c20ba81ec157a2f72b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x6 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_6a0e0e3d67e513a52f10b994f1071b4593ff9d0834524c01b2642e206423c70c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x6 (x1 x9 x5)))))))).
admit.
Qed.
Axiom missingprop_36c5398feb09c74dbf31c0ad5ae1d6588b0c2f26289ff86436391e8100d4c6be : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x6 (x1 x3 (x1 x2 (x1 x4 (x1 x8 (x1 x5 x9)))))))).
Theorem missingprop_5a0b7531ba1abef086ad41c7544411d25ef0f8ee7eb77519fe1e356e8fa81d35 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x9 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_23e2ef7c38f0407b5eb397a777df726d1b96067b2d3470865b022b6213444efa : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x9 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_d372f36a656d36b3c960c1f017fed679415f5e297248c726ed327c912a8e9ca0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x9 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_bde000172c48a4fe4966a0d830c3c4ba16c609d517b55aea57b0cd9067b6a058 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x2 (x1 x4 (x1 x9 (x1 x5 x6)))))))).
admit.
Qed.
Axiom missingprop_e01d3da589e6a772a90881f3dbc091b61a8daf7c2b02fec57123525010a88ae5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x4 (x1 x5 (x1 x8 (x1 x3 (x1 x2 (x1 x6 x9)))))))).
Theorem missingprop_bb6b1e9760d271d58a3737f0f318d1e91fd72ad6bba75606689ef584cce90d32 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_0e8b83ce0c05eaba8641ee913cbb4918fd868a3fe12b83b12cb1acf2ca48173e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_b0bde5afb27af6097b2b87fdbb5fd2ee4d62585f6459776da7d76917d1f2079f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_2ebb356062ac6be2a330c1abb2a537f613882b1c5c41d7db3155b8214bbe9f5d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Axiom missingprop_1c45acc0f6c717d8cd8f003bddf760621f017311f769e31375b182105e230baf : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x4 (x1 x5 (x1 x6 (x1 x3 (x1 x2 x8))))))).
Theorem missingprop_7931f573e036f94de2011c93057c72ebc40b53d559bb5b0bd02ac48d62c828c2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_56b814d1c54eb46fb677d3dbc5578ef0ccc8059ea215cfe39401447e9762e819 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_c648832af309e0e86349e7b14a4eb253388af0a0865a57cc66db5952b0970798 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_3aa2f157f2a4147cb9fa4be6f0d7be09b680b82e1f0aca56c36757c1ba5b4999 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x9 x6)))))))).
admit.
Qed.
Axiom missingprop_767a27abba167a00ef0f854194a491f5cc22f635a82d5430c288a4fc00f7ef4b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x6 (x1 x3 (x1 x4 (x1 x2 (x1 x5 x8))))))).
Theorem missingprop_176fd7909b5b23d3975d8a1c9b0fd3969183e51fab7d38a17b9cf5de239e2e8c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_883817c875aa65b395f3d5ec96edd6e6415373b78846f5aec1b03bda0cb97905 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_b24acf741b83dd43134b276f0cc9e45ef4f2782408032b9e52aa7599ac71d022 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_7e13ff565d3b9223f6475b1265f0438941203cc9ea24e8da1a68991439aacc84 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x9 x5)))))))).
admit.
Qed.
Axiom missingprop_eef24cc996d99a78d54966e6740f55157fd43bb82d619d76bf90df94ff5bf966 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x6 (x1 x3 (x1 x4 (x1 x2 (x1 x8 (x1 x5 x9)))))))).
Theorem missingprop_a419bf89c3d22e3fb8be5c4824b5901e54c761cd947b8565ea164603fa01eb1e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x9 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_60c63704d19688067def3aac803b52a9af1d6c582da448f9555b5609a97e5716 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x9 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_1d317f0d2d8994d1149f3ad09923c8e0e11b5e5e93a57bbc9a436fe86a3a3bcc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x9 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_0e9a8f94f69fde7c8edd32e89547e9c5c9c39f870baa69e12c8a6ded754e217e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x9 (x1 x5 x6)))))))).
admit.
Qed.
Axiom missingprop_515047c02fed97c50f69ea07f84c55a116d5435d48e441446058ba601add8797 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x2 x7)))))).
Theorem missingprop_1c2aac5381ad58a9ae1366a6b23666406cbe684db2258eda22b7fb1fc60c5ac3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x9 (x1 x2 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_86d14cba226a17a3fd9b260ab96efa9994ee51363faf2e18671886595097afbb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x9 (x1 x2 (x1 x6 x4)))))))).
admit.
Qed.
Axiom missingprop_d04fc15d0df146d536ef6761547a5072f992e97ccaf705dfe259b8835eac737b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x4 (x1 x8 (x1 x5 (x1 x3 (x1 x2 (x1 x6 x9)))))))).
Theorem missingprop_06ee586854bcb4c8f004f195a01a7b9a83e0f38af1fc5bd64154c678f87282de : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x9 (x1 x2 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_182eddb743c9e3556613bac8482ff3508bde58d48e8d519d81bc01779c11bf46 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x9 (x1 x2 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_a6ecf99230df13b70a0c043c51c7c3056316fe538212e4c5d96905a0f4923550 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x6 (x1 x2 (x1 x9 x4)))))))).
admit.
Qed.
Theorem missingprop_6878a6cd888b180afb9388a2ec005cd6e5919bd988ebb02a08965c0676903b8c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x6 (x1 x2 (x1 x9 x4)))))))).
admit.
Qed.
Axiom missingprop_05710d1a5a258b3be7e537381f0a2f8def219c212753560785da66008348c6f9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x4 (x1 x6 (x1 x5 (x1 x3 (x1 x2 x8))))))).
Theorem missingprop_778d4c2a03ed69913ee1bc88b46f5a70f8be4a7651e60f53f547a4fae03feeba : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x4 (x1 x2 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_99f31b9f261b636f1e7b6e0cb686219ffce87ed720b80a2372f50208752d0a8c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x4 (x1 x2 (x1 x9 x6)))))))).
admit.
Qed.
Axiom missingprop_778ad099280f2db290d5cda8d9566ec7204b75f8a719b9687ec1b679402d6adb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x6 (x1 x3 (x1 x5 (x1 x2 (x1 x4 x8))))))).
Theorem missingprop_90d8e83e27e884ede9ceb5c8a3a31c408c146ec3f47073c8803e1aa384c33209 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x4 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_e7068dfcc21143a9d3632f751c9e2fabd4e50d876eb3d3205e8ec9c0d9f91d07 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x4 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_ee215131eb5e280845e26e7ef6cbfaba7a3e7e0bbb28260c2c023c1357c2fde2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x6 (x1 x9 x4)))))))).
admit.
Qed.
Theorem missingprop_e70120556cf0375ec2e114c0cfb754191662c56f7cd1139e2420b6a46a45e8e1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x6 (x1 x9 x4)))))))).
admit.
Qed.
Theorem missingprop_04bd2d6b2e90955b6f8b0c1fc88f0934070bffcd3964ce0515a064532f83818d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x9 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_5daa4692b7ceea8c9a96969311bf30cca4793bafea9b3d63a849ee8546609037 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x9 (x1 x6 x4)))))))).
admit.
Qed.
Axiom missingprop_5ae38dbe040a3fea3990047ed7ccfa6e0746c2ab113034d2ce05e9b7df1cf1e4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x6 (x1 x3 (x1 x5 (x1 x2 (x1 x8 (x1 x4 x9)))))))).
Theorem missingprop_046e37ee321d18cfb843c9792e3674e8691eae1a49116a03f6eca2a6b8159340 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x9 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_4498f0b559791277cb3dd273021bd95dcec0cfb3ba4ce1cbfa8eb14c320d896a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x5 (x1 x2 (x1 x9 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_9067f52a5d7bc10e120d3a3b1f437838a8f440e6bba2adc50b8fcc89fa79add7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x9 (x1 x2 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_ffafb0e4e4d17f8fab3ea1f05547e4ac5b2c60dea7652f369e38955315b4acdd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x9 (x1 x2 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_236a8a3cb6f274184cf7cdbe236029afdf739b7d70e4e83e6c128d77b7b4b2b1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x9 (x1 x2 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_e78bdc8ba5c6c598af10f267ee154e4f531ac85fd746b719e324964d83c801f2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x9 (x1 x2 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_b0168caed167da9fd1bd0856bfb041cf9f3c0dd08e6f2edb644c226e8b93bc34 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x5 (x1 x2 (x1 x9 x4)))))))).
admit.
Qed.
Theorem missingprop_993dce5b16ca657ceeae289118eb29cc73e7a3243a62650da7d460608558e00d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x5 (x1 x2 (x1 x9 x4)))))))).
admit.
Qed.
Theorem missingprop_1a01992aa606c783c89f4810dc1f2365851010648ee41a890ad7ac325a42a6bd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x4 (x1 x2 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_6140e5e62ccc458741440f611ded3c157ee2dd755bac2726353d18e2ac4b3651 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x4 (x1 x2 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_2573520e6f4b1949504ed37e739ec92945fccb08abfadc005a4ce1e71f580e56 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x4 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_3affb2a39d2f9ccb2adaafdd9b646aac159cf0eff8e197b8eaab2c63f1de85e7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x4 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_bed784645c8b26c828484bc8bbc570316223af9fc33b3c59ee0f51cba87327bb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x5 (x1 x9 x4)))))))).
admit.
Qed.
Theorem missingprop_87afc24ade990a758bcb73c8f5c35ea1f8d6b8b3fd99e884797ba24fc9188885 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x5 (x1 x9 x4)))))))).
admit.
Qed.
Theorem missingprop_fdad1b6de8cf16318c1c4d14c04f8efdc0dc8a9f78f3eec7d99f88db87daef8b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x9 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_eb4f0ae32d21c42d67a32df86c5592fb00e49271c502cc0485baba72414b3080 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x9 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_9d04144909fcc20a790166a6b5473bb4747564346274d4ac904fa3c8b28757a7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x9 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_3fa342bf66ff3a0c582489377b0568f4ce174ac2097320a9b5f835ce246ca82d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x6 (x1 x2 (x1 x9 (x1 x4 x5)))))))).
admit.
Qed.
Axiom missingprop_0be8cd16fa768ac267d6c9d92872a07e312f8b4bc9859cb21eab20c20ae8a3e8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x4 (x1 x8 (x1 x6 (x1 x3 (x1 x2 (x1 x5 x9)))))))).
Theorem missingprop_7488ad014e81ef0af2106374e5c23ea07242bd169b5df632a36c85b9dfeccec7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x6 (x1 x2 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_5cad3e5e2b84b59b06ec40ea2476c3f278f3f8d6eef39c8ce4e9944dae56d651 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x6 (x1 x2 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_d4759fc996b79470a8bdacd4442af761e7a0f79e1ffbe02dc6194da248451d2c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x6 (x1 x2 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_d568d55903ab094065ea3df9f64a56de6e095609d049a820fc180b12818dfa85 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x6 (x1 x2 (x1 x4 x5)))))))).
admit.
Qed.
Axiom missingprop_5a9f9def327757e35ea1f5100d290db0934adfd7143d02396bd27f6594c70d7e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x4 (x1 x6 (x1 x8 (x1 x3 (x1 x2 (x1 x5 x9)))))))).
Theorem missingprop_c5716c2135bb6a1c292db8d78461fd1d8eb14ba78e073ba0ac6152736fce4d0d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x5 (x1 x2 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_61b0492dd47e6d0bd294ad4186b8d92454e0a368e39a6eb9c78d5445b3a83ff3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x5 (x1 x2 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_0642ea340ceaf981139e44462b40237e4f2d431ffb1e65bfead446fa4e3d6605 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x5 (x1 x2 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_495e9c8247934410bc5633565b4c5ae99e80af58e0d8b7cc9a426c060316fc8d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x5 (x1 x2 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_65b12c2be85d763b878ddc9c6bc8ad554297b414b09b40e00d34bfd71e3d7e87 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x4 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_ce1da06a26236a0e30a0d1fc505e5379816772b66e69a8251679ae07733cbfc4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x4 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_6aa1496a089a94bf9adfd1c0c486066bcc2440e055a8f61b1fcd0b1e7d575a84 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x4 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_fab2e8c3c6158d8afd5b383364e2e142634cf37d53d05cc071d1df99c9d5d5e4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x4 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Axiom missingprop_2d5f3e705f5a223191d6a848106106f45c5231ee4a44ad4c72e2ad5abd71256e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x6 (x1 x3 (x1 x8 (x1 x2 (x1 x4 (x1 x5 x9)))))))).
Theorem missingprop_82332b32f4d0a66f13cf4d51b1bf4f8e6e0b0580ec5b7019c4832683fac95c94 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x4 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_cec558da81e7f8e01d06b07da3018e40bfb9a29287edd28646e96c1659f7ee6c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x4 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_33b403daf356225450592a60a47bdcfc7b539a928b3d0bddad741e6c5904fb7e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x4 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_73affe8d41e1762d48b54b1e231846700fcdcc0041ba92ad936d1ffd4f7ad69f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x4 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_a4d8a3a48c09c783483828114655dfa198652b9dc7678aaf35e618d21b6db490 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x5 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_9f0a91453f9130e3af296daf39cb6355c41226686ce78cd9ebbc7102ae56f840 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x5 (x1 x6 x4)))))))).
admit.
Qed.
Axiom missingprop_5b41d91a88acc8d3466c57bd8f23bd138e3084f61030ddb2356ac7da89875fd8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x6 (x1 x3 (x1 x8 (x1 x2 (x1 x5 (x1 x4 x9)))))))).
Theorem missingprop_bceb9a651874ac237503e7820e596845b75b218f9758e2e973e1ce3fb54c69d3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x5 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_a5c4ecbdebc2b128b11d619614c7a8c7f0dee6f0dee1da53dfcec79e891c3125 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x5 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_e6e048d326b6d4aafc9302e9fcc98db1150ea9c7441b924ed265b36fdb601654 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_fbec6819508facb2c102978f75770375812539feef7dc102b72e323ae476135a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_384d4f5978eeca5bc9200912305c0bf6857ba8467f0b79c7e194e430499d4b10 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_4f8111abf8d9ef55c6e08289e095b85cc7316d6a3be9a5fceac5d272bdd83961 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x3 (x1 x9 (x1 x2 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Axiom missingprop_74e54b390292a8fbfcfb4eb61e398a2b153b4c1c002b1769e13308c127caa746 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x6 (x1 x2 (x1 x3 (x1 x8 (x1 x4 (x1 x5 x9)))))))).
Theorem missingprop_96d210eb8145eadec6d7c44605f1f0c2ad2c623a3700697c8dbb0ed5d231d53f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x4 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_64c11e320684576cb994f0af670ad5c97fd75989cd4b98e215dbf987067d1815 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x4 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_b14a4f0ebe7524199a4a9d9795888dc61da583dc5c79ad22f9eeaeabc1140f9c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x4 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_e876605b1b575581d9e423ca419d35f5d0a17584d9d9e87ab145254b243dfe43 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x4 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_7dd2f78b6e0053db45364cff7fdaa2d9cef697a841995cf425cd8fe5b21a8f75 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x5 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_fe4d661afbc3e758ed3d17d6518c84ad36a5a6107324f62f52c3f7457a998256 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x5 (x1 x6 x4)))))))).
admit.
Qed.
Axiom missingprop_30f9bde17c3f78148d0ff0fd7429208500228f66f88b16f1c8bba90ab879f952 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x6 (x1 x2 (x1 x3 (x1 x8 (x1 x5 (x1 x4 x9)))))))).
Theorem missingprop_e301a00ce128550da96c1051324cc831a6d3353552cafaaef440605121c2be21 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x5 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_9958e88e96560df90b71e0a64d862f0f60837bb70e2cdcbad4fbe12b8bac5266 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x5 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_ca4391d15c917e633adeba29f42dd627d50eda06b00edbf2d140d8b67a49f72c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_9e29d85b8e8815ea9aa08ac1d721267e8d1091e854aaab2c1226a53e4a626e1c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_b1eefc8f1fa6cd770896ffa37c55e86c933d946d500463de20573d3968f10292 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_e6672573abd1745f822591b7ed8398b65741d0d31fd82c4f5d4c0c25a14dc1f8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x9 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Axiom missingprop_8996b222a967f514132b3ee3d1f736944748b50194b349b21775f82a777e38ab : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x6 (x1 x2 (x1 x3 (x1 x5 (x1 x4 x8))))))).
Theorem missingprop_51a8a686957a1bea1529943548ca7ec7edffe5e439970843886169123dedcb8f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x4 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_ef0ff1c725c723585d8b58f2df73f7e1e4054a1b50e00057ce2f0c422188901d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x4 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_0bb497309d7b8d71b5493bab78f0408fb22c07fa358feff2f344e7e7688faad4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x5 (x1 x9 x4)))))))).
admit.
Qed.
Theorem missingprop_de6a10ba2b53120bf6b46b42dcc5c7acbfca14ef12f280783702b8d504796936 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x5 (x1 x9 x4)))))))).
admit.
Qed.
Axiom missingprop_db7069ba3f139764fc74b79c45ab72e4c116e0160c69f706749253f061a5ae29 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x6 (x1 x2 (x1 x3 (x1 x5 (x1 x8 (x1 x4 x9)))))))).
Theorem missingprop_44aa825ab1e5dce2232fb72b24c010f3b8b6b8627a040aa0608c7248e6d40def : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x9 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_8a1c2c1817af3daea92f551b83c0f7537e6e7c960db25739f56ac13f5f5da63d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x9 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_159025bc202d1d73ecbb39813ccc3c41dbe7fa3fcc2520583f86c0760bde7a48 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x9 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_3abca328c57d9a9d576086ece1aa67c89c69191858833a7741bb3fab50c80442 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x6 (x1 x9 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_d0e8dae86fc6e067704f2df2427e9d3cf1c2759f3709f37011a4b0ea38d5ccfd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x5 (x1 x4 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_d00ee71a97fc511f5e420637ed30539ec696182beecc4ca684f7017cdf7993ae : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x5 (x1 x4 (x1 x9 x6)))))))).
admit.
Qed.
Axiom missingprop_ee9d595c3f1a6fe0db7301cd29160293a0d10ff87ffa2e32035f3fe275245c1f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x6 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x8))))))).
Theorem missingprop_f312b766687c89ab09fb7615f468fac4947d9a345f41e731b4f9ae901d121c5c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x5 (x1 x6 (x1 x9 x4)))))))).
admit.
Qed.
Theorem missingprop_0be6b92b68875e30570ed2c605b43734d89d00acbfef881b88ff08de48746dc8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x7 (x1 x2 (x1 x3 (x1 x5 (x1 x6 (x1 x9 x4)))))))).
admit.
Qed.
