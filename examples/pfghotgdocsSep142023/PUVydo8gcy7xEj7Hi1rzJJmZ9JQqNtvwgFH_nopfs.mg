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
(* Parameter struct_b_b_e_e "af2850387310cf676e35267e10a14affc439a209ad200b7edc42d8142611fcd4" "7685bdf4f6436a90f8002790ede7ec64e03b146138f7d85bc11be7d287d3652b" *)
Parameter struct_b_b_e_e : set -> prop.
(* Parameter pack_b_b_e_e "0ca5ba562d2ab04221b86aded545ed077bf3a2f06e21344f04ba0b43521b231e" "6859fb13a44929ca6d7c0e598ffc6a6f82969c8cfe5edda33f1c1d81187b9d31" *)
Parameter pack_b_b_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition decode_b : set -> set -> set -> set :=
 (fun x0 x1 : set => ap (ap x0 x1)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom struct_b_b_e_e_eta : (forall x0, struct_b_b_e_e x0 -> x0 = pack_b_b_e_e (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (ap x0 3) (ap x0 4)).
Axiom pack_struct_b_b_e_e_E1 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 :e x0))).
Axiom pack_struct_b_b_e_e_E2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 :e x0))).
Axiom pack_struct_b_b_e_e_E3 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> x3 :e x0).
Axiom pack_struct_b_b_e_e_E4 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> x4 :e x0).
Definition K_field_0 : set -> set -> set :=
 (fun x0 x1 : set => ap x1 0).
Definition K_field_1_b : set -> set -> set -> set -> set :=
 (fun x0 x1 : set => decode_b (ap x1 1)).
Definition K_field_2_b : set -> set -> set -> set -> set :=
 (fun x0 x1 : set => decode_b (ap x1 2)).
Definition K_field_3 : set -> set -> set :=
 (fun x0 x1 : set => ap x1 3).
Definition K_field_4 : set -> set -> set :=
 (fun x0 x1 : set => ap x1 4).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter unpack_b_b_e_e_o "eb93435a79c01148fc12dd7779795d68cc2251130dc7633623f16664d25ed072" "1bcc21b2f13824c926a364c5b001d252d630f39a0ebe1f8af790facbe0f63a11" *)
