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
Axiom TwoRamseyProp_3_4_9 : TwoRamseyProp 3 4 9.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_9ece6f40395229b169941246ff040e46cf012bcbdb92ec4dfd4e73a8a564f46e : add_nat u9 u1 = u10.
admit.
Qed.
Definition u11 : set :=
 ordsucc u10.
Axiom nat_1 : nat_p 1.
Theorem missingprop_92ea8aa44243f902039747bab1b2ebb9559bb03ac7d66c515215488626da18bf : add_nat u9 u2 = u11.
admit.
Qed.
Definition u12 : set :=
 ordsucc u11.
Axiom nat_2 : nat_p 2.
Theorem missingprop_b996e21ed0149e0b0ce8e5b598ae7796b5eb05bb0d5018e2cfa30032e1729c12 : add_nat u9 u3 = u12.
admit.
Qed.
Definition u13 : set :=
 ordsucc u12.
Axiom nat_3 : nat_p 3.
Theorem missingprop_d7fe278b459b2e36e4b2abf60a31f0dbe328b2999b103185c5db3bf51a082412 : add_nat u9 u4 = u13.
admit.
Qed.
Definition u14 : set :=
 ordsucc u13.
Axiom nat_4 : nat_p 4.
Theorem missingprop_e8139b4d35009943e50ba55c94172d08eb78b60f8fe4cab1d5f9f7c316f116d5 : add_nat u9 u5 = u14.
admit.
Qed.
Definition u15 : set :=
 ordsucc u14.
(* Parameter TwoRamseyProp_atleastp "947fb9a2bd96c9c3a0cefb7f346e15d36deca0943732fc3ea9bc3a588c7ad8f8" "6d86bb255886d154fd0886829fc7d7f8411add3db54738041d14766df3b5c4fa" *)
Parameter TwoRamseyProp_atleastp : set -> set -> set -> prop.
Axiom missingprop_217e5145b65197888461a6aa126b20121c0d56dc8d69d44ac11b973377d98f71 : (forall x0 x1 x2 x3, nat_p x2 -> nat_p x3 -> TwoRamseyProp_atleastp (ordsucc x0) x1 x2 -> TwoRamseyProp_atleastp x0 (ordsucc x1) x3 -> TwoRamseyProp (ordsucc x0) (ordsucc x1) (ordsucc (add_nat x2 x3))).
Axiom nat_9 : nat_p 9.
Axiom nat_5 : nat_p 5.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Axiom missingprop_678f269783f56623b590ce1d631178bc95b1ef296ba955ebeddcd0dc31626e86 : (forall x0, TwoRamseyProp_atleastp 2 x0 x0).
Theorem TwoRamseyProp_u3_u5_u15 : TwoRamseyProp u3 u5 u15.
admit.
Qed.
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Definition u16 : set :=
 ordsucc u15.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
(* Parameter Subq "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" "81c0efe6636cef7bc8041820a3ebc8dc5fa3bc816854d8b7f507e30425fc1cef" *)
Parameter Subq : set -> set -> prop.
Axiom Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
(* Parameter exp_nat "4ce015b98f266293ef85ef9898e1d8f66f4d9664bd9601197410d96354105016" "37c5310c8da5c9f9db9152285b742d487f1a5b1bd7c73a4207d40bcd4f4d13fb" *)
Parameter exp_nat : set -> set -> set.
Axiom missingprop_18dab10013860d442d73fc2b55cfee57e61b2e3044d2d0c29767dba9e5eb2112 : exp_nat 2 4 = 16.
Axiom missingprop_f5822e9d5891900b4c653eab5e89c5bb71543e61fe2c332750489ecd340604eb : (forall x0, nat_p x0 -> equip (Power x0) (exp_nat 2 x0)).
Theorem TwoRamseyProp_3_5_Power_4 : TwoRamseyProp 3 5 (Power 4).
admit.
Qed.
