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
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter Group "417bbf2a3b32835172581302b58bedd04d725d0fe24111e9e92e754cec48eaa3" "3bcfdf72871668bce2faf4af19b82f05b1ff30e94a64bbc83215c8462bc294ca" *)
Parameter Group : set -> prop.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter normal_subgroup "bab2523b317499704341a2ba21c21cbb7bd14322e0aa8442a4413c3d162c6a23" "071c71e291b8c50d10f9d7f5544da801035d99ff3a68c9e5386b4087d22b5db2" *)
Parameter normal_subgroup : set -> set -> prop.
(* Parameter abelian_Group "6786d5a0f6a22ba660cb51b8b290647cb3c631915e64df2754d965e64409fd78" "c9c27ca28ffd069e766ce309b49a17df75d70111ce5b2b8e9d836356fb30b20a" *)
Parameter abelian_Group : set -> prop.
(* Parameter quotient_Group "6ff32368f770786cf00ab7ee4313339ebfa68b64e74fdac8eb8098f8a09e6c90" "971902aba30554ada3e97388da3b25c677413e2b4df617edba4112889c123612" *)
Parameter quotient_Group : set -> set -> set.
(* Parameter trivial_Group_p "f0ca19ea365100ff839421e05ae49ccdd46dabe2f9816d15f2b3debd74c3f747" "759fd51778137326dda8cf75ce644e3ec8608dfa7e59c54b364069dd6cf6dd0d" *)
Parameter trivial_Group_p : set -> prop.
Definition solvable_Group_p : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (forall x3 : prop, (forall x4, and (and (and (and (forall x5, x5 :e ordsucc x2 -> Group (ap x4 x5)) (forall x5, x5 :e x2 -> normal_subgroup (ap x4 (ordsucc x5)) (ap x4 x5))) (forall x5, x5 :e x2 -> abelian_Group (quotient_Group (ap x4 x5) (ap x4 (ordsucc x5))))) (x0 = ap x4 0)) (trivial_Group_p (ap x4 x2)) -> x3) -> x3) -> x1) -> x1).
Definition field0 : set -> set :=
 (fun x0 : set => ap x0 0).
(* Parameter decode_b "86e649daaa54cc94337666c48155bcb9c8d8f416ab6625b9c91601b52ce66901" "1024fb6c1c39aaae4a36f455b998b6ed0405d12e967bf5eae211141970ffa4fa" *)
Parameter decode_b : set -> set -> set -> set.
Definition field1b : set -> set -> set -> set :=
 (fun x0 : set => decode_b (ap x0 1)).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Definition Group_Hom : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (and (Group x0) (Group x1)) (x2 :e setexp (field0 x1) (field0 x0))) (forall x3, x3 :e field0 x0 -> (forall x4, x4 :e field0 x0 -> ap x2 (field1b x0 x3 x4) = field1b x1 (ap x2 x3) (ap x2 x4)))).
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition Group_Iso : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (Group_Hom x0 x1 x2) (bij (field0 x0) (field0 x1) (ap x2))).
Definition Group_Isomorphic : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3, Group_Iso x0 x1 x3 -> x2) -> x2).
(* Parameter struct_b_b_e_e "af2850387310cf676e35267e10a14affc439a209ad200b7edc42d8142611fcd4" "7685bdf4f6436a90f8002790ede7ec64e03b146138f7d85bc11be7d287d3652b" *)
Parameter struct_b_b_e_e : set -> prop.
(* Parameter unpack_b_b_e_e_o "eb93435a79c01148fc12dd7779795d68cc2251130dc7633623f16664d25ed072" "1bcc21b2f13824c926a364c5b001d252d630f39a0ebe1f8af790facbe0f63a11" *)
Parameter unpack_b_b_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop) -> prop.
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Definition Field : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_Field x1 x4 x5 x2 x3))).
Definition field2b : set -> set -> set -> set :=
 (fun x0 : set => decode_b (ap x0 2)).
Definition field4 : set -> set :=
 (fun x0 : set => ap x0 4).
Definition field3 : set -> set :=
 (fun x0 : set => ap x0 3).
