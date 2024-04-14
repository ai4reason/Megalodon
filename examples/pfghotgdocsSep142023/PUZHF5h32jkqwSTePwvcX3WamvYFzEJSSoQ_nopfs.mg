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
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition pack_p_p : set -> (set -> prop) -> (set -> prop) -> set :=
 (fun x0 : set => fun x1 x2 : set -> prop => lam 3 (fun x3 : set => If_i (x3 = 0) x0 (If_i (x3 = 1) (Sep x0 x1) (Sep x0 x2)))).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom tuple_3_0_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0) x0 -> x3 x0 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0)).
Theorem pack_p_p_0_eq : (forall x0 x1, forall x2 x3 : set -> prop, x0 = pack_p_p x1 x2 x3 -> x1 = ap x0 0).
admit.
Qed.
Theorem pack_p_p_0_eq2 : (forall x0, forall x1 x2 : set -> prop, forall x3 : set -> set -> prop, x3 x0 (ap (pack_p_p x0 x1 x2) 0) -> x3 (ap (pack_p_p x0 x1 x2) 0) x0).
admit.
Qed.
(* Parameter decode_p "0bdf234a937a0270a819b1abf81040a3cc263b2f1071023dfbe2d9271ad618af" "02231a320843b92b212e53844c7e20e84a5114f2609e0ccf1fe173603ec3af98" *)
Parameter decode_p : set -> set -> prop.
Axiom tuple_3_1_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1) x1 -> x3 x1 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1)).
Axiom decode_encode_p : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> decode_p (Sep x0 x1) x2 = x1 x2).
Theorem pack_p_p_1_eq : (forall x0 x1, forall x2 x3 : set -> prop, x0 = pack_p_p x1 x2 x3 -> (forall x4, x4 :e x1 -> x2 x4 = decode_p (ap x0 1) x4)).
admit.
Qed.
Theorem pack_p_p_1_eq2 : (forall x0, forall x1 x2 : set -> prop, forall x3, x3 :e x0 -> x1 x3 = decode_p (ap (pack_p_p x0 x1 x2) 1) x3).
admit.
Qed.
Axiom tuple_3_2_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2) x2 -> x3 x2 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2)).
Theorem pack_p_p_2_eq : (forall x0 x1, forall x2 x3 : set -> prop, x0 = pack_p_p x1 x2 x3 -> (forall x4, x4 :e x1 -> x3 x4 = decode_p (ap x0 2) x4)).
admit.
Qed.
Theorem pack_p_p_2_eq2 : (forall x0, forall x1 x2 : set -> prop, forall x3, x3 :e x0 -> x2 x3 = decode_p (ap (pack_p_p x0 x1 x2) 2) x3).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem pack_p_p_inj : (forall x0 x1, forall x2 x3 x4 x5 : set -> prop, pack_p_p x0 x2 x4 = pack_p_p x1 x3 x5 -> and (and (x0 = x1) (forall x6, x6 :e x0 -> x2 x6 = x3 x6)) (forall x6, x6 :e x0 -> x4 x6 = x5 x6)).
admit.
Qed.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom encode_p_ext : (forall x0, forall x1 x2 : set -> prop, (forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)) -> Sep x0 x1 = Sep x0 x2).
Theorem pack_p_p_ext : (forall x0, forall x1 x2 x3 x4 : set -> prop, (forall x5, x5 :e x0 -> iff (x1 x5) (x2 x5)) -> (forall x5, x5 :e x0 -> iff (x3 x5) (x4 x5)) -> pack_p_p x0 x1 x3 = pack_p_p x0 x2 x4).
admit.
Qed.
Definition struct_p_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 x4 : set -> prop, x1 (pack_p_p x2 x3 x4)) -> x1 x0).
Theorem pack_struct_p_p_I : (forall x0, forall x1 x2 : set -> prop, struct_p_p (pack_p_p x0 x1 x2)).
admit.
Qed.
Axiom iff_refl : (forall x0 : prop, iff x0 x0).
Theorem struct_p_p_eta : (forall x0, struct_p_p x0 -> x0 = pack_p_p (ap x0 0) (decode_p (ap x0 1)) (decode_p (ap x0 2))).
admit.
Qed.
Definition unpack_p_p_i : set -> (set -> (set -> prop) -> (set -> prop) -> set) -> set :=
 (fun x0 : set => fun x1 : set -> (set -> prop) -> (set -> prop) -> set => x1 (ap x0 0) (decode_p (ap x0 1)) (decode_p (ap x0 2))).
