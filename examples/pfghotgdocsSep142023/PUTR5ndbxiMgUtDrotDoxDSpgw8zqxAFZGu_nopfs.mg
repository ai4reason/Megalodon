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
(* Parameter u17 "cd79716d8923d293cac26e380f44bd1d637c5275ecfc89b47177ddf0a6ed1145" "7a7688d6358f93625a885a93e92c065257968a83dad53f42a5517baa820cd98c" *)
Parameter u17 : set.
(* Parameter Church17_p "45876439a0ebffabe974dfc224bfb5fcf7cdefbe1842d969001ec0615838c25b" "2a50602e0a09f647d85d3e0968b772706a7501d07652bb47048c29a7df10757a" *)
Parameter Church17_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
(* Parameter u17_to_Church17 "2198544dc93adcfb7a0840e80ac836eba8457b7bbb3ccbbb3bc46e9112667304" "02709d69b879f00cff710051a82db11b456805f2bfe835c5d14f8c542276ac60" *)
Parameter u17_to_Church17 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set.
(* Parameter u1 "338dd245674671b9ed7925015246c4c4be0e334151ccd1c7d5a3567f5c4461a5" "8170ad5e6535f2661f0d055afe32d84d876773f4e8519ce018687f54b2ba9159" *)
Parameter u1 : set.
(* Parameter u2 "e6513b6b7dacfb379ee35c71b72ff5e0713f783ff08590c7fabcc4c48daf9f2e" "3bd7f72ec38573ff1d3910239a4aa349e3832908ab08202cf114451bffd7d17d" *)
Parameter u2 : set.
(* Parameter u3 "e803b40f939f4fe15fb61b29ded3bee1206757349f3b808c5103467101bdab9a" "1da7b5b024a841d0694168c01df8b0cada113e9c4616f1555b257b978dff46cc" *)
Parameter u3 : set.
(* Parameter u4 "7a516cda4555ee314bd599299eac983d7d569296583a629b47918e19d4a0f71f" "66241e5ccfbbd32429c1f14526f03d9d37590fe4ddf66171a76fae8bb5f8b113" *)
Parameter u4 : set.
(* Parameter u5 "2a783d5aa30540222437cf12bcd2250d09379447bbcfb2424ca047f449bf06b4" "81fa4107fe53377c8e9932359ab17b6be1f49b6646daa701ee0c5525e8489bca" *)
Parameter u5 : set.
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
(* Parameter u7 "af2de1d69c59ef5054cf8b6dce9a93a630001f055010b2d9b5c0f0945e37d127" "3cbeb3771776e1d1a12e3cb64dcc555d3ff2cc4de57d951cb6799fd09f57d004" *)
Parameter u7 : set.
(* Parameter u8 "4d5ccc56a929ac0c8f71c494d50309dfb6da04c7178c3bc993cde3ebf042a891" "ce0f39eb54c9fcc3c8025cbe688bc7bd697a0c77e023c724aa4ea22edcdfaa0f" *)
Parameter u8 : set.
(* Parameter u9 "09c26abdb88570cbb608edfbe57d30576c9a90b0d04071630aa0d3b62d9c634b" "f7b5ffe5245726f4af7381ced353e716ac8d1afab440daf56cd884ec8e25f3ac" *)
Parameter u9 : set.
(* Parameter u10 "992db04f3545ca6059e54ab6da6f2ea553db0f23228f7fec0d787191aaa7a699" "dacefbd6851dd6711e6ed263045ec145efad7c6f5bfe7e5223ba6c7c5533e61e" *)
Parameter u10 : set.
(* Parameter u11 "8d98a4d4dfcb8d45bfdcd349a4735f18958f85477c7c78e7af7b858830ea91e7" "fe7b8011fa04942e98e7459bad1082ace0dfdd32285ea0719af3aef0e9417e40" *)
Parameter u11 : set.
(* Parameter u12 "95f5d0914858066458ab42966efbfe1dd0f032e802a54f602e8e5407ac56ace7" "c03c309131c67756afa0fda4d4c84047a8defc43f47980c44c05639208cbaa8e" *)
Parameter u12 : set.
(* Parameter u13 "5fc070d127ffae798f70b712dd801ce996aeab3cec7aa3b427979e46f34030ae" "5e6da24eb2e380feb39c79acefdce29d92c5faf26abed0e1ca071eaf6e391f2f" *)
Parameter u13 : set.
(* Parameter u14 "889a1e76b981b1a33cf68477e7b8b953867e63c9dca7b1aeb36f1c325e9b2a89" "07f6b9e7ce1ef1900b104985e2aa47323bd902e38b2b479799fb998db97ff197" *)
Parameter u14 : set.
(* Parameter u15 "5c491c9addfc95c6b9d569a2be553029fe085eeae41ee78922d29695364b8620" "98e246907ff1cee98e10366044c2b784e01f55f3a758acab213d3e2ec3fb3388" *)
Parameter u15 : set.
(* Parameter u16 "f44edc3a0f316d5a784e3afbfb9fec2f3ce4a1f6f80d2f7df61dd3cd3466ad24" "5c2a16cdb094537a2fafee11c4bc651c9fb5d6c4e4cb5153e4b4d2abeb392dfd" *)
Parameter u16 : set.
Axiom missingprop_14e19ebc7e16f882d3be4482dbe497cecb7597969c9cae0a9f87fe87a0ee217a : (forall x0, x0 :e u17 -> (forall x1 : set -> prop, x1 Empty -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 u15 -> x1 u16 -> x1 x0)).
Axiom missingprop_84aaefca7211a57d89e0df96a1f742653d3cc05f82d5ab568090ade3cb9ffcfd : u17_to_Church17 Empty = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x1).
Axiom missingprop_e6619adff47bbbf90a12e5475c1b155ebb1e2991a2d17411fd40e422e21ff562 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x0).
Axiom missingprop_f880a8473dab9f58d69fbf332c8547d500ca315e405258a93c99a34f8560efb6 : u17_to_Church17 u1 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x2).
Axiom missingprop_93ed18843f4a06fdb1762e5b7fc89edc8da24a5d38de418508f9aca3fe120f8f : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x1).
Axiom missingprop_7c154441ca7b7a9fe09539322ad6531c3f48333c7018e2f8c866c0af44719d1a : u17_to_Church17 u2 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x3).
Axiom missingprop_233906471c2a36e258793125988364b5b4be5e26b5df943569d8a15ce4c97b59 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x2).
Axiom missingprop_50de3f92839624b98789d3fa24556e40d38a727836b3c2bd366269421355b28d : u17_to_Church17 u3 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x4).
Axiom missingprop_497df65ae9348f62989259dc92fffa35cd477d735ac36c17e9f5dc63bcd5da15 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x3).
Axiom missingprop_f6f6b2d4f503fb9b975e320862d0437f04a94f96cc19149de839c0a7d55394f3 : u17_to_Church17 u4 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x5).
Axiom missingprop_aeac4ee3d08fd60f864a3d40a6422b2070323f5bdb4e126705e59ff4ccf8fa26 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x4).
Axiom missingprop_ccd09fc33db26fba17a1e8f5fd52159b676a35cf5706e2e445b9db64b4fc35c5 : u17_to_Church17 u5 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x6).
Axiom missingprop_398a24facf4ebb42cf838f8cb0f1d64c4d83d480adfd36e0fa2e0b1bde52df48 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x5).
Axiom missingprop_b2c765c786aca76bfef751038ffbb16620c4c7136061de036517f3c71ce2abfd : u17_to_Church17 u6 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x7).
Axiom missingprop_8422ea19f7ca229a936fab0e3a1aadb25110b62375b34ff2715e426e6903f401 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x6).
Axiom missingprop_9d497d8c5ab47bb0417256780d394d93b6598b5e679bac7f2c3c702196ebcca4 : u17_to_Church17 u7 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x8).
Axiom missingprop_d792dc995f6520052dfc965493173e3531c29f8140df360fa3c27b7268ed80b5 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x7).
Axiom missingprop_8f7d877f09ad2d2b6bd165b15d072d92366514d5c83c4caef2b25c48dd454e7b : u17_to_Church17 u8 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x9).
Axiom missingprop_c37600b80efb18922b2424c0ae3622d88c262b6e7e6fb3aa0f6bc2b0ba9f1be7 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x8).
Axiom missingprop_08c2582e457fa5da2b4ee2676b94e0e9b149b350b636df86eee53e8e8dded2c1 : u17_to_Church17 u9 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x10).
Axiom missingprop_7fcbe5b61ad12e38a6853aaa6fe3dd0299d75fe061e77a480a4e344498540b83 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x9).
Axiom missingprop_c1a95e8160789154b1ae102566f570f1aea3813572fb362eeefeb21832fd0653 : u17_to_Church17 u10 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x11).
Axiom missingprop_3de64cc15c614d92c317d5d39969a651d867528244eff253971f4e6ee88dced0 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x10).
Axiom missingprop_adf687ac5b6c91f712b3eb1ff0c482d096f763fa394d8ea395fcfe7d367eb8f2 : u17_to_Church17 u11 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x12).
Axiom missingprop_6a85fd1fad00f32e7f8e46dd1246f3ab13554caed4c219f40087b53560da85b2 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x11).
Axiom missingprop_d33ea914c01284b1fc49147f7bcc51527f787dcf89c80cfdad2e5f419cbe1dbb : u17_to_Church17 u12 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x13).
Axiom missingprop_744a4c03b09434f04174e938301dc04f0c3f10e622d7fdbe408752834fe5b003 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x12).
Axiom missingprop_095d0670f988d22364f3d3b9681f2ca00bf954d60116baba131fbf1ee891de57 : u17_to_Church17 u13 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x14).
Axiom missingprop_d664e656d766635177b954bb19d911f5792a5b476afc9d95f66c535e94450d07 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x13).
Axiom missingprop_c9b34bc382b6d599e61c555eac34a76c451754eb682c17d99a93f2a1e695d561 : u17_to_Church17 u14 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x15).
Axiom missingprop_5749399996f8b07d8783c347f0cf6e04806eba2f6eba6fb3456b8e9db2686cda : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x14).
Axiom missingprop_e20cda3fec831e61f9db0bd6bee2791e26067278d174576042c0cb4b3ab479bb : u17_to_Church17 u15 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x16).
Axiom missingprop_9c9197f88eaab6add22634c2b7df334297862a6da7753d0d08affb6802924e7f : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x15).
Axiom missingprop_2491d2eab9fb9ff25fa0ab1839a83bd77980933cdf40d8cdd9120c539e464911 : u17_to_Church17 u16 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x17).
Axiom missingprop_65d5ff984a67d49c14142f780ead671595b0d7535fbc96a800a59481ec6515c0 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x16).
Theorem missingprop_f44342ed74648c23c8734d945bc8b2c1af5a9cb594ef51477e7844cb71f944f8 : (forall x0, x0 :e u17 -> Church17_p (u17_to_Church17 x0)).
admit.
Qed.
(* Parameter Church17_to_u17 "22f45af3c10db238bb5d9aa702e24179a9c1a79a5635eeec0be511465bc55bf4" "21bb26399802c128b4a27a6184c81e80a2bb391015d712920b939216289ef0b6" *)
Parameter Church17_to_u17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set.
Axiom missingprop_6d01d49ea450d3e472df52e27a7b74861b461083d49142b218ad17a5e9f7fa4b : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, x0 Empty = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x2) -> x0 u1 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x3) -> x0 u2 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x4) -> x0 u3 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x5) -> x0 u4 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x6) -> x0 u5 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x7) -> x0 u6 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x8) -> x0 u7 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x9) -> x0 u8 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x10) -> x0 u9 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x11) -> x0 u10 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x12) -> x0 u11 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x13) -> x0 u12 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x0 u13 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x0 u14 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x0 u15 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x0 u16 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> (forall x1, x1 :e u17 -> Church17_to_u17 (x0 x1) = x1)).
Theorem missingprop_f0f6d6a5e0bad31ef814582844f5581ef6b06897d8b34d179a5f11d6a4ff9407 : (forall x0, x0 :e u17 -> Church17_to_u17 (u17_to_Church17 x0) = x0).
admit.
Qed.
Axiom missingprop_1ff940d7d7fd07bca02cb8bae15a738ac9d18223e9b7d5f5dd029717e48b0871 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, x0 Empty = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x2) -> x0 u1 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x3) -> x0 u2 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x4) -> x0 u3 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x5) -> x0 u4 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x6) -> x0 u5 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x7) -> x0 u6 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x8) -> x0 u7 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x9) -> x0 u8 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x10) -> x0 u9 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x11) -> x0 u10 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x12) -> x0 u11 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x13) -> x0 u12 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x0 u13 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x0 u14 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x0 u15 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x0 u16 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> (forall x1, x1 :e u17 -> (forall x2, x2 :e u17 -> x0 x1 = x0 x2 -> x1 = x2))).
Theorem missingprop_0f7c616bb73771ade29bce8f388fabaa94de35f0c4e10984b06493960171ee05 : (forall x0, x0 :e u17 -> (forall x1, x1 :e u17 -> u17_to_Church17 x0 = u17_to_Church17 x1 -> x0 = x1)).
admit.
Qed.
Axiom missingprop_81b116436b34cea212d4f0309f3bfd58da18783dbb96b6586a91904b350781e5 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, x0 Empty = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x2) -> x0 u1 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x3) -> x0 u2 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x4) -> x0 u3 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x5) -> x0 u4 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x6) -> x0 u5 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x7) -> x0 u6 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x8) -> x0 u7 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x9) -> x0 u8 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x10) -> x0 u9 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x11) -> x0 u10 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x12) -> x0 u11 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x13) -> x0 u12 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x0 u13 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x0 u14 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x0 u15 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x0 u16 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> (forall x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x1 -> x0 (Church17_to_u17 x1) = x1)).
Theorem missingprop_e902edb7e5c09f3911de6e6e7b47397939aa697886c0b6b7be0233b3765bcf65 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> u17_to_Church17 (Church17_to_u17 x0) = x0).
admit.
Qed.
Axiom missingprop_0ed18bb9d63aa65d76c545a5c0227e94d836fbdbd08f00102f2e948d25e0c0c7 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, x0 Empty = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x2) -> x0 u1 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x3) -> x0 u2 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x4) -> x0 u3 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x5) -> x0 u4 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x6) -> x0 u5 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x7) -> x0 u6 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x8) -> x0 u7 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x9) -> x0 u8 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x10) -> x0 u9 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x11) -> x0 u10 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x12) -> x0 u11 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x13) -> x0 u12 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x14) -> x0 u13 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x15) -> x0 u14 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x16) -> x0 u15 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x17) -> x0 u16 = (fun x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 : set => x18) -> (forall x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x1 -> Church17_p x2 -> Church17_to_u17 x1 = Church17_to_u17 x2 -> x1 = x2)).
Theorem missingprop_0409fc63d5e09806f0d197a90f2706fe3b3c5ec67a48a8bf386c0d0bc6041f7a : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> Church17_to_u17 x0 = Church17_to_u17 x1 -> x0 = x1).
admit.
Qed.
(* Parameter TwoRamseyGraph_3_6_Church17 "c28a4cc056045e49139215cfe5c8d969033f574528ca9155b0d4b2645f0bfb5c" "ab34eea44c60018e5f975d4318c2d3e52e1a34eb29f14ca15ff8cefeb958c494" *)
Parameter TwoRamseyGraph_3_6_Church17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set.
Definition TwoRamseyGraph_3_6_17 : set -> set -> prop :=
 (fun x0 x1 : set => x0 :e u17 -> x1 :e u17 -> TwoRamseyGraph_3_6_Church17 (u17_to_Church17 x0) (u17_to_Church17 x1) = (fun x3 x4 : set => x3)).
