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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom missingprop_997b324045b1165b0cf38788927ff324ddb3a505c8b91e290586e4dd5480f2bd : (forall x0 x1 x2, x2 :e x0 -> equip x0 (ordsucc x1) -> equip (setminus x0 (Sing x2)) x1).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Axiom setminus_binunion : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (setminus x0 (binunion x1 x2)) (setminus (setminus x0 x1) x2) -> x3 (setminus (setminus x0 x1) x2) (setminus x0 (binunion x1 x2))).
Axiom missingprop_4b1a7ff1f1af5eade46b5657f25a1ce39a3af58e2fba0b757867e511fb9aacae : (forall x0 x1, forall x2 : set -> set -> prop, x2 (UPair x0 x1) (binunion (Sing x0) (Sing x1)) -> x2 (binunion (Sing x0) (Sing x1)) (UPair x0 x1)).
Theorem missingprop_7ee945660d60b277ef5c022f29076bdaeac8c194b3e7d19d80abbf05b3511311 : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (x2 = x3 -> (forall x4 : prop, x4)) -> equip x0 (ordsucc (ordsucc x1)) -> equip (setminus x0 (UPair x2 x3)) x1)).
admit.
Qed.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Axiom missingprop_3de4fed6100f7a1644d3bcc671dd5818f525687e19a89aa1d64708dea3801718 : (forall x0 x1 x2 x3 x4, x4 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3 -> (forall x5 : set -> prop, x5 x0 -> x5 x1 -> x5 x2 -> x5 x3 -> x5 x4)).
Theorem missingprop_cb75c47bae3a116273752c6fc8e52c777498313f2b5b4ef43d3ceb63348e2717 : (forall x0 x1 x2 x3, forall x4 : set -> prop, x4 x0 -> x4 x1 -> x4 x2 -> x4 x3 -> (forall x5, x5 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3 -> x4 x5)).
admit.
Qed.
Axiom missingprop_adcc59d9ee410b66386ecaedc82bf46a176ebbf6449d79464abd3c2581f7e01d : (forall x0 x1 x2 x3 x4 x5, x5 :e SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4 -> (forall x6 : set -> prop, x6 x0 -> x6 x1 -> x6 x2 -> x6 x3 -> x6 x4 -> x6 x5)).
Theorem missingprop_68f81843c4d8e43966ed87e49af6cf26131af8cea5f5f0fd5672255d3a902e96 : (forall x0 x1 x2 x3 x4, forall x5 : set -> prop, x5 x0 -> x5 x1 -> x5 x2 -> x5 x3 -> x5 x4 -> (forall x6, x6 :e SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4 -> x5 x6)).
admit.
Qed.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem missingprop_b62c971722e1fdc4c814844b7f1388ee1a55af68784e50e411a8a610d7bfbd43 : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> atleastp x0 (Repl x0 x1)).
admit.
Qed.
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem missingprop_6f924010899e62355200d41f1cef23d6373bef28ff540d0bdb872dcb6e86d39f : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> equip x0 (Repl x0 x1)).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Definition finite : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (equip x0 x2) -> x1) -> x1).
Definition u1 : set :=
 1.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_1 : nat_p 1.
Axiom missingprop_be1ab2772f2343e1b7afd526582f606d68258ba3f0b6521a351e0ecb8bf3c52e : (forall x0, equip (Sing x0) u1).
Theorem missingprop_f7016afae9c8976834aae8fd87dfbc66905d8d8b02412954fb76543365d9f363 : (forall x0, finite (Sing x0)).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom missingprop_158329ee42f538f9f45353e081644457b58bf58b995713ab00dcbc514147ba46 : (forall x0 x1, x1 :e x0 -> Sing x1 c= x0).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Definition u2 : set :=
 ordsucc u1.
