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
Definition Church17_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x9) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x10) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x11) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x12) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x13) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> x1 x0).
Theorem missingprop_e6619adff47bbbf90a12e5475c1b155ebb1e2991a2d17411fd40e422e21ff562 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x0).
admit.
Qed.
Theorem missingprop_93ed18843f4a06fdb1762e5b7fc89edc8da24a5d38de418508f9aca3fe120f8f : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x1).
admit.
Qed.
Theorem missingprop_233906471c2a36e258793125988364b5b4be5e26b5df943569d8a15ce4c97b59 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x2).
admit.
Qed.
Theorem missingprop_497df65ae9348f62989259dc92fffa35cd477d735ac36c17e9f5dc63bcd5da15 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x3).
admit.
Qed.
Theorem missingprop_aeac4ee3d08fd60f864a3d40a6422b2070323f5bdb4e126705e59ff4ccf8fa26 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4).
admit.
Qed.
Theorem missingprop_398a24facf4ebb42cf838f8cb0f1d64c4d83d480adfd36e0fa2e0b1bde52df48 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x5).
admit.
Qed.
Theorem missingprop_8422ea19f7ca229a936fab0e3a1aadb25110b62375b34ff2715e426e6903f401 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x6).
admit.
Qed.
Theorem missingprop_d792dc995f6520052dfc965493173e3531c29f8140df360fa3c27b7268ed80b5 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x7).
admit.
Qed.
Theorem missingprop_c37600b80efb18922b2424c0ae3622d88c262b6e7e6fb3aa0f6bc2b0ba9f1be7 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x8).
admit.
Qed.
Theorem missingprop_7fcbe5b61ad12e38a6853aaa6fe3dd0299d75fe061e77a480a4e344498540b83 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x9).
admit.
Qed.
Theorem missingprop_3de64cc15c614d92c317d5d39969a651d867528244eff253971f4e6ee88dced0 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x10).
admit.
Qed.
Theorem missingprop_6a85fd1fad00f32e7f8e46dd1246f3ab13554caed4c219f40087b53560da85b2 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11).
admit.
Qed.
Theorem missingprop_744a4c03b09434f04174e938301dc04f0c3f10e622d7fdbe408752834fe5b003 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x12).
admit.
Qed.
Theorem missingprop_d664e656d766635177b954bb19d911f5792a5b476afc9d95f66c535e94450d07 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x13).
admit.
Qed.
Theorem missingprop_5749399996f8b07d8783c347f0cf6e04806eba2f6eba6fb3456b8e9db2686cda : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x14).
admit.
Qed.
Theorem missingprop_9c9197f88eaab6add22634c2b7df334297862a6da7753d0d08affb6802924e7f : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x15).
admit.
Qed.
Theorem missingprop_65d5ff984a67d49c14142f780ead671595b0d7535fbc96a800a59481ec6515c0 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x16).
admit.
Qed.
Definition TwoRamseyGraph_4_4_Church17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2) (x1 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2) (x1 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3) (x1 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2) (x1 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3) (x1 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3) (x1 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3) (x1 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2) (x1 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2) (x1 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3 x3) (x1 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3 x3) (x1 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2 x3) (x1 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2 x3) (x1 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x2) (x1 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2) (x1 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x2 x3 x2 x2 x3)).
Theorem missingprop_2d0dd19e1c0a258a2529c195b95e46781be917063ddea5518ce9697c88c0f43f : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> TwoRamseyGraph_4_4_Church17 x0 x1 = TwoRamseyGraph_4_4_Church17 x1 x0).
admit.
Qed.
Definition Church17_perm_1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x0 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x1).
Theorem missingprop_c107befd219610df13216c99814a5a38dd146d792dcf71954929586840322352 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p (Church17_perm_1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0 x0)).
admit.
Qed.
Theorem missingprop_031e872d24e24793386d1ae2b490f91241250f040520ac6f6b9a9bb67aa50a91 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> TwoRamseyGraph_4_4_Church17 x0 x1 = TwoRamseyGraph_4_4_Church17 (Church17_perm_1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0 x0) (Church17_perm_1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0 x1)).
admit.
Qed.
Definition Church17_perm_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0_1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x0 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x1 x2).
Theorem missingprop_c701617b4ea2a4435d06f5616bb5dcf2c8679adeb9caeece6aaae4d50848325b : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p (Church17_perm_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0_1 x0)).
admit.
Qed.
Theorem missingprop_e10004408ade0617daf90d6366b0b5a53d1d35fea3d1d932b59ac741c0421ede : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> TwoRamseyGraph_4_4_Church17 x0 x1 = TwoRamseyGraph_4_4_Church17 (Church17_perm_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0_1 x0) (Church17_perm_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0_1 x1)).
admit.
Qed.
Definition Church17_perm_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0_1_2 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x0 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x1 x2 x3).
Theorem missingprop_b1922ece7a1fb1a196799cbd7d7663c34c5510e13389b98960ea1317732fcdfb : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p (Church17_perm_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0_1_2 x0)).
admit.
Qed.
Theorem missingprop_c091fc5c7a76fb9d30b51d6b62242fe7824e43b6107ba5881d7f73b26072bbd8 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> TwoRamseyGraph_4_4_Church17 x0 x1 = TwoRamseyGraph_4_4_Church17 (Church17_perm_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0_1_2 x0) (Church17_perm_3_4_5_6_7_8_9_10_11_12_13_14_15_16_0_1_2 x1)).
admit.
Qed.
