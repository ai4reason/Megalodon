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
(* Parameter In_rec_ii "4d137cad40b107eb0fc2c707372525f1279575e6cadb4ebc129108161af3cedb" "f3c9abbc5074c0d68e744893a170de526469426a5e95400ae7fc81f74f412f7e" *)
Parameter In_rec_ii : (set -> (set -> set -> set) -> set -> set) -> set -> set -> set.
(* Parameter If_ii "e76df3235104afd8b513a92c00d3cc56d71dd961510bf955a508d9c2713c3f29" "17057f3db7be61b4e6bd237e7b37125096af29c45cb784bb9cc29b1d52333779" *)
Parameter If_ii : prop -> (set -> set) -> (set -> set) -> set -> set.
Definition nat_primrec_ii : (set -> set) -> (set -> (set -> set) -> set -> set) -> set -> set -> set :=
 (fun x0 : set -> set => fun x1 : set -> (set -> set) -> set -> set => In_rec_ii (fun x2 : set => fun x3 : set -> set -> set => If_ii (Union x2 :e x2) (x1 (Union x2) (x3 (Union x2))) x0)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom If_ii_0 : (forall x0 : prop, forall x1 x2 : set -> set, not x0 -> If_ii x0 x1 x2 = x2).
Theorem missingprop_849b5497e74ef64aa6290f57dba7ba4113de693707967a00a0724b0888d48385 : (forall x0 : set -> set, forall x1 : set -> (set -> set) -> set -> set, forall x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x2 -> x3 x5 = x4 x5) -> If_ii (Union x2 :e x2) (x1 (Union x2) (x3 (Union x2))) x0 = If_ii (Union x2 :e x2) (x1 (Union x2) (x4 (Union x2))) x0).
admit.
Qed.
Axiom In_rec_ii_eq : (forall x0 : set -> (set -> set -> set) -> set -> set, (forall x1, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : (set -> set) -> (set -> set) -> prop, x2 (In_rec_ii x0 x1) (x0 x1 (In_rec_ii x0)) -> x2 (x0 x1 (In_rec_ii x0)) (In_rec_ii x0 x1))).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Theorem missingprop_c590782d74dee620af98beb76ae845318ffddfc36048130ec26bd10bf5786cad : (forall x0 : set -> set, forall x1 : set -> (set -> set) -> set -> set, forall x2 : (set -> set) -> (set -> set) -> prop, x2 (nat_primrec_ii x0 x1 Empty) x0 -> x2 x0 (nat_primrec_ii x0 x1 Empty)).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom Union_ordsucc_eq : (forall x0, nat_p x0 -> Union (ordsucc x0) = x0).
Axiom If_ii_1 : (forall x0 : prop, forall x1 x2 : set -> set, x0 -> If_ii x0 x1 x2 = x1).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_0cf9d41e7d60a71e427c4cc0ec2fef6270f645a1c8d9f615ee0ec90cdcdc2a5f : (forall x0 : set -> set, forall x1 : set -> (set -> set) -> set -> set, forall x2, nat_p x2 -> nat_primrec_ii x0 x1 (ordsucc x2) = x1 x2 (nat_primrec_ii x0 x1 x2)).
admit.
Qed.
(* Parameter In_rec_iii "222f1b8dcfb0d2e33cc4b232e87cbcdfe5c4a2bdc5326011eb70c6c9aeefa556" "9b3a85b85e8269209d0ca8bf18ef658e56f967161bf5b7da5e193d24d345dd06" *)
Parameter In_rec_iii : (set -> (set -> set -> set -> set) -> set -> set -> set) -> set -> set -> set -> set.
(* Parameter If_iii "53034f33cbed012c3c6db42812d3964f65a258627a765f5bede719198af1d1ca" "3314762dce5a2e94b7e9e468173b047dd4a9fac6ee2c5f553c6ea15e9c8b7542" *)
Parameter If_iii : prop -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
Definition nat_primrec_iii : (set -> set -> set) -> (set -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set => fun x1 : set -> (set -> set -> set) -> set -> set -> set => In_rec_iii (fun x2 : set => fun x3 : set -> set -> set -> set => If_iii (Union x2 :e x2) (x1 (Union x2) (x3 (Union x2))) x0)).
Axiom If_iii_0 : (forall x0 : prop, forall x1 x2 : set -> set -> set, not x0 -> If_iii x0 x1 x2 = x2).
Theorem missingprop_4b8d0eae2814d82b838351f4d1fb7ff5105c7a29e53de90feb94a0224c8650a0 : (forall x0 : set -> set -> set, forall x1 : set -> (set -> set -> set) -> set -> set -> set, forall x2, forall x3 x4 : set -> set -> set -> set, (forall x5, x5 :e x2 -> x3 x5 = x4 x5) -> If_iii (Union x2 :e x2) (x1 (Union x2) (x3 (Union x2))) x0 = If_iii (Union x2 :e x2) (x1 (Union x2) (x4 (Union x2))) x0).
admit.
Qed.
Axiom In_rec_iii_eq : (forall x0 : set -> (set -> set -> set -> set) -> set -> set -> set, (forall x1, forall x2 x3 : set -> set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : (set -> set -> set) -> (set -> set -> set) -> prop, x2 (In_rec_iii x0 x1) (x0 x1 (In_rec_iii x0)) -> x2 (x0 x1 (In_rec_iii x0)) (In_rec_iii x0 x1))).
Theorem missingprop_ded7318fe13a7765a9fe494f98a83e2ddbc6dd175169198d79ca7734476d72a7 : (forall x0 : set -> set -> set, forall x1 : set -> (set -> set -> set) -> set -> set -> set, forall x2 : (set -> set -> set) -> (set -> set -> set) -> prop, x2 (nat_primrec_iii x0 x1 0) x0 -> x2 x0 (nat_primrec_iii x0 x1 0)).
admit.
Qed.
Axiom If_iii_1 : (forall x0 : prop, forall x1 x2 : set -> set -> set, x0 -> If_iii x0 x1 x2 = x1).
Theorem missingprop_ee6ce5840847ce6b33fd2ab8635c6f4d1cc75cd1ba9d2f744ef438b81a42e563 : (forall x0 : set -> set -> set, forall x1 : set -> (set -> set -> set) -> set -> set -> set, forall x2, nat_p x2 -> nat_primrec_iii x0 x1 (ordsucc x2) = x1 x2 (nat_primrec_iii x0 x1 x2)).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Theorem missingprop_8ef1b6857698605b5dfae764814858ff77644019752c21e7db5c52f1784236e4 : (forall x0, nat_p x0 -> (forall x1 : set -> prop, x1 0 -> (forall x2, nat_p x2 -> x1 (ordsucc x2)) -> x1 x0)).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Theorem missingprop_3e0b8a92ccb367c3a4739497941a42284f473810a33defa291de0bdb90bdba19 : (forall x0 : set -> prop, x0 0 -> (forall x1, x1 :e omega -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, x1 :e omega -> x0 x1)).
admit.
Qed.
Theorem missingprop_88b2ea790bcab2ae0ee80f7c15366cb971f56af74a5ab2ee5a48de291b7dc4b5 : (forall x0, x0 :e omega -> (forall x1 : set -> prop, x1 0 -> (forall x2, x2 :e omega -> x1 (ordsucc x2)) -> x1 x0)).
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom lamE2 : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, and (x6 :e x1 x4) (x2 = lam 2 (fun x8 : set => If_i (x8 = 0) x4 x6)) -> x5) -> x5) -> x3) -> x3)).
Theorem missingprop_7e890e3c212f35a253b09f8bdf3ce512e10f8816e882a3da817fe1bc10582407 : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> (forall x5, x5 :e x1 x4 -> x2 = lam 2 (fun x7 : set => If_i (x7 = 0) x4 x5) -> x3)) -> x3)).
admit.
Qed.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom ap_const_0 : (forall x0, forall x1 : set -> set -> prop, x1 (ap 0 x0) 0 -> x1 0 (ap 0 x0)).
Theorem missingprop_1e7cdc01ec0a7609207029c216898ea425261bd293d6eb1eadc40b2acc025f50 : (forall x0 x1 x2, ap x0 x1 = x2 -> (x2 = 0 -> (forall x3 : prop, x3)) -> x0 = 0 -> (forall x3 : prop, x3)).
admit.
Qed.
Axiom nat_0 : nat_p 0.
Theorem missingprop_87d981ec36961a0324ea5d0962fa0689e652a1a367082910c100751340d2d034 : 0 :e omega.
admit.
Qed.
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Theorem missingprop_5a07df7ee1e82c544809d0445743f3daa0dcce88f316504384ce6ecc51761fc3 : 1 :e omega.
admit.
Qed.
Theorem missingprop_578aa1186491a7fc9686b5cc5438351c530472de847cc25b4b933c8154b04ef9 : 2 :e omega.
admit.
Qed.
Theorem missingprop_d1fb7ede3a04ac9e8e9995405db0b8222b04c11dbf3c24e42cd9f927bfd75781 : 3 :e omega.
admit.
Qed.
Theorem missingprop_628f03a2b376384ad573829350620ed103792c7432414f4786ece38d730394ef : 4 :e omega.
admit.
Qed.
Theorem missingprop_c555e660bf0acb2b3a9fd483ceeafc0a017e8ceb693c163ce781d6ee67e3698c : 5 :e omega.
admit.
Qed.
Theorem missingprop_750f1814ce96bfc8a211e450b2f0c403da753e2dc6425b26a21b95bf1d82d1ca : 6 :e omega.
admit.
Qed.
Theorem missingprop_fcfece75345cc7b4855a33e68f5d6acb430029f785c093a344ef121d05217ef1 : 7 :e omega.
admit.
Qed.
Theorem missingprop_209e59bd166bba46fbab80026be7adbc9f081c41bb8274077b842371ebb45c9a : 8 :e omega.
admit.
Qed.
Theorem missingprop_8942ff458d5c62ebf5d3b4222ce53c03555e6c68d25449532f21dd36e45967e2 : 9 :e omega.
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c : set -> set -> set :=
 (fun x0 x1 : set => lam omega (nat_primrec x0 (fun x2 x3 : set => ap x1 x2))).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem missingprop_e458de7afe1cd8b75eeba0d2a5ae22333884794cf73066ed95dd49a788d3b7d3 : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1) 0) x0 -> x2 x0 (ap (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1) 0)).
