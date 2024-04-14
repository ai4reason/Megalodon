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
(* Parameter Subq "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" "81c0efe6636cef7bc8041820a3ebc8dc5fa3bc816854d8b7f507e30425fc1cef" *)
Parameter Subq : set -> set -> prop.
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
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Theorem missingprop_affc49913747fa11b095e9305cedbaaa950055db35b087439dc7fd718eda5a78 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u17 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u17 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> not (TwoRamseyProp_atleastp 3 6 17)).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Theorem missingprop_d26e0281874e3c848e67997f80ac522fccb7753bf982eb4fc97a3c179cc3f8fa : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u17 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u17 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> not (TwoRamseyProp 3 6 17)).
admit.
Qed.
