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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_ind : (forall x0 : set -> prop, (forall x1, (forall x2, x2 :e x1 -> x0 x2) -> x0 x1) -> (forall x1, x0 x1)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_c305b585b05bbd5dfb1f2334fba160b28fdb98c88197eae477bd0e829ec1b7cd : (forall x0 x1, x1 :e x0 -> (forall x2 : prop, (forall x3, and (x3 :e x0) (not (forall x4 : prop, (forall x5, and (x5 :e x0) (x5 :e x3) -> x4) -> x4)) -> x2) -> x2)).
admit.
Qed.
(* Parameter In_rec_i "f97da687c51f5a332ff57562bd465232bc70c9165b0afe0a54e6440fc4962a9f" "fac413e747a57408ad38b3855d3cde8673f86206e95ccdadff2b5babaf0c219e" *)
Parameter In_rec_i : (set -> (set -> set) -> set) -> set -> set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Definition missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf : set -> set :=
 In_rec_i (fun x0 : set => fun x1 : set -> set => famunion x0 (fun x2 : set => Power (x1 x2))).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom In_rec_i_eq : (forall x0 : set -> (set -> set) -> set, (forall x1, forall x2 x3 : set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x2 = x0 x1 x3) -> (forall x1, forall x2 : set -> set -> prop, x2 (In_rec_i x0 x1) (x0 x1 (In_rec_i x0)) -> x2 (x0 x1 (In_rec_i x0)) (In_rec_i x0 x1))).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom famunionE : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 :e x1 x4) -> x3) -> x3)).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Theorem missingprop_77708815688387487d46759015e8dc1122eb2b11512b7e863b71bd5766373ac2 : (forall x0, forall x1 : set -> set -> prop, x1 (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0) (famunion x0 (fun x2 : set => Power (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x2))) -> x1 (famunion x0 (fun x2 : set => Power (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x2))) (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0)).
