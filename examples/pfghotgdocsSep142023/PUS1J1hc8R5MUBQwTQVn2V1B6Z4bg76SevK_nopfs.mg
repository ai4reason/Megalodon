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
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb "772a7c567e28ad27fa69135479dc379287047d22ebf4f74ff56731a689dafb00" "c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb" *)
Parameter missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb : set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 : set :=
 {missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (ap x0 0) (ap x0 1) | x0 :e setprod real real}.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Theorem missingprop_ab5523330112f607e055e625ca3ec71bcb7369b53cba9b5f845ed34015ce25b3 : (forall x0, x0 :e real -> (forall x1, x1 :e real -> missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658)).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem missingprop_d0b18a67181e900ea67f7a0ba30a861268ef122d83dee9e0402983f02611aa3f : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> (forall x1 : prop, (forall x2, x2 :e real -> (forall x3, x3 :e real -> x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x2 x3 -> x1)) -> x1)).
admit.
Qed.
(* Parameter missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 "268018e0b164e7ebf0c4bc21dd04df92c2bf72855b4acf204bd91317b6eae719" "9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348" *)
Parameter missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 : set -> prop.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom missingprop_942959aad6790cf3a71a2f8f2b9ffc552b42fb28a7f163a4f5e7e7842fdbd934 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1)).
Axiom real_SNo : (forall x0, x0 :e real -> SNo x0).
Theorem missingprop_6cf9cf26662aea90389ac20eb34f002de2be0a449437f2aac80f306aa0a8256b : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom missingprop_872273e895264b163d3a3b042c5d1abf262e26919401a643ccce2dcdcb6a14ef : (forall x0, forall x1 : set -> set -> prop, x1 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 0) x0 -> x1 x0 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 0)).
Axiom real_0 : 0 :e real.
Theorem missingprop_b8e2f6014b0a1d8ddf617d3b0c26c00e0775cc15081d13f5b0fb7d075511e309 : real c= missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658.
admit.
Qed.
Theorem missingprop_87ea29002f4a06a6c7d1dfe943d46e77373e262f557e3161fa69daa7d96fb94a : 0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658.
admit.
Qed.
Axiom real_1 : 1 :e real.
Theorem missingprop_c9e2576fc2e191e63e26947399bb76c8db9b131a664ca030bb6bf6af3de1f6ff : 1 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658.
admit.
Qed.
Definition missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 : set :=
 missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb 0 1.
Theorem missingprop_939d5067223528adc109d7c44870d97c3ed98000c6275415a82075a474f91bf7 : missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658.
admit.
Qed.
(* Parameter missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d "c8adc3d5367ab1b1b6c5b2ef30d5740eacf73564a2a3f2b58bf38975d35c67f5" "32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d" *)
Parameter missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d : set -> set.
Axiom missingprop_be33d753151483c7bac1e70b0036b153d449838792ed17caa64a7328dfc698e0 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) = x0).
Theorem missingprop_b9b7bfb6c9b892d1b6018106403bf15df7213abab01ccecd88c7179d2ef8e566 : (forall x0, x0 :e real -> (forall x1, x1 :e real -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) = x0)).
admit.
Qed.
(* Parameter missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 "c7cd95616937a2fe344db0729f874251d5084860aae6447085c00eb6e541a494" "1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9" *)
Parameter missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 : set -> set.
Axiom missingprop_a297e56f8bdca4759c242f4239a030f8b8676cee62a6758763e7f37b72905c22 : (forall x0 x1, SNo x0 -> SNo x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) = x1).
Theorem missingprop_fb49976af43b10d0ce8aeb3d9ab418005490959b10197c6c1e0102ac4ae81973 : (forall x0, x0 :e real -> (forall x1, x1 :e real -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb x0 x1) = x1)).
admit.
Qed.
Theorem missingprop_bf35ed077052d180738002d3131b9c960f2105b6fc771a9376424dc88c5accaa : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0 :e real).
admit.
Qed.
Theorem missingprop_f4589932e78557c04376dc773ac7e96363fb72f89bfabb77016339bd41fdf147 : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0 :e real).
admit.
Qed.
Axiom missingprop_544f4d34085c39fe852eae7f16fd7fa4f1aacc16d23d4ca0f8649dd632a3ab3b : (forall x0 x1, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x1 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0 = missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0 = missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1 -> x0 = x1).
Theorem missingprop_1d2c937676b367f00a23bfc36fb76dea220e105d38a325f36677f9caacce390f : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> (forall x1, x1 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0 = missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1 -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0 = missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1 -> x0 = x1)).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb : set -> set :=
 (fun x0 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (minus_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)) (minus_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0))).
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Theorem missingprop_1ed8ba410fb52446849414ed18bcd8f247a512f2769e6f5e87115a2b60d65ee1 : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> missingname_1fb48796b0a327968bff2fab6f0950ce7aac273bf02b4801dcf0bb1a910292eb x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658).
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Definition missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e : set -> set -> set :=
 (fun x0 x1 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (add_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)) (add_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1))).