Parameter unpack_b_b_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop) -> prop.
(* Parameter explicit_CRing_with_id "e617a2c69bd7575dc6ebd47c67ca7c8b08c0c22a914504a403e3db24ee172987" "83e7eeb351d92427c0d3bb2bd24e83d0879191c3aa01e7be24fb68ffdbb9060c" *)
Parameter explicit_CRing_with_id : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Definition CRing_with_id : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_CRing_with_id x1 x4 x5 x2 x3))).
Theorem missingprop_50ae0d1c45204b46a4fcc7a6bee445594122c11b111b42c080baae0465265b26 : (forall x0, CRing_with_id x0 -> x0 = pack_b_b_e_e (K_field_0 x0 x0) (K_field_1_b x0 x0) (K_field_2_b x0 x0) (K_field_3 x0 x0) (K_field_4 x0 x0)).
admit.
Qed.
Axiom CRing_with_id_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : prop -> prop -> prop, x5 (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_CRing_with_id x6 x9 x10 x7 x8)) (explicit_CRing_with_id x0 x3 x4 x1 x2) -> x5 (explicit_CRing_with_id x0 x3 x4 x1 x2) (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_CRing_with_id x6 x9 x10 x7 x8))).
Theorem missingprop_620ffb99334644ce6d84dac094a93959dcbad49b5f958ee36dfecb96ab136891 : (forall x0, CRing_with_id x0 -> explicit_CRing_with_id (K_field_0 x0 x0) (K_field_3 x0 x0) (K_field_4 x0 x0) (K_field_1_b x0 x0) (K_field_2_b x0 x0)).
admit.
Qed.
Theorem missingprop_367a75c6b8bf5f61e0a46f6b598edb93a655b70e4732923ac22f94c52d814ea1 : (forall x0, CRing_with_id x0 -> K_field_3 x0 x0 :e K_field_0 x0 x0).
admit.
Qed.
Theorem missingprop_1a3d25fd41b7c3c508a2fe54709eb7f884df8973d52168382e0bc01da2bfd1d5 : (forall x0, CRing_with_id x0 -> K_field_4 x0 x0 :e K_field_0 x0 x0).
admit.
Qed.
Theorem missingprop_fd8780fbed61ca272b11706395da54d2d31e56a004ea175904da8ec787a7de9a : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> K_field_1_b x0 x0 x1 x2 :e K_field_0 x0 x0))).
admit.
Qed.
Theorem missingprop_83ca4313fe8b0637c2e8068a8b92f4bb986f1989193702cbeb0baf134d146d34 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 x1 x2 :e K_field_0 x0 x0))).
admit.
Qed.
Axiom explicit_CRing_with_id_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_CRing_with_id x0 x1 x2 x3 x4 -> x5).
Theorem missingprop_1d2af599d4361e61b5438a142221829b2fe3c1a0f7e4c6a05fcb80fc3c12d7d2 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> (forall x3, x3 :e K_field_0 x0 x0 -> K_field_1_b x0 x0 x1 (K_field_1_b x0 x0 x2 x3) = K_field_1_b x0 x0 (K_field_1_b x0 x0 x1 x2) x3)))).
admit.
Qed.
Theorem missingprop_2fc413d43aea86f8bbe741959128df112a6760ef5a90cfb6d9f122fc2695b822 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> K_field_1_b x0 x0 x1 x2 = K_field_1_b x0 x0 x2 x1))).
admit.
Qed.
Theorem missingprop_2c58d78a1b9eeda4444de91f9fbb6f4ec1b55dd905edc5712dd07a12fbf77e48 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> K_field_1_b x0 x0 (K_field_3 x0 x0) x1 = x1)).
admit.
Qed.
Theorem missingprop_7da0d9350ec7aff3d68d46c4af13c19a293a88f84dd6fea778c21459466c0b5e : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2 : prop, (forall x3, and (x3 :e K_field_0 x0 x0) (K_field_1_b x0 x0 x1 x3 = K_field_3 x0 x0) -> x2) -> x2))).
admit.
Qed.
Theorem missingprop_2158545e269613e724f54292aa90e7703073f5e2a9b04f7b6fefdd8dc882a88f : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> (forall x3, x3 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 x1 (K_field_2_b x0 x0 x2 x3) = K_field_2_b x0 x0 (K_field_2_b x0 x0 x1 x2) x3)))).
admit.
Qed.
Theorem missingprop_ec3d3d5378c24600f44cfd46dcc625e687044d4b8014b4d6229529959afb3fb4 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 x1 x2 = K_field_2_b x0 x0 x2 x1))).
admit.
Qed.
Theorem missingprop_a2480fb0eb250a911955c4d5090613e9df1c0925ce7af3f2c81053645b861657 : (forall x0, CRing_with_id x0 -> K_field_4 x0 x0 = K_field_3 x0 x0 -> (forall x1 : prop, x1)).
admit.
Qed.
Theorem missingprop_6790bfb1084e54a662599ffbd2a505ea724706951dc535759f7c4c6075e28526 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 (K_field_4 x0 x0) x1 = x1)).
admit.
Qed.
Theorem missingprop_4959dbed27d41cb0190c2852e1b77b707917290cbd15966976d724b816c34710 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> (forall x3, x3 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 x1 (K_field_1_b x0 x0 x2 x3) = K_field_1_b x0 x0 (K_field_2_b x0 x0 x1 x2) (K_field_2_b x0 x0 x1 x3))))).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd : set -> set -> set -> set :=
 (fun x0 x1 : set => nat_primrec (K_field_4 x0 x0) (fun x2 : set => K_field_2_b x0 x0 x1)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem missingprop_4ab72f93767fc325730724758d3093e7af2a82217c4d5ee8a2692818e418bf07 : (forall x0, CRing_with_id x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 0) (K_field_4 x0 x0) -> x2 (K_field_4 x0 x0) (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 0))).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem missingprop_99ced72b0a1cc72e56a6449ae7f85ace98b316636257ef59b14e002a0cde881d : (forall x0, CRing_with_id x0 -> (forall x1 x2, x2 :e omega -> missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 (ordsucc x2) = K_field_2_b x0 x0 x1 (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 x2))).
