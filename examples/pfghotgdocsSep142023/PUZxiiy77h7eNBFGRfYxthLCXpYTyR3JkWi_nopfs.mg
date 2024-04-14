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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom nat_13 : nat_p 13.
Theorem missingprop_e714af95c05339edf4ed9677f0fb587f2e694e0e319258eab248aff36e70b0de : 0 :e 14.
admit.
Qed.
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom missingprop_8e2e2111bde26e25d7a47d01b5b268c8810126466b647bcb90e18b55c455c55f : 0 :e 13.
Theorem missingprop_2f85f2d4c4f222006e5f502d4f63871f480fc4b14075622acada85b00b4cbe40 : 1 :e 14.
admit.
Qed.
Axiom missingprop_5a0cced658e385a9f161488a0b59850dbe7a95279a48c4a670d8524fa8a8662b : 1 :e 13.
Theorem missingprop_6b35e3e80053aa8265da3fb439ab851ad599f6ce04cab9ae1e5ffe72cb501baf : 2 :e 14.
admit.
Qed.
Axiom missingprop_6358d78f1652f4751c8c205ccef69d4bf259a01c9bce8f7f9da41edadcbf50ba : 2 :e 13.
Theorem missingprop_b958367c5d2493c6a364954780f2119e81a8c4ddf590718604bd41a6e2e3f869 : 3 :e 14.
admit.
Qed.
Axiom missingprop_22cca5a5ee36a7d81fa91f8fd4c14fcb22ddc9f559a5a08a0e1ef4efb6828010 : 3 :e 13.
Theorem missingprop_004edd0d0498f69e618948a8d62531ce881772beb2628312f9acf79a31508331 : 4 :e 14.
admit.
Qed.
Axiom missingprop_fabb5ebdd9913b5bd1e996af7e3e33a951cdac9d03915fded834346562485266 : 4 :e 13.
Theorem missingprop_f37f4ce8c78e6499eddbb886d3a717bf42f92608756f7b705c4000461d6d11f8 : 5 :e 14.
admit.
Qed.
Axiom missingprop_ba9ae8a4863254f3704fa14639bb8327a927c3e786a27bdeb235adb1e0eb1c5a : 5 :e 13.
Theorem missingprop_5005973541e9a8c57e977a23126b3a791b50fd7b26384536a49f8eb6cf69b910 : 6 :e 14.
admit.
Qed.
Axiom missingprop_31fba22fe091af5416a7e9b76f80dbabfc13c323634d731d6fdf59d6dcd3e91a : 6 :e 13.
Theorem missingprop_824525ccb73159d33cb909660b8323aea91ec71e9e32444cce2e7f663c810b38 : 7 :e 14.
admit.
Qed.
Axiom missingprop_269184d50a39177d43eb370da2d073bdeface4a938fbbb03dcf5be3dc6e07dc8 : 7 :e 13.
Theorem missingprop_f2e483493aff88182c91ba90344f3fdfdd75e2acab769b9d50a99359063f03f5 : 8 :e 14.
admit.
Qed.
Axiom missingprop_d21f00b59e27a2a5e30acb5e1bd89e8682be02902fa61c5da12efa36345aa0e9 : 8 :e 13.
Theorem missingprop_a4994e0d1d53e7cfe0ce2ab1ab13b60794adaa1584ab44f9f438a9149efeb46c : 9 :e 14.
admit.
Qed.
Axiom missingprop_09f15a9d01f93a7528fa5f6c03657a2913fb0b654a203b3e012c73dd58be381d : 9 :e 13.
Theorem missingprop_e1f2a5f1ac8e510396d89f489992432351308c0cb648ce3335497b7913c45f8e : 10 :e 14.
admit.
Qed.
Axiom missingprop_d703c22df6cc6298b53c92b18e251e56993b7c6bc6cd746cfad81dffd4a31e23 : 10 :e 13.
Theorem missingprop_0e08153098aa7e1013c36fe20b5242ee1d35d86d020cf545c992104e5b92f57c : 11 :e 14.
admit.
Qed.
Axiom missingprop_d0b907f11f7106146d29548fcb3a49e74411d92136323f4b4174f28479e56fcb : 11 :e 13.
Theorem missingprop_e37df030330f0faf96481b3b3d37cb0f2519e7285bb069f35fbcf2d13374199d : 12 :e 14.
admit.
Qed.
Axiom missingprop_aac233feaa0aa18324c0d692b3f19bd8318b55545ab88208c741a1f8b442a053 : 12 :e 13.
Theorem missingprop_331badb0bc2cb72fdd31f16934f9ba3896484f4038f5056bfa218c35501c067b : 13 :e 14.
admit.
Qed.
Axiom nat_14 : nat_p 14.
Theorem missingprop_524d83143154d5d95661710a112299dfd9761663d7039bc072fe66b06195afa1 : 0 :e 15.
admit.
Qed.
Theorem missingprop_78141141dae6738a75a76bc9d0bf6f9cc0b30cd7be7ac9ba169e0254189ea678 : 1 :e 15.
admit.
Qed.
Theorem missingprop_2df74bd30aa4a761a848039da52e6532e95c3715ab4f07239c636a3bccbe4379 : 2 :e 15.
admit.
Qed.
Theorem missingprop_c24d35cc2ae44ccb0484e52ba665299e568fa8d369408631dab63a084e385fa6 : 3 :e 15.
admit.
Qed.
Theorem missingprop_afd253bcd93e0d3f034af43482e32363ac37c21b116e35b6d40f9e20d040f304 : 4 :e 15.
admit.
Qed.
Theorem missingprop_24850bbd5692d363535959d85da04a5abc5e3c456f9570e4064d22e42434dc29 : 5 :e 15.
admit.
Qed.
Theorem missingprop_92f077fe31aef5065d6f394b7909429587961bc7138ef5756fc3f1b72647a12c : 6 :e 15.
admit.
Qed.
Theorem missingprop_d79c6cd5d0e2aadd9303e7b56e18b2cc4dd014bffb1cebdc8f458f9db9c9b66d : 7 :e 15.
admit.
Qed.
Theorem missingprop_47bd4e0b46a48c94d979fff247f7d8ba8496ee40225dc042fb16aa3fd9452740 : 8 :e 15.
admit.
Qed.
Theorem missingprop_6fd275a00105dae9bd53553a469745defdbeaecf23b58228d3a4e8e0c0232271 : 9 :e 15.
admit.
Qed.
Theorem missingprop_ec6e3d50eb14cfc6307d1a45a109f001d79d22a76384dc370d97debd47cfac7c : 10 :e 15.
admit.
Qed.
Theorem missingprop_fa667b0189a0636fab1122d52f50858380b22d14941c9ea2917a7a18d515ca33 : 11 :e 15.
admit.
Qed.
Theorem missingprop_aa483142be20403c05651093e77bf2da9ed1089804c07ed444e477459b766dab : 12 :e 15.
admit.
Qed.
Theorem missingprop_55ce0d0bbadbcce03106d52b0cf6c8262f1bee1c843083b35104f8ba47de98c7 : 13 :e 15.
admit.
Qed.
Theorem missingprop_6596ffb376d868a993d672d4e104aa09f5055d54e0d97b478501a938a69c460f : 14 :e 15.
admit.
Qed.
Axiom nat_15 : nat_p 15.
Theorem missingprop_fff531c49970071934428d0aef9046ef564b1c688918cc28a68137a9f7d29720 : 0 :e 16.
admit.
Qed.
Theorem missingprop_5652f21220a21736c3c1c7ff394952ea63f98e4255215cdb9aaab91866efe7dd : 1 :e 16.
admit.
Qed.
Theorem missingprop_c38dc1b25a0e2dc5936848fac54d16b82c023e49a17d0d1875549efe638d7dec : 2 :e 16.
admit.
Qed.
Theorem missingprop_2af8bf40bf7eaefd36fa12e21921eb2aeb029dbe2775546e49d5225f179719d9 : 3 :e 16.
admit.
Qed.
Theorem missingprop_146ef1143e471cfbb8d96545c2df24929043ca109ec4a7c8c78dd73fb371c488 : 4 :e 16.
admit.
Qed.
Theorem missingprop_64382522dade5b30fc9c1f845f10dec6adec6991c810bee97f2f66f396cf6712 : 5 :e 16.
admit.
Qed.
Theorem missingprop_57616fbbcabc28eb1fb6407d841dda3edd107d79e8fcb804834746df27c3a6ca : 6 :e 16.
admit.
Qed.
Theorem missingprop_7f2d06b1efe37247a690b4e859e3aaf365f1da38cf576ae8a74607a7521a1608 : 7 :e 16.
admit.
Qed.
Theorem missingprop_f46bab0aaac49b12c19f821162ddb9736708dc036bc97f4e4318712d56c44f37 : 8 :e 16.
admit.
Qed.
Theorem missingprop_96f337a74f7b868e3a36513c42dd4d06e5187cd640ec479c0814272a65371d35 : 9 :e 16.
admit.
Qed.
Theorem missingprop_4eba3f0917ffb7ab4575d03fa353c824d8d4f151df45c3ade8f1ca296d4cc0ee : 10 :e 16.
admit.
Qed.
Theorem missingprop_ae3e46fe1608a88c13cfd94c7c4f636604e089dbe99822d5f16bc7323d0026af : 11 :e 16.
admit.
Qed.
Theorem missingprop_6e0619c3165595ae4977f8d2ecfade1c59a6348e91d9234d9239b2fe0fb04ddf : 12 :e 16.
admit.
Qed.
Theorem missingprop_279fe6eb4b3ee21a0be2650377dfae573b176ecc12970f64812a6be52f3acfb9 : 13 :e 16.
admit.
Qed.
Theorem missingprop_b79a9b70d083f86c18981643e47c737565f20b5a8d9333bff56376600ec4e5a4 : 14 :e 16.
admit.
Qed.
Theorem missingprop_f388ecefb2fe6e2e313ca750501544c7c4c2bb13327baa7d874fe8dbdb4dc6e4 : 15 :e 16.
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom missingprop_b985b5127f0100fc0eba8ad64e545f7345a40cce1500156aad2cefd6c74fb978 : add_nat 16 13 = 29.
Theorem missingprop_8f9c55acc7081452800e14f00ac54568cda1e4ce4c41d75ba31e650106792789 : add_nat 16 14 = 30.
admit.
Qed.
Theorem missingprop_9103260c206e0ecf4618e9ba0a6607d292c9b97fc0039111377d6b21d34b2dd7 : add_nat 16 15 = 31.
admit.
Qed.
Theorem missingprop_de864b47665083064c24ffdfe59603868a4229c0f77319f6c6be7c92dbecbe0f : add_nat 16 16 = 32.
admit.
Qed.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom missingprop_344c784b1c3b94c370e58970c6c07f9652a98f817bb26a71614a2661ed1216a6 : add_nat 8 8 = 16.
Axiom mul_add_nat_distrL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat x0 (add_nat x1 x2) = add_nat (mul_nat x0 x1) (mul_nat x0 x2)))).
Axiom nat_2 : nat_p 2.
Axiom nat_8 : nat_p 8.
Axiom missingprop_36374898b358f79d17b8b2339ff8c1fbf04a96c8611bd3a9eaa03c3fcb156f33 : mul_nat 2 8 = 16.
Theorem missingprop_0ea4d9117f5e04c7f1289250df7ab43a5ad0c6cef376e453fd3c5c502e8be6da : mul_nat 2 16 = 32.
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition exp_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec 1 (fun x1 : set => mul_nat x0)).
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Axiom nat_4 : nat_p 4.
Axiom missingprop_18dab10013860d442d73fc2b55cfee57e61b2e3044d2d0c29767dba9e5eb2112 : exp_nat 2 4 = 16.
Theorem missingprop_8e67f22739f9a01fd2d9438edd2f3f6d8d323d1fa4d050bc09f5b1af8d3b6dd7 : exp_nat 2 5 = 32.
admit.
Qed.
Axiom missingprop_1b73e01bc234ba0e318bc9baf16604d4f0fc12bea57885439d70438de4eb7174 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_nat x0 x1))).
Axiom nat_5 : nat_p 5.
Theorem missingprop_e20297641bb65d9e51ebac2e053948365a3f53b65d223d41920ce90b2e26b533 : nat_p 32.
admit.
Qed.
Axiom missingprop_441f51eac9a2dfe161ce38a8744a6c32b2686e6c04076ec100ae43cffb074cd3 : (forall x0, nat_p x0 -> ordsucc (exp_nat 2 (ordsucc x0)) :e exp_nat 2 (ordsucc (ordsucc x0))).
Axiom nat_3 : nat_p 3.
Theorem missingprop_a88c85c6f3bdc8051d7ba28ca09445c45d7f982fd1cec9a3ed2cdf307b04bd69 : 17 :e 32.
admit.
Qed.
