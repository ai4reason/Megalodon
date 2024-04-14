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
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom SNoS_omega_real : SNoS_ omega c= real.
Axiom omega_SNoS_omega : omega c= SNoS_ omega.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_0 : nat_p Empty.
Theorem real_0 : Empty :e real.
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_1 : nat_p 1.
Theorem real_1 : 1 :e real.
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter int_alt1 "8062568df0fbf4a27ab540f671ff8299e7069e28c0a2a74bd26c0cb9b3ed98fb" "4daffb669546d65312481b5f945330815f8f5c460c7278516e497b08a82751e5" *)
Parameter int_alt1 : set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Definition diadic_rational_alt1_p : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (forall x3 : prop, (forall x4, and (x4 :e int_alt1) (x0 = mul_SNo (eps_ x2) x4) -> x3) -> x3) -> x1) -> x1).
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom missingprop_2504c05a08587fe0873ed45685efc417625f0a904281d653d757d643896f9a70 : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int_alt1 -> x0 x1)).
Axiom nonneg_diadic_rational_p_SNoS_omega : (forall x0, x0 :e omega -> (forall x1, nat_p x1 -> mul_SNo (eps_ x0) x1 :e SNoS_ omega)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Axiom minus_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> minus_SNo x0 :e SNoS_ omega).
Theorem missingprop_2a206e952ad25cce114176c1bd00b9616616e077a487ae57de9a81a2597e9fbb : (forall x0, diadic_rational_alt1_p x0 -> x0 :e SNoS_ omega).
admit.
Qed.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom omega_ordinal : ordinal omega.
Theorem missingprop_61cf31253d6c3a0936aaca26b87c4079532d8ff15a4a449f5a854fd6b353cf4a : (forall x0, diadic_rational_alt1_p x0 -> SNo x0).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom eps_0_1 : eps_ 0 = 1.
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom missingprop_21e78e4ab287a999eff678dc5fdcb4fe6daaa47d39850e6dedc392cb88159c27 : (forall x0, x0 :e int_alt1 -> SNo x0).
Theorem missingprop_448a658f20854233e5674076a5735fdbf479ccb6b261cbee06c64303a4bade9b : (forall x0, x0 :e int_alt1 -> diadic_rational_alt1_p x0).
admit.
Qed.
Axiom missingprop_c213ff287d87049b1e6a47a232f87c366800922741a9eeadb1d3ac2fbadaf052 : omega c= int_alt1.
Theorem missingprop_eba9b808555db9dd1e0c65eda5d79dd7ac00bbe278f0043ab0bf50e822261544 : (forall x0, x0 :e omega -> diadic_rational_alt1_p x0).
admit.
Qed.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Theorem missingprop_cb05958c94e1687877c1685935051da151870b4f96fbc017184579c69ec7543b : (forall x0, x0 :e omega -> diadic_rational_alt1_p (eps_ x0)).
admit.
Qed.
Axiom missingprop_66d7a7b7f8768657be1ea35e52473cc5e1846e635153a280e3783a8275062773 : (forall x0, x0 :e int_alt1 -> minus_SNo x0 :e int_alt1).
Theorem missingprop_d33fbee07711d7545aba95f6876666823fa644df0f9371ac612678f31540623d : (forall x0, diadic_rational_alt1_p x0 -> diadic_rational_alt1_p (minus_SNo x0)).
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom add_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_SNo x0 x1 :e omega)).
Axiom missingprop_3f000c087708670f2a9497d0587231f65beb85593b7ebdaf7909fe5e7d4b8c27 : (forall x0, x0 :e int_alt1 -> (forall x1, x1 :e int_alt1 -> mul_SNo x0 x1 :e int_alt1)).
Axiom mul_SNo_eps_eps_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_SNo (eps_ x0) (eps_ x1) = eps_ (add_SNo x0 x1))).
Axiom mul_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (mul_SNo x0 x1) (mul_SNo x2 x3) = mul_SNo (mul_SNo x0 x2) (mul_SNo x1 x3)).
Theorem missingprop_2aab862768903d1c5aee7f2f0ed0632273e38b62a9c448fbe58583ccfcf9092d : (forall x0 x1, diadic_rational_alt1_p x0 -> diadic_rational_alt1_p x1 -> diadic_rational_alt1_p (mul_SNo x0 x1)).
admit.
Qed.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Axiom missingprop_02609f82bf442d61fb8c6410818e7e4cbf8c67c9ea08bffcbf8a77c06b0f784a : (forall x0, x0 :e int_alt1 -> (forall x1, x1 :e int_alt1 -> add_SNo x0 x1 :e int_alt1)).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom mul_SNo_eps_power_2 : (forall x0, nat_p x0 -> mul_SNo (eps_ x0) (exp_SNo_nat 2 x0) = 1).
Axiom nat_exp_SNo_nat : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_SNo_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Theorem missingprop_11e00364345298c31f83b1d30bf6ab84a7ec37e814955f67a0e233c0e4939719 : (forall x0 x1, diadic_rational_alt1_p x0 -> diadic_rational_alt1_p x1 -> diadic_rational_alt1_p (add_SNo x0 x1)).
admit.
Qed.