admit.
Qed.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_0 : nat_p 0.
Theorem missingprop_d42950c3f12a0a1bd59ad028e6131cf8cd8c077fb27dae2f0fb2adeb65747c62 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 1 = x1)).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Theorem missingprop_b75e15b7618f186de797a9c3b946547093a25c925a7003e20116b4ad0756b295 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e omega -> missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 x2 :e K_field_0 x0 x0))).
admit.
Qed.
Definition missingname_25c088bee985c8417791953f071cde0d58fde2c01a0feebef230ecc6e6b2ea9a : set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 : set => nat_primrec (K_field_3 x0 x0) (fun x4 : set => K_field_1_b x0 x0 (K_field_2_b x0 x0 (ap x2 x4) (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x3 x4))) x1).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_97f301baaeb5b52ee78dbd18443b931b008a56f14a9bb9eb1084104f77cb3821 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e omega -> (forall x2, x2 :e setexp (K_field_0 x0 x0) x1 -> (forall x3, x3 :e K_field_0 x0 x0 -> missingname_25c088bee985c8417791953f071cde0d58fde2c01a0feebef230ecc6e6b2ea9a x0 x1 x2 x3 :e K_field_0 x0 x0)))).
admit.
Qed.
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Definition Field : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_Field x1 x4 x5 x2 x3))).
Theorem missingprop_e08b2452b1a2fc464ffe03692b94bd4650b3a041709d65cf5d5d9c41083a3cb8 : (forall x0, Field x0 -> x0 = pack_b_b_e_e (K_field_0 x0 x0) (K_field_1_b x0 x0) (K_field_2_b x0 x0) (K_field_3 x0 x0) (K_field_4 x0 x0)).
admit.
Qed.
Axiom Field_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : prop -> prop -> prop, x5 (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Field x6 x9 x10 x7 x8)) (explicit_Field x0 x3 x4 x1 x2) -> x5 (explicit_Field x0 x3 x4 x1 x2) (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Field x6 x9 x10 x7 x8))).
Theorem missingprop_5f0019877ed9bf35558b7b2259318ccbc44ea1169754235304514217d00430a6 : (forall x0, Field x0 -> explicit_Field (K_field_0 x0 x0) (K_field_3 x0 x0) (K_field_4 x0 x0) (K_field_1_b x0 x0) (K_field_2_b x0 x0)).
admit.
Qed.
Theorem missingprop_474c718b1d1d7fe64eadf0267dbdd9c009d2858d7e0d630226c1e990d6a5059d : (forall x0, Field x0 -> K_field_3 x0 x0 :e K_field_0 x0 x0).
admit.
Qed.
Theorem missingprop_c6ed175c2b6539cb1451c89ebf9ce46ff4006412b5be21f3f9ef8ae1d81b10c0 : (forall x0, Field x0 -> K_field_4 x0 x0 :e K_field_0 x0 x0).
admit.
Qed.
Theorem missingprop_4fca810e20748563929ae38c2f12ddad124bf297a017b3c0c14bd379a120c9f6 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> K_field_1_b x0 x0 x1 x2 :e K_field_0 x0 x0))).
admit.
Qed.
Theorem missingprop_6c6c06a9cf1d6d0ab75358a5bf72715769aad5016bd6e0ae821fb9de263b486a : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 x1 x2 :e K_field_0 x0 x0))).
admit.
Qed.
Axiom explicit_Field_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (x6 = x1 -> (forall x7 : prop, x7)) -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x4 x6 x8 = x2) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_Field x0 x1 x2 x3 x4 -> x5).
Theorem missingprop_7edc54e22543681c7d362fa2c73c2557dd86246b55ea87b887f7bcf830f6dbeb : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> (forall x3, x3 :e K_field_0 x0 x0 -> K_field_1_b x0 x0 x1 (K_field_1_b x0 x0 x2 x3) = K_field_1_b x0 x0 (K_field_1_b x0 x0 x1 x2) x3)))).
admit.
Qed.
Theorem missingprop_861cd10b3c1d91376494a239fe487d770ea1a430fd65bdc65c296a89dcbdc677 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> K_field_1_b x0 x0 x1 x2 = K_field_1_b x0 x0 x2 x1))).
admit.
Qed.
Theorem missingprop_b85ad3f9fbae986426b60f63b583df21bb13dcc5946279c75cf38a96cc7cc709 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> K_field_1_b x0 x0 (K_field_3 x0 x0) x1 = x1)).
admit.
Qed.
Theorem missingprop_0cefbe6de07fcc03a72fdd2231ae254b4b084a6a1a78043928689d8b5b80d429 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2 : prop, (forall x3, and (x3 :e K_field_0 x0 x0) (K_field_1_b x0 x0 x1 x3 = K_field_3 x0 x0) -> x2) -> x2))).
admit.
Qed.
Theorem missingprop_adb400673adcafab0c567d640fe0aa534c5640e8d0db1c88d9cb517ecdacd026 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> (forall x3, x3 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 x1 (K_field_2_b x0 x0 x2 x3) = K_field_2_b x0 x0 (K_field_2_b x0 x0 x1 x2) x3)))).
admit.
Qed.
Theorem missingprop_3a57b8455a94a68d5f03df390e7a690ecee02521a5b0b0bc72a649351af8f651 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 x1 x2 = K_field_2_b x0 x0 x2 x1))).
admit.
Qed.
Theorem missingprop_2bf677fd22cb58b1b416a024b76b0ab78d81c04dfd7a2124c4732ee6daf50e0b : (forall x0, Field x0 -> K_field_4 x0 x0 = K_field_3 x0 x0 -> (forall x1 : prop, x1)).
admit.
Qed.
Theorem missingprop_9b9979a5e0240a29e2c008081e89ffa24eb3801101bc9651669857cb419193b2 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 (K_field_4 x0 x0) x1 = x1)).
admit.
Qed.
Theorem missingprop_42c10093362e32c14fc1fb0fe4cdcdf964fd23a080978018c8059be9c77cc7f2 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (x1 = K_field_3 x0 x0 -> (forall x2 : prop, x2)) -> (forall x2 : prop, (forall x3, and (x3 :e K_field_0 x0 x0) (K_field_2_b x0 x0 x1 x3 = K_field_4 x0 x0) -> x2) -> x2))).
admit.
Qed.
Theorem missingprop_ba251f9ee66875cd180aed27335d6701534aa9ac1c8c0f02082170ae07d014fa : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e K_field_0 x0 x0 -> (forall x3, x3 :e K_field_0 x0 x0 -> K_field_2_b x0 x0 x1 (K_field_1_b x0 x0 x2 x3) = K_field_1_b x0 x0 (K_field_2_b x0 x0 x1 x2) (K_field_2_b x0 x0 x1 x3))))).
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => If_i (and (x1 :e K_field_0 x0 x0) (x2 :e setminus (K_field_0 x0 x0) (Sing (K_field_3 x0 x0)))) (Eps_i (fun x3 : set => and (x3 :e K_field_0 x0 x0) (x1 = K_field_2_b x0 x0 x2 x3))) 0).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Theorem missingprop_c7150d4927e286c78847195d86eae8dee9cee2b3699d53f2608ff1205e48fdf5 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e setminus (K_field_0 x0 x0) (Sing (K_field_3 x0 x0)) -> and (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f x0 x1 x2 :e K_field_0 x0 x0) (x1 = K_field_2_b x0 x0 x2 (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f x0 x1 x2))))).
admit.
Qed.
Theorem missingprop_b3b79330e1f68d07d80f531dc0e715b1882e8925c43fdf7b598b6a2b8fa765c2 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e setminus (K_field_0 x0 x0) (Sing (K_field_3 x0 x0)) -> missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f x0 x1 x2 :e K_field_0 x0 x0))).
admit.
Qed.
Theorem missingprop_815de4968832d2e406bdafec1d4024566ccd9e8dcbdfe6d375431b37bd0fda26 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e setminus (K_field_0 x0 x0) (Sing (K_field_3 x0 x0)) -> x1 = K_field_2_b x0 x0 x2 (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f x0 x1 x2)))).
admit.
Qed.
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Theorem missingprop_4113dd86344f0bc17f82707dfc7952d99963d05104ba8c2a401e9966c53273ce : (forall x0, Field x0 -> (forall x1 x2, nIn x1 (K_field_0 x0 x0) -> missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f x0 x1 x2 = 0)).
admit.
Qed.
Theorem missingprop_ede8b35b10757f0a4d23f49855122d86ed9cd94967c8e85a98c4d20249bf8731 : (forall x0, Field x0 -> (forall x1 x2, nIn x2 (K_field_0 x0 x0) -> missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f x0 x1 x2 = 0)).
admit.
Qed.
Theorem missingprop_4f3b2a0a51143dce17717ed5ce38a9c9525ab09c2359fb3f90194462ea08125a : (forall x0, Field x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f x0 x1 (K_field_3 x0 x0)) 0 -> x2 0 (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f x0 x1 (K_field_3 x0 x0)))).
admit.
Qed.
Axiom Field_is_CRing_with_id : (forall x0, Field x0 -> CRing_with_id x0).
Theorem missingprop_750688e23f30e8182a3c8f445ff83a8176a73b4dad8240b7395a9d3a39206309 : (forall x0, Field x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 0) (K_field_4 x0 x0) -> x2 (K_field_4 x0 x0) (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 0))).
admit.
Qed.
Theorem missingprop_ba8e3136a81148e617afd852363aa62df70fa0802594bad10bff907987504699 : (forall x0, Field x0 -> (forall x1 x2, x2 :e omega -> missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 (ordsucc x2) = K_field_2_b x0 x0 x1 (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 x2))).
admit.
Qed.
Theorem missingprop_848020ebb1164947bb5b67df404c33baeef4019e31cd404e4b01280d1a68b331 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 1 = x1)).
admit.
Qed.
Theorem missingprop_45122d6b3c2d8e317ef83c12e24c4658c5fd0606cdefb59ab9113c3ba3fa9041 : (forall x0, Field x0 -> (forall x1, x1 :e K_field_0 x0 x0 -> (forall x2, x2 :e omega -> missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd x0 x1 x2 :e K_field_0 x0 x0))).
admit.
Qed.
Theorem missingprop_bce01fe3ae371b0f6205f8eae2d14673d67886e17d378b159b85ed34d1fb95c9 : (forall x0, Field x0 -> (forall x1, x1 :e omega -> (forall x2, x2 :e setexp (K_field_0 x0 x0) x1 -> (forall x3, x3 :e K_field_0 x0 x0 -> missingname_25c088bee985c8417791953f071cde0d58fde2c01a0feebef230ecc6e6b2ea9a x0 x1 x2 x3 :e K_field_0 x0 x0)))).
admit.
Qed.
(* Parameter RealsStruct "d29e0a271e279bed247f0e5ec6895735ab27f7eeabc9cb00a1366d5d7e7da6ca" "9971dcf75f0995efe4245a98bcdf103e4713261d35432146405052f36f8234bf" *)
Parameter RealsStruct : set -> prop.
(* Parameter Field_of_RealsStruct "ea953ac10b642a9da289025dff57d46f78a32954a0c94609646f8f83d8119728" "e1df2c6881a945043093f666186fa5159d4b31d68340b37bd2be81d10ba28060" *)
Parameter Field_of_RealsStruct : set -> set.
Axiom Field_Field_of_RealsStruct : (forall x0, RealsStruct x0 -> Field (Field_of_RealsStruct x0)).
Theorem Field_of_RealsStruct_is_CRing_with_id : (forall x0, RealsStruct x0 -> CRing_with_id (Field_of_RealsStruct x0)).
admit.
Qed.
(* Parameter RealsStruct_leq "0d90e9f1543e4460b11fd7539e39b4d40e21b02cbbfababad2dde50ffee3eb93" "e59503fd8967d408619422bdebda4be08c9654014309b60880a3d7acf647e2b4" *)
Parameter RealsStruct_leq : set -> set -> set -> prop.
Definition RealsStruct_lt : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (RealsStruct_leq x0 x1 x2) (x1 = x2 -> (forall x3 : prop, x3))).
(* Parameter field0 "e93ef2d99ea2bdae1c958288fc8e8dd480db306b692306df9415934b45bea9dd" "f0bb69e74123475b6ecce64430b539b64548b0b148267ea6c512e65545a391a1" *)
Parameter field0 : set -> set.
Theorem RealsStruct_lt_leq : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> RealsStruct_leq x0 x1 x2))).
admit.
Qed.
Theorem RealsStruct_lt_irref : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> not (RealsStruct_lt x0 x1 x1))).
admit.
Qed.
Axiom RealsStruct_leq_antisym : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_leq x0 x2 x1 -> x1 = x2))).
Theorem RealsStruct_lt_leq_asym : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> not (RealsStruct_leq x0 x2 x1)))).
admit.
Qed.
Theorem RealsStruct_leq_lt_asym : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> not (RealsStruct_lt x0 x2 x1)))).
admit.
Qed.
Theorem RealsStruct_lt_asym : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> not (RealsStruct_lt x0 x2 x1)))).
admit.
Qed.
Axiom RealsStruct_leq_tra : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_leq x0 x2 x3 -> RealsStruct_leq x0 x1 x3)))).
Theorem RealsStruct_lt_leq_tra : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> RealsStruct_leq x0 x2 x3 -> RealsStruct_lt x0 x1 x3)))).
admit.
Qed.
Theorem RealsStruct_leq_lt_tra : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_lt x0 x2 x3 -> RealsStruct_lt x0 x1 x3)))).
admit.
Qed.
Theorem RealsStruct_lt_tra : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> RealsStruct_lt x0 x2 x3 -> RealsStruct_lt x0 x1 x3)))).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom RealsStruct_leq_linear : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> or (RealsStruct_leq x0 x1 x2) (RealsStruct_leq x0 x2 x1)))).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Theorem RealsStruct_lt_trich_impred : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3 : prop, (RealsStruct_lt x0 x1 x2 -> x3) -> (x1 = x2 -> x3) -> (RealsStruct_lt x0 x2 x1 -> x3) -> x3)))).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem RealsStruct_lt_trich : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> or (or (RealsStruct_lt x0 x1 x2) (x1 = x2)) (RealsStruct_lt x0 x2 x1)))).
admit.
Qed.
Axiom RealsStruct_leq_refl : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_leq x0 x1 x1)).
Theorem RealsStruct_leq_lt_linear : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> or (RealsStruct_leq x0 x1 x2) (RealsStruct_lt x0 x2 x1)))).
admit.
Qed.
(* Parameter field4 "961c68425fb06db92e20b192ab8ef8a77db1dbc5d8807be8184193fe540784ca" "57e734ae32adddc1f13e75e7bab22241e5d2c12955ae233ee90f53818028312a" *)
Parameter field4 : set -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter natOfOrderedField_p "f97b150093ec13f84694e2b8f48becf45e4b6df2b43c1085ae7a99663116b9a6" "f1c45e0e9f9df75c62335865582f186c3ec3df1a94bc94b16d41e73bf27899f9" *)
Parameter natOfOrderedField_p : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop.
(* Parameter RealsStruct_one "520b74715d23e4ce89f2ff9de5106772f592f32c69a1d405949d1ee275f54e53" "7aa92281bc38360837d18b9ec38ff8359d55a8c6ef4349c5777aab707e79589b" *)
Parameter RealsStruct_one : set -> set.
(* Parameter field1b "67a43eaf6a510480f8a95092b8b3a8f7711ce9c72f89848a5e4ff4c0f289f5f6" "6968cd9ba47369f21e6e4d576648c6317ed74b303c8a2ac9e3d5e8bc91a68d9d" *)
Parameter field1b : set -> set -> set -> set.
(* Parameter field2b "ab3dfeb9395a1e303801e2bc8d55caf8d8513c9573264975ac8e4266deed9436" "4b4b94d59128dfa2798a2e72c886a5edf4dbd4d9b9693c1c6dea5a401c53aec4" *)
Parameter field2b : set -> set -> set -> set.
Definition RealsStruct_N : set -> set :=
 (fun x0 : set => Sep (field0 x0) (natOfOrderedField_p (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0) (RealsStruct_leq x0))).
