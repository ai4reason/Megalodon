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
Theorem eq_i_tra : (forall x0 x1 x2, x0 = x1 -> x1 = x2 -> x0 = x2).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom Subq_ref : (forall x0, x0 c= x0).
Theorem TransSet_In_ordsucc_Subq : (forall x0 x1, TransSet x1 -> x0 :e ordsucc x1 -> x0 c= x1).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem inv_Repl_eq : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 (x2 x3) = x3) -> Repl (Repl x0 x2) x1 = x0).
admit.
Qed.
Theorem invol_Repl_eq : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 (x1 x2) = x2) -> Repl (Repl x0 x1) x1 = x0).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNoLt_trichotomy_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (or (SNoLt x0 x1) (x0 = x1)) (SNoLt x1 x0)).
Theorem SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoCutP_SNoCut : (forall x0 x1, SNoCutP x0 x1 -> and (and (and (and (SNo (SNoCut x0 x1)) (SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x2 : set => ordsucc (SNoLev x2))) (famunion x1 (fun x2 : set => ordsucc (SNoLev x2)))))) (forall x2, x2 :e x0 -> SNoLt x2 (SNoCut x0 x1))) (forall x2, x2 :e x1 -> SNoLt (SNoCut x0 x1) x2)) (forall x2, SNo x2 -> (forall x3, x3 :e x0 -> SNoLt x3 x2) -> (forall x3, x3 :e x1 -> SNoLt x2 x3) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x2) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x2))).
Theorem SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
admit.
Qed.
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom ordinal_SNo : (forall x0, ordinal x0 -> SNo x0).
Axiom ordinal_Subq_SNoLe : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> SNoLe x0 x1).
Theorem ordinal_SNoLt_In : (forall x0 x1, ordinal x0 -> ordinal x1 -> SNoLt x0 x1 -> x0 :e x1).
admit.
Qed.
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom ordinal_In_SNoLt : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> SNoLt x1 x0)).
Theorem ordinal_SNoLe_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> SNoLe x0 x1 -> x0 c= x1).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
Definition SNoL : set -> set :=
 (fun x0 : set => Sep (SNoS_ (SNoLev x0)) (fun x1 : set => SNoLt x1 x0)).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Theorem SNoL_SNoS_ : (forall x0, SNoL x0 c= SNoS_ (SNoLev x0)).
admit.
Qed.
Definition SNoR : set -> set :=
 (fun x0 : set => Sep (SNoS_ (SNoLev x0)) (SNoLt x0)).
