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
Axiom neq_ordsucc_0 : (forall x0, ordsucc x0 = 0 -> (forall x1 : prop, x1)).
Theorem missingprop_d7cf3bd48dcbe76e88e96e7372dc0dbc5c8fe92cd35e3d83899abc89d027d482 : u19 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom ordsucc_inj_contra : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> ordsucc x0 = ordsucc x1 -> (forall x2 : prop, x2)).
Axiom missingprop_7c4b5e1c83fc5ebd0a5007202194501337aaba689805928ff54a501fa7ba114d : u18 = 0 -> (forall x0 : prop, x0).
Theorem missingprop_2b643d529cbe64b9d5c06a17f68356af79094ca9e64ae17d5638290279e7fec2 : u19 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_bfc47753cc6814de196bab2dfc7b00ef059e8fcc866c0bdc69a80fa88efd67fc : u18 = u1 -> (forall x0 : prop, x0).
Theorem missingprop_0a926f3257e3e75e3bae57ff1d33d9d41cd5be64bd452ae63bdcf3291db86460 : u19 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_efa1d73733dbc5a8ae5a619684c14c29ddbe77bafcb128cb54636ceeb244a607 : u18 = u2 -> (forall x0 : prop, x0).
Theorem missingprop_07e454a581ae12456411a99180327bb4cb9a5e9e31166fb37c99add73f8af102 : u19 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_3a7b934d7ddbd20a9e0903f2e32b7a26618ef93ffbea28de94535c59de69b9d2 : u18 = u3 -> (forall x0 : prop, x0).
Theorem missingprop_7cef4da175a1a28f6d93e755ff21bf5c4f572cedc33b9a9449f114cf5e596796 : u19 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_7a2a7d79f58f1a8ab2a9c85b1353d3c76c2bde99aca8f458ec796bdb22fd6792 : u18 = u4 -> (forall x0 : prop, x0).
Theorem missingprop_0dd50f4d116b52218f20eed44696e4dc1eb1af8c398cff0ede31c8f12b1df7cb : u19 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_d83dad648efc18d38402e1c2bed2c4218fb94161d6f09d73e65dd826ebcdade1 : u18 = u5 -> (forall x0 : prop, x0).
Theorem missingprop_597c22e2aab3a6e2ffbdc7fe889a854131926294e9275de243b6522178c570b6 : u19 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_bfa78384ac30acdfb4ec29b6c82e28746fbf661532a214abaa8063172ead9db8 : u18 = u6 -> (forall x0 : prop, x0).
Theorem missingprop_16ed18176d2f3b371c0649663a9aa610541baf2b5992183b45e2862c0cca0895 : u19 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_a87a3028f64709be51c5175d14a7642f5bef9d6fb8552482a68d3b5ad1bb9fc7 : u18 = u7 -> (forall x0 : prop, x0).
Theorem missingprop_7e1998002f147e67b6c81ea460bfd50c546c68a418cf87ccb0a0af7cf4a5d049 : u19 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_548faab671fbcbca5c8c96c40ed3ea4775dd638976a2683d16e484be5d3edb57 : u18 = u8 -> (forall x0 : prop, x0).
Theorem missingprop_9825e8665431405b206ed8cedffeadeb2d4b2f428f40d25755c948a533f94754 : u19 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_7cc4617dc6a7b9b7b4cec660f935312e4b995dbb2f6599889fcacbe5b8ec47f7 : u18 = u9 -> (forall x0 : prop, x0).
Theorem missingprop_b8f9d436cada92bb5706d58b3abdb2fdd8828ac9348fb88bbc431043cd38f19b : u19 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_06cb0ea543f1131f3e8888a6c830beba57dd4d090b172cbec554e85157657538 : u18 = u10 -> (forall x0 : prop, x0).
Theorem missingprop_154a30b1ba8ed32508f5174ba5885dce8daae06cb35a638aeda5f521f1a436ed : u19 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_da971a7415a7263658d47e8afc4b6794d759a8c7957d4366d64b0d2d75db1ebf : u18 = u11 -> (forall x0 : prop, x0).
Theorem missingprop_14a2ac1a43d21520b7831fbcaac1f5f2e89edd725bea1f7cfa899266892e1179 : u19 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_3f4bdda365f7082eb6568cc69821ad4bf647cdd91bb2b4891b334f887b101966 : u18 = u12 -> (forall x0 : prop, x0).
Theorem missingprop_5486a56db2cedc933a2e1073f30437ac31b8b12326559a2446f92bef4c49218c : u19 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_7a7799a9fec173b362f0323fa1cd53f8e2240349c54f9f849ff0506280ed3fdd : u18 = u13 -> (forall x0 : prop, x0).
Theorem missingprop_3346d99f6d06c90cda72f58c2f46939ea074b3d5a031da53d39ffce163945e71 : u19 = u14 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_95a48bd166473dd69fbd1d6c212b33b8b186a59fa5f64873a57a406abcd861d7 : u18 = u14 -> (forall x0 : prop, x0).
Theorem missingprop_6d740d9c9b188e805405e2d34ec9986e71b10c02400c25af6128c2cd7b43204a : u19 = u15 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_fc69b4f24fa74882a934d6a846b06596684e5849597d21231c600ed2d7a43c70 : u18 = u15 -> (forall x0 : prop, x0).
Theorem missingprop_f4eab5da6a90e1d04224584391affbc6b18c42542dd60d5730fe3dc72ad0cd62 : u19 = u16 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_48199a2c576158ae82528e00e9bdbc57db7b153fd2b9b08b5d19a699f50aefe3 : u18 = u16 -> (forall x0 : prop, x0).
Theorem missingprop_89cc3d43552b98630e93adfaacb03e2574aff9c02b3aa2506638d17b6117ee62 : u19 = u17 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom missingprop_73b9cd20f7c68e88e2ea426419ccd36b4d3b28c76cc72d670d7f8ae953c13bf1 : u18 = u17 -> (forall x0 : prop, x0).
Theorem missingprop_fa5098b34d383bdca73a3b8d5098cb7d610846f369975f1b68176e99916d56fc : u19 = u18 -> (forall x0 : prop, x0).
admit.
Qed.
Definition u20 : set :=
 ordsucc u19.
