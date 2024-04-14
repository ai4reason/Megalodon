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
Axiom missingprop_2ce9a82c8ef9efc0240c60d5f07d019e2f7a44da8d6114bc529d6fb2d8f3a783 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x3 (x1 x4 (x1 x5 (x1 x2 x6))))).
Axiom missingprop_8a9f4d73dc49b251f707f2e00ab33d9a3e76d5c457c858a33937070aff620fbe : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x6 x8))))))).
Theorem missingprop_c6b8f45f6ac1c91bab6ff2055b7771438e746a320bd5045b7fa074283f5c41de : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x7 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_76c272826b440e9c3ce9cd37f072e166fa35bc907d4ea8a71c450d0fb386596d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x7 (x1 x9 x5)))))))).
admit.
Qed.
Axiom missingprop_320d8a11df0a48b4b1c25867f46f728763421f2c8478f44bd5eeb05b7cd5873f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x8 (x1 x6 x9)))))))).
Theorem missingprop_1caffcd361c690f7a79e955314dd74786dbe773c1c1e326be973a210d56b2ea5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x9 (x1 x7 x5)))))))).
admit.
Qed.
Theorem missingprop_4089ee78424354e176193145c3742beec8e24017462ab3120f29e5cb3b255863 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x9 (x1 x7 x5)))))))).
admit.
Qed.
Axiom missingprop_4cc6ba90742e5fd118a1f59e39ad602217f7672c1a37eac8ebda54e86dd83c5b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x8 (x1 x5 x9)))))))).
Theorem missingprop_e256b00f02c5d32da288de350b90c07b6968f306c481a5d7f00612cf7117e4a4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x9 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_0c9f9c3f9b74c12eb65db20b9854ea7805887964579fc58b32e97f0f9437bc74 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x9 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_f79aef2be6a7039f40b4668d746644986a91c30a437489fb791d345d010f24ee : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x6 (x1 x9 x7)))))))).
admit.
Qed.
Theorem missingprop_d2b85c1b3e1c77c427187fb7c735ed5f2f05a70ad144579bfefb69f853f0a42a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x6 (x1 x9 x7)))))))).
admit.
Qed.
Axiom missingprop_6df806693864a23a378ddbca02cda4bb4bc233ff1daa8914d51c06eb72ff2550 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x3 (x1 x4 (x1 x2 x5)))).
Theorem missingprop_4b66e2068ccae0abad3fac65379ec45f341d3abd36709e36e4e7ca7f07072d82 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x7 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_9dd39057bb0b6251ffdcef7812f7ce74e2b1dc67befcece38a9495e3ddd2cbf0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x7 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_7deea1acdb55f8480c0294221b172c29bd3abe3a5ab806dd2b0ff9be90b7d248 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x9 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_7c01839cd85e4504d78da333e9b784ebf3b27134ce2eb446eb5c0b05919ebd79 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x9 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_7d10ecb54432d8d476094a27097815f6269f1c7a02132254be4540dc2b35289d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x9 (x1 x6 x7)))))))).
admit.
Qed.
Theorem missingprop_38c01d32042f9e032f434b4eecea61626fe06c60c82b4df1f8c186b3c362ac20 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x9 (x1 x6 x7)))))))).
admit.
Qed.
Axiom missingprop_4fb0bf14dba997ca80cd603420822ad5463456d7f794ecd1d94a8f0020bdb85a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x3 (x1 x4 (x1 x5 (x1 x8 (x1 x2 (x1 x6 x9)))))))).
Theorem missingprop_2040f3b3ee32d43549072ebaf633d624ad86f4f5e0aa9795e371212c03a48560 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x9 (x1 x2 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_2813a7feee3cdeab21a7e5bf3f61811e442ecab65ced3eb17ec123ea3ff1b784 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x9 (x1 x2 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_6161acf4e9f7f9bcca259ab207fa7fd470364ee97fe066a5a37e105d18337b36 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x9 (x1 x2 (x1 x6 x7)))))))).
admit.
Qed.
Theorem missingprop_8748b7d4177b827409283f361e8145944fe9cf7db48994df1ed2dccacce1ddec : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x9 (x1 x2 (x1 x6 x7)))))))).
admit.
Qed.
Axiom missingprop_3e83cf8819aade81c92337ab134a50d220bb77ab2e5d838716c812dbd8c1c831 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x7 (x1 x2 (x1 x6 x9)))))))).
Theorem missingprop_cf6c6b7b0fe736de06822a483488cd98d4a2dd563a354d437b7170342ac9b7e8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x9 (x1 x6 (x1 x2 x7)))))))).
admit.
Qed.
Theorem missingprop_a8872d135f94f907bd4edb513a1efb8681364e18a758182eb3edc3d407a22b6a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x9 (x1 x6 (x1 x2 x7)))))))).
admit.
Qed.
Theorem missingprop_007b02d9220e1e780d2abee883480911d88343573bc7b354c84e01a0a0cfaa45 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x9 (x1 x7 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_ce7ac8c62dc527c13d5fd385125b3be598ddb662360f1d9039a69b46fc7a683b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x9 (x1 x7 (x1 x2 x6)))))))).
admit.
Qed.
Axiom missingprop_9ecedc34868c2b81f1b4959c93dc472d5086744c2028cae3f1def64426c49292 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x2 x8))))))).
Theorem missingprop_16f2b40de590221a02a92225e79e79156af61f3acc98b7d22bed40f37c4c7f1f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x7 (x1 x2 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_42bd3c6fa00aa84eefa6fda604e4247de479c1f5e3f39fc48e1642cba83b546a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x7 (x1 x2 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_469af1367627243a0e119d5655a1a047fa50895191f412eb4f901ffccb8a97ad : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x2 (x1 x9 x7)))))))).
admit.
Qed.
Theorem missingprop_4bc18e64eb32946d4a23e7e1fbdf7eca5bfdc08428ee3e07039bbfc4f04db460 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x2 (x1 x9 x7)))))))).
admit.
Qed.
Axiom missingprop_219c2baaa4af732660ecc828eba4b21e62a0432e521dc1df490625086f22a73f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x2 (x1 x7 x9)))))))).
Theorem missingprop_9f9af16a0c82a525f351703d81d5ef151987b065fb1d607b7344907e1a49da33 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x9 (x1 x2 x7)))))))).
admit.
Qed.
Theorem missingprop_b83c7266b484e3561b6598e1a29d2f7a19f5ce0b34ae2bf08c3258b45f0b204f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x9 (x1 x2 x7)))))))).
admit.
Qed.
Axiom missingprop_1e60578d06ae56985b332480a169a7d4620d5879e663c9e7db88b77f0794a318 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x6 x8))))))).
Theorem missingprop_39b021418a4f8770736c7f9c0617617ff922cb2bb11d240ee9870d3a50162735 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x6 (x1 x9 x7)))))))).
admit.
Qed.
Theorem missingprop_bb0abe5be2ee3482b0cc13fcfe0e9f3a6c7b7e7611390c26827dc8da13f68b2c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x6 (x1 x9 x7)))))))).
admit.
Qed.
Theorem missingprop_c6b2b1d321eb3e8c6ca0a6fd7a196432cfed3ffc1221128c3ebf4a68f8454c12 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x7 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_da944c0da4b08a2a5614cbaaf997c745dc0d45d7d105d6016f5add62220d6bd1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x7 (x1 x9 x6)))))))).
admit.
Qed.
Axiom missingprop_72575b7e8811115471cb328f237b570c6e2c59ebb8dba0e8761da43faea8d429 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x8 (x1 x6 x9)))))))).
Theorem missingprop_0f32a3239e5cd3950bcd7321bd28f3502ab9fe11c2121c2128f2c296f2e49450 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x9 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_ac8fdf2b3ca6367b3809ec56b75bbaa6b05fa83ef94b4a17fd6e06164b7ba218 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x9 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_338115011c9ab3d500f99119b8699644674960b02c1063e59499c08c985c03b9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x9 (x1 x6 x7)))))))).
admit.
Qed.
Theorem missingprop_efe11a2ab687c27b5fed9e6080212452d31ed5e163f66a6a4a21b75d4ad5be07 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x5 (x1 x2 (x1 x9 (x1 x6 x7)))))))).
admit.
Qed.
Theorem missingprop_1fcb2b0db7216ddd7c7477e199cc9bffa29a171643649fd38f896f2768c721be : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x9 (x1 x2 (x1 x7 x5)))))))).
admit.
Qed.
Theorem missingprop_ade0caa91937939a4a9fbfde7819663f22307a37e85f9bb8f5a676ad55511469 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x9 (x1 x2 (x1 x7 x5)))))))).
admit.
Qed.
Axiom missingprop_659ebcdf31ea3a2db505b6a2e28e13ef5fa826a081cf363d04faac2e84aee92a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x3 (x1 x4 (x1 x6 (x1 x8 (x1 x2 (x1 x5 x9)))))))).
Theorem missingprop_7ea4bda765abc1d26091182d12025c61e61edd3b09731569b6bbbd5ff7565483 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x9 (x1 x2 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_e5b00e6f86ad56edff7937afdd27e5d77101652638a377a8167c5209a4056a90 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x9 (x1 x2 (x1 x5 x7)))))))).
admit.
Qed.
Axiom missingprop_89e0256e6c50497d363bad82d369d2b106634c131908ce3a91172f091eb78660 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x5 (x1 x2 (x1 x6 x9)))))))).
Theorem missingprop_e28e42f25b6683d9fe9e952edfe334c11fa729d472c38035a4cf3e05eb4131bb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x9 (x1 x5 (x1 x2 x7)))))))).
admit.
Qed.
Theorem missingprop_d02a45061d0941aab8ab680120725ceea4786416364116dc31b0310411ecb05a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x9 (x1 x5 (x1 x2 x7)))))))).
admit.
Qed.
Theorem missingprop_8d84397a2a48f3748af43884cff0cbe9bb0a78f8fdc8571a664e88c5189139a0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x9 (x1 x7 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_4dd1cc002a015fb20df41acfc7c127b1263be60f05da8c535284f7d6d85c6451 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x9 (x1 x7 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_cd329284f8837db87100a0acbf9990f1a712bb1a07f59a0ec2e3bde4eda960a1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x7 (x1 x2 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_904a42c288e235b490a5b8529bdc74fd6e39fc1fe71484c447749271252e5886 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x7 (x1 x2 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_ff3dd0e7f230d974a13b905a591a0d5574f7126bb11f3984c879fd9deac89e78 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x7 (x1 x9 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_46dcc1ad54e2e5ce3b17c4500d82ed24f6b933e20c74eca66b8af0b971a9427c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x7 (x1 x9 (x1 x2 x5)))))))).
admit.
Qed.
Axiom missingprop_131535c0a52fa29508e383421dcfa3816fae038e4c6b01758d899ceeeb8f06a4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x3 (x1 x4 (x1 x6 (x1 x5 (x1 x2 x8))))))).
Theorem missingprop_a484540bc03ad966ce4e6af7f23be5b21cfa5f6ad0a5dafeb30132e271524360 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x5 (x1 x2 (x1 x9 x7)))))))).
admit.
Qed.
Theorem missingprop_115cda69fa3282244d192d329b7bdd16695afe132ae3b26a34ddea2099bed0ab : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x5 (x1 x2 (x1 x9 x7)))))))).
admit.
Qed.
Axiom missingprop_aab7a9bfd6a70f6aa4d954ffacc204dbfa2c33f8236a1846d3778061ae653912 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x5 (x1 x2 (x1 x7 x9)))))))).
Theorem missingprop_207552f4334a68a2350c363fffb09e2ea4fcface2794f13c754670a26da09029 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x5 (x1 x9 (x1 x2 x7)))))))).
admit.
Qed.
Theorem missingprop_3af13c4eb1d0f3f39dc28224da73414a864de9fc2ebd2fb6b255acadc23d903b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x5 (x1 x9 (x1 x2 x7)))))))).
admit.
Qed.
Axiom missingprop_aded08b82f8712c72e8881ed41e6f66c8a59fdea9e4f1b559df00775f4b70506 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x7 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x5 x8))))))).
Theorem missingprop_a9f929787306eab54dac6db9235de964ad1c59ffb8d7b7697d76d318da865fa2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x5 (x1 x9 x7)))))))).
admit.
Qed.
Theorem missingprop_68c3bbfcd9abf7f5c719586b5c939cf36d641710c74db21f7762a1879b56fac8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x5 (x1 x9 x7)))))))).
admit.
Qed.
Theorem missingprop_e205a64790f8d2af456f99ac85f18147d6cc006735751adef36c21f80ec06290 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x7 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_9d712cdd6f138b28de9d503d678c269e03074e0214e1b862bb2e90098f22c3d7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x7 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_ca570db9b6e1666a60c811aa3864238f7d5aa8241fd4c70d9797b12e9afae77f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x9 (x1 x7 x5)))))))).
admit.
Qed.
Theorem missingprop_45907cf5ad0f698e3bc28d1a1d75db6c25e3fec011c06177c5d9c345be15e9c0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x9 (x1 x7 x5)))))))).
admit.
Qed.
Axiom missingprop_aecf1dca9bed6a1da7ff30e4f6a4114ddc8a5d2b5951b3a80f36343769212a83 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x8 (x1 x5 x9)))))))).
Theorem missingprop_42b58d674575b186bea9efccf2aeb3f7e9be147d1b18a461f8382ad947da4db9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x9 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_b6763126b3cba55b84f9b6091ffbb067b712d7f74cc0d63f7b32fabd49bdab83 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x2 (x1 x9 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_c440859f311ef87b0c9ef5e2e7733c06770a93de65bc8d46d393cd6350784c77 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x9 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_d659faf5cdfab1c54717c7949dda3487e19bee481566387f90c2c615a34d17f3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x9 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_99a69347dc6f39626c144d875fbda03cb205617b963c0dfdff0e220f8b6b24db : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x9 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_b6996fe2cf6930b2838c9214f5e6d82ce963074f0a34c8864cb710175933517a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x9 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_56ede53ff22c62d056cee4c3c4eb476c3c72f17a3a25b55ed7365c5ddee6e778 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x9 (x1 x5 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_39f83ec2b9bfcafeebb41135054c83c315a99bff76f9da7fa74f5fed0ae76702 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x9 (x1 x5 (x1 x2 x6)))))))).
admit.
Qed.
Theorem missingprop_06051acbdda746502f1658607d3f67d5e093172ec8b7f614d865dccccadccaa8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x9 (x1 x6 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_6de92ca6d48532dc2094e8f55ab12fd52b4704820de7de5dce5ada28d99577ef : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x9 (x1 x6 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_a58a07b7efab69356abcb146255a89d146fe611c9d1448c2bc6aca91c0ed335c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x6 (x1 x2 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_d7fab53ce95ceb5e56290d24395f32126109ddf7876f0b3d93a1231de46afaea : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x6 (x1 x2 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_58f5af99aa861e7dc7f560b1ee72cb6fbb09952a7d6e44795c013ed5badf2acb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x6 (x1 x9 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_7d4248af3aeec3280ce8977ce5b606b4c4913182a8a1463aec693e48f2c9126e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x6 (x1 x9 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_a78302b919e76a671c2078e4484041d25a1b2cfa5912f5ece6ef336375777b24 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x5 (x1 x2 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_f55f833b61f9935b7ddc1ec0c7e056d42e2c9e0cb7d7d30072a2a9769243800f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x5 (x1 x2 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_895cd737f7f77bb6aeabafaf5ea66a68351e18e8260c71fb0b2590d34a7e4ad1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x2 (x1 x5 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_0804eca8767a0caa7d980ab724522693e3081fefa535af67d67388fbb4150d36 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x2 (x1 x5 (x1 x9 x6)))))))).
admit.
Qed.
Theorem missingprop_32533d7acc6db596ee8974fc00fdd56def860b6566ce0c4e525dc2a8c54b104a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x2 (x1 x6 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_4d9a93f3fe65a5e0bf61d115ebe11fb886e303c68b791b2c28e19e9e53ba322f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x2 (x1 x6 (x1 x9 x5)))))))).
admit.
Qed.
Theorem missingprop_31634705296e0de52074b23dccf1510e603751c05fc49759bd4a574377002d70 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x2 (x1 x9 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_5841022c2aca43b0fdc23026df8a3fb36b27f40a18842de5a93131538139ad6a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x2 (x1 x9 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_833a37b68da141abc7349be995312244df1850d2e47a846fd41282f2e375fd0b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x2 (x1 x9 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_3e4f31db0d3ce17526bd7946563fa0038d7d99dc542884a15c589304e689f142 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x2 (x1 x9 (x1 x5 x6)))))))).
admit.
Qed.
Axiom missingprop_ac5973781846bc1d8f643d09a42f38b03aee8e22ce6861d3af9aafd3a788c24a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x3 (x1 x4 (x1 x8 (x1 x6 (x1 x2 (x1 x5 x9)))))))).
Theorem missingprop_3d30c09aae7761b6078350d2977a4db7351540fc0c48aaeb8c95ae1498fb9791 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x7 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_a08648ae0d2d53460053771a1cb12dc6908b9f1a976cdb52db4712465ee36815 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x7 (x1 x2 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_8de40abde6e5a5c47b924a2d67f04c60d47aa1e1be7aa373e8966959173d84ef : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x7 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_a151895228489d26fdfb89c4125fc7ce736771ce25b1c8c2e3bf394f1ac863d9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x7 (x1 x2 (x1 x5 x6)))))))).
admit.
Qed.
Axiom missingprop_f6c181fd60309a2079a75555f7388666985b656ef55ed90cad70d7aa12e94cf8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x7 (x1 x6 (x1 x2 (x1 x5 x9)))))))).
Theorem missingprop_53be2d03ac385dfa666a2c669919af00368b1b98871cf758944e7dc31096f948 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x7 (x1 x6 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_ff4459bfcbba63ad109220240bf84063758c20dbdfc27ba51a7d49e12053c725 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x7 (x1 x6 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_f9a16617e73d25d394de34574291bb10a47bef6720f3fc1d904bc635dbbc0d6d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x6 (x1 x2 (x1 x7 x5)))))))).
admit.
Qed.
Theorem missingprop_9fec8fc0776768619953ae0941ecb76913434bcbab80b6cb5b9acb283882165d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x6 (x1 x2 (x1 x7 x5)))))))).
admit.
Qed.
Theorem missingprop_c147bbd7437833a7a72974fdd67352386a811971e657422eab93dd98e5afff94 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x6 (x1 x2 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_16b2b6be1dbf15a183d0f4f71a1dc51b0a511f090acfd96696ee44fa6a6f1623 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x6 (x1 x2 (x1 x5 x7)))))))).
admit.
Qed.
Axiom missingprop_19e3a001a94c852edfa53975a61995b60325144eff28cf7956320e15a7734f0e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x6 (x1 x7 (x1 x2 (x1 x5 x9)))))))).
Theorem missingprop_b554993f3809e3c8c4c011929748aa055ca8d40dc1890bb90d31454cbbb779a6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x6 (x1 x7 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_eafbdbbf92951109ba86d3e552acd20bb26e54d0b90947d352069695ba4a7cec : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x6 (x1 x7 (x1 x2 x5)))))))).
admit.
Qed.
Theorem missingprop_39b0cb27117d1c461cac7231fa6e5c116a23c2a515c696493672e28e271e5cde : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x5 (x1 x2 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_b6b4ec3b581ad83da3f8189036c4e7206e748475aa90496c4be8db83a63bd32f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x5 (x1 x2 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_9270e5f8503de155f3ae4ccce190b8dca0a2a2e0c7c1cd78caf7499162478693 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x5 (x1 x2 (x1 x6 x7)))))))).
admit.
Qed.
Theorem missingprop_61383b2a3ef7e1fac8d4da84a56741f332a5fcd11e232b4e02f95537a0bb531c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x5 (x1 x2 (x1 x6 x7)))))))).
admit.
Qed.
Axiom missingprop_945873bfc3d566e3133a35899755cab15c6b9a9b75bf7e1b9c27c8bf7037d3fb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x3 (x1 x4 (x1 x8 (x1 x2 (x1 x5 (x1 x6 x9)))))))).
Theorem missingprop_3cd7a86b272fae76db293913cc06f387554ae54749103a7a20141bbae01e4048 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x5 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_69de993c56a36615c36ec757e378d74bb276291e492f998050c040515c1a4526 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x5 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_79fd82d4823c4b944e1263ddd4c6a51dd00403db152db06af0a3613cc27c79c8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x5 (x1 x6 x7)))))))).
admit.
Qed.
Theorem missingprop_3c76095731202d9bfc23d16ea04003057baf763845273e497e1235e007d708e2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x5 (x1 x6 x7)))))))).
admit.
Qed.
Theorem missingprop_88a36f29deab09106675480a2d300cb0adcccb1c6c414ce6b86581796306ea08 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x6 (x1 x7 x5)))))))).
admit.
Qed.
Theorem missingprop_24515936ba318dbaeba650b5d96732911819eb9acc6cfce6cbfff1d9fb217726 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x6 (x1 x7 x5)))))))).
admit.
Qed.
Axiom missingprop_2a5fcf908e4759e8dd4d8b90780a50e1407bde54304cd05a3a25acd00f0e4ced : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x3 (x1 x4 (x1 x8 (x1 x2 (x1 x6 (x1 x5 x9)))))))).
Theorem missingprop_4eaf7afcabffe584cf36b37909a322fe7d38e78db316c266ec850266af00478d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x6 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_0ede5bd49d0cc4573199c1ff2959920343351bfc00c04cc8bed33f0c64fda895 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x4 (x1 x9 (x1 x2 (x1 x6 (x1 x5 x7)))))))).
admit.
Qed.
