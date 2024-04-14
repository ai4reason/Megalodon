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
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
Definition u7 : set :=
 ordsucc u6.
Definition u8 : set :=
 ordsucc u7.
Definition u9 : set :=
 ordsucc u8.
Definition u10 : set :=
 ordsucc u9.
Definition u11 : set :=
 ordsucc u10.
Definition u12 : set :=
 ordsucc u11.
(* Parameter Church17_to_u17 "22f45af3c10db238bb5d9aa702e24179a9c1a79a5635eeec0be511465bc55bf4" "21bb26399802c128b4a27a6184c81e80a2bb391015d712920b939216289ef0b6" *)
Parameter Church17_to_u17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set.
Definition Church17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x0 x2 x4 x1 x3 x6 x8 x5 x7 x11 x9 x12 x10 x14 x15 x16 x13).
(* Parameter u17_to_Church17 "2198544dc93adcfb7a0840e80ac836eba8457b7bbb3ccbbb3bc46e9112667304" "02709d69b879f00cff710051a82db11b456805f2bfe835c5d14f8c542276ac60" *)
Parameter u17_to_Church17 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set.
Definition u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 : set -> set :=
 (fun x0 : set => Church17_to_u17 (Church17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 (u17_to_Church17 x0))).
Axiom missingprop_a36df829fd5ae696643b1cd180c001e7c72018b0aade2c8b02a3beb191bf4447 : (forall x0, x0 :e u12 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 x0)).
Axiom missingprop_ddfd049a99d8a8d08a5969e20f08be40e16f962ab49dd05ba7dcd1cfd68e7645 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 0 = u1.
Axiom missingprop_b1b74a38cb206cf70f2e2bbc4ccd3cbdbf8c8df3defd64ff8c8a7258b3a2047a : 1 :e 12.
Axiom missingprop_3ce04bff2a395cf5fe0b94d0636cc8dbea0e46272d1360d7109558a625b43849 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u1 = u3.
Axiom missingprop_cf5ceb5c8b16071a67f4b018bbc8955118e3633f8bcf650790850107ad2027ee : 3 :e 12.
Axiom missingprop_5f23a09617e395d3412bcd886825a830fcbca9dbfaa3bb762a6b0286bbba2699 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u2 = 0.
Axiom missingprop_a2ef0c58cfd090f3c9e6e7916f6b56032d6bdd4de509aa9fb32f7308f99daf5a : 0 :e 12.
Axiom missingprop_2deda5cc0874f100e0fcd31fbab30140488390c1e46b9b2da484e79975ce6ae8 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u3 = u2.
Axiom missingprop_987ba5536dee4e8ff190eaeed4d2bb3ab5d85c45e6623acb29ce14f019a19681 : 2 :e 12.
Axiom missingprop_d02d672c88891239a2034f8db0a8f9c766e8b44a6127d48b08a622cce7dc65fa : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u4 = u5.
Axiom missingprop_75d836f404cbbeae78f524a2ea7f26282023039d9accd25589aa1c1720bb8121 : 5 :e 12.
Axiom missingprop_b4b0b30bf8e5ff91ed4869311536b86e18ba1e4d9dcdabf73d46693ed9a5b67b : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u5 = u7.
Axiom missingprop_a31357c4255c39823e518ff3fc8fa06c75e6252111ceae22b3d4f1c89a01d10b : 7 :e 12.
Axiom missingprop_8a85de05c64795068871a87d3b06ba1e5395c94812285b09588df3e01a1e0ea3 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u6 = u4.
Axiom missingprop_4fce167ccdcc7fb45429dcf8a3db15dc462c457fe760841310c58bc94a706ed3 : 4 :e 12.
Axiom missingprop_c0eb4e3448ef31f6408883194d369de2b67b2c3b8eb9ad88a4d52d9ee850a560 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u7 = u6.
Axiom missingprop_73e4e62694bfb193433658c654297b6ed3eb985937a9e426b510b83e68de24d1 : 6 :e 12.
Axiom missingprop_f74f5074ad12d57b1f85300d32210524157b09a0919ee38128acf015331c35f0 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u8 = u10.
Axiom missingprop_e58cb2c6f977d1b0d5350ed902991ead1b80327bc1b160612a3fd1cd20c9fd3b : 10 :e 12.
Axiom missingprop_4e46240fa21fb39b84708f415e3b21cc616773a08b926976627048ab8fc29078 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u9 = u8.
Axiom missingprop_89f074e5696e72c1d0b8f6c7a30d07f4920551bfce89ff386ae0ecf5a82d48e4 : 8 :e 12.
Axiom missingprop_29ccb5c4e7950928d647b0941425c5e64d69ebaaed74cba3c055174a14ae4c5b : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u10 = u11.
Axiom missingprop_2e87f3f906df12d03519748b94abd9f72cc673eb197d25aaf167a3737a0cc14b : 11 :e 12.
Axiom missingprop_9b334a439f93d75505077dcc1fe4c60157a3105589338dee138085e931431815 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u11 = u9.
Axiom missingprop_2453a2b3484043c8ce568faca0a1096a3c2d75e863532a7d5d6a9f964c17a76f : 9 :e 12.
Theorem missingprop_b12bb4463d091b1cd992428972a90829208a78c99e502cb179137d8ffeb2e9ed : (forall x0, x0 :e u12 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0 :e u12).
admit.
Qed.
Definition u13 : set :=
 ordsucc u12.
