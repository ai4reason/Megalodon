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
Definition ChurchNums_3x8_to_u24 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => x0 (x1 (fun x2 : set -> set => fun x3 : set => x3) (fun x2 : set -> set => x2) (fun x2 : set -> set => fun x3 : set => x2 (x2 x3)) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 x3))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 x3)))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 x3))))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 (x2 x3)))))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 (x2 (x2 x3)))))))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x1 (fun x4 : set -> set => fun x5 : set => x5) (fun x4 : set -> set => x4) (fun x4 : set -> set => fun x5 : set => x4 (x4 x5)) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 x5))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 x5)))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 x5))))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 (x4 x5)))))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 (x4 (x4 x5))))))) x2 x3))))))))) (fun x2 : set -> set => fun x3 : set => x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x2 (x1 (fun x4 : set -> set => fun x5 : set => x5) (fun x4 : set -> set => x4) (fun x4 : set -> set => fun x5 : set => x4 (x4 x5)) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 x5))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 x5)))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 x5))))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 (x4 x5)))))) (fun x4 : set -> set => fun x5 : set => x4 (x4 (x4 (x4 (x4 (x4 (x4 x5))))))) x2 x3))))))))))))))))) ordsucc 0).
Definition ChurchNum_3ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => forall x1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x2) -> x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x3) -> x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x4) -> x1 x0).
Definition ChurchNum_8ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => forall x1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x9) -> x1 x0).
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
Axiom missingprop_03d05df17e6d0dfb61078a328f1fe2af259d04334e9272f9fef14f1c809e2510 : 0 :e u24.
Axiom missingprop_c5dd54ff540c2e7015553cdd315dc8688381b6bedc976f1e457626e8ffdaa856 : u1 :e u24.
Axiom missingprop_3f854ddba19afed67e8e7c926514f1031501db7e4b15f32b9d5f01b0cada5e81 : u2 :e u24.
Axiom missingprop_2fff731f478df28c1a674607897f3e9c9ecbfa9595ccaf6e18f905ceb0bb25f7 : u3 :e u24.
Axiom missingprop_e96e9e50864a786761e09a3f4fd2da9f54dbbfeb3b82424aad75a5f448944fc0 : u4 :e u24.
Axiom missingprop_d89f2f1f31e09b27071252de7f4d74d86cc2d23db60c955d9f549cb676628a10 : u5 :e u24.
Axiom missingprop_c7d0fe73935e70bba08ba24f03fb35b0b0abe6a7eabe725f9cb73b15035c09a0 : u6 :e u24.
Axiom missingprop_235e5677af1fafe89d2bb2697544cf837edf8151a25dda26f98acabae5fdae0b : u7 :e u24.
Axiom missingprop_0f4c81eb7b5e834ce321d2838b45d881fed01d1791f152bb3c26d1422ae365df : u8 :e u24.
Axiom missingprop_5787addd81097ac2ea7fd3b1172abfbf1a30344b5fc4ed1cd47246895b0f0015 : u9 :e u24.
Axiom missingprop_1a4e0d2300206843eb688a99c9a35f2824c67ede9ae4bb884800a018d354645f : u10 :e u24.
Axiom missingprop_9f645751091168159704c2a4206614a886f67e90634a40cb2f1007a1ded74870 : u11 :e u24.
Axiom missingprop_b5a5df59295203515b45ba4025b056a60d583244db6a49137478b750da43f7b3 : u12 :e u24.
Axiom missingprop_0abeefeb4eb46933d72e1a486c5473e97cee56ce97496efd9a5a68ce64ee26af : u13 :e u24.
Axiom missingprop_0cac1a9a7834a54f96522175004935f81e185228129aa1df54e676c23f6ba995 : u14 :e u24.
Axiom missingprop_d83162a850ff828abdce8caffc89679e0d80feb1430ae78d594baabb506d1d2d : u15 :e u24.
Axiom missingprop_d993a4c14e25e07f108ccf71eb70196df4d041cab22f0c34487d2c84bc066b21 : u16 :e u24.
Axiom missingprop_f394ff739bed714709cba792c9696d92733c1ded61ca062a9b12d82ac41ecddb : u17 :e u24.
Axiom missingprop_1eec97728e0a8c57720abd635b866ba21b7660f2d2ba57d23e943bb9c927f0f6 : u18 :e u24.
Axiom missingprop_f65b9a80bd646b6589aee836a42c9ac33767f16f532b283c44342f4b01838f80 : u19 :e u24.
Axiom missingprop_3eb01877a04a9d2c419449ab855e4f00a8d0766102ebceb0dd5045731d380063 : u20 :e u24.
Axiom missingprop_64b0a32ee640e413f579b7c26b4a57c295e6dda24858871cd7ae4f4bfcaa9d7b : u21 :e u24.
Axiom missingprop_14b4339c93681d1ce5d3452c08084b60a24ed9313066dea7cc1c9e3ed973d5c5 : u22 :e u24.
Axiom missingprop_cd8132c085d47d8171587cae6c2ea06064bae5af42b68a66661992fe9aa230cd : u23 :e u24.
Theorem missingprop_90bc63482d3a819c6e087783aee21f3e1234bcffda10fff22d476dd35e7dd23e : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 x0 x1 :e u24).
admit.
Qed.
Definition ChurchNums_8x3_to_3_lt7_id_ge7_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x2 x3 x4 : (set -> set) -> set -> set => x0 (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x3 x4 x2)).
Definition ChurchNums_8_perm_1_2_3_4_5_6_7_0 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 : (set -> set) -> set -> set => x0 x2 x3 x4 x5 x6 x7 x8 x1).
Axiom neq_1_0 : u1 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : u2 = u1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : u3 = u2 -> (forall x0 : prop, x0).
Axiom neq_4_3 : u4 = u3 -> (forall x0 : prop, x0).
Axiom neq_5_4 : u5 = u4 -> (forall x0 : prop, x0).
Axiom neq_6_5 : u6 = u5 -> (forall x0 : prop, x0).
Axiom neq_7_6 : u7 = u6 -> (forall x0 : prop, x0).
Axiom neq_8_7 : u8 = u7 -> (forall x0 : prop, x0).
Axiom neq_9_8 : u9 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_36b306548a78300032c69ad94745ff48aa8608e8a430eca548c144b9c231bda4 : u10 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_4ab2aef55b95fb08a1edd1a27d2fff79c4fc64f365bf3591ff27be743265541f : u11 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_dd600363d78f5191d99ddf5f03f668be69bef6f49770dc87b299c981791e709b : u12 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_f4e278a6bf4004a90230a7ce4599c33df3b13afc88036ef1d8ff3a4ef834b193 : u13 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_ccf4a5c6b3a6e4954a14109684a2ab83b52a2425e80e3019435c7a784c78b93f : u14 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_9052a17aeb56f0baa5bd35ac678f9db733e32e563a9d0a61b0417ed4592a2293 : u15 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_5f312c1824a4beefed581d01c6269bf8f1701f7ed4c65d144b4397173c0fe00c : u16 = u15 -> (forall x0 : prop, x0).
Axiom missingprop_48ad08e3fcea446c4edb5e27702cf310c322bf29128458b86d14b643f3111333 : u17 = u16 -> (forall x0 : prop, x0).
Axiom missingprop_73b9cd20f7c68e88e2ea426419ccd36b4d3b28c76cc72d670d7f8ae953c13bf1 : u18 = u17 -> (forall x0 : prop, x0).
Axiom missingprop_fa5098b34d383bdca73a3b8d5098cb7d610846f369975f1b68176e99916d56fc : u19 = u18 -> (forall x0 : prop, x0).
Axiom missingprop_9d0b3600c1008810e1dcd2f5d5b69567f51704fcc4b0f5a23b2c520b26cc4e6b : u20 = u19 -> (forall x0 : prop, x0).
Axiom missingprop_9752f8aae07d669b1096f135020ecbab317a167588504754f80d88b4c92adaa6 : u21 = u20 -> (forall x0 : prop, x0).
Axiom missingprop_3d71b5e2b64bf76b23712115efcf8b7f94af2176c7117e30436385825be79563 : u22 = u21 -> (forall x0 : prop, x0).
Axiom missingprop_5c1235178ee676092509be5f997555e0c264359c0246b8769d05b358696c7223 : u23 = u22 -> (forall x0 : prop, x0).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom missingprop_979c189cc637d3afe72473e9489dd77c5b5f6c5dc0c5c0189cecdbcf7fe064e4 : u23 = 0 -> (forall x0 : prop, x0).
Theorem missingprop_9795ab363028b42b10ed8fae6a2d02d5bd364e2a93799ce790703318b440d176 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x1 x0) (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x1) = ChurchNums_3x8_to_u24 x0 x1 -> (forall x2 : prop, x2)).
admit.
Qed.
Definition ChurchNums_8x3_to_3_lt6_id_ge6_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x2 x3 x4 : (set -> set) -> set -> set => x0 (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x3 x4 x2) (x1 x3 x4 x2)).
Definition ChurchNums_8_perm_2_3_4_5_6_7_0_1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 : (set -> set) -> set -> set => x0 x3 x4 x5 x6 x7 x8 x1 x2).
Axiom neq_2_0 : u2 = 0 -> (forall x0 : prop, x0).
Axiom neq_3_1 : u3 = u1 -> (forall x0 : prop, x0).
Axiom neq_4_2 : u4 = u2 -> (forall x0 : prop, x0).
Axiom neq_5_3 : u5 = u3 -> (forall x0 : prop, x0).
Axiom neq_6_4 : u6 = u4 -> (forall x0 : prop, x0).
Axiom neq_7_5 : u7 = u5 -> (forall x0 : prop, x0).
Axiom neq_8_6 : u8 = u6 -> (forall x0 : prop, x0).
Axiom neq_9_7 : u9 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_00ce3e990e394696d648599b893a93cd3cb153c371b93008eddec6849fd2aaa9 : u10 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_eee73695077ff6070731183421778635002a71c030b9e35e65d114074acaa597 : u11 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_a52e53b541a40078b90241258be0a0067f5bc813eb10693b9b961df0bbb05001 : u12 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_0a910a83fae7c1219e51ae6f441b8120dc6f2353f129945859e5867a1d5c1be3 : u13 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_15d8fee75ef2fcef507dcd58e078d7224460844031194a35f38ebec160a6c36c : u14 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_c4ec81028536a24273f04958b27208043a8e72bdb9f95435ebeb3fd5cd7535fc : u15 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_44dd594ce330f92aa460a3bc4ae154c08d18da149afbcbc953cc12dc2b8e3572 : u16 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_d1dffc1c336e15bfd52ffbb0cdea2a47c856c061ff9c118dd9e985b84e29dc83 : u17 = u15 -> (forall x0 : prop, x0).
Axiom missingprop_48199a2c576158ae82528e00e9bdbc57db7b153fd2b9b08b5d19a699f50aefe3 : u18 = u16 -> (forall x0 : prop, x0).
Axiom missingprop_89cc3d43552b98630e93adfaacb03e2574aff9c02b3aa2506638d17b6117ee62 : u19 = u17 -> (forall x0 : prop, x0).
Axiom missingprop_d94e53b115bb7c8ad97900540e455e96755fdc4d2af5fa1f16b225e4dd920138 : u20 = u18 -> (forall x0 : prop, x0).
Axiom missingprop_9e5c3630c6bde594a7482457e2f23c53ccb7bfb274cd4576ad1a676c48795b2e : u21 = u19 -> (forall x0 : prop, x0).
Axiom missingprop_3e4ce6e92e08efa4fce1ccf5a1aaf4446405b517ccaaabd655218dc861e608f6 : u22 = u20 -> (forall x0 : prop, x0).
Axiom missingprop_68107b5958592b9f4c85905bf7dcf474b342acbe0c7e4ec024664ad44c39e21d : u23 = u21 -> (forall x0 : prop, x0).
Axiom missingprop_32b5dfdfa4f5b3ac9a9a00b831e93c63f93d8af007743ee91fcda4129b5fa6a7 : u22 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_445cbfbee89069914628dcbfc9698480d93297cc7c419597623522230f6064f3 : u23 = u1 -> (forall x0 : prop, x0).
Theorem missingprop_94519711265a2bffd4247f45b431de846b5ee6915074b96e1a7a8b2304fab411 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt6_id_ge6_rot2 x1 x0) (ChurchNums_8_perm_2_3_4_5_6_7_0_1 x1) = ChurchNums_3x8_to_u24 x0 x1 -> (forall x2 : prop, x2)).
admit.
Qed.
Definition ChurchNums_8x3_to_3_lt5_id_ge5_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x2 x3 x4 : (set -> set) -> set -> set => x0 (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x3 x4 x2) (x1 x3 x4 x2) (x1 x3 x4 x2)).
Definition ChurchNums_8_perm_3_4_5_6_7_0_1_2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 : (set -> set) -> set -> set => x0 x4 x5 x6 x7 x8 x1 x2 x3).
Axiom neq_3_0 : u3 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_1 : u4 = u1 -> (forall x0 : prop, x0).
Axiom neq_5_2 : u5 = u2 -> (forall x0 : prop, x0).
Axiom neq_6_3 : u6 = u3 -> (forall x0 : prop, x0).
Axiom neq_7_4 : u7 = u4 -> (forall x0 : prop, x0).
Axiom neq_8_5 : u8 = u5 -> (forall x0 : prop, x0).
Axiom neq_9_6 : u9 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_f90d6a14135c76785343d196a602714aaebc8f848035cb3fc7d99e4a8069fa52 : u10 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_e3e7876f64d57e7b4aae114d87715d9a64fc4129a1a28df53f278ae0d8499348 : u11 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_e9452875caa538a193e13eb1accc0d1d2221ffa1eb64478ef4b831d0c7fb8587 : u12 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_611c167b8d8d5c2c171ede951fd79aafcb1fd16fb816a3f0e5c0edff9bd7addf : u13 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_00afc3423aeef527fa52daa0e685caaf0adcec70a4145f09454ed0ecaf166b37 : u14 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_b71ad64ae5ee6739b72b7cf6202281008bcc9edc7ad98b81f40c22a64711fdc6 : u15 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_4e5614ee6c60ca75b34344cfddfbe4840c89f999d594b201761970f40f5f2255 : u16 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_4867b3ce4fe1d0a1c8ff8d2e2bc0717758c4ccc013cbbaaf26121557137d2316 : u17 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_fc69b4f24fa74882a934d6a846b06596684e5849597d21231c600ed2d7a43c70 : u18 = u15 -> (forall x0 : prop, x0).
Axiom missingprop_f4eab5da6a90e1d04224584391affbc6b18c42542dd60d5730fe3dc72ad0cd62 : u19 = u16 -> (forall x0 : prop, x0).
Axiom missingprop_e875d4259eccd00196f9a81452eacf721af588c7e9269dc84035cecf04073b0a : u20 = u17 -> (forall x0 : prop, x0).
Axiom missingprop_116e7cbd999186ad5cfa2811a7b1efe9808f1d43fddc92f1fecc1f6d9298b665 : u21 = u18 -> (forall x0 : prop, x0).
Axiom missingprop_1a53f970fcf4ee84e2f9d30498e0319f427d029bd6cae83309f9f5e645439192 : u22 = u19 -> (forall x0 : prop, x0).
Axiom missingprop_e046300dbabcb6879d5ee7b7a3484aad1e616228ce77872869131b66bd674d3c : u23 = u20 -> (forall x0 : prop, x0).
Axiom missingprop_172f2affd770fc4865199fceeb6667b9418cbfb12988961b0522b9fcaefa561f : u21 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_45a64368e1c57028abfd9fa6ed583fc783c2b40be93475c6caa3fd23bbae3d49 : u22 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_ddac1988a2199344800a986643397dbf7b977152e2795c780f668d66763c7142 : u23 = u2 -> (forall x0 : prop, x0).
Theorem missingprop_0ddd9ea3d65d5309bbe8fb371f1502ab186683787ed1e4f5a25bb6e94a07ef13 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x1 x0) (ChurchNums_8_perm_3_4_5_6_7_0_1_2 x1) = ChurchNums_3x8_to_u24 x0 x1 -> (forall x2 : prop, x2)).
admit.
Qed.
Definition ChurchNums_8x3_to_3_lt4_id_ge4_rot2 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x2 x3 x4 : (set -> set) -> set -> set => x0 (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x2 x3 x4) (x1 x3 x4 x2) (x1 x3 x4 x2) (x1 x3 x4 x2) (x1 x3 x4 x2)).
Definition ChurchNums_8_perm_4_5_6_7_0_1_2_3 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 : (set -> set) -> set -> set => x0 x5 x6 x7 x8 x1 x2 x3 x4).
Axiom neq_4_0 : u4 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_1 : u5 = u1 -> (forall x0 : prop, x0).
Axiom neq_6_2 : u6 = u2 -> (forall x0 : prop, x0).
Axiom neq_7_3 : u7 = u3 -> (forall x0 : prop, x0).
Axiom neq_8_4 : u8 = u4 -> (forall x0 : prop, x0).
Axiom neq_9_5 : u9 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_1caafcfab421a8bbf73edb3267db1f6908bd5029c181663700c5c637b54bb883 : u10 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_10a35d241244d98b266514a8fe38926cbcc9f4c51c46fbe5923bab64f9db063e : u11 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_405ba169154d9d42445b73345355e3c1ff4a4c35ee248b0842bd8e1a26057bf4 : u12 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_2f6e5b1338db3ff412e38a1ecfa4d466e2517777a8bbed02c867df317c357933 : u13 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_3e7054688acb8ba4a0f18423b649f383cf90ecfc4f6200e2e049d580ebc2dc1f : u14 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_ee5d720135ac2a1e6675f04fc296d39836826d1754aace8d3d88db80c3a9bf7b : u15 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_0c2339ef07f9be63916ba4ed21f5ed3d1c0fc25d2883650f1a08db958e637e32 : u16 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_ec9593399259670f4eff77c972d13de69785d35423977aacd7e0e7a77e866b61 : u17 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_95a48bd166473dd69fbd1d6c212b33b8b186a59fa5f64873a57a406abcd861d7 : u18 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_6d740d9c9b188e805405e2d34ec9986e71b10c02400c25af6128c2cd7b43204a : u19 = u15 -> (forall x0 : prop, x0).
Axiom missingprop_e5a105866bd0ded6c3644380e06b833d4aba44e9391e3fab11d8053b9f135f2f : u20 = u16 -> (forall x0 : prop, x0).
Axiom missingprop_5d7ae603d28081618c996edf9b87bde4055fc620b70ee849067dc72a1770788c : u21 = u17 -> (forall x0 : prop, x0).
Axiom missingprop_4249317584a93eea4ea9a17155e60b737afb0c5091a7dcfe593f93235e696685 : u22 = u18 -> (forall x0 : prop, x0).
Axiom missingprop_9701b8a5483a090b78796eef708de261df3f2545c5ce3af5a81f0a4ee00037bd : u23 = u19 -> (forall x0 : prop, x0).
Axiom missingprop_961499f8542074f8c18d781755f9f77c78ed32eb1a4f15b1f06614982543eb0b : u20 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_0a793590be20ff8e25a7a7b0c0297235ca4eaab6a5fd8d4f3d05cd6dc9695d58 : u21 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_28a93ac24d94b617505eb1b786cd962b918d2929cbc8be70154d9c3a16656a4b : u22 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_30b4a643cd067cfd4a20b14b81dfdf6822c9b14e9e7bb4190f2b11f7f27ef255 : u23 = u3 -> (forall x0 : prop, x0).
Theorem missingprop_433b192223f81cdfb1abc9896be5df6684d48b4dced54650c078fc3b776f8f25 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt4_id_ge4_rot2 x1 x0) (ChurchNums_8_perm_4_5_6_7_0_1_2_3 x1) = ChurchNums_3x8_to_u24 x0 x1 -> (forall x2 : prop, x2)).
admit.
Qed.
Axiom missingprop_4107128783ea5c7f56a1519fc9bb83c8edb1c1e721513a60c455c40b3b3ed869 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_3ary_proj_p (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x0 x1)).
Axiom missingprop_5ffaa314d96dd7e0a2f1f62c415fb19c4c4ef09466bee829c3516acc2a1fb18c : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_8ary_proj_p (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x0)).
Theorem missingprop_9c54f6f0f3a10f2f9cf363d672757ad5d995ca699c6b2a54cb747dbba46f56c1 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt6_id_ge6_rot2 x1 x0) (ChurchNums_8_perm_2_3_4_5_6_7_0_1 x1) = ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x1 x0) (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x1) -> (forall x2 : prop, x2)).
admit.
Qed.
Axiom missingprop_0d5b6abb690da1bfb2910016e873b25c0d313c178c63dbb27e086d5dce1d84b1 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_3ary_proj_p (ChurchNums_8x3_to_3_lt6_id_ge6_rot2 x0 x1)).
Axiom missingprop_b867480bec40f9756d98199319d912522f64381821c17cbb7b81d04e4e7deb1a : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_8ary_proj_p (ChurchNums_8_perm_2_3_4_5_6_7_0_1 x0)).
Theorem missingprop_788b840b4ad0ba0f3e03f21b657407925d6547909d499937fb4cc237a0a54733 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x1 x0) (ChurchNums_8_perm_3_4_5_6_7_0_1_2 x1) = ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt6_id_ge6_rot2 x1 x0) (ChurchNums_8_perm_2_3_4_5_6_7_0_1 x1) -> (forall x2 : prop, x2)).
admit.
Qed.
Axiom missingprop_ba84a7f1e1da990c89c7b4a20e0c8ea3784f3072fd4d4532a9187e6eebf57222 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_3ary_proj_p x1 -> ChurchNum_3ary_proj_p (ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x0 x1)).
Axiom missingprop_7755de1b07fa829360026c1a038955e26e3aa4728904dec248e0cd71e05130fb : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_8ary_proj_p x0 -> ChurchNum_8ary_proj_p (ChurchNums_8_perm_3_4_5_6_7_0_1_2 x0)).
Theorem missingprop_154ae969e66f7b20d2e4e3b5e21a71d9cb698e41eeb6e8477f5e767df2046b4c : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt4_id_ge4_rot2 x1 x0) (ChurchNums_8_perm_4_5_6_7_0_1_2_3 x1) = ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x1 x0) (ChurchNums_8_perm_3_4_5_6_7_0_1_2 x1) -> (forall x2 : prop, x2)).
admit.
Qed.
Theorem missingprop_ea5c918579db1ea97037085983e46eaf6d3297bcb837a3fa6e20722660423c43 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt5_id_ge5_rot2 x1 x0) (ChurchNums_8_perm_3_4_5_6_7_0_1_2 x1) = ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x1 x0) (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x1) -> (forall x2 : prop, x2)).
admit.
Qed.
Theorem missingprop_b16756dd73904aa303163575f8c387046c09816b87bffffc3fa62beecd6c42ae : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt4_id_ge4_rot2 x1 x0) (ChurchNums_8_perm_4_5_6_7_0_1_2_3 x1) = ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt6_id_ge6_rot2 x1 x0) (ChurchNums_8_perm_2_3_4_5_6_7_0_1 x1) -> (forall x2 : prop, x2)).
admit.
Qed.
Theorem missingprop_13534380a0b0372ce3059454f9f0548043ccbac41bc98ac01d45ea797b4a1a22 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt4_id_ge4_rot2 x1 x0) (ChurchNums_8_perm_4_5_6_7_0_1_2_3 x1) = ChurchNums_3x8_to_u24 (ChurchNums_8x3_to_3_lt7_id_ge7_rot2 x1 x0) (ChurchNums_8_perm_1_2_3_4_5_6_7_0 x1) -> (forall x2 : prop, x2)).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Axiom PigeonHole_nat : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e ordsucc x0 -> x1 x2 :e x0) -> not (forall x2, x2 :e ordsucc x0 -> (forall x3, x3 :e ordsucc x0 -> x1 x2 = x1 x3 -> x2 = x3)))).
Theorem missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
admit.
Qed.
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Axiom equip_ref : (forall x0, equip x0 x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
(* Parameter combine_funcs "f0267e2cbae501ea3433aecadbe197ba8f39c96e80326cc5981a1630fda29909" "ccac4354446ce449bb1c967fa332cdf48b070fc032d9733e4c1305fb864cb72a" *)
Parameter combine_funcs : set -> set -> (set -> set) -> (set -> set) -> set -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter Inj0 "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" "8143218ffde429ff34b20ee5c938914c75e40d59cd52cc5db4114971d231ca73" *)
Parameter Inj0 : set -> set.
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom missingprop_b6961926aadf85665852392f583ee4d9244a4c9e2652b11ec190e8e3e49588b9 : (forall x0 x1, forall x2 : set -> prop, (forall x3, x3 :e x0 -> x2 (Inj0 x3)) -> (forall x3, x3 :e x1 -> x2 (Inj1 x3)) -> (forall x3, x3 :e setsum x0 x1 -> x2 x3)).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom setprod_mon : (forall x0 x1, x0 c= x1 -> (forall x2 x3, x2 c= x3 -> setprod x0 x2 c= setprod x1 x3)).
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom combine_funcs_eq2 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj1 x4)) (x3 x4) -> x5 (x3 x4) (combine_funcs x0 x1 x2 x3 (Inj1 x4))).
Axiom combine_funcs_eq1 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj0 x4)) (x2 x4) -> x5 (x2 x4) (combine_funcs x0 x1 x2 x3 (Inj0 x4))).
Theorem missingprop_0ff18b7eb504eb7c264f5ad42462c21af832d47f1fcbedf3de67bfbc10c7fdfc : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> equip (mul_nat x0 x1) (setprod x0 x1))).
admit.
Qed.
Definition u25 : set :=
 ordsucc u24.
