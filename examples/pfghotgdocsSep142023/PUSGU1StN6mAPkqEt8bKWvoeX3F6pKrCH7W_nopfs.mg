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
Definition Church17_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x9) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x10) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x11) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x12) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x13) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> x1 x0).
(* Parameter u1 "338dd245674671b9ed7925015246c4c4be0e334151ccd1c7d5a3567f5c4461a5" "8170ad5e6535f2661f0d055afe32d84d876773f4e8519ce018687f54b2ba9159" *)
Parameter u1 : set.
(* Parameter u2 "e6513b6b7dacfb379ee35c71b72ff5e0713f783ff08590c7fabcc4c48daf9f2e" "3bd7f72ec38573ff1d3910239a4aa349e3832908ab08202cf114451bffd7d17d" *)
Parameter u2 : set.
(* Parameter u3 "e803b40f939f4fe15fb61b29ded3bee1206757349f3b808c5103467101bdab9a" "1da7b5b024a841d0694168c01df8b0cada113e9c4616f1555b257b978dff46cc" *)
Parameter u3 : set.
(* Parameter u4 "7a516cda4555ee314bd599299eac983d7d569296583a629b47918e19d4a0f71f" "66241e5ccfbbd32429c1f14526f03d9d37590fe4ddf66171a76fae8bb5f8b113" *)
Parameter u4 : set.
(* Parameter u5 "2a783d5aa30540222437cf12bcd2250d09379447bbcfb2424ca047f449bf06b4" "81fa4107fe53377c8e9932359ab17b6be1f49b6646daa701ee0c5525e8489bca" *)
Parameter u5 : set.
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
(* Parameter u7 "af2de1d69c59ef5054cf8b6dce9a93a630001f055010b2d9b5c0f0945e37d127" "3cbeb3771776e1d1a12e3cb64dcc555d3ff2cc4de57d951cb6799fd09f57d004" *)
Parameter u7 : set.
(* Parameter u8 "4d5ccc56a929ac0c8f71c494d50309dfb6da04c7178c3bc993cde3ebf042a891" "ce0f39eb54c9fcc3c8025cbe688bc7bd697a0c77e023c724aa4ea22edcdfaa0f" *)
Parameter u8 : set.
(* Parameter u9 "09c26abdb88570cbb608edfbe57d30576c9a90b0d04071630aa0d3b62d9c634b" "f7b5ffe5245726f4af7381ced353e716ac8d1afab440daf56cd884ec8e25f3ac" *)
Parameter u9 : set.
(* Parameter u10 "992db04f3545ca6059e54ab6da6f2ea553db0f23228f7fec0d787191aaa7a699" "dacefbd6851dd6711e6ed263045ec145efad7c6f5bfe7e5223ba6c7c5533e61e" *)
Parameter u10 : set.
(* Parameter u11 "8d98a4d4dfcb8d45bfdcd349a4735f18958f85477c7c78e7af7b858830ea91e7" "fe7b8011fa04942e98e7459bad1082ace0dfdd32285ea0719af3aef0e9417e40" *)
Parameter u11 : set.
(* Parameter u12 "95f5d0914858066458ab42966efbfe1dd0f032e802a54f602e8e5407ac56ace7" "c03c309131c67756afa0fda4d4c84047a8defc43f47980c44c05639208cbaa8e" *)
Parameter u12 : set.
(* Parameter u13 "5fc070d127ffae798f70b712dd801ce996aeab3cec7aa3b427979e46f34030ae" "5e6da24eb2e380feb39c79acefdce29d92c5faf26abed0e1ca071eaf6e391f2f" *)
Parameter u13 : set.
(* Parameter u14 "889a1e76b981b1a33cf68477e7b8b953867e63c9dca7b1aeb36f1c325e9b2a89" "07f6b9e7ce1ef1900b104985e2aa47323bd902e38b2b479799fb998db97ff197" *)
Parameter u14 : set.
(* Parameter u15 "5c491c9addfc95c6b9d569a2be553029fe085eeae41ee78922d29695364b8620" "98e246907ff1cee98e10366044c2b784e01f55f3a758acab213d3e2ec3fb3388" *)
Parameter u15 : set.
(* Parameter u16 "f44edc3a0f316d5a784e3afbfb9fec2f3ce4a1f6f80d2f7df61dd3cd3466ad24" "5c2a16cdb094537a2fafee11c4bc651c9fb5d6c4e4cb5153e4b4d2abeb392dfd" *)
Parameter u16 : set.
Definition Church17_to_u17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => x0 Empty u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16).
(* Parameter u17 "cd79716d8923d293cac26e380f44bd1d637c5275ecfc89b47177ddf0a6ed1145" "7a7688d6358f93625a885a93e92c065257968a83dad53f42a5517baa820cd98c" *)
Parameter u17 : set.
Axiom missingprop_9851dfe301262128a9dc5def6f083cbb499c4d0eace7612e5dc050c4fe5ba3c7 : Empty :e u17.
Axiom missingprop_4f0f2f2c8505addb4aa66d1187553d1cf0a291464cc87b78a3faaf7ae73ed155 : u1 :e u17.
Axiom missingprop_fcb0372c2816a1d869a174f57c9ee90635b20300695b8cc5b4a5ca8436427e30 : u2 :e u17.
Axiom missingprop_515e04c9d20f4760fa1f9ec9f7d43a79e2cf83cd96ac9929a00f63e10a33bee6 : u3 :e u17.
Axiom missingprop_8bfb0eb80a8f5f9fa400351ad533eb8f6abcbab81f79751d9b99dc5c5b198b37 : u4 :e u17.
Axiom missingprop_add6307eacf71a9b26cddaf6256b63e565e929785d0ee0946ee6b253d6c3852e : u5 :e u17.
Axiom missingprop_e8645556daad09b81c208e8cbf014ff23194c321a76d028c3b35a1714720baab : u6 :e u17.
Axiom missingprop_97cf1bf10df747733c6e7166825443492e8a9bbd5381654e4874ef5f3ceacd0a : u7 :e u17.
Axiom missingprop_6e6799a9f21ccdffe58af218db8306610bd1441f3fa0fcc3f6eaa957ce165f57 : u8 :e u17.
Axiom missingprop_abbef1301044c000653f42960a8047881f2ef656bd9cecef0ae9b764b6c0784f : u9 :e u17.
Axiom missingprop_7af243686256d97349e2c2a55c958e2d435fe9a5e016344b19465fce23ad5676 : u10 :e u17.
Axiom missingprop_fde6379bebd0b99b66d966901300c529916d83c8c1f209841f486bb2568cf012 : u11 :e u17.
Axiom missingprop_b7a4a37161804b376f25028de76b0714142123cbd842ba90c86afe8baa6a8a9e : u12 :e u17.
Axiom missingprop_ee249701bfbf4a0ddc5825c1bc6fff36b37e7d1af2b7d307fdfcf229c66eb3d7 : u13 :e u17.
Axiom missingprop_19ecd6ac8599e49ad47f95e5b1703b05d2332ac49ec04a48785748b0d8a5094a : u14 :e u17.
Axiom missingprop_35f4d337254964d13bfee3413f1b56f908aee5828cc15d13f416e7a488640c53 : u15 :e u17.
Axiom missingprop_a76efb72f36a26d5f27a9b9224b42b8be1785c9e1b5b0390f7ccb72d2b130266 : u16 :e u17.
Theorem missingprop_28e83b6c6d82b5f19c34f1ff582278ef8da66f007ed158fa6f23673ccf9bcb73 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_to_u17 x0 :e u17).
admit.
Qed.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition u17_to_Church17 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => ap (lam 17 (fun x18 : set => If_i (x18 = 0) x1 (If_i (x18 = 1) x2 (If_i (x18 = 2) x3 (If_i (x18 = 3) x4 (If_i (x18 = 4) x5 (If_i (x18 = 5) x6 (If_i (x18 = 6) x7 (If_i (x18 = 7) x8 (If_i (x18 = 8) x9 (If_i (x18 = 9) x10 (If_i (x18 = 10) x11 (If_i (x18 = 11) x12 (If_i (x18 = 12) x13 (If_i (x18 = 13) x14 (If_i (x18 = 14) x15 (If_i (x18 = 15) x16 x17))))))))))))))))) x0).
Axiom missingprop_fe72fe5f42300650f520fff5d26c8fed2422cadda1c955908832c1094e6cd904 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u15) x15 -> x17 x15 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u15)).
Axiom missingprop_d3916f6a6fcb01be833f85d8ad2b81dc017a5825678ddb80185d00cb4ac630dc : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0).
Axiom missingprop_63c13366871d56b929a86e30fe3f917efdeb3d770effb105bd4d58ad234e36b2 : (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4).
Theorem missingprop_7efb5b1e54f4be3fd98700207985907c9c39e0a790f4adffe17f9f4a05a07361 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u15) x15 -> x17 x15 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u15)).
admit.
Qed.
Axiom missingprop_16a45b15f191e253f6adaaaebafcd1d87d2c62d6d5f5b2a6cae3f68eeb4e5fba : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u16) x16 -> x17 x16 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u16)).
Theorem missingprop_ca238c556c10dcd54c1b9c4398dba2336d86653906e33fe58c9aca08e9633c1e : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u16) x16 -> x17 x16 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u16)).
admit.
Qed.
Axiom missingprop_18c079d0a948e2707cbd31a4293ae2dc77179c2184f0225dd81bf201082f253d : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, forall x1, forall x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, (forall x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19, forall x20 : set -> set -> prop, x20 (x0 x1 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19) (x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19) -> x20 (x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19) (x0 x1 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19)) -> x0 x1 = x2).
Theorem missingprop_e20cda3fec831e61f9db0bd6bee2791e26067278d174576042c0cb4b3ab479bb : u17_to_Church17 u15 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x16).
admit.
Qed.
Theorem missingprop_2491d2eab9fb9ff25fa0ab1839a83bd77980933cdf40d8cdd9120c539e464911 : u17_to_Church17 u16 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x17).
admit.
Qed.
