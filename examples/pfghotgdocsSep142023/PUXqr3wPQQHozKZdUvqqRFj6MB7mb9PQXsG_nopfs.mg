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
Definition missingname_5b5f35da4b263dbee945b2ffcce9feabfa586bd96c2f75eb4e868d902a221323 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x3 x2 x2 x3 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x2 x3 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x2 x3 x3 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x3 x2 x2 x3 x2 x3 x3 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x3 x2 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x3 x3 x2 x3 x2 x3 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x3 x2 x3 x3 x2 x3 x3 x2 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x2 x3 x3 x3 x3 x2 x2 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x2 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x2 x3 x3 x2 x3) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x3 x3 x2 x2 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x2 x3 x3 x3 x3 x3 x3 x2) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x2 x3 x3 x3 x3 x3 x2) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3 x2 x3 x3 x3 x3 x2) (x1 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x2 x2 x2 x2 x3)).
Definition Church17_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x9) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x10) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x11) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x12) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x13) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> x1 x0).
Definition TwoRamseyGraph_3_6_Church17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x3 x2 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x2 x2 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x3 x2 x3 x3 x2 x3 x2 x2 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x2 x3 x3 x3 x3 x2 x2 x2 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x2 x2 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x2 x2 x3 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x2 x3 x3 x2 x2 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x2 x3 x3 x2 x3 x3 x3 x2) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x2) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x3 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x2) (x1 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x2 x2 x2 x2 x2)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_86ce935544febe4c718c69ad62efa6c2e33a6b85abad1275cfde561b3d433d77 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> (x0 = x1 -> (forall x2 : prop, x2)) -> missingname_5b5f35da4b263dbee945b2ffcce9feabfa586bd96c2f75eb4e868d902a221323 x0 x1 = TwoRamseyGraph_3_6_Church17 x0 x1).
admit.
Qed.
Theorem missingprop_8ec165ee02d1db0845a4892437b15b9388e3c32a86f776df4ff31d24ec543621 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> missingname_5b5f35da4b263dbee945b2ffcce9feabfa586bd96c2f75eb4e868d902a221323 x0 x0 = (fun x2 x3 : set => x3)).
admit.
Qed.
Theorem missingprop_969020ecc80c532d1b1becba35b6297793bf495fb82300936c8a1e4e62750e6f : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> missingname_5b5f35da4b263dbee945b2ffcce9feabfa586bd96c2f75eb4e868d902a221323 x0 x1 = missingname_5b5f35da4b263dbee945b2ffcce9feabfa586bd96c2f75eb4e868d902a221323 x1 x0).
admit.
Qed.
(* Parameter u17 "cd79716d8923d293cac26e380f44bd1d637c5275ecfc89b47177ddf0a6ed1145" "7a7688d6358f93625a885a93e92c065257968a83dad53f42a5517baa820cd98c" *)
Parameter u17 : set.
(* Parameter u17_to_Church17 "2198544dc93adcfb7a0840e80ac836eba8457b7bbb3ccbbb3bc46e9112667304" "02709d69b879f00cff710051a82db11b456805f2bfe835c5d14f8c542276ac60" *)
Parameter u17_to_Church17 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set.
Definition missingname_39d12995313a19afef7ecefc4cb7c5af0c67ce24ca4c82b2d7063be7fa0c1166 : set -> set -> prop :=
 (fun x0 x1 : set => x0 :e u17 -> x1 :e u17 -> missingname_5b5f35da4b263dbee945b2ffcce9feabfa586bd96c2f75eb4e868d902a221323 (u17_to_Church17 x0) (u17_to_Church17 x1) = (fun x3 x4 : set => x3)).
Axiom missingprop_f44342ed74648c23c8734d945bc8b2c1af5a9cb594ef51477e7844cb71f944f8 : (forall x0, x0 :e u17 -> Church17_p (u17_to_Church17 x0)).
Theorem missingprop_5a882bfba561479cec0685426f31dd74aa30cb00242d3796e3e6472dff121436 : (forall x0 x1, missingname_39d12995313a19afef7ecefc4cb7c5af0c67ce24ca4c82b2d7063be7fa0c1166 x0 x1 -> missingname_39d12995313a19afef7ecefc4cb7c5af0c67ce24ca4c82b2d7063be7fa0c1166 x1 x0).
admit.
Qed.
Definition Church17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x0 x2 x4 x1 x3 x6 x8 x5 x7 x11 x9 x12 x10 x14 x15 x16 x13).
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
Definition Church17_to_u17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => x0 0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16).
Definition u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 : set -> set :=
 (fun x0 : set => Church17_to_u17 (Church17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 (u17_to_Church17 x0))).