Theorem SNoR_SNoS_ : (forall x0, SNoR x0 c= SNoS_ (SNoLev x0)).
admit.
Qed.
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom ordinal_SNoLev_max : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e x0 -> SNoLt x1 x0)).
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
Theorem ordinal_SNoL : (forall x0, ordinal x0 -> SNoL x0 = SNoS_ x0).
admit.
Qed.
Axiom Empty_Subq_eq : (forall x0, x0 c= 0 -> x0 = 0).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Theorem ordinal_SNoR : (forall x0, ordinal x0 -> SNoR x0 = 0).
admit.
Qed.
Axiom SNoCutP_SNoL_SNoR : (forall x0, SNo x0 -> SNoCutP (SNoL x0) (SNoR x0)).
Theorem ordinal_SNoCutP : (forall x0, ordinal x0 -> SNoCutP (SNoS_ x0) 0).
admit.
Qed.
Axiom SNo_eta : (forall x0, SNo x0 -> x0 = SNoCut (SNoL x0) (SNoR x0)).
Theorem ordinal_SNoCut_eta : (forall x0, ordinal x0 -> x0 = SNoCut (SNoS_ x0) 0).
admit.
Qed.
Axiom ordinal_Empty : ordinal 0.
Theorem SNo_0 : SNo 0.
admit.
Qed.
Theorem SNoLev_0 : SNoLev 0 = 0.
admit.
Qed.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem SNoL_0 : SNoL 0 = 0.
admit.
Qed.
Theorem SNoR_0 : SNoR 0 = 0.
admit.
Qed.
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom ordinal_SNoLev_max_2 : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e ordsucc x0 -> SNoLe x1 x0)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Theorem SNo_max_SNoLev : (forall x0, SNo x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLt x1 x0) -> SNoLev x0 = x0).
admit.
Qed.
Theorem SNo_max_ordinal : (forall x0, SNo x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLt x1 x0) -> ordinal x0).
admit.
Qed.
(* Parameter SNo_extend0 "e94a939c86c866ea378958089db656d350c86095197c9912d4e9d0f1ea317f09" "997d9126455d5de46368f27620eca2e5ad3b0f0ecdffdc7703aa4aafb77eafb6" *)
Parameter SNo_extend0 : set -> set.
Axiom SNoLtI3 : (forall x0 x1, SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> SNoLt x0 x1).
Axiom SNo_extend0_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend0 x0) = ordsucc (SNoLev x0)).
Axiom SNo_extend0_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend0 x0) x0).
Axiom SNo_extend0_nIn : (forall x0, SNo x0 -> nIn (SNoLev x0) (SNo_extend0 x0)).
Theorem SNo_extend0_Lt : (forall x0, SNo x0 -> SNoLt (SNo_extend0 x0) x0).
admit.
Qed.
(* Parameter SNo_extend1 "680d7652d15d54f0a766df3f997236fe6ea93db85d1c85bee2fa1d84b02d9c1d" "464e47790f44cd38285279f563a5a918d73224c78a9ef17ae1a46e62a95b2a41" *)
Parameter SNo_extend1 : set -> set.
Axiom SNoLtI2 : (forall x0 x1, SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> SNoLt x0 x1).
Axiom SNo_extend1_SNoLev : (forall x0, SNo x0 -> SNoLev (SNo_extend1 x0) = ordsucc (SNoLev x0)).
Axiom SNoEq_sym_ : (forall x0 x1 x2, SNoEq_ x0 x1 x2 -> SNoEq_ x0 x2 x1).
Axiom SNo_extend1_SNoEq : (forall x0, SNo x0 -> SNoEq_ (SNoLev x0) (SNo_extend1 x0) x0).
Axiom SNo_extend1_In : (forall x0, SNo x0 -> SNoLev x0 :e SNo_extend1 x0).
Theorem SNo_extend1_Gt : (forall x0, SNo x0 -> SNoLt x0 (SNo_extend1 x0)).
admit.
Qed.
(* Parameter In_rec_ii "4d137cad40b107eb0fc2c707372525f1279575e6cadb4ebc129108161af3cedb" "f3c9abbc5074c0d68e744893a170de526469426a5e95400ae7fc81f74f412f7e" *)
Parameter In_rec_ii : (set -> (set -> set -> set) -> set -> set) -> set -> set -> set.
(* Parameter If_ii "e76df3235104afd8b513a92c00d3cc56d71dd961510bf955a508d9c2713c3f29" "17057f3db7be61b4e6bd237e7b37125096af29c45cb784bb9cc29b1d52333779" *)
Parameter If_ii : prop -> (set -> set) -> (set -> set) -> set -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter True "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" "f81b3934a73154a8595135f10d1564b0719278d3976cc83da7fda60151d770da" *)
Parameter True : prop.
Definition SNo_rec_i : (set -> (set -> set) -> set) -> set -> set :=
 (fun x0 : set -> (set -> set) -> set => fun x1 : set => In_rec_ii (fun x2 : set => fun x3 : set -> set -> set => If_ii (ordinal x2) (fun x4 : set => If_i (x4 :e SNoS_ (ordsucc x2)) (x0 x4 (fun x5 : set => x3 (SNoLev x5) x5)) (Eps_i (fun x5 : set => True))) (fun x4 : set => Eps_i (fun x5 : set => True))) (SNoLev x1) x1).
