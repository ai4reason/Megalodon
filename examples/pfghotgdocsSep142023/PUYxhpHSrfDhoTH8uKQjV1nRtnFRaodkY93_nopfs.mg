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
(* Parameter missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 "268018e0b164e7ebf0c4bc21dd04df92c2bf72855b4acf204bd91317b6eae719" "9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348" *)
Parameter missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 : set -> prop.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d "c8adc3d5367ab1b1b6c5b2ef30d5740eacf73564a2a3f2b58bf38975d35c67f5" "32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d" *)
Parameter missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d : set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
(* Parameter missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 "c7cd95616937a2fe344db0729f874251d5084860aae6447085c00eb6e541a494" "1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9" *)
Parameter missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 : set -> set.
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom missingprop_62ffbce17a1080b510b3d10f88e78f4b8e9088a2c54409ce0c70e91f74a9fd08 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom missingprop_f319423ed101339f42129d35c36f78ec84ab916352e52ec279686150bcbdfec5 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0)).
Theorem missingprop_916eabb01395847448c5739412eb46b3aafdcdfab34542ba5fecaa06133fe139 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> SNo (add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)) (minus_SNo (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1))))).
admit.
Qed.
Theorem missingprop_7083a139bc7e19efb3b21ade8c2b9a46f3141ffe50f655394b0aacc215493415 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> SNo (add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)) (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)))).
admit.
Qed.
(* Parameter missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb "772a7c567e28ad27fa69135479dc379287047d22ebf4f74ff56731a689dafb00" "c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb" *)
Parameter missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb : set -> set -> set.
Definition missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 : set -> set -> set :=
 (fun x0 x1 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)) (minus_SNo (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)))) (add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)) (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)))).
