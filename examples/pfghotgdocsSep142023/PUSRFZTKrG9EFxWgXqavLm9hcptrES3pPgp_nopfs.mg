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
Definition ChurchNum_p : ((set -> set) -> set -> set) -> prop :=
 (fun x0 : (set -> set) -> set -> set => forall x1 : ((set -> set) -> set -> set) -> prop, x1 (fun x2 : set -> set => fun x3 : set => x3) -> (forall x2 : (set -> set) -> set -> set, x1 x2 -> x1 (fun x3 : set -> set => fun x4 : set => x3 (x2 x3 x4))) -> x1 x0).
Theorem missingprop_77fce829d53f349f0705c06748dace75541a742f23178672483014908d495c64 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x1).
admit.
Qed.
Theorem missingprop_f8517820c41e80abae5090668a4d7f9c31465f066f11281cc9990a74d008bfa1 : (forall x0 : (set -> set) -> set -> set, ChurchNum_p x0 -> ChurchNum_p (fun x1 : set -> set => fun x2 : set => x1 (x0 x1 x2))).
admit.
Qed.
Theorem missingprop_9492eda3f4288329c7343262dda5eae37e08c34cd783f7bb0ddb22a0cc0d8c73 : ChurchNum_p (fun x0 : set -> set => x0).
admit.
Qed.
Theorem missingprop_97e3ff168096656c305ade85600b40fd44b9a25b42a0301a15eb0995f9b07a20 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 x1)).
admit.
Qed.
Theorem missingprop_110ade193234bb5286d3b2b2cb2740db91b5e054f9653e348157ae3f0ccc99a2 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 x1))).
admit.
Qed.
Theorem missingprop_0f550b8cced5ea1f455298ffde5b88dddc3f6692b79c37a449e508fb9e7a27ed : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 x1)))).
admit.
Qed.
Theorem missingprop_d5dbeec732ea01f927877e2420b51cb5c68f473bf98d93e8571ddfd3f7adea18 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 x1))))).
admit.
Qed.
Theorem missingprop_d88f1786c40d73ebcad9492ae157666ffaa1a988fabe7b490c410a05ef1ea275 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 x1)))))).
admit.
Qed.
Theorem missingprop_244f92d1ef35f541900903a199eb75382ef3f1407f48313668f9e621d6c336d4 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))).
admit.
Qed.
Theorem missingprop_b9e6d5b35571f03f64e8d464e3aeeb947c17781fcebbb508bd1e4f61ea58ad5e : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))).
admit.
Qed.
Theorem missingprop_10e8d2b4c5c6b60f0e753f919b265e0d0bc29433d8f6ebf84d7f5f1a61d607ca : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))))).
admit.
Qed.
Theorem missingprop_127246c57adc93f5032e352a4463561387a9b3b9f04766e1c57313b7a93b14ff : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))).
admit.
Qed.
Theorem missingprop_ed572293a6fa0ec02a803cad7d3df6b0e0146a679954f245b5255a74225de76b : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))))))).
admit.
Qed.
Theorem missingprop_e8e6d5cd52803fa78978937f5cadf0b90ae1da5571c1821cbca428bd99b61202 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))))).
admit.
Qed.
Theorem missingprop_6f75760011b83dd62192f21bec4d99d5da7114ae04a9f9bfd52a18780ec3afb0 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))))))))).
admit.
Qed.
Theorem missingprop_c82ade8f2c47f0c96ae358976cd7afa49e9cf4aff130209e6d013c37dfa3ff3d : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))))))).
admit.
Qed.
Theorem missingprop_b69aeea3b10b846ee5e419c1b471f03ef85ead2b77c13f4aa8b04c94af6c6775 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))))))))))).
admit.
Qed.
Theorem missingprop_7e53aa3740bca8a41f4e3f030a672ac7ce727b68c9f03a254f28bf1249178602 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))))))))).
admit.
Qed.
Theorem missingprop_2169d21de601d42cf8c0876b332a1b9f60ec3afcda9c9b50cf06e052fa439595 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))))))))))))).
admit.
Qed.
Theorem missingprop_3392c7cde6ec762e870dfa5fcd6723ccfa166404324c82cc233cb752921f6a90 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))))))))))).
admit.
Qed.
Theorem missingprop_0b2248e98d0d89125f4c53421eabb107ce2599353975237d878ac71e2eb664b5 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))))))))))))))).
admit.
Qed.
Theorem missingprop_44091bde3786efbd683bdef95eb60f243ec6edb4d9a52a061406d636da2c7f68 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))))))))))))).
admit.
Qed.
Theorem missingprop_5736f28d08664b9b7be676af8fe97d8bc5ccb918218c45c8c1dc935bd28d649e : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))))))))))))))))).
admit.
Qed.
Theorem missingprop_cd2e82ef4221082a96ca4495b573c10f870eabc28fd174aa5eb72ee3150cae4b : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))))))))))))))).
admit.
Qed.
Theorem missingprop_0fd891c8090e437a02cb331284806bb8d4119418be06c9d213839e603cf27756 : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1))))))))))))))))))))))).
admit.
Qed.
Theorem missingprop_683b31a96d54639705989dfcedd08037bc907502adb9c50146748af1be31cd2f : ChurchNum_p (fun x0 : set -> set => fun x1 : set => x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 (x0 x1)))))))))))))))))))))))).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_0 : nat_p 0.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem missingprop_bf1bd8ab3ca5ea3ddb87610422183f92c6934b1f09d04b825e575ec48e6ebd16 : (forall x0 : (set -> set) -> set -> set, ChurchNum_p x0 -> nat_p (x0 ordsucc 0)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_303bff2572d2d5fbabc1328fdc3f835744c1695a347f858c2406311107d2025e : (forall x0 : ((set -> set) -> set -> set) -> prop, x0 (fun x1 : set -> set => fun x2 : set => x2) -> (forall x1 : (set -> set) -> set -> set, ChurchNum_p x1 -> x0 x1 -> x0 (fun x2 : set -> set => fun x3 : set => x2 (x1 x2 x3))) -> (forall x1 : (set -> set) -> set -> set, ChurchNum_p x1 -> x0 x1)).
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_0L : (forall x0, nat_p x0 -> add_nat 0 x0 = x0).
Axiom add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
Theorem missingprop_566d903739470afda40d64020ac73735d543ec3209342e2b92a42fa9f217751d : (forall x0 : (set -> set) -> set -> set, ChurchNum_p x0 -> (forall x1 : (set -> set) -> set -> set, ChurchNum_p x1 -> x0 ordsucc (x1 ordsucc 0) = add_nat (x0 ordsucc 0) (x1 ordsucc 0))).
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
Theorem missingprop_b6349b103ec0c23863292fe6c57a85341c64566cbff4099647a6f20c72c67730 : nat_p u18.
admit.
Qed.
Definition u19 : set :=
 ordsucc u18.
Theorem missingprop_fac4bbb30ad81b6694b16257f5c78aca84fe44aabf82317cc19fcd45abcf1690 : nat_p u19.
admit.
Qed.
Definition u20 : set :=
 ordsucc u19.
Theorem missingprop_07ad204b3b4fc2b51cd8392b0e6a88916124d7f0f3dbf696bec5a683b0ea9dae : nat_p u20.
admit.
Qed.
Definition u21 : set :=
 ordsucc u20.
Theorem missingprop_7349be62636ee4eae8b034332675079cfe34f51caf7eb9379cd936ae90bf351d : nat_p u21.
admit.
Qed.
Definition u22 : set :=
 ordsucc u21.
Theorem missingprop_c873eeccdf6e645ee19271ea61e3647072d01ff54e75e19478129f6b14f6a5a5 : nat_p u22.
admit.
Qed.
Definition u23 : set :=
 ordsucc u22.
Theorem missingprop_5a2415de7ce4ff7700953952ab57e066439372e1e8be58d2e9591f8d16f23b1d : nat_p u23.
admit.
Qed.
Definition u24 : set :=
 ordsucc u23.
Theorem missingprop_a7f3578ada9cacf1cb3296f5290d2c691e8a6f96bb11bbe9193ef025e25fc69a : nat_p u24.
admit.
Qed.
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Theorem missingprop_03d05df17e6d0dfb61078a328f1fe2af259d04334e9272f9fef14f1c809e2510 : 0 :e u24.
admit.
Qed.
Axiom missingprop_65854e80dcdfdaad216d9278c1826bfa6e412eacf7818f3d49e43d93a23f7bcf : (forall x0 x1, nat_p x1 -> x0 :e ordsucc (add_nat x0 x1)).
Theorem missingprop_c5dd54ff540c2e7015553cdd315dc8688381b6bedc976f1e457626e8ffdaa856 : u1 :e u24.
admit.
Qed.
Theorem missingprop_3f854ddba19afed67e8e7c926514f1031501db7e4b15f32b9d5f01b0cada5e81 : u2 :e u24.
admit.
Qed.
Theorem missingprop_2fff731f478df28c1a674607897f3e9c9ecbfa9595ccaf6e18f905ceb0bb25f7 : u3 :e u24.
admit.
Qed.
Theorem missingprop_e96e9e50864a786761e09a3f4fd2da9f54dbbfeb3b82424aad75a5f448944fc0 : u4 :e u24.
admit.
Qed.
Theorem missingprop_d89f2f1f31e09b27071252de7f4d74d86cc2d23db60c955d9f549cb676628a10 : u5 :e u24.
admit.
Qed.
Axiom nat_17 : nat_p 17.
Theorem missingprop_c7d0fe73935e70bba08ba24f03fb35b0b0abe6a7eabe725f9cb73b15035c09a0 : u6 :e u24.
admit.
Qed.
Axiom nat_16 : nat_p 16.
Theorem missingprop_235e5677af1fafe89d2bb2697544cf837edf8151a25dda26f98acabae5fdae0b : u7 :e u24.
admit.
Qed.
Axiom nat_15 : nat_p 15.
Theorem missingprop_0f4c81eb7b5e834ce321d2838b45d881fed01d1791f152bb3c26d1422ae365df : u8 :e u24.
admit.
Qed.
Axiom nat_14 : nat_p 14.
Theorem missingprop_5787addd81097ac2ea7fd3b1172abfbf1a30344b5fc4ed1cd47246895b0f0015 : u9 :e u24.
admit.
Qed.
Axiom nat_13 : nat_p 13.
Theorem missingprop_1a4e0d2300206843eb688a99c9a35f2824c67ede9ae4bb884800a018d354645f : u10 :e u24.
admit.
Qed.
Axiom nat_12 : nat_p 12.
Theorem missingprop_9f645751091168159704c2a4206614a886f67e90634a40cb2f1007a1ded74870 : u11 :e u24.
admit.
Qed.
Axiom nat_11 : nat_p 11.
Theorem missingprop_b5a5df59295203515b45ba4025b056a60d583244db6a49137478b750da43f7b3 : u12 :e u24.
admit.
Qed.
Axiom nat_10 : nat_p 10.
Theorem missingprop_0abeefeb4eb46933d72e1a486c5473e97cee56ce97496efd9a5a68ce64ee26af : u13 :e u24.
admit.
Qed.
Axiom nat_9 : nat_p 9.
Theorem missingprop_0cac1a9a7834a54f96522175004935f81e185228129aa1df54e676c23f6ba995 : u14 :e u24.
admit.
Qed.
Axiom nat_8 : nat_p 8.
Theorem missingprop_d83162a850ff828abdce8caffc89679e0d80feb1430ae78d594baabb506d1d2d : u15 :e u24.
admit.
Qed.
Axiom nat_7 : nat_p 7.
Theorem missingprop_d993a4c14e25e07f108ccf71eb70196df4d041cab22f0c34487d2c84bc066b21 : u16 :e u24.
admit.
Qed.
Axiom nat_6 : nat_p 6.
Theorem missingprop_f394ff739bed714709cba792c9696d92733c1ded61ca062a9b12d82ac41ecddb : u17 :e u24.
admit.
Qed.
Axiom nat_5 : nat_p 5.
Theorem missingprop_1eec97728e0a8c57720abd635b866ba21b7660f2d2ba57d23e943bb9c927f0f6 : u18 :e u24.
admit.
Qed.
Axiom nat_4 : nat_p 4.
Theorem missingprop_f65b9a80bd646b6589aee836a42c9ac33767f16f532b283c44342f4b01838f80 : u19 :e u24.
admit.
Qed.
Axiom nat_3 : nat_p 3.
Theorem missingprop_3eb01877a04a9d2c419449ab855e4f00a8d0766102ebceb0dd5045731d380063 : u20 :e u24.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Theorem missingprop_64b0a32ee640e413f579b7c26b4a57c295e6dda24858871cd7ae4f4bfcaa9d7b : u21 :e u24.
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_14b4339c93681d1ce5d3452c08084b60a24ed9313066dea7cc1c9e3ed973d5c5 : u22 :e u24.
admit.
Qed.
Theorem missingprop_cd8132c085d47d8171587cae6c2ea06064bae5af42b68a66661992fe9aa230cd : u23 :e u24.
admit.
Qed.