Axiom In_rec_ii_eq : (forall x0 : set -> (set -> set -> set) -> set -> set, (forall x1, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : (set -> set) -> (set -> set) -> prop, x2 (In_rec_ii x0 x1) (x0 x1 (In_rec_ii x0)) -> x2 (x0 x1 (In_rec_ii x0)) (In_rec_ii x0 x1))).
Axiom If_ii_1 : (forall x0 : prop, forall x1 x2 : set -> set, x0 -> If_ii x0 x1 x2 = x1).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom SNoS_SNoLev : (forall x0, SNo x0 -> x0 :e SNoS_ (ordsucc (SNoLev x0))).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom If_ii_0 : (forall x0 : prop, forall x1 x2 : set -> set, not x0 -> If_ii x0 x1 x2 = x2).
Theorem SNo_rec_i_eq : (forall x0 : set -> (set -> set) -> set, (forall x1, SNo x1 -> (forall x2 x3 : set -> set, (forall x4, x4 :e SNoS_ (SNoLev x1) -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3)) -> (forall x1, SNo x1 -> SNo_rec_i x0 x1 = x0 x1 (SNo_rec_i x0))).
admit.
Qed.
(* Parameter In_rec_iii "222f1b8dcfb0d2e33cc4b232e87cbcdfe5c4a2bdc5326011eb70c6c9aeefa556" "9b3a85b85e8269209d0ca8bf18ef658e56f967161bf5b7da5e193d24d345dd06" *)
Parameter In_rec_iii : (set -> (set -> set -> set -> set) -> set -> set -> set) -> set -> set -> set -> set.
(* Parameter If_iii "53034f33cbed012c3c6db42812d3964f65a258627a765f5bede719198af1d1ca" "3314762dce5a2e94b7e9e468173b047dd4a9fac6ee2c5f553c6ea15e9c8b7542" *)
Parameter If_iii : prop -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
(* Parameter Descr_ii "a6e81668bfd1db6e6eb6a13bf66094509af176d9d0daccda274aa6582f6dcd7c" "3bae39e9880bbf5d70538d82bbb05caf44c2c11484d80d06dee0589d6f75178c" *)
Parameter Descr_ii : ((set -> set) -> prop) -> set -> set.
Definition SNo_rec_ii : (set -> (set -> set -> set) -> set -> set) -> set -> set -> set :=
 (fun x0 : set -> (set -> set -> set) -> set -> set => fun x1 : set => In_rec_iii (fun x2 : set => fun x3 : set -> set -> set -> set => If_iii (ordinal x2) (fun x4 : set => If_ii (x4 :e SNoS_ (ordsucc x2)) (x0 x4 (fun x5 : set => x3 (SNoLev x5) x5)) (Descr_ii (fun x5 : set -> set => True))) (fun x4 : set => Descr_ii (fun x5 : set -> set => True))) (SNoLev x1) x1).
Axiom In_rec_iii_eq : (forall x0 : set -> (set -> set -> set -> set) -> set -> set -> set, (forall x1, forall x2 x3 : set -> set -> set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : (set -> set -> set) -> (set -> set -> set) -> prop, x2 (In_rec_iii x0 x1) (x0 x1 (In_rec_iii x0)) -> x2 (x0 x1 (In_rec_iii x0)) (In_rec_iii x0 x1))).
Axiom If_iii_1 : (forall x0 : prop, forall x1 x2 : set -> set -> set, x0 -> If_iii x0 x1 x2 = x1).
Axiom If_iii_0 : (forall x0 : prop, forall x1 x2 : set -> set -> set, not x0 -> If_iii x0 x1 x2 = x2).
Theorem SNo_rec_ii_eq : (forall x0 : set -> (set -> set -> set) -> set -> set, (forall x1, SNo x1 -> (forall x2 x3 : set -> set -> set, (forall x4, x4 :e SNoS_ (SNoLev x1) -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3)) -> (forall x1, SNo x1 -> SNo_rec_ii x0 x1 = x0 x1 (SNo_rec_ii x0))).
admit.
Qed.
Axiom SNoS_In_neq : (forall x0, SNo x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> x1 = x0 -> (forall x2 : prop, x2))).
Theorem SNo_rec2_G_prop : (forall x0 : set -> set -> (set -> set -> set) -> set, (forall x1, SNo x1 -> (forall x2, SNo x2 -> (forall x3 x4 : set -> set -> set, (forall x5, x5 :e SNoS_ (SNoLev x1) -> (forall x6, SNo x6 -> x3 x5 x6 = x4 x5 x6)) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> x3 x1 x5 = x4 x1 x5) -> x0 x1 x2 x3 = x0 x1 x2 x4))) -> (forall x1, SNo x1 -> (forall x2 x3 : set -> set -> set, (forall x4, x4 :e SNoS_ (SNoLev x1) -> x2 x4 = x3 x4) -> (forall x4, SNo x4 -> (forall x5 x6 : set -> set, (forall x7, x7 :e SNoS_ (SNoLev x4) -> x5 x7 = x6 x7) -> x0 x1 x4 (fun x8 x9 : set => If_i (x8 = x1) (x5 x9) (x2 x8 x9)) = x0 x1 x4 (fun x8 x9 : set => If_i (x8 = x1) (x6 x9) (x3 x8 x9))))))).
admit.
Qed.
Theorem SNo_rec2_eq_1 : (forall x0 : set -> set -> (set -> set -> set) -> set, (forall x1, SNo x1 -> (forall x2, SNo x2 -> (forall x3 x4 : set -> set -> set, (forall x5, x5 :e SNoS_ (SNoLev x1) -> (forall x6, SNo x6 -> x3 x5 x6 = x4 x5 x6)) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> x3 x1 x5 = x4 x1 x5) -> x0 x1 x2 x3 = x0 x1 x2 x4))) -> (forall x1, SNo x1 -> (forall x2 : set -> set -> set, forall x3, SNo x3 -> SNo_rec_i (fun x5 : set => fun x6 : set -> set => x0 x1 x5 (fun x7 x8 : set => If_i (x7 = x1) (x6 x8) (x2 x7 x8))) x3 = x0 x1 x3 (fun x5 x6 : set => If_i (x5 = x1) (SNo_rec_i (fun x7 : set => fun x8 : set -> set => x0 x1 x7 (fun x9 x10 : set => If_i (x9 = x1) (x8 x10) (x2 x9 x10))) x6) (x2 x5 x6))))).
admit.
Qed.
Definition SNo_rec2 : (set -> set -> (set -> set -> set) -> set) -> set -> set -> set :=
 (fun x0 : set -> set -> (set -> set -> set) -> set => SNo_rec_ii (fun x1 : set => fun x2 : set -> set -> set => fun x3 : set => If_i (SNo x3) (SNo_rec_i (fun x4 : set => fun x5 : set -> set => x0 x1 x4 (fun x6 x7 : set => If_i (x6 = x1) (x5 x7) (x2 x6 x7))) x3) 0)).
