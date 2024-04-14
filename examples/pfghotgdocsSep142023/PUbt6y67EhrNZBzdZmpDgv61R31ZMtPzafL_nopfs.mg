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
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Axiom nat_4 : nat_p 4.
Theorem missingprop_1a5f68658a63af1e1c6ac8bc14ee07b2340e3238db83235da1cba8f1b5ae16b4 : SNo 4.
admit.
Qed.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom In_0_4 : 0 :e 4.
Theorem missingprop_731b6baedc0c73229bce7c79ce646b258ff1b212c65a07c4862ccad826c6122f : SNoLt 0 4.
admit.
Qed.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Theorem mul_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (mul_SNo x0 x1) (mul_SNo x2 x3) = mul_SNo (mul_SNo x0 x2) (mul_SNo x1 x3)).
admit.
Qed.
(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom missingprop_75c44463c0c3e8a03f96d820153f23020fb0d8ed5c834601a9c2ef702a6be5c8 : (forall x0 : set -> prop, forall x1 x2 : set -> set -> set, (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x1 x3 x4)) -> (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x2 x3 x4)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x1 x3 (x1 x4 x5) = x1 x4 (x1 x3 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x1 (x1 x3 x4) x5 = x1 x3 (x1 x4 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 x3 (x1 x4 x5) = x1 (x2 x3 x4) (x2 x3 x5)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 (x1 x3 x4) x5 = x1 (x2 x3 x5) (x2 x4 x5)) -> (forall x3 : set -> set, (forall x4, x0 x4 -> x3 x4 = x2 x4 x4) -> (forall x4 : set -> set, (forall x5, x0 x5 -> x0 (x4 x5)) -> (forall x5, x0 x5 -> x4 (x4 x5) = x5) -> (forall x5 x6, x0 x5 -> x0 x6 -> x1 (x4 x5) (x1 x5 x6) = x6) -> (forall x5 x6, x0 x5 -> x0 x6 -> x1 x5 (x1 (x4 x5) x6) = x6) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 (x4 x5) x6 = x4 (x2 x5 x6)) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 x5 (x4 x6) = x4 (x2 x5 x6)) -> (forall x5 x6, x0 x5 -> x0 x6 -> x2 x5 x6 = x2 x6 x5) -> (forall x5 x6 x7 x8, x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x2 (x2 x5 x6) (x2 x7 x8) = x2 (x2 x5 x7) (x2 x6 x8)) -> (forall x5 x6 x7 x8 x9 x10 x11 x12, x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x2 (x1 (x3 x5) (x1 (x3 x6) (x1 (x3 x7) (x3 x8)))) (x1 (x3 x9) (x1 (x3 x10) (x1 (x3 x11) (x3 x12)))) = x1 (x3 (x1 (x2 x5 x10) (x1 (x2 x6 x9) (x1 (x2 x7 x12) (x4 (x2 x8 x11)))))) (x1 (x3 (x1 (x2 x5 x11) (x1 (x4 (x2 x6 x12)) (x1 (x2 x7 x9) (x2 x8 x10))))) (x1 (x3 (x1 (x2 x5 x12) (x1 (x2 x6 x11) (x1 (x4 (x2 x7 x10)) (x2 x8 x9))))) (x3 (x1 (x2 x5 x9) (x1 (x4 (x2 x6 x10)) (x1 (x4 (x2 x7 x11)) (x4 (x2 x8 x12)))))))))))).
Axiom int_add_SNo : (forall x0, x0 :e int -> (forall x1, x1 :e int -> add_SNo x0 x1 :e int)).
Axiom int_mul_SNo : (forall x0, x0 :e int -> (forall x1, x1 :e int -> mul_SNo x0 x1 :e int)).
Axiom add_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x1 (add_SNo x0 x2)).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom int_minus_SNo : (forall x0, x0 :e int -> minus_SNo x0 :e int).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom add_SNo_minus_L2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (minus_SNo x0) (add_SNo x0 x1) = x1).
Axiom add_SNo_minus_SNo_prop2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 (add_SNo (minus_SNo x0) x1) = x1).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom int_SNo : (forall x0, x0 :e int -> SNo x0).
Theorem missingprop_5775c0bd05ab1b6ce839cba07fc1935b804617b450c4f6bc59bb6c1bd670fef1 : (forall x0, x0 :e int -> (forall x1, x1 :e int -> (forall x2, x2 :e int -> (forall x3, x3 :e int -> (forall x4, x4 :e int -> (forall x5, x5 :e int -> x0 = add_SNo (mul_SNo x2 x2) (add_SNo (mul_SNo x3 x3) (add_SNo (mul_SNo x4 x4) (mul_SNo x5 x5))) -> (forall x6, x6 :e int -> (forall x7, x7 :e int -> (forall x8, x8 :e int -> (forall x9, x9 :e int -> x1 = add_SNo (mul_SNo x6 x6) (add_SNo (mul_SNo x7 x7) (add_SNo (mul_SNo x8 x8) (mul_SNo x9 x9))) -> mul_SNo x0 x1 = add_SNo (mul_SNo (add_SNo (mul_SNo x2 x7) (add_SNo (mul_SNo x3 x6) (add_SNo (mul_SNo x4 x9) (minus_SNo (mul_SNo x5 x8))))) (add_SNo (mul_SNo x2 x7) (add_SNo (mul_SNo x3 x6) (add_SNo (mul_SNo x4 x9) (minus_SNo (mul_SNo x5 x8)))))) (add_SNo (mul_SNo (add_SNo (mul_SNo x2 x8) (add_SNo (minus_SNo (mul_SNo x3 x9)) (add_SNo (mul_SNo x4 x6) (mul_SNo x5 x7)))) (add_SNo (mul_SNo x2 x8) (add_SNo (minus_SNo (mul_SNo x3 x9)) (add_SNo (mul_SNo x4 x6) (mul_SNo x5 x7))))) (add_SNo (mul_SNo (add_SNo (mul_SNo x2 x9) (add_SNo (mul_SNo x3 x8) (add_SNo (minus_SNo (mul_SNo x4 x7)) (mul_SNo x5 x6)))) (add_SNo (mul_SNo x2 x9) (add_SNo (mul_SNo x3 x8) (add_SNo (minus_SNo (mul_SNo x4 x7)) (mul_SNo x5 x6))))) (mul_SNo (add_SNo (mul_SNo x2 x6) (add_SNo (minus_SNo (mul_SNo x3 x7)) (add_SNo (minus_SNo (mul_SNo x4 x8)) (minus_SNo (mul_SNo x5 x9))))) (add_SNo (mul_SNo x2 x6) (add_SNo (minus_SNo (mul_SNo x3 x7)) (add_SNo (minus_SNo (mul_SNo x4 x8)) (minus_SNo (mul_SNo x5 x9)))))))))))))))))).
admit.
Qed.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom missingprop_74ac8a784913fa4a6f9da3de96c05984e11ff1600ef66d703e49d6ee22ad106d : mul_nat 2 2 = 4.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_2 : nat_p 2.
Theorem missingprop_44c5ad117e7e64261599b655dea9987852fea6a0c917a86782f3919004220c6a : mul_SNo 2 2 = 4.
admit.
Qed.
