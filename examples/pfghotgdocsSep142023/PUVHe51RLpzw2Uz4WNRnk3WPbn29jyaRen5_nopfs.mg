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
(* Parameter missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 "2966040c9f0ef25a29ed516ef16080570a05615315f9106b4fefd6283408dc2a" "826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6" *)
Parameter missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 : set -> set -> set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition missingname_11a7881207b512d94b80bf063deea1d966d80a1fc730028fda1e52b2892558b3 : set :=
 missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 0 1 0 0.
Definition missingname_486f6ec68e6e7e6ed0c3d87605ac34e5ad4d34f68aad8b1f418088ac0fbe6719 : set :=
 missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 0 0 1 0.
Definition missingname_b06395fa712a284a45ab926327bb928f91cdc85c810e8c0fbaf6b1b4c3b12fc7 : set :=
 missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 0 0 0 1.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Definition missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (SNo x1) (forall x2 : prop, (forall x3, and (SNo x3) (forall x4 : prop, (forall x5, and (SNo x5) (forall x6 : prop, (forall x7, and (SNo x7) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x1 x3 x5 x7) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2))).
Definition missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (SNo x1) (forall x2 : prop, (forall x3, and (SNo x3) (forall x4 : prop, (forall x5, and (SNo x5) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) x1 x3 x5) -> x4) -> x4) -> x2) -> x2))).
Definition missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (SNo x1) (forall x2 : prop, (forall x3, and (SNo x3) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) x1 x3) -> x2) -> x2))).
Definition missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (SNo x1) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0) x1))).
Definition missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (SNo x2) (forall x3 : prop, (forall x4, and (SNo x4) (forall x5 : prop, (forall x6, and (SNo x6) (forall x7 : prop, (forall x8, and (SNo x8) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x2 x4 x6 x8) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1).
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem missingprop_431ff8ff6435faa4c5f86e4f0a6c43deeb7869b72194a714b191972a3eaf6491 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> and (SNo (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0)) (forall x1 : prop, (forall x2, and (SNo x2) (forall x3 : prop, (forall x4, and (SNo x4) (forall x5 : prop, (forall x6, and (SNo x6) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) x2 x4 x6) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_cc98097463596822ee898799e3d575e97f4d301507d1aca5bf428b8056270a60 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> and (SNo (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0)) (forall x1 : prop, (forall x2, and (SNo x2) (forall x3 : prop, (forall x4, and (SNo x4) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) x2 x4) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_e1da79ad2238fc685b3e4f7de09c0d965538bebf8c87c6f411479674dad88ab7 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> and (SNo (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0)) (forall x1 : prop, (forall x2, and (SNo x2) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0) x2) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_1df4bfe22f97512506ab6eba7670da5964bce053975b48ab4bfcd7dc5cc40416 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> and (SNo (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0)) (x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0) (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0))).
admit.
Qed.
Theorem missingprop_d490e9b67b13d1ef9389d3ace4e99a44b8ce86dd1d81aca7dab87729606ec525 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> SNo (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0)).
admit.
Qed.
Theorem missingprop_221fdb669888182bab57f3018210dac7aa6f39893e1d9c3490c39bcf8bddffeb : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> SNo (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0)).
admit.
Qed.
Theorem missingprop_8c3e941e183588bb9845a8e92af7c2409f09ad8e12d04378912de4f735a7c469 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> SNo (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0)).
admit.
Qed.
Theorem missingprop_072d8bdde21ee9f95ca6908fd1694154122013121af055783afb363ccc47d946 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> SNo (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0)).
admit.
Qed.
Theorem missingprop_fab35f50cd145d652b5fc5cd3a4891df4b124ab2e52314bc882e326245eddf92 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0) (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0)).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_1c4b77a1bdf71ac8c46772d8b01bd6609e54ee74070e16498c4800adfe13c5ca : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3)).
admit.
Qed.
Theorem missingprop_c7c4ae1a262d538340d0c539cfb965b7423c410b29ab44c84c226f7df341c929 : (forall x0, missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc x0 -> (forall x1 : set -> prop, (forall x2 x3 x4 x5, SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> x0 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x2 x3 x4 x5 -> x1 (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x2 x3 x4 x5)) -> x1 x0)).
admit.
Qed.
Axiom SNo_0 : SNo 0.
Axiom SNo_1 : SNo 1.
Theorem missingprop_6f1390c4ddd935285504af3eafec8c67d7d1af17b6eb807fb2383c8bdd9879a5 : missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc missingname_11a7881207b512d94b80bf063deea1d966d80a1fc730028fda1e52b2892558b3.
admit.
Qed.
Theorem missingprop_45a71009d4e0d04104491495fe397a91e9fe23b2953b35f10fb774e7b1600ce8 : missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc missingname_486f6ec68e6e7e6ed0c3d87605ac34e5ad4d34f68aad8b1f418088ac0fbe6719.
admit.
Qed.
Theorem missingprop_c5fc1a9a888357a49b3293c69e27b34c21732b3603d939ccc00fa7e7757256c1 : missingname_5a28322a117d04c6bab3b5e81d78810c07eb2853fc37c325d9956c6ffac19fcc missingname_b06395fa712a284a45ab926327bb928f91cdc85c810e8c0fbaf6b1b4c3b12fc7.
admit.
Qed.
Axiom missingprop_3a6161768bf91e61fa892c8d38b180efc695d0a755ac90625538c413d2215048 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x4 -> SNo x5 -> SNo x6 -> missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x4 x5 x6 x7 -> x0 = x4).
Theorem missingprop_5b2d2ce65e1fc332515bb30a92de424ac0d5cbb7d77b124611cbbe7a96870eb0 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) = x0).
admit.
Qed.
Axiom missingprop_a3a33ccb0071c2878f92a1cae7afeb2b106a5eb10ab63f1d0d9582d703abc2a9 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x4 x5 x6 x7 -> x1 = x5).
Theorem missingprop_af5c97087e14b962dd87ecf4ab354ceed3f9efcf8b826e4982289888865515b9 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) = x1).
admit.
Qed.
Axiom missingprop_99f23fd81225bd29ee42dc62a4d6e5b57a541a40a9b9a933a59c939aaf96ffc9 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x4 x5 x6 x7 -> x2 = x6).
Theorem missingprop_c802f0281bc54d1277d55e70328a2fd137e42a2692bd5ed2f566bd4dc86603d2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) = x2).
admit.
Qed.
Axiom missingprop_103a081e403793937d3065fae3fde1756efbefb7dcc44a50b4b18345b916d030 : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3 = missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x4 x5 x6 x7 -> x3 = x7).
Theorem missingprop_f844ed7770b4a1f56aa737ab959c609b883d20254a7c786d3681818688cf9ea3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d (missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 x0 x1 x2 x3) = x3).
admit.
Qed.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition missingname_d768de0757b1450b853f1f7daf176b69b948709f9d0fca8c54f6576bc6f26938 : set -> set :=
 (fun x0 : set => missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (minus_SNo (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0)) (minus_SNo (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0)) (minus_SNo (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0)) (minus_SNo (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0))).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Definition missingname_c84829ef6234d92b7a5da25298be38c048191c5d8639a58a5e7f2d8a4c6ea403 : set -> set -> set :=
 (fun x0 x1 : set => missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (add_SNo (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x1)) (add_SNo (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x1)) (add_SNo (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0) (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x1)) (add_SNo (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0) (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x1))).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition missingname_dd2a38939097ba3be69371aefd482a9a30e927c2687de454c4f1c4fb2e67568d : set -> set -> set :=
 (fun x0 x1 : set => missingname_826c13c2e96ad59a36baa3517a70c89a1b2ae78e99e23f147f3a56c14d9bdff6 (add_SNo (mul_SNo (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x1)) (add_SNo (minus_SNo (mul_SNo (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x1))) (add_SNo (minus_SNo (mul_SNo (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0) (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x1))) (minus_SNo (mul_SNo (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0) (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x1)))))) (add_SNo (mul_SNo (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x1)) (add_SNo (mul_SNo (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x1)) (add_SNo (mul_SNo (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0) (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x1)) (minus_SNo (mul_SNo (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0) (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x1)))))) (add_SNo (mul_SNo (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x1)) (add_SNo (minus_SNo (mul_SNo (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x1))) (add_SNo (mul_SNo (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0) (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x1)) (mul_SNo (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x1))))) (add_SNo (mul_SNo (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x0) (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x1)) (add_SNo (mul_SNo (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x0) (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x1)) (add_SNo (minus_SNo (mul_SNo (missingname_040f11e44a1306e657c5c3f97891848e6064605ad9d95ce3ed1b3d1f4d2624e7 x0) (missingname_2c274a15a3b01c62dd695f02662f387f4ee158f1d4eaed68db22858ebeab5c15 x1))) (mul_SNo (missingname_3115e2fc9e6deff9f4425a23026a9476b12f16d55cdbac70d3a60efd2a7c5a9d x0) (missingname_a833c067f024756029e624be4a71ef3f61e40b06331bd8e06d27c1a2d12b385d x1)))))).