admit.
Qed.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Theorem missingprop_4270b0e920f6ab49c5577490ca19e4c5c6282a2ea155f48817cbf066c86da489 : (forall x0 x1 x2, x2 :e omega -> ap (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1) (ordsucc x2) = ap x1 x2).
admit.
Qed.
Theorem missingprop_bcb19b26ff3765b812a65721a2e19c56c4e1afcc6e3c6e5330fe107298a3e199 : (forall x0 x1 x2 x3, x3 :e omega -> ap x1 x3 = x2 -> ap (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1) (ordsucc x3) = x2).
admit.
Qed.
Definition missingname_7826f463162728610df910cf6f3f3c72e254a2392633cb5c8a0463c4ea1b3533 : set -> prop :=
 (fun x0 : set => forall x1 : set -> set -> prop, x1 x0 (lam omega (ap x0)) -> x1 (lam omega (ap x0)) x0).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Theorem missingprop_e16bc2988d24912b802d992f5a8cb11ec99a63284d8c426dcd0d04382e752862 : (forall x0 x1, missingname_7826f463162728610df910cf6f3f3c72e254a2392633cb5c8a0463c4ea1b3533 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1)).
admit.
Qed.
Axiom tuple_2_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e lam x0 x1)).
Theorem missingprop_80b6b34015b946fb84dd6201eac940043011b093e352907090feaca14c9fa11e : (forall x0, missingname_7826f463162728610df910cf6f3f3c72e254a2392633cb5c8a0463c4ea1b3533 x0 -> (forall x1, x1 :e omega -> (forall x2, x2 :e ap x0 x1 -> lam 2 (fun x3 : set => If_i (x3 = 0) x1 x2) :e x0))).
admit.
Qed.
Theorem missingprop_f7f95af90cf38c6ac02d3898eb74c239c35f5e3ce91d1753f7cf74b0093030b8 : (forall x0 x1 x2, x2 :e omega -> (forall x3, x3 :e ap (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1) x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1)).
admit.
Qed.
Theorem missingprop_ee8be076d19b02ae48b67ea378b9347b5bdcfa65206ae927b869d1a19b075cbe : (forall x0, missingname_7826f463162728610df910cf6f3f3c72e254a2392633cb5c8a0463c4ea1b3533 x0 -> (forall x1, x1 :e x0 -> (forall x2 : prop, (forall x3, x3 :e omega -> (forall x4, x4 :e ap x0 x3 -> x1 = lam 2 (fun x6 : set => If_i (x6 = 0) x3 x4) -> x2)) -> x2))).
admit.
Qed.
Theorem missingprop_a3a28db1ee360c88e08a9998e3eec43955f297f7894a630aecacc7c87146ecf9 : (forall x0 x1 x2, x2 :e missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1 -> (forall x3 : prop, (forall x4, x4 :e omega -> (forall x5, x5 :e ap (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1) x4 -> x2 = lam 2 (fun x7 : set => If_i (x7 = 0) x4 x5) -> x3)) -> x3)).
admit.
Qed.
Theorem missingprop_1a9afa21ad8b66f0f2a03795fd44fe4858eeab429b896d278ef19ccd5d0265b6 : (forall x0 x1 x2 x3, missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1 = missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x2 x3 -> x0 = x2).
admit.
Qed.
Theorem missingprop_b98f511f27606cf5d94843e34e70cd483653146aff4d279c55d1737d91a55cc0 : (forall x0 x1 x2 x3, missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1 = missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x2 x3 -> lam omega (ap x1) = lam omega (ap x3)).
admit.
Qed.
Theorem missingprop_ed0e033673a013cf721b559deceed5b878e1e820c3778cd70d586db65fbdfeb1 : (forall x0 x1 x2 x3, missingname_7826f463162728610df910cf6f3f3c72e254a2392633cb5c8a0463c4ea1b3533 x1 -> missingname_7826f463162728610df910cf6f3f3c72e254a2392633cb5c8a0463c4ea1b3533 x3 -> missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1 = missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x2 x3 -> x1 = x3).
admit.
Qed.
Axiom tuple_2_eta : (forall x0 x1, forall x2 : set -> set -> prop, x2 (lam 2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)))) (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) (lam 2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1))))).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom In_0_2 : 0 :e 2.
Axiom In_1_2 : 1 :e 2.
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_934a7322ae433e78435c33c1b071735927fc8eb182e636db916a04a96426974b : (forall x0 x1, forall x2 : set -> set -> prop, x2 (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x1 0)) -> x2 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x1 0)) (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1))).
admit.
Qed.
Axiom tuple_3_eta : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (lam 3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))))) (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) -> x3 (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) (lam 3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2)))))).
Axiom cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
Axiom tuple_3_0_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0) x0 -> x3 x0 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0)).
Axiom tuple_3_1_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1) x1 -> x3 x1 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1)).
Axiom tuple_3_2_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2) x2 -> x3 x2 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2)).
Axiom In_0_3 : 0 :e 3.
Axiom In_1_3 : 1 :e 3.
Axiom In_2_3 : 2 :e 3.
Theorem missingprop_54028e3b58d6efde69114c937ba56efefdeb080c0c441e32c201081b1255ddc6 : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x1 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x2 0))) -> x3 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x1 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x2 0))) (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2)))).
admit.
Qed.
Axiom tuple_4_eta : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (lam 4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))))) (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) -> x4 (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) (lam 4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3))))))).
Axiom cases_4 : (forall x0, x0 :e 4 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 x0)).
Axiom tuple_4_0_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0) x0 -> x4 x0 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0)).
Axiom tuple_4_1_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1) x1 -> x4 x1 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1)).
Axiom tuple_4_2_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2) x2 -> x4 x2 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2)).
Axiom tuple_4_3_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3) x3 -> x4 x3 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3)).
Axiom In_0_4 : 0 :e 4.
Axiom In_1_4 : 1 :e 4.
Axiom In_2_4 : 2 :e 4.
Axiom In_3_4 : 3 :e 4.
Theorem missingprop_88e0ec3c31b7f645318c4dd8b28700de3d6d1a6ca3babce5a3c5b4be28ba99dc : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x1 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x2 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x3 0)))) -> x4 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x1 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x2 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x3 0)))) (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3))))).
admit.
Qed.
Definition stream_rest : set -> set :=
 (fun x0 : set => lam omega (fun x1 : set => ap x0 (ordsucc x1))).
