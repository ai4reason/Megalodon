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
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Definition equiv_nat_mod : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (and (x0 :e omega) (x1 :e omega)) (x2 :e setminus omega 1)) (or (forall x3 : prop, (forall x4, and (x4 :e omega) (add_nat x0 (mul_nat x4 x2) = x1) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e omega) (add_nat x1 (mul_nat x4 x2) = x0) -> x3) -> x3))).
(* Parameter int_alt1 "8062568df0fbf4a27ab540f671ff8299e7069e28c0a2a74bd26c0cb9b3ed98fb" "4daffb669546d65312481b5f945330815f8f5c460c7278516e497b08a82751e5" *)
Parameter int_alt1 : set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition divides_int_alt1 : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e int_alt1) (x1 :e int_alt1)) (forall x2 : prop, (forall x3, and (x3 :e int_alt1) (mul_SNo x0 x3 = x1) -> x2) -> x2)).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition missingname_204ad52cabbe4675636421d1481695b86daeb768902254898efb0a6889a98848 : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (and (x0 :e int_alt1) (x1 :e int_alt1)) (x2 :e setminus omega 1)) (divides_int_alt1 x2 (add_SNo x0 (minus_SNo x1)))).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom missingprop_c213ff287d87049b1e6a47a232f87c366800922741a9eeadb1d3ac2fbadaf052 : omega c= int_alt1.
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom missingprop_02609f82bf442d61fb8c6410818e7e4cbf8c67c9ea08bffcbf8a77c06b0f784a : (forall x0, x0 :e int_alt1 -> (forall x1, x1 :e int_alt1 -> add_SNo x0 x1 :e int_alt1)).
Axiom missingprop_66d7a7b7f8768657be1ea35e52473cc5e1846e635153a280e3783a8275062773 : (forall x0, x0 :e int_alt1 -> minus_SNo x0 :e int_alt1).
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
Axiom mul_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_SNo x0 x1 :e omega)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom missingprop_a66fb27a7b2af57722c6537d3983b55a12cc28475f1d8b8d9bdb1d857010e7af : (forall x0, x0 :e omega -> minus_SNo x0 :e int_alt1).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom add_SNo_cancel_R : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 x1 = add_SNo x2 x1 -> x0 = x2).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_minus_R2' : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 (minus_SNo x1)) x1 = x0).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom add_SNo_minus_R2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 x1) (minus_SNo x1) = x0).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem missingprop_eece9fc9f8951bafe7eba5bb6341e1188cb205013a3adce797dad11d7ada6819 : (forall x0 x1 x2, equiv_nat_mod x0 x1 x2 -> missingname_204ad52cabbe4675636421d1481695b86daeb768902254898efb0a6889a98848 x0 x1 x2).
admit.
Qed.
Axiom missingprop_2504c05a08587fe0873ed45685efc417625f0a904281d653d757d643896f9a70 : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int_alt1 -> x0 x1)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom add_SNo_minus_SNo_prop2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 (add_SNo (minus_SNo x0) x1) = x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom missingprop_21e78e4ab287a999eff678dc5fdcb4fe6daaa47d39850e6dedc392cb88159c27 : (forall x0, x0 :e int_alt1 -> SNo x0).
Theorem missingprop_892a26c143dc0432504327d6d6da5ac81e1fb4bafae7fdc0057a993b98c4e585 : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> (forall x2, missingname_204ad52cabbe4675636421d1481695b86daeb768902254898efb0a6889a98848 x0 x1 x2 -> equiv_nat_mod x0 x1 x2))).
admit.
Qed.
