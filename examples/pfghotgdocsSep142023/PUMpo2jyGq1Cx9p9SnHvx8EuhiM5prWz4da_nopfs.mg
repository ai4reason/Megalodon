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
(* Parameter struct_b_b_e_e "af2850387310cf676e35267e10a14affc439a209ad200b7edc42d8142611fcd4" "7685bdf4f6436a90f8002790ede7ec64e03b146138f7d85bc11be7d287d3652b" *)
Parameter struct_b_b_e_e : set -> prop.
(* Parameter pack_b_b_e_e "0ca5ba562d2ab04221b86aded545ed077bf3a2f06e21344f04ba0b43521b231e" "6859fb13a44929ca6d7c0e598ffc6a6f82969c8cfe5edda33f1c1d81187b9d31" *)
Parameter pack_b_b_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition decode_b : set -> set -> set -> set :=
 (fun x0 x1 : set => ap (ap x0 x1)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom struct_b_b_e_e_eta : (forall x0, struct_b_b_e_e x0 -> x0 = pack_b_b_e_e (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (ap x0 3) (ap x0 4)).
Axiom pack_struct_b_b_e_e_E1 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 :e x0))).
Axiom pack_struct_b_b_e_e_E2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 :e x0))).
Axiom pack_struct_b_b_e_e_E3 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> x3 :e x0).
Axiom pack_struct_b_b_e_e_E4 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4) -> x4 :e x0).
Definition field0 : set -> set :=
 (fun x0 : set => ap x0 0).
Definition field1b : set -> set -> set -> set :=
 (fun x0 : set => decode_b (ap x0 1)).
Definition field2b : set -> set -> set -> set :=
 (fun x0 : set => decode_b (ap x0 2)).
Definition field3 : set -> set :=
 (fun x0 : set => ap x0 3).
Definition field4 : set -> set :=
 (fun x0 : set => ap x0 4).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter unpack_b_b_e_e_o "eb93435a79c01148fc12dd7779795d68cc2251130dc7633623f16664d25ed072" "1bcc21b2f13824c926a364c5b001d252d630f39a0ebe1f8af790facbe0f63a11" *)
