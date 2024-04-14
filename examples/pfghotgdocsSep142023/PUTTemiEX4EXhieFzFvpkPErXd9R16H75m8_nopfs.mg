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
(* Parameter TwoRamseyProp_atleastp "947fb9a2bd96c9c3a0cefb7f346e15d36deca0943732fc3ea9bc3a588c7ad8f8" "6d86bb255886d154fd0886829fc7d7f8411add3db54738041d14766df3b5c4fa" *)
Parameter TwoRamseyProp_atleastp : set -> set -> set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom missingprop_2189d2fdc38fc21dedc845f1016855e7d4d32028f7f18ab941bdc60c8030f7be : (forall x0 x1 x2 x3, nat_p x2 -> nat_p x3 -> TwoRamseyProp_atleastp (ordsucc x0) x1 (ordsucc x2) -> TwoRamseyProp_atleastp x0 (ordsucc x1) (ordsucc x3) -> TwoRamseyProp_atleastp (ordsucc x0) (ordsucc x1) (ordsucc (ordsucc (add_nat x2 x3)))).
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom missingprop_8aec7aa3dfe2dc8cbf1366cb9f5d8ab2c4ceeb7b1cd3cc933b26d92d53269901 : (forall x0 x1 x2, TwoRamseyProp_atleastp x0 x1 x2 -> TwoRamseyProp x0 x1 x2).
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Axiom TwoRamseyProp_atleastp_atleastp : (forall x0 x1 x2 x3 x4, TwoRamseyProp x0 x2 x4 -> atleastp x1 x0 -> atleastp x3 x2 -> TwoRamseyProp_atleastp x1 x3 x4).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Theorem missingprop_8dc90256cd485c4892a87cecdc3cbbfe0b65eb0964cbc26ac7da8ca72ab39534 : (forall x0 x1 x2 x3, nat_p x2 -> nat_p x3 -> TwoRamseyProp (ordsucc x0) x1 (ordsucc x2) -> TwoRamseyProp x0 (ordsucc x1) (ordsucc x3) -> TwoRamseyProp (ordsucc x0) (ordsucc x1) (ordsucc (ordsucc (add_nat x2 x3)))).
admit.
Qed.
Axiom missingprop_678f269783f56623b590ce1d631178bc95b1ef296ba955ebeddcd0dc31626e86 : (forall x0, TwoRamseyProp_atleastp 2 x0 x0).
Theorem missingprop_0b333a54acf90ac2cb68915649df7a73a736b590f76b23b6e0e8b35fbb9faf0c : (forall x0, TwoRamseyProp 2 x0 x0).
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
Axiom missingprop_6cbf2ce5b238902a91be96bb2397d1da08ec04d3fb85075e050578834f28c05e : add_nat 8 4 = 12.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
Definition u7 : set :=
 ordsucc u6.
Definition u8 : set :=
 ordsucc u7.
Axiom nat_8 : nat_p 8.
Axiom nat_4 : nat_p 4.
Axiom TwoRamseyProp_3_4_9 : TwoRamseyProp 3 4 9.
Theorem TwoRamseyProp_3_5_14 : TwoRamseyProp 3 5 14.
admit.
Qed.
Axiom TwoRamseyProp_4_4_18 : TwoRamseyProp 4 4 18.
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
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_6 : nat_p 6.
Axiom missingprop_3259cb7d3b3b3adafac7093356c6be4d14cc142aba0c3345c772dc583fe3fafc : add_nat 17 6 = 23.
Theorem missingprop_a4d9f55171488033ed76e0b1ffb87f0b049170a6d59e8b28cef3796b4c529557 : add_nat u17 u7 = u24.
admit.
Qed.
Definition u25 : set :=
 ordsucc u24.
Axiom nat_7 : nat_p 7.
Theorem missingprop_834abc4bf03aa62b90fdecceb8cd35b9380daee81d128f387427d952831395f4 : add_nat u17 u8 = u25.
admit.
Qed.
Definition u26 : set :=
 ordsucc u25.
Theorem missingprop_ce43cd5e238822e5527c7bc3b719cbae46da9c13d5224230ce173c12b03ad237 : add_nat u17 u9 = u26.
admit.
Qed.
Definition u27 : set :=
 ordsucc u26.
Axiom nat_9 : nat_p 9.
Theorem missingprop_f74a005974948eae38b2826b510476536383187b114dee7c4d961138e2c021ef : add_nat u17 u10 = u27.
admit.
Qed.
Definition u28 : set :=
 ordsucc u27.