Axiom missingprop_ee5e0fe730eedc37f764400300b0ed7a640b3bede985cf7ccb67403eb532be1a : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> TwoRamseyGraph_3_6_Church17 x0 x1 = TwoRamseyGraph_3_6_Church17 x1 x0).
Theorem missingprop_5cece90b225888ed5e86060411031b7dea9c395004ca9e7ebb9069250f2769f8 : (forall x0 x1, TwoRamseyGraph_3_6_17 x0 x1 -> TwoRamseyGraph_3_6_17 x1 x0).
admit.
Qed.
(* Parameter Subq "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" "81c0efe6636cef7bc8041820a3ebc8dc5fa3bc816854d8b7f507e30425fc1cef" *)
Parameter Subq : set -> set -> prop.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
(* Parameter not "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" "f30435b6080d786f27e1adaca219d7927ddce994708aacaf4856c5b701fe9fa1" *)
Parameter not : prop -> prop.
Axiom missingprop_cbfb4a8ef037f9166e98e89145be924f54fff8f394689b1e9c22eef2210bedb6 : (forall x0 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, (forall x1, x1 :e u17 -> Church17_p (x0 x1)) -> (forall x1, x1 :e u17 -> (forall x2, x2 :e u17 -> x0 x1 = x0 x2 -> x1 = x2)) -> (forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x2 :e u17 -> x3 :e u17 -> TwoRamseyGraph_3_6_Church17 (x0 x2) (x0 x3) = (fun x5 x6 : set => x5)) -> (forall x2, x2 c= u17 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))))).
Theorem missingprop_97757aa046fc628a1493769feaf18aac5937e0cb3d98e54a6c0796c9e5514262 : (forall x0, x0 c= u17 -> atleastp u3 x0 -> not (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> TwoRamseyGraph_3_6_17 x1 x2))).
admit.
Qed.