Theorem missingprop_334c580ff097ef1e46b502f10066a894cd6ccb3af24687375cb698d2281c9042 : (forall x0, missingname_7826f463162728610df910cf6f3f3c72e254a2392633cb5c8a0463c4ea1b3533 (stream_rest x0)).
admit.
Qed.
Theorem missingprop_423d1869d7e7013404b2071f0801e366339d0651119f2b0bf9418db33dcc4071 : (forall x0 x1, missingname_7826f463162728610df910cf6f3f3c72e254a2392633cb5c8a0463c4ea1b3533 x1 -> stream_rest (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c x0 x1) = x1).
admit.
Qed.
Definition missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => nat_primrec_ii (fun x3 : set => x2) (fun x3 : set => fun x4 : set -> set => fun x5 : set => missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c (ap x5 0) (x4 (stream_rest x5))) x0 x1).
Theorem missingprop_a3d466899682a91c3d61da1f66bc447e5b5cb80e0df2ad9ddbcbe6ab43230f11 : (forall x0 x1, forall x2 : set -> set -> prop, x2 (missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 0 x0 x1) x1 -> x2 x1 (missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 0 x0 x1)).
admit.
Qed.
Theorem missingprop_4ed388cc48e12ed7c96919585ba22a5a273f03bc5595d10a7615d29a854605fc : (forall x0, x0 :e omega -> (forall x1 x2, forall x3 : set -> set -> prop, x3 (missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 (ordsucc x0) x1 x2) (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c (ap x1 0) (missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 x0 (stream_rest x1) x2)) -> x3 (missingname_002c672b3a8841197b02ffaca6fc5977adb99d45947bb283d29e68e638319d3c (ap x1 0) (missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 x0 (stream_rest x1) x2)) (missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 (ordsucc x0) x1 x2))).
admit.
Qed.
Definition missingname_fcdb59eb143dfada9c98bb6c90693955e04e63487d0c2f0668ad408dd84618ef : set -> set -> set -> set :=
 nat_primrec_iii (fun x0 x1 : set => 0) (fun x0 : set => fun x1 : set -> set -> set => fun x2 x3 : set => missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 (ap x2 0) (ap x3 0) (x1 (stream_rest x2) (stream_rest x3))).