Axiom ordinal_ind : (forall x0 : set -> prop, (forall x1, ordinal x1 -> (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, ordinal x1 -> x0 x1)).
Theorem SNo_rec2_eq : (forall x0 : set -> set -> (set -> set -> set) -> set, (forall x1, SNo x1 -> (forall x2, SNo x2 -> (forall x3 x4 : set -> set -> set, (forall x5, x5 :e SNoS_ (SNoLev x1) -> (forall x6, SNo x6 -> x3 x5 x6 = x4 x5 x6)) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> x3 x1 x5 = x4 x1 x5) -> x0 x1 x2 x3 = x0 x1 x2 x4))) -> (forall x1, SNo x1 -> (forall x2, SNo x2 -> SNo_rec2 x0 x1 x2 = x0 x1 x2 (SNo_rec2 x0)))).
admit.
Qed.
Theorem SNo_ordinal_ind : (forall x0 : set -> prop, (forall x1, ordinal x1 -> (forall x2, x2 :e SNoS_ x1 -> x0 x2)) -> (forall x1, SNo x1 -> x0 x1)).
admit.
Qed.
Theorem SNo_ordinal_ind2 : (forall x0 : set -> set -> prop, (forall x1, ordinal x1 -> (forall x2, ordinal x2 -> (forall x3, x3 :e SNoS_ x1 -> (forall x4, x4 :e SNoS_ x2 -> x0 x3 x4)))) -> (forall x1 x2, SNo x1 -> SNo x2 -> x0 x1 x2)).
admit.
Qed.
Theorem SNo_ordinal_ind3 : (forall x0 : set -> set -> set -> prop, (forall x1, ordinal x1 -> (forall x2, ordinal x2 -> (forall x3, ordinal x3 -> (forall x4, x4 :e SNoS_ x1 -> (forall x5, x5 :e SNoS_ x2 -> (forall x6, x6 :e SNoS_ x3 -> x0 x4 x5 x6)))))) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> x0 x1 x2 x3)).
admit.
Qed.
Theorem SNoLev_ind : (forall x0 : set -> prop, (forall x1, SNo x1 -> (forall x2, x2 :e SNoS_ (SNoLev x1) -> x0 x2) -> x0 x1) -> (forall x1, SNo x1 -> x0 x1)).
admit.
Qed.
Theorem SNoLev_ind2 : (forall x0 : set -> set -> prop, (forall x1 x2, SNo x1 -> SNo x2 -> (forall x3, x3 :e SNoS_ (SNoLev x1) -> x0 x3 x2) -> (forall x3, x3 :e SNoS_ (SNoLev x2) -> x0 x1 x3) -> (forall x3, x3 :e SNoS_ (SNoLev x1) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> x0 x3 x4)) -> x0 x1 x2) -> (forall x1 x2, SNo x1 -> SNo x2 -> x0 x1 x2)).
admit.
Qed.
Theorem SNoLev_ind3 : (forall x0 : set -> set -> set -> prop, (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> x0 x4 x2 x3) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> x0 x1 x4 x3) -> (forall x4, x4 :e SNoS_ (SNoLev x3) -> x0 x1 x2 x4) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> x0 x4 x5 x3)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x4 x2 x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x2) -> (forall x5, x5 :e SNoS_ (SNoLev x3) -> x0 x1 x4 x5)) -> (forall x4, x4 :e SNoS_ (SNoLev x1) -> (forall x5, x5 :e SNoS_ (SNoLev x2) -> (forall x6, x6 :e SNoS_ (SNoLev x3) -> x0 x4 x5 x6))) -> x0 x1 x2 x3) -> (forall x1 x2 x3, SNo x1 -> SNo x2 -> SNo x3 -> x0 x1 x2 x3)).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_1 : nat_p 1.
Theorem SNo_1 : SNo 1.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Theorem SNo_2 : SNo 2.
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom omega_ordinal : ordinal omega.
Theorem SNo_omega : SNo omega.
admit.
Qed.
Axiom ordinal_1 : ordinal 1.
Axiom In_0_1 : 0 :e 1.
Theorem SNoLt_0_1 : SNoLt 0 1.
admit.
Qed.
Axiom ordinal_2 : ordinal 2.
Axiom In_0_2 : 0 :e 2.
Theorem SNoLt_0_2 : SNoLt 0 2.
admit.
Qed.
Axiom In_1_2 : 1 :e 2.
Theorem SNoLt_1_2 : SNoLt 1 2.
admit.
Qed.
Definition minus_SNo : set -> set :=
 SNo_rec_i (fun x0 : set => fun x1 : set -> set => SNoCut (Repl (SNoR x0) x1) (Repl (SNoL x0) x1)).