Axiom explicit_Field_plus_cancelL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x6 = x3 x5 x7 -> x6 = x7)))).
Axiom Field_explicit_Field : (forall x0, Field x0 -> explicit_Field (field0 x0) (field3 x0) (field4 x0) (field1b x0) (field2b x0)).
Theorem Field_plus_cancelL : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field1b x0 x1 x2 = field1b x0 x1 x3 -> x2 = x3)))).
admit.
Qed.
Axiom explicit_Field_plus_cancelR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 x7 = x3 x6 x7 -> x5 = x6)))).
Theorem Field_plus_cancelR : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field1b x0 x1 x3 = field1b x0 x2 x3 -> x1 = x2)))).
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter explicit_Field_minus "be660f6f1e37e7325ec2a39529b9c937b61a60f864e85f0dabdf2bddacb0986e" "5be570b4bcbe7fefd36c2057491ddcc7b11903d8d98ca54d9b37db60d1bf0f7e" *)
Parameter explicit_Field_minus : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> set -> set.
Definition Field_minus : set -> set -> set :=
 (fun x0 x1 : set => If_i (x1 :e ap x0 0) (explicit_Field_minus (ap x0 0) (ap x0 3) (ap x0 4) (decode_b (ap x0 1)) (decode_b (ap x0 2)) x1) 0).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem Field_minus_eq : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> Field_minus x0 x1 = explicit_Field_minus (field0 x0) (field3 x0) (field4 x0) (field1b x0) (field2b x0) x1)).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Theorem Field_minus_undef : (forall x0, Field x0 -> (forall x1, nIn x1 (field0 x0) -> Field_minus x0 x1 = 0)).
admit.
Qed.
Axiom explicit_Field_minus_clos : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 x5 :e x0)).
Theorem Field_minus_clos : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> Field_minus x0 x1 :e field0 x0)).
admit.
Qed.
Axiom explicit_Field_minus_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 x5 (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x1)).
Theorem Field_minus_R : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> field1b x0 x1 (Field_minus x0 x1) = field3 x0)).
admit.
Qed.
Axiom explicit_Field_minus_L : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x3 (explicit_Field_minus x0 x1 x2 x3 x4 x5) x5 = x1)).
Theorem Field_minus_L : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> field1b x0 (Field_minus x0 x1) x1 = field3 x0)).
admit.
Qed.
Axiom explicit_Field_minus_invol : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x5)).
Theorem Field_minus_invol : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> Field_minus x0 (Field_minus x0 x1) = x1)).
admit.
Qed.
Axiom Field_one_In : (forall x0, Field x0 -> field4 x0 :e field0 x0).
Axiom explicit_Field_minus_one_In : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> explicit_Field_minus x0 x1 x2 x3 x4 x2 :e x0).
Theorem Field_minus_one_In : (forall x0, Field x0 -> Field_minus x0 (field4 x0) :e field0 x0).
admit.
Qed.
Axiom explicit_Field_zero_multR : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x5 x1 = x1)).
Theorem Field_zero_multR : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> field2b x0 x1 (field3 x0) = field3 x0)).
admit.
Qed.
Axiom explicit_Field_zero_multL : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x1 x5 = x1)).
Theorem Field_zero_multL : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> field2b x0 (field3 x0) x1 = field3 x0)).
admit.
Qed.
Axiom explicit_Field_minus_mult : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 x5 = x4 (explicit_Field_minus x0 x1 x2 x3 x4 x2) x5)).
Theorem Field_minus_mult : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> Field_minus x0 x1 = field2b x0 (Field_minus x0 (field4 x0)) x1)).
admit.
Qed.
Axiom explicit_Field_minus_one_square : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> x4 (explicit_Field_minus x0 x1 x2 x3 x4 x2) (explicit_Field_minus x0 x1 x2 x3 x4 x2) = x2).
Theorem Field_minus_one_square : (forall x0, Field x0 -> field2b x0 (Field_minus x0 (field4 x0)) (Field_minus x0 (field4 x0)) = field4 x0).
admit.
Qed.
Axiom explicit_Field_minus_square : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 (explicit_Field_minus x0 x1 x2 x3 x4 x5) (explicit_Field_minus x0 x1 x2 x3 x4 x5) = x4 x5 x5)).
Theorem Field_minus_square : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> field2b x0 (Field_minus x0 x1) (Field_minus x0 x1) = field2b x0 x1 x1)).
admit.
Qed.
Axiom Field_zero_In : (forall x0, Field x0 -> field3 x0 :e field0 x0).
Axiom explicit_Field_minus_zero : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> explicit_Field_minus x0 x1 x2 x3 x4 x1 = x1).
Theorem Field_minus_zero : (forall x0, Field x0 -> Field_minus x0 (field3 x0) = field3 x0).
admit.
Qed.
Axiom explicit_Field_dist_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 (x3 x5 x6) x7 = x3 (x4 x5 x7) (x4 x6 x7))))).
Theorem Field_dist_R : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field2b x0 (field1b x0 x1 x2) x3 = field1b x0 (field2b x0 x1 x3) (field2b x0 x2 x3))))).
admit.
Qed.
Axiom Field_plus_clos : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field1b x0 x1 x2 :e field0 x0))).
Axiom explicit_Field_minus_plus_dist : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> explicit_Field_minus x0 x1 x2 x3 x4 (x3 x5 x6) = x3 (explicit_Field_minus x0 x1 x2 x3 x4 x5) (explicit_Field_minus x0 x1 x2 x3 x4 x6)))).
Theorem Field_minus_plus_dist : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> Field_minus x0 (field1b x0 x1 x2) = field1b x0 (Field_minus x0 x1) (Field_minus x0 x2)))).
admit.
Qed.
Axiom Field_mult_clos : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 x1 x2 :e field0 x0))).
Axiom explicit_Field_minus_mult_L : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 (explicit_Field_minus x0 x1 x2 x3 x4 x5) x6 = explicit_Field_minus x0 x1 x2 x3 x4 (x4 x5 x6)))).
Theorem Field_minus_mult_L : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 (Field_minus x0 x1) x2 = Field_minus x0 (field2b x0 x1 x2)))).
admit.
Qed.
Axiom explicit_Field_minus_mult_R : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 (explicit_Field_minus x0 x1 x2 x3 x4 x6) = explicit_Field_minus x0 x1 x2 x3 x4 (x4 x5 x6)))).
Theorem Field_minus_mult_R : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 x1 (Field_minus x0 x2) = Field_minus x0 (field2b x0 x1 x2)))).
admit.
Qed.
Axiom explicit_Field_square_zero_inv : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> x4 x5 x5 = x1 -> x5 = x1)).
Theorem Field_square_zero_inv : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> field2b x0 x1 x1 = field3 x0 -> x1 = field3 x0)).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom explicit_Field_mult_zero_inv : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x1 -> or (x5 = x1) (x6 = x1)))).
Theorem Field_mult_zero_inv : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 x1 x2 = field3 x0 -> or (x1 = field3 x0) (x2 = field3 x0)))).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition missingname_5a142e824e77a1b309098648d5af69482cd18d82efbcaab595f57de43fadb5fd : set -> prop :=
 (fun x0 : set => and (Field x0) (forall x1, x1 :e omega -> nat_primrec (field4 x0) (fun x3 : set => field1b x0 (field4 x0)) x1 = field3 x0 -> (forall x2 : prop, x2))).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition subfield : set -> set -> prop :=
 (fun x0 x1 : set => and (and (and (and (and (and (Field x0) (Field x1)) (field0 x0 c= field0 x1)) (field3 x0 = field3 x1)) (field4 x0 = field4 x1)) (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field1b x0 x2 x3 = field1b x1 x2 x3))) (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field2b x0 x2 x3 = field2b x1 x2 x3))).
