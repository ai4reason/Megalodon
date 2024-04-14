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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom missingprop_6f924010899e62355200d41f1cef23d6373bef28ff540d0bdb872dcb6e86d39f : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> equip x0 (Repl x0 x1)).
Theorem missingprop_86f1d37e675cf487e32bb79feb3c46b1ac4a0f3c9c2b3afb14df2374e659767e : (forall x0, forall x1 : set -> set -> prop, forall x2, nat_p x2 -> equip x0 (ordsucc x2) -> (forall x3, equip x3 x2 -> (forall x4 : set -> set, (forall x5, x5 :e x3 -> (forall x6, x6 :e x0 -> x1 x6 x5 -> x6 = x4 x5)) -> (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 = x4 x6 -> x5 = x6)) -> (forall x5 : prop, (forall x6, and (x6 :e x0) (forall x7, x7 :e x3 -> not (x1 x6 x7)) -> x5) -> x5)))).
admit.
Qed.
Theorem missingprop_5558b4c3bceabf32c7c2f177117449a9d9039df772c3f29721e8d9ea8b6bfda0 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, nat_p x2 -> equip x0 (ordsucc x2) -> (forall x3, equip x3 x2 -> (forall x4 : set -> set, (forall x5, x5 :e x3 -> (forall x6, x6 :e x0 -> x1 x6 x5 -> x6 = x4 x5)) -> (forall x5, x5 :e x3 -> (forall x6, x6 :e x3 -> x4 x5 = x4 x6 -> x5 = x6)) -> (forall x5 : prop, (forall x6, and (x6 :e x0) (forall x7, x7 :e x3 -> not (x1 x6 x7)) -> x5) -> x5))))).
admit.
Qed.