Parameter unpack_b_b_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop) -> prop.
(* Parameter explicit_CRing_with_id "e617a2c69bd7575dc6ebd47c67ca7c8b08c0c22a914504a403e3db24ee172987" "83e7eeb351d92427c0d3bb2bd24e83d0879191c3aa01e7be24fb68ffdbb9060c" *)
Parameter explicit_CRing_with_id : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Definition CRing_with_id : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_CRing_with_id x1 x4 x5 x2 x3))).
Theorem CRing_with_id_eta : (forall x0, CRing_with_id x0 -> x0 = pack_b_b_e_e (field0 x0) (field1b x0) (field2b x0) (field3 x0) (field4 x0)).
admit.
Qed.
Axiom CRing_with_id_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : prop -> prop -> prop, x5 (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_CRing_with_id x6 x9 x10 x7 x8)) (explicit_CRing_with_id x0 x3 x4 x1 x2) -> x5 (explicit_CRing_with_id x0 x3 x4 x1 x2) (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_CRing_with_id x6 x9 x10 x7 x8))).
Theorem CRing_with_id_explicit_CRing_with_id : (forall x0, CRing_with_id x0 -> explicit_CRing_with_id (field0 x0) (field3 x0) (field4 x0) (field1b x0) (field2b x0)).
admit.
Qed.
Theorem CRing_with_id_zero_In : (forall x0, CRing_with_id x0 -> field3 x0 :e field0 x0).
admit.
Qed.
Theorem CRing_with_id_one_In : (forall x0, CRing_with_id x0 -> field4 x0 :e field0 x0).
admit.
Qed.
Theorem CRing_with_id_plus_clos : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field1b x0 x1 x2 :e field0 x0))).
admit.
Qed.
Theorem CRing_with_id_mult_clos : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 x1 x2 :e field0 x0))).
admit.
Qed.
Axiom explicit_CRing_with_id_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_CRing_with_id x0 x1 x2 x3 x4 -> x5).
Theorem CRing_with_id_plus_assoc : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field1b x0 x1 (field1b x0 x2 x3) = field1b x0 (field1b x0 x1 x2) x3)))).
admit.
Qed.
Theorem CRing_with_id_plus_com : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field1b x0 x1 x2 = field1b x0 x2 x1))).
admit.
Qed.
Theorem CRing_with_id_zero_L : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> field1b x0 (field3 x0) x1 = x1)).
admit.
Qed.
Theorem CRing_with_id_plus_inv : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> (forall x2 : prop, (forall x3, and (x3 :e field0 x0) (field1b x0 x1 x3 = field3 x0) -> x2) -> x2))).
admit.
Qed.
Theorem CRing_with_id_mult_assoc : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field2b x0 x1 (field2b x0 x2 x3) = field2b x0 (field2b x0 x1 x2) x3)))).
admit.
Qed.
Theorem CRing_with_id_mult_com : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 x1 x2 = field2b x0 x2 x1))).
admit.
Qed.
Theorem CRing_with_id_one_neq_zero : (forall x0, CRing_with_id x0 -> field4 x0 = field3 x0 -> (forall x1 : prop, x1)).
admit.
Qed.
Theorem CRing_with_id_one_L : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> field2b x0 (field4 x0) x1 = x1)).
admit.
Qed.
Theorem CRing_with_id_distr_L : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field2b x0 x1 (field1b x0 x2 x3) = field1b x0 (field2b x0 x1 x2) (field2b x0 x1 x3))))).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition CRing_with_id_omega_exp : set -> set -> set -> set :=
 (fun x0 x1 : set => nat_primrec (field4 x0) (fun x2 : set => field2b x0 x1)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem CRing_with_id_omega_exp_0 : (forall x0, CRing_with_id x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (CRing_with_id_omega_exp x0 x1 0) (field4 x0) -> x2 (field4 x0) (CRing_with_id_omega_exp x0 x1 0))).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem CRing_with_id_omega_exp_S : (forall x0, CRing_with_id x0 -> (forall x1 x2, x2 :e omega -> CRing_with_id_omega_exp x0 x1 (ordsucc x2) = field2b x0 x1 (CRing_with_id_omega_exp x0 x1 x2))).