Theorem unpack_p_p_i_eq : (forall x0 : set -> (set -> prop) -> (set -> prop) -> set, forall x1, forall x2 x3 : set -> prop, (forall x4 : set -> prop, (forall x5, x5 :e x1 -> iff (x2 x5) (x4 x5)) -> (forall x5 : set -> prop, (forall x6, x6 :e x1 -> iff (x3 x6) (x5 x6)) -> x0 x1 x4 x5 = x0 x1 x2 x3)) -> unpack_p_p_i (pack_p_p x1 x2 x3) x0 = x0 x1 x2 x3).
admit.
Qed.
Definition unpack_p_p_o : set -> (set -> (set -> prop) -> (set -> prop) -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> prop) -> (set -> prop) -> prop => x1 (ap x0 0) (decode_p (ap x0 1)) (decode_p (ap x0 2))).
Theorem unpack_p_p_o_eq : (forall x0 : set -> (set -> prop) -> (set -> prop) -> prop, forall x1, forall x2 x3 : set -> prop, (forall x4 : set -> prop, (forall x5, x5 :e x1 -> iff (x2 x5) (x4 x5)) -> (forall x5 : set -> prop, (forall x6, x6 :e x1 -> iff (x3 x6) (x5 x6)) -> x0 x1 x4 x5 = x0 x1 x2 x3)) -> unpack_p_p_o (pack_p_p x1 x2 x3) x0 = x0 x1 x2 x3).
admit.
Qed.
Definition pack_p_e : set -> (set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => lam 3 (fun x3 : set => If_i (x3 = 0) x0 (If_i (x3 = 1) (Sep x0 x1) x2))).
Theorem pack_p_e_0_eq : (forall x0 x1, forall x2 : set -> prop, forall x3, x0 = pack_p_e x1 x2 x3 -> x1 = ap x0 0).
admit.
Qed.
Theorem pack_p_e_0_eq2 : (forall x0, forall x1 : set -> prop, forall x2, forall x3 : set -> set -> prop, x3 x0 (ap (pack_p_e x0 x1 x2) 0) -> x3 (ap (pack_p_e x0 x1 x2) 0) x0).
admit.
Qed.
Theorem pack_p_e_1_eq : (forall x0 x1, forall x2 : set -> prop, forall x3, x0 = pack_p_e x1 x2 x3 -> (forall x4, x4 :e x1 -> x2 x4 = decode_p (ap x0 1) x4)).
admit.
Qed.
Theorem pack_p_e_1_eq2 : (forall x0, forall x1 : set -> prop, forall x2 x3, x3 :e x0 -> x1 x3 = decode_p (ap (pack_p_e x0 x1 x2) 1) x3).
admit.
Qed.
Theorem pack_p_e_2_eq : (forall x0 x1, forall x2 : set -> prop, forall x3, x0 = pack_p_e x1 x2 x3 -> x3 = ap x0 2).
admit.
Qed.
Theorem pack_p_e_2_eq2 : (forall x0, forall x1 : set -> prop, forall x2, forall x3 : set -> set -> prop, x3 x2 (ap (pack_p_e x0 x1 x2) 2) -> x3 (ap (pack_p_e x0 x1 x2) 2) x2).
admit.
Qed.
Theorem pack_p_e_inj : (forall x0 x1, forall x2 x3 : set -> prop, forall x4 x5, pack_p_e x0 x2 x4 = pack_p_e x1 x3 x5 -> and (and (x0 = x1) (forall x6, x6 :e x0 -> x2 x6 = x3 x6)) (x4 = x5)).
admit.
Qed.
Theorem pack_p_e_ext : (forall x0, forall x1 x2 : set -> prop, forall x3, (forall x4, x4 :e x0 -> iff (x1 x4) (x2 x4)) -> pack_p_e x0 x1 x3 = pack_p_e x0 x2 x3).
admit.
Qed.
Definition struct_p_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> prop, forall x4, x4 :e x2 -> x1 (pack_p_e x2 x3 x4)) -> x1 x0).
Theorem pack_struct_p_e_I : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> struct_p_e (pack_p_e x0 x1 x2)).
admit.
Qed.
Theorem pack_struct_p_e_E2 : (forall x0, forall x1 : set -> prop, forall x2, struct_p_e (pack_p_e x0 x1 x2) -> x2 :e x0).
admit.
Qed.
Theorem struct_p_e_eta : (forall x0, struct_p_e x0 -> x0 = pack_p_e (ap x0 0) (decode_p (ap x0 1)) (ap x0 2)).
admit.
Qed.
Definition unpack_p_e_i : set -> (set -> (set -> prop) -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> (set -> prop) -> set -> set => x1 (ap x0 0) (decode_p (ap x0 1)) (ap x0 2)).
Theorem unpack_p_e_i_eq : (forall x0 : set -> (set -> prop) -> set -> set, forall x1, forall x2 : set -> prop, forall x3, (forall x4 : set -> prop, (forall x5, x5 :e x1 -> iff (x2 x5) (x4 x5)) -> x0 x1 x4 x3 = x0 x1 x2 x3) -> unpack_p_e_i (pack_p_e x1 x2 x3) x0 = x0 x1 x2 x3).
admit.
Qed.
Definition unpack_p_e_o : set -> (set -> (set -> prop) -> set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> (set -> prop) -> set -> prop => x1 (ap x0 0) (decode_p (ap x0 1)) (ap x0 2)).
Theorem unpack_p_e_o_eq : (forall x0 : set -> (set -> prop) -> set -> prop, forall x1, forall x2 : set -> prop, forall x3, (forall x4 : set -> prop, (forall x5, x5 :e x1 -> iff (x2 x5) (x4 x5)) -> x0 x1 x4 x3 = x0 x1 x2 x3) -> unpack_p_e_o (pack_p_e x1 x2 x3) x0 = x0 x1 x2 x3).
admit.
Qed.
Definition pack_e_e : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam 3 (fun x3 : set => If_i (x3 = 0) x0 (If_i (x3 = 1) x1 x2))).
Theorem pack_e_e_0_eq : (forall x0 x1 x2 x3, x0 = pack_e_e x1 x2 x3 -> x1 = ap x0 0).
admit.
Qed.
Theorem pack_e_e_0_eq2 : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 x0 (ap (pack_e_e x0 x1 x2) 0) -> x3 (ap (pack_e_e x0 x1 x2) 0) x0).
admit.
Qed.
Theorem pack_e_e_1_eq : (forall x0 x1 x2 x3, x0 = pack_e_e x1 x2 x3 -> x2 = ap x0 1).
admit.
Qed.
Theorem pack_e_e_1_eq2 : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 x1 (ap (pack_e_e x0 x1 x2) 1) -> x3 (ap (pack_e_e x0 x1 x2) 1) x1).
admit.
Qed.
Theorem pack_e_e_2_eq : (forall x0 x1 x2 x3, x0 = pack_e_e x1 x2 x3 -> x3 = ap x0 2).
admit.
Qed.
Theorem pack_e_e_2_eq2 : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 x2 (ap (pack_e_e x0 x1 x2) 2) -> x3 (ap (pack_e_e x0 x1 x2) 2) x2).
admit.
Qed.
Theorem pack_e_e_inj : (forall x0 x1 x2 x3 x4 x5, pack_e_e x0 x2 x4 = pack_e_e x1 x3 x5 -> and (and (x0 = x1) (x2 = x3)) (x4 = x5)).
admit.
Qed.
Definition struct_e_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2 x3, x3 :e x2 -> (forall x4, x4 :e x2 -> x1 (pack_e_e x2 x3 x4))) -> x1 x0).
Theorem pack_struct_e_e_I : (forall x0 x1, x1 :e x0 -> (forall x2, x2 :e x0 -> struct_e_e (pack_e_e x0 x1 x2))).
admit.
Qed.
Theorem pack_struct_e_e_E1 : (forall x0 x1 x2, struct_e_e (pack_e_e x0 x1 x2) -> x1 :e x0).
admit.
Qed.
Theorem pack_struct_e_e_E2 : (forall x0 x1 x2, struct_e_e (pack_e_e x0 x1 x2) -> x2 :e x0).
admit.
Qed.
Theorem struct_e_e_eta : (forall x0, struct_e_e x0 -> x0 = pack_e_e (ap x0 0) (ap x0 1) (ap x0 2)).
admit.
Qed.
Definition unpack_e_e_i : set -> (set -> set -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set -> set -> set => x1 (ap x0 0) (ap x0 1) (ap x0 2)).
Theorem unpack_e_e_i_eq : (forall x0 : set -> set -> set -> set, forall x1 x2 x3, forall x4 : set -> set -> prop, x4 (unpack_e_e_i (pack_e_e x1 x2 x3) x0) (x0 x1 x2 x3) -> x4 (x0 x1 x2 x3) (unpack_e_e_i (pack_e_e x1 x2 x3) x0)).
admit.
Qed.
Definition unpack_e_e_o : set -> (set -> set -> set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> set -> set -> prop => x1 (ap x0 0) (ap x0 1) (ap x0 2)).
Theorem unpack_e_e_o_eq : (forall x0 : set -> set -> set -> prop, forall x1 x2 x3, forall x4 : prop -> prop -> prop, x4 (unpack_e_e_o (pack_e_e x1 x2 x3) x0) (x0 x1 x2 x3) -> x4 (x0 x1 x2 x3) (unpack_e_e_o (pack_e_e x1 x2 x3) x0)).
admit.
Qed.