Theorem missingprop_339d9652d76ddb95906d3ede7ccc85c0a0e3d37dc8568a16a3766a7fc85362aa : (forall x0 x1, forall x2 : set -> set -> prop, x2 (missingname_fcdb59eb143dfada9c98bb6c90693955e04e63487d0c2f0668ad408dd84618ef 0 x0 x1) 0 -> x2 0 (missingname_fcdb59eb143dfada9c98bb6c90693955e04e63487d0c2f0668ad408dd84618ef 0 x0 x1)).
admit.
Qed.
Theorem missingprop_b161d3bcfcad512a6f53d6d8504c3cd68fd03b2f1f44c16571bffbf0740a7c9e : (forall x0, x0 :e omega -> (forall x1 x2, forall x3 : set -> set -> prop, x3 (missingname_fcdb59eb143dfada9c98bb6c90693955e04e63487d0c2f0668ad408dd84618ef (ordsucc x0) x1 x2) (missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 (ap x1 0) (ap x2 0) (missingname_fcdb59eb143dfada9c98bb6c90693955e04e63487d0c2f0668ad408dd84618ef x0 (stream_rest x1) (stream_rest x2))) -> x3 (missingname_2060dbcf361a2ac6e3e4a9ef169c82b370e5c575aa25460f8ad77d5bbe76b518 (ap x1 0) (ap x2 0) (missingname_fcdb59eb143dfada9c98bb6c90693955e04e63487d0c2f0668ad408dd84618ef x0 (stream_rest x1) (stream_rest x2))) (missingname_fcdb59eb143dfada9c98bb6c90693955e04e63487d0c2f0668ad408dd84618ef (ordsucc x0) x1 x2))).
admit.
Qed.