admit.
Qed.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_0 : nat_p 0.
Theorem CRing_with_id_omega_exp_1 : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> CRing_with_id_omega_exp x0 x1 1 = x1)).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Theorem CRing_with_id_omega_exp_clos : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e omega -> CRing_with_id_omega_exp x0 x1 x2 :e field0 x0))).
admit.
Qed.
Definition CRing_with_id_eval_poly : set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 : set => nat_primrec (field3 x0) (fun x4 : set => field1b x0 (field2b x0 (ap x2 x4) (CRing_with_id_omega_exp x0 x3 x4))) x1).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem CRing_with_id_eval_poly_clos : (forall x0, CRing_with_id x0 -> (forall x1, x1 :e omega -> (forall x2, x2 :e setexp (field0 x0) x1 -> (forall x3, x3 :e field0 x0 -> CRing_with_id_eval_poly x0 x1 x2 x3 :e field0 x0)))).
admit.
Qed.
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Definition Field : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_Field x1 x4 x5 x2 x3))).
Theorem Field_eta : (forall x0, Field x0 -> x0 = pack_b_b_e_e (field0 x0) (field1b x0) (field2b x0) (field3 x0) (field4 x0)).
admit.
Qed.
Axiom Field_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : prop -> prop -> prop, x5 (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Field x6 x9 x10 x7 x8)) (explicit_Field x0 x3 x4 x1 x2) -> x5 (explicit_Field x0 x3 x4 x1 x2) (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Field x6 x9 x10 x7 x8))).
Theorem Field_explicit_Field : (forall x0, Field x0 -> explicit_Field (field0 x0) (field3 x0) (field4 x0) (field1b x0) (field2b x0)).
admit.
Qed.
Theorem Field_zero_In : (forall x0, Field x0 -> field3 x0 :e field0 x0).
admit.
Qed.
Theorem Field_one_In : (forall x0, Field x0 -> field4 x0 :e field0 x0).
admit.
Qed.
Theorem Field_plus_clos : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field1b x0 x1 x2 :e field0 x0))).
admit.
Qed.
Theorem Field_mult_clos : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 x1 x2 :e field0 x0))).
admit.
Qed.
Axiom explicit_Field_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (x6 = x1 -> (forall x7 : prop, x7)) -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x4 x6 x8 = x2) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_Field x0 x1 x2 x3 x4 -> x5).
Theorem Field_plus_assoc : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field1b x0 x1 (field1b x0 x2 x3) = field1b x0 (field1b x0 x1 x2) x3)))).
admit.
Qed.
Theorem Field_plus_com : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field1b x0 x1 x2 = field1b x0 x2 x1))).
admit.
Qed.
Theorem Field_zero_L : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> field1b x0 (field3 x0) x1 = x1)).
admit.
Qed.
Theorem Field_plus_inv : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2 : prop, (forall x3, and (x3 :e field0 x0) (field1b x0 x1 x3 = field3 x0) -> x2) -> x2))).
admit.
Qed.
Theorem Field_mult_assoc : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field2b x0 x1 (field2b x0 x2 x3) = field2b x0 (field2b x0 x1 x2) x3)))).
admit.
Qed.
Theorem Field_mult_com : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 x1 x2 = field2b x0 x2 x1))).
admit.
Qed.
Theorem Field_one_neq_zero : (forall x0, Field x0 -> field4 x0 = field3 x0 -> (forall x1 : prop, x1)).
admit.
Qed.
Theorem Field_one_L : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> field2b x0 (field4 x0) x1 = x1)).
admit.
Qed.
Theorem Field_mult_inv_L : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (x1 = field3 x0 -> (forall x2 : prop, x2)) -> (forall x2 : prop, (forall x3, and (x3 :e field0 x0) (field2b x0 x1 x3 = field4 x0) -> x2) -> x2))).
admit.
Qed.
Theorem Field_distr_L : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field2b x0 x1 (field1b x0 x2 x3) = field1b x0 (field2b x0 x1 x2) (field2b x0 x1 x3))))).
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition Field_div : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => If_i (and (x1 :e field0 x0) (x2 :e setminus (field0 x0) (Sing (field3 x0)))) (Eps_i (fun x3 : set => and (x3 :e field0 x0) (x1 = field2b x0 x2 x3))) 0).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Theorem Field_div_prop : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field3 x0)) -> and (Field_div x0 x1 x2 :e field0 x0) (x1 = field2b x0 x2 (Field_div x0 x1 x2))))).
admit.
Qed.
Theorem Field_div_clos : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field3 x0)) -> Field_div x0 x1 x2 :e field0 x0))).
admit.
Qed.
Theorem Field_mult_div : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field3 x0)) -> x1 = field2b x0 x2 (Field_div x0 x1 x2)))).
admit.
Qed.
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Theorem Field_div_undef1 : (forall x0, Field x0 -> (forall x1 x2, nIn x1 (field0 x0) -> Field_div x0 x1 x2 = 0)).
admit.
Qed.
Theorem Field_div_undef2 : (forall x0, Field x0 -> (forall x1 x2, nIn x2 (field0 x0) -> Field_div x0 x1 x2 = 0)).
admit.
Qed.
Theorem Field_div_undef3 : (forall x0, Field x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (Field_div x0 x1 (field3 x0)) 0 -> x2 0 (Field_div x0 x1 (field3 x0)))).
admit.
Qed.
Axiom Field_is_CRing_with_id : (forall x0, Field x0 -> CRing_with_id x0).
Theorem Field_omega_exp_0 : (forall x0, Field x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (CRing_with_id_omega_exp x0 x1 0) (field4 x0) -> x2 (field4 x0) (CRing_with_id_omega_exp x0 x1 0))).
admit.
Qed.
Theorem Field_omega_exp_S : (forall x0, Field x0 -> (forall x1 x2, x2 :e omega -> CRing_with_id_omega_exp x0 x1 (ordsucc x2) = field2b x0 x1 (CRing_with_id_omega_exp x0 x1 x2))).
admit.
Qed.
Theorem Field_omega_exp_1 : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> CRing_with_id_omega_exp x0 x1 1 = x1)).
admit.
Qed.
Theorem Field_omega_exp_clos : (forall x0, Field x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e omega -> CRing_with_id_omega_exp x0 x1 x2 :e field0 x0))).
admit.
Qed.
Theorem Field_eval_poly_clos : (forall x0, Field x0 -> (forall x1, x1 :e omega -> (forall x2, x2 :e setexp (field0 x0) x1 -> (forall x3, x3 :e field0 x0 -> CRing_with_id_eval_poly x0 x1 x2 x3 :e field0 x0)))).
admit.
Qed.
(* Parameter RealsStruct "d29e0a271e279bed247f0e5ec6895735ab27f7eeabc9cb00a1366d5d7e7da6ca" "9971dcf75f0995efe4245a98bcdf103e4713261d35432146405052f36f8234bf" *)
Parameter RealsStruct : set -> prop.
(* Parameter Field_of_RealsStruct "ea953ac10b642a9da289025dff57d46f78a32954a0c94609646f8f83d8119728" "e1df2c6881a945043093f666186fa5159d4b31d68340b37bd2be81d10ba28060" *)
Parameter Field_of_RealsStruct : set -> set.
Axiom Field_Field_of_RealsStruct : (forall x0, RealsStruct x0 -> Field (Field_of_RealsStruct x0)).
Theorem Field_of_RealsStruct_is_CRing_with_id : (forall x0, RealsStruct x0 -> CRing_with_id (Field_of_RealsStruct x0)).
admit.
Qed.
(* Parameter RealsStruct_leq "0d90e9f1543e4460b11fd7539e39b4d40e21b02cbbfababad2dde50ffee3eb93" "e59503fd8967d408619422bdebda4be08c9654014309b60880a3d7acf647e2b4" *)
Parameter RealsStruct_leq : set -> set -> set -> prop.
Definition RealsStruct_lt : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (RealsStruct_leq x0 x1 x2) (x1 = x2 -> (forall x3 : prop, x3))).
Theorem RealsStruct_lt_leq : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> RealsStruct_leq x0 x1 x2))).
admit.
Qed.
Theorem RealsStruct_lt_irref : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> not (RealsStruct_lt x0 x1 x1))).
admit.
Qed.
Axiom RealsStruct_leq_antisym : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_leq x0 x2 x1 -> x1 = x2))).
Theorem RealsStruct_lt_leq_asym : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> not (RealsStruct_leq x0 x2 x1)))).
admit.
Qed.
Theorem RealsStruct_leq_lt_asym : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> not (RealsStruct_lt x0 x2 x1)))).
admit.
Qed.
Theorem RealsStruct_lt_asym : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> not (RealsStruct_lt x0 x2 x1)))).
admit.
Qed.
Axiom RealsStruct_leq_tra : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_leq x0 x2 x3 -> RealsStruct_leq x0 x1 x3)))).
Theorem RealsStruct_lt_leq_tra : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> RealsStruct_leq x0 x2 x3 -> RealsStruct_lt x0 x1 x3)))).
admit.
Qed.
Theorem RealsStruct_leq_lt_tra : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_lt x0 x2 x3 -> RealsStruct_lt x0 x1 x3)))).
admit.
Qed.
Theorem RealsStruct_lt_tra : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_lt x0 x1 x2 -> RealsStruct_lt x0 x2 x3 -> RealsStruct_lt x0 x1 x3)))).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom RealsStruct_leq_linear : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> or (RealsStruct_leq x0 x1 x2) (RealsStruct_leq x0 x2 x1)))).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Theorem RealsStruct_lt_trich_impred : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3 : prop, (RealsStruct_lt x0 x1 x2 -> x3) -> (x1 = x2 -> x3) -> (RealsStruct_lt x0 x2 x1 -> x3) -> x3)))).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem RealsStruct_lt_trich : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> or (or (RealsStruct_lt x0 x1 x2) (x1 = x2)) (RealsStruct_lt x0 x2 x1)))).
admit.
Qed.
Axiom RealsStruct_leq_refl : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_leq x0 x1 x1)).
Theorem RealsStruct_leq_lt_linear : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> or (RealsStruct_leq x0 x1 x2) (RealsStruct_lt x0 x2 x1)))).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter natOfOrderedField_p "f97b150093ec13f84694e2b8f48becf45e4b6df2b43c1085ae7a99663116b9a6" "f1c45e0e9f9df75c62335865582f186c3ec3df1a94bc94b16d41e73bf27899f9" *)
Parameter natOfOrderedField_p : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop.
(* Parameter RealsStruct_one "520b74715d23e4ce89f2ff9de5106772f592f32c69a1d405949d1ee275f54e53" "7aa92281bc38360837d18b9ec38ff8359d55a8c6ef4349c5777aab707e79589b" *)
Parameter RealsStruct_one : set -> set.
Definition RealsStruct_N : set -> set :=
 (fun x0 : set => Sep (field0 x0) (natOfOrderedField_p (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0) (RealsStruct_leq x0))).
