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
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
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
Axiom missingprop_611d05f3c0e0aff033700ccf72b7ceaf4160dd0bd5dde16fbd4a43684d4061b2 : (forall x0, atleastp u5 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (x2 = x3 -> (forall x7 : prop, x7)) -> (x2 = x4 -> (forall x7 : prop, x7)) -> (x2 = x5 -> (forall x7 : prop, x7)) -> (x2 = x6 -> (forall x7 : prop, x7)) -> (x3 = x4 -> (forall x7 : prop, x7)) -> (x3 = x5 -> (forall x7 : prop, x7)) -> (x3 = x6 -> (forall x7 : prop, x7)) -> (x4 = x5 -> (forall x7 : prop, x7)) -> (x4 = x6 -> (forall x7 : prop, x7)) -> (x5 = x6 -> (forall x7 : prop, x7)) -> x1))))) -> x1)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_5 : nat_p 5.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom surj_rinv : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> (forall x3, x3 :e x1 -> and (inv x0 x2 x3 :e x0) (x2 (inv x0 x2 x3) = x3))).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom In_0_5 : 0 :e 5.
Axiom tuple_5_0_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0) x0 -> x5 x0 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0)).
Axiom In_1_5 : 1 :e 5.
Axiom tuple_5_1_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1) x1 -> x5 x1 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1)).
Axiom In_2_5 : 2 :e 5.
Axiom tuple_5_2_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2) x2 -> x5 x2 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2)).
Axiom In_3_5 : 3 :e 5.
Axiom tuple_5_3_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3) x3 -> x5 x3 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3)).
Axiom In_4_5 : 4 :e 5.
Axiom tuple_5_4_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4) x4 -> x5 x4 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4)).
Axiom nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
Axiom nat_6 : nat_p 6.
Axiom In_5_6 : u5 :e u6.
Theorem missingprop_ba30b25f1a65b3744fe7cb1dea2e0da751d22f70c3ed4ef5daba196035d75c12 : (forall x0, atleastp u6 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (x2 = x3 -> (forall x8 : prop, x8)) -> (x2 = x4 -> (forall x8 : prop, x8)) -> (x2 = x5 -> (forall x8 : prop, x8)) -> (x2 = x6 -> (forall x8 : prop, x8)) -> (x2 = x7 -> (forall x8 : prop, x8)) -> (x3 = x4 -> (forall x8 : prop, x8)) -> (x3 = x5 -> (forall x8 : prop, x8)) -> (x3 = x6 -> (forall x8 : prop, x8)) -> (x3 = x7 -> (forall x8 : prop, x8)) -> (x4 = x5 -> (forall x8 : prop, x8)) -> (x4 = x6 -> (forall x8 : prop, x8)) -> (x4 = x7 -> (forall x8 : prop, x8)) -> (x5 = x6 -> (forall x8 : prop, x8)) -> (x5 = x7 -> (forall x8 : prop, x8)) -> (x6 = x7 -> (forall x8 : prop, x8)) -> x1)))))) -> x1)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom missingprop_19c5bea28ef119e30d80f4e7c578df826b34bc3d0b15978a12c7c1b896ec3046 : (forall x0, atleastp u4 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (x2 = x3 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x1)))) -> x1)).
Theorem missingprop_c40ce58f8bf762f3f8a2a27703783ff481afc83d85d1f2592549267dc4416de4 : (forall x0 x1 : set -> set -> set -> set -> prop, (forall x2 x3 x4 x5, x0 x2 x3 x4 x5 -> x0 x4 x5 x2 x3) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> not (x0 x2 x3 x2 x3))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> x1 x2 x3 x2 x3)) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (x2 = u5 -> x3 = u5 -> False) -> (x4 = u5 -> x5 = u5 -> False) -> x0 x2 x3 x4 x5 -> x1 x2 x3 x4 x5)))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (x2 = u5 -> x3 = u5 -> False) -> (x4 = u5 -> x5 = u5 -> False) -> (x2 = x4 -> x3 = x5 -> False) -> x1 x2 x3 x4 x5 -> x0 x2 x3 x4 x5)))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (forall x6, x6 :e u6 -> (forall x7, x7 :e u6 -> (forall x8, x8 :e u6 -> (forall x9, x9 :e u6 -> x0 x2 x3 x4 x5 -> x0 x2 x3 x6 x7 -> x0 x2 x3 x8 x9 -> x0 x4 x5 x6 x7 -> x0 x4 x5 x8 x9 -> x0 x6 x7 x8 x9 -> False)))))))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (forall x6, x6 :e u6 -> (forall x7, x7 :e u6 -> (forall x8, x8 :e u6 -> (forall x9, x9 :e u6 -> (forall x10, x10 :e u6 -> (forall x11, x11 :e u6 -> (forall x12, x12 :e u6 -> (forall x13, x13 :e u6 -> not (x1 x2 x3 x4 x5) -> not (x1 x2 x3 x6 x7) -> not (x1 x2 x3 x8 x9) -> not (x1 x2 x3 x10 x11) -> not (x1 x2 x3 x12 x13) -> not (x1 x4 x5 x6 x7) -> not (x1 x4 x5 x8 x9) -> not (x1 x4 x5 x10 x11) -> not (x1 x4 x5 x12 x13) -> not (x1 x6 x7 x8 x9) -> not (x1 x6 x7 x10 x11) -> not (x1 x6 x7 x12 x13) -> not (x1 x8 x9 x10 x11) -> not (x1 x8 x9 x12 x13) -> not (x1 x10 x11 x12 x13) -> False)))))))))))) -> not (TwoRamseyProp_atleastp u4 u6 (setminus (setprod u6 u6) (Sing (lam 2 (fun x2 : set => If_i (x2 = 0) u5 u5)))))).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
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
Definition u18 : set :=
 ordsucc u17.