Axiom ReplEq_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Repl x0 x1 = Repl x0 x2).
Axiom SNoL_SNoS : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> x1 :e SNoS_ (SNoLev x0))).
Axiom SNoR_SNoS : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> x1 :e SNoS_ (SNoLev x0))).
Theorem minus_SNo_eq : (forall x0, SNo x0 -> minus_SNo x0 = SNoCut (Repl (SNoR x0) minus_SNo) (Repl (SNoL x0) minus_SNo)).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom SNoCutP_SNoCut_R : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x1 -> SNoLt (SNoCut x0 x1) x2)).
Axiom SNoCutP_SNoCut_L : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, x2 :e x0 -> SNoLt x2 (SNoCut x0 x1))).
Axiom SNoCutP_SNo_SNoCut : (forall x0 x1, SNoCutP x0 x1 -> SNo (SNoCut x0 x1)).
Axiom SNoLev_prop : (forall x0, SNo x0 -> and (ordinal (SNoLev x0)) (SNo_ (SNoLev x0) x0)).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Theorem minus_SNo_prop1 : (forall x0, SNo x0 -> and (and (and (SNo (minus_SNo x0)) (forall x1, x1 :e SNoL x0 -> SNoLt (minus_SNo x0) (minus_SNo x1))) (forall x1, x1 :e SNoR x0 -> SNoLt (minus_SNo x1) (minus_SNo x0))) (SNoCutP (Repl (SNoR x0) minus_SNo) (Repl (SNoL x0) minus_SNo))).
admit.
Qed.
Theorem SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
admit.
Qed.
Theorem minus_SNo_Lt_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> SNoLt (minus_SNo x1) (minus_SNo x0)).
admit.
Qed.
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Theorem minus_SNo_Le_contra : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> SNoLe (minus_SNo x1) (minus_SNo x0)).
admit.
Qed.
Theorem minus_SNo_SNoCutP : (forall x0, SNo x0 -> SNoCutP (Repl (SNoR x0) minus_SNo) (Repl (SNoL x0) minus_SNo)).
admit.
Qed.
Theorem minus_SNo_SNoCutP_gen : (forall x0 x1, SNoCutP x0 x1 -> SNoCutP (Repl x1 minus_SNo) (Repl x0 minus_SNo)).
admit.
Qed.
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom famunionE : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 :e x1 x4) -> x3) -> x3)).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Axiom ordinal_ordsucc_In_eq : (forall x0 x1, ordinal x0 -> x1 :e x0 -> or (ordsucc x1 :e x0) (x0 = ordsucc x1)).
Axiom ordinal_binunion : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binunion x0 x1)).
Axiom ordinal_famunion : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> ordinal (x1 x2)) -> ordinal (famunion x0 x1)).
Theorem minus_SNo_Lev_lem1 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> SNoLev (minus_SNo x1) c= SNoLev x1)).
admit.
Qed.
Theorem minus_SNo_Lev_lem2 : (forall x0, SNo x0 -> SNoLev (minus_SNo x0) c= SNoLev x0).
admit.
Qed.
Axiom SNo_ind : (forall x0 : set -> prop, (forall x1 x2, SNoCutP x1 x2 -> (forall x3, x3 :e x1 -> x0 x3) -> (forall x3, x3 :e x2 -> x0 x3) -> x0 (SNoCut x1 x2)) -> (forall x1, SNo x1 -> x0 x1)).
Axiom SNo_eq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 = SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> x0 = x1).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom SNoCutP_SNoCut_fst : (forall x0 x1, SNoCutP x0 x1 -> (forall x2, SNo x2 -> (forall x3, x3 :e x0 -> SNoLt x3 x2) -> (forall x3, x3 :e x1 -> SNoLt x2 x3) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x2) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x2))).
Theorem minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
admit.
Qed.
Theorem minus_SNo_Lev : (forall x0, SNo x0 -> SNoLev (minus_SNo x0) = SNoLev x0).
admit.
Qed.
Axiom SNoLev_uniq2 : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNoLev x1 = x0)).
Axiom SNo_SNo : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNo x1)).
Theorem minus_SNo_SNo_ : (forall x0, ordinal x0 -> (forall x1, SNo_ x0 x1 -> SNo_ x0 (minus_SNo x1))).
admit.
Qed.
Theorem minus_SNo_SNoS_ : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> minus_SNo x1 :e SNoS_ x0)).
admit.
Qed.
Theorem minus_SNoCut_eq_lem : (forall x0, SNo x0 -> (forall x1 x2, SNoCutP x1 x2 -> x0 = SNoCut x1 x2 -> minus_SNo x0 = SNoCut (Repl x2 minus_SNo) (Repl x1 minus_SNo))).
admit.
Qed.
Theorem minus_SNoCut_eq : (forall x0 x1, SNoCutP x0 x1 -> minus_SNo (SNoCut x0 x1) = SNoCut (Repl x1 minus_SNo) (Repl x0 minus_SNo)).
admit.
Qed.
Theorem minus_SNo_Lt_contra1 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) x1 -> SNoLt (minus_SNo x1) x0).
admit.
Qed.
Theorem minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
admit.
Qed.
Theorem minus_SNo_Lt_contra3 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt (minus_SNo x0) (minus_SNo x1) -> SNoLt x1 x0).
admit.
Qed.
Theorem SNo_momega : SNo (minus_SNo omega).
admit.
Qed.
Theorem mordinal_SNo : (forall x0, ordinal x0 -> SNo (minus_SNo x0)).
admit.
Qed.
Theorem mordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev (minus_SNo x0) = x0).
admit.
Qed.
Theorem mordinal_SNoLev_min : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e x0 -> SNoLt (minus_SNo x0) x1)).
admit.
Qed.
Theorem mordinal_SNoLev_min_2 : (forall x0, ordinal x0 -> (forall x1, SNo x1 -> SNoLev x1 :e ordsucc x0 -> SNoLe (minus_SNo x0) x1)).
admit.
Qed.
Definition add_SNo : set -> set -> set :=
 SNo_rec2 (fun x0 x1 : set => fun x2 : set -> set -> set => SNoCut (binunion {x2 x3 x1 | x3 :e SNoL x0} (Repl (SNoL x1) (x2 x0))) (binunion {x2 x3 x1 | x3 :e SNoR x0} (Repl (SNoR x1) (x2 x0)))).
