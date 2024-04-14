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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition odd_nat : set -> prop :=
 (fun x0 : set => and (x0 :e omega) (forall x1, x1 :e omega -> x0 = mul_nat 2 x1 -> (forall x2 : prop, x2))).
Axiom even_nat_not_odd_nat : (forall x0, even_nat x0 -> not (odd_nat x0)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom even_nat_double : (forall x0, nat_p x0 -> even_nat (mul_nat 2 x0)).
(* Parameter exactly1of2 "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" "163602f90de012a7426ee39176523ca58bc964ccde619b652cb448bd678f7e21" *)
Parameter exactly1of2 : prop -> prop -> prop.
Axiom even_nat_xor_S : (forall x0, nat_p x0 -> exactly1of2 (even_nat x0) (even_nat (ordsucc x0))).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_2 : nat_p 2.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Axiom eps_1_half_eq3 : mul_SNo (eps_ 1) 2 = 1.
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom SNo_eps_ : (forall x0, x0 :e omega -> SNo (eps_ x0)).
Axiom nat_1 : nat_p 1.
Theorem double_nat_cancel : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat 2 x0 = mul_nat 2 x1 -> x0 = x1)).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom nat_0 : nat_p 0.
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Theorem even_nat_0 : even_nat 0.
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom exactly1of2_E : (forall x0 x1 : prop, exactly1of2 x0 x1 -> (forall x2 : prop, (x0 -> not x1 -> x2) -> (not x0 -> x1 -> x2) -> x2)).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem even_nat_or_odd_nat : (forall x0, nat_p x0 -> or (even_nat x0) (odd_nat x0)).
admit.
Qed.
Theorem not_odd_nat_0 : not (odd_nat 0).
admit.
Qed.
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem even_nat_odd_nat_S : (forall x0, even_nat x0 -> odd_nat (ordsucc x0)).
admit.
Qed.
Theorem odd_nat_even_nat_S : (forall x0, odd_nat x0 -> even_nat (ordsucc x0)).
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Axiom exactly1of2_I2 : (forall x0 x1 : prop, not x0 -> x1 -> exactly1of2 x0 x1).
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Axiom exactly1of2_I1 : (forall x0 x1 : prop, x0 -> not x1 -> exactly1of2 x0 x1).
Theorem odd_nat_xor_odd_sum : (forall x0, odd_nat x0 -> (forall x1, nat_p x1 -> exactly1of2 (odd_nat x1) (odd_nat (add_nat x0 x1)))).
admit.
Qed.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom iff_refl : (forall x0 : prop, iff x0 x0).
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Axiom iffER : (forall x0 x1 : prop, iff x0 x1 -> x1 -> x0).
Axiom iffEL : (forall x0 x1 : prop, iff x0 x1 -> x0 -> x1).
Theorem odd_nat_iff_odd_mul_nat : (forall x0, odd_nat x0 -> (forall x1, nat_p x1 -> iff (odd_nat x1) (odd_nat (mul_nat x0 x1)))).
admit.
Qed.
Theorem odd_nat_mul_nat : (forall x0 x1, odd_nat x0 -> odd_nat x1 -> odd_nat (mul_nat x0 x1)).
admit.
Qed.
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Axiom add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
Theorem add_nat_0_inv : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = 0 -> and (x0 = 0) (x1 = 0))).
admit.
Qed.
Theorem mul_nat_0_inv : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = 0 -> or (x0 = 0) (x1 = 0))).
admit.
Qed.
Axiom mul_nat_1R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 1) x0 -> x1 x0 (mul_nat x0 1)).
Axiom In_1_2 : 1 :e 2.
Axiom add_nat_0L : (forall x0, nat_p x0 -> add_nat 0 x0 = x0).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem ordsucc_in_double_nat_ordsucc : (forall x0, nat_p x0 -> ordsucc x0 :e mul_nat 2 (ordsucc x0)).
admit.
Qed.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem double_nat_Subq_0 : (forall x0, nat_p x0 -> mul_nat 2 x0 c= x0 -> x0 = 0).
admit.
Qed.
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Theorem add_nat_Subq_L : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> x0 c= add_nat x0 x1)).
admit.
Qed.
Axiom Empty_Subq_eq : (forall x0, x0 c= 0 -> x0 = 0).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom mul_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat (ordsucc x0) x1 = add_nat (mul_nat x0 x1) x1)).
Axiom add_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = add_nat x1 x0)).
Theorem square_nat_Subq : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> x0 c= x1 -> mul_nat x0 x0 c= mul_nat x1 x1)).
admit.
Qed.
Axiom nat_complete_ind : (forall x0 : set -> prop, (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom mul_nat_asso : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat (mul_nat x0 x1) x2 = mul_nat x0 (mul_nat x1 x2)))).
Axiom mul_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x1 = mul_nat x1 x0)).
Theorem form100_1_v1_lem : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x0 = mul_nat 2 (mul_nat x1 x1) -> x1 = 0)).
admit.
Qed.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom In_0_1 : 0 :e 1.
Theorem form100_1_v1 : (forall x0, x0 :e setminus omega 1 -> (forall x1, x1 :e setminus omega 1 -> mul_nat x0 x0 = mul_nat 2 (mul_nat x1 x1) -> (forall x2 : prop, x2))).
admit.
Qed.
