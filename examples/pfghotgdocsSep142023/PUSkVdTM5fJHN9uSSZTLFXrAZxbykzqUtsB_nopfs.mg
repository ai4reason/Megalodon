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
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition field0 : set -> set :=
 (fun x0 : set => ap x0 Empty).
Definition decode_b : set -> set -> set -> set :=
 (fun x0 x1 : set => ap (ap x0 x1)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition field1b : set -> set -> set -> set :=
 (fun x0 : set => decode_b (ap x0 1)).
Definition field2b : set -> set -> set -> set :=
 (fun x0 : set => decode_b (ap x0 2)).
(* Parameter decode_r "e25e4327c67053c3d99245dbaf92fdb3e5247e754bd6d8291f39ac34b6d57820" "f2f91589fb6488dd2bad3cebb9f65a57b7d7f3818091dcc789edd28f5d0ef2af" *)
Parameter decode_r : set -> set -> set -> prop.
Definition RealsStruct_leq : set -> set -> set -> prop :=
 (fun x0 : set => decode_r (ap x0 3)).
Definition field4 : set -> set :=
 (fun x0 : set => ap x0 4).
Definition RealsStruct_one : set -> set :=
 (fun x0 : set => ap x0 5).
(* Parameter pack_b_b_e_e "0ca5ba562d2ab04221b86aded545ed077bf3a2f06e21344f04ba0b43521b231e" "6859fb13a44929ca6d7c0e598ffc6a6f82969c8cfe5edda33f1c1d81187b9d31" *)
Parameter pack_b_b_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
Definition Field_of_RealsStruct : set -> set :=
 (fun x0 : set => pack_b_b_e_e (field0 x0) (field1b x0) (field2b x0) (field4 x0) (RealsStruct_one x0)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter explicit_Field_minus "be660f6f1e37e7325ec2a39529b9c937b61a60f864e85f0dabdf2bddacb0986e" "5be570b4bcbe7fefd36c2057491ddcc7b11903d8d98ca54d9b37db60d1bf0f7e" *)
Parameter explicit_Field_minus : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> set -> set.
Definition Field_minus : set -> set -> set :=
 (fun x0 x1 : set => If_i (x1 :e ap x0 0) (explicit_Field_minus (ap x0 0) (ap x0 3) (ap x0 4) (decode_b (ap x0 1)) (decode_b (ap x0 2)) x1) 0).
Axiom pack_b_b_e_e_0_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x0 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 0) -> x5 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 0) x0).
Theorem Field_of_RealsStruct_0 : (forall x0, forall x1 : set -> set -> prop, x1 (ap (Field_of_RealsStruct x0) 0) (field0 x0) -> x1 (field0 x0) (ap (Field_of_RealsStruct x0) 0)).
admit.
Qed.
Axiom pack_b_b_e_e_1_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4 x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x1 x5 x6 = decode_b (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 1) x5 x6)).
Theorem Field_of_RealsStruct_1 : (forall x0 x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> ap (ap (ap (Field_of_RealsStruct x0) 1) x1) x2 = field1b x0 x1 x2)).
admit.
Qed.
Axiom pack_b_b_e_e_2_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4 x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x2 x5 x6 = decode_b (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 2) x5 x6)).
Theorem Field_of_RealsStruct_2 : (forall x0 x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> ap (ap (ap (Field_of_RealsStruct x0) 2) x1) x2 = field2b x0 x1 x2)).
admit.
Qed.
Axiom pack_b_b_e_e_3_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x3 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 3) -> x5 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 3) x3).
Theorem Field_of_RealsStruct_3 : (forall x0, forall x1 : set -> set -> prop, x1 (ap (Field_of_RealsStruct x0) 3) (field4 x0) -> x1 (field4 x0) (ap (Field_of_RealsStruct x0) 3)).
admit.
Qed.
Axiom pack_b_b_e_e_4_eq2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : set -> set -> prop, x5 x4 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 4) -> x5 (ap (pack_b_b_e_e x0 x1 x2 x3 x4) 4) x4).
Theorem Field_of_RealsStruct_4 : (forall x0, forall x1 : set -> set -> prop, x1 (ap (Field_of_RealsStruct x0) 4) (RealsStruct_one x0) -> x1 (RealsStruct_one x0) (ap (Field_of_RealsStruct x0) 4)).
admit.
Qed.
(* Parameter struct_b_b_e_e "af2850387310cf676e35267e10a14affc439a209ad200b7edc42d8142611fcd4" "7685bdf4f6436a90f8002790ede7ec64e03b146138f7d85bc11be7d287d3652b" *)
Parameter struct_b_b_e_e : set -> prop.
Axiom pack_struct_b_b_e_e_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 x4 :e x0)) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> struct_b_b_e_e (pack_b_b_e_e x0 x1 x2 x3 x4))))).
(* Parameter unpack_b_b_e_e_o "eb93435a79c01148fc12dd7779795d68cc2251130dc7633623f16664d25ed072" "1bcc21b2f13824c926a364c5b001d252d630f39a0ebe1f8af790facbe0f63a11" *)
Parameter unpack_b_b_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop) -> prop.
Axiom unpack_b_b_e_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop, forall x1, forall x2 x3 : set -> set -> set, forall x4 x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> set, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> x3 x8 x9 = x7 x8 x9)) -> x0 x1 x6 x7 x4 x5 = x0 x1 x2 x3 x4 x5)) -> unpack_b_b_e_e_o (pack_b_b_e_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition missingname_4e65b1cd81e00c744051543c61c1b2bf0335789136d53ccfe941a1b12fbf7052 : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => and (RealsStruct_leq x1 x2 x3) (x2 = x3 -> (forall x4 : prop, x4))).
(* Parameter struct_b_b_r_e_e "08195fc95542b2be3e25b7fdef814f4e54290bd680ae0917923b0e44786a0214" "d542f60aebdbe4e018abe75d8586699fd6db6951a7fdc2bc884bfb42c0d77a22" *)
Parameter struct_b_b_r_e_e : set -> prop.
(* Parameter unpack_b_b_r_e_e_o "3db063fdbe07c7344b83deebc95b091786045a06e01e2ce6e2eae1d885f574af" "b3a2fc60275daf51e6cbe3161abaeed96cb2fc4e1d5fe26b5e3e58d0eb93c477" *)
Parameter unpack_b_b_r_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop) -> prop.
(* Parameter explicit_Reals "e5dee14fc7a24a63555de85859904de8dc1b462044060d68dbb06cc9a590bc38" "2c81615a11c9e3e301f3301ec7862ba122acea20bfe1c120f7bdaf5a2e18faf4" *)
Parameter explicit_Reals : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Definition RealsStruct : set -> prop :=
 (fun x0 : set => and (struct_b_b_r_e_e x0) (unpack_b_b_r_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 : set -> set -> prop => fun x5 x6 : set => explicit_Reals x1 x5 x6 x2 x3 x4))).