Definition u14 : set :=
 ordsucc u13.
Definition u15 : set :=
 ordsucc u14.
Definition u16 : set :=
 ordsucc u15.
Axiom missingprop_ac5261da9745d31a8bb999158a58d18491f973a34391722145ebc7375438f7d8 : (forall x0, x0 :e u16 -> (forall x1, x1 :e u16 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0 = u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1 -> x0 = x1)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_0c825f2c7c09729d7ce0ddc2bcc1c1164def77499abc770e53acff066a542f42 : (forall x0, x0 :e u12 -> (forall x1, x1 :e u12 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0 = u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1 -> x0 = x1)).
admit.
Qed.
Definition u17 : set :=
 ordsucc u16.
Definition TwoRamseyGraph_3_6_Church17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x3 x2 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x2 x2 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x3 x2 x3 x3 x2 x3 x2 x2 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x2 x3 x3 x3 x3 x2 x2 x2 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x2 x2 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x2 x2 x3 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x2 x3 x3 x2 x2 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x2 x3 x3 x2 x3 x3 x3 x2) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x2) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x3 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x2) (x1 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x2 x2 x2 x2 x2)).
Definition TwoRamseyGraph_3_6_17 : set -> set -> prop :=
 (fun x0 x1 : set => x0 :e u17 -> x1 :e u17 -> TwoRamseyGraph_3_6_Church17 (u17_to_Church17 x0) (u17_to_Church17 x1) = (fun x3 x4 : set => x3)).