(* Parameter explicit_Reals "e5dee14fc7a24a63555de85859904de8dc1b462044060d68dbb06cc9a590bc38" "2c81615a11c9e3e301f3301ec7862ba122acea20bfe1c120f7bdaf5a2e18faf4" *)
Parameter explicit_Reals : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
(* Parameter explicit_OrderedField "1195f96dcd143e4b896b4c1eb080d1fb877084debc58a8626d3dcf7a14ce8df7" "a18f7bca989a67fb7dc6df8e6c094372c26fa2c334578447d3314616155afb72" *)
Parameter explicit_OrderedField : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Definition lt : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 x7 : set => and (x5 x6 x7) (x6 = x7 -> (forall x8 : prop, x8))).
Axiom explicit_Reals_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_Reals x0 x1 x2 x3 x4 x5 -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x7 -> x5 x1 x8 -> (forall x9 : prop, (forall x10, and (x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x8 (x4 x10 x7)) -> x9) -> x9))) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x9, x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x7 x9) (ap x8 x9)) (x5 (ap x7 x9) (ap x7 (x3 x9 x2)))) (x5 (ap x8 (x3 x9 x2)) (ap x8 x9))) -> (forall x9 : prop, (forall x10, and (x10 :e x0) (forall x11, x11 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x7 x11) x10) (x5 x10 (ap x8 x11))) -> x9) -> x9))) -> x6) -> explicit_Reals x0 x1 x2 x3 x4 x5 -> x6).
Axiom RealsStruct_explicit_Reals : (forall x0, RealsStruct x0 -> explicit_Reals (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0) (RealsStruct_leq x0)).
Theorem RealsStruct_Arch : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_lt x0 (field4 x0) x1 -> RealsStruct_leq x0 (field4 x0) x2 -> (forall x3 : prop, (forall x4, and (x4 :e RealsStruct_N x0) (RealsStruct_leq x0 x2 (field2b x0 x4 x1)) -> x3) -> x3)))).
admit.
Qed.
Axiom Field_of_RealsStruct_0 : (forall x0, forall x1 : set -> set -> prop, x1 (ap (Field_of_RealsStruct x0) 0) (field0 x0) -> x1 (field0 x0) (ap (Field_of_RealsStruct x0) 0)).
Axiom Field_of_RealsStruct_2f : (forall x0, RealsStruct x0 -> (fun x2 : set => ap (ap (ap (Field_of_RealsStruct x0) 2) x2)) = field2b x0).
Axiom Field_of_RealsStruct_3 : (forall x0, forall x1 : set -> set -> prop, x1 (ap (Field_of_RealsStruct x0) 3) (field4 x0) -> x1 (field4 x0) (ap (Field_of_RealsStruct x0) 3)).
Theorem missingprop_ad499193190ba375a092b292cf51cc11d1559701610035e3c7be4fe1c836f0c9 : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field4 x0)) -> and (Field_div (Field_of_RealsStruct x0) x1 x2 :e field0 x0) (x1 = field2b x0 x2 (Field_div (Field_of_RealsStruct x0) x1 x2))))).
admit.
Qed.
Theorem RealsStruct_div_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field4 x0)) -> Field_div (Field_of_RealsStruct x0) x1 x2 :e field0 x0))).
admit.
Qed.
Theorem RealsStruct_mult_div : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e setminus (field0 x0) (Sing (field4 x0)) -> x1 = field2b x0 x2 (Field_div (Field_of_RealsStruct x0) x1 x2)))).
admit.
Qed.
Theorem RealsStruct_div_undef1 : (forall x0, RealsStruct x0 -> (forall x1 x2, nIn x1 (field0 x0) -> Field_div (Field_of_RealsStruct x0) x1 x2 = 0)).
admit.
Qed.
Theorem RealsStruct_div_undef2 : (forall x0, RealsStruct x0 -> (forall x1 x2, nIn x2 (field0 x0) -> Field_div (Field_of_RealsStruct x0) x1 x2 = 0)).
admit.
Qed.
Theorem RealsStruct_div_undef3 : (forall x0, RealsStruct x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (Field_div (Field_of_RealsStruct x0) x1 (field4 x0)) 0 -> x2 0 (Field_div (Field_of_RealsStruct x0) x1 (field4 x0)))).
admit.
Qed.
Axiom Field_of_RealsStruct_4 : (forall x0, forall x1 : set -> set -> prop, x1 (ap (Field_of_RealsStruct x0) 4) (RealsStruct_one x0) -> x1 (RealsStruct_one x0) (ap (Field_of_RealsStruct x0) 4)).
Theorem RealsStruct_omega_exp_0 : (forall x0, RealsStruct x0 -> (forall x1, forall x2 : set -> set -> prop, x2 (CRing_with_id_omega_exp (Field_of_RealsStruct x0) x1 0) (RealsStruct_one x0) -> x2 (RealsStruct_one x0) (CRing_with_id_omega_exp (Field_of_RealsStruct x0) x1 0))).
admit.
Qed.
Theorem RealsStruct_omega_exp_S : (forall x0, RealsStruct x0 -> (forall x1 x2, x2 :e omega -> CRing_with_id_omega_exp (Field_of_RealsStruct x0) x1 (ordsucc x2) = field2b x0 x1 (CRing_with_id_omega_exp (Field_of_RealsStruct x0) x1 x2))).
admit.
Qed.
Theorem RealsStruct_omega_exp_1 : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> CRing_with_id_omega_exp (Field_of_RealsStruct x0) x1 1 = x1)).
admit.
Qed.
Theorem RealsStruct_omega_exp_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e omega -> CRing_with_id_omega_exp (Field_of_RealsStruct x0) x1 x2 :e field0 x0))).
admit.
Qed.
(* Parameter RealsStruct_Npos "2aba4a11f886ed7d2772a4203e4b5b3ed92efb7b762aac4e88b7ed51e515b123" "18dcd68b13ac8ef27a4d8dfec8909abfa78ffbb33539bea51d3397809f365642" *)
Parameter RealsStruct_Npos : set -> set.
Definition RealsStruct_divides : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : prop, (forall x4, and (x4 :e RealsStruct_Npos x0) (field2b x0 x1 x4 = x2) -> x3) -> x3).
Definition RealsStruct_Primes : set -> set :=
 (fun x0 : set => Sep (RealsStruct_N x0) (fun x1 : set => and (RealsStruct_lt x0 (RealsStruct_one x0) x1) (forall x2, x2 :e RealsStruct_Npos x0 -> RealsStruct_divides x0 x2 x1 -> or (x2 = RealsStruct_one x0) (x2 = x1)))).
