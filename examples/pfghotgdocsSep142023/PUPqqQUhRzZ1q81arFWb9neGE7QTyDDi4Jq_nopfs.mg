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
Definition TwoRamseyGraph_3_6_Church17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x3 x2 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x2 x2 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x3 x2 x3 x3 x2 x3 x2 x2 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x2 x3 x3 x3 x3 x2 x2 x2 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x2 x2 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x2 x2 x3 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x2 x3 x3 x2 x2 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x2 x3 x3 x2 x3 x3 x3 x2) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x2) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x3 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x2) (x1 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x2 x2 x2 x2 x2)).
Theorem missingprop_5458e899756973167cd95c9099f5886372156be9a958a28ab2e574c5fe52f55b : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> TwoRamseyGraph_3_6_Church17 x0 x0 = (fun x2 x3 : set => x2)).
admit.
Qed.
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
Definition u13 : set :=
 ordsucc u12.
Definition u14 : set :=
 ordsucc u13.
Definition u15 : set :=
 ordsucc u14.
Definition u16 : set :=
 ordsucc u15.
Definition u17 : set :=
 ordsucc u16.
(* Parameter u17_to_Church17 "2198544dc93adcfb7a0840e80ac836eba8457b7bbb3ccbbb3bc46e9112667304" "02709d69b879f00cff710051a82db11b456805f2bfe835c5d14f8c542276ac60" *)
Parameter u17_to_Church17 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set.
Definition TwoRamseyGraph_3_6_17 : set -> set -> prop :=
 (fun x0 x1 : set => x0 :e u17 -> x1 :e u17 -> TwoRamseyGraph_3_6_Church17 (u17_to_Church17 x0) (u17_to_Church17 x1) = (fun x3 x4 : set => x3)).
