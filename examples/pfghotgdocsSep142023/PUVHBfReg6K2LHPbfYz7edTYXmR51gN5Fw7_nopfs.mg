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
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter encode_b "21324eab171ba1d7a41ca9f7ad87272b72d2982da5848b0cef9a7fe7653388ad" "4c89a6c736b15453d749c576f63559855d72931c3c7513c44e12ce14882d2fa7" *)
Parameter encode_b : set -> (set -> set -> set) -> set.
Definition pack_b_u_e_e : set -> (set -> set -> set) -> (set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> set => fun x2 : set -> set => fun x3 x4 : set => lam 5 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) (encode_b x0 x1) (If_i (x5 = 2) (lam x0 x2) (If_i (x5 = 3) x3 x4))))).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom tuple_5_0_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0) x0 -> x5 x0 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0)).
Theorem pack_b_u_e_e_0_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set, forall x4 x5, x0 = pack_b_u_e_e x1 x2 x3 x4 x5 -> x1 = ap x0 0).
admit.
Qed.
Theorem pack_b_u_e_e_0_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x0 (ap (pack_b_u_e_e x0 x1 x2 x3 x4) 0) -> x5 (ap (pack_b_u_e_e x0 x1 x2 x3 x4) 0) x0).
admit.
Qed.
(* Parameter decode_b "86e649daaa54cc94337666c48155bcb9c8d8f416ab6625b9c91601b52ce66901" "1024fb6c1c39aaae4a36f455b998b6ed0405d12e967bf5eae211141970ffa4fa" *)
Parameter decode_b : set -> set -> set -> set.
Axiom tuple_5_1_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1) x1 -> x5 x1 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1)).
Axiom decode_encode_b : (forall x0, forall x1 : set -> set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> decode_b (encode_b x0 x1) x2 x3 = x1 x2 x3)).
Theorem pack_b_u_e_e_1_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set, forall x4 x5, x0 = pack_b_u_e_e x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x2 x6 x7 = decode_b (ap x0 1) x6 x7))).
admit.
Qed.
Theorem pack_b_u_e_e_1_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set, forall x3 x4 x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 = decode_b (ap (pack_b_u_e_e x0 x1 x2 x3 x4) 1) x5 x6)).
admit.
Qed.
Axiom tuple_5_2_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2) x2 -> x5 x2 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2)).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Theorem pack_b_u_e_e_2_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set, forall x4 x5, x0 = pack_b_u_e_e x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> x3 x6 = ap (ap x0 2) x6)).
admit.
Qed.
Theorem pack_b_u_e_e_2_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set, forall x3 x4 x5, x5 :e x0 -> x2 x5 = ap (ap (pack_b_u_e_e x0 x1 x2 x3 x4) 2) x5).
admit.
Qed.
Axiom tuple_5_3_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3) x3 -> x5 x3 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3)).
Theorem pack_b_u_e_e_3_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set, forall x4 x5, x0 = pack_b_u_e_e x1 x2 x3 x4 x5 -> x4 = ap x0 3).
admit.
Qed.
Theorem pack_b_u_e_e_3_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x3 (ap (pack_b_u_e_e x0 x1 x2 x3 x4) 3) -> x5 (ap (pack_b_u_e_e x0 x1 x2 x3 x4) 3) x3).
admit.
Qed.
Axiom tuple_5_4_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4) x4 -> x5 x4 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4)).
Theorem pack_b_u_e_e_4_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set, forall x4 x5, x0 = pack_b_u_e_e x1 x2 x3 x4 x5 -> x5 = ap x0 4).
admit.
Qed.
Theorem pack_b_u_e_e_4_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x4 (ap (pack_b_u_e_e x0 x1 x2 x3 x4) 4) -> x5 (ap (pack_b_u_e_e x0 x1 x2 x3 x4) 4) x4).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
Theorem pack_b_u_e_e_inj : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 x5 : set -> set, forall x6 x7 x8 x9, pack_b_u_e_e x0 x2 x4 x6 x8 = pack_b_u_e_e x1 x3 x5 x7 x9 -> and (and (and (and (x0 = x1) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> x2 x10 x11 = x3 x10 x11))) (forall x10, x10 :e x0 -> x4 x10 = x5 x10)) (x6 = x7)) (x8 = x9)).
admit.
Qed.
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom encode_b_ext : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> encode_b x0 x1 = encode_b x0 x2).
Theorem pack_b_u_e_e_ext : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4 : set -> set, forall x5 x6, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x1 x7 x8 = x2 x7 x8)) -> (forall x7, x7 :e x0 -> x3 x7 = x4 x7) -> pack_b_u_e_e x0 x1 x3 x5 x6 = pack_b_u_e_e x0 x2 x4 x5 x6).
admit.
Qed.
Definition struct_b_u_e_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set, (forall x5, x5 :e x2 -> x4 x5 :e x2) -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x1 (pack_b_u_e_e x2 x3 x4 x5 x6))))) -> x1 x0).
Theorem pack_struct_b_u_e_e_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x0) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> struct_b_u_e_e (pack_b_u_e_e x0 x1 x2 x3 x4))))).
admit.
Qed.
Theorem pack_struct_b_u_e_e_E1 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set, forall x3 x4, struct_b_u_e_e (pack_b_u_e_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 :e x0))).
admit.
Qed.
Theorem pack_struct_b_u_e_e_E2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set, forall x3 x4, struct_b_u_e_e (pack_b_u_e_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> x2 x5 :e x0)).
admit.
Qed.
Theorem pack_struct_b_u_e_e_E3 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set, forall x3 x4, struct_b_u_e_e (pack_b_u_e_e x0 x1 x2 x3 x4) -> x3 :e x0).
admit.
Qed.
Theorem pack_struct_b_u_e_e_E4 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set, forall x3 x4, struct_b_u_e_e (pack_b_u_e_e x0 x1 x2 x3 x4) -> x4 :e x0).
admit.
Qed.
Theorem struct_b_u_e_e_eta : (forall x0, struct_b_u_e_e x0 -> x0 = pack_b_u_e_e (ap x0 0) (decode_b (ap x0 1)) (ap (ap x0 2)) (ap x0 3) (ap x0 4)).
admit.
Qed.
Definition unpack_b_u_e_e_i : set -> (set -> (set -> set -> set) -> (set -> set) -> set -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set) -> set -> set -> set => x1 (ap x0 0) (decode_b (ap x0 1)) (ap (ap x0 2)) (ap x0 3) (ap x0 4)).
Theorem unpack_b_u_e_e_i_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set) -> set -> set -> set, forall x1, forall x2 : set -> set -> set, forall x3 : set -> set, forall x4 x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set, (forall x8, x8 :e x1 -> x3 x8 = x7 x8) -> x0 x1 x6 x7 x4 x5 = x0 x1 x2 x3 x4 x5)) -> unpack_b_u_e_e_i (pack_b_u_e_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
admit.
Qed.
Definition unpack_b_u_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set) -> set -> set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set) -> set -> set -> prop => x1 (ap x0 0) (decode_b (ap x0 1)) (ap (ap x0 2)) (ap x0 3) (ap x0 4)).
Theorem unpack_b_u_e_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set) -> set -> set -> prop, forall x1, forall x2 : set -> set -> set, forall x3 : set -> set, forall x4 x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set, (forall x8, x8 :e x1 -> x3 x8 = x7 x8) -> x0 x1 x6 x7 x4 x5 = x0 x1 x2 x3 x4 x5)) -> unpack_b_u_e_e_o (pack_b_u_e_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
admit.
Qed.
(* Parameter encode_r "b1fb9de059c4e510b136e3f2b3833e9b6a459da341bf14d8c0591abe625c04aa" "17bc9f7081d26ba5939127ec0eef23162cf5bbe34ceeb18f41b091639dd2d108" *)
Parameter encode_r : set -> (set -> set -> prop) -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition pack_b_r_p_p : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set :=
 (fun x0 : set => fun x1 : set -> set -> set => fun x2 : set -> set -> prop => fun x3 x4 : set -> prop => lam 5 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) (encode_b x0 x1) (If_i (x5 = 2) (encode_r x0 x2) (If_i (x5 = 3) (Sep x0 x3) (Sep x0 x4)))))).
