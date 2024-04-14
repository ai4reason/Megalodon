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
Definition u18 : set :=
 ordsucc u17.
Definition u19 : set :=
 ordsucc u18.
Definition u20 : set :=
 ordsucc u19.
Definition u21 : set :=
 ordsucc u20.
Definition u22 : set :=
 ordsucc u21.
Definition u23 : set :=
 ordsucc u22.
Definition u24 : set :=
 ordsucc u23.
Definition u25 : set :=
 ordsucc u24.
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Theorem missingprop_c12285364f107ae7d5ef016a23e15f3c94608acd035dd4eab6e840e77bdc8e61 : u13 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom ordsucc_inj_contra : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> ordsucc x0 = ordsucc x1 -> (forall x2 : prop, x2)).
Axiom missingprop_c9b4e12fb0aac9a865933938cbf5882f899389d7530b1a6017a25523b517d77b : u12 = 0 -> (forall x0 : prop, x0).
Theorem missingprop_718815618fb408e7f9b6a92ac99a4e34c4c560dd6f617b4e7a3baae4d71063ec : u13 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_fac08972bb876bc2457930272ed91a55b92fbe2a965f8dbfa94c531b056fd466 : u12 = u1 -> (forall x0 : prop, x0).
Theorem missingprop_0563767a7ae8cf0f38a2ce998f4f61c0f4d5f10bd129b2c62e0e73969f860e28 : u13 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_9925a94179f9b96e15bb2f5f3151446cc17d0f38ddaec97b207a42442fb0efed : u12 = u2 -> (forall x0 : prop, x0).
Theorem missingprop_f23c647528c9edaac83020c9ff5a3f2c5a7a4a9b995a628c2a71b9eb6cd8e669 : u13 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_21d350f752803e70816c84c0f32485027c6c1878657f7263a7ebfa87995c9b6a : u12 = u3 -> (forall x0 : prop, x0).
Theorem missingprop_0b3e3e45ef080c7b7a49c00c4067713ad08b47ab8b0713e5aaab56e6d7a5b982 : u13 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_0aa1897333a9220b7c647af2a5a102d331686166cd7d81d697467978bffb14b8 : u12 = u4 -> (forall x0 : prop, x0).
Theorem missingprop_708a12eb026e4d3c08fc829f55688c54d28c54b0af95cbb973e74a0d726eddda : u13 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_01c5167c045808e88e705b476ce2dd0e57d03d1d5f6a26f61825a32395c242ea : u12 = u5 -> (forall x0 : prop, x0).
Theorem missingprop_10123744e9181acb5f4770c4e7c8d274437210700731399dc702b025f786eb1e : u13 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_3de237895f633cd0c01630052cea1ce37b395b2138c60358b21cdd63976e7e77 : u12 = u6 -> (forall x0 : prop, x0).
Theorem missingprop_128d4a775d786f77bf13bb7dd7cb9742308ad661f9914b0ba314109642dc74a2 : u13 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_944319b563f360f8276cf6ed579bfd97549280496ef3a59878dc7367e0289497 : u12 = u7 -> (forall x0 : prop, x0).
Theorem missingprop_e20a3f49533352fe1b05bebbb2ae624ad084f8a027d8217543b43ae55b811240 : u13 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_405ba169154d9d42445b73345355e3c1ff4a4c35ee248b0842bd8e1a26057bf4 : u12 = u8 -> (forall x0 : prop, x0).
Theorem missingprop_2f6e5b1338db3ff412e38a1ecfa4d466e2517777a8bbed02c867df317c357933 : u13 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_e9452875caa538a193e13eb1accc0d1d2221ffa1eb64478ef4b831d0c7fb8587 : u12 = u9 -> (forall x0 : prop, x0).
Theorem missingprop_611c167b8d8d5c2c171ede951fd79aafcb1fd16fb816a3f0e5c0edff9bd7addf : u13 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_a52e53b541a40078b90241258be0a0067f5bc813eb10693b9b961df0bbb05001 : u12 = u10 -> (forall x0 : prop, x0).
Theorem missingprop_0a910a83fae7c1219e51ae6f441b8120dc6f2353f129945859e5867a1d5c1be3 : u13 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_dd600363d78f5191d99ddf5f03f668be69bef6f49770dc87b299c981791e709b : u12 = u11 -> (forall x0 : prop, x0).
Theorem missingprop_f4e278a6bf4004a90230a7ce4599c33df3b13afc88036ef1d8ff3a4ef834b193 : u13 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_786d05e7abced1a9dc9d53bbc0ccf61863e522b5215ae9f11752fff2bf124321 : u14 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3ec40051a51fd9abd0f1ea045695fd96747c0b44c83f1a0d528b4d75589d7df9 : u14 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_2451f846ade20c2c83b68d6ca07174f7098b4b15fe1ab38e4417b5ec5afc3945 : u14 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_8d07e49985de556386320c4394a4f81f882951458280531346f93de382828ccf : u14 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_5c17fff000510475687b445d243a8658952ee19ef7f469feb3e238dfb5022180 : u14 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_8e078aa58d96c679c691026d3dbd3c5ddf82d7052472d7ebfc54e4b027091692 : u14 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_521d57c2f7a8a26330ae69c04fff1b24cc86e4837a4836a4fefa73fad1a725cc : u14 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_6b6d879f9198c0f8972b1370a6b60ca474de18dcfd00d1cbe42fb36343cfa178 : u14 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9cd8c17074dbeec0fef19f04ec8a941cf429e15b37b6046a94fab0afa09de770 : u14 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_16378467aced8215056140af611424a7d8477e41af2c1f3af8bef49b9f0df0b7 : u14 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3e7054688acb8ba4a0f18423b649f383cf90ecfc4f6200e2e049d580ebc2dc1f : u14 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_00afc3423aeef527fa52daa0e685caaf0adcec70a4145f09454ed0ecaf166b37 : u14 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_15d8fee75ef2fcef507dcd58e078d7224460844031194a35f38ebec160a6c36c : u14 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_ccf4a5c6b3a6e4954a14109684a2ab83b52a2425e80e3019435c7a784c78b93f : u14 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9777c32431e56f82c3c2627629f063e7a7752ce2500aecd27c072fd538c564d1 : u15 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_033f55ba76fb230c8269a9f3dfb9ab5f1debf38df2ed6a8204e88ab225544563 : u15 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_638ca97253dde1f6c05ae5a7b43aa5519bcb932d746f1ff6c11c6149deab9734 : u15 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_c966e250c9e0036300c545a4c37f99c2c56d590f24ba184faeb741ac623ddc71 : u15 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_a504807aba1f063c619c47c7790e6a97b78d6221a696d3a06eab792e3bc4d832 : u15 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_6be75df4f14c9bfa3abf6ed370fc5224c8cd92769e2571dbc7f3e2b0899c3f2a : u15 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_6163c724a9d7981c89b6bf365a0bebe9efec08b9eff4bb6184424f2ae3577228 : u15 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_03bfa5a110b404de8380cbf91407efa16bc92e74bb78c456f8556ff689d59c2c : u15 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_85105fca2bacc886dc8c29d2893d8d6f48bf2df156b5c5ec0c4e6b02418bc580 : u15 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_a4ffe2c5c180b0a50257540c321c6d0ac174e6dcf67a517314fd5483733bd52b : u15 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_c2d8fac90c753ba98b910dfebba93313752c3581721985e0c507115f57afbe2d : u15 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_ee5d720135ac2a1e6675f04fc296d39836826d1754aace8d3d88db80c3a9bf7b : u15 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_b71ad64ae5ee6739b72b7cf6202281008bcc9edc7ad98b81f40c22a64711fdc6 : u15 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_c4ec81028536a24273f04958b27208043a8e72bdb9f95435ebeb3fd5cd7535fc : u15 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9052a17aeb56f0baa5bd35ac678f9db733e32e563a9d0a61b0417ed4592a2293 : u15 = u14 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_60f83cb2d5e8fad8ed3c2af8b6c5009dbe5ca939fa34d10ed5528a8ef488fb1c : u16 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_dd20a269eccc8405cd94f4653428a5da7b33d3be25fb8510f632ef3230f1eaee : u16 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_400b33ea5b5f2607d4b48b99be02261c15c83e529ac6bfd70aa57fb0ff63c531 : u16 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_1cbb58c41f118085219f3b586c887a5ff408369fe6b52ca74e9366bfb8457cff : u16 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_0cb59343f7ca2c0440165ef2670fd7644d9775c5a4a86baf53d90bca3bd63cc9 : u16 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_ca26de1b59c322d42d6f3d7e731e4e561915afe66882738ab608ff1268374915 : u16 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_d390a940e0d8b8c681ccbf6c46f5374ccc304295ccc2cd1522dd66f6c32997a7 : u16 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_a0bdf0079e7b1581b89ab957e2cd7f488793d97d1d94621d3aa6a4fac9f22b96 : u16 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_14e13a8771031ad5c0fbcddcde043936c377ce19df59c8a5042720afd8292b32 : u16 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_ce4f8ce5934f96e0a92d8234aa49fd2e8ec60a5807531af02b0c19b05dffb12a : u16 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_728a499fa827f2373d0f5f59b334ba8b9cac6c83450172e25304b57de1e9058f : u16 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_47b0549db93ebcad72e3d90923d72379e5655902a485807edad02af70ddd3445 : u16 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_0c2339ef07f9be63916ba4ed21f5ed3d1c0fc25d2883650f1a08db958e637e32 : u16 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_4e5614ee6c60ca75b34344cfddfbe4840c89f999d594b201761970f40f5f2255 : u16 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_44dd594ce330f92aa460a3bc4ae154c08d18da149afbcbc953cc12dc2b8e3572 : u16 = u14 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_5f312c1824a4beefed581d01c6269bf8f1701f7ed4c65d144b4397173c0fe00c : u16 = u15 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_c10ffc842b1feac4011c0a612b866401499a0aa675807f68696735695362f834 : u17 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_b50d58026fa33219aaaeb728c67b0b8c499309c16668e3e93aafc6ea809d6263 : u17 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_adfda4bbbea6ce7896bcce20701756c0ad035e3d8423139fd5e3887e46248125 : u17 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_d73e6f3c75d5b61b17d9e7d6d295600c0d01ea70ebf65e2417dfd86ee0ffbb16 : u17 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_38e0b36ff0df3d6b667701d4ef47c86c5e393d438215664e91e75aa95d5e54b0 : u17 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_59d0e14977704774062693c254c6ccfc80426c45e29c2388a3b7f1ee2fe268d9 : u17 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_85b2adc94c49bab8c1d22cc2a4a0b91d88be95ce8e4a8f670459b5e66783cdc8 : u17 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3c9a2120714f6700d4a7aaab84df2b3570d7b0bac6641e679a646725f1f1cb75 : u17 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_027e16179ffa873e39aef19aef614c18046cbcf4d3543939e625bd021d996281 : u17 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_b4b3a0dfa06748759f5a505b09d8dd0c2a7429c04dab53e0f6653afd1b6dfda2 : u17 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_188cfa634d7792bd8dc29273791ddd9c2cc6f62f72e402ad8af062f1bf4a9fe0 : u17 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_914edee65675f074ac22e4efdf62b56d906e2295ea6417cdabcb9106e39ee5b7 : u17 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_8eaa93cc7c4bcbcbb1f07d443104b205adf3348852d4ec8f16651f667e0e3468 : u17 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_ec9593399259670f4eff77c972d13de69785d35423977aacd7e0e7a77e866b61 : u17 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_4867b3ce4fe1d0a1c8ff8d2e2bc0717758c4ccc013cbbaaf26121557137d2316 : u17 = u14 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_d1dffc1c336e15bfd52ffbb0cdea2a47c856c061ff9c118dd9e985b84e29dc83 : u17 = u15 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_48ad08e3fcea446c4edb5e27702cf310c322bf29128458b86d14b643f3111333 : u17 = u16 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_7c4b5e1c83fc5ebd0a5007202194501337aaba689805928ff54a501fa7ba114d : u18 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_bfc47753cc6814de196bab2dfc7b00ef059e8fcc866c0bdc69a80fa88efd67fc : u18 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_efa1d73733dbc5a8ae5a619684c14c29ddbe77bafcb128cb54636ceeb244a607 : u18 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3a7b934d7ddbd20a9e0903f2e32b7a26618ef93ffbea28de94535c59de69b9d2 : u18 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_7a2a7d79f58f1a8ab2a9c85b1353d3c76c2bde99aca8f458ec796bdb22fd6792 : u18 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_d83dad648efc18d38402e1c2bed2c4218fb94161d6f09d73e65dd826ebcdade1 : u18 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_bfa78384ac30acdfb4ec29b6c82e28746fbf661532a214abaa8063172ead9db8 : u18 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_a87a3028f64709be51c5175d14a7642f5bef9d6fb8552482a68d3b5ad1bb9fc7 : u18 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_548faab671fbcbca5c8c96c40ed3ea4775dd638976a2683d16e484be5d3edb57 : u18 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_7cc4617dc6a7b9b7b4cec660f935312e4b995dbb2f6599889fcacbe5b8ec47f7 : u18 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_06cb0ea543f1131f3e8888a6c830beba57dd4d090b172cbec554e85157657538 : u18 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_da971a7415a7263658d47e8afc4b6794d759a8c7957d4366d64b0d2d75db1ebf : u18 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3f4bdda365f7082eb6568cc69821ad4bf647cdd91bb2b4891b334f887b101966 : u18 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_7a7799a9fec173b362f0323fa1cd53f8e2240349c54f9f849ff0506280ed3fdd : u18 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_95a48bd166473dd69fbd1d6c212b33b8b186a59fa5f64873a57a406abcd861d7 : u18 = u14 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_fc69b4f24fa74882a934d6a846b06596684e5849597d21231c600ed2d7a43c70 : u18 = u15 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_48199a2c576158ae82528e00e9bdbc57db7b153fd2b9b08b5d19a699f50aefe3 : u18 = u16 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_73b9cd20f7c68e88e2ea426419ccd36b4d3b28c76cc72d670d7f8ae953c13bf1 : u18 = u17 -> (forall x0 : prop, x0).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom missingprop_713be0ad5efeb9da26a66462505f19060bd4cc2891c0c4c304dba8053e47660a : (forall x0, x0 :e u13 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 x0)).
Theorem missingprop_f5f38a41dc62ca37f571854f7a510ceb2fb66dd24a6e8bc2c5339fc412f0b60f : (forall x0, x0 :e u14 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 x0)).
admit.
Qed.
Theorem missingprop_b9effc4b8ae0e51a99f6aeca88a2b3a49f1889abba53e61c066a155c07bbdf08 : (forall x0, x0 :e u15 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 x0)).
admit.
Qed.
Theorem missingprop_485b5a544f4a752392d62c01e55a5e36a8748d64fd7af6f27349bd2453284446 : (forall x0, x0 :e u16 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 u15 -> x1 x0)).
admit.
Qed.
Theorem missingprop_14e19ebc7e16f882d3be4482dbe497cecb7597969c9cae0a9f87fe87a0ee217a : (forall x0, x0 :e u17 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 u15 -> x1 u16 -> x1 x0)).
admit.
Qed.
Theorem missingprop_827876b9bde6ba1cc397559c0b520083fab12475e474e4a63ab3da4cb1b80aae : (forall x0, x0 :e u18 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 u15 -> x1 u16 -> x1 u17 -> x1 x0)).
admit.
Qed.
Theorem missingprop_c39a560fb3dd838429debcea7f8257835f23767fff7eaea9dcf4b5024ff1eb2e : (forall x0, x0 :e u19 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 u6 -> x1 u7 -> x1 u8 -> x1 u9 -> x1 u10 -> x1 u11 -> x1 u12 -> x1 u13 -> x1 u14 -> x1 u15 -> x1 u16 -> x1 u17 -> x1 u18 -> x1 x0)).
admit.
Qed.
