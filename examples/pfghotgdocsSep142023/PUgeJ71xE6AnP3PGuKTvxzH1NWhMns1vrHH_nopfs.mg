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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom In_0_2 : 0 :e 2.
Theorem missingprop_c1b6591d5fe7667f4ae8b37e57c15660d3c99e820fd43fc7e7d06dca4c9d1c82 : not (TransSet (Sing 2)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Theorem missingprop_7bb148020ac74fad9e588d8f6f24c2245db7c295ea73aac9a7af2c90be710bd6 : not (ordinal (Sing 2)).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Theorem ctagged_not_ordinal : (forall x0, not (ordinal (SetAdjoin x0 (Sing 2)))).
admit.
Qed.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Theorem ctagged_notin_ordinal : (forall x0 x1, ordinal x0 -> nIn (SetAdjoin x1 (Sing 2)) x0).
admit.
Qed.
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Theorem Sing2_notin_SingSing1 : nIn (Sing 2) (Sing (Sing 1)).
admit.
Qed.
Definition SNoElts_ : set -> set :=
 (fun x0 : set => binunion x0 {SetAdjoin x1 (Sing 1) | x1 :e x0}).
(* Parameter exactly1of2 "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" "163602f90de012a7426ee39176523ca58bc964ccde619b652cb448bd678f7e21" *)
Parameter exactly1of2 : prop -> prop -> prop.
Definition SNo_ : set -> set -> prop :=
 (fun x0 x1 : set => and (x1 c= SNoElts_ x0) (forall x2, x2 :e x0 -> exactly1of2 (SetAdjoin x2 (Sing 1) :e x1) (x2 :e x1))).
Definition SNo : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (ordinal x2) (SNo_ x2 x0) -> x1) -> x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem ctagged_notin_SNo : (forall x0 x1, SNo x0 -> nIn (SetAdjoin x1 (Sing 2)) x0).
admit.
Qed.
Definition SNo_pair : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 {SetAdjoin x2 (Sing 2) | x2 :e x1}).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Theorem missingprop_1ad0a3bb149bcb06557204ce4ffbae688647b658570b28aa1e6e79d7f5cb88f2 : (forall x0 x1 x2 x3, SNo x0 -> SNo_pair x0 x1 = SNo_pair x2 x3 -> x0 c= x2).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem SNo_pair_prop_1 : (forall x0 x1 x2 x3, SNo x0 -> SNo x2 -> SNo_pair x0 x1 = SNo_pair x2 x3 -> x0 = x2).
admit.
Qed.
Theorem missingprop_1b5aa535fcde76fd53364a7cf6580e2c2d37782b7e7111e0b8d5fe943bf0e0b1 : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SetAdjoin x2 (Sing 2) = SetAdjoin x3 (Sing 2) -> x2 c= x3))).
admit.
Qed.
Theorem ctagged_eqE_eq : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SetAdjoin x2 (Sing 2) = SetAdjoin x3 (Sing 2) -> x2 = x3))).
admit.
Qed.
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem missingprop_0b38d9c263f14a59a61442618afd1e764c399507e4eddb8c4c97dfc21529d034 : (forall x0 x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> SNo_pair x0 x1 = SNo_pair x2 x3 -> x1 c= x3).
admit.
Qed.
Theorem SNo_pair_prop_2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo_pair x0 x1 = SNo_pair x2 x3 -> x1 = x3).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem SNo_pair_prop : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo_pair x0 x1 = SNo_pair x2 x3 -> and (x0 = x2) (x1 = x3)).
admit.
Qed.
Axiom Repl_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (Repl 0 x0) 0 -> x1 0 (Repl 0 x0)).
Axiom binunion_idr : (forall x0, forall x1 : set -> set -> prop, x1 (binunion x0 0) x0 -> x1 x0 (binunion x0 0)).
Theorem SNo_pair_0 : (forall x0, forall x1 : set -> set -> prop, x1 (SNo_pair x0 0) x0 -> x1 x0 (SNo_pair x0 0)).
admit.
Qed.
Definition CSNo : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (SNo x2) (forall x3 : prop, (forall x4, and (SNo x4) (x0 = SNo_pair x2 x4) -> x3) -> x3) -> x1) -> x1).
Theorem CSNo_I : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo (SNo_pair x0 x1)).
admit.
Qed.
Theorem CSNo_E : (forall x0, CSNo x0 -> (forall x1 : set -> prop, (forall x2 x3, SNo x2 -> SNo x3 -> x0 = SNo_pair x2 x3 -> x1 (SNo_pair x2 x3)) -> x1 x0)).
admit.
Qed.
Axiom SNo_0 : SNo 0.
Theorem SNo_CSNo : (forall x0, SNo x0 -> CSNo x0).
admit.
Qed.
Definition Complex_i : set :=
 SNo_pair 0 1.
