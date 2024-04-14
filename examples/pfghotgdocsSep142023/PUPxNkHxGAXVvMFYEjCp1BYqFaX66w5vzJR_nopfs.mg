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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom missingprop_96f337a74f7b868e3a36513c42dd4d06e5187cd640ec479c0814272a65371d35 : 9 :e 16.
Theorem missingprop_abbef1301044c000653f42960a8047881f2ef656bd9cecef0ae9b764b6c0784f : u9 :e u17.
admit.
Qed.
Axiom missingprop_4eba3f0917ffb7ab4575d03fa353c824d8d4f151df45c3ade8f1ca296d4cc0ee : 10 :e 16.
Theorem missingprop_7af243686256d97349e2c2a55c958e2d435fe9a5e016344b19465fce23ad5676 : u10 :e u17.
admit.
Qed.
Axiom missingprop_ae3e46fe1608a88c13cfd94c7c4f636604e089dbe99822d5f16bc7323d0026af : 11 :e 16.
Theorem missingprop_fde6379bebd0b99b66d966901300c529916d83c8c1f209841f486bb2568cf012 : u11 :e u17.
admit.
Qed.
Axiom missingprop_6e0619c3165595ae4977f8d2ecfade1c59a6348e91d9234d9239b2fe0fb04ddf : 12 :e 16.
Theorem missingprop_b7a4a37161804b376f25028de76b0714142123cbd842ba90c86afe8baa6a8a9e : u12 :e u17.
admit.
Qed.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom neq_9_0 : u9 = 0 -> (forall x0 : prop, x0).
Axiom neq_9_1 : u9 = u1 -> (forall x0 : prop, x0).
Axiom neq_9_2 : u9 = u2 -> (forall x0 : prop, x0).
Axiom neq_9_3 : u9 = u3 -> (forall x0 : prop, x0).
Axiom neq_9_4 : u9 = u4 -> (forall x0 : prop, x0).
Axiom neq_9_5 : u9 = u5 -> (forall x0 : prop, x0).
Axiom neq_9_6 : u9 = u6 -> (forall x0 : prop, x0).
Axiom neq_9_7 : u9 = u7 -> (forall x0 : prop, x0).
Axiom neq_9_8 : u9 = u8 -> (forall x0 : prop, x0).
Theorem missingprop_659f70b4ce189b08b1a58303d85d3e0ce25bdeed3d711c5544babef044e19a47 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u9) x9 -> x17 x9 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u9)).
admit.
Qed.
Axiom missingprop_871e92d1e015b90191f05be741b9ed2cc4491066cf0bf7b2d76c5d141ce801a4 : u10 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_a7fa19a834d529db93c1b2300b41b17f336102b7793b24e9a750d6e03dec690c : u10 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_5f3179724a6e8ef693da33b4da734e3c0d8d3295b89093b2f129371490f35854 : u10 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_155e8a92a8ae96b946418659d12b00e3fef62dadc1bc31d4f074bcb712786356 : u10 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_ccc1fa6cae49dec573eda0a7cb35b2ad4debf37b10463565ebc6d1385353f388 : u10 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_1a168a095e76e59ad83d93a60c30f2a4b23a38b25f72b379498ed6c0a6728b15 : u10 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_1caafcfab421a8bbf73edb3267db1f6908bd5029c181663700c5c637b54bb883 : u10 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_f90d6a14135c76785343d196a602714aaebc8f848035cb3fc7d99e4a8069fa52 : u10 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_00ce3e990e394696d648599b893a93cd3cb153c371b93008eddec6849fd2aaa9 : u10 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_36b306548a78300032c69ad94745ff48aa8608e8a430eca548c144b9c231bda4 : u10 = u9 -> (forall x0 : prop, x0).
Theorem missingprop_d43d057aa49f9a0b8339469ba150e963a8bf1439af36c693beac1320ccc93428 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u10) x10 -> x17 x10 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u10)).
admit.
Qed.
Axiom missingprop_363035042db213d82b8567e67d435ec9f0597b9e71631d1860566db3f413fe41 : u11 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_da9cd2315b0ab3b3dbcd7c4069c6d07f8e8a7c3b5321d78acb9ddfea02c56e54 : u11 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_93bd155ae66f9293399dab321235e159c709aa50be6b4209e260d5c571069bc3 : u11 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_6c307483f1e9d79cbd1be8f99cb0623b215d2a96dd7ca22776b1132e2b377d33 : u11 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_a386dcc739aba4ef656c3a82802ebcbe7e87dae1ec14c96538c3fd461f6a0883 : u11 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_7ad531d6eaae09cf142317793b067ab02fe09b619a36a2cbc6f0876a1fd1ba74 : u11 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_a218356df980789875659155b1ed2b3563be2916e1184b396ad2583b0b523a18 : u11 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_10a35d241244d98b266514a8fe38926cbcc9f4c51c46fbe5923bab64f9db063e : u11 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_e3e7876f64d57e7b4aae114d87715d9a64fc4129a1a28df53f278ae0d8499348 : u11 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_eee73695077ff6070731183421778635002a71c030b9e35e65d114074acaa597 : u11 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_4ab2aef55b95fb08a1edd1a27d2fff79c4fc64f365bf3591ff27be743265541f : u11 = u10 -> (forall x0 : prop, x0).
Theorem missingprop_cf05bf5a760ffdb138d22eaeb9679c36c772631ff510d9243ea51ee6c9cef4c8 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u11) x11 -> x17 x11 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u11)).
admit.
Qed.
Axiom missingprop_c9b4e12fb0aac9a865933938cbf5882f899389d7530b1a6017a25523b517d77b : u12 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_fac08972bb876bc2457930272ed91a55b92fbe2a965f8dbfa94c531b056fd466 : u12 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_9925a94179f9b96e15bb2f5f3151446cc17d0f38ddaec97b207a42442fb0efed : u12 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_21d350f752803e70816c84c0f32485027c6c1878657f7263a7ebfa87995c9b6a : u12 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_0aa1897333a9220b7c647af2a5a102d331686166cd7d81d697467978bffb14b8 : u12 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_01c5167c045808e88e705b476ce2dd0e57d03d1d5f6a26f61825a32395c242ea : u12 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_3de237895f633cd0c01630052cea1ce37b395b2138c60358b21cdd63976e7e77 : u12 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_944319b563f360f8276cf6ed579bfd97549280496ef3a59878dc7367e0289497 : u12 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_405ba169154d9d42445b73345355e3c1ff4a4c35ee248b0842bd8e1a26057bf4 : u12 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_e9452875caa538a193e13eb1accc0d1d2221ffa1eb64478ef4b831d0c7fb8587 : u12 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_a52e53b541a40078b90241258be0a0067f5bc813eb10693b9b961df0bbb05001 : u12 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_dd600363d78f5191d99ddf5f03f668be69bef6f49770dc87b299c981791e709b : u12 = u11 -> (forall x0 : prop, x0).
Theorem missingprop_bd17f9ea51b21939dda38ed3701cac7471156f02e11adbf871ca3786f62d0e04 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u12) x12 -> x17 x12 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u12)).
admit.
Qed.
