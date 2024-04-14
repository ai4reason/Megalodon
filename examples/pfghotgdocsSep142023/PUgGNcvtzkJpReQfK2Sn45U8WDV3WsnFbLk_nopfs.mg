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
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = Empty).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem missingprop_6e647c4b45e4fa58103006b82d03b760d3cc12e2b54a94fc09cdbc9261d55759 : (forall x0, forall x1 : set -> set -> prop, x1 (setprod x0 0) 0 -> x1 0 (setprod x0 0)).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Axiom missingprop_b1ab55fb3adc1f5608875c7150ec0901fc5d8b2cbdf1e5df6d670947db1f7326 : (forall x0, equip 0 x0 -> x0 = 0).
Axiom equip_ref : (forall x0, equip x0 x0).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom SingI : (forall x0, x0 :e Sing x0).
(* Parameter combine_funcs "f0267e2cbae501ea3433aecadbe197ba8f39c96e80326cc5981a1630fda29909" "ccac4354446ce449bb1c967fa332cdf48b070fc032d9733e4c1305fb864cb72a" *)
Parameter combine_funcs : set -> set -> (set -> set) -> (set -> set) -> set -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter Inj0 "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" "8143218ffde429ff34b20ee5c938914c75e40d59cd52cc5db4114971d231ca73" *)
Parameter Inj0 : set -> set.
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
Axiom missingprop_b6961926aadf85665852392f583ee4d9244a4c9e2652b11ec190e8e3e49588b9 : (forall x0 x1, forall x2 : set -> prop, (forall x3, x3 :e x0 -> x2 (Inj0 x3)) -> (forall x3, x3 :e x1 -> x2 (Inj1 x3)) -> (forall x3, x3 :e setsum x0 x1 -> x2 x3)).
Axiom combine_funcs_eq1 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj0 x4)) (x2 x4) -> x5 (x2 x4) (combine_funcs x0 x1 x2 x3 (Inj0 x4))).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Axiom combine_funcs_eq2 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj1 x4)) (x3 x4) -> x5 (x3 x4) (combine_funcs x0 x1 x2 x3 (Inj1 x4))).
Axiom setprod_mon1 : (forall x0 x1 x2, x1 c= x2 -> setprod x0 x1 c= setprod x0 x2).
Axiom setminus_Subq : (forall x0 x1, setminus x0 x1 c= x0).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
Theorem missingprop_b67c3f99b7dcb350283e28e0205622aac5c4480ca587d55b1fc9b439a7a164e1 : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (mul_nat x0 x1) (setprod x2 x3)).
admit.
Qed.
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
Definition u36 : set :=
 ordsucc u35.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_5 : nat_p 5.