admit.
Qed.
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Theorem missingprop_856202227663a7384742dc6bba3673dc892bfc4b6d3834fa9894b267ed5aae7f : (forall x0 x1 x2, x1 :e x2 -> x0 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1 -> x0 :e missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x2).
admit.
Qed.
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Theorem missingprop_c6c238a976a8cfe57fcb1a7ecc2638e33639e3089a299d3ad97cef4f64369969 : (forall x0 x1, x0 :e missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1 -> (forall x2 : prop, (forall x3, x3 :e x1 -> x0 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x3 -> x2) -> x2)).
admit.
Qed.
Theorem missingprop_06cccafef56ba4ef04f1cbcd382a741df5375da3acf8dbab87c2b553c207b33e : (forall x0, x0 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0).
admit.
Qed.
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Theorem missingprop_c9fa8cc68515b34acdd852a1c7b64bec9afb687a3125cbedc1e8f258a3983c46 : (forall x0 x1, x0 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1 -> missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1).
admit.
Qed.
Theorem missingprop_adcd37976725e08ab1d05bdb04235c1ac2c55fd011d6a45942c71d7b77a341fb : (forall x0 x1, x0 :e missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1 -> missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0 :e missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_d307a2a2340065e73fe41f59948b4634434ac402fe77bfaeef64f120a861811b : (forall x0 x1, or (x0 :e missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1) (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0)).
admit.
Qed.
Theorem missingprop_d0ac36fed39f10dd0958f4d9fc10063fbd7d21dea9cf4ae53ff1e4316e28d6a5 : (forall x0 x1, or (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0 :e missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1) (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0)).
admit.
Qed.
Definition missingname_44fffa9cd14d62b903e0e2fa41f10dc7497a4e85861653de232a8206f787e5b1 : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1 :e x0).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
(* Parameter ZF_closed "43f34d6a2314b56cb12bf5cf84f271f3f02a3e68417b09404cc73152523dbfa0" "1bd4aa0ec0b5e627dce9a8a1ddae929e58109ccbb6f4bb3d08614abf740280c0" *)
Parameter ZF_closed : set -> prop.
(* Parameter Union_closed "54850182033d0575e98bc2b12aa8b9baaa7a541e9d5abc7fddeb74fc5d0a19ac" "57561da78767379e0c78b7935a6858f63c7c4be20fe81fe487471b6f2b30c085" *)
Parameter Union_closed : set -> prop.
Definition Power_closed : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> Power x1 :e x0).
Definition Repl_closed : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> Repl x1 x2 :e x0)).
Axiom ZF_closed_E : (forall x0, ZF_closed x0 -> (forall x1 : prop, (Union_closed x0 -> Power_closed x0 -> Repl_closed x0 -> x1) -> x1)).
Definition missingname_caf77a9d03a55ac210982b45133e78c616ab36004eb6ecb2e934df299c57d151 : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> famunion x1 x2 :e x0)).
Axiom missingprop_35501a83bb6c9c59dcb9d44470dcdf3c218c38f27dfa8ed8220429e4939efed1 : (forall x0, Union_closed x0 -> Repl_closed x0 -> missingname_caf77a9d03a55ac210982b45133e78c616ab36004eb6ecb2e934df299c57d151 x0).
Theorem missingprop_ff9cb4465fdfc09664beb6cd5648ca1236ea979d1bc7eff29f856127bb6bc2f5 : (forall x0, TransSet x0 -> ZF_closed x0 -> missingname_44fffa9cd14d62b903e0e2fa41f10dc7497a4e85861653de232a8206f787e5b1 x0).
admit.
Qed.
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom bij_inv : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> bij x1 x0 (inv x0 x2)).
Axiom or3E : (forall x0 x1 x2 : prop, or (or x0 x1) x2 -> (forall x3 : prop, (x0 -> x3) -> (x1 -> x3) -> (x2 -> x3) -> x3)).
Axiom ordinal_trichotomy_or : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (or (x0 :e x1) (x0 = x1)) (x1 :e x0)).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set -> (set -> prop) -> (set -> set) -> set.
Axiom ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
Axiom ReplSepI : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e x0 -> x1 x3 -> x2 x3 :e ReplSep x0 x1 x2).
Axiom pred_ext_2 : (forall x0 x1 : set -> prop, (forall x2, x0 x2 -> x1 x2) -> (forall x2, x1 x2 -> x0 x2) -> x0 = x1).
Theorem missingprop_8aa7657fa5622ce8ea42575ca99c1d0d9604f240329a5f6ac37820313448e073 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 c= x0 -> nIn x1 x0 -> (forall x2 : prop, (forall x3 : set -> set, bij (Sep x0 ordinal) x1 x3 -> x2) -> x2))).
admit.
Qed.
Axiom UnivOf_ZF_closed : (forall x0, ZF_closed (UnivOf x0)).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom UnivOf_In : (forall x0, x0 :e UnivOf x0).
Axiom UnivOf_TransSet : (forall x0, TransSet (UnivOf x0)).
Axiom bij_comp : (forall x0 x1 x2, forall x3 x4 : set -> set, bij x0 x1 x3 -> bij x1 x2 x4 -> bij x0 x2 (fun x5 : set => x4 (x3 x5))).
Axiom Subq_ref : (forall x0, x0 c= x0).
Theorem missingprop_605d8076e17bbfe030d7513ab337c136ea241ca471e77df333e4c78ec0bc3f99 : (forall x0, forall x1 : prop, (forall x2, and (and (and (x0 :e x2) (forall x3, x3 :e x2 -> (forall x4, x4 c= x3 -> x4 :e x2))) (forall x3, x3 :e x2 -> (forall x4 : prop, (forall x5, and (x5 :e x2) (forall x6, x6 c= x3 -> x6 :e x5) -> x4) -> x4))) (forall x3, x3 c= x2 -> or (forall x4 : prop, (forall x5 : set -> set, bij x3 x2 x5 -> x4) -> x4) (x3 :e x2)) -> x1) -> x1).
admit.
Qed.
Theorem missingprop_5010201a6e1d38348477b9de5ff66e9d31670bdeefdbe08b8723a3d6e30b48d2 : (forall x0, nIn x0 (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0)).
admit.
Qed.
Theorem missingprop_c55110364b74e9a3c51d2a5bfc918bb5637940e828376ec53262bed9ede80fd0 : (forall x0, forall x1 : set -> set -> prop, x1 (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0)) (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0) -> x1 (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0) (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0))).
admit.
Qed.
Theorem missingprop_b71c1c4b64b455897ea2cce1bd95497104c082f1b30b0898f5c21565dc727f62 : (forall x0 x1, x0 :e x1 -> missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0 :e missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x1).
admit.
Qed.
Theorem missingprop_2db13168d0906b1c33dd9956e4244fb20fdb495d0c65d9833035772e7d401c89 : (forall x0, TransSet (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0)).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_283f8fc5ea1a3c99f01ef684040d36f3b3e77f532f79e28eeabcc4dccf9b7028 : (forall x0 x1, x1 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0 -> x1 :e missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (ordsucc x0)).
admit.
Qed.
Definition missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 : set -> set :=
 (fun x0 : set => Sep (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0) ordinal).
