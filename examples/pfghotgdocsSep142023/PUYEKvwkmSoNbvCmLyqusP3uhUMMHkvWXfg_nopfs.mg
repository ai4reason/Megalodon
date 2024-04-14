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
(* Parameter mul_OSNo "cf5b4f1484c59720c7c79d839f94ea0ff4ed412b09af008c32ad9bc77acbee0d" "a82d6b9863b21f7e10c188eaa1e4213a16f9940d54142740c77a490e8205d8ce" *)
Parameter mul_OSNo : set -> set -> set.
(* Parameter Complex_i "b46d1faaae35e838de0e9479314a37044791cb438ba6f794b98027b5ec829dbe" "ace1d58e185110764e46cbc1f7da7b426c20caebe3e3b0030d5dade0868711a1" *)
Parameter Complex_i : set.
(* Parameter Quaternion_j "a64d4207940622d2fa92ee36af8786777d44dd2deb6c64e5f4937f1670fab892" "c0b7d8cc3a9056dd42a74818f26f3ffb8b1eecdc3e7c22495f4a83ddf9f7750a" *)
Parameter Quaternion_j : set.
(* Parameter Quaternion_k "cb34da6214a7af20ec70c6fe89e80cd91b5d1571857718d998f824e1b003a219" "7dfb3aecbb969f8b37c596fbd2efdde4800da1fb1f5679a954d9c15be9fb365b" *)
Parameter Quaternion_k : set.
(* Parameter OSNo "8265e2106dc17292e7892c7129b9559aecfd6607d4bd00983ccc92c9af5abd9e" "fbe4469ee9b8b98f19e7c00cbb1fc993f1f1cb148a3d20451054cd28d12ed148" *)
Parameter OSNo : set -> prop.
(* Parameter OSNo_proj0 "9d943110b5d45edc81fa2f2dbc9ef7b8cf36fa27540c0033d8d6921f88e6bbe8" "13b4628685fbbdd19b9d217567c6e8f617af1a4a759ecb7bdc46a03df203a2be" *)
Parameter OSNo_proj0 : set -> set.
(* Parameter OSNo_proj1 "40713cd83a094cd02e026df4c5160f206d292d971a5b5101f7c98c6dda468903" "c7764794b766b67372897e499be22be67740bb6fe095aa4e150378da738534c5" *)
Parameter OSNo_proj1 : set -> set.
Axiom OSNo_proj0proj1_split : (forall x0 x1, OSNo x0 -> OSNo x1 -> OSNo_proj0 x0 = OSNo_proj0 x1 -> OSNo_proj1 x0 = OSNo_proj1 x1 -> x0 = x1).
Axiom OSNo_p0_k : OSNo_proj0 Quaternion_k = Quaternion_k.
(* Parameter add_HSNo "4e8cb0a4280b353b777ea4cc81d6bdc9930e4b58fb5189aa5ccded03a3735c1a" "a3bb10046a30688f27e4fde28ec6a448545f6981756edd83fcdbf3504b6ab2f0" *)
Parameter add_HSNo : set -> set -> set.
(* Parameter mul_HSNo "b4f4bbad0e0782b76ff5fe9db6db1f014008c73a4621305aded53211a748cc80" "e7bde6cc611a758824b863427bda5e1566e45d33c8746fad0c691e30e638e117" *)
Parameter mul_HSNo : set -> set -> set.
(* Parameter minus_HSNo "eb0046dd7c7ba12cdd1a72604b3d20091e236d2ec6e67662d3026cad715a70ce" "f5966471e1edc646360d533743925b1ed32ed3ff83cbed6f7bfaa2c6e712d1d8" *)
Parameter minus_HSNo : set -> set.
(* Parameter conj_HSNo "36c3c17f0fcfcfad048e6781218a1109cc436030d8119f99b634aa21ab3c56cb" "87fd0c3e4bc7cd9e9626341cef66c732a7c2cb27a25a62f6cafa5ca676aa65e6" *)
Parameter conj_HSNo : set -> set.
Axiom mul_OSNo_proj0 : (forall x0 x1, OSNo x0 -> OSNo x1 -> OSNo_proj0 (mul_OSNo x0 x1) = add_HSNo (mul_HSNo (OSNo_proj0 x0) (OSNo_proj0 x1)) (minus_HSNo (mul_HSNo (conj_HSNo (OSNo_proj1 x1)) (OSNo_proj1 x0)))).
Axiom OSNo_p0_i : OSNo_proj0 Complex_i = Complex_i.
Axiom OSNo_p1_i : OSNo_proj1 Complex_i = Empty.
Axiom OSNo_p0_j : OSNo_proj0 Quaternion_j = Quaternion_j.
Axiom OSNo_p1_j : OSNo_proj1 Quaternion_j = Empty.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom conj_HSNo_id_SNo : (forall x0, SNo x0 -> conj_HSNo x0 = x0).
Axiom SNo_0 : SNo Empty.
(* Parameter HSNo "1c628f7af39a04e6bfe8d8c0d795c1631fdd70d0438d3e5060c6375b4c1ac72e" "1e7352259c54690fd5b8c99e1d05b70933b3c6ee6dddfc492998c305f0aec7f2" *)
Parameter HSNo : set -> prop.
Axiom mul_HSNo_0R : (forall x0, HSNo x0 -> mul_HSNo x0 Empty = Empty).
Axiom HSNo_0 : HSNo Empty.
Axiom minus_HSNo_0 : minus_HSNo Empty = Empty.
Axiom add_HSNo_0R : (forall x0, HSNo x0 -> add_HSNo x0 Empty = x0).
Axiom HSNo_mul_HSNo : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo (mul_HSNo x0 x1)).
Axiom HSNo_Complex_i : HSNo Complex_i.
Axiom HSNo_Quaternion_j : HSNo Quaternion_j.
Axiom Quaternion_i_j : mul_HSNo Complex_i Quaternion_j = Quaternion_k.
Axiom OSNo_p1_k : OSNo_proj1 Quaternion_k = Empty.
Axiom mul_OSNo_proj1 : (forall x0 x1, OSNo x0 -> OSNo x1 -> OSNo_proj1 (mul_OSNo x0 x1) = add_HSNo (mul_HSNo (OSNo_proj1 x1) (OSNo_proj0 x0)) (mul_HSNo (OSNo_proj1 x0) (conj_HSNo (OSNo_proj0 x1)))).
Axiom mul_HSNo_0L : (forall x0, HSNo x0 -> mul_HSNo Empty x0 = Empty).
Axiom HSNo_conj_HSNo : (forall x0, HSNo x0 -> HSNo (conj_HSNo x0)).
Axiom add_HSNo_0L : (forall x0, HSNo x0 -> add_HSNo Empty x0 = x0).
Axiom OSNo_mul_OSNo : (forall x0 x1, OSNo x0 -> OSNo x1 -> OSNo (mul_OSNo x0 x1)).
Axiom OSNo_Quaternion_k : OSNo Quaternion_k.
Axiom OSNo_Quaternion_j : OSNo Quaternion_j.
Axiom OSNo_Complex_i : OSNo Complex_i.
Theorem Octonion_i1_i2 : mul_OSNo Complex_i Quaternion_j = Quaternion_k.
admit.
Qed.
(* Parameter minus_OSNo "5ea4d12086de26e43c4543cb170a45ed230e688d4462c1c1d99d9cc024d7f40b" "ad664eb249e412938a67931c883e65bb3202fba3898a0a307142fc1013980e11" *)
Parameter minus_OSNo : set -> set.
Axiom OSNo_minus_OSNo : (forall x0, OSNo x0 -> OSNo (minus_OSNo x0)).
Axiom minus_OSNo_proj0 : (forall x0, OSNo x0 -> OSNo_proj0 (minus_OSNo x0) = minus_HSNo (OSNo_proj0 x0)).
Axiom Quaternion_j_i : mul_HSNo Quaternion_j Complex_i = minus_HSNo Quaternion_k.
Axiom minus_OSNo_proj1 : (forall x0, OSNo x0 -> OSNo_proj1 (minus_OSNo x0) = minus_HSNo (OSNo_proj1 x0)).
Theorem Octonion_i2_i1 : mul_OSNo Quaternion_j Complex_i = minus_OSNo Quaternion_k.
admit.
Qed.
Axiom HSNo_Quaternion_k : HSNo Quaternion_k.
Axiom Quaternion_j_k : mul_HSNo Quaternion_j Quaternion_k = Complex_i.
Theorem Octonion_i2_i4 : mul_OSNo Quaternion_j Quaternion_k = Complex_i.
admit.
Qed.
Axiom Quaternion_k_j : mul_HSNo Quaternion_k Quaternion_j = minus_HSNo Complex_i.
Theorem Octonion_i4_i2 : mul_OSNo Quaternion_k Quaternion_j = minus_OSNo Complex_i.
admit.
Qed.
Axiom Quaternion_k_i : mul_HSNo Quaternion_k Complex_i = Quaternion_j.
Theorem Octonion_i4_i1 : mul_OSNo Quaternion_k Complex_i = Quaternion_j.
admit.
Qed.
Axiom Quaternion_i_k : mul_HSNo Complex_i Quaternion_k = minus_HSNo Quaternion_j.
Theorem Octonion_i1_i4 : mul_OSNo Complex_i Quaternion_k = minus_OSNo Quaternion_j.
admit.
Qed.
(* Parameter Octonion_i3 "5b1f8f02b3d2e86845ed7659b9947edb925b1712207df8f718f178855993562b" "ad3e24b08aedb65ea9e024cd1665b445f96c70d2c33ed1ef1afc8612fa661ae8" *)
Parameter Octonion_i3 : set.
(* Parameter Octonion_i5 "1caeb4f393e7b06e06fea0620d577a1559d3644de76014d89dee953fab5c6bbb" "23c2352a4f0fe25ff16bc808f9fe72ec4c77b688550625e86850d333b0a186c0" *)
Parameter Octonion_i5 : set.
Axiom OSNo_p0_i5 : OSNo_proj0 Octonion_i5 = Empty.
Axiom OSNo_p0_i3 : OSNo_proj0 Octonion_i3 = Empty.
Axiom OSNo_p1_i3 : OSNo_proj1 Octonion_i3 = minus_HSNo Complex_i.
Axiom HSNo_minus_HSNo : (forall x0, HSNo x0 -> HSNo (minus_HSNo x0)).
Axiom OSNo_p1_i5 : OSNo_proj1 Octonion_i5 = minus_HSNo Quaternion_k.
Axiom minus_mul_HSNo_distrL : (forall x0 x1, HSNo x0 -> HSNo x1 -> mul_HSNo (minus_HSNo x0) x1 = minus_HSNo (mul_HSNo x0 x1)).
Axiom OSNo_Octonion_i5 : OSNo Octonion_i5.
Axiom OSNo_Octonion_i3 : OSNo Octonion_i3.
Theorem Octonion_i2_i3 : mul_OSNo Quaternion_j Octonion_i3 = Octonion_i5.
admit.
Qed.
Axiom conj_HSNo_j : conj_HSNo Quaternion_j = minus_HSNo Quaternion_j.
Axiom minus_mul_HSNo_distrR : (forall x0 x1, HSNo x0 -> HSNo x1 -> mul_HSNo x0 (minus_HSNo x1) = minus_HSNo (mul_HSNo x0 x1)).
Axiom minus_HSNo_invol : (forall x0, HSNo x0 -> minus_HSNo (minus_HSNo x0) = x0).
Theorem Octonion_i3_i2 : mul_OSNo Octonion_i3 Quaternion_j = minus_OSNo Octonion_i5.
admit.
Qed.
Axiom conj_minus_HSNo : (forall x0, HSNo x0 -> conj_HSNo (minus_HSNo x0) = minus_HSNo (conj_HSNo x0)).
Axiom conj_HSNo_k : conj_HSNo Quaternion_k = minus_HSNo Quaternion_k.
Theorem Octonion_i3_i5 : mul_OSNo Octonion_i3 Octonion_i5 = Quaternion_j.
admit.
Qed.
Axiom conj_HSNo_i : conj_HSNo Complex_i = minus_HSNo Complex_i.
Theorem Octonion_i5_i3 : mul_OSNo Octonion_i5 Octonion_i3 = minus_OSNo Quaternion_j.
admit.
Qed.
Theorem Octonion_i5_i2 : mul_OSNo Octonion_i5 Quaternion_j = Octonion_i3.
admit.
Qed.
Theorem Octonion_i2_i5 : mul_OSNo Quaternion_j Octonion_i5 = minus_OSNo Octonion_i3.
admit.
Qed.
(* Parameter Octonion_i6 "f22feeb41e02cb0fba866706d62b7003ecb532b44661465b49ca4a06788d27b9" "6111ba869483bf8e2449bf7e3f98d8a8298a9d5160b185dc39f86c1dc019502f" *)
Parameter Octonion_i6 : set.
Axiom OSNo_p0_i6 : OSNo_proj0 Octonion_i6 = Empty.
Axiom OSNo_p1_i6 : OSNo_proj1 Octonion_i6 = minus_HSNo Quaternion_j.
Axiom OSNo_Octonion_i6 : OSNo Octonion_i6.
Theorem Octonion_i3_i4 : mul_OSNo Octonion_i3 Quaternion_k = Octonion_i6.
admit.
Qed.
Theorem Octonion_i4_i3 : mul_OSNo Quaternion_k Octonion_i3 = minus_OSNo Octonion_i6.
admit.
Qed.
Theorem Octonion_i4_i6 : mul_OSNo Quaternion_k Octonion_i6 = Octonion_i3.
admit.
Qed.
Theorem Octonion_i6_i4 : mul_OSNo Octonion_i6 Quaternion_k = minus_OSNo Octonion_i3.
admit.
Qed.
Theorem Octonion_i6_i3 : mul_OSNo Octonion_i6 Octonion_i3 = Quaternion_k.
admit.
Qed.
Theorem Octonion_i3_i6 : mul_OSNo Octonion_i3 Octonion_i6 = minus_OSNo Quaternion_k.
admit.
Qed.
(* Parameter Octonion_i0 "f0ac9f4c517cece4aacf36edeb8f6fd9ae652dce1ed08912a0804cee6258a9cc" "53fb1adef676227202df9209ca03a1dc3c96d06783a9daf302d81e1de0f20add" *)
Parameter Octonion_i0 : set.
Axiom OSNo_p0_i0 : OSNo_proj0 Octonion_i0 = Empty.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom OSNo_p1_i0 : OSNo_proj1 Octonion_i0 = 1.
Axiom Quaternion_k_sqr : mul_HSNo Quaternion_k Quaternion_k = minus_HSNo 1.
Axiom HSNo_1 : HSNo 1.
Axiom OSNo_Octonion_i0 : OSNo Octonion_i0.
Theorem Octonion_i4_i5 : mul_OSNo Quaternion_k Octonion_i5 = Octonion_i0.
admit.
Qed.
Theorem Octonion_i5_i4 : mul_OSNo Octonion_i5 Quaternion_k = minus_OSNo Octonion_i0.
admit.
Qed.
Axiom SNo_1 : SNo 1.
Axiom mul_HSNo_1L : (forall x0, HSNo x0 -> mul_HSNo 1 x0 = x0).
Theorem Octonion_i5_i0 : mul_OSNo Octonion_i5 Octonion_i0 = Quaternion_k.
admit.
Qed.
Axiom mul_HSNo_1R : (forall x0, HSNo x0 -> mul_HSNo x0 1 = x0).
Theorem Octonion_i0_i5 : mul_OSNo Octonion_i0 Octonion_i5 = minus_OSNo Quaternion_k.
admit.
Qed.
Theorem Octonion_i0_i4 : mul_OSNo Octonion_i0 Quaternion_k = Octonion_i5.
admit.
Qed.
Theorem Octonion_i4_i0 : mul_OSNo Quaternion_k Octonion_i0 = minus_OSNo Octonion_i5.
admit.
Qed.
Theorem Octonion_i5_i6 : mul_OSNo Octonion_i5 Octonion_i6 = Complex_i.
admit.
Qed.
Theorem Octonion_i6_i5 : mul_OSNo Octonion_i6 Octonion_i5 = minus_OSNo Complex_i.
admit.
Qed.
Theorem Octonion_i6_i1 : mul_OSNo Octonion_i6 Complex_i = Octonion_i5.
admit.
Qed.
Theorem Octonion_i1_i6 : mul_OSNo Complex_i Octonion_i6 = minus_OSNo Octonion_i5.
admit.
Qed.
Theorem Octonion_i1_i5 : mul_OSNo Complex_i Octonion_i5 = Octonion_i6.
admit.
Qed.
Theorem Octonion_i5_i1 : mul_OSNo Octonion_i5 Complex_i = minus_OSNo Octonion_i6.
admit.
Qed.
Theorem Octonion_i6_i0 : mul_OSNo Octonion_i6 Octonion_i0 = Quaternion_j.
admit.
Qed.
Theorem Octonion_i0_i6 : mul_OSNo Octonion_i0 Octonion_i6 = minus_OSNo Quaternion_j.
admit.
Qed.
Theorem Octonion_i0_i2 : mul_OSNo Octonion_i0 Quaternion_j = Octonion_i6.
admit.
Qed.
Theorem Octonion_i2_i0 : mul_OSNo Quaternion_j Octonion_i0 = minus_OSNo Octonion_i6.
admit.
Qed.
Axiom Quaternion_j_sqr : mul_HSNo Quaternion_j Quaternion_j = minus_HSNo 1.
Theorem Octonion_i2_i6 : mul_OSNo Quaternion_j Octonion_i6 = Octonion_i0.
admit.
Qed.
Theorem Octonion_i6_i2 : mul_OSNo Octonion_i6 Quaternion_j = minus_OSNo Octonion_i0.
admit.
Qed.
Theorem Octonion_i0_i1 : mul_OSNo Octonion_i0 Complex_i = Octonion_i3.
admit.
Qed.
Theorem Octonion_i1_i0 : mul_OSNo Complex_i Octonion_i0 = minus_OSNo Octonion_i3.
admit.
Qed.
Axiom Quaternion_i_sqr : mul_HSNo Complex_i Complex_i = minus_HSNo 1.
Theorem Octonion_i1_i3 : mul_OSNo Complex_i Octonion_i3 = Octonion_i0.
admit.
Qed.
Theorem Octonion_i3_i1 : mul_OSNo Octonion_i3 Complex_i = minus_OSNo Octonion_i0.
admit.
Qed.
Theorem Octonion_i3_i0 : mul_OSNo Octonion_i3 Octonion_i0 = Complex_i.
admit.
Qed.
Theorem Octonion_i0_i3 : mul_OSNo Octonion_i0 Octonion_i3 = minus_OSNo Complex_i.
admit.
Qed.