Axiom nat_4 : nat_p 4.
Axiom nat_3 : nat_p 3.
Axiom nat_2 : nat_p 2.
Axiom nat_1 : nat_p 1.
Axiom mul_nat_1R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 1) x0 -> x1 x0 (mul_nat x0 1)).
(* Parameter ChurchNum_p "dbcd9174a6cf85c5c53371cfe053393987371d6f5cf8eba63c30b99749b79bb8" "8f006ff8d9191047d4fbd1bd8991167e1e29662de1be89f969121efe0697f534" *)
Parameter ChurchNum_p : ((set -> set) -> set -> set) -> prop.
Axiom missingprop_566d903739470afda40d64020ac73735d543ec3209342e2b92a42fa9f217751d : (forall x0 : (set -> set) -> set -> set, ChurchNum_p x0 -> (forall x1 : (set -> set) -> set -> set, ChurchNum_p x1 -> x0 ordsucc (x1 ordsucc 0) = add_nat (x0 ordsucc 0) (x1 ordsucc 0))).
Axiom missingprop_d5dbeec732ea01f927877e2420b51cb5c68f473bf98d93e8571ddfd3f7adea18 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 x1))))).
Axiom missingprop_127246c57adc93f5032e352a4463561387a9b3b9f04766e1c57313b7a93b14ff : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))).
Axiom missingprop_b69aeea3b10b846ee5e419c1b471f03ef85ead2b77c13f4aa8b04c94af6c6775 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))))))))))).
Axiom missingprop_44091bde3786efbd683bdef95eb60f243ec6edb4d9a52a061406d636da2c7f68 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))))))))))))).
Theorem missingprop_cb31ba5b53de7ed1501ccb7838b0596c4806363c08f052d879d991759ac7d059 : mul_nat u5 u5 = u25.
admit.
Qed.