Axiom missingprop_be33d753151483c7bac1e70b0036b153d449838792ed17caa64a7328dfc698e0 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) = x0).
Theorem missingprop_4968bd623f3943ab796d9190455409465e0c0409a5e53d9638f7972113632bb2 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 x1) = add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)) (minus_SNo (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)))).
admit.
Qed.
Axiom missingprop_a297e56f8bdca4759c242f4239a030f8b8676cee62a6758763e7f37b72905c22 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) = x1).
Theorem missingprop_9d5a308931061d971c97715167336c847591a0ff3d407941839111148d4a1c26 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 x1) = add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)) (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1))).
admit.
Qed.
Axiom missingprop_942959aad6790cf3a71a2f8f2b9ffc552b42fb28a7f163a4f5e7e7842fdbd934 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1)).
Theorem missingprop_1e54c152aee7ef8283537f5082641c03c3fbbd1d157feb0ededf5aa5b26b9be6 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 x1)).
admit.
Qed.
Axiom missingprop_544f4d34085c39fe852eae7f16fd7fa4f1aacc16d23d4ca0f8649dd632a3ab3b : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0 = missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0 = missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1 -> x0 = x1).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Theorem missingprop_f37f20a96c618251b9c92e90538dbefddf2c047bc7c8a5b29a56d59884f260e6 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 x1 = missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x1 x0).
admit.
Qed.
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom SNo_mul_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (mul_SNo x0 (mul_SNo x1 x2))).
Axiom add_SNo_rotate_4_0312 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x3) (add_SNo x1 x2)).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Theorem missingprop_0cbbeebb95a7f168b5e862a970641f14a91f35409b73d58aa0909c05bc090d26 : (forall x0 x1 x2, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x2 -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x1 x2) = missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 x1) x2).
admit.
Qed.
Axiom missingprop_d5b3979eda0b2ffa5796e15ffae00de7d64c34c0b372e55d71aaaed66e4f9845 : (forall x0, SNo x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0).
Axiom SNo_0 : SNo Empty.
Theorem missingprop_b4316292931563d291cab67be953e19855cf184cebf853f1652805c2fc86ce17 : missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 Empty.
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom SNo_1 : SNo 1.
Theorem missingprop_c8933a80727b5e665a49337ab7e8b345c189d5ed12f4a6046d13052c07348477 : missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 1.
admit.
Qed.
Axiom missingprop_872273e895264b163d3a3b042c5d1abf262e26919401a643ccce2dcdcb6a14ef : (forall x0, forall x1 : set -> set -> prop, x1 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 0) x0 -> x1 x0 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 0)).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Theorem missingprop_2a5b9d365406868b1eefe46cf929c391d228d46308f092c9e037839d8dddff52 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 1 x0 = x0).
admit.
Qed.
Theorem missingprop_83370018e8a40f3ab157e1e56329da4b591522c94608a8aeafaec4deef233961 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 1 = x0).
admit.
Qed.
(* Parameter missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e "be30fbfdd8cd2d5038683e4e676acbe4cb2a8010b914c982c434ff3abec72652" "2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e" *)
Parameter missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e : set -> set -> set.
Axiom missingprop_bd5981e19f6fd2750e3780c8b12e5db09c80d0fb28501255dac56b08927531d7 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1)).
Axiom missingprop_9d7a134423d1f17ac48e0d0adf872beb67ffd28835aafce6857803caa53395b8 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1) = add_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)).
Axiom missingprop_4cf7e37a6ab800182cf95b035af5fa182d20bc5cf8a7d8512b5f4546ecd76d7d : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1) = add_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)).
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Theorem missingprop_3ee1fbb106aa2023b0483e2c6eaee3e3afb89c2fcc8f7e659d099483f9ef2071 : (forall x0 x1 x2, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x2 -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x1 x2) = missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 x1) (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 x2)).
admit.
Qed.
Axiom missingprop_8acfb80b309c166e5c3c41e4a1cc49c4ea05db3f03d215384dabecf7c22c27a2 : (forall x0, SNo x0 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0 = x0).
Axiom missingprop_2a9fa88c4206964d15bfbbc297f8b3b39425bd997c7d45b304d4d13c3943fd64 : (forall x0, SNo x0 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0 = 0).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Theorem missingprop_5ed63f210f687ed3640b5fbe6b6db2920b96d83b956d4c2710cd24c78340304d : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 x1).
admit.
Qed.
(* Parameter missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 "1d43c8c0b0edd613cd78aebb0fef066ffbf48d1301e564e0275e30d79ff9d534" "dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5" *)
Parameter missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 : set.
(* Parameter missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb "7186e9dcc5fb0faa3e58de827d4df5d1703cd9b729a2a94c54ab31ea1dd9afb4" "1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb" *)
Parameter missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb : set -> set.
Axiom missingprop_224fb7f4803ba78358f697f893e95590c4e14e659c18fa69f543bf5575584376 : missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5.
Axiom missingprop_56bf40f15e9770234ed1fb7263ac5b3ae942c5eb4a45b231ea1ccc4a7c47607b : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0)).
Axiom missingprop_40deb3eb79d5c5c71aa80bf50721dae39b2777908706a659e2492aac0f4c8c12 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0) = minus_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)).
Axiom missingprop_6cb868b3ac14c8173d932471a0611ae27ef4d2fe2845a5d2b3492b374255c072 : missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 = 0.
Axiom missingprop_a2891cc356bee2884c8b803c82aa7d5aeb109368f2ad94fe2c0a7ccd118f6cf7 : missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 = 1.
Axiom missingprop_9b68e93594637a66575dc4fd1ad90d2309eae3336936493b756143a5919b89d8 : missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d 1 = 1.
Axiom missingprop_2e2911def6d617e9877d8d3d54cce3e132e00bcc264b811c0199832ff73abcca : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0) = minus_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0)).
Axiom missingprop_7803f73eb86bb0e87054b9e4c7ea003d2954cfcb800eceb200756626e361574d : missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 1 = 0.
Theorem missingprop_636d4231e3e3a8c5ddb18e7e808afc0ea20a64f66e8b0e2b4e181ed0f210902c : missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 = missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb 1.
admit.
Qed.
(* Parameter recip_SNo "eb3c2afcb0fc017514672f7e4bb05a93fb8aa03fbeac55c207f299b0a6c23b32" "aa96a290f83ded9b33662ccb13b56cc27eb5c09a09b36ee3890691b04cc8386c" *)
Parameter recip_SNo : set -> set.
Definition div_SNo : set -> set -> set :=
 (fun x0 x1 : set => mul_SNo x0 (recip_SNo x1)).
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Definition missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 : set -> set :=
 (fun x0 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (div_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (add_SNo (exp_SNo_nat (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) 2) (exp_SNo_nat (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) 2))) (minus_SNo (div_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (add_SNo (exp_SNo_nat (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) 2) (exp_SNo_nat (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) 2))))).
