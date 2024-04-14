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
(* Parameter u17 "cd79716d8923d293cac26e380f44bd1d637c5275ecfc89b47177ddf0a6ed1145" "7a7688d6358f93625a885a93e92c065257968a83dad53f42a5517baa820cd98c" *)
Parameter u17 : set.
(* Parameter Church17_p "45876439a0ebffabe974dfc224bfb5fcf7cdefbe1842d969001ec0615838c25b" "2a50602e0a09f647d85d3e0968b772706a7501d07652bb47048c29a7df10757a" *)
Parameter Church17_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
(* Parameter TwoRamseyGraph_3_6_Church17 "c28a4cc056045e49139215cfe5c8d969033f574528ca9155b0d4b2645f0bfb5c" "ab34eea44c60018e5f975d4318c2d3e52e1a34eb29f14ca15ff8cefeb958c494" *)
Parameter TwoRamseyGraph_3_6_Church17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom missingprop_95c6cbd2308b27a7edcd2a1d9389b377988e902d740d05dc7c88e6b8da945ab9 : (forall x0, atleastp 3 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1))) -> x1)).
Axiom missingprop_cbcfee5dff5e691bd336d521185cf4e19ac6075512774f25fde1bea7c0141e4d : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_p x2 -> (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_6_Church17 x0 x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_3_6_Church17 x1 x2 = (fun x4 x5 : set => x4) -> False).
Theorem missingprop_cbfb4a8ef037f9166e98e89145be924f54fff8f394689b1e9c22eef2210bedb6 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, (forall x1, x1 :e u17 -> Church17_p (x0 x1)) -> (forall x1, x1 :e u17 -> (forall x2, x2 :e u17 -> x0 x1 = x0 x2 -> x1 = x2)) -> (forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x2 :e u17 -> x3 :e u17 -> TwoRamseyGraph_3_6_Church17 (x0 x2) (x0 x3) = (fun x5 x6 : set => x5)) -> (forall x2, x2 c= u17 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))))).
admit.
Qed.
