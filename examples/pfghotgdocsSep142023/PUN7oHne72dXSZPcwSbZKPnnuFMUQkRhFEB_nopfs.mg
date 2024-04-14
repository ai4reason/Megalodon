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
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter SetAdjoin "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" "1f3a09356e470bff37ef2408148f440357b92f92f9a27c828b37d777eb41ddc6" *)
Parameter SetAdjoin : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => binunion x1 {SetAdjoin x3 (Sing x0) | x3 :e x2}).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb : set -> set -> set :=
 missingname_691c14162849c837265499ee2d44fffcf0e54477d8d5053f934f651bf84f58be 2.
Axiom missingprop_872273e895264b163d3a3b042c5d1abf262e26919401a643ccce2dcdcb6a14ef : (forall x0, forall x1 : set -> set -> prop, x1 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 0) x0 -> x1 x0 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 0)).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom missingprop_91df53020fea6a9ff4cc6802b4e01884637366fdcf8bc35cea3e79e3c777050d : (forall x0 x1 x2 x3, SNo x0 -> SNo x2 -> missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x3 -> x0 = x2).
Axiom missingprop_099a43452f71b99572a0fc9274d07254641d0dd9bc5a2bb9941dc1314f377a3f : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x3 -> x1 = x3).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (SNo x2) (forall x3 : prop, (forall x4, and (SNo x4) (x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x4) -> x3) -> x3) -> x1) -> x1).
Axiom missingprop_942959aad6790cf3a71a2f8f2b9ffc552b42fb28a7f163a4f5e7e7842fdbd934 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1)).
Axiom missingprop_e73e07ecfeb5f0c05c137b34b758a03a6c1a818d92f2bc592020af36f35702e2 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> (forall x1 : set -> prop, (forall x2 x3, SNo x2 -> SNo x3 -> x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x3 -> x1 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x3)) -> x1 x0)).
Definition missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 : set :=
 missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb 0 1.
Definition missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (SNo x1) (forall x2 : prop, (forall x3, and (SNo x3) (x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x1 x3) -> x2) -> x2))).
Definition missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (SNo x1) (x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) x1))).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem missingprop_9846a3b9b296163e6b61794e26bc3e26fa2fbe6bf441b272a5bec41a167f1c0b : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> and (SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)) (forall x1 : prop, (forall x2, and (SNo x2) (x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) x2) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_be33d753151483c7bac1e70b0036b153d449838792ed17caa64a7328dfc698e0 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) = x0).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_8da13791b7dd1ebf2304410ec45eba97dfe397ef11526a77be93821c0ea7f214 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> and (SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0)) (x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0))).
admit.
Qed.
Theorem missingprop_a297e56f8bdca4759c242f4239a030f8b8676cee62a6758763e7f37b72905c22 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) = x1).
admit.
Qed.
Theorem missingprop_62ffbce17a1080b510b3d10f88e78f4b8e9088a2c54409ce0c70e91f74a9fd08 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)).
admit.
Qed.
Theorem missingprop_f319423ed101339f42129d35c36f78ec84ab916352e52ec279686150bcbdfec5 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0)).
admit.
Qed.
Theorem missingprop_5b83866c440783e0b1a158e0891e967d7f7864776be8302794e7cb2317ac7efc : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0)).
admit.
Qed.
Theorem missingprop_544f4d34085c39fe852eae7f16fd7fa4f1aacc16d23d4ca0f8649dd632a3ab3b : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0 = missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0 = missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1 -> x0 = x1).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb : set -> set :=
 (fun x0 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (minus_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)) (minus_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0))).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Definition missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e : set -> set -> set :=
 (fun x0 x1 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (add_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)) (add_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1))).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 : set -> set -> set :=
 (fun x0 x1 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)) (minus_SNo (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)))) (add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)) (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)))).
(* Parameter div_SNo "27f4b5fe59b60da9c8b15247476d431fa3e527c47c22bad7c6d8cb3c2668e2e0" "a77cc83b548d1c105523434377d695400e899aad3044b9efb16632cbba12c5d6" *)
Parameter div_SNo : set -> set -> set.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Definition missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 : set -> set :=
 (fun x0 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (div_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (add_SNo (exp_SNo_nat (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) 2) (exp_SNo_nat (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) 2))) (minus_SNo (div_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (add_SNo (exp_SNo_nat (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) 2) (exp_SNo_nat (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) 2))))).
Definition missingname_d0de473f7fa61d5185a8cdd703ad688cc273b1e2ddc9e23a5e07cb61fcebb1ac : set -> set -> set :=
 (fun x0 x1 : set => missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 (missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 x1)).
