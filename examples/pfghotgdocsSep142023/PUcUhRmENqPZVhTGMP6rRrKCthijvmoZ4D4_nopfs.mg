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
Axiom missingprop_099fdd6f6fc9d9c65e6c63c6cd5d2c7468eccfeb1ff3ee8aa274ca2d4ba4b627 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) 0) x0 -> x17 x0 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) 0)).
Axiom missingprop_d3916f6a6fcb01be833f85d8ad2b81dc017a5825678ddb80185d00cb4ac630dc : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0).
Axiom missingprop_63c13366871d56b929a86e30fe3f917efdeb3d770effb105bd4d58ad234e36b2 : (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4).
Theorem missingprop_e7e789d9be035ca6d787114611f96de213c7d5047ff7ba15494b32ba7f1604dd : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) 0) x0 -> x17 x0 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) 0)).
admit.
Qed.
(* Parameter u1 "338dd245674671b9ed7925015246c4c4be0e334151ccd1c7d5a3567f5c4461a5" "8170ad5e6535f2661f0d055afe32d84d876773f4e8519ce018687f54b2ba9159" *)
Parameter u1 : set.
Axiom missingprop_e35554b7d815af2aaa8cf3f8fd96fa83341d7d9a61689fa603830c4de03c7838 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u1) x1 -> x17 x1 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u1)).
Theorem missingprop_983aa27b5bc8dc2a46a23eb2efb79300c1090ef4c413a19b362c28f28ef54914 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u1) x1 -> x17 x1 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u1)).
admit.
Qed.
(* Parameter u2 "e6513b6b7dacfb379ee35c71b72ff5e0713f783ff08590c7fabcc4c48daf9f2e" "3bd7f72ec38573ff1d3910239a4aa349e3832908ab08202cf114451bffd7d17d" *)
Parameter u2 : set.
Axiom missingprop_d0ea30e0036b834b660c28f1dcc14750a91fe57f6d6ee329bb7013809ae8f9ca : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u2) x2 -> x17 x2 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u2)).
Theorem missingprop_c8aa6315990cf7828645261c51838898069e0ba45fc603383b581cf6c3c65444 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u2) x2 -> x17 x2 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u2)).
admit.
Qed.
Axiom missingprop_18c079d0a948e2707cbd31a4293ae2dc77179c2184f0225dd81bf201082f253d : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, forall x1, forall x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, (forall x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19, forall x20 : set -> set -> prop, x20 (x0 x1 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19) (x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19) -> x20 (x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19) (x0 x1 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19)) -> x0 x1 = x2).
Theorem missingprop_84aaefca7211a57d89e0df96a1f742653d3cc05f82d5ab568090ade3cb9ffcfd : u17_to_Church17 0 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x1).
admit.
Qed.
Theorem missingprop_f880a8473dab9f58d69fbf332c8547d500ca315e405258a93c99a34f8560efb6 : u17_to_Church17 u1 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x2).
admit.
Qed.
Theorem missingprop_7c154441ca7b7a9fe09539322ad6531c3f48333c7018e2f8c866c0af44719d1a : u17_to_Church17 u2 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x3).
admit.
Qed.
