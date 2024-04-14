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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter Subq "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" "81c0efe6636cef7bc8041820a3ebc8dc5fa3bc816854d8b7f507e30425fc1cef" *)
Parameter Subq : set -> set -> prop.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom missingprop_5ec2a42239da54515a499b976316dfe7e7383ee177e7a32ce22f1b4b1bf14b9c : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, (forall x9, x9 :e x8 -> (forall x10 : set -> prop, x10 x0 -> x10 x1 -> x10 x2 -> x10 x3 -> x10 x4 -> x10 x5 -> x10 x6 -> x10 x7 -> x10 x9)) -> (forall x9, x9 c= x8 -> atleastp 3 x9 -> (forall x10 : prop, (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x4 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> x10))).
Axiom missingprop_588e79272611c60a352b7dba244bb249c0313cc91d2c075de4434370a6777385 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, (forall x9, x9 :e x8 -> (forall x10 : set -> prop, x10 x0 -> x10 x1 -> x10 x2 -> x10 x3 -> x10 x4 -> x10 x5 -> x10 x6 -> x10 x7 -> x10 x9)) -> (forall x9, x9 c= x8 -> atleastp 4 x9 -> (forall x10 : prop, (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> x10))).
Theorem missingprop_7117ac08b60a122733928a67f30c882b7b2238137ce67aa64f4040a7f87be08c : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, (forall x9, x9 :e x8 -> (forall x10 : set -> prop, x10 x0 -> x10 x1 -> x10 x2 -> x10 x3 -> x10 x4 -> x10 x5 -> x10 x6 -> x10 x7 -> x10 x9)) -> (x0 = x1 -> (forall x9 : prop, x9)) -> (x0 = x2 -> (forall x9 : prop, x9)) -> (x1 = x2 -> (forall x9 : prop, x9)) -> (x0 = x3 -> (forall x9 : prop, x9)) -> (x1 = x3 -> (forall x9 : prop, x9)) -> (x2 = x3 -> (forall x9 : prop, x9)) -> (x0 = x4 -> (forall x9 : prop, x9)) -> (x1 = x4 -> (forall x9 : prop, x9)) -> (x2 = x4 -> (forall x9 : prop, x9)) -> (x3 = x4 -> (forall x9 : prop, x9)) -> (x0 = x5 -> (forall x9 : prop, x9)) -> (x1 = x5 -> (forall x9 : prop, x9)) -> (x2 = x5 -> (forall x9 : prop, x9)) -> (x3 = x5 -> (forall x9 : prop, x9)) -> (x4 = x5 -> (forall x9 : prop, x9)) -> (x0 = x6 -> (forall x9 : prop, x9)) -> (x1 = x6 -> (forall x9 : prop, x9)) -> (x2 = x6 -> (forall x9 : prop, x9)) -> (x3 = x6 -> (forall x9 : prop, x9)) -> (x4 = x6 -> (forall x9 : prop, x9)) -> (x5 = x6 -> (forall x9 : prop, x9)) -> (x0 = x7 -> (forall x9 : prop, x9)) -> (x1 = x7 -> (forall x9 : prop, x9)) -> (x2 = x7 -> (forall x9 : prop, x9)) -> (x3 = x7 -> (forall x9 : prop, x9)) -> (x4 = x7 -> (forall x9 : prop, x9)) -> (x5 = x7 -> (forall x9 : prop, x9)) -> (x6 = x7 -> (forall x9 : prop, x9)) -> (forall x9 : set -> set -> prop, (forall x10 : prop, x9 x0 x1 -> x10) -> (forall x10 : prop, x9 x0 x2 -> x10) -> (forall x10 : prop, x9 x1 x2 -> x10) -> (forall x10 : prop, x9 x0 x3 -> x10) -> (forall x10 : prop, x9 x1 x3 -> x10) -> x9 x2 x3 -> (forall x10 : prop, x9 x0 x4 -> x10) -> x9 x1 x4 -> (forall x10 : prop, x9 x2 x4 -> x10) -> x9 x3 x4 -> (forall x10 : prop, x9 x0 x5 -> x10) -> x9 x1 x5 -> x9 x2 x5 -> (forall x10 : prop, x9 x3 x5 -> x10) -> (forall x10 : prop, x9 x4 x5 -> x10) -> x9 x0 x6 -> (forall x10 : prop, x9 x1 x6 -> x10) -> (forall x10 : prop, x9 x2 x6 -> x10) -> x9 x3 x6 -> (forall x10 : prop, x9 x4 x6 -> x10) -> x9 x5 x6 -> x9 x0 x7 -> (forall x10 : prop, x9 x1 x7 -> x10) -> x9 x2 x7 -> (forall x10 : prop, x9 x3 x7 -> x10) -> x9 x4 x7 -> (forall x10 : prop, x9 x5 x7 -> x10) -> (forall x10 : prop, x9 x6 x7 -> x10) -> and (forall x10, x10 c= x8 -> atleastp 3 x10 -> (forall x11 : prop, (forall x12, x12 :e x10 -> (forall x13, x13 :e x10 -> (x12 = x13 -> (forall x14 : prop, x14)) -> not (x9 x12 x13) -> x11)) -> x11)) (forall x10, x10 c= x8 -> atleastp 4 x10 -> (forall x11 : prop, (forall x12, x12 :e x10 -> (forall x13, x13 :e x10 -> (x12 = x13 -> (forall x14 : prop, x14)) -> x9 x12 x13 -> x11)) -> x11)))).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_a3891bc0c376c56135af0ba3023ea81094f615683f2cdf7844968055e83fedae : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, (forall x9, x9 :e x8 -> (forall x10 : set -> prop, x10 x0 -> x10 x1 -> x10 x2 -> x10 x3 -> x10 x4 -> x10 x5 -> x10 x6 -> x10 x7 -> x10 x9)) -> (x0 = x1 -> (forall x9 : prop, x9)) -> (x0 = x2 -> (forall x9 : prop, x9)) -> (x1 = x2 -> (forall x9 : prop, x9)) -> (x0 = x3 -> (forall x9 : prop, x9)) -> (x1 = x3 -> (forall x9 : prop, x9)) -> (x2 = x3 -> (forall x9 : prop, x9)) -> (x0 = x4 -> (forall x9 : prop, x9)) -> (x1 = x4 -> (forall x9 : prop, x9)) -> (x2 = x4 -> (forall x9 : prop, x9)) -> (x3 = x4 -> (forall x9 : prop, x9)) -> (x0 = x5 -> (forall x9 : prop, x9)) -> (x1 = x5 -> (forall x9 : prop, x9)) -> (x2 = x5 -> (forall x9 : prop, x9)) -> (x3 = x5 -> (forall x9 : prop, x9)) -> (x4 = x5 -> (forall x9 : prop, x9)) -> (x0 = x6 -> (forall x9 : prop, x9)) -> (x1 = x6 -> (forall x9 : prop, x9)) -> (x2 = x6 -> (forall x9 : prop, x9)) -> (x3 = x6 -> (forall x9 : prop, x9)) -> (x4 = x6 -> (forall x9 : prop, x9)) -> (x5 = x6 -> (forall x9 : prop, x9)) -> (x0 = x7 -> (forall x9 : prop, x9)) -> (x1 = x7 -> (forall x9 : prop, x9)) -> (x2 = x7 -> (forall x9 : prop, x9)) -> (x3 = x7 -> (forall x9 : prop, x9)) -> (x4 = x7 -> (forall x9 : prop, x9)) -> (x5 = x7 -> (forall x9 : prop, x9)) -> (x6 = x7 -> (forall x9 : prop, x9)) -> not (TwoRamseyProp_atleastp 3 4 x8)).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom cases_8 : (forall x0, x0 :e 8 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 7 -> x1 x0)).
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom neq_3_0 : 3 = 0 -> (forall x0 : prop, x0).
Axiom neq_3_1 : 3 = 1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : 3 = 2 -> (forall x0 : prop, x0).
Axiom neq_4_0 : 4 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_1 : 4 = 1 -> (forall x0 : prop, x0).
Axiom neq_4_2 : 4 = 2 -> (forall x0 : prop, x0).
Axiom neq_4_3 : 4 = 3 -> (forall x0 : prop, x0).
Axiom neq_5_0 : 5 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_1 : 5 = 1 -> (forall x0 : prop, x0).
Axiom neq_5_2 : 5 = 2 -> (forall x0 : prop, x0).
Axiom neq_5_3 : 5 = 3 -> (forall x0 : prop, x0).
Axiom neq_5_4 : 5 = 4 -> (forall x0 : prop, x0).
Axiom neq_6_0 : 6 = 0 -> (forall x0 : prop, x0).
Axiom neq_6_1 : 6 = 1 -> (forall x0 : prop, x0).
Axiom neq_6_2 : 6 = 2 -> (forall x0 : prop, x0).
Axiom neq_6_3 : 6 = 3 -> (forall x0 : prop, x0).
Axiom neq_6_4 : 6 = 4 -> (forall x0 : prop, x0).
Axiom neq_6_5 : 6 = 5 -> (forall x0 : prop, x0).
Axiom neq_7_0 : 7 = 0 -> (forall x0 : prop, x0).
Axiom neq_7_1 : 7 = 1 -> (forall x0 : prop, x0).
Axiom neq_7_2 : 7 = 2 -> (forall x0 : prop, x0).
Axiom neq_7_3 : 7 = 3 -> (forall x0 : prop, x0).
Axiom neq_7_4 : 7 = 4 -> (forall x0 : prop, x0).
Axiom neq_7_5 : 7 = 5 -> (forall x0 : prop, x0).
Axiom neq_7_6 : 7 = 6 -> (forall x0 : prop, x0).
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Theorem not_TwoRamseyProp_3_4_8 : not (TwoRamseyProp 3 4 8).
admit.
Qed.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom In_Power_3_cases_impred : (forall x0, x0 :e Power 3 -> (forall x1 : prop, (x0 = 0 -> x1) -> (x0 = 1 -> x1) -> (x0 = Sing 1 -> x1) -> (x0 = 2 -> x1) -> (x0 = Sing 2 -> x1) -> (x0 = UPair 0 2 -> x1) -> (x0 = UPair 1 2 -> x1) -> (x0 = 3 -> x1) -> x1)).
Axiom not_Empty_eq_Sing : (forall x0, 0 = Sing x0 -> (forall x1 : prop, x1)).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom nIn_not_eq_Sing : (forall x0 x1, nIn x0 x1 -> x1 = Sing x0 -> (forall x2 : prop, x2)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom nIn_2_1 : nIn 2 1.
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom In_0_2 : 0 :e 2.
Axiom not_Empty_eq_UPair : (forall x0 x1, 0 = UPair x0 x1 -> (forall x2 : prop, x2)).
Axiom nIn_not_eq_UPair_2 : (forall x0 x1 x2, nIn x1 x2 -> x2 = UPair x0 x1 -> (forall x3 : prop, x3)).
Axiom nIn_not_eq_UPair_1 : (forall x0 x1 x2, nIn x0 x2 -> x2 = UPair x0 x1 -> (forall x3 : prop, x3)).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Axiom In_0_3 : 0 :e 3.
Axiom In_1_3 : 1 :e 3.
Theorem not_TwoRamseyProp_atleast_3_4_Power_3 : not (TwoRamseyProp_atleastp 3 4 (Power 3)).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
Axiom nat_5 : nat_p 5.
Axiom In_4_5 : 4 :e 5.
Theorem missingprop_2e14db57142b7206241737abc1142fd976987dd219afdf8acc5fb25eded2b7fd : not (TwoRamseyProp 3 5 (Power 3)).
admit.
Qed.
Axiom nat_6 : nat_p 6.
Axiom In_4_6 : 4 :e 6.
Theorem missingprop_edbe38cedc43eb3cb96e39ed8dd751657658b596c20f9b75f1c9529c9207431f : not (TwoRamseyProp 3 6 (Power 3)).
admit.
Qed.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem nat_7 : nat_p 7.
admit.
Qed.
Theorem nat_8 : nat_p 8.
admit.
Qed.
Theorem nat_9 : nat_p 9.
admit.
Qed.
Theorem nat_10 : nat_p 10.
admit.
Qed.
Axiom In_4_7 : 4 :e 7.
Theorem missingprop_453f42be0c19ff4d70edb40a8e665cf0b03dfc91fdff73d1c78ae71b40ae9eff : not (TwoRamseyProp 3 7 (Power 3)).
admit.
Qed.
Axiom In_4_8 : 4 :e 8.
Theorem missingprop_8e31e6a1fbb593962d735ab60376425825b19ead402bb1eacc393ec21fc101ab : not (TwoRamseyProp 3 8 (Power 3)).
admit.
Qed.
Axiom In_4_9 : 4 :e 9.
Theorem missingprop_9579d1496ed0ac82b90912d2d9574c481a2193eda74fb79f1d1a8c2661687353 : not (TwoRamseyProp 3 9 (Power 3)).
admit.
Qed.
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom In_3_9 : 3 :e 9.
Theorem missingprop_ba23a99d385c96fc20e18f31e2884f35e8c8dc96acf9973b3be03f8c1bfc0b50 : 4 :e 10.
admit.
Qed.
Theorem missingprop_edae1d5838e5939f3231af3f23f117c2b2970880efbb46f4a6ea78233d0e0845 : not (TwoRamseyProp 3 10 (Power 3)).
admit.
Qed.
Axiom nat_4 : nat_p 4.
Axiom In_3_4 : 3 :e 4.
Theorem missingprop_d1fac1c4cf86f9bf1a1191410f2bc809686eaa0724d726056c2dd7a14d8bd0b7 : not (TwoRamseyProp 4 4 (Power 3)).
admit.
Qed.
Theorem missingprop_efe4e3c3f7c7f4c596224c2211d491802673788db39a203b44f88e754a272488 : not (TwoRamseyProp 4 5 (Power 3)).
admit.
Qed.
Theorem missingprop_b0e56cd4962c4f6672248645c87bf04e9516c5da7a450e51866e320cc6e0c819 : not (TwoRamseyProp 4 6 (Power 3)).
admit.
Qed.
Theorem missingprop_9b0d43559546095bc43d1be6d4af13a9f65700c40aabc2c0b564f576cc00fb77 : not (TwoRamseyProp 4 7 (Power 3)).
admit.
Qed.
Theorem missingprop_4a26d1ffa7de4a2c107635462cdaddc6e0bcb07b8f11f14ad6e29cdcf9bc038a : not (TwoRamseyProp 4 8 (Power 3)).
admit.
Qed.
Theorem missingprop_998aceb1b8d94f5cab0df3d9d8c137c685b236dfb9ccedae151bdb46b5cdf045 : not (TwoRamseyProp 4 9 (Power 3)).
admit.
Qed.
Axiom In_3_5 : 3 :e 5.
Theorem missingprop_b77097b143bbb8267db46b41de2882c885072bbb6e81ca88e6aa367755edb786 : not (TwoRamseyProp 5 5 (Power 3)).
admit.
Qed.
Theorem missingprop_cc9745f7c4d91725f31fc8c96dc2260fef0fe645b43f505847956178b0237820 : not (TwoRamseyProp 5 6 (Power 3)).
admit.
Qed.
Theorem missingprop_1c506fd1f65af050f13a4816325d72df1f505a8e4f8db6adf3f164b823601f6c : not (TwoRamseyProp 5 7 (Power 3)).
admit.
Qed.
Theorem missingprop_87e3ca351ea769734a1f23993a4fe38187001790bdc55f9861497456767e37fc : not (TwoRamseyProp 5 8 (Power 3)).
admit.
Qed.
Axiom In_3_6 : 3 :e 6.
Theorem missingprop_7675d8c467c3bb4bfcb301063bd0269eb4cd34a987d9e02f61bbb360f23b0f2d : not (TwoRamseyProp 6 6 (Power 3)).
admit.
Qed.
Theorem missingprop_f4f107abbda2bb72d1451aaf8a335dcaa0373ebba60b4c321a44023db48fafab : not (TwoRamseyProp 6 7 (Power 3)).
admit.
Qed.
