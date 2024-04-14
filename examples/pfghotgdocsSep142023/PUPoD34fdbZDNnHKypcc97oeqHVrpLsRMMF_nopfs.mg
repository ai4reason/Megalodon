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
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_2dcf4dd8557a0ffd2a187961d1bc330ef1aae42c546555814bac26eb5e3c6d68 : (forall x0 x1, nat_p x1 -> x0 c= add_nat x0 x1).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Theorem missingprop_bdf0eb0ad914e7080c1a90c10a5be5aadacffe01a001ae1e9b4568b2273272d9 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> or (x1 = 0) (x0 c= mul_nat x0 x1))).
admit.
Qed.
Theorem nat_inv_impred : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
admit.
Qed.
Theorem missingprop_b35032c81ea06ad673f8a0490d5be4e7b984453ec9378fed4adde429c2b88d75 : (forall x0 : set -> prop, x0 0 -> x0 1 -> (forall x1, nat_p x1 -> x0 (ordsucc (ordsucc x1))) -> (forall x1, nat_p x1 -> x0 x1)).
admit.
Qed.
Theorem missingprop_39cbd5c51ff5562ca51af25a1bd9cbc7231628adb31b4c53be0872935d25e1ee : (forall x0 : set -> prop, x0 0 -> x0 1 -> x0 2 -> (forall x1, nat_p x1 -> x0 (ordsucc (ordsucc (ordsucc x1)))) -> (forall x1, nat_p x1 -> x0 x1)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Theorem missingprop_6983d26e930e4f29d8bfcdef860e7bdda90fb8cfa66e4db9cfa2a0c77f2e095e : (forall x0 x1, nat_p x1 -> add_nat x0 x1 = 0 -> and (x0 = 0) (x1 = 0)).
admit.
Qed.
Axiom ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
Theorem missingprop_986be96dc315caaba0467a55e70dc4d242dfd7d790ce55390e38a5d935288972 : (forall x0 x1, nat_p x1 -> add_nat x0 x1 = x1 -> x0 = 0).
admit.
Qed.
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom add_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = add_nat x1 x0)).
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Theorem missingprop_db897f3f49b8c848a3d81fbc7ed013179113267e2c53f0b5582e9ca05f6f06d5 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x1 x0 = x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> x0 = 1)).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition divides_nat : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e omega) (x1 :e omega)) (forall x2 : prop, (forall x3, and (x3 :e omega) (mul_nat x0 x3 = x1) -> x2) -> x2)).
Definition prime_nat : set -> prop :=
 (fun x0 : set => and (and (x0 :e omega) (1 :e x0)) (forall x1, x1 :e omega -> divides_nat x1 x0 -> or (x1 = 1) (x1 = x0))).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom mul_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x1 = mul_nat x1 x0)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom mul_nat_1R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 1) x0 -> x1 x0 (mul_nat x0 1)).
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom ordinal_1 : ordinal 1.
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom ordinal_Empty : ordinal 0.
Axiom Empty_Subq_eq : (forall x0, x0 c= 0 -> x0 = 0).
Axiom mul_nat_0L : (forall x0, nat_p x0 -> mul_nat 0 x0 = 0).
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem missingprop_2428c914273d0207a37c4532808f379c98dcfb4e4088d088b168151661152d6e : (forall x0, x0 :e omega -> not (prime_nat x0) -> 1 :e x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> 1 :e x2 -> 1 :e x3 -> x0 = mul_nat x2 x3 -> x1)) -> x1)).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom ordinal_SNoLt_In : (forall x0 x1, ordinal x0 -> ordinal x1 -> SNoLt x0 x1 -> x0 :e x1).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom add_SNo_minus_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x2 (add_SNo x0 (minus_SNo x1)) -> SNoLt (add_SNo x2 x1) x0).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom SNo_0 : SNo 0.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom SNo_1 : SNo 1.
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (mul_SNo x0 x1)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_minus_Lt2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt (add_SNo x2 x1) x0 -> SNoLt x2 (add_SNo x0 (minus_SNo x1))).
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Axiom ordinal_SNo : (forall x0, ordinal x0 -> SNo x0).
Theorem missingprop_64298609228a1928dde1d66da0f04038e1112049f8f6469ec832eccc379525c0 : (forall x0 x1, nat_p x0 -> nat_p x1 -> 0 :e x0 -> 1 :e x1 -> x0 :e mul_nat x0 x1).
admit.
Qed.
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom In_0_1 : 0 :e 1.
Theorem missingprop_f1142f13a9ac29644d784904358701a959d97f804098a6594b35a5b62b109639 : (forall x0 x1, nat_p x0 -> nat_p x1 -> 1 :e x0 -> 1 :e x1 -> and (x0 :e mul_nat x0 x1) (x1 :e mul_nat x0 x1)).
admit.
Qed.
Axiom missingprop_b48d4480a5526e51a91293fec1b0b9440be4280265441ce358bda14cced12479 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 (x1 x2 (x1 x3 (x1 x4 x5))))).
Axiom missingprop_75c44463c0c3e8a03f96d820153f23020fb0d8ed5c834601a9c2ef702a6be5c8 : (forall x0 : set -> prop, forall x1 x2 : set -> set -> set, (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x1 x3 x4)) -> (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x2 x3 x4)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x1 x3 (x1 x4 x5) = x1 x4 (x1 x3 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x1 (x1 x3 x4) x5 = x1 x3 (x1 x4 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 x3 (x1 x4 x5) = x1 (x2 x3 x4) (x2 x3 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 (x1 x3 x4) x5 = x1 (x2 x3 x5) (x2 x4 x5)) -> (forall x3 : set -> set, (forall x4, x0 x4 -> x3 x4 = x2 x4 x4) -> (forall x4 : set -> set, (forall x5, x0 x5 -> x0 (x4 x5)) -> (forall x5, x0 x5 -> x4 (x4 x5) = x5) -> (forall x5 x6, x0 x5 -> x0 x6 -> x1 (x4 x5) (x1 x5 x6) = x6) -> (forall x5 x6, x0 x5 -> x0 x6 -> x1 x5 (x1 (x4 x5) x6) = x6) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 (x4 x5) x6 = x4 (x2 x5 x6)) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 x5 (x4 x6) = x4 (x2 x5 x6)) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 x5 x6 = x2 x6 x5) -> (forall x5 x6 x7 x8, x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x2 (x2 x5 x6) (x2 x7 x8) = x2 (x2 x5 x7) (x2 x6 x8)) -> (forall x5 x6 x7 x8 x9 x10 x11 x12, x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x2 (x1 (x3 x5) (x1 (x3 x6) (x1 (x3 x7) (x3 x8)))) (x1 (x3 x9) (x1 (x3 x10) (x1 (x3 x11) (x3 x12)))) = x1 (x3 (x1 (x2 x5 x10) (x1 (x2 x6 x9) (x1 (x2 x7 x12) (x4 (x2 x8 x11)))))) (x1 (x3 (x1 (x2 x5 x11) (x1 (x4 (x2 x6 x12)) (x1 (x2 x7 x9) (x2 x8 x10))))) (x1 (x3 (x1 (x2 x5 x12) (x1 (x2 x6 x11) (x1 (x4 (x2 x7 x10)) (x2 x8 x9))))) (x3 (x1 (x2 x5 x9) (x1 (x4 (x2 x6 x10)) (x1 (x4 (x2 x7 x11)) (x4 (x2 x8 x12)))))))))))).
Theorem missingprop_891bd8eaccd4934854a1a39a96fa375f8b43c939234e5ead477578dfa15afa04 : (forall x0 : set -> prop, forall x1 x2 : set -> set -> set, (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x1 x3 x4)) -> (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x2 x3 x4)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x1 x3 (x1 x4 x5) = x1 x4 (x1 x3 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x1 (x1 x3 x4) x5 = x1 x3 (x1 x4 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 x3 (x1 x4 x5) = x1 (x2 x3 x4) (x2 x3 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 (x1 x3 x4) x5 = x1 (x2 x3 x5) (x2 x4 x5)) -> (forall x3 : set -> set, (forall x4, x0 x4 -> x3 x4 = x2 x4 x4) -> (forall x4 : set -> set, (forall x5, x0 x5 -> x0 (x4 x5)) -> (forall x5, x0 x5 -> x4 (x4 x5) = x5) -> (forall x5 x6, x0 x5 -> x0 x6 -> x1 (x4 x5) (x1 x5 x6) = x6) -> (forall x5 x6, x0 x5 -> x0 x6 -> x1 x5 (x1 (x4 x5) x6) = x6) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 (x4 x5) x6 = x4 (x2 x5 x6)) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 x5 (x4 x6) = x4 (x2 x5 x6)) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 x5 x6 = x2 x6 x5) -> (forall x5 x6 x7 x8, x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x2 (x2 x5 x6) (x2 x7 x8) = x2 (x2 x5 x7) (x2 x6 x8)) -> (forall x5 x6, x0 x5 -> x0 x6 -> (forall x7 x8 x9 x10, x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x5 = x1 (x3 x7) (x1 (x3 x8) (x1 (x3 x9) (x3 x10))) -> (forall x11 x12 x13 x14, x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x6 = x1 (x3 x11) (x1 (x3 x12) (x1 (x3 x13) (x3 x14))) -> (forall x15 : prop, (forall x16 x17 x18 x19, x0 x16 -> x0 x17 -> x0 x18 -> x0 x19 -> x2 x5 x6 = x1 (x3 x16) (x1 (x3 x17) (x1 (x3 x18) (x3 x19))) -> x15) -> x15))))))).
admit.
Qed.
Theorem missingprop_f712399f1133da8194de032e3ed497d1ec5c40bb41a197c5c3ec1ab28bc2ae11 : (forall x0 : set -> prop, forall x1 x2 : set -> set -> set, (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x1 x3 x4)) -> (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x2 x3 x4)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x1 x3 (x1 x4 x5) = x1 x4 (x1 x3 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x1 (x1 x3 x4) x5 = x1 x3 (x1 x4 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 x3 (x1 x4 x5) = x1 (x2 x3 x4) (x2 x3 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 (x1 x3 x4) x5 = x1 (x2 x3 x5) (x2 x4 x5)) -> (forall x3 : set -> set, (forall x4, x0 x4 -> x3 x4 = x2 x4 x4) -> (forall x4 : set -> set, (forall x5, x0 x5 -> x0 (x4 x5)) -> (forall x5, x0 x5 -> x4 (x4 x5) = x5) -> (forall x5 x6, x0 x5 -> x0 x6 -> x1 (x4 x5) (x1 x5 x6) = x6) -> (forall x5 x6, x0 x5 -> x0 x6 -> x1 x5 (x1 (x4 x5) x6) = x6) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 (x4 x5) x6 = x4 (x2 x5 x6)) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 x5 (x4 x6) = x4 (x2 x5 x6)) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 x5 x6 = x2 x6 x5) -> (forall x5 x6 x7 x8, x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x2 (x2 x5 x6) (x2 x7 x8) = x2 (x2 x5 x7) (x2 x6 x8)) -> (forall x5 : set -> prop, (forall x6, x0 x6 -> (forall x7 : prop, (forall x8, and (x5 x8) (x3 x8 = x3 x6) -> x7) -> x7)) -> (forall x6 x7, x0 x6 -> x0 x7 -> (forall x8 x9 x10 x11, x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x6 = x1 (x3 x8) (x1 (x3 x9) (x1 (x3 x10) (x3 x11))) -> (forall x12 x13 x14 x15, x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x7 = x1 (x3 x12) (x1 (x3 x13) (x1 (x3 x14) (x3 x15))) -> (forall x16 : prop, (forall x17 x18 x19 x20, x5 x17 -> x5 x18 -> x5 x19 -> x5 x20 -> x2 x6 x7 = x1 (x3 x17) (x1 (x3 x18) (x1 (x3 x19) (x3 x20))) -> x16) -> x16)))))))).
admit.
Qed.
Axiom add_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x1 (add_SNo x0 x2)).
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom add_SNo_minus_L2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (minus_SNo x0) (add_SNo x0 x1) = x1).
Axiom add_SNo_minus_SNo_prop2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 (add_SNo (minus_SNo x0) x1) = x1).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Theorem missingprop_8e3f728ed9bfbd1c73952edf4ed92809cfb677462e0a9f6a2b9d202f987ad8d5 : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 x3 x4 x5, SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> x0 = add_SNo (mul_SNo x2 x2) (add_SNo (mul_SNo x3 x3) (add_SNo (mul_SNo x4 x4) (mul_SNo x5 x5))) -> (forall x6 x7 x8 x9, SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> x1 = add_SNo (mul_SNo x6 x6) (add_SNo (mul_SNo x7 x7) (add_SNo (mul_SNo x8 x8) (mul_SNo x9 x9))) -> (forall x10 : prop, (forall x11 x12 x13 x14, SNo x11 -> SNo x12 -> SNo x13 -> SNo x14 -> mul_SNo x0 x1 = add_SNo (mul_SNo x11 x11) (add_SNo (mul_SNo x12 x12) (add_SNo (mul_SNo x13 x13) (mul_SNo x14 x14))) -> x10) -> x10)))).
admit.
Qed.
(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.
Axiom int_add_SNo : (forall x0, x0 :e int -> (forall x1, x1 :e int -> add_SNo x0 x1 :e int)).
Axiom int_mul_SNo : (forall x0, x0 :e int -> (forall x1, x1 :e int -> mul_SNo x0 x1 :e int)).
Axiom int_minus_SNo : (forall x0, x0 :e int -> minus_SNo x0 :e int).
Axiom int_SNo : (forall x0, x0 :e int -> SNo x0).
Theorem missingprop_71a1b77ee32101e0cbdbc25c9f7b37e4db4d2ec400cc670020a520be6e40b003 : (forall x0, x0 :e int -> (forall x1, x1 :e int -> (forall x2, x2 :e int -> (forall x3, x3 :e int -> (forall x4, x4 :e int -> (forall x5, x5 :e int -> x0 = add_SNo (mul_SNo x2 x2) (add_SNo (mul_SNo x3 x3) (add_SNo (mul_SNo x4 x4) (mul_SNo x5 x5))) -> (forall x6, x6 :e int -> (forall x7, x7 :e int -> (forall x8, x8 :e int -> (forall x9, x9 :e int -> x1 = add_SNo (mul_SNo x6 x6) (add_SNo (mul_SNo x7 x7) (add_SNo (mul_SNo x8 x8) (mul_SNo x9 x9))) -> (forall x10 : prop, (forall x11, x11 :e int -> (forall x12, x12 :e int -> (forall x13, x13 :e int -> (forall x14, x14 :e int -> mul_SNo x0 x1 = add_SNo (mul_SNo x11 x11) (add_SNo (mul_SNo x12 x12) (add_SNo (mul_SNo x13 x13) (mul_SNo x14 x14))) -> x10)))) -> x10))))))))))).
admit.
Qed.
Axiom int_SNo_cases : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int -> x0 x1)).
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Theorem missingprop_807f062b39dfd0ff9bd948470fe79f04703959147cc96cc3cd6c25186d4bc1a2 : (forall x0, x0 :e int -> (forall x1, x1 :e int -> (forall x2, x2 :e int -> (forall x3, x3 :e int -> (forall x4, x4 :e int -> (forall x5, x5 :e int -> x0 = add_SNo (mul_SNo x2 x2) (add_SNo (mul_SNo x3 x3) (add_SNo (mul_SNo x4 x4) (mul_SNo x5 x5))) -> (forall x6, x6 :e int -> (forall x7, x7 :e int -> (forall x8, x8 :e int -> (forall x9, x9 :e int -> x1 = add_SNo (mul_SNo x6 x6) (add_SNo (mul_SNo x7 x7) (add_SNo (mul_SNo x8 x8) (mul_SNo x9 x9))) -> (forall x10 : prop, (forall x11, x11 :e omega -> (forall x12, x12 :e omega -> (forall x13, x13 :e omega -> (forall x14, x14 :e omega -> mul_SNo x0 x1 = add_SNo (mul_SNo x11 x11) (add_SNo (mul_SNo x12 x12) (add_SNo (mul_SNo x13 x13) (mul_SNo x14 x14))) -> x10)))) -> x10))))))))))).
admit.
Qed.
