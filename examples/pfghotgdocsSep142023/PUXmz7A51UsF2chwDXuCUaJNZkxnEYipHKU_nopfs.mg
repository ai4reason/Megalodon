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
(* Parameter explicit_Ring_with_id "119dceedb8bcb74f57da40dcfdf9ac97c6bea3532eab7e292bcfdd84f2505ae9" "51b1b6cf343b691168d1f26c39212233b95f9ae7efa3be71d53540eaa3c849ab" *)
Parameter explicit_Ring_with_id : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom explicit_Ring_with_id_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> x4 x5 x2 = x5) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 (x3 x5 x6) x7 = x3 (x4 x5 x7) (x4 x6 x7)))) -> explicit_Ring_with_id x0 x1 x2 x3 x4).
Axiom explicit_Ring_with_id_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Ring_with_id x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> x4 x6 x2 = x6) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 (x3 x6 x7) x8 = x3 (x4 x6 x8) (x4 x7 x8)))) -> x5) -> explicit_Ring_with_id x0 x1 x2 x3 x4 -> x5).
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition explicit_Ring_with_id_exp_nat : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 : set => nat_primrec x2 (fun x6 : set => x4 x5)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition explicit_Ring_with_id_eval_poly : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set -> set :=
 (fun x0 x1 x2 : set => fun x3 x4 : set -> set -> set => fun x5 x6 x7 : set => nat_primrec x1 (fun x8 : set => x3 (x4 (ap x6 x8) (explicit_Ring_with_id_exp_nat x0 x1 x2 x3 x4 x7 x8))) x5).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_1ccf72cb26d952106892251b065bc8c108371f086b6c672e63e4076a1aa4194c : (forall x0 x1 x2, forall x3 x4 x5 x6 : set -> set -> set, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x7 x8 = x5 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x7 x8 = x6 x7 x8)) -> explicit_Ring_with_id x0 x1 x2 x3 x4 -> explicit_Ring_with_id x0 x1 x2 x5 x6).
