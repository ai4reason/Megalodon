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
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_3 : nat_p 3.
Axiom missingprop_95604e4190114887a560e7cb884c9d6e5dc448aed6331e8efbb9b9f11a2dd14c : add_nat u5 u3 = u8.
Theorem missingprop_b34a1e905938a15bca167f7f192492032fbe3dab967a36dd7c5a72404dc4e98b : add_nat u5 u4 = u9.
admit.
Qed.
Definition u10 : set :=
 ordsucc u9.
Axiom nat_4 : nat_p 4.
Theorem missingprop_b16b8ddc32d5fc23481ba2f31c61c76c3a79b038dbad216e5323fff084cd3179 : add_nat u5 u5 = u10.
admit.
Qed.
Definition u11 : set :=
 ordsucc u10.
Axiom nat_5 : nat_p 5.
Theorem missingprop_0b9ffec33b58796014d5e2e27ec991760d5cb69fe8e4add65e322eaea4c8c56c : add_nat u5 u6 = u11.
admit.
Qed.
Definition u12 : set :=
 ordsucc u11.
Axiom nat_6 : nat_p 6.
Theorem missingprop_26eda83e6955cc6e2cd46e060392203cdfb318b5445ce1ce66f9901e9e34123d : add_nat u5 u7 = u12.
admit.
Qed.
Definition u13 : set :=
 ordsucc u12.
Axiom nat_7 : nat_p 7.
Theorem missingprop_0ca6bc5c9760fc8142bd2ede32df9978d41cc89a6e17456981612a56f6ed3285 : add_nat u5 u8 = u13.
admit.
Qed.
Definition u14 : set :=
 ordsucc u13.
Axiom nat_8 : nat_p 8.
Theorem missingprop_50aa1d3178c2ce6dffd88ca2fd227c2c6b6ae8fa4d081765a4a45af135e23f6c : add_nat u5 u9 = u14.
admit.
Qed.
Definition u15 : set :=
 ordsucc u14.
Axiom nat_9 : nat_p 9.
Theorem missingprop_a1a90410c1f7a71f7d8f787285d01a9a8ef9f6791ae58e1afd4fbb66c81ce5cd : add_nat u5 u10 = u15.
admit.
Qed.
Definition u16 : set :=
 ordsucc u15.
Axiom nat_10 : nat_p 10.
Theorem missingprop_67d94c18cbd904f80b23be96fcc2520173690b2c143313728b73edf8ae9b8e98 : add_nat u5 u11 = u16.
admit.
Qed.
Definition u17 : set :=
 ordsucc u16.
Axiom nat_11 : nat_p 11.
Theorem missingprop_6c01c1935eae10dd98d60e4315313b39ad9163939b253d11e16fc653c6419ed4 : add_nat u5 u12 = u17.
admit.
Qed.
Definition u18 : set :=
 ordsucc u17.
Axiom nat_12 : nat_p 12.
Theorem missingprop_00d51f1e8fd511953bc88ead9a5a959affa3f35b6cc9a904915ce8348c6d3246 : add_nat u5 u13 = u18.
admit.
Qed.
Definition u19 : set :=
 ordsucc u18.
Axiom nat_13 : nat_p 13.
Theorem missingprop_06ae921a05d3395a7976fe7f72076cb58d8233530a07377c4bde9509df3927a2 : add_nat u5 u14 = u19.
admit.
Qed.
Definition u20 : set :=
 ordsucc u19.
