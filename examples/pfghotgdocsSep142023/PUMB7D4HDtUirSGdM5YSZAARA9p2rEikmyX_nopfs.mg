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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom SingI : (forall x0, x0 :e Sing x0).
Theorem Subq_1_Sing0 : 1 c= Sing 0.
admit.
Qed.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem Subq_Sing0_1 : Sing 0 c= 1.
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem eq_1_Sing0 : 1 = Sing 0.
admit.
Qed.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Theorem Subq_2_UPair01 : 2 c= UPair 0 1.
admit.
Qed.
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom In_0_2 : 0 :e 2.
Axiom In_1_2 : 1 :e 2.
Theorem Subq_UPair01_2 : UPair 0 1 c= 2.
admit.
Qed.
Theorem eq_2_UPair01 : 2 = UPair 0 1.
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Axiom In_ind : (forall x0 : set -> prop, (forall x1, (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, x0 x1)).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Theorem ordinal_ind : (forall x0 : set -> prop, (forall x1, ordinal x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, ordinal x1 -> x0 x1)).
admit.
Qed.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem least_ordinal_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, and (ordinal x2) (x0 x2) -> x1) -> x1) -> (forall x1 : prop, (forall x2, and (and (ordinal x2) (x0 x2)) (forall x3, x3 :e x2 -> not (x0 x3)) -> x1) -> x1)).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_1 : nat_p 1.
Axiom ordinal_1 : ordinal 1.
Axiom nat_2 : nat_p 2.
Axiom ordinal_2 : ordinal 2.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom omega_TransSet : TransSet omega.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Axiom omega_ordinal : ordinal omega.
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom ordsucc_omega_ordinal : ordinal (ordsucc omega).
Axiom TransSet_ordsucc_In_Subq : (forall x0, TransSet x0 -> (forall x1, x1 :e x0 -> ordsucc x1 c= x0)).
Axiom ordinal_ordsucc_In_Subq : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 c= x0)).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom or3I1 : (forall x0 x1 x2 : prop, x0 -> or (or x0 x1) x2).
Axiom or3I3 : (forall x0 x1 x2 : prop, x2 -> or (or x0 x1) x2).
Axiom or3I2 : (forall x0 x1 x2 : prop, x1 -> or (or x0 x1) x2).
Axiom or3E : (forall x0 x1 x2 : prop, or (or x0 x1) x2 -> (forall x3 : prop, (x0 -> x3) -> (x1 -> x3) -> (x2 -> x3) -> x3)).
Axiom ordinal_trichotomy_or : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (or (x0 :e x1) (x0 = x1)) (x1 :e x0)).
(* Parameter exactly1of3 "d2a0e4530f6e4a8ef3d5fadfbb12229fa580c2add302f925c85ede027bb4b175" "aa4bcd059b9a4c99635877362627f7d5998ee755c58679934cc62913f8ef06e0" *)
Parameter exactly1of3 : prop -> prop -> prop -> prop.
Axiom exactly1of3_I1 : (forall x0 x1 x2 : prop, x0 -> not x1 -> not x2 -> exactly1of3 x0 x1 x2).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom exactly1of3_I2 : (forall x0 x1 x2 : prop, not x0 -> x1 -> not x2 -> exactly1of3 x0 x1 x2).
Axiom exactly1of3_I3 : (forall x0 x1 x2 : prop, not x0 -> not x1 -> x2 -> exactly1of3 x0 x1 x2).
Theorem ordinal_trichotomy : (forall x0 x1, ordinal x0 -> ordinal x1 -> exactly1of3 (x0 :e x1) (x0 = x1) (x1 :e x0)).
admit.
Qed.
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom ordinal_linear : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 c= x1) (x1 c= x0)).
Axiom ordinal_ordsucc_In_eq : (forall x0 x1, ordinal x0 -> x1 :e x0 -> or (ordsucc x1 :e x0) (x0 = ordsucc x1)).
Axiom ordinal_lim_or_succ : (forall x0, ordinal x0 -> or (forall x1, x1 :e x0 -> ordsucc x1 :e x0) (forall x1 : prop, (forall x2, and (x2 :e x0) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom UnionE_impred : (forall x0 x1, x1 :e Union x0 -> (forall x2 : prop, (forall x3, x1 :e x3 -> x3 :e x0 -> x2) -> x2)).
Axiom UnionI : (forall x0 x1 x2, x1 :e x2 -> x2 :e x0 -> x1 :e Union x0).
Axiom ordinal_Union : (forall x0, (forall x1, x1 :e x0 -> ordinal x1) -> ordinal (Union x0)).
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Axiom famunionE : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 :e x1 x4) -> x3) -> x3)).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom ordinal_famunion : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> ordinal (x1 x2)) -> ordinal (famunion x0 x1)).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom binintersect_Subq_eq_1 : (forall x0 x1, x0 c= x1 -> binintersect x0 x1 = x0).
Axiom binintersect_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binintersect x0 x1) (binintersect x1 x0) -> x2 (binintersect x1 x0) (binintersect x0 x1)).
Axiom ordinal_binintersect : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binintersect x0 x1)).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Axiom Subq_binunion_eq : (forall x0 x1, forall x2 : prop -> prop -> prop, x2 (x0 c= x1) (binunion x0 x1 = x1) -> x2 (binunion x0 x1 = x1) (x0 c= x1)).
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Axiom ordinal_binunion : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binunion x0 x1)).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom ordinal_Sep : (forall x0, ordinal x0 -> (forall x1 : set -> prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x2 -> x1 x2 -> x1 x3)) -> ordinal (Sep x0 x1))).
(* Parameter In_rec_i "f97da687c51f5a332ff57562bd465232bc70c9165b0afe0a54e6440fc4962a9f" "fac413e747a57408ad38b3855d3cde8673f86206e95ccdadff2b5babaf0c219e" *)
Parameter In_rec_i : (set -> (set -> set) -> set) -> set -> set.
Definition Inj1 : set -> set :=
 In_rec_i (fun x0 : set => fun x1 : set -> set => binunion (Sing 0) (Repl x0 x1)).
