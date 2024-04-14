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
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom missingprop_bc7bb32ef10cfe64d441ac6f7b6d6067caca25b88a2ca005e873f54e22a2dcde : add_nat 32 8 = 40.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter TwoRamseyProp_atleastp "947fb9a2bd96c9c3a0cefb7f346e15d36deca0943732fc3ea9bc3a588c7ad8f8" "6d86bb255886d154fd0886829fc7d7f8411add3db54738041d14766df3b5c4fa" *)
Parameter TwoRamseyProp_atleastp : set -> set -> set -> prop.
Axiom missingprop_217e5145b65197888461a6aa126b20121c0d56dc8d69d44ac11b973377d98f71 : (forall x0 x1 x2 x3, nat_p x2 -> nat_p x3 -> TwoRamseyProp_atleastp (ordsucc x0) x1 x2 -> TwoRamseyProp_atleastp x0 (ordsucc x1) x3 -> TwoRamseyProp (ordsucc x0) (ordsucc x1) (ordsucc (add_nat x2 x3))).
Axiom missingprop_e20297641bb65d9e51ebac2e053948365a3f53b65d223d41920ce90b2e26b533 : nat_p 32.
Axiom nat_8 : nat_p 8.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom TwoRamseyProp_3_7_32 : TwoRamseyProp 3 7 32.
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Axiom missingprop_678f269783f56623b590ce1d631178bc95b1ef296ba955ebeddcd0dc31626e86 : (forall x0, TwoRamseyProp_atleastp 2 x0 x0).
Theorem TwoRamseyProp_3_8_41 : TwoRamseyProp 3 8 41.
admit.
Qed.
(* Parameter exp_nat "4ce015b98f266293ef85ef9898e1d8f66f4d9664bd9601197410d96354105016" "37c5310c8da5c9f9db9152285b742d487f1a5b1bd7c73a4207d40bcd4f4d13fb" *)
Parameter exp_nat : set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
Axiom missingprop_1b73e01bc234ba0e318bc9baf16604d4f0fc12bea57885439d70438de4eb7174 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Axiom nat_6 : nat_p 6.
(* Parameter Sigma_nat "fe76b47a5f32ff63e53ad37345050d53c5d1a01e5329020a0bf0ef19cc813da7" "0b45fcf3d1875079a5444d1fc3394e8b181d424e1b77602a553a5f03e8351721" *)
Parameter Sigma_nat : set -> (set -> set) -> set.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom missingprop_1b79dfbb43b0cc3437aae6976d9ab14a8460c88de672bd4d288d42598976082b : Sigma_nat 6 (fun x1 : set => mul_nat (ap (lam 6 (fun x2 : set => If_i (x2 = 0) 1 (If_i (x2 = 1) 0 (If_i (x2 = 2) 0 (If_i (x2 = 3) 1 (If_i (x2 = 4) 0 1)))))) x1) (exp_nat 2 x1)) = 41.
Axiom missingprop_c741761a4cfde6107df9be6f245ef1dfd65e8b515dba3ea0060e6a63b5817580 : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e 2) -> Sigma_nat x0 (fun x2 : set => mul_nat (x1 x2) (exp_nat 2 x2)) :e exp_nat 2 x0)).
Axiom cases_6 : (forall x0, x0 :e 6 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 x0)).
Axiom tuple_6_0_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0) x0 -> x6 x0 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0)).
Axiom In_1_2 : 1 :e 2.
Axiom tuple_6_1_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 1) x1 -> x6 x1 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 1)).
Axiom In_0_2 : 0 :e 2.
Axiom tuple_6_2_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 2) x2 -> x6 x2 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 2)).
Axiom tuple_6_3_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 3) x3 -> x6 x3 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 3)).
Axiom tuple_6_4_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 4) x4 -> x6 x4 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 4)).
Axiom tuple_6_5_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 5) x5 -> x6 x5 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 5)).
Theorem missingprop_a2d5e99b6fe9290abe2cdc8190514e52008783dc6767ecd3bb7890e9d9df1cb8 : atleastp 41 (exp_nat 2 6).
admit.
Qed.
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_f5822e9d5891900b4c653eab5e89c5bb71543e61fe2c332750489ecd340604eb : (forall x0, nat_p x0 -> equip (Power x0) (exp_nat 2 x0)).
Theorem TwoRamseyProp_3_8_Power_6 : TwoRamseyProp 3 8 (Power 6).
admit.
Qed.
(* Parameter Subq "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" "81c0efe6636cef7bc8041820a3ebc8dc5fa3bc816854d8b7f507e30425fc1cef" *)
Parameter Subq : set -> set -> prop.
Axiom missingprop_5b7536e138ce2802b7ff71fe1112d72a83e0e7fe4b94027c8a3d1f1cacfae786 : (forall x0 x1 x2 x3, x2 c= x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Axiom missingprop_ed9ae380d91bb4eef6a9133f8865237c6a1236bcf056f5e6c2e3787bb8a1ba4a : (forall x0, Power x0 c= Power (ordsucc x0)).
Theorem TwoRamseyProp_3_8_Power_7 : TwoRamseyProp 3 8 (Power 7).
admit.
Qed.
Theorem TwoRamseyProp_3_8_Power_8 : TwoRamseyProp 3 8 (Power 8).
admit.
Qed.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom missingprop_1a8ef7119409201047d8cb04fc57c6c2b31fe9c149f99c6d6378838840c55565 : add_nat 23 8 = 31.
Theorem missingprop_7a2d9a89ff673f9791786be480f778e39314e52dbede4332352d152283ae0666 : add_nat 23 9 = 32.
admit.
Qed.
Axiom nat_9 : nat_p 9.
Theorem missingprop_2271fd260c53267fa9f5296a3f34b8c33d1b0842a2fee2af1d55ac4df7896808 : add_nat 23 10 = 33.
admit.
Qed.
Axiom nat_10 : nat_p 10.
Theorem missingprop_d1be352da0a925256de82ab56f727bdb6023e53ad7a9f08830b5807cd4a3e556 : add_nat 23 11 = 34.
admit.
Qed.
Axiom nat_11 : nat_p 11.
Theorem missingprop_564d072b65cfaa0a3fa2c4ea6b39aa7d06f0066a56a783eab00e49c33252e1e4 : add_nat 23 12 = 35.
admit.
Qed.
Axiom nat_12 : nat_p 12.
Theorem missingprop_eb92940c5bfa9563f81580599b4e26f54e5886a9b4ddd68b5031cfdee22ae586 : add_nat 23 13 = 36.
admit.
Qed.
Axiom nat_13 : nat_p 13.
Theorem missingprop_322f687261e384f025b72e65c5d3ddae516c7e92c5f39c6f56ff049492046707 : add_nat 23 14 = 37.
admit.
Qed.
Axiom nat_14 : nat_p 14.
Theorem missingprop_f5ff4a1505bc4b0f9ffa757e864431e52dbc38bf4399b9b520502eab02ae5dc5 : add_nat 23 15 = 38.
admit.
Qed.
Axiom nat_15 : nat_p 15.
Theorem missingprop_69a42b32607d05e02328b4743ce14fa52b1374a8933a834fc8366ef8cf949d0e : add_nat 23 16 = 39.
admit.
Qed.
Axiom nat_16 : nat_p 16.
Theorem missingprop_1871a7326a739d2e5a1c5a193f39d36fcf39c668bbe0796ca129e886d609d73d : add_nat 23 17 = 40.
admit.
Qed.
Axiom missingprop_b1cbd49965c5cf09bf2752439c1e5c9e5fec2e21bac8c32a5ed180b4cfbebead : add_nat 11 12 = 23.
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Theorem missingprop_5a2415de7ce4ff7700953952ab57e066439372e1e8be58d2e9591f8d16f23b1d : nat_p 23.
admit.
Qed.
Axiom nat_17 : nat_p 17.
Axiom TwoRamseyProp_4_4_23 : TwoRamseyProp 4 4 23.
Axiom TwoRamseyProp_3_5_17 : TwoRamseyProp 3 5 17.
Theorem TwoRamseyProp_4_5_41 : TwoRamseyProp 4 5 41.
admit.
Qed.
Theorem TwoRamseyProp_4_5_Power_6 : TwoRamseyProp 4 5 (Power 6).
admit.
Qed.
Theorem TwoRamseyProp_4_5_Power_7 : TwoRamseyProp 4 5 (Power 7).
admit.
Qed.
Theorem TwoRamseyProp_4_5_Power_8 : TwoRamseyProp 4 5 (Power 8).
admit.
Qed.