(* Parameter explicit_Reals "e5dee14fc7a24a63555de85859904de8dc1b462044060d68dbb06cc9a590bc38" "2c81615a11c9e3e301f3301ec7862ba122acea20bfe1c120f7bdaf5a2e18faf4" *)
Parameter explicit_Reals : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
(* Parameter explicit_OrderedField "1195f96dcd143e4b896b4c1eb080d1fb877084debc58a8626d3dcf7a14ce8df7" "a18f7bca989a67fb7dc6df8e6c094372c26fa2c334578447d3314616155afb72" *)
Parameter explicit_OrderedField : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Definition lt : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 x7 : set => and (x5 x6 x7) (x6 = x7 -> (forall x8 : prop, x8))).
Axiom explicit_Reals_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_Reals x0 x1 x2 x3 x4 x5 -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x7 -> x5 x1 x8 -> (forall x9 : prop, (forall x10, and (x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x8 (x4 x10 x7)) -> x9) -> x9))) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x9, x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x7 x9) (ap x8 x9)) (x5 (ap x7 x9) (ap x7 (x3 x9 x2)))) (x5 (ap x8 (x3 x9 x2)) (ap x8 x9))) -> (forall x9 : prop, (forall x10, and (x10 :e x0) (forall x11, x11 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x7 x11) x10) (x5 x10 (ap x8 x11))) -> x9) -> x9))) -> x6) -> explicit_Reals x0 x1 x2 x3 x4 x5 -> x6).
Axiom RealsStruct_explicit_Reals : (forall x0, RealsStruct x0 -> explicit_Reals (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0) (RealsStruct_leq x0)).
Theorem RealsStruct_Arch : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_lt x0 (field4 x0) x1 -> RealsStruct_leq x0 (field4 x0) x2 -> (forall x3 : prop, (forall x4, and (x4 :e RealsStruct_N x0) (RealsStruct_leq x0 x2 (field2b x0 x4 x1)) -> x3) -> x3)))).
admit.
Qed.
Axiom Field_of_RealsStruct_0 : (forall x0, forall x1 : set -> set -> prop, x1 (ap (Field_of_RealsStruct x0) 0) (field0 x0) -> x1 (field0 x0) (ap (Field_of_RealsStruct x0) 0)).
Axiom Field_of_RealsStruct_2f : (forall x0, RealsStruct x0 -> (fun x2 : set => ap (ap (ap (Field_of_RealsStruct x0) 2) x2)) = field2b x0).
Axiom Field_of_RealsStruct_3 : (forall x0, forall x1 : set -> set -> prop, x1 (ap (Field_of_RealsStruct x0) 3) (field4 x0) -> x1 (field4 x0) (ap (Field_of_RealsStruct x0) 3)).
Theorem missingprop_4f7dcd6e0e184f869b4dbcf0b29f87df17bf34cb279f183f134bf33a4196558c : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field4 x0)) -> and (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f (Field_of_RealsStruct x0) x1 x2 :e field0 x0) (x1 = field2b x0 x2 (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f (Field_of_RealsStruct x0) x1 x2))))).
admit.
Qed.
Theorem missingprop_18ea29868cb7bdcf9694b307920c8945e6f3c1c7bdda01b86604f2921c0c9aaa : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field4 x0)) -> missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f (Field_of_RealsStruct x0) x1 x2 :e field0 x0))).
admit.
Qed.
Theorem missingprop_d2f5d6ff49915210c46f51d4b51278ffcbf67a08fb09030b15af828ebebaa22c : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field4 x0)) -> x1 = field2b x0 x2 (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f (Field_of_RealsStruct x0) x1 x2)))).
admit.
Qed.
Theorem missingprop_c6a8e5909080ed99a59596e153a4bce37f376b2711a41dbea1c046a8e1ff45a4 : (forall x0, RealsStruct x0 -> (forall x1 x2, nIn x1 (field0 x0) -> missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f (Field_of_RealsStruct x0) x1 x2 = 0)).
admit.
Qed.
Theorem missingprop_bea78e3e99760ca866366a8addb5cc78ff5955bea381cbd0a454f249f3a83487 : (forall x0, RealsStruct x0 -> (forall x1 x2, nIn x2 (field0 x0) -> missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f (Field_of_RealsStruct x0) x1 x2 = 0)).
admit.
Qed.
Theorem missingprop_ac980b9f811e57d6cd1a21c18409f85005e46040b2e6d26e3ef337bce1069404 : (forall x0, RealsStruct x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f (Field_of_RealsStruct x0) x1 (field4 x0)) 0 -> x2 0 (missingname_d57052e0361c32d888b8091985817846467f8d3f06f01a064bf1daf82c4d5c9f (Field_of_RealsStruct x0) x1 (field4 x0)))).
admit.
Qed.
Axiom Field_of_RealsStruct_4 : (forall x0, forall x1 : set -> set -> prop, x1 (ap (Field_of_RealsStruct x0) 4) (RealsStruct_one x0) -> x1 (RealsStruct_one x0) (ap (Field_of_RealsStruct x0) 4)).
Theorem missingprop_f4d03bb753a627f6bf689dfbc38942c913de5e05dc1c2149d1d4e6aaf501db21 : (forall x0, RealsStruct x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd (Field_of_RealsStruct x0) x1 0) (RealsStruct_one x0) -> x2 (RealsStruct_one x0) (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd (Field_of_RealsStruct x0) x1 0))).
admit.
Qed.
Theorem missingprop_0d153cd93262db5c0ab160606218f55e1ac5e6bf191cee31aad0a46f701e650e : (forall x0, RealsStruct x0 -> (forall x1 x2, x2 :e omega -> missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd (Field_of_RealsStruct x0) x1 (ordsucc x2) = field2b x0 x1 (missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd (Field_of_RealsStruct x0) x1 x2))).
admit.
Qed.
Theorem missingprop_a4c6a0a48d894094757f909161a693927e9a6f3d04f523a3f884b708c2ab43e6 : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd (Field_of_RealsStruct x0) x1 1 = x1)).
admit.
Qed.
Theorem missingprop_f96d0f1b431baaa977d6dbbbe255ad691ad2cbc8653f6850771e5432d169b6e3 : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e omega -> missingname_64a7c008b0f460a3dc3f283b44546876172641d1f8e6631b78d79db56722febd (Field_of_RealsStruct x0) x1 x2 :e field0 x0))).
admit.
Qed.
(* Parameter RealsStruct_Npos "2aba4a11f886ed7d2772a4203e4b5b3ed92efb7b762aac4e88b7ed51e515b123" "18dcd68b13ac8ef27a4d8dfec8909abfa78ffbb33539bea51d3397809f365642" *)
Parameter RealsStruct_Npos : set -> set.
Definition RealsStruct_divides : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : prop, (forall x4, and (x4 :e RealsStruct_Npos x0) (field2b x0 x1 x4 = x2) -> x3) -> x3).
Definition RealsStruct_Primes : set -> set :=
 (fun x0 : set => Sep (RealsStruct_N x0) (fun x1 : set => and (RealsStruct_lt x0 (RealsStruct_one x0) x1) (forall x2, x2 :e RealsStruct_Npos x0 -> RealsStruct_divides x0 x2 x1 -> or (x2 = RealsStruct_one x0) (x2 = x1)))).