Axiom nat_4 : nat_p 4.
Axiom missingprop_bb0cce2a8a891fc83c2d273bca3870e6d95b58f7c38b76aa14bb34832a6eb7db : add_nat 6 4 = 10.
Theorem missingprop_1405da4ddbfe657be591ff3f60e81b00e85c15d650392cce4bd374f2be095ac2 : add_nat u6 u6 = u12.
admit.
Qed.
Axiom nat_1 : nat_p 1.
Axiom mul_nat_1R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 1) x0 -> x1 x0 (mul_nat x0 1)).
Theorem missingprop_9ddae96be280814fd275777a271d36e42df3901b45e8e956b9ea9ad4753ab1fe : mul_nat u6 u2 = u12.
admit.
Qed.
Axiom nat_11 : nat_p 11.
Axiom add_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = add_nat x1 x0)).
Axiom nat_6 : nat_p 6.
Axiom missingprop_df15fb7a07da4a2b5124ddea4e33f012b3f09ace77b002ed675c7b110878b43a : add_nat 11 6 = 17.
Theorem missingprop_e115483b7637d74d2bed988693ecd9b7ee9db505056b8d7ed213cc8365ad60d2 : add_nat u6 u12 = u18.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Theorem missingprop_baac09b8a41cf451bf4d8767e8eb03d0a0f23c2e05dd99c9aa5fab2c8144d336 : mul_nat u6 u3 = u18.
admit.
Qed.
Axiom nat_17 : nat_p 17.
Axiom nat_16 : nat_p 16.
Axiom missingprop_dd3938713573242af0c4fea8e90696a5a614e277ed0440a5717dd66ee9d68a70 : add_nat 16 6 = 22.
Theorem missingprop_7e42d863a2da206833e8577240b54850581abf0ebc27fdaeb892f6b06774a830 : add_nat u6 u18 = u24.
admit.
Qed.
Axiom nat_3 : nat_p 3.
Theorem missingprop_5739bd2c30c42b1cef616b7ab0141364fc0bacb1d7cf0df36fca5d0d1b298c8e : mul_nat u6 u4 = u24.
admit.
Qed.
Axiom missingprop_53b5d6a493506e855393f47f611cdb01725e1da6599106a059647b3426c60f8b : add_nat 24 6 = 30.
Theorem missingprop_1347a1d753dde2ac4bbd3155e8c7392ecd33d2ac3c4c2f2aa872a1bf71e883d9 : mul_nat u6 u5 = u30.
admit.
Qed.
Axiom missingprop_a7f3578ada9cacf1cb3296f5290d2c691e8a6f96bb11bbe9193ef025e25fc69a : nat_p u24.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem missingprop_12d4f070cde272005208a956be7c68072a214891c891a748c20b9d965edfb16c : nat_p u25.
admit.
Qed.
Theorem missingprop_289054093170089dbe39b1d15aa65cd476b1f9d33d6fb8e39a1c75742ce9ba86 : nat_p u26.
admit.
Qed.
Theorem missingprop_f5b8583d73a2efa339efab10375e1f72c07bd63d6625dbe8cc0533691448c99e : nat_p u27.
admit.
Qed.
Theorem missingprop_19eb527c16e85f008233bfa7810fc904fefbad1cde11b2548e04c03415cf0dfb : nat_p u28.
admit.
Qed.
Theorem missingprop_284d738845c8dd922b78ea459f21b9b25f6f03e2ba8a0191bbde5e72cd637417 : nat_p u29.
admit.
Qed.
Theorem missingprop_18e90a1c9e5d1a2f9712563813c3b99c451e17d7e45a6309a88f3e56013df4c7 : nat_p u30.
admit.
Qed.
Theorem missingprop_723dd01f4e3b6ead0b114b6935717dcf3e97da79c873ecf977038ff266453fe1 : nat_p u31.
admit.
Qed.
Theorem missingprop_e20297641bb65d9e51ebac2e053948365a3f53b65d223d41920ce90b2e26b533 : nat_p u32.
admit.
Qed.
Theorem missingprop_176b77e9dd5a04af2e6894f4be5e1bdf5368375bafa51d5f0b9802d23d85e4bf : nat_p u33.
admit.
Qed.
Theorem missingprop_3dad49cdb0b46d482652f9ab64d8695df650b7c7dfa1daf758686cc12275038b : nat_p u34.
admit.
Qed.
Theorem missingprop_a3e012c06fe7317676acef57a26f1aa9ca775c2316f0b3234deabb524335c66f : nat_p u35.
admit.
Qed.
Theorem missingprop_d1b27c3d1761fa8745bfe5696cdbece7f50f914ee66cd8afa5f2a9a031840658 : nat_p u36.
admit.
Qed.
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_c0bdb251443e80b4627516c6606f4beb503150ad0baf4123d259f0f7768a57bd : add_nat u6 u30 = u36.
admit.
Qed.
Theorem missingprop_cd2abc9a9ea77fa61ee84765e1ca3a91f36a1f29e455a4bb2f3f1707f68cbca0 : mul_nat u6 u6 = u36.
admit.
Qed.
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Theorem missingprop_1406677f0460d5e610e1d51da3b7548f6b94ae5487a864770cbbc36f240c53d4 : equip (setprod u6 u6) u36.
admit.
Qed.
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem missingprop_20ec276501d9ecb91e40cc4525c5a2c0798ab59924056be0d591bc4dcbb72338 : (forall x0 x1 x2, x2 :e x0 -> (forall x3 : set -> set, bij x0 x1 x3 -> bij (setminus x0 (Sing x2)) (setminus x1 (Sing (x3 x2))) x3)).
admit.
Qed.
Axiom missingprop_6f2f2ee827c101dfeaaaeb47a7a909e08072923ce7f6e05ca4a992c53bc3f486 : (forall x0, nat_p x0 -> (forall x1, x1 :e ordsucc x0 -> equip x0 (setminus (ordsucc x0) (Sing x1)))).
Axiom In_5_6 : 5 :e 6.
Theorem missingprop_a5a9fb17a621cee844a470c700005559275e32cbe768f4d9cb3ea114a6029638 : equip (setminus (setprod u6 u6) (Sing (lam 2 (fun x0 : set => If_i (x0 = 0) u5 u5)))) u35.
admit.
Qed.