Axiom nat_14 : nat_p 14.
Theorem missingprop_f861a301470f23b9d5d06eb1b63de4c2f6123eb7b7ddb7f8ac60ef985e76d12d : add_nat u5 u15 = u20.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Axiom nat_1 : nat_p 1.
Axiom nat_0 : nat_p 0.
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Theorem missingprop_e5120d40f4a32c7af3d0d388c476457842e1606aa91e4ca1062133e04a054af7 : add_nat u13 u6 = u19.
admit.
Qed.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
Axiom mul_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x1 = mul_nat x1 x0)).
Axiom missingprop_463ff37e0f5b1f0c9f9e5bd24ebf02eb01188a79277f3c1f714af19504beaaf2 : (forall x0, nat_p x0 -> mul_nat u2 x0 = add_nat x0 x0).
Theorem missingprop_9999811b816ecc962e9d03bd28c7ff2f2b07bac5ef7fb31aad1b993404e01924 : mul_nat u5 u4 = u20.
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom bijE : (forall x0 x1, forall x2 : set -> set, bij x0 x1 x2 -> (forall x3 : prop, ((forall x4, x4 :e x0 -> x2 x4 :e x1) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> x2 x4 = x2 x5 -> x4 = x5)) -> (forall x4, x4 :e x1 -> (forall x5 : prop, (forall x6, and (x6 :e x0) (x2 x6 = x4) -> x5) -> x5)) -> x3) -> x3)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom In_0_1 : 0 :e 1.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Theorem missingprop_9c0575fd54374e0d0f9b0bb0395cadff0fc4a8034816c932683102f3d70ab52c : (forall x0, equip u1 x0 -> (forall x1 : prop, (forall x2, and (x2 :e x0) (x0 = Sing x2) -> x1) -> x1)).
admit.
Qed.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Axiom missingprop_8d334858d1804afd99b1b9082715c7f916daee31e697b66b5c752e0c8756ebae : (forall x0, atleastp u2 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x1)) -> x1)).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom missingprop_8a21f6cb5fc1714044127ec01eb34af4a43c7190a9ab55c5830d9c24f7e274f6 : (forall x0 x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (x1 = x2 -> (forall x4 : prop, x4)) -> (x1 = x3 -> (forall x4 : prop, x4)) -> (x2 = x3 -> (forall x4 : prop, x4)) -> atleastp u3 x0))).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Theorem missingprop_4d754b36cdd40bc8cd396c0ff8341e59d3f91fcdd920c2c29f628773f7320249 : (forall x0, equip u2 x0 -> (forall x1 : prop, (forall x2, and (x2 :e x0) (forall x3 : prop, (forall x4, and (x4 :e x0) (and (x2 = x4 -> (forall x5 : prop, x5)) (x0 = UPair x2 x4)) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Definition finite : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (equip x0 x2) -> x1) -> x1).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom equip_ref : (forall x0, equip x0 x0).
Theorem missingprop_a27dbe9bdb3250ff525cd2b00221a19841e7e622da131f38fcc1540ba15eb9d8 : (forall x0, nat_p x0 -> finite x0).
admit.
Qed.
Theorem missingprop_158329ee42f538f9f45353e081644457b58bf58b995713ab00dcbc514147ba46 : (forall x0 x1, x1 :e x0 -> Sing x1 c= x0).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Axiom missingprop_2ec38089a92dcd86a75a337a6e999322444786992f1b612acfe1d68011bad142 : (forall x0 x1, x1 c= x0 -> x0 = binunion (setminus x0 x1) x1).
Theorem missingprop_20fce6fc7f2e036c1229cbf996632439eddb19cfae541105a83e5be9c65bc111 : (forall x0 x1, x1 :e x0 -> x0 = binunion (setminus x0 (Sing x1)) (Sing x1)).
admit.
Qed.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_In_Or_Subq : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 :e x1) (x1 c= x0)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom Subq_ref : (forall x0, x0 c= x0).
Theorem missingprop_ad830447e2a256c0fa48f150ede5366d23a389e771f030df6830dfe0d4977bf6 : (forall x0 x1, nat_p x0 -> nat_p x1 -> x0 c= x1 -> ordsucc x0 c= ordsucc x1).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom Empty_Subq_eq : (forall x0, x0 c= 0 -> x0 = 0).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom missingprop_eab190d6552dbda6c7d00c3e93c1ad9385698a8d73462a2a4e5795b67701610d : (forall x0 x1 x2, nIn x2 x1 -> equip x0 x1 -> equip (ordsucc x0) (binunion x1 (Sing x2))).
Axiom setminus_nIn_I2 : (forall x0 x1 x2, x2 :e x1 -> nIn x2 (setminus x0 x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_8b06455b71193e811b862103510dd9b581a1532bb6bb579790ac66d65ff3dd3c : (forall x0, nat_p x0 -> (forall x1, x1 c= x0 -> (forall x2 : prop, (forall x3, and (and (nat_p x3) (x3 c= x0)) (equip x1 x3) -> x2) -> x2))).
admit.
Qed.
Axiom missingprop_8c033b5532b5ecb975cda388e43db69e003e5159ad10f70a2cd946604e0cb0f6 : (forall x0 x1, atleastp x0 x1 -> (forall x2 : prop, (forall x3, x3 c= x1 -> equip x0 x3 -> x2) -> x2)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
Theorem missingprop_b152ae4afe7c71f277b33b67a4c010fdd81f5a5975013122b8e8a2c67d6dcc1b : (forall x0 x1, x1 c= x0 -> finite x0 -> finite x1).
admit.
Qed.
Definition u21 : set :=
 ordsucc u20.
Definition u22 : set :=
 ordsucc u21.
Definition u23 : set :=
 ordsucc u22.
Definition u24 : set :=
 ordsucc u23.
Theorem missingprop_e7a22d56172b83cc5d886239f486a15dd72ae38e01e724bdd7d4045095e9b394 : add_nat u20 u4 = u24.
admit.
Qed.
Theorem missingprop_b33aad4170c7ebf5ee86317c9537bc390b0f7bb04160dd56f108c957fae4db5d : add_nat u12 u8 = u20.
admit.
Qed.
Theorem missingprop_6e7cb10edc0b40043a252508d525ece5fdeb3d7816f12ce145ff850cf21c79ba : add_nat u12 u12 = u24.
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e lam x0 x1)).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Theorem missingprop_ca35929bb9516758ce3c56c5bf7b9f0713e81693444871247a9d2c8c2835f309 : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> equip (x2 x3) x1) -> equip (lam x0 x2) (setprod x0 x1)).
admit.
Qed.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Theorem missingprop_049aa024f23bec37895017ca5d0e6546c46a1d5549f875fd117032f8f8ce9923 : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x1 x2 -> x4 :e x1 x3 -> x2 = x3))) -> equip (lam x0 x1) (famunion x0 x1)).
admit.
Qed.
Theorem missingprop_541d2a46e6af37610d6dff1d2dff7b5d4d2a3850b13b6760afcea4d08ae0f05f : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> equip (x2 x3) x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x2 x3 -> x5 :e x2 x4 -> x3 = x4))) -> equip (famunion x0 x2) (setprod x0 x1)).
admit.
Qed.
Theorem missingprop_114be8822b6413aaa4f094e79f9ed7dccf7f251af45e6784755c2493769eabfa : (forall x0 x1 x2 x3, equip x0 x1 -> equip x2 x3 -> equip (setprod x0 x2) (setprod x1 x3)).
admit.
Qed.
Theorem missingprop_c46d2ba0f36de9ca6b6266a654990ec059931cc2e555c517d90e20a2533a7a20 : (forall x0 x1 x2, forall x3 : set -> set, equip x0 x1 -> (forall x4, x4 :e x0 -> equip (x3 x4) x2) -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x3 x4 -> x6 :e x3 x5 -> x4 = x5))) -> equip (famunion x0 x3) (setprod x1 x2)).
admit.
Qed.
Axiom Subq_Empty : (forall x0, 0 c= x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem missingprop_3e02493f7d7ca2626d2be7e61bff6e3d4afeb4effad996587801d63e14d94a21 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> atleastp x1 x0 -> x1 c= x0)).
admit.
Qed.
Theorem missingprop_8e052d85b2d476997756a4d2563048c027eabd3d70c30d840e8aa53708c6c883 : (forall x0 x1, nat_p x0 -> nat_p x1 -> equip x0 x1 -> x0 = x1).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom missingprop_8fed54475e70b18fbe9db03f1a81cd38ab9b210f0bea8d2bb706323c288b83da : (forall x0 x1 x2 x3, equip x0 x2 -> equip x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> equip (binunion x0 x1) (setsum x2 x3)).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Theorem missingprop_f10dcd7fbb5d0ac7aa02fb2a6b46a812452e218eb463a09c49ae7c7e43e46aeb : (forall x0 x1, nat_p x1 -> (forall x2 : set -> set, forall x3 x4 x5 x6, nat_p x3 -> nat_p x4 -> (x3 = x4 -> (forall x7 : prop, x7)) -> nat_p x5 -> nat_p x6 -> (forall x7, x7 :e x1 -> or (equip (Sep x0 (fun x8 : set => forall x9 : set -> set -> prop, x9 (x2 x8) x7 -> x9 x7 (x2 x8))) x3) (equip (Sep x0 (fun x8 : set => forall x9 : set -> set -> prop, x9 (x2 x8) x7 -> x9 x7 (x2 x8))) x4)) -> equip (Sep x1 (fun x7 : set => equip (Sep x0 (fun x8 : set => forall x9 : set -> set -> prop, x9 (x2 x8) x7 -> x9 x7 (x2 x8))) x3)) x5 -> equip (Sep x1 (fun x7 : set => equip (Sep x0 (fun x8 : set => forall x9 : set -> set -> prop, x9 (x2 x8) x7 -> x9 x7 (x2 x8))) x4)) x6 -> add_nat x5 x6 = x1)).
admit.
Qed.
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Axiom missingprop_b67c3f99b7dcb350283e28e0205622aac5c4480ca587d55b1fc9b439a7a164e1 : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (mul_nat x0 x1) (setprod x2 x3)).
Theorem missingprop_619654e445bf94903b3150722e4c33db1f3d60b6501f8ce2ef5b168354da5373 : (forall x0 x1, nat_p x0 -> (forall x2 : set -> set, forall x3 x4 x5 x6, nat_p x3 -> nat_p x4 -> (x3 = x4 -> (forall x7 : prop, x7)) -> nat_p x5 -> nat_p x6 -> (forall x7, x7 :e x0 -> x2 x7 :e x1) -> (forall x7, x7 :e x1 -> or (equip (Sep x0 (fun x8 : set => forall x9 : set -> set -> prop, x9 (x2 x8) x7 -> x9 x7 (x2 x8))) x3) (equip (Sep x0 (fun x8 : set => forall x9 : set -> set -> prop, x9 (x2 x8) x7 -> x9 x7 (x2 x8))) x4)) -> equip (Sep x1 (fun x7 : set => equip (Sep x0 (fun x8 : set => forall x9 : set -> set -> prop, x9 (x2 x8) x7 -> x9 x7 (x2 x8))) x3)) x5 -> equip (Sep x1 (fun x7 : set => equip (Sep x0 (fun x8 : set => forall x9 : set -> set -> prop, x9 (x2 x8) x7 -> x9 x7 (x2 x8))) x4)) x6 -> add_nat (mul_nat x5 x3) (mul_nat x6 x4) = x0)).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom SNo_1 : SNo 1.
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Theorem missingprop_e5d031cf873471b22fe77dee36ebb6254dbd5df83fe741afd4ca8450323be464 : (forall x0, SNo x0 -> mul_SNo 2 x0 = add_SNo x0 x0).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom SNo_2 : SNo 2.
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_cancel_R : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 x1 = add_SNo x2 x1 -> x0 = x2).
Axiom add_SNo_minus_R2' : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo (add_SNo x0 (minus_SNo x1)) x1 = x0).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem missingprop_01a114695ffc1947170447fdad5efc68e147fcc0454c56a0d7ea5b19e5fad219 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo x0 x1 = x2 -> add_SNo x0 (mul_SNo 2 x1) = x3 -> and (x1 = add_SNo x3 (minus_SNo x2)) (x0 = add_SNo (mul_SNo 2 x2) (minus_SNo x3))).
admit.
Qed.
Axiom nat_p_SNo : (forall x0, nat_p x0 -> SNo x0).
Axiom missingprop_07ad204b3b4fc2b51cd8392b0e6a88916124d7f0f3dbf696bec5a683b0ea9dae : nat_p u20.
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom add_nat_add_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = add_SNo x0 x1)).
Theorem missingprop_6502b005df6cab01356c9d955bc809f862844de5e4a01194bf49c9058d670f64 : add_SNo u20 (minus_SNo u12) = u8.
admit.
Qed.
Theorem missingprop_1692dc98d264a82bacaf6d02c68843e5f1607f9095ce664ce240b86cf3e90e57 : mul_SNo u2 u12 = u24.
admit.
Qed.
Axiom missingprop_a7f3578ada9cacf1cb3296f5290d2c691e8a6f96bb11bbe9193ef025e25fc69a : nat_p u24.
Theorem missingprop_caaed9cc542a41bb8c68b09f36dec250167b4be7de49834a0622f344dac85f46 : add_SNo u24 (minus_SNo u20) = u4.
admit.
Qed.
Theorem missingprop_40c2c43e78124d0e22923fdd03fd951892d7b7de789b8ca1d0fd7cf9a886764e : (forall x0 x1, nat_p x0 -> nat_p x1 -> add_SNo x0 x1 = u12 -> add_SNo x0 (mul_SNo 2 x1) = u20 -> and (x0 = u4) (x1 = u8)).
admit.
Qed.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom mul_nat_mul_SNo : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = mul_SNo x0 x1)).
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Theorem missingprop_4f44cfb785d5b437008b898f4f72ed3ea271db2936872a88c00da58532b943cb : (forall x0 : set -> set, forall x1 x2, nat_p x1 -> nat_p x2 -> (forall x3, x3 :e u20 -> x0 x3 :e u12) -> (forall x3, x3 :e u12 -> or (equip (Sep u20 (fun x4 : set => forall x5 : set -> set -> prop, x5 (x0 x4) x3 -> x5 x3 (x0 x4))) u1) (equip (Sep u20 (fun x4 : set => forall x5 : set -> set -> prop, x5 (x0 x4) x3 -> x5 x3 (x0 x4))) u2)) -> equip (Sep u12 (fun x3 : set => equip (Sep u20 (fun x4 : set => forall x5 : set -> set -> prop, x5 (x0 x4) x3 -> x5 x3 (x0 x4))) u1)) x1 -> equip (Sep u12 (fun x3 : set => equip (Sep u20 (fun x4 : set => forall x5 : set -> set -> prop, x5 (x0 x4) x3 -> x5 x3 (x0 x4))) u2)) x2 -> and (x1 = u4) (x2 = u8)).
admit.
Qed.
Definition DirGraphOutNeighbors : set -> (set -> set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> prop => fun x2 : set => Sep x0 (fun x3 : set => and (x2 = x3 -> (forall x4 : prop, x4)) (x1 x2 x3))).
Axiom missingprop_997b324045b1165b0cf38788927ff324ddb3a505c8b91e290586e4dd5480f2bd : (forall x0 x1 x2, x2 :e x0 -> equip x0 (ordsucc x1) -> equip (setminus x0 (Sing x2)) x1).
Axiom missingprop_426b271b8453605fe796f284fb15405fbff198d07b0c3dc7b8c218dee82a5c65 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> x2 :e DirGraphOutNeighbors x0 x1 x3))).
Axiom missingprop_942eb02a74c10f16602e1ae1f344c3023e05004e91bcaa34f489f7c49867be93 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> equip (DirGraphOutNeighbors u18 x0 x1) u5)).
Theorem missingprop_52137fbb4a2ce93c26a5099f50d500c9abe51677b43046d7cccb609dc3338329 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> (forall x2, x2 :e DirGraphOutNeighbors u18 x0 x1 -> equip (setminus (DirGraphOutNeighbors u18 x0 x2) (Sing x1)) u4))).
admit.
Qed.
Theorem missingprop_9266f6944f0f929147e8e9b5be2a3c7a274ea5fc311d81358249fbfcf44fe657 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> equip (lam (DirGraphOutNeighbors u18 x0 x1) (fun x2 : set => setminus (DirGraphOutNeighbors u18 x0 x2) (Sing x1))) u20)).
admit.
Qed.
Theorem missingprop_5a0964b9acc4604dd185dfdd22d62919870a67264c20a1093ff87b5c98db0da8 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> equip (binunion (DirGraphOutNeighbors u18 x0 x1) (Sing x1)) u6)).
admit.
Qed.
Axiom missingprop_e218ed8cf74f73d11b13279ecb43db2e902573ebd411cc1f7c1f71620f4a5da3 : (forall x0 x1, atleastp x0 x1 -> atleastp x1 x0 -> equip x0 x1).
Axiom missingprop_45d11dce2d0b092bd17c01d64c29c5885c90b43dc7cb762c6d6ada999ea508c5 : (forall x0, nat_p x0 -> (forall x1, or (atleastp x1 x0) (atleastp (ordsucc x0) x1))).
Axiom missingprop_b6349b103ec0c23863292fe6c57a85341c64566cbff4099647a6f20c72c67730 : nat_p u18.
Axiom missingprop_f59d6b770984c869c1e5c6fa6c966bf2e7f31a21d93561635565b3e8dc0de299 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x2 -> nIn x4 x3) -> atleastp (setsum x0 x1) (binunion x2 x3)).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom nat_17 : nat_p 17.
Axiom missingprop_8805a75f81012de0423e9173532fc074fb73b80e451597fde52287a4721fb204 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom missingprop_df15fb7a07da4a2b5124ddea4e33f012b3f09ace77b002ed675c7b110878b43a : add_nat 11 6 = 17.
Axiom binunion_Subq_min : (forall x0 x1 x2, x0 c= x2 -> x1 c= x2 -> binunion x0 x1 c= x2).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Theorem missingprop_ad62e7b7886debceb82b74d2df1155c4fb5f8fce57cf43b0af9be7baade331a7 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> equip (setminus u18 (binunion (DirGraphOutNeighbors u18 x0 x1) (Sing x1))) u12)).
admit.
Qed.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom missingprop_fb3d0adbe91c2b1cc5b1232e9c5e5db92d0c657c92a093db9ee89bd94dc257ee : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> (forall x2, x2 :e u18 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (x0 x1 x2) -> or (equip (binintersect (DirGraphOutNeighbors u18 x0 x1) (DirGraphOutNeighbors u18 x0 x2)) u1) (equip (binintersect (DirGraphOutNeighbors u18 x0 x1) (DirGraphOutNeighbors u18 x0 x2)) u2)))).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom missingprop_be1ab2772f2343e1b7afd526582f606d68258ba3f0b6521a351e0ecb8bf3c52e : (forall x0, equip (Sing x0) u1).
Axiom binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom missingprop_39df499f773ced696ac600b0767cd28b9ceea72e50ff2c9103bc16896281c585 : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> equip (UPair x0 x1) u2).
Axiom binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
(* Parameter SetAdjoin "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" "1f3a09356e470bff37ef2408148f440357b92f92f9a27c828b37d777eb41ddc6" *)
Parameter SetAdjoin : set -> set -> set.
Axiom missingprop_434e2e2330a02d70f83efc2b51c595946aeb4462c38cf32d55a1757fe463ba11 : (forall x0 x1 x2, forall x3 : set -> prop, x3 x0 -> x3 x1 -> x3 x2 -> (forall x4, x4 :e SetAdjoin (UPair x0 x1) x2 -> x3 x4)).
Axiom missingprop_01a9c78d2ff9508973a3397619af294eba02d9395696c331bc156cf4e0508f7d : (forall x0 x1 x2, (x0 = x1 -> (forall x3 : prop, x3)) -> (x0 = x2 -> (forall x3 : prop, x3)) -> (x1 = x2 -> (forall x3 : prop, x3)) -> equip (SetAdjoin (UPair x0 x1) x2) u3).
Axiom setminus_Subq : (forall x0 x1, setminus x0 x1 c= x0).
Theorem missingprop_4fbe2821a224e8efa7f1f4b4d0cd1ce84da1c8c58e8885ed9a4c21b8062b6ee1 : (forall x0 : set -> set -> prop, (forall x1 x2, x0 x1 x2 -> x0 x2 x1) -> (forall x1, x1 c= u18 -> atleastp u3 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x0 x2 x3))) -> (forall x1, x1 c= u18 -> atleastp u6 x1 -> not (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> (x2 = x3 -> (forall x4 : prop, x4)) -> not (x0 x2 x3)))) -> (forall x1, x1 :e u18 -> and (equip (Sep (setminus u18 (binunion (DirGraphOutNeighbors u18 x0 x1) (Sing x1))) (fun x2 : set => equip (binintersect (DirGraphOutNeighbors u18 x0 x2) (DirGraphOutNeighbors u18 x0 x1)) u1)) u4) (equip (Sep (setminus u18 (binunion (DirGraphOutNeighbors u18 x0 x1) (Sing x1))) (fun x2 : set => equip (binintersect (DirGraphOutNeighbors u18 x0 x2) (DirGraphOutNeighbors u18 x0 x1)) u2)) u8))).
admit.
Qed.
