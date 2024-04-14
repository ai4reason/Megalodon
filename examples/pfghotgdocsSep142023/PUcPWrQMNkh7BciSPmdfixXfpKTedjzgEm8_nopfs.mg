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
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Axiom nat_1 : nat_p 1.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_6acf4d775f3657f6657248067c81d93f75e7e3c111f6937130fc5b44c841c89f : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> nat_p (x1 x2)) -> nat_p (nat_primrec 1 (fun x2 : set => mul_nat (x1 x2)) x0))).
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom add_nat_0L : (forall x0, nat_p x0 -> add_nat 0 x0 = x0).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Theorem missingprop_45596e78bba24517552f5da1105935f815723d1d00ef823b7fc87048c29f6c84 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = 0 -> and (x0 = 0) (x1 = 0))).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom mul_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat (ordsucc x0) x1 = add_nat (mul_nat x0 x1) x1)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_2da221bcdd2314e7a8865e1e89957a529238abd39a22657b0cdfc26f16078944 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x1 = 0 -> or (x0 = 0) (x1 = 0))).
admit.
Qed.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom In_0_1 : 0 :e 1.
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Theorem missingprop_87bf8388b36fffab96888ad3bd06efd3451825a154aa6df88807aa16f4771b8c : (forall x0, x0 :e setminus omega 1 -> (forall x1, x1 :e setminus omega 1 -> mul_nat x0 x1 :e setminus omega 1)).
admit.
Qed.
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
Axiom nat_0 : nat_p 0.
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem mul_nat_1R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 1) x0 -> x1 x0 (mul_nat x0 1)).
admit.
Qed.
Axiom mul_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x1 = mul_nat x1 x0)).
Theorem missingprop_6e31f7e63da1d74f4ea3ef967162bc5821029ffe1e451b13664a6e51a570dea7 : (forall x0, nat_p x0 -> mul_nat 1 x0 = x0).
admit.
Qed.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem missingprop_7efa9b0eb4a7672f89f79f79d5dfd89fdd189d47f4be668ddc1bdc4223ecb821 : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> ordsucc x0 c= ordsucc x1).
admit.
Qed.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Theorem missingprop_d410a3a5a85dee8b88026a07b7ddf206621becbaaea4930e72baeb4af5fcafdc : (forall x0 x1, nat_p x0 -> nat_p x1 -> x0 c= x1 -> (forall x2, nat_p x2 -> add_nat x0 x2 c= add_nat x1 x2)).
admit.
Qed.
Axiom add_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = add_nat x1 x0)).
Theorem missingprop_52447d35417df72c3930bddf586528d141c8a01b517a048173b612e2a2431a27 : (forall x0 x1, nat_p x0 -> nat_p x1 -> x0 c= x1 -> (forall x2, nat_p x2 -> add_nat x2 x0 c= add_nat x2 x1)).
admit.
Qed.
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Theorem missingprop_d99b106d8c3aa5eb23e015bc5d27fe6284c8a3a86f85a0911e7d46761f04ef97 : (forall x0 x1, nat_p x0 -> nat_p x1 -> x0 c= x1 -> (forall x2, nat_p x2 -> mul_nat x0 x2 c= mul_nat x1 x2)).
admit.
Qed.
Theorem missingprop_929864532141b40b768d022d9a5eb271b4e76fb202303c61c5984df8eb73ceb2 : (forall x0 x1, nat_p x0 -> nat_p x1 -> x0 c= x1 -> (forall x2, nat_p x2 -> mul_nat x2 x0 c= mul_nat x2 x1)).
admit.
Qed.
Theorem missingprop_e18849ea271b9fad1d1f55210e57a4e42a5b850b4f5bda4268b35baef08a0fd5 : (forall x0, x0 :e setminus omega 1 -> (forall x1 : prop, (forall x2, x2 :e omega -> x0 = ordsucc x2 -> x1) -> x1)).
admit.
Qed.
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom ordinal_1 : ordinal 1.
Axiom Subq_1_2 : 1 c= 2.
Theorem missingprop_9231c5823fa809fed9bf1ca5a2fc1ace2b76ed48a659fcd88b50f5e2f09a86ab : (forall x0, x0 :e setminus omega 2 -> (forall x1 : prop, (forall x2, x2 :e omega -> x0 = ordsucc (ordsucc x2) -> x1) -> x1)).
admit.
Qed.
Theorem add_nat_Subq_L : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> x0 c= add_nat x0 x1)).
admit.
Qed.
Theorem missingprop_0dc8d11d1ba28645d1565e6f95fe26f514da291413e114d0327c09556f7d23e9 : (forall x0, nat_p x0 -> (forall x1, x1 :e setminus omega 1 -> x0 c= mul_nat x0 x1)).
admit.
Qed.
Theorem missingprop_50b65292d8c21d0a51ffd7239891113269f96ca6881e5f223c17754525c2ffd2 : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e setminus omega 1) -> nat_primrec 1 (fun x2 : set => mul_nat (x1 x2)) x0 :e setminus omega 1)).
admit.
Qed.
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem missingprop_97c7776a66590be2b2527dd1cda3d7d16f5d5fe279216d0058fa4bf744a721e1 : (forall x0, nat_p x0 -> (forall x1, x1 :e setminus omega 1 -> x0 c= mul_nat x1 x0)).
admit.
Qed.
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem missingprop_c9098cd36bcaebd859dfd7185424450a09bf20e6004a31ad115c63167c80e96f : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e setminus omega 1) -> (forall x2, x2 :e x0 -> x1 x2 c= nat_primrec 1 (fun x3 : set => mul_nat (x1 x3)) x0))).
admit.
Qed.
Definition divides_nat : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e omega) (x1 :e omega)) (forall x2 : prop, (forall x3, and (x3 :e omega) (mul_nat x0 x3 = x1) -> x2) -> x2)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem missingprop_7c992f4bead1c839595c305cb04c7932e3557cf7fb473957c655adc4c8e2fe4a : (forall x0, x0 :e omega -> divides_nat x0 x0).
admit.
Qed.
Axiom and3E : (forall x0 x1 x2 : prop, and (and x0 x1) x2 -> (forall x3 : prop, (x0 -> x1 -> x2 -> x3) -> x3)).
Axiom mul_nat_asso : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat (mul_nat x0 x1) x2 = mul_nat x0 (mul_nat x1 x2)))).
Theorem missingprop_f799b99d854d7bca6941dc7751c0c00a5bf29ac2d7e070aa318a7a7ed9ce8fa0 : (forall x0 x1 x2, divides_nat x0 x1 -> divides_nat x1 x2 -> divides_nat x0 x2).
admit.
Qed.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem missingprop_8f99883d7ef5725ffe12d96f7c105fcc7a5ac298a81b9c448ec11df41a3ac05a : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> nat_p (x1 x2)) -> (forall x2, x2 :e x0 -> divides_nat (x1 x2) (nat_primrec 1 (fun x3 : set => mul_nat (x1 x3)) x0)))).
admit.
Qed.
Theorem missingprop_4dc51657821ef9793a5942e4da5b6631bdf7777ea8b0485605c5b11a0d0dabff : (forall x0, nat_p x0 -> (forall x1 : set -> prop, x1 0 -> (forall x2, x2 :e setminus omega 1 -> x1 x2) -> x1 x0)).
admit.
Qed.
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom ordsucc_inj_contra : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> ordsucc x0 = ordsucc x1 -> (forall x2 : prop, x2)).
Theorem missingprop_6e151b9a51dc2ccfd71a98193c35cce693d1058fdc6a7b01e42e0782a75b29b2 : (forall x0, nat_p x0 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> (forall x2, x2 :e setminus omega 2 -> x1 x2) -> x1 x0)).
admit.
Qed.
Theorem missingprop_d40a199c08c77164672e4ca0cbff2f0aefbdc2d634556cb19632c21a32e1558c : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> or (x1 = 0) (x0 :e add_nat x0 x1))).
admit.
Qed.
Theorem missingprop_ef844af8171e107f352112b714a496af00be0554f9dd082c0781d46fb46baddf : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> or (x1 = 0) (x0 :e add_nat x1 x0))).
admit.
Qed.
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom mul_nat_0L : (forall x0, nat_p x0 -> mul_nat 0 x0 = 0).
Theorem missingprop_79be07f7920cf67ee313d822d12bbc88fa1841a75a563c0807dc82891b9eeca5 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x1 = 1 -> and (x0 = 1) (x1 = 1))).
admit.
Qed.
Definition prime_nat : set -> prop :=
 (fun x0 : set => and (and (x0 :e omega) (1 :e x0)) (forall x1, x1 :e omega -> divides_nat x1 x0 -> or (x1 = 1) (x1 = x0))).