Definition u19 : set :=
 ordsucc u18.
Definition u20 : set :=
 ordsucc u19.
Definition u21 : set :=
 ordsucc u20.
Definition u22 : set :=
 ordsucc u21.
Definition u23 : set :=
 ordsucc u22.
Definition u24 : set :=
 ordsucc u23.
Definition u25 : set :=
 ordsucc u24.
Definition u26 : set :=
 ordsucc u25.
Definition u27 : set :=
 ordsucc u26.
Definition u28 : set :=
 ordsucc u27.
Definition u29 : set :=
 ordsucc u28.
Definition u30 : set :=
 ordsucc u29.
Definition u31 : set :=
 ordsucc u30.
Definition u32 : set :=
 ordsucc u31.
Definition u33 : set :=
 ordsucc u32.
Definition u34 : set :=
 ordsucc u33.
Definition u35 : set :=
 ordsucc u34.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_a5a9fb17a621cee844a470c700005559275e32cbe768f4d9cb3ea114a6029638 : equip (setminus (setprod u6 u6) (Sing (lam 2 (fun x0 : set => If_i (x0 = 0) u5 u5)))) u35.
Theorem missingprop_08700fb4b48733315235e0f22ee71adb8a6b77bce98190c5c68f3db71be4e889 : (forall x0 x1 : set -> set -> set -> set -> prop, (forall x2 x3 x4 x5, x0 x2 x3 x4 x5 -> x0 x4 x5 x2 x3) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> not (x0 x2 x3 x2 x3))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> x1 x2 x3 x2 x3)) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (x2 = u5 -> x3 = u5 -> False) -> (x4 = u5 -> x5 = u5 -> False) -> x0 x2 x3 x4 x5 -> x1 x2 x3 x4 x5)))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (x2 = u5 -> x3 = u5 -> False) -> (x4 = u5 -> x5 = u5 -> False) -> (x2 = x4 -> x3 = x5 -> False) -> x1 x2 x3 x4 x5 -> x0 x2 x3 x4 x5)))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (forall x6, x6 :e u6 -> (forall x7, x7 :e u6 -> (forall x8, x8 :e u6 -> (forall x9, x9 :e u6 -> x0 x2 x3 x4 x5 -> x0 x2 x3 x6 x7 -> x0 x2 x3 x8 x9 -> x0 x4 x5 x6 x7 -> x0 x4 x5 x8 x9 -> x0 x6 x7 x8 x9 -> False)))))))) -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (forall x4, x4 :e u6 -> (forall x5, x5 :e u6 -> (forall x6, x6 :e u6 -> (forall x7, x7 :e u6 -> (forall x8, x8 :e u6 -> (forall x9, x9 :e u6 -> (forall x10, x10 :e u6 -> (forall x11, x11 :e u6 -> (forall x12, x12 :e u6 -> (forall x13, x13 :e u6 -> not (x1 x2 x3 x4 x5) -> not (x1 x2 x3 x6 x7) -> not (x1 x2 x3 x8 x9) -> not (x1 x2 x3 x10 x11) -> not (x1 x2 x3 x12 x13) -> not (x1 x4 x5 x6 x7) -> not (x1 x4 x5 x8 x9) -> not (x1 x4 x5 x10 x11) -> not (x1 x4 x5 x12 x13) -> not (x1 x6 x7 x8 x9) -> not (x1 x6 x7 x10 x11) -> not (x1 x6 x7 x12 x13) -> not (x1 x8 x9 x10 x11) -> not (x1 x8 x9 x12 x13) -> not (x1 x10 x11 x12 x13) -> False)))))))))))) -> not (TwoRamseyProp 4 6 35)).
admit.
Qed.