Theorem missingprop_961499f8542074f8c18d781755f9f77c78ed32eb1a4f15b1f06614982543eb0b : u20 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_075fbc5555641f368438a928699946cc662737ebfb4f586118b363c54cf55c49 : u20 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_89e2eb6499d465cb37e817a31f95856dfa9b168146cc6a6ad11f5d81ab3acc1e : u20 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_30f1f82af278170c3ed53f12b42890b23ec31927a4144332729ee690d5df91fd : u20 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_617ded5945d02521c4f1fa7542987fa17505128e7afceb8852fff1bc6624651f : u20 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_16d3859a968c41b5d7a6a72b19fbdd2fc41293fd397b17f2f0d866514da73a4d : u20 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_8e0ae80abde104b2158032c1bd706d90d9be4907040682846c5ec08e754649e9 : u20 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_1da364b9799c552ea62d37691fe41f39149eeb259e0f35cf2ce732f0b9a775c4 : u20 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9b7253bd274e82a0ab8a76f06b1d2af1490a86965b12d700a55a77d6121ae00f : u20 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_ea953fbc75fa838e348c5988aed9a19630f1f44d6bc3fae8f7f1313a792e039a : u20 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_4c44e9910de1ccdd79adf74018ddb18e905f381c61d9473af47382c1483f4394 : u20 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_79d2fca345eda4af691531ad5682523df90b5c0b299e09c9d4285223605ce63c : u20 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_4eeb91a845b6b9854e48c0871432d0561dea9e45a9f24a85d7c8d3788f407651 : u20 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_0eac7fc454478f7b687086f18421926bcaaf224abcdefcf063ff4a9abef243bd : u20 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_79b0dbf24671f736fe70e30d17885727c5f25bc18332c2b053cee7681f648b02 : u20 = u14 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_5245e3a3c3ee6620a813736bf4eb5de53c89de5d8d032cfe0debc9762d766677 : u20 = u15 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_e5a105866bd0ded6c3644380e06b833d4aba44e9391e3fab11d8053b9f135f2f : u20 = u16 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_e875d4259eccd00196f9a81452eacf721af588c7e9269dc84035cecf04073b0a : u20 = u17 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_d94e53b115bb7c8ad97900540e455e96755fdc4d2af5fa1f16b225e4dd920138 : u20 = u18 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9d0b3600c1008810e1dcd2f5d5b69567f51704fcc4b0f5a23b2c520b26cc4e6b : u20 = u19 -> (forall x0 : prop, x0).
admit.
Qed.
Definition u21 : set :=
 ordsucc u20.
