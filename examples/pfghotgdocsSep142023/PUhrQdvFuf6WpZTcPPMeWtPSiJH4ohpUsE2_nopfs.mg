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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
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
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
(* Parameter Church13_p "aa871d3c16738e850e661e7791d77b5210205ae2e9b96f7d64017e0c1bcfaddc" "0ecea12529c16388abbd7afd132dcfc71eca000587337d9afd56ea93c40ef1ef" *)
Parameter Church13_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
(* Parameter TwoRamseyGraph_3_5_Church13 "1c27141255c5e4ce9a14b5e70f8fabf8ff3c86efed2a9ac48a29895445e76e74" "c56bb54dd1f4c2c13129be6ed51c6ed97d3f990956b0c22589aad20ca952e3f1" *)
Parameter TwoRamseyGraph_3_5_Church13 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set.
Definition TwoRamseyGraph_3_5_13 : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 x3 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x2 -> Church13_p x3 -> x0 = x2 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 -> x1 = x3 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 -> TwoRamseyGraph_3_5_Church13 x2 x3 = (fun x5 x6 : set => x5)).
Axiom missingprop_611d05f3c0e0aff033700ccf72b7ceaf4160dd0bd5dde16fbd4a43684d4061b2 : (forall x0, atleastp u5 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (x2 = x3 -> (forall x7 : prop, x7)) -> (x2 = x4 -> (forall x7 : prop, x7)) -> (x2 = x5 -> (forall x7 : prop, x7)) -> (x2 = x6 -> (forall x7 : prop, x7)) -> (x3 = x4 -> (forall x7 : prop, x7)) -> (x3 = x5 -> (forall x7 : prop, x7)) -> (x3 = x6 -> (forall x7 : prop, x7)) -> (x4 = x5 -> (forall x7 : prop, x7)) -> (x4 = x6 -> (forall x7 : prop, x7)) -> (x5 = x6 -> (forall x7 : prop, x7)) -> x1))))) -> x1)).
Axiom missingprop_f13b7928572ea386063941f294a7de5e613d504b56c8df5d720e8c3911580df6 : (forall x0, x0 :e u13 -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x2 -> x0 = x2 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 -> x1) -> x1)).
Axiom missingprop_eaa6acb07f99926ced42ab67baa62f415d6c26fdee92daadab3b8a1c5b203e47 : (forall x0 x1 x2 x3 x4 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> Church13_p x2 -> Church13_p x3 -> Church13_p x4 -> (x0 = x1 -> (forall x5 : prop, x5)) -> (x0 = x2 -> (forall x5 : prop, x5)) -> (x0 = x3 -> (forall x5 : prop, x5)) -> (x0 = x4 -> (forall x5 : prop, x5)) -> (x1 = x2 -> (forall x5 : prop, x5)) -> (x1 = x3 -> (forall x5 : prop, x5)) -> (x1 = x4 -> (forall x5 : prop, x5)) -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> TwoRamseyGraph_3_5_Church13 x0 x1 = (fun x6 x7 : set => x7) -> TwoRamseyGraph_3_5_Church13 x0 x2 = (fun x6 x7 : set => x7) -> TwoRamseyGraph_3_5_Church13 x0 x3 = (fun x6 x7 : set => x7) -> TwoRamseyGraph_3_5_Church13 x0 x4 = (fun x6 x7 : set => x7) -> TwoRamseyGraph_3_5_Church13 x1 x2 = (fun x6 x7 : set => x7) -> TwoRamseyGraph_3_5_Church13 x1 x3 = (fun x6 x7 : set => x7) -> TwoRamseyGraph_3_5_Church13 x1 x4 = (fun x6 x7 : set => x7) -> TwoRamseyGraph_3_5_Church13 x2 x3 = (fun x6 x7 : set => x7) -> TwoRamseyGraph_3_5_Church13 x2 x4 = (fun x6 x7 : set => x7) -> TwoRamseyGraph_3_5_Church13 x3 x4 = (fun x6 x7 : set => x7) -> False).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom missingprop_354f28a358bf521854ee8b5484a7c25b5b12fa349761b0c407885cb2a055f1f6 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> or (TwoRamseyGraph_3_5_Church13 x0 x1 = (fun x3 x4 : set => x3)) (TwoRamseyGraph_3_5_Church13 x0 x1 = (fun x3 x4 : set => x4))).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom missingprop_da1f5656b96eae56c85417fb97ab8579700fd47cd2c93478437fdf2328deb53d : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church13_p x0 -> Church13_p x1 -> x0 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 = x1 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 -> x0 = x1).
Theorem missingprop_849959d181c1dc78420c17f9296fa40544a13424ff126e0d46a89188d82f2316 : (forall x0, x0 c= u13 -> atleastp u5 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_5_13 x1 x2)))).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Axiom missingprop_6691451906f37677ba45db254ad43a055bbea9a71de659c8291ba833ff1f99a2 : (forall x0 x1, TwoRamseyGraph_3_5_13 x0 x1 -> TwoRamseyGraph_3_5_13 x1 x0).
Axiom missingprop_611e3f668a310864e980350cd8f2559c41b2ec84dbf2aad8dbbd2fc90ee63435 : (forall x0, x0 c= u13 -> atleastp u3 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_5_13 x1 x2))).
Theorem not_TwoRamseyProp_atleast_3_5_13 : not (TwoRamseyProp_atleastp 3 5 13).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Theorem not_TwoRamseyProp_3_5_13 : not (TwoRamseyProp 3 5 13).
admit.
Qed.