Axiom and7I : (forall x0 x1 x2 x3 x4 x5 x6 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6).
Theorem subfield_I : (forall x0 x1, Field x0 -> Field x1 -> field0 x0 c= field0 x1 -> field3 x0 = field3 x1 -> field4 x0 = field4 x1 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field1b x0 x2 x3 = field1b x1 x2 x3)) -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field2b x0 x2 x3 = field2b x1 x2 x3)) -> subfield x0 x1).
admit.
Qed.
Axiom and7E : (forall x0 x1 x2 x3 x4 x5 x6 : prop, and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6 -> (forall x7 : prop, (x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7) -> x7)).
Theorem subfield_E : (forall x0 x1, subfield x0 x1 -> (forall x2 : prop, (Field x0 -> Field x1 -> field0 x0 c= field0 x1 -> field3 x0 = field3 x1 -> field4 x0 = field4 x1 -> (forall x3, x3 :e field0 x0 -> (forall x4, x4 :e field0 x0 -> field1b x0 x3 x4 = field1b x1 x3 x4)) -> (forall x3, x3 :e field0 x0 -> (forall x4, x4 :e field0 x0 -> field2b x0 x3 x4 = field2b x1 x3 x4)) -> x2) -> x2)).
admit.
Qed.
Definition Field_Hom : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (and (and (and (and (Field x0) (Field x1)) (x2 :e setexp (field0 x1) (field0 x0))) (ap x2 (field3 x0) = field3 x1)) (ap x2 (field4 x0) = field4 x1)) (forall x3, x3 :e field0 x0 -> (forall x4, x4 :e field0 x0 -> ap x2 (field1b x0 x3 x4) = field1b x1 (ap x2 x3) (ap x2 x4)))) (forall x3, x3 :e field0 x0 -> (forall x4, x4 :e field0 x0 -> ap x2 (field2b x0 x3 x4) = field2b x1 (ap x2 x3) (ap x2 x4)))).
Theorem Field_Hom_I : (forall x0 x1 x2, Field x0 -> Field x1 -> x2 :e setexp (field0 x1) (field0 x0) -> ap x2 (field3 x0) = field3 x1 -> ap x2 (field4 x0) = field4 x1 -> (forall x3, x3 :e field0 x0 -> (forall x4, x4 :e field0 x0 -> ap x2 (field1b x0 x3 x4) = field1b x1 (ap x2 x3) (ap x2 x4))) -> (forall x3, x3 :e field0 x0 -> (forall x4, x4 :e field0 x0 -> ap x2 (field2b x0 x3 x4) = field2b x1 (ap x2 x3) (ap x2 x4))) -> Field_Hom x0 x1 x2).
admit.
Qed.
(* Parameter CRing_with_id_omega_exp "82a25088c21c988ed9a4541afc7233b70b575b4b0b2067bf8de07a88abd55d02" "b079d3c235188503c60077e08e7cb89a17aa1444006788a8377caf62b43ea1ea" *)
Parameter CRing_with_id_omega_exp : set -> set -> set -> set.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom Field_omega_exp_0 : (forall x0, Field x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (CRing_with_id_omega_exp x0 x1 0) (field4 x0) -> x2 (field4 x0) (CRing_with_id_omega_exp x0 x1 0))).
Axiom Field_omega_exp_S : (forall x0, Field x0 -> (forall x1 x2, x2 :e omega -> CRing_with_id_omega_exp x0 x1 (ordsucc x2) = field2b x0 x1 (CRing_with_id_omega_exp x0 x1 x2))).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom Field_omega_exp_clos : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e omega -> CRing_with_id_omega_exp x0 x1 x2 :e field0 x0))).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter Field_div "721b554268a9a69ec4ddc429f9be98a164c8910b662e21de0b0a667d19ac127f" "33f36e749d7a3683affaed574c634802fe501ef213c5ca5e7c8dc0153464ea3e" *)
Parameter Field_div : set -> set -> set -> set.
Axiom Field_one_neq_zero : (forall x0, Field x0 -> field4 x0 = field3 x0 -> (forall x1 : prop, x1)).
Axiom Field_mult_div : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field3 x0)) -> x1 = field2b x0 x2 (Field_div x0 x1 x2)))).
Axiom Field_div_clos : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field3 x0)) -> Field_div x0 x1 x2 :e field0 x0))).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Theorem Field_Hom_E : (forall x0 x1 x2, Field_Hom x0 x1 x2 -> (forall x3 : prop, (Field x0 -> Field x1 -> x2 :e setexp (field0 x1) (field0 x0) -> ap x2 (field3 x0) = field3 x1 -> ap x2 (field4 x0) = field4 x1 -> (forall x4, x4 :e field0 x0 -> (forall x5, x5 :e field0 x0 -> ap x2 (field1b x0 x4 x5) = field1b x1 (ap x2 x4) (ap x2 x5))) -> (forall x4, x4 :e field0 x0 -> (forall x5, x5 :e field0 x0 -> ap x2 (field2b x0 x4 x5) = field2b x1 (ap x2 x4) (ap x2 x5))) -> (forall x4, x4 :e field0 x0 -> ap x2 (Field_minus x0 x4) = Field_minus x1 (ap x2 x4)) -> (forall x4, x4 :e field0 x0 -> ap x2 x4 = field3 x1 -> x4 = field3 x0) -> (forall x4, x4 :e field0 x0 -> (forall x5, x5 :e field0 x0 -> ap x2 x4 = ap x2 x5 -> x4 = x5)) -> (forall x4, x4 :e field0 x0 -> (forall x5, x5 :e omega -> ap x2 (CRing_with_id_omega_exp x0 x4 x5) = CRing_with_id_omega_exp x1 (ap x2 x4) x5)) -> x3) -> x3)).
admit.
Qed.
Theorem Field_Hom_inj : (forall x0 x1 x2, Field_Hom x0 x1 x2 -> (forall x3, x3 :e field0 x0 -> (forall x4, x4 :e field0 x0 -> ap x2 x3 = ap x2 x4 -> x3 = x4))).
admit.
Qed.
Theorem subfield_refl : (forall x0, Field x0 -> subfield x0 x0).
admit.
Qed.
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Theorem subfield_tra : (forall x0 x1 x2, subfield x0 x1 -> subfield x1 x2 -> subfield x0 x2).
admit.
Qed.
Definition Field_extension_by_1 : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (subfield x0 x1) (x2 :e setminus (field0 x1) (field0 x0))) (forall x3, subfield x0 x3 -> x2 :e field0 x3 -> subfield x1 x3)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem Field_extension_by_1_I : (forall x0 x1 x2, subfield x0 x1 -> x2 :e setminus (field0 x1) (field0 x0) -> (forall x3, subfield x0 x3 -> x2 :e field0 x3 -> subfield x1 x3) -> Field_extension_by_1 x0 x1 x2).
admit.
Qed.
Axiom and3E : (forall x0 x1 x2 : prop, and (and x0 x1) x2 -> (forall x3 : prop, (x0 -> x1 -> x2 -> x3) -> x3)).
Theorem Field_extension_by_1_E : (forall x0 x1 x2, Field_extension_by_1 x0 x1 x2 -> (forall x3 : prop, (subfield x0 x1 -> x2 :e setminus (field0 x1) (field0 x0) -> (forall x4, subfield x0 x4 -> x2 :e field0 x4 -> subfield x1 x4) -> x3) -> x3)).
admit.
Qed.
Definition radical_field_extension : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3, and (x3 :e omega) (forall x4 : prop, (forall x5, and (and (and (ap x5 0 = x0) (ap x5 x3 = x1)) (forall x6, x6 :e ordsucc x3 -> Field (ap x5 x6))) (forall x6, x6 :e x3 -> (forall x7 : prop, (forall x8, and (x8 :e field0 (ap x5 (ordsucc x6))) (forall x9 : prop, (forall x10, and (x10 :e omega) (and (CRing_with_id_omega_exp (ap x5 (ordsucc x6)) x8 x10 :e field0 (ap x5 x6)) (Field_extension_by_1 (ap x5 x6) (ap x5 (ordsucc x6)) x8)) -> x9) -> x9) -> x7) -> x7)) -> x4) -> x4) -> x2) -> x2).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Theorem radical_field_extension_I : (forall x0 x1 x2, x2 :e omega -> (forall x3, ap x3 0 = x0 -> ap x3 x2 = x1 -> (forall x4, x4 :e ordsucc x2 -> Field (ap x3 x4)) -> (forall x4, x4 :e x2 -> (forall x5 : prop, (forall x6, and (x6 :e field0 (ap x3 (ordsucc x4))) (forall x7 : prop, (forall x8, and (x8 :e omega) (and (CRing_with_id_omega_exp (ap x3 (ordsucc x4)) x6 x8 :e field0 (ap x3 x4)) (Field_extension_by_1 (ap x3 x4) (ap x3 (ordsucc x4)) x6)) -> x7) -> x7) -> x5) -> x5)) -> radical_field_extension x0 x1)).
admit.
Qed.
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Theorem radical_field_extension_E : (forall x0 x1, radical_field_extension x0 x1 -> (forall x2 : prop, (Field x0 -> Field x1 -> subfield x0 x1 -> (forall x3, x3 :e omega -> (forall x4, ap x4 0 = x0 -> ap x4 x3 = x1 -> (forall x5, x5 :e ordsucc x3 -> Field (ap x4 x5)) -> (forall x5, x5 :e ordsucc x3 -> (forall x6, x6 :e ordsucc x5 -> subfield (ap x4 x6) (ap x4 x5))) -> (forall x5, x5 :e x3 -> (forall x6 : prop, (forall x7, and (x7 :e field0 (ap x4 (ordsucc x5))) (forall x8 : prop, (forall x9, and (x9 :e omega) (and (CRing_with_id_omega_exp (ap x4 (ordsucc x5)) x7 x9 :e field0 (ap x4 x5)) (Field_extension_by_1 (ap x4 x5) (ap x4 (ordsucc x5)) x7)) -> x8) -> x8) -> x6) -> x6)) -> x2))) -> x2)).
admit.
Qed.
(* Parameter CRing_with_id_eval_poly "9fa747a53a5d1a2323ed6693fc43f28239dfe66a29852bf4137b17cc6149ce69" "b84ca72faca3a10b9b75c38d406768819f79488fbad8d9bee8b765c45e35823c" *)
Parameter CRing_with_id_eval_poly : set -> set -> set -> set -> set.
Definition missingname_51ff5b8b4eefdfcfdf9232efae9edc27c185d6a9dd776b6f5628bc19e838c2c7 : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => and (and (subfield x0 x1) (x3 :e setexp (field0 x0) (ordsucc x2))) (forall x4 : prop, (forall x5, and (x5 :e setminus (field0 x0) (Sing (field3 x0))) (and (ap x3 x2 = x5) (forall x6 : prop, (forall x7, and (x7 :e setexp (setexp (field0 x1) 2) x2) (and (forall x8, x8 :e x2 -> ap (ap x7 x8) 1 = field4 x0) (forall x8, x8 :e field0 x1 -> CRing_with_id_eval_poly x1 (ordsucc x2) x3 x8 = nat_primrec x5 (fun x10 x11 : set => field2b x1 x11 (CRing_with_id_eval_poly x1 2 (ap x7 x10) x8)) x2)) -> x6) -> x6)) -> x4) -> x4)).
Definition missingname_83bc597c2b0b94d91380ef182323b516f1956d2ac61f7b8a1c7e5f05b39b6051 : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => and (missingname_51ff5b8b4eefdfcfdf9232efae9edc27c185d6a9dd776b6f5628bc19e838c2c7 x0 x1 x2 x3) (forall x4, missingname_51ff5b8b4eefdfcfdf9232efae9edc27c185d6a9dd776b6f5628bc19e838c2c7 x0 x4 x2 x3 -> (forall x5 : prop, (forall x6, and (and (Field_Hom x1 x4 x6) (forall x7, x7 :e field0 x0 -> ap x6 x7 = x7)) (forall x7, x7 :e field0 x0 -> (forall x8, x8 :e field0 x0 -> ap x6 x7 = ap x6 x8 -> x7 = x8)) -> x5) -> x5))).
Definition missingname_747eca6e098a5bc8ecdccb619c9c46b52009eba2fb8c19c28d9ed049ec8c295a : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : prop, (forall x4, (forall x5 : prop, (forall x6, and (and (missingname_83bc597c2b0b94d91380ef182323b516f1956d2ac61f7b8a1c7e5f05b39b6051 x0 x4 x1 x2) (subfield x4 x6)) (radical_field_extension x0 x6) -> x5) -> x5) -> x3) -> x3).
Definition Field_automorphism_fixing : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (and (subfield x1 x0) (Field_Hom x0 x0 x2)) (forall x3, x3 :e ap x0 0 -> (forall x4 : prop, (forall x5, and (x5 :e ap x0 0) (ap x2 x5 = x3) -> x4) -> x4))) (forall x3, x3 :e ap x1 0 -> ap x2 x3 = x3)).
Theorem Field_automorphism_fixing_I : (forall x0 x1 x2, subfield x1 x0 -> Field_Hom x0 x0 x2 -> (forall x3, x3 :e ap x0 0 -> (forall x4 : prop, (forall x5, and (x5 :e ap x0 0) (ap x2 x5 = x3) -> x4) -> x4)) -> (forall x3, x3 :e ap x1 0 -> ap x2 x3 = x3) -> Field_automorphism_fixing x0 x1 x2).
admit.
Qed.
Axiom and4E : (forall x0 x1 x2 x3 : prop, and (and (and x0 x1) x2) x3 -> (forall x4 : prop, (x0 -> x1 -> x2 -> x3 -> x4) -> x4)).
Theorem Field_automorphism_fixing_E : (forall x0 x1 x2, Field_automorphism_fixing x0 x1 x2 -> (forall x3 : prop, (subfield x1 x0 -> Field_Hom x0 x0 x2 -> (forall x4, x4 :e ap x0 0 -> (forall x5 : prop, (forall x6, and (x6 :e ap x0 0) (ap x2 x6 = x4) -> x5) -> x5)) -> (forall x4, x4 :e ap x1 0 -> ap x2 x4 = x4) -> x3) -> x3)).
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Definition lam_id : set -> set :=
 (fun x0 : set => lam x0 (fun x1 : set => x1)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Theorem lam_comp_exp_In : (forall x0 x1 x2 x3, x3 :e setexp x1 x0 -> (forall x4, x4 :e setexp x2 x1 -> lam_comp x0 x4 x3 :e setexp x2 x0)).
admit.
Qed.
Theorem lam_id_exp_In : (forall x0, lam_id x0 :e setexp x0 x0).
admit.
Qed.
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Theorem lam_comp_assoc : (forall x0 x1 x2, x2 :e setexp x1 x0 -> (forall x3 x4, forall x5 : set -> set -> prop, x5 (lam_comp x0 x4 (lam_comp x0 x3 x2)) (lam_comp x0 (lam_comp x1 x4 x3) x2) -> x5 (lam_comp x0 (lam_comp x1 x4 x3) x2) (lam_comp x0 x4 (lam_comp x0 x3 x2)))).
admit.
Qed.
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Theorem lam_comp_id_L : (forall x0 x1 x2, x2 :e setexp x1 x0 -> lam_comp x0 (lam_id x1) x2 = x2).
admit.
Qed.
Theorem lam_comp_id_R : (forall x0 x1 x2, x2 :e setexp x1 x0 -> lam_comp x0 x2 (lam_id x0) = x2).
admit.
Qed.
Theorem Field_Hom_id : (forall x0, Field x0 -> Field_Hom x0 x0 (lam_id (ap x0 0))).
admit.
Qed.
Theorem Field_Hom_comp : (forall x0 x1 x2 x3 x4, Field_Hom x0 x1 x3 -> Field_Hom x1 x2 x4 -> Field_Hom x0 x2 (lam_comp (ap x0 0) x4 x3)).
admit.
Qed.
(* Parameter pack_b "e007d96601771e291e9083ce21b5e97703bce4ff5257fec59b7ed3dbb05b5319" "855387af88aad68b5f942a3a97029fcd79fe0a4e781cdf546d058297f8a483ce" *)
Parameter pack_b : set -> (set -> set -> set) -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition Galois_Group : set -> set -> set :=
 (fun x0 x1 : set => pack_b (Sep (setexp (ap x0 0) (ap x0 0)) (Field_automorphism_fixing x0 x1)) (lam_comp (ap x0 0))).
Axiom pack_b_0_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 x0 (ap (pack_b x0 x1) 0) -> x2 (ap (pack_b x0 x1) 0) x0).
Theorem Galois_Group_0 : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (Galois_Group x0 x1) 0) (Sep (setexp (ap x0 0) (ap x0 0)) (Field_automorphism_fixing x0 x1)) -> x2 (Sep (setexp (ap x0 0) (ap x0 0)) (Field_automorphism_fixing x0 x1)) (ap (Galois_Group x0 x1) 0)).
admit.
Qed.
Definition explicit_Group : set -> (set -> set -> set) -> prop :=
 (fun x0 : set => fun x1 : set -> set -> set => and (and (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 (x1 x3 x4) = x1 (x1 x2 x3) x4)))) (forall x2 : prop, (forall x3, and (x3 :e x0) (and (forall x4, x4 :e x0 -> and (x1 x3 x4 = x4) (x1 x4 x3 = x4)) (forall x4, x4 :e x0 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (and (x1 x4 x6 = x3) (x1 x6 x4 = x3)) -> x5) -> x5))) -> x2) -> x2)).