Theorem missingprop_1ec7349a6007c1951cbc9535ca5769b83316f6778bed19ab211854c4c6028c5d : (forall x0, ordinal (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0)).
admit.
Qed.
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Theorem missingprop_24ba76162cbabacbe8136cf5d6f6295437383ecf4b3946427a5b4b7d60ed1941 : (forall x0 x1, x0 :e x1 -> missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0 :e missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x1).
admit.
Qed.
Theorem missingprop_a46e3f29f0505d8b2549f05a18f5fff3e8bdc4fbfc9cead586df3df4d3214349 : (forall x0, forall x1 : set -> set -> prop, x1 (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0)) (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0) -> x1 (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf x0) (missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0))).
admit.
Qed.
Theorem missingprop_95d35b66148fac205bbd80421700c0ee1a50bf530f9c2d4f8a95bcdf6f6dc72d : (forall x0, x0 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0)).
admit.
Qed.
(* Parameter Inj1 "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" "8f0026627bca968c807e91fff0fdc318bc60691e5ae497542f92c8e85be9fd7d" *)
Parameter Inj1 : set -> set.
Axiom Inj1E : (forall x0 x1, x1 :e Inj1 x0 -> or (x1 = 0) (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 = Inj1 x3) -> x2) -> x2)).
Axiom Subq_Empty : (forall x0, 0 c= x0).
Axiom ordinal_ordsucc_In : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Theorem missingprop_7520792d9c4001bd88f3e8a251d89ba23341c4c0a08e5856d9d9558b1998ce5c : (forall x0, Inj1 x0 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (ordsucc (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0))).
admit.
Qed.
(* Parameter Inj0 "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" "8143218ffde429ff34b20ee5c938914c75e40d59cd52cc5db4114971d231ca73" *)
Parameter Inj0 : set -> set.
Axiom Inj0E : (forall x0 x1, x1 :e Inj0 x0 -> (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 = Inj1 x3) -> x2) -> x2)).
Theorem missingprop_c073b14b7a96e69e7e8f5a1fe3901014c36ac527c42f83bf6876840b11d83588 : (forall x0, Inj0 x0 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (ordsucc (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0))).
admit.
Qed.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Axiom setsum_Inj_inv : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = Inj0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = Inj1 x4) -> x3) -> x3)).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom ordinal_binunion : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binunion x0 x1)).
Theorem missingprop_777c77f22b29f6f8c2e6d97adb732f86ed83246887d8d67f81eae5d41628c7a2 : (forall x0 x1, setsum x0 x1 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (ordsucc (binunion (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0) (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x1)))).
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Axiom lamE : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, and (x6 :e x1 x4) (x2 = setsum x4 x6) -> x5) -> x5) -> x3) -> x3)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom ordinal_linear : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 c= x1) (x1 c= x0)).
Axiom Subq_binunion_eq : (forall x0 x1, forall x2 : prop -> prop -> prop, x2 (x0 c= x1) (binunion x0 x1 = x1) -> x2 (binunion x0 x1 = x1) (x0 c= x1)).
Axiom binunion_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binunion x0 x1) (binunion x1 x0) -> x2 (binunion x1 x0) (binunion x0 x1)).
Theorem missingprop_28964ee8cad97b0e7f84687c91ac3b2c14907ff8ade27945336d88e3a0d67591 : (forall x0, forall x1 : set -> set, lam x0 x1 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (ordsucc (binunion (ordsucc (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0)) (famunion x0 (fun x2 : set => ordsucc (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 (x1 x2))))))).
admit.
Qed.
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom ordinal_ordsucc : (forall x0, ordinal x0 -> ordinal (ordsucc x0)).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Theorem missingprop_7efa9b0eb4a7672f89f79f79d5dfd89fdd189d47f4be668ddc1bdc4223ecb821 : (forall x0 x1, ordinal x0 -> ordinal x1 -> x0 c= x1 -> ordsucc x0 c= ordsucc x1).
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
Axiom binunion_Subq_1 : (forall x0 x1, x0 c= binunion x0 x1).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom binunion_Subq_2 : (forall x0 x1, x1 c= binunion x0 x1).
Axiom ordinal_famunion : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> ordinal (x1 x2)) -> ordinal (famunion x0 x1)).
Theorem missingprop_072fc083e59b2e292e88518ac4d140df6c962eb5d35ed00edb6f43d3f5cf8a07 : (forall x0, forall x1 : set -> set, Pi x0 x1 c= missingname_7864bcf70cc3cdb856575a33e936cf0af667634490f6123fa1f736ddfe565bcf (ordsucc (ordsucc (binunion (ordsucc (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 x0)) (famunion x0 (fun x2 : set => ordsucc (missingname_73393e5f1211b9bcd1d886a64ebcb67e8a792a73c3f84a19ac624799852bf120 (x1 x2)))))))).
admit.
Qed.