Axiom In_rec_i_eq : (forall x0 : set -> (set -> set) -> set, (forall x1, forall x2 x3 : set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : set -> set -> prop, x2 (In_rec_i x0 x1) (x0 x1 (In_rec_i x0)) -> x2 (x0 x1 (In_rec_i x0)) (In_rec_i x0 x1))).
Axiom ReplEq_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Repl x0 x1 = Repl x0 x2).
Theorem Inj1_eq : (forall x0, forall x1 : set -> set -> prop, x1 (Inj1 x0) (binunion (Sing 0) (Repl x0 Inj1)) -> x1 (binunion (Sing 0) (Repl x0 Inj1)) (Inj1 x0)).
admit.
Qed.
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Theorem Inj1I1 : (forall x0, 0 :e Inj1 x0).
admit.
Qed.
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem Inj1I2 : (forall x0 x1, x1 :e x0 -> Inj1 x1 :e Inj1 x0).
admit.
Qed.
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom ReplE : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = x1 x4) -> x3) -> x3)).
Theorem Inj1E : (forall x0 x1, x1 :e Inj1 x0 -> or (x1 = 0) (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 = Inj1 x3) -> x2) -> x2)).
admit.
Qed.
Theorem Inj1NE1 : (forall x0, Inj1 x0 = 0 -> (forall x1 : prop, x1)).
admit.
Qed.
Theorem Inj1NE2 : (forall x0, nIn (Inj1 x0) (Sing 0)).
admit.
Qed.
Definition Inj0 : set -> set :=
 (fun x0 : set => Repl x0 Inj1).