Axiom nat_10 : nat_p 10.
Theorem missingprop_0aa85538606d0c18efc00772ba6a7e27b759d858241b3f77a04e58e18f26103e : add_nat u17 u11 = u28.
admit.
Qed.
Definition u29 : set :=
 ordsucc u28.
Axiom nat_11 : nat_p 11.
Theorem missingprop_c7fead2384de6f71eb336ad04353888ff9edc7f684ad6aab52d64cd2b4ef21c0 : add_nat u17 u12 = u29.
admit.
Qed.
Definition u30 : set :=
 ordsucc u29.
Axiom nat_12 : nat_p 12.
Theorem missingprop_932963e4bf99485bf11d023ea4e4c5061a89d9d034de74ce451728ae15f94bee : add_nat u17 u13 = u30.
admit.
Qed.
Definition u31 : set :=
 ordsucc u30.
Definition u32 : set :=
 ordsucc u31.
Axiom nat_17 : nat_p 17.
Axiom nat_13 : nat_p 13.
Theorem TwoRamseyProp_u4_u5_u32 : TwoRamseyProp u4 u5 u32.
admit.
Qed.
Axiom missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
(* Parameter exp_nat "4ce015b98f266293ef85ef9898e1d8f66f4d9664bd9601197410d96354105016" "37c5310c8da5c9f9db9152285b742d487f1a5b1bd7c73a4207d40bcd4f4d13fb" *)
Parameter exp_nat : set -> set -> set.
Axiom missingprop_8e67f22739f9a01fd2d9438edd2f3f6d8d323d1fa4d050bc09f5b1af8d3b6dd7 : exp_nat 2 5 = 32.
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_f5822e9d5891900b4c653eab5e89c5bb71543e61fe2c332750489ecd340604eb : (forall x0, nat_p x0 -> equip (Power x0) (exp_nat 2 x0)).
Axiom nat_5 : nat_p 5.
Theorem TwoRamseyProp_4_5_Power_5 : TwoRamseyProp 4 5 (Power 5).
admit.
Qed.
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
Definition u38 : set :=
 ordsucc u37.
Definition u39 : set :=
 ordsucc u38.
Definition u40 : set :=
 ordsucc u39.
Definition u41 : set :=
 ordsucc u40.
Definition u42 : set :=
 ordsucc u41.
Definition u43 : set :=
 ordsucc u42.
Definition u44 : set :=
 ordsucc u43.
Definition u45 : set :=
 ordsucc u44.
Definition u46 : set :=
 ordsucc u45.
Definition u47 : set :=
 ordsucc u46.
Definition u48 : set :=
 ordsucc u47.
Definition u49 : set :=
 ordsucc u48.
Definition u50 : set :=
 ordsucc u49.
Definition u51 : set :=
 ordsucc u50.
Definition u52 : set :=
 ordsucc u51.
Definition u53 : set :=
 ordsucc u52.
Definition u54 : set :=
 ordsucc u53.
Definition u55 : set :=
 ordsucc u54.
Definition u56 : set :=
 ordsucc u55.
Definition u57 : set :=
 ordsucc u56.
Definition u58 : set :=
 ordsucc u57.
Definition u59 : set :=
 ordsucc u58.
Definition u60 : set :=
 ordsucc u59.
Definition u61 : set :=
 ordsucc u60.
Definition u62 : set :=
 ordsucc u61.
Definition u63 : set :=
 ordsucc u62.
Definition u64 : set :=
 ordsucc u63.