Axiom nat_2 : nat_p 2.
Axiom missingprop_39df499f773ced696ac600b0767cd28b9ceea72e50ff2c9103bc16896281c585 : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> equip (UPair x0 x1) u2).
Theorem missingprop_82000468b45b0b8989bccc5e5d04a4a778212863bb08c0a13080369232795d89 : (forall x0 x1, finite (UPair x0 x1)).
admit.
Qed.
Axiom bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
Axiom PigeonHole_nat_bij : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e x0) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> bij x0 x0 x1)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Theorem missingprop_47f88c1ef3f7e70202dad4a7dc31cddd63e4c9699c68a0cdfa175af999543412 : (forall x0 x1, finite x0 -> atleastp x1 x0 -> x0 c= x1 -> x0 = x1).
admit.
Qed.
Axiom inj_comp : (forall x0 x1 x2, forall x3 x4 : set -> set, inj x0 x1 x3 -> inj x1 x2 x4 -> inj x0 x2 (fun x5 : set => x4 (x3 x5))).
Theorem missingprop_4da1c615032285db3696bd8788423c8cff4d8109654be53ad18ec32bbf191557 : (forall x0 x1 x2, forall x3 : set -> set, nat_p x0 -> equip x1 x0 -> equip x2 x0 -> inj x1 x2 x3 -> bij x1 x2 x3).
admit.
Qed.
Definition u3 : set :=
 ordsucc u2.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
Axiom tuple_3_0_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0) x0 -> x3 x0 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 0)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Axiom In_0_3 : 0 :e 3.
Axiom In_1_3 : 1 :e 3.
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Axiom tuple_3_1_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1) x1 -> x3 x1 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 1)).
Axiom In_2_3 : 2 :e 3.
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Axiom tuple_3_2_eq : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2) x2 -> x3 x2 (ap (lam 3 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 x2))) 2)).
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom eq_2_UPair01 : 2 = UPair 0 1.
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Axiom In_0_1 : 0 :e 1.
Axiom In_0_2 : 0 :e 2.
Theorem missingprop_d3fbeb78b80d6df245472cc40fcce756fb358bb44e8a8d6f24614a6b9fb79678 : bij u3 (Sep (Power u3) (fun x0 : set => equip x0 u2)) (ap (lam 3 (fun x0 : set => If_i (x0 = 0) (UPair 0 u1) (If_i (x0 = 1) (UPair 0 u2) (UPair u1 u2))))).
admit.
Qed.
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
Axiom surj_rinv : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> (forall x3, x3 :e x1 -> and (inv x0 x2 x3 :e x0) (x2 (inv x0 x2 x3) = x3))).
Axiom bij_inv : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> bij x1 x0 (inv x0 x2)).
Theorem missingprop_dac5cc582922dc81cca95ce05adad2a1e109e1126bbc04c1e7848bedf350d9ab : (forall x0, equip x0 u3 -> equip (Sep (Power x0) (fun x1 : set => equip x1 u2)) u3).
admit.
Qed.
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Theorem missingprop_ea6ffaa54d1e073cccc9fdc592d44a1b4d212a3ece05c250c453cc907e922554 : (forall x0 x1 x2, SetAdjoin (UPair x0 x1) x2 c= SetAdjoin (UPair x0 x2) x1).
admit.
Qed.
Theorem missingprop_77dbd508bb9c8d28f19bb0b1abf7737a2b810c35da9257a143650827d2f57b7e : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (SetAdjoin (UPair x0 x1) x2) (SetAdjoin (UPair x0 x2) x1) -> x3 (SetAdjoin (UPair x0 x2) x1) (SetAdjoin (UPair x0 x1) x2)).
admit.
Qed.
Axiom binunion_asso : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (binunion x0 (binunion x1 x2)) (binunion (binunion x0 x1) x2) -> x3 (binunion (binunion x0 x1) x2) (binunion x0 (binunion x1 x2))).
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Theorem missingprop_0efba84dd6c7b4fa9f3cf8f26cac08e0951c2b68191ea5101ef50e19394ad384 : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) (SetAdjoin (SetAdjoin (UPair x0 x1) x3) x2) -> x4 (SetAdjoin (SetAdjoin (UPair x0 x1) x3) x2) (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3)).
admit.
Qed.
Theorem missingprop_558e090bbdae72f526bcb2b86af798e737a48964efed80275bf2d08d67f0ee45 : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4) (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x4) x2) x3) -> x5 (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x4) x2) x3) (SetAdjoin (SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3) x4)).
admit.
Qed.