Theorem missingprop_172f2affd770fc4865199fceeb6667b9418cbfb12988961b0522b9fcaefa561f : u21 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_0a793590be20ff8e25a7a7b0c0297235ca4eaab6a5fd8d4f3d05cd6dc9695d58 : u21 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9ebddbd7f6b0131adbbf7082558fbe3f772cf04d0df387b98020255a49ffa38c : u21 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_5d321fe05d298f9b82e1ef2345c3662d2863eb255cfdb8ea8a195276f4d32e73 : u21 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_910ea61894799bfdae8ca9f717f476c6d5bfd6d7e489370036cabbd2c53ceaa0 : u21 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_474678d10c6651308785c425ec0f4ec4fae0ba2b89c92c45cc5b34f72aa4bcfa : u21 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_b0b253a23221775c0895b3df81870aa85de69fe16667385e39307bb1011c4b25 : u21 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_dde3231b90d94ea6cf99454dc2e9899d7655e810c32260432b6ef45d9b585e7d : u21 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_467cb22013b1262e120fb5c86902f981ac82ad72edd1fd87728ef896df8db79e : u21 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_e77690fa902359d016a459a1dbae51c5afa3a53af050fe17e51251ebdc52f528 : u21 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_4e08fb9268e7317e322f86bd0dde127d3b7b95da8719753d5c104a6982cc063e : u21 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_c6f79178ace284c233acbca2f2bfe44b665a0e85286917e8a76d1fb24d2247cb : u21 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_b966820c7aa93ffebe633e360c4479000585c1fd468b8e479371445e5051ff71 : u21 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_7bff456dcf0c6179c7c7c0cb5bf08d4b612cd3ffda36c7c8e882abbc5bab0d88 : u21 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_08e11a2a6bed574d1c0692f34f5fb14bd32197aeecc2aa08355941b3c0042b2d : u21 = u14 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_d3a41f529304a3c6ae5de6189696cf17a256527213078248f0fd9b71e146d699 : u21 = u15 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_27b04c6ef66b613766daae2a56f7236acc35ce71d168daa18f380fbaac44960e : u21 = u16 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_5d7ae603d28081618c996edf9b87bde4055fc620b70ee849067dc72a1770788c : u21 = u17 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_116e7cbd999186ad5cfa2811a7b1efe9808f1d43fddc92f1fecc1f6d9298b665 : u21 = u18 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9e5c3630c6bde594a7482457e2f23c53ccb7bfb274cd4576ad1a676c48795b2e : u21 = u19 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9752f8aae07d669b1096f135020ecbab317a167588504754f80d88b4c92adaa6 : u21 = u20 -> (forall x0 : prop, x0).
admit.
Qed.
Definition u22 : set :=
 ordsucc u21.
Theorem missingprop_32b5dfdfa4f5b3ac9a9a00b831e93c63f93d8af007743ee91fcda4129b5fa6a7 : u22 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_45a64368e1c57028abfd9fa6ed583fc783c2b40be93475c6caa3fd23bbae3d49 : u22 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_28a93ac24d94b617505eb1b786cd962b918d2929cbc8be70154d9c3a16656a4b : u22 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_f08af6917dfd5a6de427d953dfa23f578150954942b1e4b2d0a6aca2a1b6af41 : u22 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_b14270c6e356f8504a4450c57fb8502917b12328f75898e11efb35b8d4f61ae2 : u22 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_925dd8e943cc0c8ff15733ac2c293a4432f654b493287cbdde052cbeb2cc4407 : u22 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_b998e83fd732a075c67f08f28f38284301bacc47da5d14e18c44e74250b8af33 : u22 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_a2542908abdf53f904b6e5f9152b60e61b8a2f2253a62977330437aba06869fc : u22 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_4b3d420f7386068b1074ea2441fc8aeef970c26a7970933b539da3a194682160 : u22 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9ccfcb22d5d9d8693342f555c022b74c5fc462d926f3aae2fb26326609fc84b1 : u22 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_db48afe6d81cca8de5f9f48fe0446680943dac9826858fd3cbbf5e4280bafdcf : u22 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_84eafe0d1b390e2c8ff6926ca29d0a2cfa95e4e3cceeadff53b06e532c7ee510 : u22 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_7e8a63e62facb395416e18e6390ddb6e54414ca309ab080ad6c05b1cba7169d6 : u22 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_4bda510fa59565c972daf3b7894de1634e3beb70c17fd84fc8f96681845e717c : u22 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_1f3ba6ce64d22904fe3f03c25b93125cef371fad4d06cee0d696df58b78120b4 : u22 = u14 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_6053772f7ee32a099a8e5854a9ccbc1e2e362a2a8f7cef6f83414f07562a002c : u22 = u15 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_66817c3b10a41b0e371b4ee5ce61c4a47e756f50ae3e08598bb53ffa5828daf9 : u22 = u16 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3a4b2ea3c1b4ee0aa42dcb331f55f73218e466e32c5d0492d914d096e2590144 : u22 = u17 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_4249317584a93eea4ea9a17155e60b737afb0c5091a7dcfe593f93235e696685 : u22 = u18 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_1a53f970fcf4ee84e2f9d30498e0319f427d029bd6cae83309f9f5e645439192 : u22 = u19 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3e4ce6e92e08efa4fce1ccf5a1aaf4446405b517ccaaabd655218dc861e608f6 : u22 = u20 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3d71b5e2b64bf76b23712115efcf8b7f94af2176c7117e30436385825be79563 : u22 = u21 -> (forall x0 : prop, x0).
admit.
Qed.
Definition u23 : set :=
 ordsucc u22.