Theorem Inj0I : (forall x0 x1, x1 :e x0 -> Inj1 x1 :e Inj0 x0).
admit.
Qed.
Theorem Inj0E : (forall x0 x1, x1 :e Inj0 x0 -> (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 = Inj1 x3) -> x2) -> x2)).
admit.
Qed.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Definition Unj : set -> set :=
 In_rec_i (fun x0 : set => Repl (setminus x0 (Sing 0))).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Theorem Unj_eq : (forall x0, forall x1 : set -> set -> prop, x1 (Unj x0) (Repl (setminus x0 (Sing 0)) Unj) -> x1 (Repl (setminus x0 (Sing 0)) Unj) (Unj x0)).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom exandE_i : (forall x0 x1 : set -> prop, (forall x2 : prop, (forall x3, and (x0 x3) (x1 x3) -> x2) -> x2) -> (forall x2 : prop, (forall x3, x0 x3 -> x1 x3 -> x2) -> x2)).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Theorem Unj_Inj1_eq : (forall x0, forall x1 : set -> set -> prop, x1 (Unj (Inj1 x0)) x0 -> x1 x0 (Unj (Inj1 x0))).
admit.
Qed.
Theorem Inj1_inj : (forall x0 x1, Inj1 x0 = Inj1 x1 -> x0 = x1).
admit.
Qed.
Theorem Unj_Inj0_eq : (forall x0, forall x1 : set -> set -> prop, x1 (Unj (Inj0 x0)) x0 -> x1 x0 (Unj (Inj0 x0))).
admit.
Qed.
Theorem Inj0_inj : (forall x0 x1, Inj0 x0 = Inj0 x1 -> x0 = x1).
admit.
Qed.
Axiom Repl_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (Repl 0 x0) 0 -> x1 0 (Repl 0 x0)).
Theorem Inj0_0 : Inj0 0 = 0.
admit.
Qed.
Axiom andER : (forall x0 x1 : prop, and x0 x1 -> x1).
Theorem Inj0_Inj1_neq : (forall x0 x1, Inj0 x0 = Inj1 x1 -> (forall x2 : prop, x2)).
admit.
Qed.
Definition setsum : set -> set -> set :=
 (fun x0 x1 : set => binunion (Repl x0 Inj0) (Repl x1 Inj1)).
Theorem Inj0_setsum : (forall x0 x1 x2, x2 :e x0 -> Inj0 x2 :e setsum x0 x1).
admit.
Qed.
Theorem Inj1_setsum : (forall x0 x1 x2, x2 :e x1 -> Inj1 x2 :e setsum x0 x1).
admit.
Qed.
Theorem setsum_Inj_inv : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = Inj0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = Inj1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem Inj0_setsum_0L : (forall x0, forall x1 : set -> set -> prop, x1 (setsum 0 x0) (Inj0 x0) -> x1 (Inj0 x0) (setsum 0 x0)).
admit.
Qed.
Axiom In_0_1 : 0 :e 1.
Theorem Inj1_setsum_1L : (forall x0, forall x1 : set -> set -> prop, x1 (setsum 1 x0) (Inj1 x0) -> x1 (Inj1 x0) (setsum 1 x0)).
admit.
Qed.
Axiom nat_complete_ind : (forall x0 : set -> prop, (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom nat_inv : (forall x0, nat_p x0 -> or (x0 = 0) (forall x1 : prop, (forall x2, and (nat_p x2) (x0 = ordsucc x2) -> x1) -> x1)).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Theorem nat_setsum_ordsucc : (forall x0, nat_p x0 -> setsum 1 x0 = ordsucc x0).
admit.
Qed.
Theorem setsum_0_0 : setsum 0 0 = 0.
admit.
Qed.
Axiom nat_0 : nat_p 0.
Theorem setsum_1_0_1 : setsum 1 0 = 1.
admit.
Qed.
Theorem setsum_1_1_2 : setsum 1 1 = 2.
admit.
Qed.
Theorem pairSubq : (forall x0 x1 x2 x3, x0 c= x2 -> x1 c= x3 -> setsum x0 x1 c= setsum x2 x3).
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition combine_funcs : set -> set -> (set -> set) -> (set -> set) -> set -> set :=
 (fun x0 x1 : set => fun x2 x3 : set -> set => fun x4 : set => If_i (x4 = Inj0 (Unj x4)) (x2 (Unj x4)) (x3 (Unj x4))).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem combine_funcs_eq1 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj0 x4)) (x2 x4) -> x5 (x2 x4) (combine_funcs x0 x1 x2 x3 (Inj0 x4))).
