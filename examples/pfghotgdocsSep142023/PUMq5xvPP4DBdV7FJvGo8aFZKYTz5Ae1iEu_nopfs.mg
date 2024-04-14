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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_0_in_ordsucc : (forall x0, nat_p x0 -> 0 :e ordsucc x0).
Axiom nat_10 : nat_p 10.
Theorem missingprop_75a2217f444a8355661df02ea813edfc9906f9c691e6aec5c7f60143281295ec : 0 :e 11.
admit.
Qed.
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom missingprop_d949f57c5dfaf614a6f4f3766686f51d9eb716e4d0cf9f16865af268fc065aeb : 0 :e 10.
Theorem missingprop_36599b68dc80cafb8165db944aefd138558ad139883039d8611dd49e3829e57f : 1 :e 11.
admit.
Qed.
Axiom missingprop_1b6aea42dd8dd6467e5f0150bab2b0d6533055acdd61b232a0adb5a2a42e1655 : 1 :e 10.
Theorem missingprop_d89064e672a6ba105263148db400933d9c38598f5894ec1fb6598048313f4cbf : 2 :e 11.
admit.
Qed.
Axiom missingprop_aed7facd5ca13de9e69cd6026a1d4bd988584488df9982b5f9702dc816b82279 : 2 :e 10.
Theorem missingprop_361b242b3c85353e019eff22c898665bfaa0f7e6dc69c5003a9343c8024f1492 : 3 :e 11.
admit.
Qed.
Axiom missingprop_676c401f8098489ea0734657c4430df5000c9b26ac4bcf84e71557d406b8053d : 3 :e 10.
Theorem missingprop_35f99d9371323163ab5d61b16aab9a3a1263486f0a3a718645d43fd3db463f27 : 4 :e 11.
admit.
Qed.
Axiom missingprop_ba23a99d385c96fc20e18f31e2884f35e8c8dc96acf9973b3be03f8c1bfc0b50 : 4 :e 10.
Theorem missingprop_24b2a1c3fae91b51f4f8e89682640cba5f482f8829a3b338f47651c3a5fd5f6f : 5 :e 11.
admit.
Qed.
Axiom missingprop_f92773479be56466b39b85209c949bc89027283dc3c6bdb4a9c58e34c6e67297 : 5 :e 10.
Theorem missingprop_a4ddc89bda57a887a5dc3f77598f70981f54f3f289adf9fbb481b2b4d00bf533 : 6 :e 11.
admit.
Qed.
Axiom missingprop_fd78d9827713c0f7b71247ad97a24b91bc3ec9128c1ed685c74b49de36aa650c : 6 :e 10.
Theorem missingprop_b18d702f5c2ec6e903ac736dc6097e920fbb275019c2bab4286a56feb5bf1ea2 : 7 :e 11.
admit.
Qed.
Axiom missingprop_87b45db69061c144b881c41f7f327bf6d9b09a8a4f536e01d61fa471543b3acb : 7 :e 10.
Theorem missingprop_03b3feecc8acec5bd01d6e8f3465a2e9fc771f51c3de6bdb589de27f6114befe : 8 :e 11.
admit.
Qed.
Axiom missingprop_afbf689bc11c7ff9c9e9875ca76148f88a08e7b5261e935945ff12d04ab37d90 : 8 :e 10.
Theorem missingprop_3741ae2f0f9adc7b78c37c94b8f4e997c307af749b0e573f18a39ef5188225f1 : 9 :e 11.
admit.
Qed.
Axiom missingprop_83b7b73de92238880d97107189e7acf45f9dc154df0447f816815407ccfc32b3 : 9 :e 10.
Theorem missingprop_ab3665aaa395ba5bc535a8f5a44f14a9771c7e237581e2ade81e4e145ecc82bc : 10 :e 11.
admit.
Qed.
Axiom nat_11 : nat_p 11.
Theorem missingprop_a2ef0c58cfd090f3c9e6e7916f6b56032d6bdd4de509aa9fb32f7308f99daf5a : 0 :e 12.
admit.
Qed.
Theorem missingprop_b1b74a38cb206cf70f2e2bbc4ccd3cbdbf8c8df3defd64ff8c8a7258b3a2047a : 1 :e 12.
admit.
Qed.
Theorem missingprop_987ba5536dee4e8ff190eaeed4d2bb3ab5d85c45e6623acb29ce14f019a19681 : 2 :e 12.
admit.
Qed.
Theorem missingprop_cf5ceb5c8b16071a67f4b018bbc8955118e3633f8bcf650790850107ad2027ee : 3 :e 12.
admit.
Qed.
Theorem missingprop_4fce167ccdcc7fb45429dcf8a3db15dc462c457fe760841310c58bc94a706ed3 : 4 :e 12.
admit.
Qed.
Theorem missingprop_75d836f404cbbeae78f524a2ea7f26282023039d9accd25589aa1c1720bb8121 : 5 :e 12.
admit.
Qed.
Theorem missingprop_73e4e62694bfb193433658c654297b6ed3eb985937a9e426b510b83e68de24d1 : 6 :e 12.
admit.
Qed.
Theorem missingprop_a31357c4255c39823e518ff3fc8fa06c75e6252111ceae22b3d4f1c89a01d10b : 7 :e 12.
admit.
Qed.
Theorem missingprop_89f074e5696e72c1d0b8f6c7a30d07f4920551bfce89ff386ae0ecf5a82d48e4 : 8 :e 12.
admit.
Qed.
Theorem missingprop_2453a2b3484043c8ce568faca0a1096a3c2d75e863532a7d5d6a9f964c17a76f : 9 :e 12.
admit.
Qed.
Theorem missingprop_e58cb2c6f977d1b0d5350ed902991ead1b80327bc1b160612a3fd1cd20c9fd3b : 10 :e 12.
admit.
Qed.
Theorem missingprop_2e87f3f906df12d03519748b94abd9f72cc673eb197d25aaf167a3737a0cc14b : 11 :e 12.
admit.
Qed.
Axiom nat_12 : nat_p 12.
Theorem missingprop_8e2e2111bde26e25d7a47d01b5b268c8810126466b647bcb90e18b55c455c55f : 0 :e 13.
admit.
Qed.
Theorem missingprop_5a0cced658e385a9f161488a0b59850dbe7a95279a48c4a670d8524fa8a8662b : 1 :e 13.
admit.
Qed.
Theorem missingprop_6358d78f1652f4751c8c205ccef69d4bf259a01c9bce8f7f9da41edadcbf50ba : 2 :e 13.
admit.
Qed.
Theorem missingprop_22cca5a5ee36a7d81fa91f8fd4c14fcb22ddc9f559a5a08a0e1ef4efb6828010 : 3 :e 13.
admit.
Qed.
Theorem missingprop_fabb5ebdd9913b5bd1e996af7e3e33a951cdac9d03915fded834346562485266 : 4 :e 13.
admit.
Qed.
Theorem missingprop_ba9ae8a4863254f3704fa14639bb8327a927c3e786a27bdeb235adb1e0eb1c5a : 5 :e 13.
admit.
Qed.
Theorem missingprop_31fba22fe091af5416a7e9b76f80dbabfc13c323634d731d6fdf59d6dcd3e91a : 6 :e 13.
admit.
Qed.
Theorem missingprop_269184d50a39177d43eb370da2d073bdeface4a938fbbb03dcf5be3dc6e07dc8 : 7 :e 13.
admit.
Qed.
Theorem missingprop_d21f00b59e27a2a5e30acb5e1bd89e8682be02902fa61c5da12efa36345aa0e9 : 8 :e 13.
admit.
Qed.
Theorem missingprop_09f15a9d01f93a7528fa5f6c03657a2913fb0b654a203b3e012c73dd58be381d : 9 :e 13.
admit.
Qed.
Theorem missingprop_d703c22df6cc6298b53c92b18e251e56993b7c6bc6cd746cfad81dffd4a31e23 : 10 :e 13.
admit.
Qed.
Theorem missingprop_d0b907f11f7106146d29548fcb3a49e74411d92136323f4b4174f28479e56fcb : 11 :e 13.
admit.
Qed.
Theorem missingprop_aac233feaa0aa18324c0d692b3f19bd8318b55545ab88208c741a1f8b442a053 : 12 :e 13.
admit.
Qed.
