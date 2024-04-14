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
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_4 : nat_p 4.
Axiom nat_3 : nat_p 3.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_2 : nat_p 2.
Axiom nat_1 : nat_p 1.
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem add_SNo_4_3 : add_SNo 4 3 = 7.
admit.
Qed.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom add_SNo_ordinal_SR : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> add_SNo x0 (ordsucc x1) = ordsucc (add_SNo x0 x1))).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Theorem add_SNo_4_4 : add_SNo 4 4 = 8.
admit.
Qed.
(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom Subq_omega_int : omega c= int.
Theorem nat_p_int : (forall x0, nat_p x0 -> x0 :e int).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom int_minus_SNo_omega : (forall x0, x0 :e omega -> minus_SNo x0 :e int).
Theorem nat_p_int_minus_SNo : (forall x0, nat_p x0 -> minus_SNo x0 :e int).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter PNoLt "2336eb45d48549dd8a6a128edc17a8761fd9043c180691483bcf16e1acc9f00a" "8f57a05ce4764eff8bc94b278352b6755f1a46566cd7220a5488a4a595a47189" *)
Parameter PNoLt : set -> (set -> prop) -> set -> (set -> prop) -> prop.
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
(* Parameter PNoEq_ "ac96e86902ef72d5c44622f4a1ba3aaf673377d32cc26993c04167cc9f22067f" "d7d95919a06c44c69c724884cd5a474ea8f909ef85aae19ffe4a0ce816fa65fd" *)
Parameter PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop.
Definition PNoLe : set -> (set -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => fun x3 : set -> prop => or (PNoLt x0 x1 x2 x3) (and (x0 = x2) (PNoEq_ x0 x1 x3))).
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Definition SNoLe : set -> set -> prop :=
 (fun x0 x1 : set => PNoLe (SNoLev x0) (fun x2 : set => x2 :e x0) (SNoLev x1) (fun x2 : set => x2 :e x1)).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom minus_SNo_Le_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe (minus_SNo x1) (minus_SNo x0)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Theorem minus_SNo_Le_swap : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 (add_SNo x1 (minus_SNo x2)) -> SNoLe (add_SNo x2 (minus_SNo x1)) (minus_SNo x0)).
admit.
Qed.
Theorem minus_SNo_Le_swap2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (minus_SNo x0) (add_SNo x1 (minus_SNo x2)) -> SNoLe (add_SNo x2 (minus_SNo x1)) x0).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition finite_add_SNo : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => nat_primrec 0 (fun x2 x3 : set => add_SNo x3 (x1 x2)) x0).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem missingprop_4376a6c44e07ee63cfd63de35739aa1967e60551544bcab6d1b8284e5b2ad2ba : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (finite_add_SNo 0 x0) 0 -> x1 0 (finite_add_SNo 0 x0)).
admit.
Qed.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Theorem missingprop_69faeba9a75f2f8d58865148c9f0f7e35d3ac66d15111e3cc3404d6a2eed4dcd : (forall x0 : set -> set, forall x1, nat_p x1 -> finite_add_SNo (ordsucc x1) x0 = add_SNo (finite_add_SNo x1 x0) (x0 x1)).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom SNo_0 : SNo 0.
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_814c004451946f1c9f980b657692a7768a826c8b8434cb9bb69b9f9613c2c671 : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> SNo (x1 x2)) -> SNo (finite_add_SNo x0 x1))).
admit.
Qed.
Theorem missingprop_7697696e78a00321cc65e38568f56acc5260ca6016f1a787131f730f98d56100 : (forall x0, nat_p x0 -> (forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> finite_add_SNo x0 x1 = finite_add_SNo x0 x2)).
admit.
Qed.
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom In_0_1 : 0 :e 1.
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom add_SNo_Le3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x3)).
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Theorem SNo_idl_cycle_nonneg : (forall x0, nat_p x0 -> (forall x1 x2 : set -> set, (forall x3, x3 :e ordsucc x0 -> SNo (x1 x3)) -> (forall x3, x3 :e ordsucc x0 -> SNo (x2 x3)) -> x1 (ordsucc x0) = x1 0 -> (forall x3, x3 :e ordsucc x0 -> SNoLe (add_SNo (x1 (ordsucc x3)) (minus_SNo (x1 x3))) (x2 x3)) -> SNoLe 0 (finite_add_SNo (ordsucc x0) x2))).
admit.
Qed.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_add_SNo_4 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo (add_SNo x0 (add_SNo x1 (add_SNo x2 x3)))).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Axiom cases_4 : (forall x0, x0 :e 4 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 x0)).
Axiom tuple_5_0_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0) x0 -> x5 x0 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 0)).
Axiom tuple_5_1_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1) x1 -> x5 x1 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 1)).
Axiom tuple_5_2_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2) x2 -> x5 x2 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 2)).
Axiom tuple_5_3_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3) x3 -> x5 x3 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 3)).
Axiom tuple_4_0_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0) x0 -> x4 x0 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 0)).
Axiom tuple_4_1_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1) x1 -> x4 x1 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 1)).
Axiom tuple_4_2_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2) x2 -> x4 x2 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 2)).
Axiom tuple_4_3_eq : (forall x0 x1 x2 x3, forall x4 : set -> set -> prop, x4 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3) x3 -> x4 x3 (ap (lam 4 (fun x5 : set => If_i (x5 = 0) x0 (If_i (x5 = 1) x1 (If_i (x5 = 2) x2 x3)))) 3)).
Axiom tuple_5_4_eq : (forall x0 x1 x2 x3 x4, forall x5 : set -> set -> prop, x5 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4) x4 -> x5 x4 (ap (lam 5 (fun x6 : set => If_i (x6 = 0) x0 (If_i (x6 = 1) x1 (If_i (x6 = 2) x2 (If_i (x6 = 3) x3 x4))))) 4)).
Axiom add_SNo_assoc_4 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo x0 (add_SNo x1 (add_SNo x2 x3)) = add_SNo (add_SNo x0 (add_SNo x1 x2)) x3).
Theorem idl_negcycle_4 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNoLt (add_SNo x4 (add_SNo x5 (add_SNo x6 x7))) 0 -> SNoLe (add_SNo x1 (minus_SNo x0)) x4 -> SNoLe (add_SNo x2 (minus_SNo x1)) x5 -> SNoLe (add_SNo x3 (minus_SNo x2)) x6 -> SNoLe (add_SNo x0 (minus_SNo x3)) x7 -> False).
admit.
Qed.
