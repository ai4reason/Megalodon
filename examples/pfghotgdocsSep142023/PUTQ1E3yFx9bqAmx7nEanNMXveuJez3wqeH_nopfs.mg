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
Axiom missingprop_f27937bf94bfaa4b78a4045d5ca59fff96ebce7f0748a28a6dc13e15a688b220 : (forall x0 x1 : set -> prop, forall x2 x3 x4 x5 x6 x7, (forall x8 : set -> prop, x8 x2 -> x8 x3 -> x8 x4 -> x8 x5 -> x8 x6 -> x8 x7 -> (forall x9, x0 x9 -> x8 x9)) -> (forall x8 : set -> prop, x8 x2 -> x8 x3 -> x8 x4 -> x8 x5 -> (forall x9, x1 x9 -> x8 x9)) -> (forall x8, x0 x8 -> not (x1 x8) -> (forall x9 : set -> prop, x9 x6 -> x9 x7 -> x9 x8)) -> x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> not (x1 x6) -> not (x1 x7) -> (x2 = x3 -> (forall x8 : prop, x8)) -> (x2 = x4 -> (forall x8 : prop, x8)) -> (x2 = x5 -> (forall x8 : prop, x8)) -> (x2 = x6 -> (forall x8 : prop, x8)) -> (x2 = x7 -> (forall x8 : prop, x8)) -> (x3 = x4 -> (forall x8 : prop, x8)) -> (x3 = x5 -> (forall x8 : prop, x8)) -> (x3 = x6 -> (forall x8 : prop, x8)) -> (x3 = x7 -> (forall x8 : prop, x8)) -> (x4 = x5 -> (forall x8 : prop, x8)) -> (x4 = x6 -> (forall x8 : prop, x8)) -> (x4 = x7 -> (forall x8 : prop, x8)) -> (x5 = x6 -> (forall x8 : prop, x8)) -> (x5 = x7 -> (forall x8 : prop, x8)) -> (x6 = x7 -> (forall x8 : prop, x8)) -> (forall x8 x9 x10 : set -> set -> set, (forall x11, x0 x11 -> (forall x12, x0 x12 -> x0 (x8 x11 x12))) -> (forall x11, x0 x11 -> (forall x12, x1 x12 -> x1 (x8 x11 x12))) -> (forall x11, x0 x11 -> (forall x12, x0 x12 -> x8 x11 (x8 x11 x12) = x12)) -> (forall x11, x0 x11 -> x8 x11 x2 = x3) -> (forall x11, x0 x11 -> (forall x12, x0 x12 -> x0 (x9 x11 x12))) -> (forall x11, x0 x11 -> (forall x12, x1 x12 -> x1 (x9 x11 x12))) -> (forall x11, x0 x11 -> (forall x12, x0 x12 -> x9 x11 (x9 x11 x12) = x12)) -> (forall x11, x0 x11 -> x9 x11 x2 = x4) -> (forall x11, x0 x11 -> (forall x12, x0 x12 -> x0 (x10 x11 x12))) -> (forall x11, x0 x11 -> (forall x12, x1 x12 -> x1 (x10 x11 x12))) -> (forall x11, x0 x11 -> (forall x12, x0 x12 -> x10 x11 (x10 x11 x12) = x12)) -> (forall x11, x0 x11 -> x10 x11 x2 = x5) -> (forall x11 : set -> set -> set -> set -> prop, (forall x12 x13, not (x11 x12 x13 x12 x13)) -> (forall x12 x13 x14 x15 x16 x17, x0 x16 -> x0 x17 -> x11 x12 x13 x14 x15 -> x11 x14 x15 x16 x17 -> x11 x12 x13 x16 x17) -> (forall x12, x0 x12 -> (forall x13, x1 x13 -> (forall x14, x0 x14 -> (forall x15, x0 x15 -> not (x1 x15) -> x11 x12 x13 x14 x15)))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x3 x13 x2))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x4 x13 x2))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x5 x13 x2))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x6 x13 x2))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x7 x13 x2))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x4 x13 x3))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x5 x13 x3))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x6 x13 x3))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x7 x13 x3))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x5 x13 x4))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x6 x13 x4))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x7 x13 x4))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x6 x13 x5))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x7 x13 x5))) -> (forall x12, x0 x12 -> (forall x13, x0 x13 -> not (x11 x12 x7 x13 x6))) -> (forall x12, x0 x12 -> not (x11 x2 x12 x2 x12)) -> (forall x12, x0 x12 -> not (x11 x3 x12 x2 x12)) -> (forall x12, x0 x12 -> not (x11 x4 x12 x2 x12)) -> (forall x12, x0 x12 -> not (x11 x5 x12 x2 x12)) -> (forall x12, x0 x12 -> not (x11 x6 x12 x2 x12)) -> (forall x12, x0 x12 -> not (x11 x7 x12 x2 x12)) -> (forall x12, x0 x12 -> not (x11 x3 x12 x3 x12)) -> (forall x12, x0 x12 -> not (x11 x4 x12 x3 x12)) -> (forall x12, x0 x12 -> not (x11 x5 x12 x3 x12)) -> (forall x12, x0 x12 -> not (x11 x6 x12 x3 x12)) -> (forall x12, x0 x12 -> not (x11 x7 x12 x3 x12)) -> (forall x12, x0 x12 -> not (x11 x4 x12 x4 x12)) -> (forall x12, x0 x12 -> not (x11 x5 x12 x4 x12)) -> (forall x12, x0 x12 -> not (x11 x6 x12 x4 x12)) -> (forall x12, x0 x12 -> not (x11 x7 x12 x4 x12)) -> (forall x12, x0 x12 -> not (x11 x5 x12 x5 x12)) -> (forall x12, x0 x12 -> not (x11 x6 x12 x5 x12)) -> (forall x12, x0 x12 -> not (x11 x7 x12 x5 x12)) -> (forall x12, x0 x12 -> not (x11 x6 x12 x6 x12)) -> (forall x12, x0 x12 -> not (x11 x7 x12 x6 x12)) -> (forall x12, x0 x12 -> not (x11 x7 x12 x7 x12)) -> (forall x12 : set -> set -> set -> set -> prop, (forall x13 x14 x15 x16, x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> (forall x17 : prop, (x11 x13 x14 x15 x16 -> x17) -> (x12 x13 x14 x15 x16 -> x17) -> (x11 x15 x16 x13 x14 -> x17) -> x17)) -> (forall x13 x14 x15 x16, x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> not (x12 x13 x14 x15 x16) -> not (x12 x13 (x8 x13 x14) x15 (x8 x15 x16))) -> (forall x13 x14 x15 x16, x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> not (x12 x13 x14 x15 x16) -> not (x12 x13 (x9 x13 x14) x15 (x9 x15 x16))) -> (forall x13 x14 x15 x16, x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> not (x12 x13 x14 x15 x16) -> not (x12 x13 (x10 x13 x14) x15 (x10 x15 x16))) -> (forall x13 x14, x0 x13 -> x0 x14 -> x12 x13 x14 x13 x14) -> (forall x13 x14 x15 x16, x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x12 x13 x14 x15 x16 -> x12 x15 x16 x13 x14) -> (forall x13 x14, x0 x13 -> x0 x14 -> x12 x13 x14 x7 x7) -> (forall x13, x0 x13 -> x12 x6 x6 x7 x13) -> (forall x13, x0 x13 -> x12 x6 x7 x7 x13) -> x12 x2 x2 x2 x4 -> x12 x2 x2 x2 x6 -> x12 x2 x2 x3 x2 -> x12 x2 x2 x3 x3 -> x12 x2 x2 x3 x6 -> x12 x2 x2 x4 x4 -> x12 x2 x2 x4 x5 -> x12 x2 x2 x4 x6 -> x12 x2 x2 x5 x3 -> x12 x2 x2 x5 x4 -> x12 x2 x2 x5 x6 -> x12 x2 x2 x6 x4 -> x12 x2 x2 x6 x5 -> x12 x2 x2 x7 x2 -> x12 x2 x2 x7 x4 -> x12 x2 x2 x7 x5 -> x12 x2 x3 x2 x5 -> x12 x2 x3 x2 x7 -> x12 x2 x3 x3 x2 -> x12 x2 x3 x3 x3 -> x12 x2 x3 x3 x7 -> x12 x2 x3 x4 x4 -> x12 x2 x3 x4 x5 -> x12 x2 x3 x4 x7 -> x12 x2 x3 x5 x2 -> x12 x2 x3 x5 x5 -> x12 x2 x3 x5 x7 -> x12 x2 x3 x6 x4 -> x12 x2 x3 x6 x5 -> x12 x2 x3 x7 x3 -> x12 x2 x3 x7 x4 -> x12 x2 x3 x7 x5 -> x12 x2 x4 x2 x7 -> x12 x2 x4 x3 x4 -> x12 x2 x4 x3 x5 -> x12 x2 x4 x3 x6 -> x12 x2 x4 x4 x2 -> x12 x2 x4 x4 x3 -> x12 x2 x4 x4 x6 -> x12 x2 x4 x5 x2 -> x12 x2 x4 x5 x5 -> x12 x2 x4 x5 x7 -> x12 x2 x4 x6 x2 -> x12 x2 x4 x6 x3 -> x12 x2 x4 x7 x2 -> x12 x2 x4 x7 x3 -> x12 x2 x4 x7 x4 -> x12 x2 x5 x2 x6 -> x12 x2 x5 x3 x4 -> x12 x2 x5 x3 x5 -> x12 x2 x5 x3 x7 -> x12 x2 x5 x4 x2 -> x12 x2 x5 x4 x3 -> x12 x2 x5 x4 x7 -> x12 x2 x5 x5 x3 -> x12 x2 x5 x5 x4 -> x12 x2 x5 x5 x6 -> x12 x2 x5 x6 x2 -> x12 x2 x5 x6 x3 -> x12 x2 x5 x7 x2 -> x12 x2 x5 x7 x3 -> x12 x2 x5 x7 x5 -> x12 x2 x6 x3 x3 -> x12 x2 x6 x3 x4 -> x12 x2 x6 x4 x2 -> x12 x2 x6 x4 x5 -> x12 x2 x6 x4 x6 -> x12 x2 x6 x4 x7 -> x12 x2 x6 x5 x2 -> x12 x2 x6 x5 x5 -> x12 x2 x6 x5 x6 -> x12 x2 x6 x5 x7 -> x12 x2 x6 x6 x3 -> x12 x2 x6 x6 x4 -> x12 x2 x6 x7 x6 -> x12 x2 x7 x3 x2 -> x12 x2 x7 x3 x5 -> x12 x2 x7 x4 x3 -> x12 x2 x7 x4 x4 -> x12 x2 x7 x4 x6 -> x12 x2 x7 x4 x7 -> x12 x2 x7 x5 x3 -> x12 x2 x7 x5 x4 -> x12 x2 x7 x5 x6 -> x12 x2 x7 x5 x7 -> x12 x2 x7 x6 x2 -> x12 x2 x7 x6 x5 -> x12 x2 x7 x7 x6 -> x12 x3 x2 x3 x4 -> x12 x3 x2 x3 x7 -> x12 x3 x2 x4 x2 -> x12 x3 x2 x4 x6 -> x12 x3 x2 x5 x3 -> x12 x3 x2 x5 x4 -> x12 x3 x2 x5 x5 -> x12 x3 x2 x5 x6 -> x12 x3 x2 x6 x3 -> x12 x3 x2 x6 x4 -> x12 x3 x2 x6 x7 -> x12 x3 x2 x7 x3 -> x12 x3 x3 x3 x5 -> x12 x3 x3 x3 x6 -> x12 x3 x3 x4 x3 -> x12 x3 x3 x4 x7 -> x12 x3 x3 x5 x2 -> x12 x3 x3 x5 x4 -> x12 x3 x3 x5 x5 -> x12 x3 x3 x5 x7 -> x12 x3 x3 x6 x2 -> x12 x3 x3 x6 x5 -> x12 x3 x3 x6 x6 -> x12 x3 x3 x7 x2 -> x12 x3 x4 x3 x7 -> x12 x3 x4 x4 x4 -> x12 x3 x4 x4 x6 -> x12 x3 x4 x5 x2 -> x12 x3 x4 x5 x3 -> x12 x3 x4 x5 x5 -> x12 x3 x4 x5 x7 -> x12 x3 x4 x6 x2 -> x12 x3 x4 x6 x5 -> x12 x3 x4 x6 x7 -> x12 x3 x4 x7 x5 -> x12 x3 x5 x3 x6 -> x12 x3 x5 x4 x5 -> x12 x3 x5 x4 x7 -> x12 x3 x5 x5 x2 -> x12 x3 x5 x5 x3 -> x12 x3 x5 x5 x4 -> x12 x3 x5 x5 x6 -> x12 x3 x5 x6 x3 -> x12 x3 x5 x6 x4 -> x12 x3 x5 x6 x6 -> x12 x3 x5 x7 x4 -> x12 x3 x6 x3 x7 -> x12 x3 x6 x4 x3 -> x12 x3 x6 x4 x5 -> x12 x3 x6 x5 x6 -> x12 x3 x6 x5 x7 -> x12 x3 x6 x6 x7 -> x12 x3 x6 x7 x3 -> x12 x3 x6 x7 x5 -> x12 x3 x6 x7 x6 -> x12 x3 x7 x4 x2 -> x12 x3 x7 x4 x4 -> x12 x3 x7 x5 x6 -> x12 x3 x7 x5 x7 -> x12 x3 x7 x6 x6 -> x12 x3 x7 x7 x2 -> x12 x3 x7 x7 x4 -> x12 x3 x7 x7 x6 -> x12 x4 x2 x4 x3 -> x12 x4 x2 x4 x6 -> x12 x4 x2 x5 x3 -> x12 x4 x2 x5 x4 -> x12 x4 x2 x5 x7 -> x12 x4 x2 x6 x4 -> x12 x4 x2 x6 x5 -> x12 x4 x2 x7 x4 -> x12 x4 x2 x7 x6 -> x12 x4 x3 x4 x7 -> x12 x4 x3 x5 x2 -> x12 x4 x3 x5 x5 -> x12 x4 x3 x5 x6 -> x12 x4 x3 x6 x4 -> x12 x4 x3 x6 x5 -> x12 x4 x3 x7 x5 -> x12 x4 x3 x7 x6 -> x12 x4 x4 x4 x5 -> x12 x4 x4 x4 x6 -> x12 x4 x4 x5 x2 -> x12 x4 x4 x5 x5 -> x12 x4 x4 x5 x6 -> x12 x4 x4 x6 x2 -> x12 x4 x4 x6 x3 -> x12 x4 x4 x7 x2 -> x12 x4 x4 x7 x6 -> x12 x4 x5 x4 x7 -> x12 x4 x5 x5 x3 -> x12 x4 x5 x5 x4 -> x12 x4 x5 x5 x7 -> x12 x4 x5 x6 x2 -> x12 x4 x5 x6 x3 -> x12 x4 x5 x7 x3 -> x12 x4 x5 x7 x6 -> x12 x4 x6 x2 x7 -> x12 x4 x6 x4 x7 -> x12 x4 x6 x6 x3 -> x12 x4 x6 x6 x5 -> x12 x4 x7 x6 x2 -> x12 x4 x7 x6 x4 -> x12 x5 x2 x5 x3 -> x12 x5 x2 x5 x6 -> x12 x5 x2 x6 x4 -> x12 x5 x2 x6 x7 -> x12 x5 x2 x7 x2 -> x12 x5 x2 x7 x3 -> x12 x5 x2 x7 x6 -> x12 x5 x3 x5 x7 -> x12 x5 x3 x6 x5 -> x12 x5 x3 x6 x6 -> x12 x5 x3 x7 x2 -> x12 x5 x3 x7 x3 -> x12 x5 x3 x7 x6 -> x12 x5 x4 x5 x5 -> x12 x5 x4 x5 x7 -> x12 x5 x4 x6 x2 -> x12 x5 x4 x6 x7 -> x12 x5 x4 x7 x4 -> x12 x5 x4 x7 x5 -> x12 x5 x4 x7 x6 -> x12 x5 x5 x5 x6 -> x12 x5 x5 x6 x3 -> x12 x5 x5 x6 x6 -> x12 x5 x5 x7 x4 -> x12 x5 x5 x7 x5 -> x12 x5 x5 x7 x6 -> x12 x5 x6 x2 x7 -> x12 x5 x6 x3 x7 -> x12 x5 x6 x7 x3 -> x12 x5 x6 x7 x4 -> x12 x5 x7 x7 x2 -> x12 x5 x7 x7 x5 -> x12 x6 x2 x6 x4 -> x12 x6 x2 x6 x5 -> x12 x6 x2 x6 x7 -> x12 x6 x2 x7 x2 -> x12 x6 x2 x7 x3 -> x12 x6 x3 x6 x4 -> x12 x6 x3 x6 x5 -> x12 x6 x3 x6 x6 -> x12 x6 x3 x7 x2 -> x12 x6 x3 x7 x3 -> x12 x6 x4 x6 x7 -> x12 x6 x4 x7 x4 -> x12 x6 x4 x7 x5 -> x12 x6 x5 x6 x6 -> x12 x6 x5 x7 x4 -> x12 x6 x5 x7 x5 -> x12 x6 x6 x3 x7 -> x12 x7 x2 x7 x5 -> x12 x7 x3 x7 x4 -> x12 x7 x6 x2 x7 -> x12 x7 x6 x3 x7 -> x12 x7 x6 x6 x7 -> (forall x13, x0 x13 -> (forall x14, x0 x14 -> (forall x15, x0 x15 -> (forall x16, x0 x16 -> (forall x17, x0 x17 -> (forall x18, x0 x18 -> (forall x19, x0 x19 -> (forall x20, x0 x20 -> (forall x21, x0 x21 -> (forall x22, x0 x22 -> (forall x23, x0 x23 -> (forall x24, x0 x24 -> not (x12 x13 x14 x15 x16) -> not (x12 x13 x14 x17 x18) -> not (x12 x13 x14 x19 x20) -> not (x12 x13 x14 x21 x22) -> not (x12 x13 x14 x23 x24) -> not (x12 x15 x16 x17 x18) -> not (x12 x15 x16 x19 x20) -> not (x12 x15 x16 x21 x22) -> not (x12 x15 x16 x23 x24) -> not (x12 x17 x18 x19 x20) -> not (x12 x17 x18 x21 x22) -> not (x12 x17 x18 x23 x24) -> not (x12 x19 x20 x21 x22) -> not (x12 x19 x20 x23 x24) -> not (x12 x21 x22 x23 x24) -> False)))))))))))))))).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
(* Parameter TwoRamseyGraph_4_6_35_b "79c5894fa21b27f3c49563792759dd6d0087c766e76688ed47d170a9518ddfe0" "47feaf65da0fb35ed52a3e646f9231ac1476c38f0e91d79850d45e8cc7580520" *)
Parameter TwoRamseyGraph_4_6_35_b : set -> set -> set -> set -> prop.
Axiom missingprop_cb3646199bdd943b9f35ea4384074b7c5c773b831781cf72f7c47626f7a767d4 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (forall x6, x6 :e u6 -> (forall x7, x7 :e u6 -> TwoRamseyGraph_4_6_35_b x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_b x0 x1 x4 x5 -> TwoRamseyGraph_4_6_35_b x0 x1 x6 x7 -> TwoRamseyGraph_4_6_35_b x2 x3 x4 x5 -> TwoRamseyGraph_4_6_35_b x2 x3 x6 x7 -> TwoRamseyGraph_4_6_35_b x4 x5 x6 x7 -> False)))))))).
Definition Church6_p : (set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x7) -> x1 x0).
Definition Church6_lt4p : (set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x5) -> x1 x0).
Definition permargs_i_1_0_3_2_4_5 : (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 : set => x0 x2 x1 x4 x3).
Definition Church6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set => fun x2 x3 x4 x5 x6 x7 : set => x0 (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x6 x7)).
Axiom missingprop_82a18ab52f7ac6281a607a1820c9620c483afb6be383087b7d72855319e580f5 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x0 -> Church6_lt4p (permargs_i_1_0_3_2_4_5 x0)).
Axiom missingprop_995579645b8886904e46af0dc0ac8e19ee3cd4af7d78809ff698344ead396f5a : Church6_lt4p (fun x0 x1 x2 x3 x4 x5 : set => x1).
Axiom missingprop_56ce56513a8af1327555b873c1c6ce07e295bb2d93a34f831bbfdb3328f2809b : Church6_lt4p (fun x0 x1 x2 x3 x4 x5 : set => x0).
Axiom missingprop_9ab406e767d5138f84eceb89ae815ef2f93656cc034576ca18ab84af7a608607 : Church6_lt4p (fun x0 x1 x2 x3 x4 x5 : set => x3).
Axiom missingprop_bd8f81a1227d0cc25cea7c364f7541293f70705efd4999ad0dba8cf8857226a9 : Church6_lt4p (fun x0 x1 x2 x3 x4 x5 : set => x2).
Theorem missingprop_22158d08c0231978b15c89a0a71d14470c178b70c2d5d41c68c1853923802bd9 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> (forall x1 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x1 -> Church6_lt4p (Church6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 x0 x1))).
admit.
Qed.
Definition permargs_i_2_3_0_1_4_5 : (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 : set => x0 x3 x4 x1 x2).
Definition Church6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set => fun x2 x3 x4 x5 x6 x7 : set => x0 (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x6 x7)).
Axiom missingprop_e4e4b3f2fb027bfa7e0d480fd7613c70f730d2ef7d2b0b335a19a8b751f04a2c : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x0 -> Church6_lt4p (permargs_i_2_3_0_1_4_5 x0)).
Theorem missingprop_e2935f3c5b2b7574d7a820d14c9b741161118c1a3930acb8b78305f98a602198 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> (forall x1 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x1 -> Church6_lt4p (Church6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 x0 x1))).
admit.
Qed.
Definition permargs_i_3_2_1_0_4_5 : (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 : set => x0 x4 x3 x2 x1).
Definition Church6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set => fun x2 x3 x4 x5 x6 x7 : set => x0 (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x6 x7)).
Axiom missingprop_03dd63d746fcacdd2139f1b753227929c56f1868867976a2dfb9db401b403f8a : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x0 -> Church6_lt4p (permargs_i_3_2_1_0_4_5 x0)).
Theorem missingprop_2a3eaca129caad3fda8e1cc1010aa31d33436aa039f364b9e7e83665634185f2 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> (forall x1 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x1 -> Church6_lt4p (Church6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 x0 x1))).
admit.
Qed.
Definition TwoRamseyGraph_4_6_Church6_squared_a : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set => fun x4 x5 : set => x0 (x1 (x2 (x3 x4 x5 x4 x5 x4 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x4 x4 x5 x4 x5) (x3 x5 x5 x4 x4 x5 x5) (x3 x4 x5 x4 x4 x5 x4)) (x2 (x3 x5 x4 x5 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x5 x4 x4 x5 x4) (x3 x4 x5 x5 x4 x5 x4) (x3 x5 x5 x4 x4 x5 x5) (x3 x5 x4 x4 x4 x5 x4)) (x2 (x3 x4 x5 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x4 x5 x5 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x5) (x3 x4 x4 x4 x5 x5 x4)) (x2 (x3 x5 x4 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x4 x4 x5 x4 x5) (x3 x4 x4 x5 x5 x5 x5) (x3 x4 x4 x5 x4 x5 x4)) (x2 (x3 x4 x5 x5 x4 x4 x5) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x5 x5 x4 x4 x4) (x3 x4 x5 x5 x4 x4 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x5 x5 x5 x5 x4 x4)) (x2 (x3 x5 x4 x4 x5 x5 x4) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x4 x4 x5 x4 x4) (x3 x5 x4 x4 x5 x4 x4) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x5 x5 x5 x4 x4))) (x1 (x2 (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x5 x4 x5 x5 x4) (x3 x4 x5 x5 x5 x4 x5) (x3 x5 x4 x4 x4 x4 x5) (x3 x5 x4 x4 x5 x5 x4) (x3 x5 x4 x5 x5 x5 x4)) (x2 (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x4 x5 x4 x4 x5) (x3 x5 x4 x5 x5 x5 x4) (x3 x4 x5 x4 x4 x5 x4) (x3 x4 x5 x5 x4 x4 x5) (x3 x4 x5 x5 x5 x5 x4)) (x2 (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x4 x5 x5 x4) (x3 x5 x5 x4 x5 x4 x5) (x3 x4 x4 x5 x4 x5 x4) (x3 x4 x5 x5 x4 x5 x4) (x3 x5 x5 x5 x4 x5 x4)) (x2 (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x5 x4 x4 x5) (x3 x5 x5 x5 x4 x5 x4) (x3 x4 x4 x4 x5 x4 x5) (x3 x5 x4 x4 x5 x4 x5) (x3 x5 x5 x4 x5 x5 x4)) (x2 (x3 x4 x5 x4 x5 x5 x5) (x3 x5 x4 x5 x4 x4 x4) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x5 x4) (x3 x5 x4 x5 x4 x4 x4)) (x2 (x3 x5 x4 x5 x4 x5 x5) (x3 x4 x5 x4 x5 x4 x4) (x3 x4 x5 x4 x5 x5 x5) (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x4 x5) (x3 x4 x5 x4 x5 x4 x4))) (x1 (x2 (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x5 x5 x5 x4) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x4 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x5 x5) (x3 x5 x5 x4 x5 x4 x4)) (x2 (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x5 x5 x4 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x5 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x5) (x3 x5 x5 x5 x4 x4 x4)) (x2 (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x5 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x5 x4 x4 x5) (x3 x4 x4 x5 x5 x5 x5) (x3 x4 x5 x5 x5 x4 x4)) (x2 (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x5 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x4 x5 x5 x4) (x3 x4 x4 x5 x5 x5 x5) (x3 x5 x4 x5 x5 x4 x4)) (x2 (x3 x4 x5 x4 x5 x4 x4) (x3 x4 x5 x4 x5 x5 x5) (x3 x4 x5 x4 x5 x4 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x5 x5 x5 x5 x4)) (x2 (x3 x5 x4 x5 x4 x4 x4) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x4 x5 x4 x4 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x4 x5 x5 x5) (x3 x5 x5 x5 x5 x5 x4))) (x1 (x2 (x3 x5 x4 x4 x5 x4 x5) (x3 x5 x4 x4 x4 x5 x5) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x5 x4 x5 x5 x4) (x3 x4 x4 x5 x5 x4 x4)) (x2 (x3 x4 x5 x5 x4 x5 x4) (x3 x4 x5 x4 x4 x5 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x5 x5 x4 x4 x5) (x3 x4 x4 x5 x5 x4 x4)) (x2 (x3 x4 x5 x5 x4 x5 x4) (x3 x4 x4 x5 x4 x5 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x4 x5 x5 x5 x5 x4) (x3 x5 x5 x4 x4 x4 x4)) (x2 (x3 x5 x4 x4 x5 x4 x5) (x3 x4 x4 x4 x5 x5 x5) (x3 x5 x4 x4 x5 x5 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x4 x5 x5 x4 x5) (x3 x5 x5 x4 x4 x4 x4)) (x2 (x3 x4 x5 x5 x4 x4 x4) (x3 x4 x5 x5 x4 x4 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x5 x5 x4 x4 x5) (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x4 x5 x5 x4)) (x2 (x3 x5 x4 x4 x5 x4 x4) (x3 x5 x4 x4 x5 x4 x4) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x4 x4 x5 x5 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x5 x4 x5 x4))) (x1 (x2 (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x5 x4 x5 x5 x5) (x3 x4 x5 x4 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x4)) (x2 (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x5 x5 x4 x5 x5) (x3 x5 x4 x4 x4 x4 x5) (x3 x4 x4 x5 x5 x5 x4)) (x2 (x3 x4 x4 x5 x5 x4 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x5 x5 x5 x5 x5) (x3 x4 x4 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x5 x4)) (x2 (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x4 x5 x5 x5 x5) (x3 x4 x4 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x4)) (x2 (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x5 x4 x5 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x4 x5 x4 x4 x5) (x3 x4 x4 x4 x4 x4 x4)) (x2 (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x4 x5 x4 x5) (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x4 x5 x5 x5) (x3 x4 x5 x4 x5 x5 x4) (x3 x4 x4 x4 x4 x4 x4))) (x1 (x2 (x3 x4 x5 x4 x4 x5 x5) (x3 x5 x4 x5 x5 x5 x4) (x3 x5 x5 x4 x5 x5 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x4 x5 x5 x4 x4) (x3 x4 x5 x5 x4 x5 x4)) (x2 (x3 x5 x4 x4 x4 x5 x5) (x3 x4 x5 x5 x5 x4 x5) (x3 x5 x5 x5 x4 x5 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x4 x4 x5 x5 x4 x4) (x3 x5 x4 x4 x5 x5 x4)) (x2 (x3 x4 x4 x4 x5 x5 x5) (x3 x5 x5 x5 x4 x5 x4) (x3 x4 x5 x5 x5 x5 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x5 x4 x4 x4 x4) (x3 x5 x4 x4 x5 x5 x4)) (x2 (x3 x4 x4 x5 x4 x5 x5) (x3 x5 x5 x4 x5 x4 x5) (x3 x5 x4 x5 x5 x5 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x5 x4 x4 x4 x4) (x3 x4 x5 x5 x4 x5 x4)) (x2 (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x4 x4) (x3 x4 x4 x4 x4 x5 x5) (x3 x4 x4 x4 x4 x5 x5) (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x4 x4)) (x2 (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4)))).
(* Parameter nth_6_tuple "368935f3a5f424f35961c43f39985442e0a4fe403f656e92d8a87b20af68c0d7" "d45c1fe6a3dff7795ce0a3b891aea8946efc8dceebae3c8b8977b41878b0e841" *)
Parameter nth_6_tuple : set -> set -> set -> set -> set -> set -> set -> set.
Definition TwoRamseyGraph_4_6_35_a : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => forall x4 : (set -> set -> set) -> (set -> set -> set) -> prop, x4 (TwoRamseyGraph_4_6_Church6_squared_a (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3)) (fun x5 x6 : set => x5) -> x4 (fun x5 x6 : set => x5) (TwoRamseyGraph_4_6_Church6_squared_a (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3))).
(* Parameter In2_lexicographic "813c91891171c9e2ebc16f745a3c38ce142f3eed6b33e907b14dc15dc3732841" "37ac57f65c41941ca2aaa13955e9b49dc6219c2d1d3c6aed472a28f60f59fed4" *)
Parameter In2_lexicographic : set -> set -> set -> set -> prop.
Definition Church6_to_u6 : (set -> set -> set -> set -> set -> set -> set) -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => x0 0 u1 u2 u3 u4 u5).
Definition u6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 : set -> set -> set :=
 (fun x0 x1 : set => Church6_to_u6 (Church6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 (nth_6_tuple x0) (nth_6_tuple x1))).
