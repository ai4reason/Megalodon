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
Axiom missingprop_e39b61713e7418045a5741f0bcb497b721f71afc4322f4a44f92203bcc6362fc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x5 (x1 x6 (x1 x7 (x1 x4 x9)))))))).
Theorem missingprop_eb18df20c610543c90b5c9d92eb9ac07d522c3da59d4a979998a1d49d75163fc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x6 (x1 x8 (x1 x4 x7)))))))).
admit.
Qed.
Theorem missingprop_c26e9a56b69a90bf6f4ff23d6a16315fdadf00b907df389d5a955f203a46d3c6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x6 (x1 x8 (x1 x4 x7)))))))).
admit.
Qed.
Axiom missingprop_5903ffa04f6cdf8cfad7375210b6f2627ea3e62a101224f3c07a711d31cec750 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x6 (x1 x7 x9)))))))).
Theorem missingprop_3996fab24ccdadebd9874774a69048e40ff773c3cc37af4efbbad98c297a913f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x6 (x1 x8 x7)))))))).
admit.
Qed.
Theorem missingprop_5c1e7b9f02acdf2357145e0c1d22c7091afc0872c7b3a24ddd1b999d3f1a854e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x6 (x1 x8 x7)))))))).
admit.
Qed.
Theorem missingprop_7aa612455aff74f2e4b606c24998af0e90f0286a8ed3a58e0e02961572900a75 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x6 (x1 x7 x8)))))))).
admit.
Qed.
Theorem missingprop_bc13c4c9684b8d81caa683fd5aa18d002ae6a121e32a413d260ad713c0a9ef49 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x6 (x1 x7 x8)))))))).
admit.
Qed.
Axiom missingprop_6df806693864a23a378ddbca02cda4bb4bc233ff1daa8914d51c06eb72ff2550 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x3 (x1 x4 (x1 x2 x5)))).
Theorem missingprop_ded7a5e0786a3cd40e7870a82624445e771998a83589b5f5b5c1cee545ae08d2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x7 (x1 x8 x6)))))))).
admit.
Qed.
Theorem missingprop_eb848a70357de03a554c2ee11faaa2f2e559116a20a4b2c530bea52f2f977b67 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x7 (x1 x8 x6)))))))).
admit.
Qed.
Axiom missingprop_bc874e4fbf3d27e812e7e96df29cb46df92dd79ce3b8e12cce88fbd2e844e49e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x7 (x1 x6 x9)))))))).
Theorem missingprop_6cfaec15cf9476af3333155086f17475ff89140c48eeedff0d52d53b7f8c47b9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x7 (x1 x6 x8)))))))).
admit.
Qed.
Theorem missingprop_2dbc3c1d59e9f35323cb0be796909a9f201d1e676c519bf866a546a16b41f096 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x7 (x1 x6 x8)))))))).
admit.
Qed.
Theorem missingprop_4416b70677f127309398feaee8a127321a52e3b5473b2d67a083f92ccde33825 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x8 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_9605a565fb73d73f2fb4431a8b35d41c4c5b5404f206176fab0fd2789d7889a1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x8 (x1 x7 x6)))))))).
admit.
Qed.
Theorem missingprop_c9471c9b1ef2d48042360f15a8bea2495798399d1203090b2c17904c34d86e2e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x8 (x1 x6 x7)))))))).
admit.
Qed.
Theorem missingprop_19dbc7e4edac4417fbf057d75c35543d202eb2c523e6715b512a6d9c73ec5cba : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x8 (x1 x6 x7)))))))).
admit.
Qed.
Axiom missingprop_2ce9a82c8ef9efc0240c60d5f07d019e2f7a44da8d6114bc529d6fb2d8f3a783 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x3 (x1 x4 (x1 x5 (x1 x2 x6))))).
Axiom missingprop_d9b9f5df8f7ef3685f0e9eb48d75057feae12cbbbbf7ddce53a5c4d77f907c3e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x5 (x1 x7 (x1 x4 (x1 x6 x9)))))))).
Theorem missingprop_185ea64411d4d7bb5c729bcc8cf1a1d71034f2539a8a62fd9773b51900014839 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x4 (x1 x7 x5)))))))).
admit.
Qed.
Theorem missingprop_1aacf334919d3540b1374d52183cedfa588ba617c5f4175464cadd6a3e28fae0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x4 (x1 x7 x5)))))))).
admit.
Qed.
Axiom missingprop_b4e182d41297d47233efdc744fb21f5c09cd90bedc203710849fdfcb777fe728 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x4 (x1 x5 x9)))))))).
Theorem missingprop_b714866077b4399a3724c9bf223867d26cfbb7c80e0f0ce03f0e863f3868aa9f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x4 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_1c306c427c37cb814da25e9344e37d524043bdb9cad3f272a2b1df763200a550 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x4 (x1 x5 x7)))))))).
admit.
Qed.
Axiom missingprop_515047c02fed97c50f69ea07f84c55a116d5435d48e441446058ba601add8797 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x2 x7)))))).
Theorem missingprop_46f429f3c803762a428ac225e6c2aa26f246cdbf0b079eb19d7b15328c9857e5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x5 (x1 x7 x4)))))))).
admit.
Qed.
Theorem missingprop_3b253b2ab8f5ffc6bf3c21f27099f53d66319d981052657556e7b8cb22c7c70c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x5 (x1 x7 x4)))))))).
admit.
Qed.
Axiom missingprop_e04dddda2b13c94c6ee4fda7b3149b6586355e85275fd16dfb3a755475c1806a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x5 (x1 x4 x9)))))))).
Theorem missingprop_ef0b216b8e604cf3c40e7c248010305caf99c92c9aec2645b47c2e164487950f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x5 (x1 x4 x7)))))))).
admit.
Qed.
Theorem missingprop_17706701c8abb6c836c4672a2f3399a7044bdc02117a744b825bce4103b8f763 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x5 (x1 x4 x7)))))))).
admit.
Qed.
Axiom missingprop_76f54f88e0e72e11be4c545687829fadd73338fd2ff0a9fd89cc0b7ba939e694 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x5 (x1 x7 (x1 x6 (x1 x4 x9)))))))).
Theorem missingprop_4663f33c8ba92f68bfe87a2fa52157bb830bca6fee9484c1096e4623ede1adad : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x7 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_8374986c0be816808aa09bfd44249425b7a6dc1893b0f2484cf2c375298b8f87 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x7 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_44f0de32e7e2fb3c11d51312a240a367a3083e43023b03bcf4ac3108312319ba : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x7 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_43f33ba64c7dc2a28fc999db5382fbadcf8d6e81c3f11dba76ae770b67a611da : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x8 (x1 x7 (x1 x4 x5)))))))).
admit.
Qed.
Axiom missingprop_1f9b9682c98926d7adb2f23bfbbd91c73c0bb9ea279bba37f6ffaadbc31e0033 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x5 (x1 x6 (x1 x4 (x1 x7 x9)))))))).
Theorem missingprop_7b0898a2c3ad0c99ec1b7a9100b9dd650cc3f27a7d8ce237a19b50fea511e0bc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x4 (x1 x8 x5)))))))).
admit.
Qed.
Theorem missingprop_9183d802380101df1aa3e2ea16214817292e4d6da9535bdd15f2be6213dbe378 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x4 (x1 x8 x5)))))))).
admit.
Qed.
Theorem missingprop_4c977f8e338deaf572324d7189da6182db9b2a4058eca87756ec5e009a544296 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x4 (x1 x5 x8)))))))).
admit.
Qed.
Theorem missingprop_d9f62888f48268e5decc699ac49a91e0991dd1873074dea1f9d469883aaabac4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x4 (x1 x5 x8)))))))).
admit.
Qed.
Theorem missingprop_2c0390a53aa408c5e5bf848f5ac30350bb9aa31ab0b3c415081cc1234b349311 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x5 (x1 x8 x4)))))))).
admit.
Qed.
Theorem missingprop_9c3f0e08ddb8b8ac1586d6829e4c30c0fd05e16efaa857c94af3bd8e28aa4570 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x5 (x1 x8 x4)))))))).
admit.
Qed.
Theorem missingprop_00adbb565a605ba788ca2a5fea52654d6b9f00bf9502c5ef2368089ddb7a936c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x5 (x1 x4 x8)))))))).
admit.
Qed.
Theorem missingprop_aa1654efc234464d63de1e109b929e39dd8a5ff31f1de3431af226f6672fed03 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x5 (x1 x4 x8)))))))).
admit.
Qed.
Theorem missingprop_4f051510c16ef1a6bc888274199a2e81c40fd8e86c1b167d4626f3dfd9a3d5ad : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x8 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_f8ca33134ebb6f1961a9681330df5fcf9b406233bc5f45551791a5b64d2a513e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x8 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_05f852b12197d3fc902e98dcf0d206c8df8928fec5c7713eddb48609bcc309ef : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x8 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_5f1d0614f621b2209f3796f4685686d9db37d928727fc72abd2f747c582408d0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x7 (x1 x8 (x1 x4 x5)))))))).
admit.
Qed.
Axiom missingprop_9237661807cc20f4eaeec033bdec5c77970000abb381b95278e012054e6351cf : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x4 (x1 x7 x9)))))))).
Theorem missingprop_03dde9e4c0d5fab8028d5cbcf07dedfbb02738c112d14d4d09022a739d172262 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x4 (x1 x8 x7)))))))).
admit.
Qed.
Theorem missingprop_c190436cc3cbe830d6d867efcf0aaa762cfc3011635d43dc6ff6a392a3bcefd4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x4 (x1 x8 x7)))))))).
admit.
Qed.
Theorem missingprop_be384500097f19962ac270c98f85af50a6a9ae8c929a286b9d28ec6d879c1b0a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x4 (x1 x7 x8)))))))).
admit.
Qed.
Theorem missingprop_d0656bce1b6c861fd717692180b13513cf29700bf87f5416a6c14240c15a63d2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x4 (x1 x7 x8)))))))).
admit.
Qed.
Theorem missingprop_4d9f70837c3806ea484aa143b9d07e136e30b544fa5d835aa9878fb2d6a88b3b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x7 (x1 x8 x4)))))))).
admit.
Qed.
Theorem missingprop_0538a7f7ef77ce52daa5e015082291f77dc699ab42eec7b4ce4db28904af63c2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x7 (x1 x8 x4)))))))).
admit.
Qed.
Axiom missingprop_a5e7f9b90c3921fc85945056af8c3ee79e2198ffd58f4c6145e0a110c35c6d84 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x7 (x1 x4 x9)))))))).
Theorem missingprop_24d7c023bf8540f23cd9b461e060f38ea33154f7d2b2af009d0f3d914d2ad615 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x7 (x1 x4 x8)))))))).
admit.
Qed.
Theorem missingprop_48d67c7ea9a3b3aac1a316b44da74a953eab7f8b7f7d8ab49a86d3f5aead66a0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x7 (x1 x4 x8)))))))).
admit.
Qed.
Theorem missingprop_4b72113b1f20a62511f6962841d05044e6b24eeba7687d3ef829a220c05c6f80 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x8 (x1 x7 x4)))))))).
admit.
Qed.
Theorem missingprop_8828257f5727c53c321b50b3b5de9367bdb230b36a23052c3bf550d3693ed89b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x8 (x1 x7 x4)))))))).
admit.
Qed.
Theorem missingprop_a6223853cf2e8ce21b02dd8e92253eeaa50e67c9caedb6ae2f19bfca722d72f5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x8 (x1 x4 x7)))))))).
admit.
Qed.
Theorem missingprop_d913e1349782aafa00427473c5ac5046d1bb9425420ba24f1e138f486ce44fc1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x8 (x1 x4 x7)))))))).
admit.
Qed.
Axiom missingprop_4aa32fc16584528193133554554a528376758f0767d7692bdc255e226997887a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x5 (x1 x7 x9)))))))).
Theorem missingprop_2693ee70a77c11eddeee68feb1e7a147c728e4f377994178c75bb0be3179f22b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x5 (x1 x8 x7)))))))).
admit.
Qed.
Theorem missingprop_cbfec12c8893be7d486164b11758029a74c1fda4bed2ad6d0d16234fd39788d4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x5 (x1 x8 x7)))))))).
admit.
Qed.
Theorem missingprop_2e9f3ab9e63068a3c9386806de0415e0fc5eac33da7ae5cacf0c9e9123229c71 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x5 (x1 x7 x8)))))))).
admit.
Qed.
Theorem missingprop_f1e9fee0bb627544010c17a07394977b80deaa1cda77e6ad8bcfaa35a3be865f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x5 (x1 x7 x8)))))))).
admit.
Qed.
Theorem missingprop_3705389923989f7818b23ce8279385e3589e023f997672c0060c912e7ea808ce : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x7 (x1 x8 x5)))))))).
admit.
Qed.
Theorem missingprop_1da761ab712219249dcbd5db0594c0095cb64d0072b931740e7fba145cb2c733 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x7 (x1 x8 x5)))))))).
admit.
Qed.
Axiom missingprop_a85ebdef32deb8d4ecad1fbfba9cae743e1947cade2609589699d8c595416e5f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x7 (x1 x5 x9)))))))).
Theorem missingprop_b8d71002026a84af80a7e45273d0f4585de048623c799bcb8190b2cf17d4ad00 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x7 (x1 x5 x8)))))))).
admit.
Qed.
Theorem missingprop_3926f864df5981ae4d8237209142a728844da30911f40aa1361bf25477be7841 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x7 (x1 x5 x8)))))))).
admit.
Qed.
Theorem missingprop_33be6ff2ba2cb5d7c875ac49f173d5f81635c870dfd0b6c125a0d26adcb80ebb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x8 (x1 x7 x5)))))))).
admit.
Qed.
Theorem missingprop_4b68ffbdda2cec7343bf5a33c65cde6ee272fde359d7ebb46b10dd1cf6144903 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x8 (x1 x7 x5)))))))).
admit.
Qed.
Theorem missingprop_4625fe5fe6cd06298759808f429b24d547963f2864e8990f85891501cd7e054d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x8 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_35857fe907d2d259fb59ac4dd6897ec6937abc3f5c5b7b1a47b5dfcb910a7a25 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x8 (x1 x5 x7)))))))).
admit.
Qed.
Theorem missingprop_6a34c22bfeae4b8c8f2e83b73403b91a3d3250f88be0f8bd6cf3a09a999fb2a0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x4 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_86f4c3f569e8a01bdcbf3f1417eec853c4baffb2e8e5f711be6470d7372484f3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x4 (x1 x6 x5)))))))).
admit.
Qed.
Theorem missingprop_6a0edf4bb52cfc82e9a0705c77d1ef02b2446703948488749ed9207712da21b2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x4 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_1f6b2a606884325b75ee424296d2fd2a92de2d01c18be04d2f734c951f014542 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x4 (x1 x5 x6)))))))).
admit.
Qed.
Theorem missingprop_e02cc37f9e92529bd944e227ea26bb3885a8dc4e636a2c0739bb96025f74105c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x5 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_1e626ebdcd1b1c421e79cb218e0ac70160fd8b8ef3806a7f921817465d8f1fbd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x5 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_0e76f4d95e4f177af47f04e99d1d03b9000db551a49dae0ec6663684cb1d2b0b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x5 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_d0275c4220a77c431841c1f55fda4262f77c63507984b7a1f746a7f6302c6fa5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x5 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_6791e271e87c96c2ba447442aaaa7ee4764099a5603f456bb5b42d4a14788cc6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_b54320328bebd18ef445656b782b2a5a14f84a39617c0138d6d1c31b38d24f1c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x6 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_fb17953a97e3be370024d46748ca60ba3634f305a4df26a1b1225103df62862b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_f6adf3ca7464bd0030ffb748a043b842a6369041029f0049ce1b639bfda18d61 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x8 (x1 x6 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_352ff2f817a5289750f3f8f464edd4d4e4dfe156952a9f661eba36a92c9d66c2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x4 (x1 x8 x5)))))))).
admit.
Qed.
Theorem missingprop_c912295e9aabc807beee38ff6ebb2129dd7c8b1791bfe33ca2b81324152c6c1c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x4 (x1 x8 x5)))))))).
admit.
Qed.
Axiom missingprop_d7aede197f01cd60effcb039ba021969cc6caf15b1082fe3c75ed10b3b9e9738 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x4 (x1 x5 x9)))))))).
Theorem missingprop_3edc9296483b288e92e6e27139e98a1eb689498cd6fa1f8c8d09819a51794388 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x4 (x1 x5 x8)))))))).
admit.
Qed.
Theorem missingprop_968d667993eff793044b47a5d222c7d9e40444bfa2b1241f7e7be768e104ff1b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x4 (x1 x5 x8)))))))).
admit.
Qed.
Theorem missingprop_ebd382d85a5fe4abe59615c9da885356cee993a69a5e225af7dcb84096c8e657 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x5 (x1 x8 x4)))))))).
admit.
Qed.
Theorem missingprop_6748099fe468f7e1d4c5f29e51e85b0899d9007f50cbfd48a44583a7bd3ed16e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x5 (x1 x8 x4)))))))).
admit.
Qed.
Axiom missingprop_6391a3045c1a38a6181fda25a12e29d0c0e4f242bbd7c2844ae4d07d0b0e9175 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x5 (x1 x4 x9)))))))).
Theorem missingprop_6c3b26544e6a9a571e6e6b12c1161e1a3630bab595086526c3bf6760879767ca : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x5 (x1 x4 x8)))))))).
admit.
Qed.
Theorem missingprop_b458b03b02962ac798a6d334f8f435de02d657a2ef3a25cd793e3efdfb25ccc3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x5 (x1 x4 x8)))))))).
admit.
Qed.
Theorem missingprop_3ed17ba56690d149ab1b2ee656f95f82c27655c4e41918c0d82a51107d3fc644 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x8 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_083d680148d6d5c97772f40ae6b78e01361ca812aacb1f786191a9a62d4762ee : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x8 (x1 x5 x4)))))))).
admit.
Qed.
Theorem missingprop_3cab20ad4f23badb190b3d77ef7ff616ca135b59bc1e74ecf073252c3bdda50e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x8 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_1400a676650d366c1cd4c3751e56b9873f79bb99aa7e4cef771cb026eb1ff13d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x6 (x1 x8 (x1 x4 x5)))))))).
admit.
Qed.
Theorem missingprop_44e0850c5bad838feda430e3b36d4084774d3820dd72eb02817dcddc1da599f7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x4 (x1 x8 x6)))))))).
admit.
Qed.
Theorem missingprop_be6ca413ecfed8ed727cef15b715ddd17cd8c058f82c3247a755813069b110c0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x4 (x1 x8 x6)))))))).
admit.
Qed.
Axiom missingprop_a0d60fdcb01a4043cfafa2e293101f5daab6ea5e0542a73e0bc2238c579da5b6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x4 (x1 x6 x9)))))))).
Theorem missingprop_f8a551fe73c074c3f7ba2c3e97fbb354493904ba43a8fa02ba3b86d432f023c2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x4 (x1 x6 x8)))))))).
admit.
Qed.
Theorem missingprop_324bba30ca9261db001d556758cadc65b8003d823e1fd9f84124ef19d4016a97 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x4 (x1 x6 x8)))))))).
admit.
Qed.
Theorem missingprop_4132b19df80af2800644437b4e07a0ffc0f440717af3975937312600f14296a7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x6 (x1 x8 x4)))))))).
admit.
Qed.
Theorem missingprop_c48c1ef4749aec06f95c69ff590e329f2f15c43be45942689ea79ef347ae4d2f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x6 (x1 x8 x4)))))))).
admit.
Qed.
Axiom missingprop_2db1a6f7afa748b8b1462c4a288ccac1ee7e6fed0c05665e402dc777698fbedc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x6 (x1 x4 x9)))))))).
Theorem missingprop_b6b6b8c390f8e1c090bd86f06e80155e14137fa055723b8d072e702e01ac94ee : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x6 (x1 x4 x8)))))))).
admit.
Qed.
Theorem missingprop_0007b4059ffcec4ecbe98e8f709fe3d44d512b33bc42a84f38f9b29021a66da1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x6 (x1 x4 x8)))))))).
admit.
Qed.
Theorem missingprop_f12bdb7c04f2a561fb537f04e113f8fd6de5571f3b72d17a5abffa3643673719 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x8 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_58747884874e2d27a616a57b8cabd0a9812d623cbd64232e02a76a71aad4d130 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x8 (x1 x6 x4)))))))).
admit.
Qed.
Theorem missingprop_7658ef30f57d8d50ece538f496bd8bb3c455e5b38f02197493b9fdf393f9f6e9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x8 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_4ecd33b2747cea7656e9e04a33c2d9681806cc8c7577b07a34920f058d2492ff : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x5 (x1 x8 (x1 x4 x6)))))))).
admit.
Qed.
Theorem missingprop_6eb56cedb661f127c83785fb0826d7f26cc189cc55cc677dbb6eb9d11f605f43 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x5 (x1 x8 x6)))))))).
admit.
Qed.
Theorem missingprop_550ec12a543b9203d60f61f4e1ec047f4931d78b6687d0d480e08acbcfbf21d6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x5 (x1 x8 x6)))))))).
admit.
Qed.
Axiom missingprop_bcead8e489c1d82cc39dc071ffac1c967aaea2c3a33bd8c3158532abc68314b3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x5 (x1 x6 x9)))))))).
Theorem missingprop_220a930a73940ea9c8af31395db06b8350158f97048e92fa20c9e3369c37831a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x5 (x1 x6 x8)))))))).
admit.
Qed.
Theorem missingprop_aabd7615b8678c992ea826472a5c3546ccce9afe6d06501bb5acf03c7fd99972 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x5 (x1 x6 x8)))))))).
admit.
Qed.
Theorem missingprop_7509b31d29ff70aba54a36874d6ff4e90f63f7d023985bc8df15a57beb4c83ae : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x6 (x1 x8 x5)))))))).
admit.
Qed.
Theorem missingprop_927e7f310c02baec283eb7bfa4c2c656bb8fedfdc3f86556610b5f04b8911d10 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x6 (x1 x8 x5)))))))).
admit.
Qed.
Axiom missingprop_720f576e5c501c1ab55b62583f717bbbf3398c6ca96226092eafdfac72e852ed : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x8 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x6 (x1 x5 x9)))))))).
Theorem missingprop_f1440208ba19e02581e9c7734e2d0841243f54ca415b5d7dea0c191c420d5503 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x6 (x1 x5 x8)))))))).
admit.
Qed.
Theorem missingprop_292ca57ac6ad567905bf99a8bdeda7251b0be771ae0b5c572e4d061a87cd4a91 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4) -> (forall x2 x3, x0 x2 -> x0 x3 -> x1 x2 x3 = x1 x3 x2) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x9 (x1 x3 (x1 x2 (x1 x7 (x1 x4 (x1 x6 (x1 x5 x8)))))))).
admit.
Qed.