(* Parameter u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 "cb2fbaf509f40d85b77e5e2f5591d9b013ddca260991b95e6744f8c8b5ab29c5" "c122725011fe4f3c33a788d8c61749ddad5e2b721eb2d0d6a40087e7cc070520" *)
Parameter u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 : set -> set.
Axiom missingprop_485b5a544f4a752392d62c01e55a5e36a8748d64fd7af6f27349bd2453284446 : (forall x0, x0 :e u16 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 u15 -> x1 x0)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom missingprop_f880a8473dab9f58d69fbf332c8547d500ca315e405258a93c99a34f8560efb6 : u17_to_Church17 u1 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x2).
Axiom missingprop_84aaefca7211a57d89e0df96a1f742653d3cc05f82d5ab568090ade3cb9ffcfd : u17_to_Church17 0 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x1).
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom missingprop_7c154441ca7b7a9fe09539322ad6531c3f48333c7018e2f8c866c0af44719d1a : u17_to_Church17 u2 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x3).
Axiom missingprop_5f23a09617e395d3412bcd886825a830fcbca9dbfaa3bb762a6b0286bbba2699 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u2 = 0.
Axiom missingprop_3ce04bff2a395cf5fe0b94d0636cc8dbea0e46272d1360d7109558a625b43849 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u1 = u3.
Axiom missingprop_50de3f92839624b98789d3fa24556e40d38a727836b3c2bd366269421355b28d : u17_to_Church17 u3 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x4).
Axiom missingprop_9851dfe301262128a9dc5def6f083cbb499c4d0eace7612e5dc050c4fe5ba3c7 : 0 :e u17.
Axiom missingprop_515e04c9d20f4760fa1f9ec9f7d43a79e2cf83cd96ac9929a00f63e10a33bee6 : u3 :e u17.
Axiom cases_3 : (forall x0, x0 :e 3 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 x0)).
Axiom missingprop_2deda5cc0874f100e0fcd31fbab30140488390c1e46b9b2da484e79975ce6ae8 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u3 = u2.
Axiom missingprop_ddfd049a99d8a8d08a5969e20f08be40e16f962ab49dd05ba7dcd1cfd68e7645 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 0 = u1.
Axiom missingprop_fcb0372c2816a1d869a174f57c9ee90635b20300695b8cc5b4a5ca8436427e30 : u2 :e u17.
Axiom missingprop_4f0f2f2c8505addb4aa66d1187553d1cf0a291464cc87b78a3faaf7ae73ed155 : u1 :e u17.
Axiom cases_4 : (forall x0, x0 :e 4 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 x0)).
Axiom missingprop_d02d672c88891239a2034f8db0a8f9c766e8b44a6127d48b08a622cce7dc65fa : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u4 = u5.
Axiom missingprop_ccd09fc33db26fba17a1e8f5fd52159b676a35cf5706e2e445b9db64b4fc35c5 : u17_to_Church17 u5 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x6).
Axiom missingprop_add6307eacf71a9b26cddaf6256b63e565e929785d0ee0946ee6b253d6c3852e : u5 :e u17.
Axiom missingprop_f6f6b2d4f503fb9b975e320862d0437f04a94f96cc19149de839c0a7d55394f3 : u17_to_Church17 u4 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x5).
Axiom cases_5 : (forall x0, x0 :e 5 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 x0)).
Axiom missingprop_b4b0b30bf8e5ff91ed4869311536b86e18ba1e4d9dcdabf73d46693ed9a5b67b : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u5 = u7.
Axiom missingprop_9d497d8c5ab47bb0417256780d394d93b6598b5e679bac7f2c3c702196ebcca4 : u17_to_Church17 u7 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x8).
Axiom missingprop_97cf1bf10df747733c6e7166825443492e8a9bbd5381654e4874ef5f3ceacd0a : u7 :e u17.
Axiom cases_6 : (forall x0, x0 :e 6 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 x0)).
Axiom missingprop_8a85de05c64795068871a87d3b06ba1e5395c94812285b09588df3e01a1e0ea3 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u6 = u4.
Axiom missingprop_8bfb0eb80a8f5f9fa400351ad533eb8f6abcbab81f79751d9b99dc5c5b198b37 : u4 :e u17.
Axiom missingprop_b2c765c786aca76bfef751038ffbb16620c4c7136061de036517f3c71ce2abfd : u17_to_Church17 u6 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x7).
Axiom cases_7 : (forall x0, x0 :e 7 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 x0)).
Axiom missingprop_c0eb4e3448ef31f6408883194d369de2b67b2c3b8eb9ad88a4d52d9ee850a560 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u7 = u6.
Axiom missingprop_e8645556daad09b81c208e8cbf014ff23194c321a76d028c3b35a1714720baab : u6 :e u17.
Axiom cases_8 : (forall x0, x0 :e 8 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 7 -> x1 x0)).
Axiom missingprop_f74f5074ad12d57b1f85300d32210524157b09a0919ee38128acf015331c35f0 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u8 = u10.
Axiom missingprop_c1a95e8160789154b1ae102566f570f1aea3813572fb362eeefeb21832fd0653 : u17_to_Church17 u10 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x11).
Axiom missingprop_7af243686256d97349e2c2a55c958e2d435fe9a5e016344b19465fce23ad5676 : u10 :e u17.
Axiom missingprop_8f7d877f09ad2d2b6bd165b15d072d92366514d5c83c4caef2b25c48dd454e7b : u17_to_Church17 u8 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x9).
Axiom cases_9 : (forall x0, x0 :e 9 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 7 -> x1 8 -> x1 x0)).
Axiom missingprop_4e46240fa21fb39b84708f415e3b21cc616773a08b926976627048ab8fc29078 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u9 = u8.
Axiom missingprop_6e6799a9f21ccdffe58af218db8306610bd1441f3fa0fcc3f6eaa957ce165f57 : u8 :e u17.
Axiom missingprop_08c2582e457fa5da2b4ee2676b94e0e9b149b350b636df86eee53e8e8dded2c1 : u17_to_Church17 u9 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x10).
Axiom missingprop_74ee37d72a6213f9e490059da26888feba068255f704fd7ddf59dcd556b0b662 : (forall x0, x0 :e u10 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 x0)).
Axiom missingprop_29ccb5c4e7950928d647b0941425c5e64d69ebaaed74cba3c055174a14ae4c5b : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u10 = u11.
Axiom missingprop_adf687ac5b6c91f712b3eb1ff0c482d096f763fa394d8ea395fcfe7d367eb8f2 : u17_to_Church17 u11 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x12).
Axiom missingprop_fde6379bebd0b99b66d966901300c529916d83c8c1f209841f486bb2568cf012 : u11 :e u17.
Axiom missingprop_16a583b27c846cbf24441f77a51593d3d8c71d1e4798e971e3bf25553934797a : (forall x0, x0 :e u11 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 x0)).
Axiom missingprop_9b334a439f93d75505077dcc1fe4c60157a3105589338dee138085e931431815 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u11 = u9.
Axiom missingprop_abbef1301044c000653f42960a8047881f2ef656bd9cecef0ae9b764b6c0784f : u9 :e u17.
Axiom missingprop_a36df829fd5ae696643b1cd180c001e7c72018b0aade2c8b02a3beb191bf4447 : (forall x0, x0 :e u12 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 x0)).
Axiom missingprop_c21ba5695b1d95da76a10179e8a88254ffe230dfdf6a6df2f9b5ee9d0562acd5 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u12 = u13.
Axiom missingprop_095d0670f988d22364f3d3b9681f2ca00bf954d60116baba131fbf1ee891de57 : u17_to_Church17 u13 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x14).
Axiom missingprop_ee249701bfbf4a0ddc5825c1bc6fff36b37e7d1af2b7d307fdfcf229c66eb3d7 : u13 :e u17.
Axiom missingprop_d33ea914c01284b1fc49147f7bcc51527f787dcf89c80cfdad2e5f419cbe1dbb : u17_to_Church17 u12 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x13).
Axiom missingprop_713be0ad5efeb9da26a66462505f19060bd4cc2891c0c4c304dba8053e47660a : (forall x0, x0 :e u13 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 x0)).
Axiom missingprop_ffb148d18f258a6f2e8b9af29fd6bea695bdd737e09f02c9ed6ace715b49951e : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u13 = u14.
Axiom missingprop_c9b34bc382b6d599e61c555eac34a76c451754eb682c17d99a93f2a1e695d561 : u17_to_Church17 u14 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x15).
Axiom missingprop_19ecd6ac8599e49ad47f95e5b1703b05d2332ac49ec04a48785748b0d8a5094a : u14 :e u17.
Axiom missingprop_f5f38a41dc62ca37f571854f7a510ceb2fb66dd24a6e8bc2c5339fc412f0b60f : (forall x0, x0 :e u14 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 x0)).
Axiom missingprop_5236a0eac529d064f7d4286c27876c5cf1e6aa8482e677668f1eb521e10e6be9 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u14 = u15.
Axiom missingprop_e20cda3fec831e61f9db0bd6bee2791e26067278d174576042c0cb4b3ab479bb : u17_to_Church17 u15 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x16).
Axiom missingprop_35f4d337254964d13bfee3413f1b56f908aee5828cc15d13f416e7a488640c53 : u15 :e u17.
Axiom missingprop_b9effc4b8ae0e51a99f6aeca88a2b3a49f1889abba53e61c066a155c07bbdf08 : (forall x0, x0 :e u15 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 x0)).
Axiom missingprop_991646d91cf5e2f3eac2db7f6827c54bc2cbba5f33c26bd9a4d54268790991f8 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u15 = u12.
Axiom missingprop_b7a4a37161804b376f25028de76b0714142123cbd842ba90c86afe8baa6a8a9e : u12 :e u17.
Axiom missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
Theorem missingprop_aaaaeba8fcdb27b9f83a6b70c52949fdb89ad7f44ebb4e9ad9a0831ceeb37dae : (forall x0, x0 :e u16 -> (forall x1, x1 :e x0 -> TwoRamseyGraph_3_6_17 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0) (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1) -> TwoRamseyGraph_3_6_17 x0 x1)).
admit.
Qed.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_16 : nat_p 16.
Axiom missingprop_5cece90b225888ed5e86060411031b7dea9c395004ca9e7ebb9069250f2769f8 : (forall x0 x1, TwoRamseyGraph_3_6_17 x0 x1 -> TwoRamseyGraph_3_6_17 x1 x0).
Axiom missingprop_f44342ed74648c23c8734d945bc8b2c1af5a9cb594ef51477e7844cb71f944f8 : (forall x0, x0 :e u17 -> Church17_p (u17_to_Church17 x0)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_eb89147c164e7772b9993a1a07efbab205c75659d97b53aefb43d03dfff3b8bf : (forall x0, x0 :e u16 -> (forall x1, x1 :e u16 -> TwoRamseyGraph_3_6_17 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0) (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1) -> TwoRamseyGraph_3_6_17 x0 x1)).
admit.
Qed.
Axiom neq_3_1 : u3 = u1 -> (forall x0 : prop, x0).
Axiom neq_1_0 : u1 = 0 -> (forall x0 : prop, x0).
Axiom neq_3_0 : u3 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : u2 = u1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : u3 = u2 -> (forall x0 : prop, x0).
Axiom neq_2_0 : u2 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_1 : u5 = u1 -> (forall x0 : prop, x0).
Axiom neq_5_3 : u5 = u3 -> (forall x0 : prop, x0).
Axiom neq_5_0 : u5 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_2 : u5 = u2 -> (forall x0 : prop, x0).
Axiom neq_7_1 : u7 = u1 -> (forall x0 : prop, x0).
Axiom neq_7_3 : u7 = u3 -> (forall x0 : prop, x0).
Axiom neq_7_0 : u7 = 0 -> (forall x0 : prop, x0).
Axiom neq_7_2 : u7 = u2 -> (forall x0 : prop, x0).
Axiom neq_7_5 : u7 = u5 -> (forall x0 : prop, x0).
Axiom neq_4_1 : u4 = u1 -> (forall x0 : prop, x0).
Axiom neq_4_3 : u4 = u3 -> (forall x0 : prop, x0).
Axiom neq_4_0 : u4 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_2 : u4 = u2 -> (forall x0 : prop, x0).
Axiom neq_5_4 : u5 = u4 -> (forall x0 : prop, x0).
Axiom neq_7_4 : u7 = u4 -> (forall x0 : prop, x0).
Axiom neq_6_1 : u6 = u1 -> (forall x0 : prop, x0).
Axiom neq_6_3 : u6 = u3 -> (forall x0 : prop, x0).
Axiom neq_6_0 : u6 = 0 -> (forall x0 : prop, x0).
Axiom neq_6_2 : u6 = u2 -> (forall x0 : prop, x0).
Axiom neq_6_5 : u6 = u5 -> (forall x0 : prop, x0).
Axiom neq_7_6 : u7 = u6 -> (forall x0 : prop, x0).
Axiom neq_6_4 : u6 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_a7fa19a834d529db93c1b2300b41b17f336102b7793b24e9a750d6e03dec690c : u10 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_155e8a92a8ae96b946418659d12b00e3fef62dadc1bc31d4f074bcb712786356 : u10 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_871e92d1e015b90191f05be741b9ed2cc4491066cf0bf7b2d76c5d141ce801a4 : u10 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_5f3179724a6e8ef693da33b4da734e3c0d8d3295b89093b2f129371490f35854 : u10 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_1a168a095e76e59ad83d93a60c30f2a4b23a38b25f72b379498ed6c0a6728b15 : u10 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_f90d6a14135c76785343d196a602714aaebc8f848035cb3fc7d99e4a8069fa52 : u10 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_ccc1fa6cae49dec573eda0a7cb35b2ad4debf37b10463565ebc6d1385353f388 : u10 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_1caafcfab421a8bbf73edb3267db1f6908bd5029c181663700c5c637b54bb883 : u10 = u6 -> (forall x0 : prop, x0).
Axiom neq_8_1 : u8 = u1 -> (forall x0 : prop, x0).
Axiom neq_8_3 : u8 = u3 -> (forall x0 : prop, x0).
Axiom neq_8_0 : u8 = 0 -> (forall x0 : prop, x0).
Axiom neq_8_2 : u8 = u2 -> (forall x0 : prop, x0).
Axiom neq_8_5 : u8 = u5 -> (forall x0 : prop, x0).
Axiom neq_8_7 : u8 = u7 -> (forall x0 : prop, x0).
Axiom neq_8_4 : u8 = u4 -> (forall x0 : prop, x0).
Axiom neq_8_6 : u8 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_00ce3e990e394696d648599b893a93cd3cb153c371b93008eddec6849fd2aaa9 : u10 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_da9cd2315b0ab3b3dbcd7c4069c6d07f8e8a7c3b5321d78acb9ddfea02c56e54 : u11 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_6c307483f1e9d79cbd1be8f99cb0623b215d2a96dd7ca22776b1132e2b377d33 : u11 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_363035042db213d82b8567e67d435ec9f0597b9e71631d1860566db3f413fe41 : u11 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_93bd155ae66f9293399dab321235e159c709aa50be6b4209e260d5c571069bc3 : u11 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_7ad531d6eaae09cf142317793b067ab02fe09b619a36a2cbc6f0876a1fd1ba74 : u11 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_10a35d241244d98b266514a8fe38926cbcc9f4c51c46fbe5923bab64f9db063e : u11 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_a386dcc739aba4ef656c3a82802ebcbe7e87dae1ec14c96538c3fd461f6a0883 : u11 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_a218356df980789875659155b1ed2b3563be2916e1184b396ad2583b0b523a18 : u11 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_4ab2aef55b95fb08a1edd1a27d2fff79c4fc64f365bf3591ff27be743265541f : u11 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_e3e7876f64d57e7b4aae114d87715d9a64fc4129a1a28df53f278ae0d8499348 : u11 = u8 -> (forall x0 : prop, x0).
Axiom neq_9_1 : u9 = u1 -> (forall x0 : prop, x0).
Axiom neq_9_3 : u9 = u3 -> (forall x0 : prop, x0).
Axiom neq_9_0 : u9 = 0 -> (forall x0 : prop, x0).
Axiom neq_9_2 : u9 = u2 -> (forall x0 : prop, x0).
Axiom neq_9_5 : u9 = u5 -> (forall x0 : prop, x0).
Axiom neq_9_7 : u9 = u7 -> (forall x0 : prop, x0).
Axiom neq_9_4 : u9 = u4 -> (forall x0 : prop, x0).
Axiom neq_9_6 : u9 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_36b306548a78300032c69ad94745ff48aa8608e8a430eca548c144b9c231bda4 : u10 = u9 -> (forall x0 : prop, x0).
Axiom neq_9_8 : u9 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_eee73695077ff6070731183421778635002a71c030b9e35e65d114074acaa597 : u11 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_718815618fb408e7f9b6a92ac99a4e34c4c560dd6f617b4e7a3baae4d71063ec : u13 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_f23c647528c9edaac83020c9ff5a3f2c5a7a4a9b995a628c2a71b9eb6cd8e669 : u13 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_c12285364f107ae7d5ef016a23e15f3c94608acd035dd4eab6e840e77bdc8e61 : u13 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_0563767a7ae8cf0f38a2ce998f4f61c0f4d5f10bd129b2c62e0e73969f860e28 : u13 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_708a12eb026e4d3c08fc829f55688c54d28c54b0af95cbb973e74a0d726eddda : u13 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_128d4a775d786f77bf13bb7dd7cb9742308ad661f9914b0ba314109642dc74a2 : u13 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_0b3e3e45ef080c7b7a49c00c4067713ad08b47ab8b0713e5aaab56e6d7a5b982 : u13 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_10123744e9181acb5f4770c4e7c8d274437210700731399dc702b025f786eb1e : u13 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_611c167b8d8d5c2c171ede951fd79aafcb1fd16fb816a3f0e5c0edff9bd7addf : u13 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_e20a3f49533352fe1b05bebbb2ae624ad084f8a027d8217543b43ae55b811240 : u13 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_0a910a83fae7c1219e51ae6f441b8120dc6f2353f129945859e5867a1d5c1be3 : u13 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_2f6e5b1338db3ff412e38a1ecfa4d466e2517777a8bbed02c867df317c357933 : u13 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_3ec40051a51fd9abd0f1ea045695fd96747c0b44c83f1a0d528b4d75589d7df9 : u14 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_8d07e49985de556386320c4394a4f81f882951458280531346f93de382828ccf : u14 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_786d05e7abced1a9dc9d53bbc0ccf61863e522b5215ae9f11752fff2bf124321 : u14 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_2451f846ade20c2c83b68d6ca07174f7098b4b15fe1ab38e4417b5ec5afc3945 : u14 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_8e078aa58d96c679c691026d3dbd3c5ddf82d7052472d7ebfc54e4b027091692 : u14 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_6b6d879f9198c0f8972b1370a6b60ca474de18dcfd00d1cbe42fb36343cfa178 : u14 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_5c17fff000510475687b445d243a8658952ee19ef7f469feb3e238dfb5022180 : u14 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_521d57c2f7a8a26330ae69c04fff1b24cc86e4837a4836a4fefa73fad1a725cc : u14 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_3e7054688acb8ba4a0f18423b649f383cf90ecfc4f6200e2e049d580ebc2dc1f : u14 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_9cd8c17074dbeec0fef19f04ec8a941cf429e15b37b6046a94fab0afa09de770 : u14 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_00afc3423aeef527fa52daa0e685caaf0adcec70a4145f09454ed0ecaf166b37 : u14 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_16378467aced8215056140af611424a7d8477e41af2c1f3af8bef49b9f0df0b7 : u14 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_ccf4a5c6b3a6e4954a14109684a2ab83b52a2425e80e3019435c7a784c78b93f : u14 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_033f55ba76fb230c8269a9f3dfb9ab5f1debf38df2ed6a8204e88ab225544563 : u15 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_c966e250c9e0036300c545a4c37f99c2c56d590f24ba184faeb741ac623ddc71 : u15 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_9777c32431e56f82c3c2627629f063e7a7752ce2500aecd27c072fd538c564d1 : u15 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_638ca97253dde1f6c05ae5a7b43aa5519bcb932d746f1ff6c11c6149deab9734 : u15 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_6be75df4f14c9bfa3abf6ed370fc5224c8cd92769e2571dbc7f3e2b0899c3f2a : u15 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_03bfa5a110b404de8380cbf91407efa16bc92e74bb78c456f8556ff689d59c2c : u15 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_a504807aba1f063c619c47c7790e6a97b78d6221a696d3a06eab792e3bc4d832 : u15 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_6163c724a9d7981c89b6bf365a0bebe9efec08b9eff4bb6184424f2ae3577228 : u15 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_c2d8fac90c753ba98b910dfebba93313752c3581721985e0c507115f57afbe2d : u15 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_85105fca2bacc886dc8c29d2893d8d6f48bf2df156b5c5ec0c4e6b02418bc580 : u15 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_ee5d720135ac2a1e6675f04fc296d39836826d1754aace8d3d88db80c3a9bf7b : u15 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_a4ffe2c5c180b0a50257540c321c6d0ac174e6dcf67a517314fd5483733bd52b : u15 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_c4ec81028536a24273f04958b27208043a8e72bdb9f95435ebeb3fd5cd7535fc : u15 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_9052a17aeb56f0baa5bd35ac678f9db733e32e563a9d0a61b0417ed4592a2293 : u15 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_fac08972bb876bc2457930272ed91a55b92fbe2a965f8dbfa94c531b056fd466 : u12 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_21d350f752803e70816c84c0f32485027c6c1878657f7263a7ebfa87995c9b6a : u12 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_c9b4e12fb0aac9a865933938cbf5882f899389d7530b1a6017a25523b517d77b : u12 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_9925a94179f9b96e15bb2f5f3151446cc17d0f38ddaec97b207a42442fb0efed : u12 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_01c5167c045808e88e705b476ce2dd0e57d03d1d5f6a26f61825a32395c242ea : u12 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_944319b563f360f8276cf6ed579bfd97549280496ef3a59878dc7367e0289497 : u12 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_0aa1897333a9220b7c647af2a5a102d331686166cd7d81d697467978bffb14b8 : u12 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_3de237895f633cd0c01630052cea1ce37b395b2138c60358b21cdd63976e7e77 : u12 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_a52e53b541a40078b90241258be0a0067f5bc813eb10693b9b961df0bbb05001 : u12 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_405ba169154d9d42445b73345355e3c1ff4a4c35ee248b0842bd8e1a26057bf4 : u12 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_dd600363d78f5191d99ddf5f03f668be69bef6f49770dc87b299c981791e709b : u12 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_e9452875caa538a193e13eb1accc0d1d2221ffa1eb64478ef4b831d0c7fb8587 : u12 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_f4e278a6bf4004a90230a7ce4599c33df3b13afc88036ef1d8ff3a4ef834b193 : u13 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_15d8fee75ef2fcef507dcd58e078d7224460844031194a35f38ebec160a6c36c : u14 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_b71ad64ae5ee6739b72b7cf6202281008bcc9edc7ad98b81f40c22a64711fdc6 : u15 = u12 -> (forall x0 : prop, x0).
Theorem missingprop_c22d5c95e506e0caba5e138a4cd5a3e41270f12ef666b7d9e985517b802d71a4 : (forall x0, x0 :e u16 -> (forall x1, x1 :e x0 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0 = u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1 -> (forall x2 : prop, x2))).
admit.
Qed.
Theorem missingprop_ac5261da9745d31a8bb999158a58d18491f973a34391722145ebc7375438f7d8 : (forall x0, x0 :e u16 -> (forall x1, x1 :e u16 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0 = u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x1 -> x0 = x1)).
admit.
Qed.
Theorem missingprop_6e747c16685bdb4eaee901f472b70c0f041f4106aa60440cc165be6e8835727d : (forall x0, x0 :e u16 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 (u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0))) = x0).
admit.
Qed.