Definition u6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 : set -> set -> set :=
 (fun x0 x1 : set => Church6_to_u6 (Church6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 (nth_6_tuple x0) (nth_6_tuple x1))).
Definition u6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 : set -> set -> set :=
 (fun x0 x1 : set => Church6_to_u6 (Church6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 (nth_6_tuple x0) (nth_6_tuple x1))).
Axiom In_0_6 : 0 :e u6.
Axiom In_1_6 : u1 :e u6.
Axiom In_2_6 : u2 :e u6.
Axiom In_3_6 : u3 :e u6.
Axiom In_4_6 : u4 :e u6.
Axiom In_5_6 : u5 :e u6.
Axiom In_0_4 : 0 :e 4.
Axiom In_1_4 : 1 :e 4.
Axiom In_2_4 : 2 :e 4.
Axiom In_3_4 : 3 :e 4.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom In_4_5 : 4 :e 5.
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom neq_1_0 : u1 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_0 : u2 = 0 -> (forall x0 : prop, x0).
Axiom neq_3_0 : u3 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_0 : u4 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_0 : u5 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : u2 = u1 -> (forall x0 : prop, x0).
Axiom neq_3_1 : u3 = u1 -> (forall x0 : prop, x0).
Axiom neq_4_1 : u4 = u1 -> (forall x0 : prop, x0).
Axiom neq_5_1 : u5 = u1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : u3 = u2 -> (forall x0 : prop, x0).
Axiom neq_4_2 : u4 = u2 -> (forall x0 : prop, x0).
Axiom neq_5_2 : u5 = u2 -> (forall x0 : prop, x0).
Axiom neq_4_3 : u4 = u3 -> (forall x0 : prop, x0).
Axiom neq_5_3 : u5 = u3 -> (forall x0 : prop, x0).
Axiom neq_5_4 : u5 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_aa692ea1aa63eb15856af3e99748d802e7b0fa215a873b3d7a0eaf6c40dc14ee : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> u6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 x0 (u6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 x0 x1) = x1)).
Axiom missingprop_4d91bec054042bcdeefe33bb5a3d3611c13820c9f08314db2f8ef62923a83386 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> u6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 x0 (u6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 x0 x1) = x1)).
Axiom missingprop_1663e3943afde111e4661df41325166c466aef81ade0fce5108a3042fa43a66c : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> u6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 x0 (u6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 x0 x1) = x1)).
Axiom missingprop_6941479821a87bc0213525579f6079e2b0a19cf04ef701e5cf38bb698686b29c : (forall x0 x1, not (In2_lexicographic x0 x1 x0 x1)).
Axiom missingprop_cdbc6277200ea99f7eefcbc0878b5c5c35ef86a6cae6f27f5a4a6562e338ad50 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u1 x1 0))).
Axiom missingprop_c3b53ba05cb8a966e79bf7686d8a6d429b7a67f4133f758c77f7634030086a38 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u2 x1 0))).
Axiom missingprop_daea222bde6599d08f3e1f080283f6d31c819e9d3fc672010019a0d512917af2 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u3 x1 0))).
Axiom missingprop_3d8970394a902d267ed19d01ab818f977c770d7881a4d51a5d891efca480b273 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u4 x1 0))).
Axiom missingprop_8a9776723da253f57832b2c3c265d876ce63c12fa6d67d3d8d5936dab1aab4e3 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 0))).
Axiom missingprop_45af0e5691a9cf52cd1ae085d0eece1b7e1ed1d45c8475957796d4d228b218ed : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u2 x1 u1))).
Axiom missingprop_8565bcc6d9a8ef91f6be6cf42caf6e272701035129050cd69fe5b21172dba186 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u3 x1 u1))).
Axiom missingprop_548e120db7c3ad799c85538d1da2c32a8b396a4e81330557d9fff3a0c19b04ef : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u4 x1 u1))).
Axiom missingprop_36c0d8bebb09370aca4fb2922f152f8cd3276f34e2b1edda8be238e293dea7fe : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 u1))).
Axiom missingprop_4a4fca565643f72eb0ea67ce55df7321774bc922ef2062a3f305cdf2f3544b66 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u3 x1 u2))).
Axiom missingprop_d83ae45108d35e0fb327786fc6fe6f8e07c44e22d565943cac2638f55d6f5bd4 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u4 x1 u2))).
Axiom missingprop_a4165572a0e7f94ec68ad0de3bd2d67f3eda34597e66d4df7eb5bc04615eb969 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 u2))).
Axiom missingprop_12c2d32d3b0a4d379bfd31bb4a06b3883d1dd755619c597c44c06bb975bd9467 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u4 x1 u3))).
Axiom missingprop_5053d8decba4824ece40f7eda6494874bc3aa6f8da6720b72135d5129b785480 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 u3))).
Axiom missingprop_1345ff26ac618cf0478629cefa9923bbe00d06bb23ed2cb69ede78280057e4b6 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 u4))).
Axiom missingprop_611dcd3b3d470e1006f1cce69705cb47963f241eef0bbee19351f9cc9ee88eca : (forall x0, x0 :e u6 -> not (In2_lexicographic 0 x0 0 x0)).
Axiom missingprop_f04d41eb8e4f776924c78b479ba58135945070b176488f3e4fb4b1880369e3b9 : (forall x0, x0 :e u6 -> not (In2_lexicographic u1 x0 0 x0)).
Axiom missingprop_3f930481fcfac5229495a8bec7c52498133922a121da53552e66848c4086826d : (forall x0, x0 :e u6 -> not (In2_lexicographic u2 x0 0 x0)).
Axiom missingprop_07322204153a256a98cb97a1e0c8f90b4215d6376cd0af872814e287dce96776 : (forall x0, x0 :e u6 -> not (In2_lexicographic u3 x0 0 x0)).
Axiom missingprop_33a6bc18cfd8d20cac3a782e72f02a1f3efbca4312e292180069e370e2ae77d7 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 0 x0)).
Axiom missingprop_7abc2d954f30ac1710df169c03b40c811a40b48113e2a8b55f9d7198497f4c9f : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 0 x0)).
Axiom missingprop_6ac6d7e93a50e964968a96f66a9aa9dc3778a58cb83309544cb39a85783128c4 : (forall x0, x0 :e u6 -> not (In2_lexicographic u1 x0 u1 x0)).
Axiom missingprop_1c227da1eb8009dbe54d36a9388ac462e3233ad6cd6eda88206a777204ef6be9 : (forall x0, x0 :e u6 -> not (In2_lexicographic u2 x0 u1 x0)).
Axiom missingprop_e76834dc137834cd33291ca0ba7620645922e4e84be041715b9165fc9f98ecec : (forall x0, x0 :e u6 -> not (In2_lexicographic u3 x0 u1 x0)).
Axiom missingprop_5eecaecea4203ee1bf240cb5f8d322e991cb60db8552b2499ebfec35cf4ee3c8 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 u1 x0)).
Axiom missingprop_12c43641953f27e0d07d13646ada34cbbe874fdf6c604d6f7022b856e5fc0bc2 : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u1 x0)).
Axiom missingprop_2a66f5e914e822d9f6f9be00d3f5d54d213d794d8fbbaf33681095fc49e1eadc : (forall x0, x0 :e u6 -> not (In2_lexicographic u2 x0 u2 x0)).
Axiom missingprop_1915c0dc993faeb7b859336416ffe186a7006116a2145adcee4874f59e0d51d7 : (forall x0, x0 :e u6 -> not (In2_lexicographic u3 x0 u2 x0)).
Axiom missingprop_7ce91b6a4df38a83ada9bde6b949239d219d83702596c9d8033c185efc3692b8 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 u2 x0)).
Axiom missingprop_4a7a758742c7e66af2ccc47cd7d429a60bfbc2350bdfab3ca23160a2cf23b3ea : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u2 x0)).
Axiom missingprop_8c0afb5e8c6029664390755a3ba7924a7cd35216a66abef2d1dd50cf115518a6 : (forall x0, x0 :e u6 -> not (In2_lexicographic u3 x0 u3 x0)).
Axiom missingprop_4e1eedbd1c62a3475d65b5bd06b3af64f9b485605630aeab50afbee7f54f3d55 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 u3 x0)).
Axiom missingprop_d7d8ec59eecb06daee640d22d8b7e7d9116241b7a975bf6d1f70e8e7f75bb8ef : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u3 x0)).
Axiom missingprop_816523af5b2f9c4a4dfbc601a160296b917c39869a3f5b34c23c007b5e7728f5 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 u4 x0)).
Axiom missingprop_7394a12a1d063faeceb656d0872dad1b273f4172b47c35b9985809b936edb369 : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u4 x0)).
Axiom missingprop_8901814c7f627f3098e85b81c2e8d38a1404335c801ee0854d6a9883502b02b1 : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u5 x0)).
Axiom missingprop_3977bf1090f933d3709f6b2041283bba6d87781a8eeab5f92047019ad110a939 : (forall x0, x0 :e u6 -> TwoRamseyGraph_4_6_35_a u4 u4 u5 x0).
Axiom missingprop_7cb93b98f252f18e4c77c51e548e5d9375b06b17a1739279bbecb77acb7c3a44 : (forall x0, x0 :e u6 -> TwoRamseyGraph_4_6_35_a u4 u5 u5 x0).
Axiom missingprop_d3b792af1adffec16ce4fc340f1433694e312f9a299dc66e7bdd660386d0095e : nth_6_tuple u4 = (fun x1 x2 x3 x4 x5 x6 : set => x5).
Axiom missingprop_d1ab6c05d827ab2f0497648eeb2e74b0b0260f4e004a74cbc06a5c0a175e4a2a : nth_6_tuple u5 = (fun x1 x2 x3 x4 x5 x6 : set => x6).
Axiom missingprop_487e017004ecabac0b8e518f0fcaf45b502b6f60f5af04ddefe015bde12eaf50 : nth_6_tuple u1 = (fun x1 x2 x3 x4 x5 x6 : set => x2).
Axiom missingprop_5e063b347ef5ac56a92183cc00c589df53087ab1e0b6353a236a973dc2f46966 : nth_6_tuple 0 = (fun x1 x2 x3 x4 x5 x6 : set => x1).
Axiom missingprop_9205282ef77caa3eed787eb4fa460a34079ef649c9bf4aa55e938da8cedd6fa2 : nth_6_tuple u2 = (fun x1 x2 x3 x4 x5 x6 : set => x3).
Axiom missingprop_d77aca9102a0a7995bbfb825c57cbe3520e1f56683b5c476fb6c9389a8c86331 : nth_6_tuple u3 = (fun x1 x2 x3 x4 x5 x6 : set => x4).
Axiom missingprop_a2428df836701d8ecdd6fe644ecbcfce95c8213d12c939ef00803ee4ee613ef7 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> TwoRamseyGraph_4_6_35_a x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_a x0 (u6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 x0 x1) x2 (u6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 x2 x3))))).
Axiom missingprop_2ef1eb8cd624df8207a9f9a4386046f2fcdb45ce1d0aed9ec0def40feaacb489 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> TwoRamseyGraph_4_6_35_a x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_a x0 (u6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 x0 x1) x2 (u6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 x2 x3))))).
Axiom missingprop_fb403b614f36452f4aa78e0e7e3df5b752aa089d5fe465fa6bae6e92525af33c : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> TwoRamseyGraph_4_6_35_a x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_a x0 (u6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 x0 x1) x2 (u6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 x2 x3))))).
Axiom missingprop_765c2c3235927fbd6dc38bef7a13dbee353ca0340c4ca4014e2e4aadff147c1e : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> TwoRamseyGraph_4_6_35_a x0 x1 u5 u5)).
Axiom missingprop_e965020877de1572e3db7225f6e8e02cfdbb951b9add60ee17a78d890a36e854 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> TwoRamseyGraph_4_6_35_a x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_a x2 x3 x0 x1)))).
Axiom missingprop_c92c0588de1ba6f1a5352aaa897a2358c5ed2f086efe24dfed8c7d8036084229 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> TwoRamseyGraph_4_6_35_a x0 x1 x0 x1)).
(* Parameter TransSet "e7493d5f5a73b6cb40310f6fcb87d02b2965921a25ab96d312adf7eb8157e4b3" "538bb76a522dc0736106c2b620bfc2d628d5ec8a27fe62fc505e3a0cdb60a5a2" *)
Parameter TransSet : set -> prop.
Axiom missingprop_be56f85c82005b15f33a57ec2d9c95197bca2e634147f42190efb42df1758d2f : (forall x0 x1 x2 x3 x4 x5, TransSet x4 -> TransSet x5 -> In2_lexicographic x0 x1 x2 x3 -> In2_lexicographic x2 x3 x4 x5 -> In2_lexicographic x0 x1 x4 x5).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_In_TransSet : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> TransSet x1)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_6 : nat_p 6.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom missingprop_f02c24ceee26ad4db1bb78c56724742e936644418211148ed46702e4190f50b8 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> not (TwoRamseyGraph_4_6_35_a x0 x1 x2 x3) -> or (In2_lexicographic x0 x1 x2 x3) (In2_lexicographic x2 x3 x0 x1))))).
Axiom missingprop_136cc02be2eeb4eb60a56da6730dd8546fdf883c69bcebc5fc98beb801cd39e6 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x0 -> Church6_to_u6 x0 :e u4).
Axiom missingprop_90460311f4fb47844a8dd0d64a1306416f6a25ac4d465fc1811061f42791aace : (forall x0, x0 :e u6 -> Church6_p (nth_6_tuple x0)).
Axiom missingprop_38a69925e68ff1a8dcf3a7f4e5069fa460ecf01c3c27215046eede1e2c2501a3 : (forall x0, x0 :e u4 -> Church6_lt4p (nth_6_tuple x0)).
Axiom missingprop_1b4f2955a5c5bc9e0e05efcc9b39724ab6f1c75c28f2f476e2bc7bdba41d9061 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> Church6_to_u6 x0 :e u6).
Axiom missingprop_dd1377463974de0ca0cce86fcf35d6ab1718525eba6284325132ea232c3427ab : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> (forall x1 : set -> set -> set -> set -> set -> set -> set, Church6_p x1 -> Church6_p (Church6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 x0 x1))).
Axiom missingprop_87b44ea852a703abaf8b1ee45427f8c0cbd069f7b68987ed3e5257508f1d4189 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> (forall x1 : set -> set -> set -> set -> set -> set -> set, Church6_p x1 -> Church6_p (Church6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 x0 x1))).
Axiom missingprop_b152b025e55c2019c513a8a0d54cff455d821e1fcbc18c1cd334196ac6497cb7 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> (forall x1 : set -> set -> set -> set -> set -> set -> set, Church6_p x1 -> Church6_p (Church6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 x0 x1))).
Axiom missingprop_a2011f611a57305521c23cba0e8b3eb31c10d287087c08d0a65be0cd92057966 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 0 x1 u4)).
Axiom missingprop_35157388e21f6d95fffdc635f1b5ff8aeab6b40c68411d75bc363e46c218f31a : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 0 x1 u5)).
Axiom missingprop_d8d25fb290fd85a0c04ec9bf2c99fc3c3439387a08c72f2e1eaa425d4fad4074 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u1 x1 u4)).
Axiom missingprop_c44613e72e561b6e128dfab5d7eda3f1929d4a01866c7afa08498651f665491d : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u1 x1 u5)).
Axiom missingprop_bb5fa9a6308330fde4f18d7073e3aba68ece39e526db9e9f37eb46e022739185 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u2 x1 u4)).
Axiom missingprop_4cfd934fd4ceb5943814142befee014aba5f9744de3e00a244bb9cf126c25530 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u2 x1 u5)).
Axiom missingprop_06476e70b2818d4e739bb63f32ccf588070be94ca29360bb3fd49ac71c8c545e : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u3 x1 u4)).
Axiom missingprop_608086f8e1a671a45a4c1499d74f03c9e66173507742922e2a81af8f32148071 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u3 x1 u5)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom cases_4 : (forall x0, x0 :e 4 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 x0)).
Axiom cases_6 : (forall x0, x0 :e u6 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 x0)).
Axiom missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
Theorem missingprop_ee792cf8a02dae909509dc3a8926aa8fb8bac038a14c7f15b2e0f33849c993b0 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (forall x6, x6 :e u6 -> (forall x7, x7 :e u6 -> (forall x8, x8 :e u6 -> (forall x9, x9 :e u6 -> (forall x10, x10 :e u6 -> (forall x11, x11 :e u6 -> not (TwoRamseyGraph_4_6_35_a x0 x1 x2 x3) -> not (TwoRamseyGraph_4_6_35_a x0 x1 x4 x5) -> not (TwoRamseyGraph_4_6_35_a x0 x1 x6 x7) -> not (TwoRamseyGraph_4_6_35_a x0 x1 x8 x9) -> not (TwoRamseyGraph_4_6_35_a x0 x1 x10 x11) -> not (TwoRamseyGraph_4_6_35_a x2 x3 x4 x5) -> not (TwoRamseyGraph_4_6_35_a x2 x3 x6 x7) -> not (TwoRamseyGraph_4_6_35_a x2 x3 x8 x9) -> not (TwoRamseyGraph_4_6_35_a x2 x3 x10 x11) -> not (TwoRamseyGraph_4_6_35_a x4 x5 x6 x7) -> not (TwoRamseyGraph_4_6_35_a x4 x5 x8 x9) -> not (TwoRamseyGraph_4_6_35_a x4 x5 x10 x11) -> not (TwoRamseyGraph_4_6_35_a x6 x7 x8 x9) -> not (TwoRamseyGraph_4_6_35_a x6 x7 x10 x11) -> not (TwoRamseyGraph_4_6_35_a x8 x9 x10 x11) -> False)))))))))))).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom missingprop_08700fb4b48733315235e0f22ee71adb8a6b77bce98190c5c68f3db71be4e889 : (forall x0 x1 : set -> set -> set -> set -> prop, (forall x2 x3 x4 x5, x0 x2 x3 x4 x5 -> x0 x4 x5 x2 x3) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> not (x0 x2 x3 x2 x3))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> x1 x2 x3 x2 x3)) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (x2 = u5 -> x3 = u5 -> False) -> (x4 = u5 -> x5 = u5 -> False) -> x0 x2 x3 x4 x5 -> x1 x2 x3 x4 x5)))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (x2 = u5 -> x3 = u5 -> False) -> (x4 = u5 -> x5 = u5 -> False) -> (x2 = x4 -> x3 = x5 -> False) -> x1 x2 x3 x4 x5 -> x0 x2 x3 x4 x5)))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (forall x6, x6 :e u6 -> (forall x7, x7 :e u6 -> (forall x8, x8 :e u6 -> (forall x9, x9 :e u6 -> x0 x2 x3 x4 x5 -> x0 x2 x3 x6 x7 -> x0 x2 x3 x8 x9 -> x0 x4 x5 x6 x7 -> x0 x4 x5 x8 x9 -> x0 x6 x7 x8 x9 -> False)))))))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (forall x6, x6 :e u6 -> (forall x7, x7 :e u6 -> (forall x8, x8 :e u6 -> (forall x9, x9 :e u6 -> (forall x10, x10 :e u6 -> (forall x11, x11 :e u6 -> (forall x12, x12 :e u6 -> (forall x13, x13 :e u6 -> not (x1 x2 x3 x4 x5) -> not (x1 x2 x3 x6 x7) -> not (x1 x2 x3 x8 x9) -> not (x1 x2 x3 x10 x11) -> not (x1 x2 x3 x12 x13) -> not (x1 x4 x5 x6 x7) -> not (x1 x4 x5 x8 x9) -> not (x1 x4 x5 x10 x11) -> not (x1 x4 x5 x12 x13) -> not (x1 x6 x7 x8 x9) -> not (x1 x6 x7 x10 x11) -> not (x1 x6 x7 x12 x13) -> not (x1 x8 x9 x10 x11) -> not (x1 x8 x9 x12 x13) -> not (x1 x10 x11 x12 x13) -> False)))))))))))) -> not (TwoRamseyProp 4 6 35)).
Axiom missingprop_aeea293981c3c9af6808280e398d9e4b6ef422e5dcd2713bbb45b479ee30e903 : (forall x0 x1 x2 x3, TwoRamseyGraph_4_6_35_b x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_b x2 x3 x0 x1).
Axiom missingprop_13485274604ea6dfedc070e09983ab0f1ccb5c62d659cf049b1a630e0da8e25a : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (TwoRamseyGraph_4_6_35_b x0 x1 x0 x1))).
Axiom missingprop_dd555d0d79f097ab12a5874ff70f768fa00c860d0a4c1ec86afe8fd5fdd1d3bf : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (x0 = u5 -> x1 = u5 -> False) -> (x2 = u5 -> x3 = u5 -> False) -> TwoRamseyGraph_4_6_35_b x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_a x0 x1 x2 x3)))).
Axiom missingprop_5a75105f4563e5998e973f7ffe9d8ef95a777a3944a771a052833b846ada72cd : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (x0 = u5 -> x1 = u5 -> False) -> (x2 = u5 -> x3 = u5 -> False) -> (x0 = x2 -> x1 = x3 -> False) -> TwoRamseyGraph_4_6_35_a x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_b x0 x1 x2 x3)))).
Theorem not_TwoRamseyProp_4_6_35 : not (TwoRamseyProp 4 6 35).
admit.
Qed.
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Definition u7 : set :=
 ordsucc u6.