(* Parameter pack_b_b_r_e_e "94ec6541b5d420bf167196743d54143ff9e46d4022e0ccecb059cf098af4663d" "8efb1973b4a9b292951aa9ca2922b7aa15d8db021bfada9c0f07fc9bb09b65fb" *)
Parameter pack_b_b_r_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set.
Axiom struct_b_b_r_e_e_eta : (forall x0, struct_b_b_r_e_e x0 -> x0 = pack_b_b_r_e_e (ap x0 0) (decode_b (ap x0 1)) (decode_b (ap x0 2)) (decode_r (ap x0 3)) (ap x0 4) (ap x0 5)).
Theorem RealsStruct_eta : (forall x0, RealsStruct x0 -> x0 = pack_b_b_r_e_e (field0 x0) (field1b x0) (field2b x0) (RealsStruct_leq x0) (field4 x0) (RealsStruct_one x0)).
admit.
Qed.
Axiom RealsStruct_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, forall x6 : prop -> prop -> prop, x6 (unpack_b_b_r_e_e_o (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) (fun x7 : set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> prop => fun x11 x12 : set => explicit_Reals x7 x11 x12 x8 x9 x10)) (explicit_Reals x0 x4 x5 x1 x2 x3) -> x6 (explicit_Reals x0 x4 x5 x1 x2 x3) (unpack_b_b_r_e_e_o (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) (fun x7 : set => fun x8 x9 : set -> set -> set => fun x10 : set -> set -> prop => fun x11 x12 : set => explicit_Reals x7 x11 x12 x8 x9 x10))).
Theorem RealsStruct_explicit_Reals : (forall x0, RealsStruct x0 -> explicit_Reals (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0) (RealsStruct_leq x0)).
admit.
Qed.
Axiom pack_struct_b_b_r_e_e_E4 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) -> x4 :e x0).
Theorem RealsStruct_zero_In : (forall x0, RealsStruct x0 -> field4 x0 :e field0 x0).
admit.
Qed.
Axiom pack_struct_b_b_r_e_e_E5 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) -> x5 :e x0).
Theorem RealsStruct_one_In : (forall x0, RealsStruct x0 -> RealsStruct_one x0 :e field0 x0).
admit.
Qed.
Axiom pack_struct_b_b_r_e_e_E1 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x1 x6 x7 :e x0))).
Theorem RealsStruct_plus_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field1b x0 x1 x2 :e field0 x0))).
admit.
Qed.
Axiom pack_struct_b_b_r_e_e_E2 : (forall x0, forall x1 x2 : set -> set -> set, forall x3 : set -> set -> prop, forall x4 x5, struct_b_b_r_e_e (pack_b_b_r_e_e x0 x1 x2 x3 x4 x5) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 :e x0))).
Theorem RealsStruct_mult_clos : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 x1 x2 :e field0 x0))).
admit.
Qed.
(* Parameter explicit_OrderedField "1195f96dcd143e4b896b4c1eb080d1fb877084debc58a8626d3dcf7a14ce8df7" "a18f7bca989a67fb7dc6df8e6c094372c26fa2c334578447d3314616155afb72" *)
Parameter explicit_OrderedField : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Definition lt : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set -> set -> prop => fun x6 x7 : set => and (x5 x6 x7) (x6 = x7 -> (forall x8 : prop, x8))).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter natOfOrderedField_p "f97b150093ec13f84694e2b8f48becf45e4b6df2b43c1085ae7a99663116b9a6" "f1c45e0e9f9df75c62335865582f186c3ec3df1a94bc94b16d41e73bf27899f9" *)
Parameter natOfOrderedField_p : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop.
(* Parameter setexp "fcd77a77362d494f90954f299ee3eb7d4273ae93d2d776186c885fc95baa40dc" "1de7fcfb8d27df15536f5567084f73d70d2b8526ee5d05012e7c9722ec76a8a6" *)
Parameter setexp : set -> set -> set.
Axiom explicit_Reals_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_Reals x0 x1 x2 x3 x4 x5 -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> lt x0 x1 x2 x3 x4 x5 x1 x7 -> x5 x1 x8 -> (forall x9 : prop, (forall x10, and (x10 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) (x5 x8 (x4 x10 x7)) -> x9) -> x9))) -> (forall x7, x7 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x8, x8 :e setexp x0 (Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5)) -> (forall x9, x9 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (and (x5 (ap x7 x9) (ap x8 x9)) (x5 (ap x7 x9) (ap x7 (x3 x9 x2)))) (x5 (ap x8 (x3 x9 x2)) (ap x8 x9))) -> (forall x9 : prop, (forall x10, and (x10 :e x0) (forall x11, x11 :e Sep x0 (natOfOrderedField_p x0 x1 x2 x3 x4 x5) -> and (x5 (ap x7 x11) x10) (x5 x10 (ap x8 x11))) -> x9) -> x9))) -> x6) -> explicit_Reals x0 x1 x2 x3 x4 x5 -> x6).
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
(* Parameter or "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" "9577468199161470abc0815b6a25e03706a4e61d5e628c203bf1f793606b1153" *)
Parameter or : prop -> prop -> prop.
Axiom explicit_OrderedField_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 : prop, (explicit_OrderedField x0 x1 x2 x3 x4 x5 -> explicit_Field x0 x1 x2 x3 x4 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 x8 x9 -> x5 x7 x9))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> iff (and (x5 x7 x8) (x5 x8 x7)) (x7 = x8))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> or (x5 x7 x8) (x5 x8 x7))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x5 x7 x8 -> x5 (x3 x7 x9) (x3 x8 x9)))) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x5 x1 x7 -> x5 x1 x8 -> x5 x1 (x4 x7 x8))) -> x6) -> explicit_OrderedField x0 x1 x2 x3 x4 x5 -> x6).
Axiom explicit_Field_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (x6 = x1 -> (forall x7 : prop, x7)) -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x4 x6 x8 = x2) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_Field x0 x1 x2 x3 x4 -> x5).
Theorem RealsStruct_plus_assoc : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field1b x0 x1 (field1b x0 x2 x3) = field1b x0 (field1b x0 x1 x2) x3)))).
admit.
Qed.
Theorem RealsStruct_plus_com : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field1b x0 x1 x2 = field1b x0 x2 x1))).
admit.
Qed.
Theorem RealsStruct_zero_L : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> field1b x0 (field4 x0) x1 = x1)).
admit.
Qed.
Theorem missingprop_50e82d6352cbe376c7ad2fd06f77481429036f25db2b4694ff75b7165705dfb8 : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2 : prop, (forall x3, and (x3 :e field0 x0) (field1b x0 x1 x3 = field4 x0) -> x2) -> x2))).
admit.
Qed.
Theorem RealsStruct_mult_assoc : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field2b x0 x1 (field2b x0 x2 x3) = field2b x0 (field2b x0 x1 x2) x3)))).
admit.
Qed.
Theorem RealsStruct_mult_com : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> field2b x0 x1 x2 = field2b x0 x2 x1))).
admit.
Qed.
Theorem RealsStruct_one_neq_zero : (forall x0, RealsStruct x0 -> RealsStruct_one x0 = field4 x0 -> (forall x1 : prop, x1)).
admit.
Qed.
Theorem RealsStruct_one_L : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> field2b x0 (RealsStruct_one x0) x1 = x1)).
admit.
Qed.
Theorem missingprop_e52b4ddcc5daea74ef2bea6d036c77d656e617d85f36b515c5e9223f38d97c0f : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (x1 = field4 x0 -> (forall x2 : prop, x2)) -> (forall x2 : prop, (forall x3, and (x3 :e field0 x0) (field2b x0 x1 x3 = RealsStruct_one x0) -> x2) -> x2))).
admit.
Qed.
Theorem RealsStruct_distr_L : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> field2b x0 x1 (field1b x0 x2 x3) = field1b x0 (field2b x0 x1 x2) (field2b x0 x1 x3))))).
admit.
Qed.
Axiom explicit_OrderedField_leq_refl : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> x5 x6 x6)).
Theorem RealsStruct_leq_refl : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> RealsStruct_leq x0 x1 x1)).
admit.
Qed.
Axiom explicit_OrderedField_leq_antisym : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, explicit_OrderedField x0 x1 x2 x3 x4 x5 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x5 x6 x7 -> x5 x7 x6 -> x6 = x7))).
Theorem RealsStruct_leq_antisym : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_leq x0 x2 x1 -> x1 = x2))).
admit.
Qed.
Theorem RealsStruct_leq_tra : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_leq x0 x2 x3 -> RealsStruct_leq x0 x1 x3)))).
admit.
Qed.
Theorem RealsStruct_leq_plus : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> (forall x3, x3 :e field0 x0 -> RealsStruct_leq x0 x1 x2 -> RealsStruct_leq x0 (field1b x0 x1 x3) (field1b x0 x2 x3))))).
admit.
Qed.
Theorem missingprop_320d9052144818cbd71e54dc520f6ecc7bd33ec1e95a42e464e3e22d27747b47 : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> RealsStruct_leq x0 (field4 x0) x1 -> RealsStruct_leq x0 (field4 x0) x2 -> RealsStruct_leq x0 (field4 x0) (field2b x0 x1 x2)))).
admit.
Qed.
Definition RealsStruct_N : set -> set :=
 (fun x0 : set => Sep (field0 x0) (natOfOrderedField_p (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0) (RealsStruct_leq x0))).