Definition u65 : set :=
 ordsucc u64.
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_835cb897949ddfc599f13e11ab6c040686416b21cb4056c249e42c16c5060ab2 : add_nat u31 u1 = u32.
admit.
Qed.
Axiom nat_1 : nat_p 1.
Theorem missingprop_afbd8af43b91639edf9801025ee4b7852c4cebb35cc9ee1e518c852383076669 : add_nat u31 u2 = u33.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Theorem missingprop_bc10b86aada623ca9e6ac8a8ee31d696549c1fae0f250460d8a12db13a141b7e : add_nat u31 u3 = u34.
admit.
Qed.
Axiom nat_3 : nat_p 3.
Theorem missingprop_a71faa3b609fd9008fd06262753bf8c3c8470021f77ae19054a8bcacfeb5bcae : add_nat u31 u4 = u35.
admit.
Qed.
Theorem missingprop_0796f968e3c199bc84a6a88f8878e2ecd33ebd2571d4452dc084a33c9e410ef8 : add_nat u31 u5 = u36.
admit.
Qed.
Theorem missingprop_a841c6442b72b6d493b1a77272e460f0b148bcd2dd2ff2d73c18b1bef5cf9c51 : add_nat u31 u6 = u37.
admit.
Qed.
Theorem missingprop_fdca914cf2573c44823ee233ab9a6077a0afd1eeac28025b5599b4c1d6870b25 : add_nat u31 u7 = u38.
admit.
Qed.
Theorem missingprop_123088affb39e1ef47ea9042fafe340be62d91383faa1c63efb60b5532856417 : add_nat u31 u8 = u39.
admit.
Qed.
Theorem missingprop_40321bc2a3d6e40b1c8e9b6e2bcb404f46d0fb163eca5ca029462b991ec2fcae : add_nat u31 u9 = u40.
admit.
Qed.
Theorem missingprop_8fbff946838ec11eeedda2359eb264b4bd256accd70168d8db3bc150478f9536 : add_nat u31 u10 = u41.
admit.
Qed.
Theorem missingprop_1c3f5cb89f9c450b0a31434dd591b76bc9e9baabf174ee35faf87dbe03d85a6f : add_nat u31 u11 = u42.
admit.
Qed.
Theorem missingprop_b8c489d2d8a75bd6503365a8fe6b550beaa06f0fd65a004e7ef34d08c39d42e3 : add_nat u31 u12 = u43.
admit.
Qed.
Theorem missingprop_224c5fb81e7749889119c44ccaf408ea7af13ad4da7514dde71a0f47c75dd3a6 : add_nat u31 u13 = u44.
admit.
Qed.
Theorem missingprop_ff526aa77a5129bb7e5c1ec7e9817280c9115f1da7a797aa67fea724d07a85b9 : add_nat u31 u14 = u45.
admit.
Qed.
Axiom nat_14 : nat_p 14.
Theorem missingprop_9bc97dc587e3e7ce1153c6bbbae70d666fd3763964bfd775296fc8ef840baaa1 : add_nat u31 u15 = u46.
admit.
Qed.
Axiom nat_15 : nat_p 15.
Theorem missingprop_3bdc21259b070b84b64880bebd4552007caeab1d8023aad76473127f6954fea4 : add_nat u31 u16 = u47.
admit.
Qed.
Axiom nat_16 : nat_p 16.
Theorem missingprop_6ec2f6ac6597aa8a27bd71f48872c281b6db35ba57f04411d41d000f21d39490 : add_nat u31 u17 = u48.
admit.
Qed.
Theorem missingprop_b15b07ed0072831707a9af3a2c44827700bb03aea4e95a7bd7ec26aaa40aaf3d : add_nat u31 u18 = u49.
admit.
Qed.
Axiom missingprop_b6349b103ec0c23863292fe6c57a85341c64566cbff4099647a6f20c72c67730 : nat_p u18.
Theorem missingprop_c8da84824b954785d0aad3ac1cab3ea408afb6900e8ea9f4397c25652192285c : add_nat u31 u19 = u50.
admit.
Qed.
Axiom missingprop_fac4bbb30ad81b6694b16257f5c78aca84fe44aabf82317cc19fcd45abcf1690 : nat_p u19.
Theorem missingprop_ded474503863d61ff8d88743109f0c88dc78796c830234726d6e6fd3c83d5ece : add_nat u31 u20 = u51.
admit.
Qed.
Axiom missingprop_07ad204b3b4fc2b51cd8392b0e6a88916124d7f0f3dbf696bec5a683b0ea9dae : nat_p u20.
Theorem missingprop_c3bf5e8b18f5190219cafe709aaf28c88fc217e00cf892600f384e5fbaad77a0 : add_nat u31 u21 = u52.
admit.
Qed.
Axiom missingprop_7349be62636ee4eae8b034332675079cfe34f51caf7eb9379cd936ae90bf351d : nat_p u21.
Theorem missingprop_f06df8a377db63d5dc168703b32e0b86fb5b9f8263ac0bc86410918346441e92 : add_nat u31 u22 = u53.
admit.
Qed.
Axiom missingprop_c873eeccdf6e645ee19271ea61e3647072d01ff54e75e19478129f6b14f6a5a5 : nat_p u22.
Theorem missingprop_97d9e6e79353e0b5fcd36a0798c55c2deabc9a24ac88218db1323dc0de733647 : add_nat u31 u23 = u54.
admit.
Qed.
Axiom missingprop_5a2415de7ce4ff7700953952ab57e066439372e1e8be58d2e9591f8d16f23b1d : nat_p u23.
Theorem missingprop_b5d5cde4d34ab07bc3f005d841e4da2e1843798b6fbe4518d4705b345f8d752a : add_nat u31 u24 = u55.
admit.
Qed.
Axiom missingprop_a7f3578ada9cacf1cb3296f5290d2c691e8a6f96bb11bbe9193ef025e25fc69a : nat_p u24.
Theorem missingprop_3957b61b0a55afc2bf57e4dc91793f98b65c01d301159bc661e37ae5d33fd811 : add_nat u31 u25 = u56.
admit.
Qed.
Axiom missingprop_12d4f070cde272005208a956be7c68072a214891c891a748c20b9d965edfb16c : nat_p u25.
Theorem missingprop_cdbeb8023546d29adc45b5e0379904368d90a17d146201f8cadb838d82fa24c5 : add_nat u31 u26 = u57.
admit.
Qed.
Axiom missingprop_289054093170089dbe39b1d15aa65cd476b1f9d33d6fb8e39a1c75742ce9ba86 : nat_p u26.
Theorem missingprop_788bbe9828a92e5a00088dfb2b8bda376a1f0cc6f5af9d051630bf10267ff3d7 : add_nat u31 u27 = u58.
admit.
Qed.
Axiom missingprop_f5b8583d73a2efa339efab10375e1f72c07bd63d6625dbe8cc0533691448c99e : nat_p u27.
Theorem missingprop_b3bed7b7ef4cf998cdd68d01379607b2941768bc578bf4bc2501d5088b3c3061 : add_nat u31 u28 = u59.
admit.
Qed.
Axiom missingprop_19eb527c16e85f008233bfa7810fc904fefbad1cde11b2548e04c03415cf0dfb : nat_p u28.
Theorem missingprop_9e051930db8c57ed880abf50af016bc0ab5f0053e17f3455e1627e43eed5458e : add_nat u31 u29 = u60.
admit.
Qed.
Axiom missingprop_284d738845c8dd922b78ea459f21b9b25f6f03e2ba8a0191bbde5e72cd637417 : nat_p u29.
Theorem missingprop_ee3662756bf3659c529f5d31f4d0912fa4543a673f251d12a3c4aa67f04d5c80 : add_nat u31 u30 = u61.
admit.
Qed.
Axiom missingprop_18e90a1c9e5d1a2f9712563813c3b99c451e17d7e45a6309a88f3e56013df4c7 : nat_p u30.
Theorem missingprop_5f29c1327d2c86d2bb80f30351058a3c8fd1b15045c54153ce3aff3f55e1b15c : add_nat u31 u31 = u62.
admit.
Qed.
Axiom missingprop_723dd01f4e3b6ead0b114b6935717dcf3e97da79c873ecf977038ff266453fe1 : nat_p u31.
Axiom missingprop_7bf6e58ac0649391f8a282bfdab147c48e1bbed6549cde1b2c604e23fd97b05e : (forall x0 x1 x2, TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x1 x0 x2).
Theorem TwoRamseyProp_u5_u5_u64 : TwoRamseyProp u5 u5 u64.
admit.
Qed.
Theorem missingprop_ae094a61fe658771a881886265e3856ab61a625161665623585771d82a968477 : add_nat u31 u32 = u63.
admit.
Qed.
Axiom add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
Axiom missingprop_e20297641bb65d9e51ebac2e053948365a3f53b65d223d41920ce90b2e26b533 : nat_p u32.
Theorem missingprop_a34b3c5959e47d7a872d45ff0bb955b2395f68e02845b109079692e68f980757 : add_nat u32 u32 = u64.
admit.
Qed.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom add_nat_1_1_2 : add_nat 1 1 = 2.
Axiom mul_add_nat_distrR : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat (add_nat x0 x1) x2 = add_nat (mul_nat x0 x2) (mul_nat x1 x2)))).
Axiom missingprop_6e31f7e63da1d74f4ea3ef967162bc5821029ffe1e451b13664a6e51a570dea7 : (forall x0, nat_p x0 -> mul_nat 1 x0 = x0).
Theorem missingprop_463ff37e0f5b1f0c9f9e5bd24ebf02eb01188a79277f3c1f714af19504beaaf2 : (forall x0, nat_p x0 -> mul_nat u2 x0 = add_nat x0 x0).
admit.
Qed.
Axiom missingprop_e9c4cec7fb327dcb17b88acdaf76daee024e49fa71834a13065f86e12e958609 : (forall x0 x1, nat_p x1 -> exp_nat x0 (ordsucc x1) = mul_nat x0 (exp_nat x0 x1)).
Theorem missingprop_4d619f8c0c4edc98bd8e6be92366236784a59ad7862cae98bda091f9d44c9792 : exp_nat u2 u6 = u64.
admit.
Qed.
Theorem TwoRamseyProp_5_5_Power_6 : TwoRamseyProp 5 5 (Power 6).
admit.
Qed.