Theorem pack_b_r_p_p_0_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 : set -> prop, x0 = pack_b_r_p_p x1 x2 x3 x4 x5 -> x1 = ap x0 0).
admit.
Qed.
Theorem pack_b_r_p_p_0_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4 : set -> prop, forall x5 : set -> set -> prop, x5 x0 (ap (pack_b_r_p_p x0 x1 x2 x3 x4) 0) -> x5 (ap (pack_b_r_p_p x0 x1 x2 x3 x4) 0) x0).
admit.
Qed.
Theorem pack_b_r_p_p_1_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 : set -> prop, x0 = pack_b_r_p_p x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x2 x6 x7 = decode_b (ap x0 1) x6 x7))).
admit.
Qed.
Theorem pack_b_r_p_p_1_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4 : set -> prop, forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 = decode_b (ap (pack_b_r_p_p x0 x1 x2 x3 x4) 1) x5 x6)).
admit.
Qed.
(* Parameter decode_r "e25e4327c67053c3d99245dbaf92fdb3e5247e754bd6d8291f39ac34b6d57820" "f2f91589fb6488dd2bad3cebb9f65a57b7d7f3818091dcc789edd28f5d0ef2af" *)
Parameter decode_r : set -> set -> set -> prop.
Axiom decode_encode_r : (forall x0, forall x1 : set -> set -> prop, forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> decode_r (encode_r x0 x1) x2 x3 = x1 x2 x3)).
Theorem pack_b_r_p_p_2_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 : set -> prop, x0 = pack_b_r_p_p x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x3 x6 x7 = decode_r (ap x0 2) x6 x7))).
admit.
Qed.
Theorem pack_b_r_p_p_2_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4 : set -> prop, forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 = decode_r (ap (pack_b_r_p_p x0 x1 x2 x3 x4) 2) x5 x6)).
admit.
Qed.
(* Parameter decode_p "0bdf234a937a0270a819b1abf81040a3cc263b2f1071023dfbe2d9271ad618af" "02231a320843b92b212e53844c7e20e84a5114f2609e0ccf1fe173603ec3af98" *)
Parameter decode_p : set -> set -> prop.
Axiom decode_encode_p : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> decode_p (Sep x0 x1) x2 = x1 x2).
Theorem pack_b_r_p_p_3_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 : set -> prop, x0 = pack_b_r_p_p x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> x4 x6 = decode_p (ap x0 3) x6)).
admit.
Qed.
Theorem pack_b_r_p_p_3_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4 : set -> prop, forall x5, x5 :e x0 -> x3 x5 = decode_p (ap (pack_b_r_p_p x0 x1 x2 x3 x4) 3) x5).
admit.
Qed.
Theorem pack_b_r_p_p_4_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 : set -> prop, x0 = pack_b_r_p_p x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> x5 x6 = decode_p (ap x0 4) x6)).
admit.
Qed.
Theorem pack_b_r_p_p_4_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4 : set -> prop, forall x5, x5 :e x0 -> x4 x5 = decode_p (ap (pack_b_r_p_p x0 x1 x2 x3 x4) 4) x5).
admit.
Qed.
Theorem pack_b_r_p_p_inj : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 x5 : set -> set -> prop, forall x6 x7 x8 x9 : set -> prop, pack_b_r_p_p x0 x2 x4 x6 x8 = pack_b_r_p_p x1 x3 x5 x7 x9 -> and (and (and (and (x0 = x1) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> x2 x10 x11 = x3 x10 x11))) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> x4 x10 x11 = x5 x10 x11))) (forall x10, x10 :e x0 -> x6 x10 = x7 x10)) (forall x10, x10 :e x0 -> x8 x10 = x9 x10)).
admit.
Qed.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom encode_p_ext : (forall x0, forall x1 x2 : set -> prop, (forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)) -> Sep x0 x1 = Sep x0 x2).
Axiom encode_r_ext : (forall x0, forall x1 x2 : set -> set -> prop, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> iff (x1 x3 x4) (x2 x3 x4))) -> encode_r x0 x1 = encode_r x0 x2).
Theorem pack_b_r_p_p_ext : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4 : set -> set -> prop, forall x5 x6 x7 x8 : set -> prop, (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> x1 x9 x10 = x2 x9 x10)) -> (forall x9, x9 :e x0 -> (forall x10, x10 :e x0 -> iff (x3 x9 x10) (x4 x9 x10))) -> (forall x9, x9 :e x0 -> iff (x5 x9) (x6 x9)) -> (forall x9, x9 :e x0 -> iff (x7 x9) (x8 x9)) -> pack_b_r_p_p x0 x1 x3 x5 x7 = pack_b_r_p_p x0 x2 x4 x6 x8).
admit.
Qed.
Definition struct_b_r_p_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> prop, forall x5 x6 : set -> prop, x1 (pack_b_r_p_p x2 x3 x4 x5 x6))) -> x1 x0).
Theorem pack_struct_b_r_p_p_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set -> prop, forall x3 x4 : set -> prop, struct_b_r_p_p (pack_b_r_p_p x0 x1 x2 x3 x4))).
admit.
Qed.
Theorem pack_struct_b_r_p_p_E1 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4 : set -> prop, struct_b_r_p_p (pack_b_r_p_p x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 :e x0))).
admit.
Qed.
Axiom iff_refl : (forall x0 : prop, iff x0 x0).
Theorem struct_b_r_p_p_eta : (forall x0, struct_b_r_p_p x0 -> x0 = pack_b_r_p_p (ap x0 0) (decode_b (ap x0 1)) (decode_r (ap x0 2)) (decode_p (ap x0 3)) (decode_p (ap x0 4))).
admit.
Qed.
Definition unpack_b_r_p_p_i : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set) -> set :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_r (ap x0 2)) (decode_p (ap x0 3)) (decode_p (ap x0 4))).
Theorem unpack_b_r_p_p_i_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set, forall x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 : set -> prop, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> prop, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> iff (x3 x8 x9) (x7 x8 x9))) -> (forall x8 : set -> prop, (forall x9, x9 :e x1 -> iff (x4 x9) (x8 x9)) -> (forall x9 : set -> prop, (forall x10, x10 :e x1 -> iff (x5 x10) (x9 x10)) -> x0 x1 x6 x7 x8 x9 = x0 x1 x2 x3 x4 x5)))) -> unpack_b_r_p_p_i (pack_b_r_p_p x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
admit.
Qed.
Definition unpack_b_r_p_p_o : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_r (ap x0 2)) (decode_p (ap x0 3)) (decode_p (ap x0 4))).
Theorem unpack_b_r_p_p_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop, forall x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5 : set -> prop, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> prop, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> iff (x3 x8 x9) (x7 x8 x9))) -> (forall x8 : set -> prop, (forall x9, x9 :e x1 -> iff (x4 x9) (x8 x9)) -> (forall x9 : set -> prop, (forall x10, x10 :e x1 -> iff (x5 x10) (x9 x10)) -> x0 x1 x6 x7 x8 x9 = x0 x1 x2 x3 x4 x5)))) -> unpack_b_r_p_p_o (pack_b_r_p_p x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
admit.
Qed.
Definition pack_b_r_p_e : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> set => fun x2 : set -> set -> prop => fun x3 : set -> prop => fun x4 : set => lam 5 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) (encode_b x0 x1) (If_i (x5 = 2) (encode_r x0 x2) (If_i (x5 = 3) (Sep x0 x3) x4))))).
Theorem pack_b_r_p_e_0_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 : set -> prop, forall x5, x0 = pack_b_r_p_e x1 x2 x3 x4 x5 -> x1 = ap x0 0).
admit.
Qed.
Theorem pack_b_r_p_e_0_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 : set -> prop, forall x4, forall x5 : set -> set -> prop, x5 x0 (ap (pack_b_r_p_e x0 x1 x2 x3 x4) 0) -> x5 (ap (pack_b_r_p_e x0 x1 x2 x3 x4) 0) x0).
admit.
Qed.
Theorem pack_b_r_p_e_1_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 : set -> prop, forall x5, x0 = pack_b_r_p_e x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x2 x6 x7 = decode_b (ap x0 1) x6 x7))).
admit.
Qed.
Theorem pack_b_r_p_e_1_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 : set -> prop, forall x4 x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 = decode_b (ap (pack_b_r_p_e x0 x1 x2 x3 x4) 1) x5 x6)).
admit.
Qed.
Theorem pack_b_r_p_e_2_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 : set -> prop, forall x5, x0 = pack_b_r_p_e x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x3 x6 x7 = decode_r (ap x0 2) x6 x7))).
admit.
Qed.
Theorem pack_b_r_p_e_2_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 : set -> prop, forall x4 x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 = decode_r (ap (pack_b_r_p_e x0 x1 x2 x3 x4) 2) x5 x6)).
admit.
Qed.
Theorem pack_b_r_p_e_3_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 : set -> prop, forall x5, x0 = pack_b_r_p_e x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> x4 x6 = decode_p (ap x0 3) x6)).
admit.
Qed.
Theorem pack_b_r_p_e_3_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 : set -> prop, forall x4 x5, x5 :e x0 -> x3 x5 = decode_p (ap (pack_b_r_p_e x0 x1 x2 x3 x4) 3) x5).
admit.
Qed.
Theorem pack_b_r_p_e_4_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 : set -> prop, forall x5, x0 = pack_b_r_p_e x1 x2 x3 x4 x5 -> x5 = ap x0 4).
admit.
Qed.
Theorem pack_b_r_p_e_4_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 : set -> prop, forall x4, forall x5 : set -> set -> prop, x5 x4 (ap (pack_b_r_p_e x0 x1 x2 x3 x4) 4) -> x5 (ap (pack_b_r_p_e x0 x1 x2 x3 x4) 4) x4).
admit.
Qed.
Theorem pack_b_r_p_e_inj : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 x5 : set -> set -> prop, forall x6 x7 : set -> prop, forall x8 x9, pack_b_r_p_e x0 x2 x4 x6 x8 = pack_b_r_p_e x1 x3 x5 x7 x9 -> and (and (and (and (x0 = x1) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> x2 x10 x11 = x3 x10 x11))) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> x4 x10 x11 = x5 x10 x11))) (forall x10, x10 :e x0 -> x6 x10 = x7 x10)) (x8 = x9)).
admit.
Qed.
Theorem pack_b_r_p_e_ext : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4 : set -> set -> prop, forall x5 x6 : set -> prop, forall x7, (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x1 x8 x9 = x2 x8 x9)) -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> iff (x3 x8 x9) (x4 x8 x9))) -> (forall x8, x8 :e x0 -> iff (x5 x8) (x6 x8)) -> pack_b_r_p_e x0 x1 x3 x5 x7 = pack_b_r_p_e x0 x2 x4 x6 x7).
admit.
Qed.
Definition struct_b_r_p_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> prop, forall x5 : set -> prop, forall x6, x6 :e x2 -> x1 (pack_b_r_p_e x2 x3 x4 x5 x6))) -> x1 x0).
Theorem pack_struct_b_r_p_e_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set -> prop, forall x3 : set -> prop, forall x4, x4 :e x0 -> struct_b_r_p_e (pack_b_r_p_e x0 x1 x2 x3 x4))).
admit.
Qed.
Theorem pack_struct_b_r_p_e_E1 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 : set -> prop, forall x4, struct_b_r_p_e (pack_b_r_p_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 :e x0))).
admit.
Qed.
Theorem pack_struct_b_r_p_e_E4 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 : set -> prop, forall x4, struct_b_r_p_e (pack_b_r_p_e x0 x1 x2 x3 x4) -> x4 :e x0).
admit.
Qed.
Theorem struct_b_r_p_e_eta : (forall x0, struct_b_r_p_e x0 -> x0 = pack_b_r_p_e (ap x0 0) (decode_b (ap x0 1)) (decode_r (ap x0 2)) (decode_p (ap x0 3)) (ap x0 4)).
admit.
Qed.
Definition unpack_b_r_p_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_r (ap x0 2)) (decode_p (ap x0 3)) (ap x0 4)).
Theorem unpack_b_r_p_e_i_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set, forall x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 : set -> prop, forall x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> prop, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> iff (x3 x8 x9) (x7 x8 x9))) -> (forall x8 : set -> prop, (forall x9, x9 :e x1 -> iff (x4 x9) (x8 x9)) -> x0 x1 x6 x7 x8 x5 = x0 x1 x2 x3 x4 x5))) -> unpack_b_r_p_e_i (pack_b_r_p_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
admit.
Qed.
Definition unpack_b_r_p_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> prop => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_r (ap x0 2)) (decode_p (ap x0 3)) (ap x0 4)).
Theorem unpack_b_r_p_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> prop, forall x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 : set -> prop, forall x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> prop, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> iff (x3 x8 x9) (x7 x8 x9))) -> (forall x8 : set -> prop, (forall x9, x9 :e x1 -> iff (x4 x9) (x8 x9)) -> x0 x1 x6 x7 x8 x5 = x0 x1 x2 x3 x4 x5))) -> unpack_b_r_p_e_o (pack_b_r_p_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
admit.
Qed.
Definition pack_b_r_e_e : set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> set => fun x2 : set -> set -> prop => fun x3 x4 : set => lam 5 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) (encode_b x0 x1) (If_i (x5 = 2) (encode_r x0 x2) (If_i (x5 = 3) x3 x4))))).
Theorem pack_b_r_e_e_0_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, x0 = pack_b_r_e_e x1 x2 x3 x4 x5 -> x1 = ap x0 0).
admit.
Qed.
Theorem pack_b_r_e_e_0_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4, forall x5 : set -> set -> prop, x5 x0 (ap (pack_b_r_e_e x0 x1 x2 x3 x4) 0) -> x5 (ap (pack_b_r_e_e x0 x1 x2 x3 x4) 0) x0).
admit.
Qed.
Theorem pack_b_r_e_e_1_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, x0 = pack_b_r_e_e x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x2 x6 x7 = decode_b (ap x0 1) x6 x7))).
admit.
Qed.
Theorem pack_b_r_e_e_1_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4 x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 = decode_b (ap (pack_b_r_e_e x0 x1 x2 x3 x4) 1) x5 x6)).
admit.
Qed.
Theorem pack_b_r_e_e_2_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, x0 = pack_b_r_e_e x1 x2 x3 x4 x5 -> (forall x6, x6 :e x1 -> (forall x7, x7 :e x1 -> x3 x6 x7 = decode_r (ap x0 2) x6 x7))).
admit.
Qed.
Theorem pack_b_r_e_e_2_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4 x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 = decode_r (ap (pack_b_r_e_e x0 x1 x2 x3 x4) 2) x5 x6)).
admit.
Qed.
Theorem pack_b_r_e_e_3_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, x0 = pack_b_r_e_e x1 x2 x3 x4 x5 -> x4 = ap x0 3).
admit.
Qed.
Theorem pack_b_r_e_e_3_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4, forall x5 : set -> set -> prop, x5 x3 (ap (pack_b_r_e_e x0 x1 x2 x3 x4) 3) -> x5 (ap (pack_b_r_e_e x0 x1 x2 x3 x4) 3) x3).
admit.
Qed.
Theorem pack_b_r_e_e_4_eq : (forall x0 x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, x0 = pack_b_r_e_e x1 x2 x3 x4 x5 -> x5 = ap x0 4).
admit.
Qed.
Theorem pack_b_r_e_e_4_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4, forall x5 : set -> set -> prop, x5 x4 (ap (pack_b_r_e_e x0 x1 x2 x3 x4) 4) -> x5 (ap (pack_b_r_e_e x0 x1 x2 x3 x4) 4) x4).
admit.
Qed.
Theorem pack_b_r_e_e_inj : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4 x5 : set -> set -> prop, forall x6 x7 x8 x9, pack_b_r_e_e x0 x2 x4 x6 x8 = pack_b_r_e_e x1 x3 x5 x7 x9 -> and (and (and (and (x0 = x1) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> x2 x10 x11 = x3 x10 x11))) (forall x10, x10 :e x0 -> (forall x11, x11 :e x0 -> x4 x10 x11 = x5 x10 x11))) (x6 = x7)) (x8 = x9)).
admit.
Qed.
Theorem pack_b_r_e_e_ext : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4 : set -> set -> prop, forall x5 x6, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x1 x7 x8 = x2 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> iff (x3 x7 x8) (x4 x7 x8))) -> pack_b_r_e_e x0 x1 x3 x5 x6 = pack_b_r_e_e x0 x2 x4 x5 x6).
admit.
Qed.
Definition struct_b_r_e_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> prop, forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x1 (pack_b_r_e_e x2 x3 x4 x5 x6)))) -> x1 x0).
Theorem pack_struct_b_r_e_e_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set -> prop, forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> struct_b_r_e_e (pack_b_r_e_e x0 x1 x2 x3 x4)))).
admit.
Qed.
Theorem pack_struct_b_r_e_e_E1 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4, struct_b_r_e_e (pack_b_r_e_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 :e x0))).
admit.
Qed.
Theorem pack_struct_b_r_e_e_E3 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4, struct_b_r_e_e (pack_b_r_e_e x0 x1 x2 x3 x4) -> x3 :e x0).
admit.
Qed.
Theorem pack_struct_b_r_e_e_E4 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, forall x3 x4, struct_b_r_e_e (pack_b_r_e_e x0 x1 x2 x3 x4) -> x4 :e x0).
admit.
Qed.
Theorem struct_b_r_e_e_eta : (forall x0, struct_b_r_e_e x0 -> x0 = pack_b_r_e_e (ap x0 0) (decode_b (ap x0 1)) (decode_r (ap x0 2)) (ap x0 3) (ap x0 4)).
admit.
Qed.
Definition unpack_b_r_e_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_r (ap x0 2)) (ap x0 3) (ap x0 4)).
Theorem unpack_b_r_e_e_i_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set, forall x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> prop, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> iff (x3 x8 x9) (x7 x8 x9))) -> x0 x1 x6 x7 x4 x5 = x0 x1 x2 x3 x4 x5)) -> unpack_b_r_e_e_i (pack_b_r_e_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
admit.
Qed.
Definition unpack_b_r_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop => x1 (ap x0 0) (decode_b (ap x0 1)) (decode_r (ap x0 2)) (ap x0 3) (ap x0 4)).
Theorem unpack_b_r_e_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop, forall x1, forall x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> prop, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> iff (x3 x8 x9) (x7 x8 x9))) -> x0 x1 x6 x7 x4 x5 = x0 x1 x2 x3 x4 x5)) -> unpack_b_r_e_e_o (pack_b_r_e_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
admit.
Qed.
