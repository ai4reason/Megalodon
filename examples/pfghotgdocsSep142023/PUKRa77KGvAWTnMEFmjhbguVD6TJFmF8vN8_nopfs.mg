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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
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
Definition u37 : set :=
 ordsucc u36.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom missingprop_d1b27c3d1761fa8745bfe5696cdbece7f50f914ee66cd8afa5f2a9a031840658 : nat_p u36.
Theorem missingprop_ff1851fcc009cd63549943a7583f2cc6b00e2383d06261796b9dd4c57a8a5c07 : nat_p u37.
admit.
Qed.
Definition u38 : set :=
 ordsucc u37.
Theorem missingprop_6dbf73225cf09ab1981c693b38c011270ad794638b0aee5801897b45d49c9614 : nat_p u38.
admit.
Qed.
Definition u39 : set :=
 ordsucc u38.
Theorem missingprop_3ee12160db6ff5d3073c2cc4bef9d0b10c81099ca1e755ec64bdaa9ba0d4640e : nat_p u39.
admit.
Qed.
Definition u40 : set :=
 ordsucc u39.
Theorem missingprop_3cf844b5bc31db2e555e52952038966b2ff4f9a7de495189c90f077debddc525 : nat_p u40.
admit.
Qed.
Definition u41 : set :=
 ordsucc u40.
Theorem missingprop_c2b569c4ea407208633a61660bb02890a0e91df6efa0f8aaeba9985b6978b990 : nat_p u41.
admit.
Qed.
Definition u42 : set :=
 ordsucc u41.
Theorem missingprop_3d39c29c59ffad04bea9e278fdccf74a1ef7301126bae59567bae4b4be9f2748 : nat_p u42.
admit.
Qed.
Definition u43 : set :=
 ordsucc u42.
Theorem missingprop_d01ba0648b928568932ea85770d1b477f11e878008abbd9eb9f158692f5b4774 : nat_p u43.
admit.
Qed.
Definition u44 : set :=
 ordsucc u43.
Theorem missingprop_a7846785c80d257e26f332679b1749824b21b7b8082e0deabed938cf8bd1a141 : nat_p u44.
admit.
Qed.
Definition u45 : set :=
 ordsucc u44.
Theorem missingprop_b2f20d8d92135607910c4f059c72e12cb0e638f7a39ee457a8665030be1ba7cb : nat_p u45.
admit.
Qed.
Definition u46 : set :=
 ordsucc u45.
Theorem missingprop_3236e87f98da5b2e5e693a2a8c3040d9407d50ffa11bd239fa4e0a7e1bb08c3a : nat_p u46.
admit.
Qed.
Definition u47 : set :=
 ordsucc u46.
Theorem missingprop_961d0b091a632e44004655c171d6bde9eba17ba53edfbd8f15e507089c3d2328 : nat_p u47.
admit.
Qed.
Definition u48 : set :=
 ordsucc u47.
Theorem missingprop_29325ac8ba9693d00be108d84b1eeb0b3733e056914bdc730a765a59a8f15888 : nat_p u48.
admit.
Qed.
Definition u49 : set :=
 ordsucc u48.
Theorem missingprop_e94863007afcf2a23282b15093dca5b411ad006f1c2901e428eb8fa67ec3623d : nat_p u49.
admit.
Qed.
Definition u50 : set :=
 ordsucc u49.
Theorem missingprop_d5c252ba3f46d05510260e79c2971bcc60745e2605be60836de95ad9aa617ca4 : nat_p u50.
admit.
Qed.
Definition u51 : set :=
 ordsucc u50.
Theorem missingprop_0e4f7f5019dd72cad77d235851aaa5f40639940cef2c896847b5850af4193769 : nat_p u51.
admit.
Qed.
Definition u52 : set :=
 ordsucc u51.
Theorem missingprop_ccb5f7700df348b805b9305bb49a55b8f55c8fd18a965691a80147d807d13c5b : nat_p u52.
admit.
Qed.
Definition u53 : set :=
 ordsucc u52.
Theorem missingprop_2bdb8a0850ef7717b75db095aef5b6857957686bc49cc6a6b9cb4316cdd0b1f6 : nat_p u53.
admit.
Qed.
Definition u54 : set :=
 ordsucc u53.
Theorem missingprop_d9e72f769287ef06d3c545a6db6d222e978eefd5e64ab643b207f867d82d449d : nat_p u54.
admit.
Qed.
Definition u55 : set :=
 ordsucc u54.
Theorem missingprop_c31b766cbb406fd4468dd6a7473f4fee185aaad774d28cf523ef7c7fc1cf33d9 : nat_p u55.
admit.
Qed.
Definition u56 : set :=
 ordsucc u55.