Axiom SNo_div_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (div_SNo x0 x1)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom SNo_exp_SNo_nat : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> SNo (exp_SNo_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Theorem missingprop_22c179ebffff2c486ae5e133029d95b5a4ca00a1c353c9866b40272d005fd09f : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 x0)).
admit.
Qed.
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom mul_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo x1 (mul_SNo x0 x2)).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Theorem missingprop_1b11ff2999a2e1885c76132d28c3c6710fdbd586e6191215508c538b5c7a3975 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> (forall x1, SNo x1 -> mul_SNo (add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)) (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0))) x1 = 1 -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x1 (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)) (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x1 (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0))))) = 1)).
admit.
Qed.
Axiom exp_SNo_nat_2 : (forall x0, SNo x0 -> exp_SNo_nat x0 2 = mul_SNo x0 x0).
Theorem missingprop_3e3517faae0e13497ff8113e4e2d0337591e3341da21e38b5a23a63774db9932 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> (forall x1, SNo x1 -> mul_SNo (add_SNo (exp_SNo_nat (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) 2) (exp_SNo_nat (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) 2)) x1 = 1 -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 (missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x1 (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)) (missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x1 (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0))))) = 1)).
admit.
Qed.
Axiom missingprop_56a3846d90f4ab1e1cdbc7eded30831439b09ed314019fdcbda6415f78b5a7c9 : missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d 0 = 0.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNo_zero_or_sqr_pos' : (forall x0, SNo x0 -> or (x0 = 0) (SNoLt 0 (exp_SNo_nat x0 2))).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom SNo_sqr_nonneg' : (forall x0, SNo x0 -> SNoLe 0 (exp_SNo_nat x0 2)).
Axiom missingprop_83b1da2d18321ff78f0ba79977e134354a0cd5daef142de6498660d639616d8d : missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 0 = 0.
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Theorem missingprop_16b1d9fb6b45a67031a3d1d63d642e3a0f75bbeb0a5e38366f1837ac49779cf2 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> add_SNo (exp_SNo_nat (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) 2) (exp_SNo_nat (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) 2) = 0 -> x0 = 0).
admit.
Qed.
Axiom recip_SNo_invR : (forall x0, SNo x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> mul_SNo x0 (recip_SNo x0) = 1).
Axiom SNo_recip_SNo : (forall x0, SNo x0 -> SNo (recip_SNo x0)).
Theorem missingprop_8fba57ea33c9bb8dc66a1c0ad4d5626eb1825f778d2374b47f57e3591ee03473 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 (missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 x0) = 1).
admit.
Qed.
Theorem missingprop_4a910015770e3862e762d3e5b6c45c6c08675b817f36d8bbba1f4f36b323d122 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 (missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 x0) x0 = 1).
admit.
Qed.
Definition missingname_d0de473f7fa61d5185a8cdd703ad688cc273b1e2ddc9e23a5e07cb61fcebb1ac : set -> set -> set :=
 (fun x0 x1 : set => missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 (missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 x1)).
Theorem missingprop_56c1ba316833b07aa5ba8050a652d9ea42a903bb73ff7c3e06a7d460bb2e584d : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_d0de473f7fa61d5185a8cdd703ad688cc273b1e2ddc9e23a5e07cb61fcebb1ac x0 x1)).
admit.
Qed.
Theorem missingprop_195910a7cf8a0b23b738c6a383744615cccd168d874438bdeb0274f3ce9bcf94 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 (missingname_d0de473f7fa61d5185a8cdd703ad688cc273b1e2ddc9e23a5e07cb61fcebb1ac x0 x1) x1 = x0).
admit.
Qed.
Theorem missingprop_bdc0547c77f16f4bacd7e584b9e0948f0dd6b1dc2cc2485e7295508120d35ff9 : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x1 (missingname_d0de473f7fa61d5185a8cdd703ad688cc273b1e2ddc9e23a5e07cb61fcebb1ac x0 x1) = x0).
admit.
Qed.