Axiom real_add_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_SNo x0 x1 :e real)).
Theorem missingprop_a5db99e04dd243ca3cf26f408d263be7b5dbd0942a5eb5639cda8fcb19f5727f : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> (forall x1, x1 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e x0 x1 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658)).
admit.
Qed.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 : set -> set -> set :=
 (fun x0 x1 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)) (minus_SNo (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)))) (add_SNo (mul_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x1)) (mul_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)))).
Axiom real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
Theorem missingprop_e725f4e8e0c2b2b281976dec66f3ecd05466034c80c4b6357cde64cb8522d0a0 : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> (forall x1, x1 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 x1 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658)).
admit.
Qed.
Theorem missingprop_043a3a62e09a1e356d458c560264602babef6a620fa61db7abeb4595eeb25ec6 : (forall x0, x0 :e real -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0 = x0).
admit.
Qed.
Theorem missingprop_abceab960aaef5df9f001bc1cd13feb6de3a8aec9c7966ceadb450feb60c314d : (forall x0, x0 :e real -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0 = 0).
admit.
Qed.
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom SNo_1 : SNo 1.
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom SNo_0 : SNo 0.
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Theorem missingprop_d27930c246df8a4f2e7b13a1f726cca678be8cf0fda06d91b4212035bc7e32cc : (forall x0, x0 :e real -> missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 x0 = missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb 0 x0).
admit.
Qed.
Theorem missingprop_2ddf9ebfee65b76198f31be345197bbcbd14c1051a86330ee5479550122ecb8c : (forall x0, x0 :e real -> missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 x0) = 0).
admit.
Qed.
Theorem missingprop_87ece1a776d2238d0506557a76a01b60b7fd3659c484870634d9beeaa5ce23c3 : (forall x0, x0 :e real -> missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 x0) = x0).
admit.
Qed.
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Theorem missingprop_b67b085694298520378c523fa3c8bf56a81c4fc588f49d30b2970efbf35a34ee : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> x0 = missingname_2d0b12be8fd6691ecdce39135218889db6dd0795c9827b310f67ae7d6ddce24e (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 missingname_dae24acf3c61375d1935f42947ca5798ee4c8b4215b03deae113e4458e459ab5 (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0))).
admit.
Qed.
(* Parameter div_SNo "27f4b5fe59b60da9c8b15247476d431fa3e527c47c22bad7c6d8cb3c2668e2e0" "a77cc83b548d1c105523434377d695400e899aad3044b9efb16632cbba12c5d6" *)
Parameter div_SNo : set -> set -> set.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Definition missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 : set -> set :=
 (fun x0 : set => missingname_c08966b4f5439e30fe18db8342aafb1f3d9a6708b170df82fbae72fc4d868feb (div_SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) (add_SNo (exp_SNo_nat (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) 2) (exp_SNo_nat (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) 2))) (minus_SNo (div_SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) (add_SNo (exp_SNo_nat (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0) 2) (exp_SNo_nat (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0) 2))))).
Axiom real_div_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> div_SNo x0 x1 :e real)).
Axiom exp_SNo_nat_2 : (forall x0, SNo x0 -> exp_SNo_nat x0 2 = mul_SNo x0 x0).
Axiom missingprop_f319423ed101339f42129d35c36f78ec84ab916352e52ec279686150bcbdfec5 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> SNo (missingname_1cbea14c646eb2ee5a329328139c696abd6b9870ff81acf9fd176d472a9d4bf9 x0)).
Axiom missingprop_62ffbce17a1080b510b3d10f88e78f4b8e9088a2c54409ce0c70e91f74a9fd08 : (forall x0, missingname_9710facf387dbd5402938524397fce1136d51232105094f076127f70dd204348 x0 -> SNo (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x0)).
Theorem missingprop_3d437c63584213d7f889f1450e4056f88d3d75cf1cdf393fd727d5bf2eea1e95 : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658).
admit.
Qed.
Definition missingname_d0de473f7fa61d5185a8cdd703ad688cc273b1e2ddc9e23a5e07cb61fcebb1ac : set -> set -> set :=
 (fun x0 x1 : set => missingname_286229ee35cd84f276119d178721dd3aaba708488863d829d5cf975925a829c8 x0 (missingname_5311e9fb8368085a487d82ef6700c597fac9c521d48cbfdb69ac01180f7a57c7 x1)).
Theorem missingprop_b5253a250e42d7e704f8911e70c90e99e7ef4e6db3c21f98212587f149be67e9 : (forall x0, x0 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> (forall x1, x1 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 -> missingname_d0de473f7fa61d5185a8cdd703ad688cc273b1e2ddc9e23a5e07cb61fcebb1ac x0 x1 :e missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658)).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Theorem missingprop_4ec2fa31218f9166273ddf52f8a4f4858fd877ce6904102aed560933025d7621 : real = Sep missingname_7c775face2070cd284e5735bd2034b496866d94f5651af2b63938f0608c7a658 (fun x1 : set => forall x2 : set -> set -> prop, x2 (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1) x1 -> x2 x1 (missingname_32eb0cf059cb9f9b6a96d2a25ab326098bcfb8c3e35e422e91b47be520c80b8d x1)).
admit.
Qed.