Theorem missingprop_1d4708860ae26aaf24c083d00d539ccd34e4174057a58654e8fa838bb0316a7e : nat_p u56.
admit.
Qed.
Definition u57 : set :=
 ordsucc u56.
Theorem missingprop_cb00b7e529b8975069983a33b99f177f171237981b86a7dcbbbf0c69a8a52d6e : nat_p u57.
admit.
Qed.
Definition u58 : set :=
 ordsucc u57.
Theorem missingprop_fe3b5ea7f79469d22ed9e6d9d5f733adae8ca2a237038e99ff9703b1d81eee13 : nat_p u58.
admit.
Qed.
Definition u59 : set :=
 ordsucc u58.
Theorem missingprop_f056f51bca4567c8d62c3bc3e785fe3d23df8d4d5d2bfd7206e2480c3264d6d7 : nat_p u59.
admit.
Qed.
Definition u60 : set :=
 ordsucc u59.
Theorem missingprop_9f15a0a9f79db55c99b4d053f22269c29f6041047f3855c60f230ebfc9e9446c : nat_p u60.
admit.
Qed.
Definition u61 : set :=
 ordsucc u60.
Theorem missingprop_fcd025a00bb7da23d97680c00d0033d2906ef1fea03d4d71234a6087585458e3 : nat_p u61.
admit.
Qed.
Definition u62 : set :=
 ordsucc u61.
Theorem missingprop_dd71b54e44a69b22b3c4f0693e5dd13038fd58ca7849918338011816a552e7ad : nat_p u62.
admit.
Qed.
Definition u63 : set :=
 ordsucc u62.
Theorem missingprop_1bb5d644e46edf4d7f31f818c9ba84409d227e8fe01f3cebddc2e7a46ab7177a : nat_p u63.
admit.
Qed.
Definition u64 : set :=
 ordsucc u63.
