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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Definition finite : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (equip x0 x2) -> x1) -> x1).
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Definition SNo_max_of : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x1 :e x0) (SNo x1)) (forall x2, x2 :e x0 -> SNo x2 -> SNoLe x2 x1)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Axiom In_0_1 : 0 :e 1.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom SNoLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLe x1 x2 -> SNoLe x0 x2).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem finite_max_exists : (forall x0, (forall x1, x1 :e x0 -> SNo x1) -> finite x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> (forall x1 : prop, (forall x2, SNo_max_of x0 x2 -> x1) -> x1)).
admit.
Qed.
(* Parameter SNo_min_of "40f47924a1c2c540d43c739db83802689c2dd8fe91b5277b7ee16229de2ef804" "5eb8d74e40adaa48efa3692ec9fea1f1d54c1351307f2a54296ed77ac37af686" *)
Parameter SNo_min_of : set -> set -> prop.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom minus_SNo_max_min' : (forall x0 x1, (forall x2, x2 :e x0 -> SNo x2) -> SNo_max_of (Repl x0 minus_SNo) x1 -> SNo_min_of x0 (minus_SNo x1)).
Theorem finite_min_exists : (forall x0, (forall x1, x1 :e x0 -> SNo x1) -> finite x0 -> (x0 = 0 -> (forall x1 : prop, x1)) -> (forall x1 : prop, (forall x2, SNo_min_of x0 x2 -> x1) -> x1)).
admit.
Qed.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (forall x3, and (x3 :e x0) (SNo_ x3 x1) -> x2) -> x2))).
Axiom ordinal_Empty : ordinal 0.
Theorem missingprop_78056d49372410c2d2d56ef3f35a6263079494e4e08f9302b279d2762876ba83 : SNoS_ 0 = 0.
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom add_SNo_1_ordsucc : (forall x0, x0 :e omega -> add_SNo x0 1 = ordsucc x0).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Axiom SNo_1 : SNo 1.
Axiom add_SNo_In_omega : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_SNo x0 x1 :e omega)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_minus_L2 : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (minus_SNo x0) (add_SNo x0 x1) = x1).
Axiom omega_SNo : (forall x0, x0 :e omega -> SNo x0).
Theorem add_SNo_omega_In_cases : (forall x0 x1, x1 :e omega -> (forall x2, nat_p x2 -> x0 :e add_SNo x1 x2 -> or (x0 :e x1) (add_SNo x0 (minus_SNo x1) :e x2))).
admit.
Qed.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
(* Parameter SNo_extend0 "e94a939c86c866ea378958089db656d350c86095197c9912d4e9d0f1ea317f09" "997d9126455d5de46368f27620eca2e5ad3b0f0ecdffdc7703aa4aafb77eafb6" *)
Parameter SNo_extend0 : set -> set.
(* Parameter SNoElts_ "1e55e667ef0bb79beeaf1a09548d003a4ce4f951cd8eb679eb1fed9bde85b91c" "c0ec73850ee5ffe522788630e90a685ec9dc80b04347c892d62880c5e108ba10" *)
Parameter SNoElts_ : set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Definition PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 x2 : set -> prop => forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)).
Definition SNoEq_ : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => PNoEq_ x0 (fun x3 : set => x3 :e x1) (fun x3 : set => x3 :e x2)).
Axiom SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
Axiom restr_SNo : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNo (binintersect x0 (SNoElts_ x1)))).
Axiom restr_SNoLev : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNoLev (binintersect x0 (SNoElts_ x1)) = x1)).
Axiom SNoEq_sym_ : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x1).
Axiom SNoEq_tra_ : (forall x0 x1 x2 x3, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x3 -> SNoEq_ x0 x1 x3).
Axiom restr_SNoEq : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNoEq_ x1 (binintersect x0 (SNoElts_ x1)) x0)).
Axiom SNo_extend0_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend0 x0) x0).
Axiom SNo_extend0_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend0 x0) = ordsucc (SNoLev x0)).
Axiom SNo_extend0_SNo : (forall x0, SNo x0 -> SNo (SNo_extend0 x0)).
Theorem SNo_extend0_restr_eq : (forall x0, SNo x0 -> x0 = binintersect (SNo_extend0 x0) (SNoElts_ (SNoLev x0))).
admit.
Qed.
(* Parameter SNo_extend1 "680d7652d15d54f0a766df3f997236fe6ea93db85d1c85bee2fa1d84b02d9c1d" "464e47790f44cd38285279f563a5a918d73224c78a9ef17ae1a46e62a95b2a41" *)
Parameter SNo_extend1 : set -> set.
Axiom SNo_extend1_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend1 x0) x0).
Axiom SNo_extend1_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend1 x0) = ordsucc (SNoLev x0)).
Axiom SNo_extend1_SNo : (forall x0, SNo x0 -> SNo (SNo_extend1 x0)).
Theorem SNo_extend1_restr_eq : (forall x0, SNo x0 -> x0 = binintersect (SNo_extend1 x0) (SNoElts_ (SNoLev x0))).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Axiom exp_SNo_nat_0 : (forall x0, SNo x0 -> exp_SNo_nat x0 0 = 1).
Axiom SNo_2 : SNo 2.
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom omega_ordinal : ordinal omega.
Axiom nat_0 : nat_p 0.
Axiom ordinal_SNo_ : (forall x0, ordinal x0 -> SNo_ x0 x0).
Axiom SNoLev_0 : SNoLev 0 = 0.
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom SNo_0 : SNo 0.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom exp_SNo_nat_S : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> exp_SNo_nat x0 (ordsucc x1) = mul_SNo x0 (exp_SNo_nat x0 x1))).
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom SNo_exp_SNo_nat : (forall x0, SNo x0 -> (forall x1, nat_p x1 -> SNo (exp_SNo_nat x0 x1))).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom ordinal_SNoLt_In : (forall x0 x1, ordinal x0 -> ordinal x1 -> SNoLt x0 x1 -> x0 :e x1).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom ordinal_SNo : (forall x0, ordinal x0 -> SNo x0).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom exp_SNo_nat_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> (forall x1, nat_p x1 -> SNoLt 0 (exp_SNo_nat x0 x1))).
Axiom SNoLt_0_2 : SNoLt 0 2.
Axiom add_SNo_ordinal_ordinal : (forall x0, ordinal x0 -> (forall x1, ordinal x1 -> ordinal (add_SNo x0 x1))).
Axiom iff_trans : (forall x0 x1 x2 : prop, iff x0 x1 -> iff x1 x2 -> iff x0 x2).
Axiom iff_sym : (forall x0 x1 : prop, iff x0 x1 -> iff x1 x0).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom omega_nonneg : (forall x0, x0 :e omega -> SNoLe 0 x0).
Axiom add_SNo_cancel_L : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 x1 = add_SNo x0 x2 -> x1 = x2).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom SNo_extend1_SNo_ : (forall x0, SNo x0 -> SNo_ (ordsucc (SNoLev x0)) (SNo_extend1 x0)).
Axiom SNo_extend1_In : (forall x0, SNo x0 -> SNoLev x0 :e SNo_extend1 x0).
Axiom SNo_extend0_SNo_ : (forall x0, SNo x0 -> SNo_ (ordsucc (SNoLev x0)) (SNo_extend0 x0)).
Axiom SNo_extend0_nIn : (forall x0, SNo x0 -> nIn (SNoLev x0) (SNo_extend0 x0)).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Axiom restr_SNo_ : (forall x0, SNo x0 -> (forall x1, x1 :e SNoLev x0 -> SNo_ x1 (binintersect x0 (SNoElts_ x1)))).
Axiom nat_exp_SNo_nat : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_SNo_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Theorem SNoS_omega_Lev_equip : (forall x0, nat_p x0 -> equip (Sep (SNoS_ omega) (fun x1 : set => forall x2 : set -> set -> prop, x2 (SNoLev x1) x0 -> x2 x0 (SNoLev x1))) (exp_SNo_nat 2 x0)).
admit.
Qed.
Theorem equip_0_Empty : (forall x0, equip x0 0 -> x0 = 0).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom ReplE' : (forall x0, forall x1 : set -> set, forall x2 : set -> prop, (forall x3, x3 :e x0 -> x2 (x1 x3)) -> (forall x3, x3 :e Repl x0 x1 -> x2 x3)).
Theorem finite_ind : (forall x0 : set -> prop, x0 0 -> (forall x1 x2, finite x1 -> nIn x2 x1 -> x0 x1 -> x0 (binunion x1 (Sing x2))) -> (forall x1, finite x1 -> x0 x1)).
admit.
Qed.
Axiom equip_ref : (forall x0, equip x0 x0).
Theorem finite_Empty : finite 0.
admit.
Qed.
Theorem nat_inv_impred : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
admit.
Qed.
Theorem missingprop_8ef1b6857698605b5dfae764814858ff77644019752c21e7db5c52f1784236e4 : (forall x0, nat_p x0 -> (forall x1 : set -> prop, x1 0 -> (forall x2, nat_p x2 -> x1 (ordsucc x2)) -> x1 x0)).
admit.
Qed.
Axiom binunion_Subq_1 : (forall x0 x1, x0 c= binunion x0 x1).
Theorem adjoin_finite : (forall x0 x1, finite x0 -> finite (binunion x0 (Sing x1))).
admit.
Qed.
Axiom binunion_idr : (forall x0, forall x1 : set -> set -> prop, x1 (binunion x0 0) x0 -> x1 x0 (binunion x0 0)).
Axiom binunion_asso : (forall x0 x1 x2, forall x3 : set -> set -> prop, x3 (binunion x0 (binunion x1 x2)) (binunion (binunion x0 x1) x2) -> x3 (binunion (binunion x0 x1) x2) (binunion x0 (binunion x1 x2))).
Theorem binunion_finite : (forall x0, finite x0 -> (forall x1, finite x1 -> finite (binunion x0 x1))).
admit.
Qed.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Axiom famunion_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (famunion 0 x0) 0 -> x1 0 (famunion 0 x0)).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom binunionE' : (forall x0 x1 x2, forall x3 : prop, (x2 :e x0 -> x3) -> (x2 :e x1 -> x3) -> x2 :e binunion x0 x1 -> x3).
Theorem famunion_nat_finite : (forall x0 : set -> set, forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> finite (x0 x2)) -> finite (famunion x1 x0)).
admit.
Qed.
Axiom SNoS_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoS_ x0 c= SNoS_ x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom omega_TransSet : TransSet omega.
Theorem SNoS_finite : (forall x0, x0 :e omega -> finite (SNoS_ x0)).
admit.
Qed.
Axiom Empty_Subq_eq : (forall x0, x0 c= 0 -> x0 = 0).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Theorem Subq_finite : (forall x0, finite x0 -> (forall x1, x1 c= x0 -> finite x1)).
admit.
Qed.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
Theorem SNoS_omega_SNoL_finite : (forall x0, x0 :e SNoS_ omega -> finite (SNoL x0)).
admit.
Qed.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Theorem SNoS_omega_SNoR_finite : (forall x0, x0 :e SNoS_ omega -> finite (SNoR x0)).
admit.
Qed.
Theorem SNoS_omega_SNoL_max_exists : (forall x0, x0 :e SNoS_ omega -> or (SNoL x0 = 0) (forall x1 : prop, (forall x2, SNo_max_of (SNoL x0) x2 -> x1) -> x1)).
admit.
Qed.
Theorem SNoS_omega_SNoR_min_exists : (forall x0, x0 :e SNoS_ omega -> or (SNoR x0 = 0) (forall x1 : prop, (forall x2, SNo_min_of (SNoR x0) x2 -> x1) -> x1)).
admit.
Qed.
