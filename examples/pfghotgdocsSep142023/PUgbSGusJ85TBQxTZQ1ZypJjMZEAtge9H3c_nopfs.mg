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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Definition divides_nat : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e omega) (x1 :e omega)) (forall x2 : prop, (forall x3, and (x3 :e omega) (mul_nat x0 x3 = x1) -> x2) -> x2)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom nat_1 : nat_p 1.
Axiom mul_nat_1R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 1) x0 -> x1 x0 (mul_nat x0 1)).
Theorem missingprop_98e7544997c6005aa9c4dc938c620a6df3d89601058380b842e41b24814e6d5b : (forall x0, nat_p x0 -> divides_nat x0 x0).
admit.
Qed.
Axiom nat_0 : nat_p 0.
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Theorem missingprop_94b9b73b1207350973a964cfd79fac000c8d717e12b3149994867d613d318c69 : (forall x0, nat_p x0 -> divides_nat x0 0).
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom mul_add_nat_distrL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat x0 (add_nat x1 x2) = add_nat (mul_nat x0 x1) (mul_nat x0 x2)))).
Theorem missingprop_4f580385494c3bb0b65abf1bcb00277688faff94da8eb184b6015c42d53d3c52 : (forall x0, nat_p x0 -> (forall x1 x2, divides_nat x0 x1 -> divides_nat x0 x2 -> divides_nat x0 (add_SNo x1 x2))).
admit.
Qed.
Axiom missingprop_a056e7e1d4164d24a60c8047a73979083395e5609e36aaee67608ba08eded8a1 : add_nat 2 2 = 4.
Axiom nat_2 : nat_p 2.
Theorem missingprop_a0e1670aba181da94860f563c67514747cbc863abd8e41c828885e11fbde7e1e : add_SNo 2 2 = 4.
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom missingprop_647ec341c7696352fb8a30f001c79d84c2767a0fc283d06b71b39a980b6ecefe : (forall x0 : set -> prop, forall x1 x2 : set -> set -> set, (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x1 x3 x4)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 x3 (x1 x4 x5) = x1 (x2 x3 x4) (x2 x3 x5)) -> (forall x3 x4 x5 x6, x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x2 x6 (x1 x3 (x1 x4 x5)) = x1 (x2 x6 x3) (x1 (x2 x6 x4) (x2 x6 x5)))).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem missingprop_6b5b0b4361d1089f859dcedc976d27d9fdf892c86c3422ad6adf77b3c0ae7b95 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> mul_SNo x3 (add_SNo x0 (add_SNo x1 x2)) = add_SNo (mul_SNo x3 x0) (add_SNo (mul_SNo x3 x1) (mul_SNo x3 x2))).
admit.
Qed.
Axiom missingprop_483ab2c4cf352794c6e764ca83196651bc5de6ef598ec843402a4c02baafb47b : (forall x0 : set -> prop, forall x1 x2 : set -> set -> set, (forall x3 x4, x0 x3 -> x0 x4 -> x0 (x1 x3 x4)) -> (forall x3 x4 x5, x0 x3 -> x0 x4 -> x0 x5 -> x2 x3 (x1 x4 x5) = x1 (x2 x3 x4) (x2 x3 x5)) -> (forall x3 x4 x5 x6 x7, x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x2 x7 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 (x2 x7 x3) (x1 (x2 x7 x4) (x1 (x2 x7 x5) (x2 x7 x6))))).
Theorem missingprop_33a40d5b2ad5f13958ca6a2db4ee2466511431d8cb585c14a79c944b2fc13ca9 : (forall x0 x1 x2 x3 x4, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> mul_SNo x4 (add_SNo x0 (add_SNo x1 (add_SNo x2 x3))) = add_SNo (mul_SNo x4 x0) (add_SNo (mul_SNo x4 x1) (add_SNo (mul_SNo x4 x2) (mul_SNo x4 x3)))).
admit.
Qed.
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom SNo_2 : SNo 2.
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom SNo_1 : SNo 1.
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Theorem missingprop_74d7a6bbfadcd79b3e74419cf9141de052e7a92c7dc4e4606d80592dc6bc77d0 : (forall x0, SNo x0 -> mul_SNo 4 x0 = add_SNo x0 (add_SNo x0 (add_SNo x0 x0))).
admit.
Qed.
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom add_SNo_Le3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x3)).
Theorem missingprop_c65c101ade85bfa060331a47af562cb2e92a7682259cab9d1c17312979426654 : (forall x0 x1 x2 x3 x4 x5, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNoLe x0 x3 -> SNoLe x1 x4 -> SNoLe x2 x5 -> SNoLe (add_SNo x0 (add_SNo x1 x2)) (add_SNo x3 (add_SNo x4 x5))).
admit.
Qed.
Axiom SNo_add_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (add_SNo x0 (add_SNo x1 x2))).
Theorem missingprop_4aacf4ce1c94641882f5daabae381b25866c736129720d8f871923488464aacd : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNoLe x0 x4 -> SNoLe x1 x5 -> SNoLe x2 x6 -> SNoLe x3 x7 -> SNoLe (add_SNo x0 (add_SNo x1 (add_SNo x2 x3))) (add_SNo x4 (add_SNo x5 (add_SNo x6 x7)))).
admit.
Qed.
(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Parameter abs_SNo : set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom SNo_0 : SNo 0.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom neg_abs_SNo : (forall x0, SNo x0 -> SNoLt x0 0 -> abs_SNo x0 = minus_SNo x0).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom nonneg_abs_SNo : (forall x0, SNoLe 0 x0 -> abs_SNo x0 = x0).
Theorem missingprop_fa46c80666017f3cf115ee622e847610826adf6666699d2e266df9fab3f25ba0 : (forall x0, SNo x0 -> SNoLe 0 (abs_SNo x0)).
admit.
Qed.
(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.
Definition missingname_c1f22f06c84fd31609197ae4b59de0a4be348f35cc216030f61aa9a4028e67b8 : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e int) (x1 :e int)) (forall x2 : prop, (forall x3, and (x3 :e int) (mul_SNo x0 x3 = x1) -> x2) -> x2)).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem missingprop_1322c2a0d0b1b3146261936516c252a68891873a725155962232d593fb90eac7 : (forall x0, SNo x0 -> mul_SNo (abs_SNo x0) (abs_SNo x0) = mul_SNo x0 x0).
admit.
Qed.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordinal_Subq_SNoLe : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoLe x0 x1).
Axiom ordinal_Empty : ordinal 0.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom Subq_Empty : (forall x0, 0 c= x0).
Theorem missingprop_72fc13f59561a486e7f04b4e6ad6c40ec1d48eeac6e68c47cb50fa618c19e933 : (forall x0, nat_p x0 -> SNoLe 0 x0).
admit.
Qed.
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom SNoLe_antisym : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe x1 x0 -> x0 = x1).
Theorem missingprop_e5541d81250265b08beb9068fcc371cc60cd654309c52d670e002d94ec2bd267 : (forall x0, nat_p x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> SNoLt 0 x0).
admit.
Qed.
Axiom int_SNo_cases : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int -> x0 x1)).
Axiom minus_SNo_Le_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe (minus_SNo x1) (minus_SNo x0)).
Theorem missingprop_17e526dd107b435f5416528d1c977ef8aa1ea06ba09d8b9ed0ca53424a454f1a : (forall x0, x0 :e int -> SNoLe 0 x0 -> nat_p x0).
admit.
Qed.
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom ordinal_ordsucc_SNo_eq : (forall x0, ordinal x0 -> ordsucc x0 = add_SNo 1 x0).
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Axiom ordinal_SNoLev_max_2 : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e ordsucc x0 -> SNoLe x1 x0)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom ordinal_SNoLt_In : (forall x0 x1, ordinal x0 -> ordinal x1 -> SNoLt x0 x1 -> x0 :e x1).
Theorem missingprop_1e19ea400270e16dd9b4d959fcd683273342d2b8620f41b2a847b00512981e9c : (forall x0 x1, nat_p x0 -> nat_p x1 -> SNoLt x0 x1 -> SNoLe (add_SNo x0 1) x1).
admit.
Qed.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom nat_inv_impred : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom add_SNo_minus_R2' : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 (minus_SNo x1)) x1 = x0).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom add_SNo_minus_R2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 x1) (minus_SNo x1) = x0).
Axiom minus_SNo_Lt_contra3 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) (minus_SNo x1) -> SNoLt x1 x0).
Theorem missingprop_75a7a32a1f9f4ab31889bbb3270198b84023d47a661153af39af3ec4c17d6270 : (forall x0, x0 :e int -> (forall x1, x1 :e int -> SNoLt x0 x1 -> SNoLe (add_SNo x0 1) x1)).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom nat_p_int : (forall x0, nat_p x0 -> x0 :e int).
Axiom abs_SNo_0 : abs_SNo 0 = 0.
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Axiom int_SNo : (forall x0, x0 :e int -> SNo x0).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Axiom SNo_abs_SNo : (forall x0, SNo x0 -> SNo (abs_SNo x0)).
Axiom pos_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt 0 x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNoLt_0_2 : SNoLt 0 2.
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
Axiom SNoLt_0_1 : SNoLt 0 1.
Axiom int_add_SNo : (forall x0, x0 :e int -> (forall x1, x1 :e int -> add_SNo x0 x1 :e int)).
Axiom int_minus_SNo : (forall x0, x0 :e int -> minus_SNo x0 :e int).
Axiom abs_SNo_dist_swap : (forall x0 x1, SNo x0 -> SNo x1 -> abs_SNo (add_SNo x0 (minus_SNo x1)) = abs_SNo (add_SNo x1 (minus_SNo x0))).
Axiom add_SNo_minus_Lt1b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 (add_SNo x2 x1) -> SNoLt (add_SNo x0 (minus_SNo x1)) x2).
Axiom add_SNo_minus_Le2b : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe (add_SNo x2 x1) x0 -> SNoLe x2 (add_SNo x0 (minus_SNo x1))).
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom pos_abs_SNo : (forall x0, SNoLt 0 x0 -> abs_SNo x0 = x0).
Axiom add_SNo_minus_SNo_prop2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 (add_SNo (minus_SNo x0) x1) = x1).
Theorem missingprop_373b6f282b04b24e9f340280241fcffe1e1e8dea372960bb2b79798db49c4af0 : (forall x0, nat_p x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> (forall x1, nat_p x1 -> (forall x2 : prop, (forall x3, and (x3 :e int) (and (SNoLe (mul_SNo 2 (abs_SNo x3)) x0) (divides_nat x0 (add_SNo x1 (minus_SNo x3)))) -> x2) -> x2))).
admit.
Qed.
