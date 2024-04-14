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
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
Axiom missingprop_9981628fee84bcf70587ffb7933bd9c35042a1a594a2ae21c28e38ea11e09d6a : (forall x0 x1 x2 x3 x4 x5 x6 x7 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7).
Axiom missingprop_11278145386dd85f714f31121ec2805e154e2e3ecae4d7cd701d70d0cf5007ab : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8).
Axiom missingprop_d818050ba2f8af7e5df3c2818d15e1b858ad10296faac92a7847146e94c87036 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> x9 -> and (and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8) x9).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_9666b7a6ad997d23722d8ab250493836cce8ffccbd753c3d98d8343ea617fa95 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> x9 -> x10 -> and (and (and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8) x9) x10).
admit.
Qed.
Theorem missingprop_611cadc5eabd1062a5152fb82c58a19586e7353abf6e9d9c223f0d279d6b1b6c : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> x9 -> x10 -> x11 -> and (and (and (and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8) x9) x10) x11).
admit.
Qed.
Theorem missingprop_116c9b05c7abf7e42d77b2a3a25673b03005d41a1f3d950e46fb105b6202b8af : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> x9 -> x10 -> x11 -> x12 -> and (and (and (and (and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8) x9) x10) x11) x12).
admit.
Qed.
Theorem missingprop_73ee620de797634872513e63d762947ffdef36d3f2c5f3e34c18835fccdf0530 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> x9 -> x10 -> x11 -> x12 -> x13 -> and (and (and (and (and (and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8) x9) x10) x11) x12) x13).
admit.
Qed.
Theorem missingprop_be08e1b8536f06c6a4e1ea18c54fd24d72e979199644722f5e92e90985d340a0 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> x9 -> x10 -> x11 -> x12 -> x13 -> x14 -> and (and (and (and (and (and (and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8) x9) x10) x11) x12) x13) x14).
admit.
Qed.
Theorem missingprop_838edaefc50d93a4d6ad9e6d650c013ff6f20ebb80ad367d78180de9b24a698d : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> x8 -> x9 -> x10 -> x11 -> x12 -> x13 -> x14 -> x15 -> and (and (and (and (and (and (and (and (and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7) x8) x9) x10) x11) x12) x13) x14) x15).
admit.
Qed.