Axiom missingprop_84aaefca7211a57d89e0df96a1f742653d3cc05f82d5ab568090ade3cb9ffcfd : u17_to_Church17 0 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x1).
Theorem missingprop_ddfd049a99d8a8d08a5969e20f08be40e16f962ab49dd05ba7dcd1cfd68e7645 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 0 = u1.
admit.
Qed.
Axiom missingprop_f880a8473dab9f58d69fbf332c8547d500ca315e405258a93c99a34f8560efb6 : u17_to_Church17 u1 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x2).
Theorem missingprop_3ce04bff2a395cf5fe0b94d0636cc8dbea0e46272d1360d7109558a625b43849 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u1 = u3.
admit.
Qed.
Axiom missingprop_7c154441ca7b7a9fe09539322ad6531c3f48333c7018e2f8c866c0af44719d1a : u17_to_Church17 u2 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x3).
Theorem missingprop_5f23a09617e395d3412bcd886825a830fcbca9dbfaa3bb762a6b0286bbba2699 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u2 = 0.
admit.
Qed.
Axiom missingprop_50de3f92839624b98789d3fa24556e40d38a727836b3c2bd366269421355b28d : u17_to_Church17 u3 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x4).
Theorem missingprop_2deda5cc0874f100e0fcd31fbab30140488390c1e46b9b2da484e79975ce6ae8 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u3 = u2.
admit.
Qed.
Axiom missingprop_f6f6b2d4f503fb9b975e320862d0437f04a94f96cc19149de839c0a7d55394f3 : u17_to_Church17 u4 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x5).
Theorem missingprop_d02d672c88891239a2034f8db0a8f9c766e8b44a6127d48b08a622cce7dc65fa : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u4 = u5.
admit.
Qed.
Axiom missingprop_ccd09fc33db26fba17a1e8f5fd52159b676a35cf5706e2e445b9db64b4fc35c5 : u17_to_Church17 u5 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x6).
Theorem missingprop_b4b0b30bf8e5ff91ed4869311536b86e18ba1e4d9dcdabf73d46693ed9a5b67b : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u5 = u7.
admit.
Qed.
Axiom missingprop_b2c765c786aca76bfef751038ffbb16620c4c7136061de036517f3c71ce2abfd : u17_to_Church17 u6 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x7).
Theorem missingprop_8a85de05c64795068871a87d3b06ba1e5395c94812285b09588df3e01a1e0ea3 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u6 = u4.
admit.
Qed.
Axiom missingprop_9d497d8c5ab47bb0417256780d394d93b6598b5e679bac7f2c3c702196ebcca4 : u17_to_Church17 u7 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x8).
Theorem missingprop_c0eb4e3448ef31f6408883194d369de2b67b2c3b8eb9ad88a4d52d9ee850a560 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u7 = u6.
admit.
Qed.
Axiom missingprop_8f7d877f09ad2d2b6bd165b15d072d92366514d5c83c4caef2b25c48dd454e7b : u17_to_Church17 u8 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x9).
Theorem missingprop_f74f5074ad12d57b1f85300d32210524157b09a0919ee38128acf015331c35f0 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u8 = u10.
admit.
Qed.
Axiom missingprop_08c2582e457fa5da2b4ee2676b94e0e9b149b350b636df86eee53e8e8dded2c1 : u17_to_Church17 u9 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x10).
Theorem missingprop_4e46240fa21fb39b84708f415e3b21cc616773a08b926976627048ab8fc29078 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u9 = u8.
admit.
Qed.
Axiom missingprop_c1a95e8160789154b1ae102566f570f1aea3813572fb362eeefeb21832fd0653 : u17_to_Church17 u10 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x11).
Theorem missingprop_29ccb5c4e7950928d647b0941425c5e64d69ebaaed74cba3c055174a14ae4c5b : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u10 = u11.
admit.
Qed.
Axiom missingprop_adf687ac5b6c91f712b3eb1ff0c482d096f763fa394d8ea395fcfe7d367eb8f2 : u17_to_Church17 u11 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x12).
Theorem missingprop_9b334a439f93d75505077dcc1fe4c60157a3105589338dee138085e931431815 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u11 = u9.
admit.
Qed.
Axiom missingprop_d33ea914c01284b1fc49147f7bcc51527f787dcf89c80cfdad2e5f419cbe1dbb : u17_to_Church17 u12 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x13).
Theorem missingprop_c21ba5695b1d95da76a10179e8a88254ffe230dfdf6a6df2f9b5ee9d0562acd5 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u12 = u13.
admit.
Qed.
Axiom missingprop_095d0670f988d22364f3d3b9681f2ca00bf954d60116baba131fbf1ee891de57 : u17_to_Church17 u13 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x14).
Theorem missingprop_ffb148d18f258a6f2e8b9af29fd6bea695bdd737e09f02c9ed6ace715b49951e : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u13 = u14.
admit.
Qed.
Axiom missingprop_c9b34bc382b6d599e61c555eac34a76c451754eb682c17d99a93f2a1e695d561 : u17_to_Church17 u14 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x15).
Theorem missingprop_5236a0eac529d064f7d4286c27876c5cf1e6aa8482e677668f1eb521e10e6be9 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u14 = u15.
admit.
Qed.
Axiom missingprop_e20cda3fec831e61f9db0bd6bee2791e26067278d174576042c0cb4b3ab479bb : u17_to_Church17 u15 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x16).
Theorem missingprop_991646d91cf5e2f3eac2db7f6827c54bc2cbba5f33c26bd9a4d54268790991f8 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u15 = u12.
admit.
Qed.
Axiom missingprop_2491d2eab9fb9ff25fa0ab1839a83bd77980933cdf40d8cdd9120c539e464911 : u17_to_Church17 u16 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x17).
Theorem missingprop_62f94f5542e1f8b8b8512388cf4d3916b76627d24c09c086c6cb15abd8ac6b28 : u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 u16 = u16.
admit.
Qed.
Axiom missingprop_485b5a544f4a752392d62c01e55a5e36a8748d64fd7af6f27349bd2453284446 : (forall x0, x0 :e u16 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 u15 -> x1 x0)).
Axiom missingprop_5652f21220a21736c3c1c7ff394952ea63f98e4255215cdb9aaab91866efe7dd : 1 :e 16.
Axiom missingprop_2af8bf40bf7eaefd36fa12e21921eb2aeb029dbe2775546e49d5225f179719d9 : 3 :e 16.
Axiom missingprop_fff531c49970071934428d0aef9046ef564b1c688918cc28a68137a9f7d29720 : 0 :e 16.
Axiom missingprop_c38dc1b25a0e2dc5936848fac54d16b82c023e49a17d0d1875549efe638d7dec : 2 :e 16.
Axiom missingprop_64382522dade5b30fc9c1f845f10dec6adec6991c810bee97f2f66f396cf6712 : 5 :e 16.
Axiom missingprop_7f2d06b1efe37247a690b4e859e3aaf365f1da38cf576ae8a74607a7521a1608 : 7 :e 16.
Axiom missingprop_146ef1143e471cfbb8d96545c2df24929043ca109ec4a7c8c78dd73fb371c488 : 4 :e 16.
Axiom missingprop_57616fbbcabc28eb1fb6407d841dda3edd107d79e8fcb804834746df27c3a6ca : 6 :e 16.
Axiom missingprop_4eba3f0917ffb7ab4575d03fa353c824d8d4f151df45c3ade8f1ca296d4cc0ee : 10 :e 16.
Axiom missingprop_f46bab0aaac49b12c19f821162ddb9736708dc036bc97f4e4318712d56c44f37 : 8 :e 16.
Axiom missingprop_ae3e46fe1608a88c13cfd94c7c4f636604e089dbe99822d5f16bc7323d0026af : 11 :e 16.
Axiom missingprop_96f337a74f7b868e3a36513c42dd4d06e5187cd640ec479c0814272a65371d35 : 9 :e 16.
Axiom missingprop_279fe6eb4b3ee21a0be2650377dfae573b176ecc12970f64812a6be52f3acfb9 : 13 :e 16.
Axiom missingprop_b79a9b70d083f86c18981643e47c737565f20b5a8d9333bff56376600ec4e5a4 : 14 :e 16.
Axiom missingprop_f388ecefb2fe6e2e313ca750501544c7c4c2bb13327baa7d874fe8dbdb4dc6e4 : 15 :e 16.
Axiom missingprop_6e0619c3165595ae4977f8d2ecfade1c59a6348e91d9234d9239b2fe0fb04ddf : 12 :e 16.
Theorem missingprop_9c7296d0e1b426393b918922dca14768e21a9144fb20f59ffa35f52b8b015e54 : (forall x0, x0 :e u16 -> u17_perm_1_3_0_2_5_7_4_6_10_8_11_9_13_14_15_12 x0 :e u16).
admit.
Qed.