Definition u8 : set :=
 ordsucc u7.
Definition u9 : set :=
 ordsucc u8.
Definition u10 : set :=
 ordsucc u9.
Definition u11 : set :=
 ordsucc u10.
Definition u12 : set :=
 ordsucc u11.
Definition u13 : set :=
 ordsucc u12.
Definition u14 : set :=
 ordsucc u13.
Definition u15 : set :=
 ordsucc u14.
Definition u16 : set :=
 ordsucc u15.
Definition u17 : set :=
 ordsucc u16.
Definition u18 : set :=
 ordsucc u17.
Definition u19 : set :=
 ordsucc u18.
Definition u20 : set :=
 ordsucc u19.
Definition u21 : set :=
 ordsucc u20.
Definition u22 : set :=
 ordsucc u21.
Definition u23 : set :=
 ordsucc u22.
Definition u24 : set :=
 ordsucc u23.
Definition u25 : set :=
 ordsucc u24.
Definition u26 : set :=
 ordsucc u25.
Definition u27 : set :=
 ordsucc u26.
Definition u28 : set :=
 ordsucc u27.
Definition u29 : set :=
 ordsucc u28.
Definition u30 : set :=
 ordsucc u29.
Definition u31 : set :=
 ordsucc u30.
Definition u32 : set :=
 ordsucc u31.
