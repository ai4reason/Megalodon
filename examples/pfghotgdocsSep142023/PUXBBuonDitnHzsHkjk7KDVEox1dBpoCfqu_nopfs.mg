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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom missingprop_279fe6eb4b3ee21a0be2650377dfae573b176ecc12970f64812a6be52f3acfb9 : 13 :e 16.
Theorem missingprop_ee249701bfbf4a0ddc5825c1bc6fff36b37e7d1af2b7d307fdfcf229c66eb3d7 : u13 :e u17.
admit.
Qed.
Axiom missingprop_b79a9b70d083f86c18981643e47c737565f20b5a8d9333bff56376600ec4e5a4 : 14 :e 16.
Theorem missingprop_19ecd6ac8599e49ad47f95e5b1703b05d2332ac49ec04a48785748b0d8a5094a : u14 :e u17.
admit.
Qed.
Axiom missingprop_f388ecefb2fe6e2e313ca750501544c7c4c2bb13327baa7d874fe8dbdb4dc6e4 : 15 :e 16.
Theorem missingprop_35f4d337254964d13bfee3413f1b56f908aee5828cc15d13f416e7a488640c53 : u15 :e u17.
admit.
Qed.
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_a76efb72f36a26d5f27a9b9224b42b8be1785c9e1b5b0390f7ccb72d2b130266 : u16 :e u17.
admit.
Qed.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom missingprop_c12285364f107ae7d5ef016a23e15f3c94608acd035dd4eab6e840e77bdc8e61 : u13 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_718815618fb408e7f9b6a92ac99a4e34c4c560dd6f617b4e7a3baae4d71063ec : u13 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_0563767a7ae8cf0f38a2ce998f4f61c0f4d5f10bd129b2c62e0e73969f860e28 : u13 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_f23c647528c9edaac83020c9ff5a3f2c5a7a4a9b995a628c2a71b9eb6cd8e669 : u13 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_0b3e3e45ef080c7b7a49c00c4067713ad08b47ab8b0713e5aaab56e6d7a5b982 : u13 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_708a12eb026e4d3c08fc829f55688c54d28c54b0af95cbb973e74a0d726eddda : u13 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_10123744e9181acb5f4770c4e7c8d274437210700731399dc702b025f786eb1e : u13 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_128d4a775d786f77bf13bb7dd7cb9742308ad661f9914b0ba314109642dc74a2 : u13 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_e20a3f49533352fe1b05bebbb2ae624ad084f8a027d8217543b43ae55b811240 : u13 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_2f6e5b1338db3ff412e38a1ecfa4d466e2517777a8bbed02c867df317c357933 : u13 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_611c167b8d8d5c2c171ede951fd79aafcb1fd16fb816a3f0e5c0edff9bd7addf : u13 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_0a910a83fae7c1219e51ae6f441b8120dc6f2353f129945859e5867a1d5c1be3 : u13 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_f4e278a6bf4004a90230a7ce4599c33df3b13afc88036ef1d8ff3a4ef834b193 : u13 = u12 -> (forall x0 : prop, x0).
Theorem missingprop_59c2480489eadad5af556760f82177b3dd43cccf1859fd8097d2746b9f048b18 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u13) x13 -> x17 x13 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u13)).
admit.
Qed.
Axiom missingprop_786d05e7abced1a9dc9d53bbc0ccf61863e522b5215ae9f11752fff2bf124321 : u14 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_3ec40051a51fd9abd0f1ea045695fd96747c0b44c83f1a0d528b4d75589d7df9 : u14 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_2451f846ade20c2c83b68d6ca07174f7098b4b15fe1ab38e4417b5ec5afc3945 : u14 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_8d07e49985de556386320c4394a4f81f882951458280531346f93de382828ccf : u14 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_5c17fff000510475687b445d243a8658952ee19ef7f469feb3e238dfb5022180 : u14 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_8e078aa58d96c679c691026d3dbd3c5ddf82d7052472d7ebfc54e4b027091692 : u14 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_521d57c2f7a8a26330ae69c04fff1b24cc86e4837a4836a4fefa73fad1a725cc : u14 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_6b6d879f9198c0f8972b1370a6b60ca474de18dcfd00d1cbe42fb36343cfa178 : u14 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_9cd8c17074dbeec0fef19f04ec8a941cf429e15b37b6046a94fab0afa09de770 : u14 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_16378467aced8215056140af611424a7d8477e41af2c1f3af8bef49b9f0df0b7 : u14 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_3e7054688acb8ba4a0f18423b649f383cf90ecfc4f6200e2e049d580ebc2dc1f : u14 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_00afc3423aeef527fa52daa0e685caaf0adcec70a4145f09454ed0ecaf166b37 : u14 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_15d8fee75ef2fcef507dcd58e078d7224460844031194a35f38ebec160a6c36c : u14 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_ccf4a5c6b3a6e4954a14109684a2ab83b52a2425e80e3019435c7a784c78b93f : u14 = u13 -> (forall x0 : prop, x0).
Theorem missingprop_350eb2e2f33959f73bc9adcc0ef557124e36ccbb5de561f3bb6a94c1b2774dbf : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u14) x14 -> x17 x14 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u14)).
admit.
Qed.
Axiom missingprop_9777c32431e56f82c3c2627629f063e7a7752ce2500aecd27c072fd538c564d1 : u15 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_033f55ba76fb230c8269a9f3dfb9ab5f1debf38df2ed6a8204e88ab225544563 : u15 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_638ca97253dde1f6c05ae5a7b43aa5519bcb932d746f1ff6c11c6149deab9734 : u15 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_c966e250c9e0036300c545a4c37f99c2c56d590f24ba184faeb741ac623ddc71 : u15 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_a504807aba1f063c619c47c7790e6a97b78d6221a696d3a06eab792e3bc4d832 : u15 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_6be75df4f14c9bfa3abf6ed370fc5224c8cd92769e2571dbc7f3e2b0899c3f2a : u15 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_6163c724a9d7981c89b6bf365a0bebe9efec08b9eff4bb6184424f2ae3577228 : u15 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_03bfa5a110b404de8380cbf91407efa16bc92e74bb78c456f8556ff689d59c2c : u15 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_85105fca2bacc886dc8c29d2893d8d6f48bf2df156b5c5ec0c4e6b02418bc580 : u15 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_a4ffe2c5c180b0a50257540c321c6d0ac174e6dcf67a517314fd5483733bd52b : u15 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_c2d8fac90c753ba98b910dfebba93313752c3581721985e0c507115f57afbe2d : u15 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_ee5d720135ac2a1e6675f04fc296d39836826d1754aace8d3d88db80c3a9bf7b : u15 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_b71ad64ae5ee6739b72b7cf6202281008bcc9edc7ad98b81f40c22a64711fdc6 : u15 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_c4ec81028536a24273f04958b27208043a8e72bdb9f95435ebeb3fd5cd7535fc : u15 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_9052a17aeb56f0baa5bd35ac678f9db733e32e563a9d0a61b0417ed4592a2293 : u15 = u14 -> (forall x0 : prop, x0).
Theorem missingprop_fe72fe5f42300650f520fff5d26c8fed2422cadda1c955908832c1094e6cd904 : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u15) x15 -> x17 x15 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u15)).
admit.
Qed.
Axiom missingprop_60f83cb2d5e8fad8ed3c2af8b6c5009dbe5ca939fa34d10ed5528a8ef488fb1c : u16 = 0 -> (forall x0 : prop, x0).
Axiom missingprop_dd20a269eccc8405cd94f4653428a5da7b33d3be25fb8510f632ef3230f1eaee : u16 = u1 -> (forall x0 : prop, x0).
Axiom missingprop_400b33ea5b5f2607d4b48b99be02261c15c83e529ac6bfd70aa57fb0ff63c531 : u16 = u2 -> (forall x0 : prop, x0).
Axiom missingprop_1cbb58c41f118085219f3b586c887a5ff408369fe6b52ca74e9366bfb8457cff : u16 = u3 -> (forall x0 : prop, x0).
Axiom missingprop_0cb59343f7ca2c0440165ef2670fd7644d9775c5a4a86baf53d90bca3bd63cc9 : u16 = u4 -> (forall x0 : prop, x0).
Axiom missingprop_ca26de1b59c322d42d6f3d7e731e4e561915afe66882738ab608ff1268374915 : u16 = u5 -> (forall x0 : prop, x0).
Axiom missingprop_d390a940e0d8b8c681ccbf6c46f5374ccc304295ccc2cd1522dd66f6c32997a7 : u16 = u6 -> (forall x0 : prop, x0).
Axiom missingprop_a0bdf0079e7b1581b89ab957e2cd7f488793d97d1d94621d3aa6a4fac9f22b96 : u16 = u7 -> (forall x0 : prop, x0).
Axiom missingprop_14e13a8771031ad5c0fbcddcde043936c377ce19df59c8a5042720afd8292b32 : u16 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_ce4f8ce5934f96e0a92d8234aa49fd2e8ec60a5807531af02b0c19b05dffb12a : u16 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_728a499fa827f2373d0f5f59b334ba8b9cac6c83450172e25304b57de1e9058f : u16 = u10 -> (forall x0 : prop, x0).
Axiom missingprop_47b0549db93ebcad72e3d90923d72379e5655902a485807edad02af70ddd3445 : u16 = u11 -> (forall x0 : prop, x0).
Axiom missingprop_0c2339ef07f9be63916ba4ed21f5ed3d1c0fc25d2883650f1a08db958e637e32 : u16 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_4e5614ee6c60ca75b34344cfddfbe4840c89f999d594b201761970f40f5f2255 : u16 = u13 -> (forall x0 : prop, x0).
Axiom missingprop_44dd594ce330f92aa460a3bc4ae154c08d18da149afbcbc953cc12dc2b8e3572 : u16 = u14 -> (forall x0 : prop, x0).
Axiom missingprop_5f312c1824a4beefed581d01c6269bf8f1701f7ed4c65d144b4397173c0fe00c : u16 = u15 -> (forall x0 : prop, x0).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Theorem missingprop_16a45b15f191e253f6adaaaebafcd1d87d2c62d6d5f5b2a6cae3f68eeb4e5fba : (forall x0 x1, forall x2 : set -> set -> set, forall x3, x3 :e x1 -> ap (lam x1 (fun x5 : set => If_i (x5 = x3) x0 (x2 (ordsucc x3) x5))) x3 = x0) -> (forall x0 x1, forall x2 : set -> set -> set, forall x3 x4, (x4 = x3 -> (forall x5 : prop, x5)) -> ap (lam x1 (fun x6 : set => If_i (x6 = x3) x0 (x2 (ordsucc x3) x6))) x4 = ap (lam x1 (x2 (ordsucc x3))) x4) -> (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, forall x17 : set -> set -> prop, x17 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u16) x16 -> x17 x16 (ap (lam 17 (fun x18 : set => If_i (x18 = 0) x0 (If_i (x18 = 1) x1 (If_i (x18 = 2) x2 (If_i (x18 = 3) x3 (If_i (x18 = 4) x4 (If_i (x18 = 5) x5 (If_i (x18 = 6) x6 (If_i (x18 = 7) x7 (If_i (x18 = 8) x8 (If_i (x18 = 9) x9 (If_i (x18 = 10) x10 (If_i (x18 = 11) x11 (If_i (x18 = 12) x12 (If_i (x18 = 13) x13 (If_i (x18 = 14) x14 (If_i (x18 = 15) x15 x16))))))))))))))))) u16)).
admit.
Qed.