Theorem missingprop_c00f2f77a9de84adbe221e2db786f0dbccd295ee08ec6eb8eaaf0b0a862ad5bd : nat_p u64.
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_4 : nat_p 4.
Axiom nat_3 : nat_p 3.
Axiom nat_2 : nat_p 2.
Axiom nat_1 : nat_p 1.
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_4e9860e22f2ecdaba8646193805e60c1a038ee0d6cc9eed40f0f2599b16dfd4b : add_nat u13 u5 = u18.
admit.
Qed.
Axiom nat_5 : nat_p 5.
Theorem missingprop_e48038bdec8e7884f08fd52a2588c05eed836ce7446f23174fba0b8b623ea2b3 : add_nat u19 u6 = u25.
admit.
Qed.
Axiom nat_6 : nat_p 6.
Theorem missingprop_7d33043cc623769ebdb44921901a824067184ba53aea51df2a9e6b184cd6f0a0 : add_nat u26 u7 = u33.
admit.
Qed.
Axiom nat_7 : nat_p 7.
Theorem missingprop_fdee5fb4b8195573702814757a84194775a6eff0fdf5f54dd81b113ace8dbf92 : add_nat u34 u8 = u42.
admit.
Qed.
Axiom nat_12 : nat_p 12.
Axiom nat_11 : nat_p 11.
Axiom nat_10 : nat_p 10.
Axiom nat_9 : nat_p 9.
Axiom nat_8 : nat_p 8.
Theorem missingprop_56864d25e1dc2c311308a37cde717e02009203e74fc9553fc6055512e1618e53 : add_nat u51 u13 = u64.
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter exp_nat "4ce015b98f266293ef85ef9898e1d8f66f4d9664bd9601197410d96354105016" "37c5310c8da5c9f9db9152285b742d487f1a5b1bd7c73a4207d40bcd4f4d13fb" *)
Parameter exp_nat : set -> set -> set.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom missingprop_e9c4cec7fb327dcb17b88acdaf76daee024e49fa71834a13065f86e12e958609 : (forall x0 x1, nat_p x1 -> exp_nat x0 (ordsucc x1) = mul_nat x0 (exp_nat x0 x1)).
Axiom missingprop_4d619f8c0c4edc98bd8e6be92366236784a59ad7862cae98bda091f9d44c9792 : exp_nat u2 u6 = u64.
Axiom missingprop_463ff37e0f5b1f0c9f9e5bd24ebf02eb01188a79277f3c1f714af19504beaaf2 : (forall x0, nat_p x0 -> mul_nat u2 x0 = add_nat x0 x0).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom missingprop_2dcf4dd8557a0ffd2a187961d1bc330ef1aae42c546555814bac26eb5e3c6d68 : (forall x0 x1, nat_p x1 -> x0 c= add_nat x0 x1).
Axiom nat_14 : nat_p 14.
Axiom nat_13 : nat_p 13.
Axiom add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Axiom add_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = add_nat x1 x0)).
Axiom add_nat_asso : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> add_nat (add_nat x0 x1) x2 = add_nat x0 (add_nat x1 x2)))).
Axiom Subq_ref : (forall x0, x0 c= x0).
Theorem missingprop_8d767625c7188cac3f67da81f68e6dc32bb0713dfc32b751af8be4b3bff7bce3 : add_nat u51 u63 c= exp_nat u2 u7.
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Theorem missingprop_5699b3df204a64fe208917e4d013131a9b09ccf51d6c02bdbd470402e8fe7c26 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> x1 :e x2 -> add_nat x1 x0 :e add_nat x2 x0))).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem missingprop_db0df2488a5bd91eb2b38c3c1e292417630b2f14c788682eee7dea2a657a90b2 : (forall x0 x1 x2, nat_p x0 -> nat_p x1 -> nat_p x2 -> x0 c= x1 -> add_nat x0 x2 c= add_nat x1 x2).
admit.
Qed.
Theorem missingprop_f15668f9dd126ccb5aaf8475e840ca53cc6e13458c80098a365679d1ec8b61cb : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> nat_p x2 -> nat_p x3 -> x0 c= x2 -> x1 c= x3 -> add_nat x0 x1 c= add_nat x2 x3).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
Axiom missingprop_289054093170089dbe39b1d15aa65cd476b1f9d33d6fb8e39a1c75742ce9ba86 : nat_p u26.
Axiom missingprop_f5b8583d73a2efa339efab10375e1f72c07bd63d6625dbe8cc0533691448c99e : nat_p u27.
Axiom missingprop_3dad49cdb0b46d482652f9ab64d8695df650b7c7dfa1daf758686cc12275038b : nat_p u34.
Axiom missingprop_176b77e9dd5a04af2e6894f4be5e1bdf5368375bafa51d5f0b9802d23d85e4bf : nat_p u33.
Axiom missingprop_e20297641bb65d9e51ebac2e053948365a3f53b65d223d41920ce90b2e26b533 : nat_p u32.
Axiom missingprop_723dd01f4e3b6ead0b114b6935717dcf3e97da79c873ecf977038ff266453fe1 : nat_p u31.
Axiom missingprop_788bbe9828a92e5a00088dfb2b8bda376a1f0cc6f5af9d051630bf10267ff3d7 : add_nat u31 u27 = u58.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_f5822e9d5891900b4c653eab5e89c5bb71543e61fe2c332750489ecd340604eb : (forall x0, nat_p x0 -> equip (Power x0) (exp_nat 2 x0)).
Axiom missingprop_8dc90256cd485c4892a87cecdc3cbbfe0b65eb0964cbc26ac7da8ca72ab39534 : (forall x0 x1 x2 x3, nat_p x2 -> nat_p x3 -> TwoRamseyProp (ordsucc x0) x1 (ordsucc x2) -> TwoRamseyProp x0 (ordsucc x1) (ordsucc x3) -> TwoRamseyProp (ordsucc x0) (ordsucc x1) (ordsucc (ordsucc (add_nat x2 x3)))).
Axiom missingprop_0b333a54acf90ac2cb68915649df7a73a736b590f76b23b6e0e8b35fbb9faf0c : (forall x0, TwoRamseyProp 2 x0 x0).
Axiom missingprop_fac4bbb30ad81b6694b16257f5c78aca84fe44aabf82317cc19fcd45abcf1690 : nat_p u19.
Axiom missingprop_c8da84824b954785d0aad3ac1cab3ea408afb6900e8ea9f4397c25652192285c : add_nat u31 u19 = u50.
Axiom TwoRamseyProp_u4_u5_u32 : TwoRamseyProp u4 u5 u32.
Axiom TwoRamseyProp_3_5_14 : TwoRamseyProp 3 5 14.
Theorem TwoRamseyProp_4_8_Power_7 : TwoRamseyProp 4 8 (Power 7).
admit.
Qed.
Axiom missingprop_1b73e01bc234ba0e318bc9baf16604d4f0fc12bea57885439d70438de4eb7174 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_nat x0 x1))).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom Subq_Empty : (forall x0, 0 c= x0).
Theorem TwoRamseyProp_4_9_Power_8 : TwoRamseyProp 4 9 (Power 8).
admit.
Qed.