Theorem missingprop_979c189cc637d3afe72473e9489dd77c5b5f6c5dc0c5c0189cecdbcf7fe064e4 : u23 = 0 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_445cbfbee89069914628dcbfc9698480d93297cc7c419597623522230f6064f3 : u23 = u1 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_ddac1988a2199344800a986643397dbf7b977152e2795c780f668d66763c7142 : u23 = u2 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_30b4a643cd067cfd4a20b14b81dfdf6822c9b14e9e7bb4190f2b11f7f27ef255 : u23 = u3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_94d90abb2e4f8def35ed3e9c49d7f5a2823da9f3a93b02b69864d66cdd4e562f : u23 = u4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_32e04f4ae4f17c71c444b04526b8428b323e4d7824387ab7a39d84b38543d04d : u23 = u5 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_f180f489d6967f08b885b67e856ec9aa31688bdf1d36c49ea82b0d284dc4541d : u23 = u6 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_65b2d9f8447f26f98a13ecedfc75c7bfeb12f78009a508fb3b6f9195edc138fd : u23 = u7 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_bc86fd6357a8aeb21fb5fe4e713bf52143dbb0f763449e33a83169178586b74e : u23 = u8 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_24039cdd5f48d58b81a9f1c8f708ada7473e5caa7189d4735a4c8130133c0a61 : u23 = u9 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9e6cdea540787e99cebc610658340827c0bf3b4820b1b40cd9790c67977dd4c4 : u23 = u10 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_edc90758b6bceec12cd2852605ab6c0cf318cd2093fdeb237fe64673c166de16 : u23 = u11 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_f3350d540e6867a7972a4724037660c5998ce0128ad87813a498c55bf9b5e591 : u23 = u12 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_8b2525a889d10b2b37df4af1f93109cc5d7cb5f1147f3d65577292744da4c69f : u23 = u13 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_d82e765d00a8799463c324ef9ec7c7c436edcee826c7fc1ed50b0c5cd110e221 : u23 = u14 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_bb52478d225379f7724a33bf76ceb0cd21e2b61279405cff8ab60082cbd3a678 : u23 = u15 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_3d25ef54f895cf3695807c8f92ea140325d7c1ae464bbeff3ea915feb94176c2 : u23 = u16 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_21103d0116af4f897e55974109368c145947a3a66515039db1a0c8b178a98166 : u23 = u17 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_2ec03848b048379ca0069dd1adb70ea27ec2dc12b75b099de37936b16b04af66 : u23 = u18 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_9701b8a5483a090b78796eef708de261df3f2545c5ce3af5a81f0a4ee00037bd : u23 = u19 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_e046300dbabcb6879d5ee7b7a3484aad1e616228ce77872869131b66bd674d3c : u23 = u20 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_68107b5958592b9f4c85905bf7dcf474b342acbe0c7e4ec024664ad44c39e21d : u23 = u21 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem missingprop_5c1235178ee676092509be5f997555e0c264359c0246b8769d05b358696c7223 : u23 = u22 -> (forall x0 : prop, x0).
admit.
Qed.