Theorem missingprop_072beffbbe7109eb17a3427729be213d6978a652934d0b94a0f799a3c944321f : (forall x0, RealsStruct x0 -> (forall x1, x1 :e field0 x0 -> (forall x2, x2 :e field0 x0 -> missingname_4e65b1cd81e00c744051543c61c1b2bf0335789136d53ccfe941a1b12fbf7052 x0 x0 (field4 x0) x1 -> RealsStruct_leq x0 (field4 x0) x2 -> (forall x3 : prop, (forall x4, and (x4 :e RealsStruct_N x0) (RealsStruct_leq x0 x2 (field2b x0 x4 x1)) -> x3) -> x3)))).
admit.
Qed.
Theorem RealsStruct_Compl : (forall x0, RealsStruct x0 -> (forall x1, x1 :e setexp (field0 x0) (RealsStruct_N x0) -> (forall x2, x2 :e setexp (field0 x0) (RealsStruct_N x0) -> (forall x3, x3 :e RealsStruct_N x0 -> and (and (RealsStruct_leq x0 (ap x1 x3) (ap x2 x3)) (RealsStruct_leq x0 (ap x1 x3) (ap x1 (field1b x0 x3 (RealsStruct_one x0))))) (RealsStruct_leq x0 (ap x2 (field1b x0 x3 (RealsStruct_one x0))) (ap x2 x3))) -> (forall x3 : prop, (forall x4, and (x4 :e field0 x0) (forall x5, x5 :e RealsStruct_N x0 -> and (RealsStruct_leq x0 (ap x1 x5) x4) (RealsStruct_leq x0 x4 (ap x2 x5))) -> x3) -> x3)))).
admit.
Qed.
Theorem explicit_Field_of_RealsStruct : (forall x0, RealsStruct x0 -> explicit_Field (field0 x0) (field4 x0) (RealsStruct_one x0) (field1b x0) (field2b x0)).
admit.
Qed.
Definition Field : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_Field x1 x4 x5 x2 x3))).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom prop_ext : (forall x0 x1 : prop, iff x0 x1 -> x0 = x1).
Axiom iff_sym : (forall x0 x1 : prop, iff x0 x1 -> iff x1 x0).
Axiom explicit_Field_repindep : (forall x0 x1 x2, forall x3 x4 x5 x6 : set -> set -> set, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x7 x8 = x5 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x7 x8 = x6 x7 x8)) -> iff (explicit_Field x0 x1 x2 x3 x4) (explicit_Field x0 x1 x2 x5 x6)).
Theorem Field_Field_of_RealsStruct : (forall x0, RealsStruct x0 -> Field (Field_of_RealsStruct x0)).
admit.
Qed.