Axiom nat_complete_ind : (forall x0 : set -> prop, (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom In_0_2 : 0 :e 2.
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom In_1_2 : 1 :e 2.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Theorem missingprop_ddd1e7e1984168df0d115a10797352d8766e29ab81fb2298cdd4db8a2f63c32f : (forall x0, x0 :e setminus omega 2 -> (forall x1 : prop, (forall x2, and (x2 :e omega) (and (prime_nat x2) (divides_nat x2 x0)) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_05deb391f66995d0709d2ce004b6617f334a92b8aeb28b17b2ca0192cddc142d : (forall x0, prime_nat x0 -> x0 :e setminus omega 2).
admit.
Qed.
Theorem missingprop_9ad0867fc87b914742fe6e9dd13399a9059e30111d97034a5ca39a2e1dce3530 : (forall x0 x1, (x1 = 0 -> (forall x2 : prop, x2)) -> divides_nat x0 x1 -> x0 c= x1).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem missingprop_0725f63a72d53e72a29e53268760e89b9f3f128dd2d1948a3be1648cb70b9b52 : (forall x0 x1, (x1 = 0 -> (forall x2 : prop, x2)) -> divides_nat x0 x1 -> or (x0 :e x1) (x0 = x1)).
admit.
Qed.
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Theorem missingprop_0530dcab0a3350a5792a0eced733df25a629e35a5a7c1120748c0f5f3b566974 : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> (forall x2 : prop, (forall x3, and (x3 :e omega) (add_nat x1 x3 = x0) -> x2) -> x2))).
admit.
Qed.
Axiom ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
Theorem missingprop_a18c63af6cc91e0cba0f214b9549b90cd7c7bce0eb5ad36c134e544b9910ea61 : (forall x0 x1, nat_p x0 -> nat_p x1 -> (forall x2, nat_p x2 -> add_nat x0 x2 = add_nat x1 x2 -> x0 = x1)).
admit.
Qed.
Theorem missingprop_ff560222020c95f6e7705ee5610e16ac6a9d6789a574689c0536877273f2572a : (forall x0 x1 x2, nat_p x0 -> nat_p x1 -> nat_p x2 -> add_nat x0 x1 = add_nat x0 x2 -> x1 = x2).
admit.
Qed.
Axiom mul_add_nat_distrL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat x0 (add_nat x1 x2) = add_nat (mul_nat x0 x1) (mul_nat x0 x2)))).
Theorem missingprop_ee39981ab535c644db80a7a1e78f9fd70ba756181dcb60866fde2b4067ce94ed : (forall x0, x0 :e setminus omega 2 -> (forall x1, divides_nat x0 x1 -> not (divides_nat x0 (ordsucc x1)))).
admit.
Qed.
Definition surj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom neq_0_ordsucc : (forall x0, 0 = ordsucc x0 -> (forall x1 : prop, x1)).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Theorem missingprop_8f5b0d62af687a637762403d82fd2db1c120b30f5359bb1eb2c486817c849925 : (forall x0, nat_p x0 -> (forall x1 : set -> set, not (surj x0 (Sep omega prime_nat) x1))).
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Definition finite : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (equip x0 x2) -> x1) -> x1).
Definition infinite : set -> prop :=
 (fun x0 : set => not (finite x0)).
Axiom bij_surj : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> surj x0 x1 x2).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Theorem missingprop_34eb3c1749f5b03811d82f3f64cb776e9a4e1571714d2a04d4bc9d45cdadce5d : infinite (Sep omega prime_nat).
admit.
Qed.
