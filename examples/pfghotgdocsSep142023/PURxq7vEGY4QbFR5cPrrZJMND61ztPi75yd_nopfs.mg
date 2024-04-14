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
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition even_nat : set -> prop :=
 (fun x0 : set => and (x0 :e omega) (forall x1 : prop, (forall x2, and (x2 :e omega) (x0 = mul_nat 2 x2) -> x1) -> x1)).
Definition divides_nat : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e omega) (x1 :e omega)) (forall x2 : prop, (forall x3, and (x3 :e omega) (mul_nat x0 x3 = x1) -> x2) -> x2)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_2 : nat_p 2.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_08fb078d795c0975d950898a1224977eb8db97682ff225342ef66a3071181f64 : (forall x0, even_nat x0 -> divides_nat 2 x0).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition prime_nat : set -> prop :=
 (fun x0 : set => and (and (x0 :e omega) (1 :e x0)) (forall x1, x1 :e omega -> divides_nat x1 x0 -> or (x1 = 1) (x1 = x0))).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
Theorem missingprop_28c5dbd522b8286a3fe2a52cbb801c9824fc28a4e7a6a2892ef7fb0fe1efa57d : (forall x0, prime_nat x0 -> even_nat x0 -> x0 = 2).
admit.
Qed.
(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom missingprop_807f062b39dfd0ff9bd948470fe79f04703959147cc96cc3cd6c25186d4bc1a2 : (forall x0, x0 :e int -> (forall x1, x1 :e int -> (forall x2, x2 :e int -> (forall x3, x3 :e int -> (forall x4, x4 :e int -> (forall x5, x5 :e int -> x0 = add_SNo (mul_SNo x2 x2) (add_SNo (mul_SNo x3 x3) (add_SNo (mul_SNo x4 x4) (mul_SNo x5 x5))) -> (forall x6, x6 :e int -> (forall x7, x7 :e int -> (forall x8, x8 :e int -> (forall x9, x9 :e int -> x1 = add_SNo (mul_SNo x6 x6) (add_SNo (mul_SNo x7 x7) (add_SNo (mul_SNo x8 x8) (mul_SNo x9 x9))) -> (forall x10 : prop, (forall x11, x11 :e omega -> (forall x12, x12 :e omega -> (forall x13, x13 :e omega -> (forall x14, x14 :e omega -> mul_SNo x0 x1 = add_SNo (mul_SNo x11 x11) (add_SNo (mul_SNo x12 x12) (add_SNo (mul_SNo x13 x13) (mul_SNo x14 x14))) -> x10)))) -> x10))))))))))).
(* Parameter odd_nat "01785692f7c1817cb9f3d1d48f63b046656276ec0216ce08c9e0f64a287359ad" "8358baafa9517c0278f00333f8801296b6383390ea4814caaadcff0dec35238d" *)
Parameter odd_nat : set -> prop.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom nat_complete_ind : (forall x0 : set -> prop, (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom missingprop_39cbd5c51ff5562ca51af25a1bd9cbc7231628adb31b4c53be0872935d25e1ee : (forall x0 : set -> prop, x0 0 -> x0 1 -> x0 2 -> (forall x1, nat_p x1 -> x0 (ordsucc (ordsucc (ordsucc x1)))) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom nat_0 : nat_p 0.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom SNo_0 : SNo 0.
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom nat_1 : nat_p 1.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom SNo_1 : SNo 1.
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom SNo_2 : SNo 2.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom even_nat_or_odd_nat : (forall x0, nat_p x0 -> or (even_nat x0) (odd_nat x0)).
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Axiom ordsucc_inj : (forall x0 x1, ordsucc x0 = ordsucc x1 -> x0 = x1).
Axiom missingprop_2428c914273d0207a37c4532808f379c98dcfb4e4088d088b168151661152d6e : (forall x0, x0 :e omega -> not (prime_nat x0) -> 1 :e x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> 1 :e x2 -> 1 :e x3 -> x0 = mul_nat x2 x3 -> x1)) -> x1)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom Subq_omega_int : omega c= int.
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem missingprop_cbf8421cd76ce6976c3a2cea3502d569c7dad0e925b5d1613bef0fa4dce0032e : (forall x0, prime_nat x0 -> odd_nat x0 -> (forall x1 : prop, (forall x2, and (x2 :e omega) (forall x3 : prop, (forall x4, and (x4 :e omega) (forall x5 : prop, (forall x6, and (x6 :e omega) (forall x7 : prop, (forall x8, and (x8 :e omega) (x0 = add_SNo (mul_SNo x2 x2) (add_SNo (mul_SNo x4 x4) (add_SNo (mul_SNo x6 x6) (mul_SNo x8 x8)))) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)) -> (forall x0, x0 :e omega -> (forall x1 : prop, (forall x2, and (x2 :e omega) (forall x3 : prop, (forall x4, and (x4 :e omega) (forall x5 : prop, (forall x6, and (x6 :e omega) (forall x7 : prop, (forall x8, and (x8 :e omega) (x0 = add_SNo (mul_SNo x2 x2) (add_SNo (mul_SNo x4 x4) (add_SNo (mul_SNo x6 x6) (mul_SNo x8 x8)))) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
