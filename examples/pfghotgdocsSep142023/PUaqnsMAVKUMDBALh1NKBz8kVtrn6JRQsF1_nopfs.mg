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
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter diadic_rational_alt1_p "c43c5ae4e26913b92bd4aa542143ea63b9acdbd1a8a3c545e682da38491db765" "867cefaf5174f81d00155c1e4d6b4f11276a74cce9dfe9b6f967df42422d03d0" *)
Parameter diadic_rational_alt1_p : set -> prop.
Axiom nat_complete_ind : (forall x0 : set -> prop, (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, nat_p x1 -> x0 x1)).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Definition SNo_max_of : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x1 :e x0) (SNo x1)) (forall x2, x2 :e x0 -> SNo x2 -> SNoLe x2 x1)).
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom SNoS_omega_SNoL_max_exists : (forall x0, x0 :e SNoS_ omega -> or (SNoL x0 = Empty) (forall x1 : prop, (forall x2, SNo_max_of (SNoL x0) x2 -> x1) -> x1)).
Axiom FalseE : False -> (forall x0 : prop, x0).
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom missingprop_d33fbee07711d7545aba95f6876666823fa644df0f9371ac612678f31540623d : (forall x0, diadic_rational_alt1_p x0 -> diadic_rational_alt1_p (minus_SNo x0)).
Axiom minus_SNo_Lev : (forall x0, SNo x0 -> SNoLev (minus_SNo x0) = SNoLev x0).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNo_max_ordinal : (forall x0, SNo x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLt x1 x0) -> ordinal x0).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom missingprop_eba9b808555db9dd1e0c65eda5d79dd7ac00bbe278f0043ab0bf50e822261544 : (forall x0, x0 :e omega -> diadic_rational_alt1_p x0).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Definition SNo_min_of : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x1 :e x0) (SNo x1)) (forall x2, x2 :e x0 -> SNo x2 -> SNoLe x1 x2)).
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom SNoS_omega_SNoR_min_exists : (forall x0, x0 :e SNoS_ omega -> or (SNoR x0 = Empty) (forall x1 : prop, (forall x2, SNo_min_of (SNoR x0) x2 -> x1) -> x1)).
Axiom SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom double_SNo_min_1 : (forall x0 x1, SNo x0 -> SNo_min_of (SNoR x0) x1 -> (forall x2, SNo x2 -> SNoLt x2 x0 -> SNoLt (add_SNo x0 x0) (add_SNo x1 x2) -> (forall x3 : prop, (forall x4, and (x4 :e SNoL x2) (add_SNo x1 x4 = add_SNo x0 x0) -> x3) -> x3))).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom double_eps_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 x0 = add_SNo x1 x2 -> x0 = mul_SNo (eps_ 1) (add_SNo x1 x2)).
Axiom missingprop_2aab862768903d1c5aee7f2f0ed0632273e38b62a9c448fbe58583ccfcf9092d : (forall x0 x1, diadic_rational_alt1_p x0 -> diadic_rational_alt1_p x1 -> diadic_rational_alt1_p (mul_SNo x0 x1)).
Axiom missingprop_cb05958c94e1687877c1685935051da151870b4f96fbc017184579c69ec7543b : (forall x0, x0 :e omega -> diadic_rational_alt1_p (eps_ x0)).
Axiom nat_1 : nat_p 1.
Axiom missingprop_11e00364345298c31f83b1d30bf6ab84a7ec37e814955f67a0e233c0e4939719 : (forall x0 x1, diadic_rational_alt1_p x0 -> diadic_rational_alt1_p x1 -> diadic_rational_alt1_p (add_SNo x0 x1)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom double_SNo_max_1 : (forall x0 x1, SNo x0 -> SNo_max_of (SNoL x0) x1 -> (forall x2, SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x1 x2) (add_SNo x0 x0) -> (forall x3 : prop, (forall x4, and (x4 :e SNoR x2) (add_SNo x1 x4 = add_SNo x0 x0) -> x3) -> x3))).
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom omega_ordinal : ordinal omega.
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Theorem missingprop_5853f9030e28e2c8f7702bddbd72c93e5a0953d04a88c5be1019d4a5dbcda1f9 : (forall x0, nat_p x0 -> (forall x1, SNo x1 -> SNoLev x1 = x0 -> diadic_rational_alt1_p x1)).
admit.
Qed.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem missingprop_ffb5b84d40e47086b40f6e4db6ec10ef78d20da64c3abaac23ff2569830b3d1c : (forall x0, x0 :e SNoS_ omega -> diadic_rational_alt1_p x0).
admit.
Qed.
Axiom missingprop_2a206e952ad25cce114176c1bd00b9616616e077a487ae57de9a81a2597e9fbb : (forall x0, diadic_rational_alt1_p x0 -> x0 :e SNoS_ omega).
Theorem mul_SNo_SNoS_omega : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e SNoS_ omega -> mul_SNo x0 x1 :e SNoS_ omega)).
admit.
Qed.
Axiom SNo_foil : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (mul_SNo x0 x2) (add_SNo (mul_SNo x0 x3) (add_SNo (mul_SNo x1 x2) (mul_SNo x1 x3)))).
Axiom mul_SNo_minus_minus : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) (minus_SNo x1) = mul_SNo x0 x1).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Theorem SNo_foil_mm : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo (add_SNo x0 (minus_SNo x1)) (add_SNo x2 (minus_SNo x3)) = add_SNo (mul_SNo x0 x2) (add_SNo (minus_SNo (mul_SNo x0 x3)) (add_SNo (minus_SNo (mul_SNo x1 x2)) (mul_SNo x1 x3)))).
admit.
Qed.
Axiom SNo_add_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (add_SNo x0 (add_SNo x1 x2))).
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Theorem add_SNo_3a_2b : (forall x0 x1 x2 x3 x4, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> add_SNo (add_SNo x0 (add_SNo x1 x2)) (add_SNo x3 x4) = add_SNo (add_SNo x4 (add_SNo x1 x2)) (add_SNo x3 x0)).
admit.
Qed.
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Parameter abs_SNo : set -> set.
Axiom real_E : (forall x0, x0 :e real -> (forall x1 : prop, (SNo x0 -> SNoLev x0 :e ordsucc omega -> x0 :e SNoS_ (ordsucc omega) -> SNoLt (minus_SNo omega) x0 -> SNoLt x0 omega -> (forall x2, x2 :e SNoS_ omega -> (forall x3, x3 :e omega -> SNoLt (abs_SNo (add_SNo x2 (minus_SNo x0))) (eps_ x3)) -> x2 = x0) -> (forall x2, x2 :e omega -> (forall x3 : prop, (forall x4, and (x4 :e SNoS_ omega) (and (SNoLt x4 x0) (SNoLt x0 (add_SNo x4 (eps_ x2)))) -> x3) -> x3)) -> x1) -> x1)).
(* Parameter SNoCutP "b102ccc5bf572aba76b2c5ff3851795ba59cb16151277dbee9ce5a1aad694334" "c083d829a4633f1bc9aeab80859255a8d126d7c6824bf5fd520d6daabfbbe976" *)
Parameter SNoCutP : set -> set -> prop.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
Axiom mul_SNo_eq_3 : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (forall x3 x4, SNoCutP x3 x4 -> (forall x5, x5 :e x3 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x3)) -> (forall x5, x5 :e x4 -> (forall x6 : prop, (forall x7, x7 :e SNoL x0 -> (forall x8, x8 :e SNoR x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> (forall x7, x7 :e SNoR x0 -> (forall x8, x8 :e SNoL x1 -> x5 = add_SNo (mul_SNo x7 x1) (add_SNo (mul_SNo x0 x8) (minus_SNo (mul_SNo x7 x8))) -> x6)) -> x6)) -> (forall x5, x5 :e SNoL x0 -> (forall x6, x6 :e SNoR x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> (forall x5, x5 :e SNoR x0 -> (forall x6, x6 :e SNoL x1 -> add_SNo (mul_SNo x5 x1) (add_SNo (mul_SNo x0 x6) (minus_SNo (mul_SNo x5 x6))) :e x4)) -> mul_SNo x0 x1 = SNoCut x3 x4 -> x2) -> x2)).
Axiom SNoS_ordsucc_omega_bdd_eps_pos : (forall x0, x0 :e SNoS_ (ordsucc omega) -> SNoLt 0 x0 -> SNoLt x0 omega -> (forall x1 : prop, (forall x2, and (x2 :e omega) (SNoLt (mul_SNo (eps_ x2) x0) 1) -> x1) -> x1)).
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Axiom SNo_1 : SNo 1.
Axiom pos_mul_SNo_Lt' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x2 -> SNoLt x0 x1 -> SNoLt (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom SNo_eps_decr : (forall x0, x0 :e omega -> (forall x1, x1 :e x0 -> SNoLt (eps_ x0) (eps_ x1))).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom SNo_prereal_incr_lower_approx : (forall x0, SNo x0 -> (forall x1, x1 :e SNoS_ omega -> (forall x2, x2 :e omega -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) (eps_ x2)) -> x1 = x0) -> (forall x1, x1 :e omega -> (forall x2 : prop, (forall x3, and (x3 :e SNoS_ omega) (and (SNoLt x3 x0) (SNoLt x0 (add_SNo x3 (eps_ x1)))) -> x2) -> x2)) -> (forall x1 : prop, (forall x2, and (x2 :e setexp (SNoS_ omega) omega) (forall x3, x3 :e omega -> and (and (SNoLt (ap x2 x3) x0) (SNoLt x0 (add_SNo (ap x2 x3) (eps_ x3)))) (forall x4, x4 :e x3 -> SNoLt (ap x2 x4) (ap x2 x3))) -> x1) -> x1)).
Axiom SNo_prereal_decr_upper_approx : (forall x0, SNo x0 -> (forall x1, x1 :e SNoS_ omega -> (forall x2, x2 :e omega -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) (eps_ x2)) -> x1 = x0) -> (forall x1, x1 :e omega -> (forall x2 : prop, (forall x3, and (x3 :e SNoS_ omega) (and (SNoLt x3 x0) (SNoLt x0 (add_SNo x3 (eps_ x1)))) -> x2) -> x2)) -> (forall x1 : prop, (forall x2, and (x2 :e setexp (SNoS_ omega) omega) (forall x3, x3 :e omega -> and (and (SNoLt (add_SNo (ap x2 x3) (minus_SNo (eps_ x3))) x0) (SNoLt x0 (ap x2 x3))) (forall x4, x4 :e x3 -> SNoLt (ap x2 x3) (ap x2 x4))) -> x1) -> x1)).
Axiom SNo_approx_real_lem : (forall x0, x0 :e setexp (SNoS_ omega) omega -> (forall x1, x1 :e setexp (SNoS_ omega) omega -> (forall x2, x2 :e omega -> (forall x3, x3 :e omega -> SNoLt (ap x0 x2) (ap x1 x3))) -> (forall x2 : prop, (SNoCutP (Repl omega (ap x0)) (Repl omega (ap x1)) -> SNo (SNoCut (Repl omega (ap x0)) (Repl omega (ap x1))) -> SNoLev (SNoCut (Repl omega (ap x0)) (Repl omega (ap x1))) :e ordsucc omega -> SNoCut (Repl omega (ap x0)) (Repl omega (ap x1)) :e SNoS_ (ordsucc omega) -> (forall x3, x3 :e omega -> SNoLt (ap x0 x3) (SNoCut (Repl omega (ap x0)) (Repl omega (ap x1)))) -> (forall x3, x3 :e omega -> SNoLt (SNoCut (Repl omega (ap x0)) (Repl omega (ap x1))) (ap x1 x3)) -> x2) -> x2))).
Axiom SNo_approx_real : (forall x0, SNo x0 -> (forall x1, x1 :e setexp (SNoS_ omega) omega -> (forall x2, x2 :e setexp (SNoS_ omega) omega -> (forall x3, x3 :e omega -> SNoLt (ap x1 x3) x0) -> (forall x3, x3 :e omega -> SNoLt x0 (add_SNo (ap x1 x3) (eps_ x3))) -> (forall x3, x3 :e omega -> (forall x4, x4 :e x3 -> SNoLt (ap x1 x4) (ap x1 x3))) -> (forall x3, x3 :e omega -> SNoLt x0 (ap x2 x3)) -> (forall x3, x3 :e omega -> (forall x4, x4 :e x3 -> SNoLt (ap x2 x3) (ap x2 x4))) -> x0 = SNoCut (Repl omega (ap x1)) (Repl omega (ap x2)) -> x0 :e real))).
Axiom SNoCut_ext : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x1 -> SNoLt (SNoCut x2 x3) x4) -> (forall x4, x4 :e x2 -> SNoLt x4 (SNoCut x0 x1)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoCut x0 x1 = SNoCut x2 x3).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Lt1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom add_SNo_minus_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x2 (add_SNo x0 (minus_SNo x1)) -> SNoLe (add_SNo x2 x1) x0).
Axiom add_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x1 (add_SNo x0 x2)).
Axiom minus_add_SNo_distr_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> minus_SNo (add_SNo x0 (add_SNo x1 x2)) = add_SNo (minus_SNo x0) (add_SNo (minus_SNo x1) (minus_SNo x2))).
Axiom mul_SNo_eps_eps_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_SNo (eps_ x0) (eps_ x1) = eps_ (add_SNo x0 x1))).
Axiom nonneg_mul_SNo_Le2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (mul_SNo x0 x1) (mul_SNo x2 x3)).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom SNo_eps_pos : (forall x0, x0 :e omega -> SNoLt 0 (eps_ x0)).
Axiom add_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_SNo x0 x1 :e omega)).
Axiom add_SNo_rotate_3_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x2 (add_SNo x0 x1)).
Axiom add_SNo_assoc_4 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo x0 (add_SNo x1 (add_SNo x2 x3)) = add_SNo (add_SNo x0 (add_SNo x1 x2)) x3).
Axiom add_SNo_minus_Le2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (add_SNo x2 x1) x0 -> SNoLe x2 (add_SNo x0 (minus_SNo x1))).
Axiom add_SNo_rotate_4_1 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo x0 (add_SNo x1 (add_SNo x2 x3)) = add_SNo x3 (add_SNo x0 (add_SNo x1 x2))).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom SNo_prereal_incr_lower_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> (forall x1, x1 :e SNoS_ omega -> (forall x2, x2 :e omega -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) (eps_ x2)) -> x1 = x0) -> (forall x1, x1 :e omega -> (forall x2 : prop, (forall x3, and (x3 :e SNoS_ omega) (and (SNoLt x3 x0) (SNoLt x0 (add_SNo x3 (eps_ x1)))) -> x2) -> x2)) -> (forall x1, x1 :e omega -> (forall x2 : prop, (forall x3, x3 :e SNoS_ omega -> SNoLt 0 x3 -> SNoLt x3 x0 -> SNoLt x0 (add_SNo x3 (eps_ x1)) -> x2) -> x2))).
Axiom pos_mul_SNo_Lt2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt x0 x2 -> SNoLt x1 x3 -> SNoLt (mul_SNo x0 x1) (mul_SNo x2 x3)).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom eps_ordsucc_half_add : (forall x0, nat_p x0 -> add_SNo (eps_ (ordsucc x0)) (eps_ (ordsucc x0)) = eps_ x0).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom add_SNo_1_ordsucc : (forall x0, x0 :e omega -> add_SNo x0 1 = ordsucc x0).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom add_SNo_Lt4 : (forall x0 x1 x2 x3 x4 x5, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNoLt x0 x3 -> SNoLt x1 x4 -> SNoLt x2 x5 -> SNoLt (add_SNo x0 (add_SNo x1 x2)) (add_SNo x3 (add_SNo x4 x5))).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom mul_SNo_Lt1_pos_Lt : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 1 -> SNoLt 0 x1 -> SNoLt (mul_SNo x0 x1) x1).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Axiom mul_SNo_Le1_nonneg_Le : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 1 -> SNoLe 0 x1 -> SNoLe (mul_SNo x0 x1) x1).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom eps_bd_1 : (forall x0, x0 :e omega -> SNoLe (eps_ x0) 1).
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (mul_SNo x0 x1)).
Axiom ordinal_SNoLt_In : (forall x0 x1, ordinal x0 -> ordinal x1 -> SNoLt x0 x1 -> x0 :e x1).
Axiom SNo_2 : SNo 2.
Axiom SNoLt_1_2 : SNoLt 1 2.
Axiom nat_2 : nat_p 2.
Axiom mul_SNo_SNoL_interpolate_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoL (mul_SNo x0 x1) -> (forall x3 : prop, (forall x4, x4 :e SNoL x0 -> (forall x5, x5 :e SNoL x1 -> SNoLe (add_SNo x2 (mul_SNo x4 x5)) (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) -> x3)) -> (forall x4, x4 :e SNoR x0 -> (forall x5, x5 :e SNoR x1 -> SNoLe (add_SNo x2 (mul_SNo x4 x5)) (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) -> x3)) -> x3))).
Axiom SNo_abs_SNo : (forall x0, SNo x0 -> SNo (abs_SNo x0)).
Axiom abs_SNo_dist_swap : (forall x0 x1, SNo x0 -> SNo x1 -> abs_SNo (add_SNo x0 (minus_SNo x1)) = abs_SNo (add_SNo x1 (minus_SNo x0))).
Axiom pos_abs_SNo : (forall x0, SNoLt 0 x0 -> abs_SNo x0 = x0).
Axiom SNoLt_minus_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt 0 (add_SNo x1 (minus_SNo x0))).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom add_SNo_minus_SNo_prop5 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 (add_SNo x1 (minus_SNo x2))) (add_SNo x2 x3) = add_SNo x0 (add_SNo x1 x3)).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Axiom mul_SNo_SNoR_interpolate_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e SNoR (mul_SNo x0 x1) -> (forall x3 : prop, (forall x4, x4 :e SNoL x0 -> (forall x5, x5 :e SNoR x1 -> SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) (add_SNo x2 (mul_SNo x4 x5)) -> x3)) -> (forall x4, x4 :e SNoR x0 -> (forall x5, x5 :e SNoL x1 -> SNoLe (add_SNo (mul_SNo x4 x1) (mul_SNo x0 x5)) (add_SNo x2 (mul_SNo x4 x5)) -> x3)) -> x3))).
Axiom SNo_add_SNo_4 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo (add_SNo x0 (add_SNo x1 (add_SNo x2 x3)))).
Axiom add_SNo_minus_SNo_prop2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 (add_SNo (minus_SNo x0) x1) = x1).
Axiom add_SNo_minus_L2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (minus_SNo x0) (add_SNo x0 x1) = x1).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom omega_TransSet : TransSet omega.
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom SNoS_omega_real : SNoS_ omega c= real.
Theorem real_mul_SNo_pos : (forall x0, x0 :e real -> (forall x1, x1 :e real -> SNoLt 0 x0 -> SNoLt 0 x1 -> mul_SNo x0 x1 :e real)).
admit.
Qed.
Axiom SNo_0 : SNo 0.
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom real_0 : 0 :e real.
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Axiom real_SNo : (forall x0, x0 :e real -> SNo x0).
Theorem real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
admit.
Qed.
Axiom nonneg_abs_SNo : (forall x0, SNoLe 0 x0 -> abs_SNo x0 = x0).
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Axiom add_SNo_minus_Lt1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 (add_SNo x2 x1) -> SNoLt (add_SNo x0 (minus_SNo x1)) x2).
Theorem abs_SNo_intvl_bd : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 (add_SNo x0 x2) -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) x2).
admit.
Qed.
Axiom real_SNoS_omega_prop : (forall x0, x0 :e real -> (forall x1, x1 :e SNoS_ omega -> (forall x2, x2 :e omega -> SNoLt (abs_SNo (add_SNo x1 (minus_SNo x0))) (eps_ x2)) -> x1 = x0)).
Theorem missingprop_d3a11b9377b69acbf63bcd2ce851e318ae717c6ab038f37758385378f5a4c86d : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e omega -> SNoLt (abs_SNo x0) (eps_ x1)) -> x0 = 0).
admit.
Qed.
Axiom real_1 : 1 :e real.
Theorem missingprop_44ba01f8fb8c95f16bf51a93ba048aca39a8e27481641e21813108ceacbcd2e3 : (forall x0, x0 :e SNoS_ omega -> (forall x1, x1 :e omega -> SNoLt (abs_SNo (add_SNo x0 (minus_SNo 1))) (eps_ x1)) -> x0 = 1).
admit.
Qed.