admit.
Qed.
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Theorem combine_funcs_eq2 : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : set -> set -> prop, x5 (combine_funcs x0 x1 x2 x3 (Inj1 x4)) (x3 x4) -> x5 (x3 x4) (combine_funcs x0 x1 x2 x3 (Inj1 x4))).
admit.
Qed.
(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set -> (set -> prop) -> (set -> set) -> set.
Definition proj0 : set -> set :=
 (fun x0 : set => ReplSep x0 (fun x1 : set => forall x2 : prop, (forall x3, Inj0 x3 = x1 -> x2) -> x2) Unj).
Definition proj1 : set -> set :=
 (fun x0 : set => ReplSep x0 (fun x1 : set => forall x2 : prop, (forall x3, Inj1 x3 = x1 -> x2) -> x2) Unj).
Theorem Inj0_pair_0_eq : Inj0 = setsum 0.
admit.
Qed.
Theorem Inj1_pair_1_eq : Inj1 = setsum 1.
admit.
Qed.
Theorem pairI0 : (forall x0 x1 x2, x2 :e x0 -> setsum 0 x2 :e setsum x0 x1).
admit.
Qed.
Theorem pairI1 : (forall x0 x1 x2, x2 :e x1 -> setsum 1 x2 :e setsum x0 x1).
admit.
Qed.
Theorem pairE : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = setsum 0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = setsum 1 x4) -> x3) -> x3)).
admit.
Qed.
Theorem pairE0 : (forall x0 x1 x2, setsum 0 x2 :e setsum x0 x1 -> x2 :e x0).
admit.
Qed.
Theorem pairE1 : (forall x0 x1 x2, setsum 1 x2 :e setsum x0 x1 -> x2 :e x1).
admit.
Qed.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem pairEq : (forall x0 x1 x2, iff (x2 :e setsum x0 x1) (or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = setsum 0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = setsum 1 x4) -> x3) -> x3))).
admit.
Qed.
Axiom ReplSepI : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e x0 -> x1 x3 -> x2 x3 :e ReplSep x0 x1 x2).
Theorem proj0I : (forall x0 x1, setsum 0 x1 :e x0 -> x1 :e proj0 x0).
admit.
Qed.
Axiom ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
Theorem proj0E : (forall x0 x1, x1 :e proj0 x0 -> setsum 0 x1 :e x0).
admit.
Qed.
Theorem proj1I : (forall x0 x1, setsum 1 x1 :e x0 -> x1 :e proj1 x0).
admit.
Qed.
Theorem proj1E : (forall x0 x1, x1 :e proj1 x0 -> setsum 1 x1 :e x0).
admit.
Qed.
Theorem proj0_pair_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (proj0 (setsum x0 x1)) x0 -> x2 x0 (proj0 (setsum x0 x1))).
admit.
Qed.
Theorem proj1_pair_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (proj1 (setsum x0 x1)) x1 -> x2 x1 (proj1 (setsum x0 x1))).
admit.
Qed.
Theorem pair_inj : (forall x0 x1 x2 x3, setsum x0 x1 = setsum x2 x3 -> and (x0 = x2) (x1 = x3)).
admit.
Qed.
Theorem pair_eta_Subq_proj : (forall x0, setsum (proj0 x0) (proj1 x0) c= x0).
admit.
Qed.
