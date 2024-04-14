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
Axiom neq_1_0 : u1 = 0 -> (forall x0 : prop, x0).
Theorem neq_1_0' : u1 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_2_0 : u2 = 0 -> (forall x0 : prop, x0).
Theorem neq_2_0' : u2 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_2_1 : u2 = u1 -> (forall x0 : prop, x0).
Theorem neq_2_1' : u2 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_3_0 : u3 = 0 -> (forall x0 : prop, x0).
Theorem neq_3_0' : u3 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_3_1 : u3 = u1 -> (forall x0 : prop, x0).
Theorem neq_3_1' : u3 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_3_2 : u3 = u2 -> (forall x0 : prop, x0).
Theorem neq_3_2' : u3 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_4_0 : u4 = 0 -> (forall x0 : prop, x0).
Theorem neq_4_0' : u4 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_4_1 : u4 = u1 -> (forall x0 : prop, x0).
Theorem neq_4_1' : u4 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_4_2 : u4 = u2 -> (forall x0 : prop, x0).
Theorem neq_4_2' : u4 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_4_3 : u4 = u3 -> (forall x0 : prop, x0).
Theorem neq_4_3' : u4 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_5_0 : u5 = 0 -> (forall x0 : prop, x0).
Theorem neq_5_0' : u5 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_5_1 : u5 = u1 -> (forall x0 : prop, x0).
Theorem neq_5_1' : u5 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_5_2 : u5 = u2 -> (forall x0 : prop, x0).
Theorem neq_5_2' : u5 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_5_3 : u5 = u3 -> (forall x0 : prop, x0).
Theorem neq_5_3' : u5 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_5_4 : u5 = u4 -> (forall x0 : prop, x0).
Theorem neq_5_4' : u5 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_6_0 : u6 = 0 -> (forall x0 : prop, x0).
Theorem neq_6_0' : u6 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_6_1 : u6 = u1 -> (forall x0 : prop, x0).
Theorem neq_6_1' : u6 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_6_2 : u6 = u2 -> (forall x0 : prop, x0).
Theorem neq_6_2' : u6 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_6_3 : u6 = u3 -> (forall x0 : prop, x0).
Theorem neq_6_3' : u6 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_6_4 : u6 = u4 -> (forall x0 : prop, x0).
Theorem neq_6_4' : u6 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_6_5 : u6 = u5 -> (forall x0 : prop, x0).
Theorem neq_6_5' : u6 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_7_0 : u7 = 0 -> (forall x0 : prop, x0).
Theorem neq_7_0' : u7 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_7_1 : u7 = u1 -> (forall x0 : prop, x0).
Theorem neq_7_1' : u7 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_7_2 : u7 = u2 -> (forall x0 : prop, x0).
Theorem neq_7_2' : u7 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_7_3 : u7 = u3 -> (forall x0 : prop, x0).
Theorem neq_7_3' : u7 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_7_4 : u7 = u4 -> (forall x0 : prop, x0).
Theorem neq_7_4' : u7 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_7_5 : u7 = u5 -> (forall x0 : prop, x0).
Theorem neq_7_5' : u7 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_7_6 : u7 = u6 -> (forall x0 : prop, x0).
Theorem neq_7_6' : u7 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_8_0 : u8 = 0 -> (forall x0 : prop, x0).
Theorem neq_8_0' : u8 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_8_1 : u8 = u1 -> (forall x0 : prop, x0).
Theorem neq_8_1' : u8 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_8_2 : u8 = u2 -> (forall x0 : prop, x0).
Theorem neq_8_2' : u8 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_8_3 : u8 = u3 -> (forall x0 : prop, x0).
Theorem neq_8_3' : u8 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_8_4 : u8 = u4 -> (forall x0 : prop, x0).
Theorem neq_8_4' : u8 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_8_5 : u8 = u5 -> (forall x0 : prop, x0).
Theorem neq_8_5' : u8 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_8_6 : u8 = u6 -> (forall x0 : prop, x0).
Theorem neq_8_6' : u8 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_8_7 : u8 = u7 -> (forall x0 : prop, x0).
Theorem neq_8_7' : u8 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_9_0 : u9 = 0 -> (forall x0 : prop, x0).
Theorem neq_9_0' : u9 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_9_1 : u9 = u1 -> (forall x0 : prop, x0).
Theorem neq_9_1' : u9 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_9_2 : u9 = u2 -> (forall x0 : prop, x0).
Theorem neq_9_2' : u9 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_9_3 : u9 = u3 -> (forall x0 : prop, x0).
Theorem neq_9_3' : u9 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_9_4 : u9 = u4 -> (forall x0 : prop, x0).
Theorem neq_9_4' : u9 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_9_5 : u9 = u5 -> (forall x0 : prop, x0).
Theorem neq_9_5' : u9 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_9_6 : u9 = u6 -> (forall x0 : prop, x0).
Theorem neq_9_6' : u9 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_9_7 : u9 = u7 -> (forall x0 : prop, x0).
Theorem neq_9_7' : u9 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_9_8 : u9 = u8 -> (forall x0 : prop, x0).
Theorem neq_9_8' : u9 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Theorem missingprop_871e92d1e015b90191f05be741b9ed2cc4491066cf0bf7b2d76c5d141ce801a4 : u10 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom ordsucc_inj_contra : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> ordsucc x0 = ordsucc x1 -> (forall x2 : prop, x2)).
Theorem missingprop_a7fa19a834d529db93c1b2300b41b17f336102b7793b24e9a750d6e03dec690c : u10 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_5f3179724a6e8ef693da33b4da734e3c0d8d3295b89093b2f129371490f35854 : u10 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_155e8a92a8ae96b946418659d12b00e3fef62dadc1bc31d4f074bcb712786356 : u10 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_ccc1fa6cae49dec573eda0a7cb35b2ad4debf37b10463565ebc6d1385353f388 : u10 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_1a168a095e76e59ad83d93a60c30f2a4b23a38b25f72b379498ed6c0a6728b15 : u10 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_1caafcfab421a8bbf73edb3267db1f6908bd5029c181663700c5c637b54bb883 : u10 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_f90d6a14135c76785343d196a602714aaebc8f848035cb3fc7d99e4a8069fa52 : u10 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_00ce3e990e394696d648599b893a93cd3cb153c371b93008eddec6849fd2aaa9 : u10 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_36b306548a78300032c69ad94745ff48aa8608e8a430eca548c144b9c231bda4 : u10 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_363035042db213d82b8567e67d435ec9f0597b9e71631d1860566db3f413fe41 : u11 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_da9cd2315b0ab3b3dbcd7c4069c6d07f8e8a7c3b5321d78acb9ddfea02c56e54 : u11 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_93bd155ae66f9293399dab321235e159c709aa50be6b4209e260d5c571069bc3 : u11 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_6c307483f1e9d79cbd1be8f99cb0623b215d2a96dd7ca22776b1132e2b377d33 : u11 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_a386dcc739aba4ef656c3a82802ebcbe7e87dae1ec14c96538c3fd461f6a0883 : u11 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_7ad531d6eaae09cf142317793b067ab02fe09b619a36a2cbc6f0876a1fd1ba74 : u11 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_a218356df980789875659155b1ed2b3563be2916e1184b396ad2583b0b523a18 : u11 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_10a35d241244d98b266514a8fe38926cbcc9f4c51c46fbe5923bab64f9db063e : u11 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_e3e7876f64d57e7b4aae114d87715d9a64fc4129a1a28df53f278ae0d8499348 : u11 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_eee73695077ff6070731183421778635002a71c030b9e35e65d114074acaa597 : u11 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_4ab2aef55b95fb08a1edd1a27d2fff79c4fc64f365bf3591ff27be743265541f : u11 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_c9b4e12fb0aac9a865933938cbf5882f899389d7530b1a6017a25523b517d77b : u12 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_fac08972bb876bc2457930272ed91a55b92fbe2a965f8dbfa94c531b056fd466 : u12 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9925a94179f9b96e15bb2f5f3151446cc17d0f38ddaec97b207a42442fb0efed : u12 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_21d350f752803e70816c84c0f32485027c6c1878657f7263a7ebfa87995c9b6a : u12 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_0aa1897333a9220b7c647af2a5a102d331686166cd7d81d697467978bffb14b8 : u12 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_01c5167c045808e88e705b476ce2dd0e57d03d1d5f6a26f61825a32395c242ea : u12 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3de237895f633cd0c01630052cea1ce37b395b2138c60358b21cdd63976e7e77 : u12 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_944319b563f360f8276cf6ed579bfd97549280496ef3a59878dc7367e0289497 : u12 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_405ba169154d9d42445b73345355e3c1ff4a4c35ee248b0842bd8e1a26057bf4 : u12 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_e9452875caa538a193e13eb1accc0d1d2221ffa1eb64478ef4b831d0c7fb8587 : u12 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_a52e53b541a40078b90241258be0a0067f5bc813eb10693b9b961df0bbb05001 : u12 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_dd600363d78f5191d99ddf5f03f668be69bef6f49770dc87b299c981791e709b : u12 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom cases_9 : (forall x0, x0 :e 9 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 7 -> x1 8 -> x1 x0)).
Theorem missingprop_74ee37d72a6213f9e490059da26888feba068255f704fd7ddf59dcd556b0b662 : (forall x0, x0 :e u10 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 x0)).
admit.
Qed.
Theorem missingprop_16a583b27c846cbf24441f77a51593d3d8c71d1e4798e971e3bf25553934797a : (forall x0, x0 :e u11 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 x0)).
admit.
Qed.
Theorem missingprop_a36df829fd5ae696643b1cd180c001e7c72018b0aade2c8b02a3beb191bf4447 : (forall x0, x0 :e u12 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 x0)).
admit.
Qed.
Theorem missingprop_713be0ad5efeb9da26a66462505f19060bd4cc2891c0c4c304dba8053e47660a : (forall x0, x0 :e u13 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 x0)).
admit.
Qed.