(* Parameter exp_nat "4ce015b98f266293ef85ef9898e1d8f66f4d9664bd9601197410d96354105016" "37c5310c8da5c9f9db9152285b742d487f1a5b1bd7c73a4207d40bcd4f4d13fb" *)
Parameter exp_nat : set -> set -> set.
Axiom missingprop_8e67f22739f9a01fd2d9438edd2f3f6d8d323d1fa4d050bc09f5b1af8d3b6dd7 : exp_nat 2 5 = 32.
Axiom missingprop_f5822e9d5891900b4c653eab5e89c5bb71543e61fe2c332750489ecd340604eb : (forall x0, nat_p x0 -> equip (Power x0) (exp_nat 2 x0)).
Axiom nat_5 : nat_p 5.
Theorem missingprop_4695716882ca379d67a33427761f34c2b061c7b63026aa6ff413df59110ba1a9 : equip (Power u5) u32.
admit.
Qed.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition u33 : set :=
 ordsucc u32.
Definition u34 : set :=
 ordsucc u33.
Definition u35 : set :=
 ordsucc u34.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
Axiom missingprop_a3e012c06fe7317676acef57a26f1aa9ca775c2316f0b3234deabb524335c66f : nat_p u35.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_43de35cd467c6862356fb78ea399101dda669611f505b0e232165d0fae004776 : atleastp (Power u5) u35.
admit.
Qed.
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Theorem not_TwoRamseyProp_4_6_Power_5 : not (TwoRamseyProp 4 6 (Power 5)).
admit.
Qed.
(* Parameter TwoRamseyProp_atleastp "947fb9a2bd96c9c3a0cefb7f346e15d36deca0943732fc3ea9bc3a588c7ad8f8" "6d86bb255886d154fd0886829fc7d7f8411add3db54738041d14766df3b5c4fa" *)
Parameter TwoRamseyProp_atleastp : set -> set -> set -> prop.
Axiom missingprop_8aec7aa3dfe2dc8cbf1366cb9f5d8ab2c4ceeb7b1cd3cc933b26d92d53269901 : (forall x0 x1 x2, TwoRamseyProp_atleastp x0 x1 x2 -> TwoRamseyProp x0 x1 x2).
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Axiom nat_7 : nat_p 7.
Axiom In_6_7 : 6 :e 7.
Theorem not_TwoRamseyProp_4_7_Power_5 : not (TwoRamseyProp 4 7 (Power 5)).
admit.
Qed.
Axiom nat_8 : nat_p 8.
Axiom In_7_8 : 7 :e 8.
Theorem not_TwoRamseyProp_4_8_Power_5 : not (TwoRamseyProp 4 8 (Power 5)).
admit.
Qed.
Axiom nat_9 : nat_p 9.
Axiom In_8_9 : 8 :e 9.
Theorem not_TwoRamseyProp_4_9_Power_5 : not (TwoRamseyProp 4 9 (Power 5)).
admit.
Qed.
Theorem not_TwoRamseyProp_5_6_Power_5 : not (TwoRamseyProp 5 6 (Power 5)).
admit.
Qed.
Theorem not_TwoRamseyProp_5_7_Power_5 : not (TwoRamseyProp 5 7 (Power 5)).
admit.
Qed.
Theorem not_TwoRamseyProp_5_8_Power_5 : not (TwoRamseyProp 5 8 (Power 5)).
admit.
Qed.
Theorem not_TwoRamseyProp_6_6_Power_5 : not (TwoRamseyProp 6 6 (Power 5)).
admit.
Qed.
Theorem not_TwoRamseyProp_6_7_Power_5 : not (TwoRamseyProp 6 7 (Power 5)).
admit.
Qed.