Axiom SNo_1 : SNo 1.
Theorem SNo_Complex_i : CSNo Complex_i.
admit.
Qed.
Definition CSNo_Re : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (SNo x1) (forall x2 : prop, (forall x3, and (SNo x3) (x0 = SNo_pair x1 x3) -> x2) -> x2))).
Definition CSNo_Im : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (SNo x1) (x0 = SNo_pair (CSNo_Re x0) x1))).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem CSNo_Re1 : (forall x0, CSNo x0 -> and (SNo (CSNo_Re x0)) (forall x1 : prop, (forall x2, and (SNo x2) (x0 = SNo_pair (CSNo_Re x0) x2) -> x1) -> x1)).
admit.
Qed.
Theorem CSNo_Re2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Re (SNo_pair x0 x1) = x0).
admit.
Qed.
Theorem CSNo_Im1 : (forall x0, CSNo x0 -> and (SNo (CSNo_Im x0)) (x0 = SNo_pair (CSNo_Re x0) (CSNo_Im x0))).
admit.
Qed.
Theorem CSNo_Im2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Im (SNo_pair x0 x1) = x1).
admit.
Qed.
Theorem CSNo_ReR : (forall x0, CSNo x0 -> SNo (CSNo_Re x0)).
admit.
Qed.
Theorem CSNo_ImR : (forall x0, CSNo x0 -> SNo (CSNo_Im x0)).
admit.
Qed.
Theorem CSNo_ReIm : (forall x0, CSNo x0 -> x0 = SNo_pair (CSNo_Re x0) (CSNo_Im x0)).
admit.
Qed.
Theorem CSNo_ReIm_split : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re x0 = CSNo_Re x1 -> CSNo_Im x0 = CSNo_Im x1 -> x0 = x1).
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Definition add_CSNo : set -> set -> set :=
 (fun x0 x1 : set => SNo_pair (add_SNo (CSNo_Re x0) (CSNo_Re x1)) (add_SNo (CSNo_Im x0) (CSNo_Im x1))).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition mul_CSNo : set -> set -> set :=
 (fun x0 x1 : set => SNo_pair (add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Re x1)) (minus_SNo (mul_SNo (CSNo_Im x0) (CSNo_Im x1)))) (add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Im x1)) (mul_SNo (CSNo_Im x0) (CSNo_Re x1)))).
(* Parameter ReplSep2 "816cc62796568c2de8e31e57b826d72c2e70ee3394c00fbc921f2e41e996e83a" "da098a2dd3a59275101fdd49b6d2258642997171eac15c6b60570c638743e785" *)
Parameter ReplSep2 : set -> (set -> set) -> (set -> set -> prop) -> (set -> set -> set) -> set.
(* Parameter Eps_i_realset "4fe2c39e67b687a4cffa0d8bc17cabdfec622da8c39b788b83deb466e6dddfaa" "5c3986ee4332ef315b83ef53491e4d2cb38a7ed52b7a33b70161ca6a48b17c87" *)
Parameter Eps_i_realset : set.
(* Parameter True "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" "f81b3934a73154a8595135f10d1564b0719278d3976cc83da7fda60151d770da" *)
Parameter True : prop.
Definition missingname_74854e78a8e6de9813e152fd5e78154b5b975aa3cd09b0e75717c778577f8774 : set :=
 ReplSep2 Eps_i_realset (fun x0 : set => Eps_i_realset) (fun x0 x1 : set => True) SNo_pair.