Axiom SNo_0 : SNo 0.
Axiom SNo_1 : SNo 1.
Theorem missingprop_224fb7f4803ba78358f697f893e95590c4e14e659c18fa69f543bf5575584376 : missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5.
admit.
Qed.
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem missingprop_40deb3eb79d5c5c71aa80bf50721dae39b2777908706a659e2492aac0f4c8c12 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0) = minus_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)).
admit.
Qed.
Theorem missingprop_2e2911def6d617e9877d8d3d54cce3e132e00bcc264b811c0199832ff73abcca : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0) = minus_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0)).
admit.
Qed.
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Theorem missingprop_9d7a134423d1f17ac48e0d0adf872beb67ffd28835aafce6857803caa53395b8 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1) = add_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)).
admit.
Qed.
Theorem missingprop_4cf7e37a6ab800182cf95b035af5fa182d20bc5cf8a7d8512b5f4546ecd76d7d : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1) = add_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)).
admit.
Qed.
Theorem missingprop_56bf40f15e9770234ed1fb7263ac5b3ae942c5eb4a45b231ea1ccc4a7c47607b : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0)).
admit.
Qed.
Theorem missingprop_8acfb80b309c166e5c3c41e4a1cc49c4ea05db3f03d215384dabecf7c22c27a2 : (forall x0, SNo x0 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0 = x0).
admit.
Qed.
Theorem missingprop_2a9fa88c4206964d15bfbbc297f8b3b39425bd997c7d45b304d4d13c3943fd64 : (forall x0, SNo x0 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0 = 0).
admit.
Qed.
Theorem missingprop_56a3846d90f4ab1e1cdbc7eded30831439b09ed314019fdcbda6415f78b5a7c9 : missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d 0 = 0.
admit.
Qed.
Theorem missingprop_83b1da2d18321ff78f0ba79977e134354a0cd5daef142de6498660d639616d8d : missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 0 = 0.
admit.
Qed.
Theorem missingprop_9b68e93594637a66575dc4fd1ad90d2309eae3336936493b756143a5919b89d8 : missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d 1 = 1.
admit.
Qed.
Theorem missingprop_7803f73eb86bb0e87054b9e4c7ea003d2954cfcb800eceb200756626e361574d : missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 1 = 0.
admit.
Qed.
Theorem missingprop_6cb868b3ac14c8173d932471a0611ae27ef4d2fe2845a5d2b3492b374255c072 : missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 = 0.
admit.
Qed.
Theorem missingprop_a2891cc356bee2884c8b803c82aa7d5aeb109368f2ad94fe2c0a7ccd118f6cf7 : missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 = 1.
admit.
Qed.
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Theorem missingprop_5ec4406080bbb8278d40882f45b5a04fbb9718208d1d7b02940492cc03eebf06 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1).
admit.
Qed.
Theorem missingprop_bd5981e19f6fd2750e3780c8b12e5db09c80d0fb28501255dac56b08927531d7 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1)).
admit.
Qed.
Theorem missingprop_ba81fad95a9d1d364cfc9af4771fccfdd3c718dc7c520ce3b65063b382313046 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e 0 x0 = x0).
admit.
Qed.
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Theorem missingprop_f9887f5a52555fe290bfb35955cc69859d324bb709fb9cbee2ec19d82d6ba36d : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 0 = x0).
admit.
Qed.
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Theorem missingprop_283429c4431157fca7a53248f03c83c7badcd3b2e96e2afed95550dd4820a937 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0) x0 = 0).
admit.
Qed.
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Theorem missingprop_41522bb82b4a40db7a862ebc6f940eac954a87080a45104006e131c642b75d4f : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0) = 0).
admit.
Qed.
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Theorem missingprop_4cee581ef1612885ab3f14974d02ee940e6b9f207b2ffb992ad58ca71306fe41 : (forall x0, SNo x0 -> minus_SNo x0 = missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0).
admit.
Qed.
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Theorem missingprop_9c826bdbc250f1372459c98433eaaca7d40b700e4af84c3df5b03cfebe249e06 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1 = missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x1 x0).
admit.
Qed.
Axiom f_eq_i : (forall x0 : set -> set, forall x1 x2, x1 = x2 -> x0 x1 = x0 x2).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Theorem missingprop_4993d42a5e417811e7f0f932b05c69c472353ad26b0c3d9a27095e75db5ac8b3 : (forall x0 x1 x2, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x2 -> missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x1 x2) = missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1) x2).
admit.
Qed.