Definition RealsStruct_coprime : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3, x3 :e RealsStruct_Npos x0 -> RealsStruct_divides x0 x3 x1 -> RealsStruct_divides x0 x3 x2 -> x3 = RealsStruct_one x0).
(* Parameter Field_minus "cad943ad3351894d7ba6a26fa37c5f118d52cb5656335ca3b111d786455306e6" "9072a08b056e30edab702a9b7c29162af6170c517da489a9b3eab1a982fdb325" *)
Parameter Field_minus : set -> set -> set.
Definition RealsStruct_abs : set -> set -> set :=
 (fun x0 x1 : set => If_i (RealsStruct_leq x0 (field4 x0) x1) x1 (Field_minus (Field_of_RealsStruct x0) x1)).
Axiom RealsStruct_minus_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> Field_minus (Field_of_RealsStruct x0) x1 :e field0 x0)).
Theorem RealsStruct_abs_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_abs x0 x1 :e field0 x0)).
admit.
Qed.
Theorem RealsStruct_abs_nonneg_case : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_leq x0 (field4 x0) x1 -> RealsStruct_abs x0 x1 = x1)).
admit.
Qed.
Axiom RealsStruct_zero_In : (forall x0, RealsStruct x0 -> field4 x0 :e field0 x0).
Theorem RealsStruct_abs_neg_case : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_lt x0 x1 (field4 x0) -> RealsStruct_abs x0 x1 = Field_minus (Field_of_RealsStruct x0) x1)).
admit.
Qed.
Axiom RealsStruct_minus_zero : (forall x0, RealsStruct x0 -> Field_minus (Field_of_RealsStruct x0) (field4 x0) = field4 x0).
Axiom RealsStruct_minus_leq : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_leq x0 (Field_minus (Field_of_RealsStruct x0) x2) (Field_minus (Field_of_RealsStruct x0) x1)))).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem RealsStruct_abs_nonneg : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_leq x0 (field4 x0) (RealsStruct_abs x0 x1))).
admit.
Qed.
Axiom RealsStruct_minus_invol : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> Field_minus (Field_of_RealsStruct x0) (Field_minus (Field_of_RealsStruct x0) x1) = x1)).
Theorem RealsStruct_abs_zero_inv : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_abs x0 x1 = field4 x0 -> x1 = field4 x0)).
admit.
Qed.
Axiom RealsStruct_plus_cancelR : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field1b x0 x1 x3 = field1b x0 x2 x3 -> x1 = x2)))).
Axiom RealsStruct_minus_R : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> field1b x0 x1 (Field_minus (Field_of_RealsStruct x0) x1) = field4 x0)).
Axiom RealsStruct_plus_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field1b x0 x1 x2 :e field0 x0))).
Theorem RealsStruct_dist_zero_eq : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_abs x0 (field1b x0 x1 (Field_minus (Field_of_RealsStruct x0) x2)) = field4 x0 -> x1 = x2))).
admit.
Qed.