Axiom GroupI : (forall x0, forall x1 : set -> set -> set, explicit_Group x0 x1 -> Group (pack_b x0 x1)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
Axiom bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
Axiom missingprop_f9fc2fb6cfb4eb217cfd90f255fb35b64bd1729aa515ae6c662014a80909baf4 : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x0 -> inv x0 x2 (x2 x3) = x3)).
Axiom surj_rinv : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> (forall x3, x3 :e x1 -> and (inv x0 x2 x3 :e x0) (x2 (inv x0 x2 x3) = x3))).
Axiom bij_inv : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> bij x1 x0 (inv x0 x2)).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Theorem Galois_Group_Group : (forall x0 x1, subfield x0 x1 -> Group (Galois_Group x1 x0)).
admit.
Qed.
(* Parameter pack_b_b_e_e "0ca5ba562d2ab04221b86aded545ed077bf3a2f06e21344f04ba0b43521b231e" "6859fb13a44929ca6d7c0e598ffc6a6f82969c8cfe5edda33f1c1d81187b9d31" *)
Parameter pack_b_b_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
Axiom pack_struct_b_b_e_e_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 x4 :e x0)) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4))))).
(* Parameter RealsStruct "d29e0a271e279bed247f0e5ec6895735ab27f7eeabc9cb00a1366d5d7e7da6ca" "9971dcf75f0995efe4245a98bcdf103e4713261d35432146405052f36f8234bf" *)
Parameter RealsStruct : set -> prop.
(* Parameter RealsStruct_Q "9134ada3d735402039f76383770584fc0f331d09a6678c60511c4437b58c8986" "255c25547da742d6085a5308f204f5b90d6ba5991863cf0b3e4036ef74ee35a2" *)
Parameter RealsStruct_Q : set -> set.
(* Parameter RealsStruct_one "520b74715d23e4ce89f2ff9de5106772f592f32c69a1d405949d1ee275f54e53" "7aa92281bc38360837d18b9ec38ff8359d55a8c6ef4349c5777aab707e79589b" *)
Parameter RealsStruct_one : set -> set.
(* Parameter Field_of_RealsStruct "ea953ac10b642a9da289025dff57d46f78a32954a0c94609646f8f83d8119728" "e1df2c6881a945043093f666186fa5159d4b31d68340b37bd2be81d10ba28060" *)
Parameter Field_of_RealsStruct : set -> set.
(* Parameter natOfOrderedField_p "f97b150093ec13f84694e2b8f48becf45e4b6df2b43c1085ae7a99663116b9a6" "f1c45e0e9f9df75c62335865582f186c3ec3df1a94bc94b16d41e73bf27899f9" *)
Parameter natOfOrderedField_p : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop.
(* Parameter RealsStruct_leq "0d90e9f1543e4460b11fd7539e39b4d40e21b02cbbfababad2dde50ffee3eb93" "e59503fd8967d408619422bdebda4be08c9654014309b60880a3d7acf647e2b4" *)
Parameter RealsStruct_leq : set -> set -> set -> prop.
Definition RealsStruct_N : set -> set :=
 (fun x0 : set => Sep (field0 x0) (natOfOrderedField_p (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0) (RealsStruct_leq x0))).