Axiom missingprop_eb89147c164e7772b9993a1a07efbab205c75659d97b53aefb43d03dfff3b8bf : (forall x0, x0 :e u16 -> (forall x1, x1 :e u16 -> TwoRamseyGraph_3_6_17 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0) (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1) -> TwoRamseyGraph_3_6_17 x0 x1)).
Theorem missingprop_fb7cd55890d92980315d122000898a4fa27d043f0a778e72117844d8898be28f : (forall x0, x0 :e u12 -> (forall x1, x1 :e u12 -> TwoRamseyGraph_3_6_17 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0) (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1) -> TwoRamseyGraph_3_6_17 x0 x1)).
admit.
Qed.
Axiom cases_8 : (forall x0, x0 :e 8 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 7 -> x1 x0)).
Axiom In_1_8 : 1 :e 8.
Axiom In_3_8 : 3 :e 8.
Axiom In_0_8 : 0 :e 8.
Axiom In_2_8 : 2 :e 8.
Axiom In_5_8 : 5 :e 8.
Axiom In_7_8 : 7 :e 8.
Axiom In_4_8 : 4 :e 8.
Axiom In_6_8 : 6 :e 8.
Theorem missingprop_4dd83877c91628321dcfcb597bdf66ec1611350bf87ea4c07b29caf4989ea4d4 : (forall x0, x0 :e u8 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0 :e u8).
admit.
Qed.
Theorem missingprop_5e4c26c29bf066e60e29e7907b352e8e4104834cd70475ed44f3c919fe71d021 : (forall x0, x0 :e u8 -> (forall x1, x1 :e u8 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0 = u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1 -> x0 = x1)).
admit.
Qed.
Theorem missingprop_6078fec069f21997061aa4b6413919b9b68bc2c8261a9c17cfc906fcbc2f9922 : (forall x0, x0 :e u8 -> (forall x1, x1 :e u8 -> TwoRamseyGraph_3_6_17 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0) (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1) -> TwoRamseyGraph_3_6_17 x0 x1)).
admit.
Qed.
Definition Church17_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x9) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x10) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x11) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x12) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x13) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> x1 x0).
Axiom missingprop_93ed18843f4a06fdb1762e5b7fc89edc8da24a5d38de418508f9aca3fe120f8f : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x1).
Axiom missingprop_497df65ae9348f62989259dc92fffa35cd477d735ac36c17e9f5dc63bcd5da15 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x3).
Axiom missingprop_e6619adff47bbbf90a12e5475c1b155ebb1e2991a2d17411fd40e422e21ff562 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x0).
Axiom missingprop_233906471c2a36e258793125988364b5b4be5e26b5df943569d8a15ce4c97b59 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x2).
Axiom missingprop_398a24facf4ebb42cf838f8cb0f1d64c4d83d480adfd36e0fa2e0b1bde52df48 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x5).
Axiom missingprop_d792dc995f6520052dfc965493173e3531c29f8140df360fa3c27b7268ed80b5 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x7).
Axiom missingprop_aeac4ee3d08fd60f864a3d40a6422b2070323f5bdb4e126705e59ff4ccf8fa26 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4).
Axiom missingprop_8422ea19f7ca229a936fab0e3a1aadb25110b62375b34ff2715e426e6903f401 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x6).
Axiom missingprop_3de64cc15c614d92c317d5d39969a651d867528244eff253971f4e6ee88dced0 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x10).
Axiom missingprop_c37600b80efb18922b2424c0ae3622d88c262b6e7e6fb3aa0f6bc2b0ba9f1be7 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x8).
Axiom missingprop_6a85fd1fad00f32e7f8e46dd1246f3ab13554caed4c219f40087b53560da85b2 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11).
Axiom missingprop_7fcbe5b61ad12e38a6853aaa6fe3dd0299d75fe061e77a480a4e344498540b83 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x9).
Axiom missingprop_d664e656d766635177b954bb19d911f5792a5b476afc9d95f66c535e94450d07 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x13).
Axiom missingprop_5749399996f8b07d8783c347f0cf6e04806eba2f6eba6fb3456b8e9db2686cda : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x14).
Axiom missingprop_9c9197f88eaab6add22634c2b7df334297862a6da7753d0d08affb6802924e7f : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x15).
Axiom missingprop_744a4c03b09434f04174e938301dc04f0c3f10e622d7fdbe408752834fe5b003 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x12).
Axiom missingprop_65d5ff984a67d49c14142f780ead671595b0d7535fbc96a800a59481ec6515c0 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x16).
Theorem missingprop_ab6e90e08cac98528b7a735e7b53e30c7970b36a1f906e2c6bc2d9edb6edf82f : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p (Church17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0)).
admit.
Qed.
Axiom missingprop_e902edb7e5c09f3911de6e6e7b47397939aa697886c0b6b7be0233b3765bcf65 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> u17_to_Church17 (Church17_to_u17 x0) = x0).
Axiom missingprop_f0f6d6a5e0bad31ef814582844f5581ef6b06897d8b34d179a5f11d6a4ff9407 : (forall x0, x0 :e u17 -> Church17_to_u17 (u17_to_Church17 x0) = x0).
Axiom missingprop_f44342ed74648c23c8734d945bc8b2c1af5a9cb594ef51477e7844cb71f944f8 : (forall x0, x0 :e u17 -> Church17_p (u17_to_Church17 x0)).
Theorem missingprop_6e747c16685bdb4eaee901f472b70c0f041f4106aa60440cc165be6e8835727d : (forall x0, x0 :e u16 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0))) = x0).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Axiom missingprop_6d92d1f1dc2442370b11e307d2507ca4f85754f5689757e7fe022101bb36e82e : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u12 -> x1 x2 :e u12) -> (forall x2, x2 :e u12 -> (forall x3, x3 :e u12 -> x1 x2 = x1 x3 -> x2 = x3)) -> (forall x2, x2 :e u12 -> (forall x3, x3 :e u12 -> x0 (x1 x2) (x1 x3) -> x0 x2 x3)) -> x1 u9 = u8 -> x1 u10 = u11 -> x1 u11 = u9 -> x0 u8 u11 -> (forall x2, x2 c= u12 -> atleastp u5 x2 -> (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> not (x0 x3 x4))) -> atleastp u2 (setminus x2 u8) -> (forall x3 : prop, (forall x4, x4 c= u12 -> atleastp u5 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u8 :e x4 -> u9 :e x4 -> x3) -> (forall x4, x4 c= u12 -> atleastp u5 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u8 :e x4 -> u10 :e x4 -> x3) -> (forall x4, x4 c= u12 -> atleastp u5 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u9 :e x4 -> u10 :e x4 -> x3) -> x3))).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom missingprop_c1a95e8160789154b1ae102566f570f1aea3813572fb362eeefeb21832fd0653 : u17_to_Church17 u10 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x11).
Axiom missingprop_08c2582e457fa5da2b4ee2676b94e0e9b149b350b636df86eee53e8e8dded2c1 : u17_to_Church17 u9 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x10).
Axiom missingprop_36b306548a78300032c69ad94745ff48aa8608e8a430eca548c144b9c231bda4 : u10 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_e3e7876f64d57e7b4aae114d87715d9a64fc4129a1a28df53f278ae0d8499348 : u11 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_8f7d877f09ad2d2b6bd165b15d072d92366514d5c83c4caef2b25c48dd454e7b : u17_to_Church17 u8 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x9).
Axiom missingprop_adf687ac5b6c91f712b3eb1ff0c482d096f763fa394d8ea395fcfe7d367eb8f2 : u17_to_Church17 u11 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x12).
Theorem missingprop_0f8d6606c282e903d64a51286413d131f51a9b42f2114051ea1793eaed7deb09 : (forall x0, x0 c= u12 -> atleastp u5 x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_6_17 x1 x2))) -> atleastp u2 (setminus x0 u8) -> (forall x1 : prop, (forall x2, x2 c= u12 -> atleastp u5 x2 -> (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (TwoRamseyGraph_3_6_17 x3 x4))) -> u8 :e x2 -> u9 :e x2 -> x1) -> (forall x2, x2 c= u12 -> atleastp u5 x2 -> (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (TwoRamseyGraph_3_6_17 x3 x4))) -> u8 :e x2 -> u10 :e x2 -> x1) -> x1)).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem missingprop_e18118cd74cbff82040ead85f76b88629f6077edb9c9110d3b81147b24bca29a : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> Repl x0 x2 c= x1).
admit.
Qed.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem missingprop_8971f3b473461e5af79cdbc43a88ad446d621e4c84e7020f2ba0e1f27796b56e : (forall x0 x1, forall x2 : set -> set, inj x0 x0 x2 -> atleastp (binintersect x1 x0) (binintersect (Repl x1 x2) x0)).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom missingprop_45d11dce2d0b092bd17c01d64c29c5885c90b43dc7cb762c6d6ada999ea508c5 : (forall x0, nat_p x0 -> (forall x1, or (atleastp x1 x0) (atleastp (ordsucc x0) x1))).
Axiom nat_1 : nat_p 1.
Axiom missingprop_19c5bea28ef119e30d80f4e7c578df826b34bc3d0b15978a12c7c1b896ec3046 : (forall x0, atleastp u4 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (x2 = x3 -> (forall x6 : prop, x6)) -> (x2 = x4 -> (forall x6 : prop, x6)) -> (x2 = x5 -> (forall x6 : prop, x6)) -> (x3 = x4 -> (forall x6 : prop, x6)) -> (x3 = x5 -> (forall x6 : prop, x6)) -> (x4 = x5 -> (forall x6 : prop, x6)) -> x1)))) -> x1)).
(* Parameter Church17_lt8 "d20c7898f6bed20c2c5c2498f5ac0756d84e8e11ea47f6b6e0b8ca2759026026" "dabe1f95706bff9070b574624aec00bcc50706d76fd50e4a3929fd40311a5efa" *)
Parameter Church17_lt8 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_39eded3fceade33502100460a606e7a1c03e6da22fb6008fad791b8587f951e7 : (forall x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_lt8 x0 -> Church17_lt8 x1 -> Church17_lt8 x2 -> Church17_lt8 x3 -> TwoRamseyGraph_3_6_Church17 x0 (fun x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 : set => x13) = (fun x5 x6 : set => x6) -> TwoRamseyGraph_3_6_Church17 x1 (fun x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 : set => x13) = (fun x5 x6 : set => x6) -> TwoRamseyGraph_3_6_Church17 x2 (fun x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 : set => x13) = (fun x5 x6 : set => x6) -> TwoRamseyGraph_3_6_Church17 x3 (fun x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 : set => x13) = (fun x5 x6 : set => x6) -> TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_3_6_Church17 x0 x2 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_3_6_Church17 x0 x3 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_3_6_Church17 x1 x2 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_3_6_Church17 x1 x3 = (fun x5 x6 : set => x6) -> TwoRamseyGraph_3_6_Church17 x2 x3 = (fun x5 x6 : set => x6) -> False).
Axiom missingprop_a1e277f419507eb6211f44d9457aefea2a8b3e26b2ee84f0795856dfe97fcf6e : (forall x0, x0 :e u8 -> Church17_lt8 (u17_to_Church17 x0)).
Axiom missingprop_46a7f5ba218e301f19d33cc265134a2df7adfd3de64e750dc665649ee8f6340d : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> or (TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x3 x4 : set => x3)) (TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x3 x4 : set => x4))).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_4 : nat_p 4.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Axiom missingprop_d80a5cdd35aff682e6edc37d56782355ff9ceaa0a69a0eeabe526b6102deafb2 : (forall x0 x1, forall x2 : set -> set -> prop, x2 x0 (binunion (setminus x0 x1) (binintersect x0 x1)) -> x2 (binunion (setminus x0 x1) (binintersect x0 x1)) x0).
Axiom missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom missingprop_7319a473fd0d307c236781359af918832684b744b55bc12dd159dbca12e12419 : (forall x0 x1 x2, (forall x3, x3 :e x0 -> or (x3 = x1) (x3 = x2)) -> atleastp x0 u2).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom neq_5_4 : u5 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_ccd09fc33db26fba17a1e8f5fd52159b676a35cf5706e2e445b9db64b4fc35c5 : u17_to_Church17 u5 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x6).
Axiom missingprop_f6f6b2d4f503fb9b975e320862d0437f04a94f96cc19149de839c0a7d55394f3 : u17_to_Church17 u4 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x5).
Axiom neq_6_4 : u6 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_b2c765c786aca76bfef751038ffbb16620c4c7136061de036517f3c71ce2abfd : u17_to_Church17 u6 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x7).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom neq_7_5 : u7 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_9d497d8c5ab47bb0417256780d394d93b6598b5e679bac7f2c3c702196ebcca4 : u17_to_Church17 u7 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x8).
Axiom cases_4 : (forall x0, x0 :e 4 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 x0)).
Axiom neq_1_0 : u1 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_f880a8473dab9f58d69fbf332c8547d500ca315e405258a93c99a34f8560efb6 : u17_to_Church17 u1 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x2).
Axiom missingprop_84aaefca7211a57d89e0df96a1f742653d3cc05f82d5ab568090ade3cb9ffcfd : u17_to_Church17 0 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x1).
Axiom neq_2_0 : u2 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_7c154441ca7b7a9fe09539322ad6531c3f48333c7018e2f8c866c0af44719d1a : u17_to_Church17 u2 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x3).
Axiom neq_3_1 : u3 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_50de3f92839624b98789d3fa24556e40d38a727836b3c2bd366269421355b28d : u17_to_Church17 u3 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x4).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_51bec2d8eaf1a80be21b9c627f1350028311d7a37b5fc9ca1e29924c42861ed2 : equip 4 (setsum 2 2).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom In_0_4 : 0 :e 4.
Axiom In_1_4 : 1 :e 4.
Axiom In_2_4 : 2 :e 4.
Axiom In_3_4 : 3 :e 4.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom nat_3 : nat_p 3.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom missingprop_821eaea8d64656981d4b09109b645b96ecc6f05951f146b66e41a13f047d2a83 : (forall x0, x0 c= u12 -> atleastp u5 x0 -> u8 :e x0 -> u9 :e x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_6_17 x1 x2))) -> False).
Axiom missingprop_8253b61cf54670aa9b2ef8b9008829a23ced914e791a2798f72f161ed98e659a : (forall x0, x0 c= u12 -> atleastp u5 x0 -> u8 :e x0 -> u10 :e x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_6_17 x1 x2))) -> False).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom missingprop_344c784b1c3b94c370e58970c6c07f9652a98f817bb26a71614a2661ed1216a6 : add_nat 8 8 = 16.
Axiom missingprop_2dcf4dd8557a0ffd2a187961d1bc330ef1aae42c546555814bac26eb5e3c6d68 : (forall x0 x1, nat_p x1 -> x0 c= add_nat x0 x1).
Axiom nat_8 : nat_p 8.
Theorem missingprop_82a4043338dce48d58934c215ccdbe85be545db6869ac125d5e92b153cac28bb : (forall x0, x0 c= u12 -> atleastp u5 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_6_17 x1 x2)))).
admit.
Qed.
Theorem missingprop_1afef3dd801943e68d64c376bb0d26d8113e88e73ac6515f4d5d7336d0f52b61 : (forall x0, x0 c= u12 -> atleastp u5 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> not (and (TwoRamseyGraph_3_6_17 x1 x2) (x1 = x2 -> (forall x3 : prop, x3)))))).
admit.
Qed.
Axiom missingprop_c18b6193e550b83006174e9a39facd53a8842bb45a3743eb46ab3a970c091d9d : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u16 -> x1 x2 :e u16) -> (forall x2, x2 :e u16 -> (forall x3, x3 :e u16 -> x1 x2 = x1 x3 -> x2 = x3)) -> (forall x2, x2 :e u16 -> (forall x3, x3 :e u16 -> x0 (x1 x2) (x1 x3) -> x0 x2 x3)) -> (forall x2, x2 :e u16 -> x1 (x1 (x1 (x1 x2))) = x2) -> x1 u12 = u13 -> x1 u13 = u14 -> x1 u14 = u15 -> x1 u15 = u12 -> (forall x2, x2 c= u16 -> atleastp u6 x2 -> (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> not (x0 x3 x4))) -> atleastp u2 (setminus x2 u12) -> (forall x3 : prop, (forall x4, x4 c= u16 -> atleastp u6 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u12 :e x4 -> u13 :e x4 -> x3) -> (forall x4, x4 c= u16 -> atleastp u6 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u12 :e x4 -> u14 :e x4 -> x3) -> x3))).
Axiom missingprop_9c7296d0e1b426393b918922dca14768e21a9144fb20f59ffa35f52b8b015e54 : (forall x0, x0 :e u16 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0 :e u16).
Axiom missingprop_c21ba5695b1d95da76a10179e8a88254ffe230dfdf6a6df2f9b5ee9d0562acd5 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u12 = u13.
Axiom missingprop_ffb148d18f258a6f2e8b9af29fd6bea695bdd737e09f02c9ed6ace715b49951e : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u13 = u14.
Axiom missingprop_5236a0eac529d064f7d4286c27876c5cf1e6aa8482e677668f1eb521e10e6be9 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u14 = u15.
Axiom missingprop_991646d91cf5e2f3eac2db7f6827c54bc2cbba5f33c26bd9a4d54268790991f8 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u15 = u12.
Axiom missingprop_85e35c3e63ae72d4bc8526ee5d4148db605a84f9758edbfa851d2df21f3fa608 : (forall x0 : set -> set -> prop, x0 0 u2 -> x0 u4 u6 -> x0 u1 u12 -> x0 u5 u12 -> x0 u8 u12 -> x0 u9 u12 -> x0 u3 u13 -> x0 u7 u13 -> x0 u10 u13 -> x0 u2 u14 -> x0 u6 u14 -> x0 u11 u14 -> x0 0 u15 -> x0 u4 u15 -> x0 0 u2 -> x0 u4 u6 -> x0 u11 u15 -> (forall x1, x1 c= u16 -> atleastp u6 x1 -> u12 :e x1 -> u13 :e x1 -> (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> not (x0 x2 x3))) -> False)).
Axiom missingprop_0000c65f9de36d25804b682992bd488961ddb64d511e3c734ef831a829c7802f : (forall x0 : set -> set -> prop, x0 0 u2 -> x0 u4 u6 -> x0 u1 u12 -> x0 u5 u12 -> x0 u8 u12 -> x0 u9 u12 -> x0 u3 u13 -> x0 u7 u13 -> x0 u10 u13 -> x0 u2 u14 -> x0 u6 u14 -> x0 u11 u14 -> x0 0 u15 -> x0 u4 u15 -> x0 u3 u4 -> x0 0 u7 -> x0 u10 u14 -> (forall x1, x1 c= u16 -> atleastp u6 x1 -> u12 :e x1 -> u14 :e x1 -> (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> not (x0 x2 x3))) -> False)).
Axiom missingprop_c9b34bc382b6d599e61c555eac34a76c451754eb682c17d99a93f2a1e695d561 : u17_to_Church17 u14 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x15).
Axiom missingprop_3e7054688acb8ba4a0f18423b649f383cf90ecfc4f6200e2e049d580ebc2dc1f : u14 = u10 -> (forall x0 : prop, x0).
Axiom neq_7_0 : u7 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_3 : u4 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_e20cda3fec831e61f9db0bd6bee2791e26067278d174576042c0cb4b3ab479bb : u17_to_Church17 u15 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x16).
Axiom missingprop_ee5d720135ac2a1e6675f04fc296d39836826d1754aace8d3d88db80c3a9bf7b : u15 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_a504807aba1f063c619c47c7790e6a97b78d6221a696d3a06eab792e3bc4d832 : u15 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_9777c32431e56f82c3c2627629f063e7a7752ce2500aecd27c072fd538c564d1 : u15 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_00afc3423aeef527fa52daa0e685caaf0adcec70a4145f09454ed0ecaf166b37 : u14 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_521d57c2f7a8a26330ae69c04fff1b24cc86e4837a4836a4fefa73fad1a725cc : u14 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_2451f846ade20c2c83b68d6ca07174f7098b4b15fe1ab38e4417b5ec5afc3945 : u14 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_095d0670f988d22364f3d3b9681f2ca00bf954d60116baba131fbf1ee891de57 : u17_to_Church17 u13 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x14).
Axiom missingprop_611c167b8d8d5c2c171ede951fd79aafcb1fd16fb816a3f0e5c0edff9bd7addf : u13 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_128d4a775d786f77bf13bb7dd7cb9742308ad661f9914b0ba314109642dc74a2 : u13 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_f23c647528c9edaac83020c9ff5a3f2c5a7a4a9b995a628c2a71b9eb6cd8e669 : u13 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_d33ea914c01284b1fc49147f7bcc51527f787dcf89c80cfdad2e5f419cbe1dbb : u17_to_Church17 u12 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x13).
Axiom missingprop_e9452875caa538a193e13eb1accc0d1d2221ffa1eb64478ef4b831d0c7fb8587 : u12 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_405ba169154d9d42445b73345355e3c1ff4a4c35ee248b0842bd8e1a26057bf4 : u12 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_01c5167c045808e88e705b476ce2dd0e57d03d1d5f6a26f61825a32395c242ea : u12 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_fac08972bb876bc2457930272ed91a55b92fbe2a965f8dbfa94c531b056fd466 : u12 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_86bc79c870f4d20a7fe228e937ecd61089e3ec8501cf72927fb83b03785fdc89 : (forall x0 : set -> set -> prop, (forall x1, x1 c= u12 -> atleastp u5 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> not (x0 x2 x3)))) -> (forall x1, x1 c= u16 -> atleastp u6 x1 -> (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> not (x0 x2 x3))) -> atleastp u2 (setminus x1 u12))).
Theorem missingprop_dd20968590d1b4c22778c64bd2299c3d4b76c5d3d25dcc77c8be400e32088802 : (forall x0, x0 c= u16 -> atleastp u6 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_6_17 x1 x2)))).
admit.
Qed.
Axiom missingprop_1834b85271c8875943c2ffcc84c12f5fbb059bb64cc7b431c141c0353370cd27 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, x0 u12 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x0 u13 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x0 u14 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x0 u15 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x0 u16 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> (forall x1 : set -> set -> prop, (forall x2, x2 :e u17 -> (forall x3, x3 :e u17 -> (x2 = x3 -> (forall x4 : prop, x4)) -> TwoRamseyGraph_3_6_Church17 (x0 x2) (x0 x3) = (fun x5 x6 : set => x5) -> x1 x2 x3)) -> (forall x2, x2 c= u12 -> atleastp u5 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4)))) -> (forall x2, x2 c= u16 -> atleastp u6 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4)))) -> (forall x2, x2 c= u17 -> atleastp u6 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4)))))).
Axiom missingprop_2491d2eab9fb9ff25fa0ab1839a83bd77980933cdf40d8cdd9120c539e464911 : u17_to_Church17 u16 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x17).
Theorem missingprop_7832fff82c852baccaa662f34d87e3cb9f0f480cec52038f1287bb5f734d4ead : (forall x0, x0 c= u17 -> atleastp u6 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_6_17 x1 x2)))).
admit.
Qed.
(* Parameter TwoRamseyProp_atleastp "947fb9a2bd96c9c3a0cefb7f346e15d36deca0943732fc3ea9bc3a588c7ad8f8" "6d86bb255886d154fd0886829fc7d7f8411add3db54738041d14766df3b5c4fa" *)
Parameter TwoRamseyProp_atleastp : set -> set -> set -> prop.
Axiom missingprop_affc49913747fa11b095e9305cedbaaa950055db35b087439dc7fd718eda5a78 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u17 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u17 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> not (TwoRamseyProp_atleastp 3 6 17)).
Axiom missingprop_5cece90b225888ed5e86060411031b7dea9c395004ca9e7ebb9069250f2769f8 : (forall x0 x1, TwoRamseyGraph_3_6_17 x0 x1 -> TwoRamseyGraph_3_6_17 x1 x0).
Axiom missingprop_97757aa046fc628a1493769feaf18aac5937e0cb3d98e54a6c0796c9e5514262 : (forall x0, x0 c= u17 -> atleastp u3 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_6_17 x1 x2))).
Theorem not_TwoRamseyProp_atleast_3_6_17 : not (TwoRamseyProp_atleastp 3 6 17).
admit.
Qed.
(* Parameter TwoRamseyProp "aab220c89625a268d769430a9bd1c5242495f378775d11b8e61bd9148d917e80" "c5d86cf97e40aa1fd6c7b0939b0974f704b1c792393b364c520e0e4558842cf6" *)
Parameter TwoRamseyProp : set -> set -> set -> prop.
Axiom missingprop_d26e0281874e3c848e67997f80ac522fccb7753bf982eb4fc97a3c179cc3f8fa : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u17 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u17 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> not (TwoRamseyProp 3 6 17)).
Theorem not_TwoRamseyProp_3_6_17 : not (TwoRamseyProp 3 6 17).
admit.
Qed.