Theorem add_SNo_eq : (forall x0, SNo x0 -> (forall x1, SNo x1 -> add_SNo x0 x1 = SNoCut (binunion {add_SNo x3 x1 | x3 :e SNoL x0} (Repl (SNoL x1) (add_SNo x0))) (binunion {add_SNo x3 x1 | x3 :e SNoR x0} (Repl (SNoR x1) (add_SNo x0))))).
admit.
Qed.
(* Parameter setprod "ecef5cea93b11859a42b1ea5e8a89184202761217017f3a5cdce1b91d10b34a7" "fc0b600a21afd76820f1fb74092d9aa81687f3b0199e9b493dafd3e283c6e8ca" *)
Parameter setprod : set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition mul_SNo : set -> set -> set :=
 SNo_rec2 (fun x0 x1 : set => fun x2 : set -> set -> set => SNoCut (binunion {add_SNo (x2 (ap x3 0) x1) (add_SNo (x2 x0 (ap x3 1)) (minus_SNo (x2 (ap x3 0) (ap x3 1)))) | x3 :e setprod (SNoL x0) (SNoL x1)} {add_SNo (x2 (ap x3 0) x1) (add_SNo (x2 x0 (ap x3 1)) (minus_SNo (x2 (ap x3 0) (ap x3 1)))) | x3 :e setprod (SNoR x0) (SNoR x1)}) (binunion {add_SNo (x2 (ap x3 0) x1) (add_SNo (x2 x0 (ap x3 1)) (minus_SNo (x2 (ap x3 0) (ap x3 1)))) | x3 :e setprod (SNoL x0) (SNoR x1)} {add_SNo (x2 (ap x3 0) x1) (add_SNo (x2 x0 (ap x3 1)) (minus_SNo (x2 (ap x3 0) (ap x3 1)))) | x3 :e setprod (SNoR x0) (SNoL x1)})).