admit.
Qed.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem explicit_Ring_with_id_repindep : (forall x0 x1 x2, forall x3 x4 x5 x6 : set -> set -> set, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x7 x8 = x5 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x7 x8 = x6 x7 x8)) -> iff (explicit_Ring_with_id x0 x1 x2 x3 x4) (explicit_Ring_with_id x0 x1 x2 x5 x6)).
admit.
Qed.
(* Parameter explicit_CRing_with_id "e617a2c69bd7575dc6ebd47c67ca7c8b08c0c22a914504a403e3db24ee172987" "83e7eeb351d92427c0d3bb2bd24e83d0879191c3aa01e7be24fb68ffdbb9060c" *)
Parameter explicit_CRing_with_id : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Axiom explicit_CRing_with_id_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5)) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> explicit_CRing_with_id x0 x1 x2 x3 x4).
Axiom explicit_CRing_with_id_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_CRing_with_id x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_CRing_with_id x0 x1 x2 x3 x4 -> x5).
Theorem missingprop_95eba65b6ca3a838c9962a22099b60c4334e8ede675df6b0553060ef4db8871d : (forall x0 x1 x2, forall x3 x4 x5 x6 : set -> set -> set, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x7 x8 = x5 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x7 x8 = x6 x7 x8)) -> explicit_CRing_with_id x0 x1 x2 x3 x4 -> explicit_CRing_with_id x0 x1 x2 x5 x6).
admit.
Qed.
Theorem explicit_CRing_with_id_repindep : (forall x0 x1 x2, forall x3 x4 x5 x6 : set -> set -> set, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x7 x8 = x5 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x7 x8 = x6 x7 x8)) -> iff (explicit_CRing_with_id x0 x1 x2 x3 x4) (explicit_CRing_with_id x0 x1 x2 x5 x6)).
admit.
Qed.
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Axiom explicit_Field_E : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : prop, (explicit_Field x0 x1 x2 x3 x4 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x6 (x3 x7 x8) = x3 (x3 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x6 x7 = x3 x7 x6)) -> x1 :e x0 -> (forall x6, x6 :e x0 -> x3 x1 x6 = x6) -> (forall x6, x6 :e x0 -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x3 x6 x8 = x1) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 :e x0)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x4 x7 x8) = x4 (x4 x6 x7) x8))) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x6 x7 = x4 x7 x6)) -> x2 :e x0 -> (x2 = x1 -> (forall x6 : prop, x6)) -> (forall x6, x6 :e x0 -> x4 x2 x6 = x6) -> (forall x6, x6 :e x0 -> (x6 = x1 -> (forall x7 : prop, x7)) -> (forall x7 : prop, (forall x8, and (x8 :e x0) (x4 x6 x8 = x2) -> x7) -> x7)) -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x6 (x3 x7 x8) = x3 (x4 x6 x7) (x4 x6 x8)))) -> x5) -> explicit_Field x0 x1 x2 x3 x4 -> x5).
Axiom explicit_Field_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5)) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> (x5 = x1 -> (forall x6 : prop, x6)) -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x4 x5 x7 = x2) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> explicit_Field x0 x1 x2 x3 x4).
Theorem missingprop_020ff441acf63956db89023138d2e3bf192b2578e8bfb819c9422a66b469b129 : (forall x0 x1 x2, forall x3 x4 x5 x6 : set -> set -> set, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x7 x8 = x5 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x7 x8 = x6 x7 x8)) -> explicit_Field x0 x1 x2 x3 x4 -> explicit_Field x0 x1 x2 x5 x6).
admit.
Qed.
Theorem explicit_Field_repindep : (forall x0 x1 x2, forall x3 x4 x5 x6 : set -> set -> set, (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x3 x7 x8 = x5 x7 x8)) -> (forall x7, x7 :e x0 -> (forall x8, x8 :e x0 -> x4 x7 x8 = x6 x7 x8)) -> iff (explicit_Field x0 x1 x2 x3 x4) (explicit_Field x0 x1 x2 x5 x6)).
admit.
Qed.
Theorem missingprop_edda276b762747645f609cbf968535ac9a9bad70fb2d34d6e5e3760af3e3c28b : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_Field x0 x1 x2 x3 x4 -> explicit_CRing_with_id x0 x1 x2 x3 x4).
admit.
Qed.
(* Parameter pack_b_b_e_e "0ca5ba562d2ab04221b86aded545ed077bf3a2f06e21344f04ba0b43521b231e" "6859fb13a44929ca6d7c0e598ffc6a6f82969c8cfe5edda33f1c1d81187b9d31" *)
Parameter pack_b_b_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
Definition struct_b_b_e_e : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4 : set -> set -> set, (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x4 x5 x6 :e x2)) -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x1 (pack_b_b_e_e x2 x3 x4 x5 x6))))) -> x1 x0).
(* Parameter unpack_b_b_e_e_o "eb93435a79c01148fc12dd7779795d68cc2251130dc7633623f16664d25ed072" "1bcc21b2f13824c926a364c5b001d252d630f39a0ebe1f8af790facbe0f63a11" *)
Parameter unpack_b_b_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop) -> prop.
Axiom unpack_b_b_e_e_o_eq : (forall x0 : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop, forall x1, forall x2 x3 : set -> set -> set, forall x4 x5, (forall x6 : set -> set -> set, (forall x7, x7 :e x1 -> (forall x8, x8 :e x1 -> x2 x7 x8 = x6 x7 x8)) -> (forall x7 : set -> set -> set, (forall x8, x8 :e x1 -> (forall x9, x9 :e x1 -> x3 x8 x9 = x7 x8 x9)) -> x0 x1 x6 x7 x4 x5 = x0 x1 x2 x3 x4 x5)) -> unpack_b_b_e_e_o (pack_b_b_e_e x1 x2 x3 x4 x5) x0 = x0 x1 x2 x3 x4 x5).
Definition Ring_with_id : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_Ring_with_id x1 x4 x5 x2 x3))).
Axiom prop_ext : (forall x0 x1 : prop, iff x0 x1 -> x0 = x1).
Theorem Ring_with_id_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : prop -> prop -> prop, x5 (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Ring_with_id x6 x9 x10 x7 x8)) (explicit_Ring_with_id x0 x3 x4 x1 x2) -> x5 (explicit_Ring_with_id x0 x3 x4 x1 x2) (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Ring_with_id x6 x9 x10 x7 x8))).
admit.
Qed.
Definition CRing_with_id : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_CRing_with_id x1 x4 x5 x2 x3))).
Theorem CRing_with_id_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : prop -> prop -> prop, x5 (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_CRing_with_id x6 x9 x10 x7 x8)) (explicit_CRing_with_id x0 x3 x4 x1 x2) -> x5 (explicit_CRing_with_id x0 x3 x4 x1 x2) (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_CRing_with_id x6 x9 x10 x7 x8))).
admit.
Qed.
Definition Field : set -> prop :=
 (fun x0 : set => and (struct_b_b_e_e x0) (unpack_b_b_e_e_o x0 (fun x1 : set => fun x2 x3 : set -> set -> set => fun x4 x5 : set => explicit_Field x1 x4 x5 x2 x3))).
Theorem Field_unpack_eq : (forall x0, forall x1 x2 : set -> set -> set, forall x3 x4, forall x5 : prop -> prop -> prop, x5 (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Field x6 x9 x10 x7 x8)) (explicit_Field x0 x3 x4 x1 x2) -> x5 (explicit_Field x0 x3 x4 x1 x2) (unpack_b_b_e_e_o (pack_b_b_e_e x0 x1 x2 x3 x4) (fun x6 : set => fun x7 x8 : set -> set -> set => fun x9 x10 : set => explicit_Field x6 x9 x10 x7 x8))).
admit.
Qed.
Axiom explicit_CRing_with_id_Ring_with_id : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, explicit_CRing_with_id x0 x1 x2 x3 x4 -> explicit_Ring_with_id x0 x1 x2 x3 x4).
Theorem CRing_with_id_is_Ring_with_id : (forall x0, CRing_with_id x0 -> Ring_with_id x0).
admit.
Qed.
Theorem Field_is_CRing_with_id : (forall x0, Field x0 -> CRing_with_id x0).
admit.
Qed.