Definition RealsStruct_Npos : set -> set :=
 (fun x0 : set => Sep (RealsStruct_N x0) (fun x1 : set => x1 = field4 x0 -> (forall x2 : prop, x2))).
Definition RealsStruct_Z : set -> set :=
 (fun x0 : set => Sep (field0 x0) (fun x1 : set => or (or (Field_minus (Field_of_RealsStruct x0) x1 :e RealsStruct_Npos x0) (x1 = field4 x0)) (x1 :e RealsStruct_Npos x0))).
Definition explicit_OrderedField_rationalp : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 : set => forall x7 : prop, (forall x8, and (x8 :e Sep x0 (fun x9 : set => or (or (explicit_Field_minus x0 x1 x2 x3 x4 x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))) (x9 = x1)) (x9 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x10 : set => x10 = x1 -> (forall x11 : prop, x11))))) (forall x9 : prop, (forall x10, and (x10 :e Sep (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (fun x11 : set => x11 = x1 -> (forall x12 : prop, x12))) (x4 x10 x6 = x8) -> x9) -> x9) -> x7) -> x7).
(* Parameter explicit_OrderedField "1195f96dcd143e4b896b4c1eb080d1fb877084debc58a8626d3dcf7a14ce8df7" "a18f7bca989a67fb7dc6df8e6c094372c26fa2c334578447d3314616155afb72" *)
Parameter explicit_OrderedField : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Axiom explicit_Field_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (x6 = x1 -> (forall x7 : prop, x7)) -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x4 x6 x8 = x2) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_Field x0 x1 x2 x3 x4 -> x5).
Axiom Field_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : prop -> prop -> prop, x5 (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Field x6 x9 x10 x7 x8)) (explicit_Field x0 x3 x4 x1 x2) -> x5 (explicit_Field x0 x3 x4 x1 x2) (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Field x6 x9 x10 x7 x8))).
Axiom explicit_OrderedField_explicit_Field_Q : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Field (Sep x0 (explicit_OrderedField_rationalp x0 x1 x2 x3 x4 x5)) x1 x2 x3 x4).
Axiom explicit_OrderedField_of_RealsStruct : (forall x0, RealsStruct x0 -> explicit_OrderedField (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0) (RealsStruct_leq x0)).
Axiom RealsStruct_Q_props : (forall x0, RealsStruct x0 -> (forall x1 : prop, (RealsStruct_Q x0 c= field0 x0 -> (forall x2, x2 :e RealsStruct_Q x0 -> (forall x3 : prop, (x2 :e field0 x0 -> (forall x4, x4 :e RealsStruct_Z x0 -> (forall x5, x5 :e RealsStruct_Npos x0 -> field2b x0 x5 x2 = x4 -> x3))) -> x3)) -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e RealsStruct_Z x0 -> (forall x4, x4 :e RealsStruct_Npos x0 -> field2b x0 x4 x2 = x3 -> x2 :e RealsStruct_Q x0))) -> x1) -> x1)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom RealsStruct_minus_eq2 : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> Field_minus (Field_of_RealsStruct x0) x1 = explicit_Field_minus (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0) x1)).
Theorem Field_RealsStruct_Q : (forall x0, RealsStruct x0 -> Field (pack_b_b_e_e (RealsStruct_Q x0) (field1b x0) (field2b x0) (field4 x0) (RealsStruct_one x0))).
admit.
Qed.
Definition RealsStruct_omega_embedding : set -> set -> set :=
 (fun x0 : set => nat_primrec (field4 x0) (fun x1 x2 : set => field1b x0 x2 (RealsStruct_one x0))).