Axiom ReplEq_setprod_ext : (forall x0 x1, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x0 -> (forall x5, x5 :e x1 -> x2 x4 x5 = x3 x4 x5)) -> {x2 (ap x5 0) (ap x5 1) | x5 :e setprod x0 x1} = {x3 (ap x5 0) (ap x5 1) | x5 :e setprod x0 x1}).
Theorem mul_SNo_eq : (forall x0, SNo x0 -> (forall x1, SNo x1 -> mul_SNo x0 x1 = SNoCut (binunion {add_SNo (mul_SNo (ap x3 0) x1) (add_SNo (mul_SNo x0 (ap x3 1)) (minus_SNo (mul_SNo (ap x3 0) (ap x3 1)))) | x3 :e setprod (SNoL x0) (SNoL x1)} {add_SNo (mul_SNo (ap x3 0) x1) (add_SNo (mul_SNo x0 (ap x3 1)) (minus_SNo (mul_SNo (ap x3 0) (ap x3 1)))) | x3 :e setprod (SNoR x0) (SNoR x1)}) (binunion {add_SNo (mul_SNo (ap x3 0) x1) (add_SNo (mul_SNo x0 (ap x3 1)) (minus_SNo (mul_SNo (ap x3 0) (ap x3 1)))) | x3 :e setprod (SNoL x0) (SNoR x1)} {add_SNo (mul_SNo (ap x3 0) x1) (add_SNo (mul_SNo x0 (ap x3 1)) (minus_SNo (mul_SNo (ap x3 0) (ap x3 1)))) | x3 :e setprod (SNoR x0) (SNoL x1)}))).
admit.
Qed.
(* Parameter explicit_Reals "e5dee14fc7a24a63555de85859904de8dc1b462044060d68dbb06cc9a590bc38" "2c81615a11c9e3e301f3301ec7862ba122acea20bfe1c120f7bdaf5a2e18faf4" *)
Parameter explicit_Reals : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Definition Eps_i_realset : set :=
 Eps_i (fun x0 : set => and (forall x1, x1 :e x0 -> SNo x1) (explicit_Reals x0 0 1 add_SNo mul_SNo SNoLe)).
