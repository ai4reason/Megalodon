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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_2dcf4dd8557a0ffd2a187961d1bc330ef1aae42c546555814bac26eb5e3c6d68 : (forall x0 x1, nat_p x1 -> x0 c= add_nat x0 x1).
admit.
Qed.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
Axiom nat_0 : nat_p 0.
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Theorem mul_nat_1R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 1) x0 -> x1 x0 (mul_nat x0 1)).
admit.
Qed.
Axiom mul_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x1 = mul_nat x1 x0)).
Axiom nat_1 : nat_p 1.
Theorem missingprop_6e31f7e63da1d74f4ea3ef967162bc5821029ffe1e451b13664a6e51a570dea7 : (forall x0, nat_p x0 -> mul_nat 1 x0 = x0).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition exp_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec 1 (fun x1 : set => mul_nat x0)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Theorem missingprop_1b73e01bc234ba0e318bc9baf16604d4f0fc12bea57885439d70438de4eb7174 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_nat x0 x1))).
admit.
Qed.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Theorem missingprop_28da1516a32d17f95285814651b169bb2f6a7d1360608bb2e641270be430b3af : (forall x0 x1, setminus x1 (Sing x0) :e Power x0 -> x1 :e Power (ordsucc x0)).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Theorem missingprop_c35f061e325a4a6109a2f42b869e8ad6971bd7c08500225844565b7ca899d70c : (forall x0 x1, x1 :e Power x0 -> binunion x1 (Sing x0) :e Power (ordsucc x0)).
admit.
Qed.
(* Parameter Inj0 "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" "8143218ffde429ff34b20ee5c938914c75e40d59cd52cc5db4114971d231ca73" *)
Parameter Inj0 : set -> set.
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom setsum_Inj_inv : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = Inj0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = Inj1 x4) -> x3) -> x3)).
Theorem missingprop_b6961926aadf85665852392f583ee4d9244a4c9e2652b11ec190e8e3e49588b9 : (forall x0 x1, forall x2 : set -> prop, (forall x3, x3 :e x0 -> x2 (Inj0 x3)) -> (forall x3, x3 :e x1 -> x2 (Inj1 x3)) -> (forall x3, x3 :e setsum x0 x1 -> x2 x3)).
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Axiom Power_0_Sing_0 : Power 0 = Sing 0.
Axiom eq_1_Sing0 : 1 = Sing 0.
Axiom equip_ref : (forall x0, equip x0 x0).
Axiom add_nat_1_1_2 : add_nat 1 1 = 2.
Axiom mul_add_nat_distrR : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat (add_nat x0 x1) x2 = add_nat (mul_nat x0 x2) (mul_nat x1 x2)))).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
(* Parameter combine_funcs "f0267e2cbae501ea3433aecadbe197ba8f39c96e80326cc5981a1630fda29909" "ccac4354446ce449bb1c967fa332cdf48b070fc032d9733e4c1305fb864cb72a" *)
Parameter combine_funcs : set -> set -> (set -> set) -> (set -> set) -> set -> set.
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom combine_funcs_eq1 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj0 x4)) (x2 x4) -> x5 (x2 x4) (combine_funcs x0 x1 x2 x3 (Inj0 x4))).
Axiom Power_Subq : (forall x0 x1, x0 c= x1 -> Power x0 c= Power x1).
Axiom combine_funcs_eq2 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj1 x4)) (x3 x4) -> x5 (x3 x4) (combine_funcs x0 x1 x2 x3 (Inj1 x4))).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
Axiom missingprop_20fce6fc7f2e036c1229cbf996632439eddb19cfae541105a83e5be9c65bc111 : (forall x0 x1, x1 :e x0 -> x0 = binunion (setminus x0 (Sing x1)) (Sing x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
Axiom nat_2 : nat_p 2.
Theorem missingprop_f5822e9d5891900b4c653eab5e89c5bb71543e61fe2c332750489ecd340604eb : (forall x0, nat_p x0 -> equip (Power x0) (exp_nat 2 x0)).
admit.
Qed.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem missingprop_b7030c4d179dca75b1c0a5a2dab6748493aebd2d7f37d4cf7a0d3bf2081224c9 : (forall x0, atleastp 0 x0).
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
Axiom nat_ordsucc_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e ordsucc x0 -> x1 c= x0)).
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem missingprop_6f2f2ee827c101dfeaaaeb47a7a909e08072923ce7f6e05ca4a992c53bc3f486 : (forall x0, nat_p x0 -> (forall x1, x1 :e ordsucc x0 -> equip x0 (setminus (ordsucc x0) (Sing x1)))).
admit.
Qed.
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Theorem missingprop_b2fe1166cc90aada9c2da7a2f96ec027f60d52a2799891b4e0a891d3402a8b5f : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2 x3, atleastp (add_nat x0 x1) (binunion x2 x3) -> or (atleastp x0 x2) (atleastp x1 x3)))).
admit.
Qed.