(* Parameter explicit_Nats "4a59caa11140eabb1b7db2d3493fe76a92b002b3b27e3dfdd313708c6c6ca78f" "3fb62f75e778736947d086a36d35ebe45a5d60bf0a340a0761ba08a396d4123a" *)
Parameter explicit_Nats : set -> set -> (set -> set) -> prop.
Axiom explicit_Nats_E : (forall x0 x1, forall x2 : set -> set, forall x3 : prop, (explicit_Nats x0 x1 x2 -> x1 :e x0 -> (forall x4, x4 :e x0 -> x2 x4 :e x0) -> (forall x4, x4 :e x0 -> x2 x4 = x1 -> (forall x5 : prop, x5)) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4 : set -> prop, x4 x1 -> (forall x5, x4 x5 -> x4 (x2 x5)) -> (forall x5, x5 :e x0 -> x4 x5)) -> x3) -> explicit_Nats x0 x1 x2 -> x3).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Axiom RealsStruct_natOfOrderedField : (forall x0, RealsStruct x0 -> explicit_Nats (RealsStruct_N x0) (field4 x0) (fun x1 : set => field1b x0 x1 (RealsStruct_one x0))).
Theorem RealsStruct_omega_embedding_N : (forall x0, RealsStruct x0 -> (forall x1, x1 :e omega -> RealsStruct_omega_embedding x0 x1 :e RealsStruct_N x0)).
admit.
Qed.
