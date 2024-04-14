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
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom neq_1_0 : u1 = Empty -> (forall x0 : prop, x0).
Axiom neq_2_0 : u2 = Empty -> (forall x0 : prop, x0).
Axiom neq_3_0 : u3 = Empty -> (forall x0 : prop, x0).
Axiom neq_4_0 : u4 = Empty -> (forall x0 : prop, x0).
Axiom neq_5_0 : u5 = Empty -> (forall x0 : prop, x0).
Axiom neq_6_0 : u6 = Empty -> (forall x0 : prop, x0).
Axiom neq_7_0 : u7 = Empty -> (forall x0 : prop, x0).
Axiom neq_8_0 : u8 = Empty -> (forall x0 : prop, x0).
Axiom neq_9_0 : u9 = Empty -> (forall x0 : prop, x0).
Axiom missingprop_871e92d1e015b90191f05be741b9ed2cc4491066cf0bf7b2d76c5d141ce801a4 : u10 = Empty -> (forall x0 : prop, x0).
Axiom missingprop_363035042db213d82b8567e67d435ec9f0597b9e71631d1860566db3f413fe41 : u11 = Empty -> (forall x0 : prop, x0).
Axiom missingprop_c9b4e12fb0aac9a865933938cbf5882f899389d7530b1a6017a25523b517d77b : u12 = Empty -> (forall x0 : prop, x0).
Axiom missingprop_c12285364f107ae7d5ef016a23e15f3c94608acd035dd4eab6e840e77bdc8e61 : u13 = Empty -> (forall x0 : prop, x0).
Axiom missingprop_786d05e7abced1a9dc9d53bbc0ccf61863e522b5215ae9f11752fff2bf124321 : u14 = Empty -> (forall x0 : prop, x0).
Axiom missingprop_9777c32431e56f82c3c2627629f063e7a7752ce2500aecd27c072fd538c564d1 : u15 = Empty -> (forall x0 : prop, x0).
Axiom missingprop_60f83cb2d5e8fad8ed3c2af8b6c5009dbe5ca939fa34d10ed5528a8ef488fb1c : u16 = Empty -> (forall x0 : prop, x0).
Axiom neq_2_1 : u2 = u1 -> (forall x0 : prop, x0).
Axiom neq_3_1 : u3 = u1 -> (forall x0 : prop, x0).
Axiom neq_4_1 : u4 = u1 -> (forall x0 : prop, x0).
Axiom neq_5_1 : u5 = u1 -> (forall x0 : prop, x0).
Axiom neq_6_1 : u6 = u1 -> (forall x0 : prop, x0).
Axiom neq_7_1 : u7 = u1 -> (forall x0 : prop, x0).
Axiom neq_8_1 : u8 = u1 -> (forall x0 : prop, x0).
Axiom neq_9_1 : u9 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_a7fa19a834d529db93c1b2300b41b17f336102b7793b24e9a750d6e03dec690c : u10 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_da9cd2315b0ab3b3dbcd7c4069c6d07f8e8a7c3b5321d78acb9ddfea02c56e54 : u11 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_fac08972bb876bc2457930272ed91a55b92fbe2a965f8dbfa94c531b056fd466 : u12 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_718815618fb408e7f9b6a92ac99a4e34c4c560dd6f617b4e7a3baae4d71063ec : u13 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_3ec40051a51fd9abd0f1ea045695fd96747c0b44c83f1a0d528b4d75589d7df9 : u14 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_033f55ba76fb230c8269a9f3dfb9ab5f1debf38df2ed6a8204e88ab225544563 : u15 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_dd20a269eccc8405cd94f4653428a5da7b33d3be25fb8510f632ef3230f1eaee : u16 = u1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : u3 = u2 -> (forall x0 : prop, x0).
Axiom neq_4_2 : u4 = u2 -> (forall x0 : prop, x0).
Axiom neq_5_2 : u5 = u2 -> (forall x0 : prop, x0).
Axiom neq_6_2 : u6 = u2 -> (forall x0 : prop, x0).
Axiom neq_7_2 : u7 = u2 -> (forall x0 : prop, x0).
Axiom neq_8_2 : u8 = u2 -> (forall x0 : prop, x0).
Axiom neq_9_2 : u9 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_5f3179724a6e8ef693da33b4da734e3c0d8d3295b89093b2f129371490f35854 : u10 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_93bd155ae66f9293399dab321235e159c709aa50be6b4209e260d5c571069bc3 : u11 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_9925a94179f9b96e15bb2f5f3151446cc17d0f38ddaec97b207a42442fb0efed : u12 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_0563767a7ae8cf0f38a2ce998f4f61c0f4d5f10bd129b2c62e0e73969f860e28 : u13 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_2451f846ade20c2c83b68d6ca07174f7098b4b15fe1ab38e4417b5ec5afc3945 : u14 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_638ca97253dde1f6c05ae5a7b43aa5519bcb932d746f1ff6c11c6149deab9734 : u15 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_400b33ea5b5f2607d4b48b99be02261c15c83e529ac6bfd70aa57fb0ff63c531 : u16 = u2 -> (forall x0 : prop, x0).
Axiom neq_4_3 : u4 = u3 -> (forall x0 : prop, x0).
Axiom neq_5_3 : u5 = u3 -> (forall x0 : prop, x0).
Axiom neq_6_3 : u6 = u3 -> (forall x0 : prop, x0).
Axiom neq_7_3 : u7 = u3 -> (forall x0 : prop, x0).
Axiom neq_8_3 : u8 = u3 -> (forall x0 : prop, x0).
Axiom neq_9_3 : u9 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_155e8a92a8ae96b946418659d12b00e3fef62dadc1bc31d4f074bcb712786356 : u10 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_6c307483f1e9d79cbd1be8f99cb0623b215d2a96dd7ca22776b1132e2b377d33 : u11 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_21d350f752803e70816c84c0f32485027c6c1878657f7263a7ebfa87995c9b6a : u12 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_f23c647528c9edaac83020c9ff5a3f2c5a7a4a9b995a628c2a71b9eb6cd8e669 : u13 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_8d07e49985de556386320c4394a4f81f882951458280531346f93de382828ccf : u14 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_c966e250c9e0036300c545a4c37f99c2c56d590f24ba184faeb741ac623ddc71 : u15 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_1cbb58c41f118085219f3b586c887a5ff408369fe6b52ca74e9366bfb8457cff : u16 = u3 -> (forall x0 : prop, x0).
Axiom neq_5_4 : u5 = u4 -> (forall x0 : prop, x0).
Axiom neq_6_4 : u6 = u4 -> (forall x0 : prop, x0).
Axiom neq_7_4 : u7 = u4 -> (forall x0 : prop, x0).
Axiom neq_8_4 : u8 = u4 -> (forall x0 : prop, x0).
Axiom neq_9_4 : u9 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_ccc1fa6cae49dec573eda0a7cb35b2ad4debf37b10463565ebc6d1385353f388 : u10 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_a386dcc739aba4ef656c3a82802ebcbe7e87dae1ec14c96538c3fd461f6a0883 : u11 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_0aa1897333a9220b7c647af2a5a102d331686166cd7d81d697467978bffb14b8 : u12 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_0b3e3e45ef080c7b7a49c00c4067713ad08b47ab8b0713e5aaab56e6d7a5b982 : u13 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_5c17fff000510475687b445d243a8658952ee19ef7f469feb3e238dfb5022180 : u14 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_a504807aba1f063c619c47c7790e6a97b78d6221a696d3a06eab792e3bc4d832 : u15 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_0cb59343f7ca2c0440165ef2670fd7644d9775c5a4a86baf53d90bca3bd63cc9 : u16 = u4 -> (forall x0 : prop, x0).
Axiom neq_6_5 : u6 = u5 -> (forall x0 : prop, x0).
Axiom neq_7_5 : u7 = u5 -> (forall x0 : prop, x0).
Axiom neq_8_5 : u8 = u5 -> (forall x0 : prop, x0).
Axiom neq_9_5 : u9 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_1a168a095e76e59ad83d93a60c30f2a4b23a38b25f72b379498ed6c0a6728b15 : u10 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_7ad531d6eaae09cf142317793b067ab02fe09b619a36a2cbc6f0876a1fd1ba74 : u11 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_01c5167c045808e88e705b476ce2dd0e57d03d1d5f6a26f61825a32395c242ea : u12 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_708a12eb026e4d3c08fc829f55688c54d28c54b0af95cbb973e74a0d726eddda : u13 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_8e078aa58d96c679c691026d3dbd3c5ddf82d7052472d7ebfc54e4b027091692 : u14 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_6be75df4f14c9bfa3abf6ed370fc5224c8cd92769e2571dbc7f3e2b0899c3f2a : u15 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_ca26de1b59c322d42d6f3d7e731e4e561915afe66882738ab608ff1268374915 : u16 = u5 -> (forall x0 : prop, x0).
Axiom neq_7_6 : u7 = u6 -> (forall x0 : prop, x0).
Axiom neq_8_6 : u8 = u6 -> (forall x0 : prop, x0).
Axiom neq_9_6 : u9 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_1caafcfab421a8bbf73edb3267db1f6908bd5029c181663700c5c637b54bb883 : u10 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_a218356df980789875659155b1ed2b3563be2916e1184b396ad2583b0b523a18 : u11 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_3de237895f633cd0c01630052cea1ce37b395b2138c60358b21cdd63976e7e77 : u12 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_10123744e9181acb5f4770c4e7c8d274437210700731399dc702b025f786eb1e : u13 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_521d57c2f7a8a26330ae69c04fff1b24cc86e4837a4836a4fefa73fad1a725cc : u14 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_6163c724a9d7981c89b6bf365a0bebe9efec08b9eff4bb6184424f2ae3577228 : u15 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_d390a940e0d8b8c681ccbf6c46f5374ccc304295ccc2cd1522dd66f6c32997a7 : u16 = u6 -> (forall x0 : prop, x0).
Axiom neq_8_7 : u8 = u7 -> (forall x0 : prop, x0).
Axiom neq_9_7 : u9 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_f90d6a14135c76785343d196a602714aaebc8f848035cb3fc7d99e4a8069fa52 : u10 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_10a35d241244d98b266514a8fe38926cbcc9f4c51c46fbe5923bab64f9db063e : u11 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_944319b563f360f8276cf6ed579bfd97549280496ef3a59878dc7367e0289497 : u12 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_128d4a775d786f77bf13bb7dd7cb9742308ad661f9914b0ba314109642dc74a2 : u13 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_6b6d879f9198c0f8972b1370a6b60ca474de18dcfd00d1cbe42fb36343cfa178 : u14 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_03bfa5a110b404de8380cbf91407efa16bc92e74bb78c456f8556ff689d59c2c : u15 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_a0bdf0079e7b1581b89ab957e2cd7f488793d97d1d94621d3aa6a4fac9f22b96 : u16 = u7 -> (forall x0 : prop, x0).
Axiom neq_9_8 : u9 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_00ce3e990e394696d648599b893a93cd3cb153c371b93008eddec6849fd2aaa9 : u10 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_e3e7876f64d57e7b4aae114d87715d9a64fc4129a1a28df53f278ae0d8499348 : u11 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_405ba169154d9d42445b73345355e3c1ff4a4c35ee248b0842bd8e1a26057bf4 : u12 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_e20a3f49533352fe1b05bebbb2ae624ad084f8a027d8217543b43ae55b811240 : u13 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_9cd8c17074dbeec0fef19f04ec8a941cf429e15b37b6046a94fab0afa09de770 : u14 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_85105fca2bacc886dc8c29d2893d8d6f48bf2df156b5c5ec0c4e6b02418bc580 : u15 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_14e13a8771031ad5c0fbcddcde043936c377ce19df59c8a5042720afd8292b32 : u16 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
Theorem missingprop_0bdc9214f3d13da435022f8588b958836c09a818ca32d79d0900f54c8d2527a2 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> (fun x3 x4 : set => x0 x3 x3 x3 x3 x3 x3 x3 x3 x3 x4 x4 x4 x4 x4 x4 x4 x4) = (fun x3 x4 : set => x3) -> x0 Empty u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 = x1 Empty u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 -> x0 = x1).
admit.
Qed.