Definition RealsStruct_coprime : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3, x3 :e RealsStruct_Npos x0 -> RealsStruct_divides x0 x3 x1 -> RealsStruct_divides x0 x3 x2 -> x3 = RealsStruct_one x0).
(* Parameter Field_minus "cad943ad3351894d7ba6a26fa37c5f118d52cb5656335ca3b111d786455306e6" "9072a08b056e30edab702a9b7c29162af6170c517da489a9b3eab1a982fdb325" *)
Parameter Field_minus : set -> set -> set.
Definition RealsStruct_abs : set -> set -> set :=
 (fun x0 x1 : set => If_i (RealsStruct_leq x0 (field4 x0) x1) x1 (Field_minus (Field_of_RealsStruct x0) x1)).
Axiom RealsStruct_minus_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> Field_minus (Field_of_RealsStruct x0) x1 :e field0 x0)).
Theorem RealsStruct_abs_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_abs x0 x1 :e field0 x0)).
admit.
Qed.
Theorem RealsStruct_abs_nonneg_case : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_leq x0 (field4 x0) x1 -> RealsStruct_abs x0 x1 = x1)).
admit.
Qed.
Axiom RealsStruct_zero_In : (forall x0, RealsStruct x0 -> field4 x0 :e field0 x0).
Theorem RealsStruct_abs_neg_case : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_lt x0 x1 (field4 x0) -> RealsStruct_abs x0 x1 = Field_minus (Field_of_RealsStruct x0) x1)).
admit.
Qed.
Axiom RealsStruct_minus_zero : (forall x0, RealsStruct x0 -> Field_minus (Field_of_RealsStruct x0) (field4 x0) = field4 x0).
Axiom RealsStruct_minus_leq : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_leq x0 (Field_minus (Field_of_RealsStruct x0) x2) (Field_minus (Field_of_RealsStruct x0) x1)))).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem RealsStruct_abs_nonneg : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_leq x0 (field4 x0) (RealsStruct_abs x0 x1))).
admit.
Qed.
Axiom RealsStruct_minus_invol : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> Field_minus (Field_of_RealsStruct x0) (Field_minus (Field_of_RealsStruct x0) x1) = x1)).
Theorem RealsStruct_abs_zero_inv : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_abs x0 x1 = field4 x0 -> x1 = field4 x0)).
admit.
Qed.
Axiom RealsStruct_plus_cancelR : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field1b x0 x1 x3 = field1b x0 x2 x3 -> x1 = x2)))).
Axiom RealsStruct_minus_R : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> field1b x0 x1 (Field_minus (Field_of_RealsStruct x0) x1) = field4 x0)).
Axiom RealsStruct_plus_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field1b x0 x1 x2 :e field0 x0))).
Theorem RealsStruct_dist_zero_eq : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_abs x0 (field1b x0 x1 (Field_minus (Field_of_RealsStruct x0) x2)) = field4 x0 -> x1 = x2))).
admit.
Qed.
