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
(* Parameter CSNo "b678d9e153d06cf44cf447be611c0e745893b20351d0f79af5de8da0d58ac866" "4235a7ec116097b786860fa05ca09197cbbcea5e520801a717b25d8a21008ee1" *)
Parameter CSNo : set -> prop.
(* Parameter nIn "2f8b7f287504f141b0f821928ac62823a377717763a224067702eee02fc1f359" "36808cca33f2b3819497d3a1f10fcc77486a0cddbcb304e44cbf2d818e181c3e" *)
Parameter nIn : set -> set -> prop.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
Definition ExtendedSNoElt_ : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e Union x1 -> or (ordinal x2) (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = Sing x4) -> x3) -> x3)).
Axiom Sing_nat_fresh_extension : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1, ExtendedSNoElt_ x0 x1 -> (forall x2, x2 :e x1 -> nIn (Sing x0) x2))).
Axiom nat_3 : nat_p 3.
Axiom In_1_3 : 1 :e 3.
Axiom CSNo_ExtendedSNoElt_3 : (forall x0, CSNo x0 -> ExtendedSNoElt_ 3 x0).
Theorem quaternion_tag_fresh : (forall x0, CSNo x0 -> (forall x1, x1 :e x0 -> nIn (Sing 3) x1)).
admit.
Qed.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Definition pair_tag : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => binunion x1 {SetAdjoin x3 x0 | x3 :e x2}).
Definition CSNo_pair : set -> set -> set :=
 pair_tag (Sing 3).
Axiom pair_tag_0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, forall x3 : set -> set -> prop, x3 (pair_tag x0 x2 0) x2 -> x3 x2 (pair_tag x0 x2 0))).
Theorem CSNo_pair_0 : (forall x0, forall x1 : set -> set -> prop, x1 (CSNo_pair x0 0) x0 -> x1 x0 (CSNo_pair x0 0)).
admit.
Qed.
Axiom pair_tag_prop_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 x4 x5, x1 x2 -> x1 x4 -> pair_tag x0 x2 x3 = pair_tag x0 x4 x5 -> x2 = x4)).
Theorem CSNo_pair_prop_1 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x2 -> CSNo_pair x0 x1 = CSNo_pair x2 x3 -> x0 = x2).
admit.
Qed.
Axiom pair_tag_prop_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 x4 x5, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> pair_tag x0 x2 x3 = pair_tag x0 x4 x5 -> x3 = x5)).
Theorem CSNo_pair_prop_2 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> CSNo_pair x0 x1 = CSNo_pair x2 x3 -> x1 = x3).
admit.
Qed.
(* Parameter CD_carr "2ea55f9b30e95e7481941454eb68ac6de771c9b03bcefa870c619fd0530d5229" "0c2c093b916057b76c377fc735ca4f5cf43faac41dbd2d3dd614aec17be1e1ce" *)
Parameter CD_carr : set -> (set -> prop) -> set -> prop.
Definition HSNo : set -> prop :=
 CD_carr (Sing 3) CSNo.
Axiom CD_carr_I : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> CD_carr x0 x1 (pair_tag x0 x2 x3))).
Theorem HSNo_I : (forall x0 x1, CSNo x0 -> CSNo x1 -> HSNo (CSNo_pair x0 x1)).
admit.
Qed.
Axiom CD_carr_E : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> (forall x3 : set -> prop, (forall x4 x5, x1 x4 -> x1 x5 -> x2 = pair_tag x0 x4 x5 -> x3 (pair_tag x0 x4 x5)) -> x3 x2))).
Theorem HSNo_E : (forall x0, HSNo x0 -> (forall x1 : set -> prop, (forall x2 x3, CSNo x2 -> CSNo x3 -> x0 = CSNo_pair x2 x3 -> x1 (CSNo_pair x2 x3)) -> x1 x0)).
admit.
Qed.
Axiom CD_carr_0ext : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> x1 0 -> (forall x2, x1 x2 -> CD_carr x0 x1 x2)).
Axiom CSNo_0 : CSNo 0.
Theorem CSNo_HSNo : (forall x0, CSNo x0 -> HSNo x0).
admit.
Qed.
Theorem HSNo_0 : HSNo 0.
admit.
Qed.
Axiom CSNo_1 : CSNo 1.
Theorem HSNo_1 : HSNo 1.
admit.
Qed.
Axiom UnionE_impred : (forall x0 x1, x1 :e Union x0 -> (forall x2 : prop, (forall x3, x1 :e x3 -> x3 :e x0 -> x2) -> x2)).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
(* Parameter Subq "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" "81c0efe6636cef7bc8041820a3ebc8dc5fa3bc816854d8b7f507e30425fc1cef" *)
Parameter Subq : set -> set -> prop.
Axiom extension_SNoElt_mon : (forall x0 x1, x0 c= x1 -> (forall x2, ExtendedSNoElt_ x0 x2 -> ExtendedSNoElt_ x1 x2)).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom UnionI : (forall x0 x1 x2, x1 :e x2 -> x2 :e x0 -> x1 :e Union x0).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom In_3_4 : 3 :e 4.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Theorem HSNo_ExtendedSNoElt_4 : (forall x0, HSNo x0 -> ExtendedSNoElt_ 4 x0).
admit.
Qed.
Definition Quaternion_j : set :=
 CSNo_pair 0 1.
(* Parameter Complex_i "b46d1faaae35e838de0e9479314a37044791cb438ba6f794b98027b5ec829dbe" "ace1d58e185110764e46cbc1f7da7b426c20caebe3e3b0030d5dade0868711a1" *)
Parameter Complex_i : set.
Definition Quaternion_k : set :=
 CSNo_pair 0 Complex_i.
(* Parameter CD_proj0 "0f0c33ee510e1a6616dae9740b87813905ab9c81cd7bba0430bb93ed78b7f32e" "e6d3c908403e809d0499044c6327107f48e159032f5d408db7c9a005219d76c5" *)
Parameter CD_proj0 : set -> (set -> prop) -> set -> set.
Definition HSNo_proj0 : set -> set :=
 CD_proj0 (Sing 3) CSNo.
(* Parameter CD_proj1 "0e60a25c698581d33ab462b7d2f97fb3428f8ae674a065695d8fe89cdf0f35a2" "934eedf1ea050179b5169b28a60315fede0e4412cfff04a00c8c4a41e918fb4a" *)
Parameter CD_proj1 : set -> (set -> prop) -> set -> set.
Definition HSNo_proj1 : set -> set :=
 CD_proj1 (Sing 3) CSNo.
Axiom CD_proj0_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> and (x1 (CD_proj0 x0 x1 x2)) (forall x3 : prop, (forall x4, and (x1 x4) (x2 = pair_tag x0 (CD_proj0 x0 x1 x2) x4) -> x3) -> x3))).
Theorem HSNo_proj0_1 : (forall x0, HSNo x0 -> and (CSNo (HSNo_proj0 x0)) (forall x1 : prop, (forall x2, and (CSNo x2) (x0 = CSNo_pair (HSNo_proj0 x0) x2) -> x1) -> x1)).
admit.
Qed.
Axiom CD_proj0_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> CD_proj0 x0 x1 (pair_tag x0 x2 x3) = x2)).
Theorem HSNo_proj0_2 : (forall x0 x1, CSNo x0 -> CSNo x1 -> HSNo_proj0 (CSNo_pair x0 x1) = x0).
admit.
Qed.
Axiom CD_proj1_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> and (x1 (CD_proj1 x0 x1 x2)) (x2 = pair_tag x0 (CD_proj0 x0 x1 x2) (CD_proj1 x0 x1 x2)))).
Theorem HSNo_proj1_1 : (forall x0, HSNo x0 -> and (CSNo (HSNo_proj1 x0)) (x0 = CSNo_pair (HSNo_proj0 x0) (HSNo_proj1 x0))).
admit.
Qed.
Axiom CD_proj1_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> CD_proj1 x0 x1 (pair_tag x0 x2 x3) = x3)).
Theorem HSNo_proj1_2 : (forall x0 x1, CSNo x0 -> CSNo x1 -> HSNo_proj1 (CSNo_pair x0 x1) = x1).
admit.
Qed.
Axiom CD_proj0R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> x1 (CD_proj0 x0 x1 x2))).
Theorem HSNo_proj0R : (forall x0, HSNo x0 -> CSNo (HSNo_proj0 x0)).
admit.
Qed.
Axiom CD_proj1R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> x1 (CD_proj1 x0 x1 x2))).
Theorem HSNo_proj1R : (forall x0, HSNo x0 -> CSNo (HSNo_proj1 x0)).
admit.
Qed.
Axiom CD_proj0proj1_eta : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> x2 = pair_tag x0 (CD_proj0 x0 x1 x2) (CD_proj1 x0 x1 x2))).
Theorem HSNo_proj0p1 : (forall x0, HSNo x0 -> x0 = CSNo_pair (HSNo_proj0 x0) (HSNo_proj1 x0)).
admit.
Qed.
Axiom CD_proj0proj1_split : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, CD_carr x0 x1 x2 -> CD_carr x0 x1 x3 -> CD_proj0 x0 x1 x2 = CD_proj0 x0 x1 x3 -> CD_proj1 x0 x1 x2 = CD_proj1 x0 x1 x3 -> x2 = x3)).
Theorem HSNo_proj0proj1_split : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo_proj0 x0 = HSNo_proj0 x1 -> HSNo_proj1 x0 = HSNo_proj1 x1 -> x0 = x1).
admit.
Qed.
(* Parameter CSNoLev "69652a7676f883b354312fee352e5907aa39212722cedf2eca92d731b7b0e2f2" "f2958271da99009fb2da8a65f76c4aae93222390defcbd0a3db61dc9349b1268" *)
Parameter CSNoLev : set -> set.
Definition HSNoLev : set -> set :=
 (fun x0 : set => binunion (CSNoLev (HSNo_proj0 x0)) (CSNoLev (HSNo_proj1 x0))).
Axiom ordinal_binunion : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binunion x0 x1)).
Axiom CSNoLev_ordinal : (forall x0, CSNo x0 -> ordinal (CSNoLev x0)).
Theorem HSNoLev_ordinal : (forall x0, HSNo x0 -> ordinal (HSNoLev x0)).
admit.
Qed.
(* Parameter CD_minus "076775e9ee366b860a11e2cb50880a08fbbbcce52aa5a1cbcf2ce9acd61308c1" "2d3588445fd168b15836ab7b6758efaf82a6f0a87ba550d8a138e77fd02b50e7" *)
Parameter CD_minus : set -> (set -> prop) -> (set -> set) -> set -> set.
(* Parameter minus_CSNo "4f92a9e0271ddb1267597c692d8047b29044e7c0c576fb35221fc05e8cc2e169" "84edf6250efa183daa5d97710793416c455289f25e5c4ff24b9316496cb3edcc" *)
Parameter minus_CSNo : set -> set.
Definition minus_HSNo : set -> set :=
 CD_minus (Sing 3) CSNo minus_CSNo.
(* Parameter CD_conj "ed5d3637676fc8f4658dd685e15ce9c2e389effe6e6ae21ea11cf574a73047aa" "b39bd24227d03dc1058ece41a05ced6e07fc86a368553c9e9cad9950e6962f94" *)
Parameter CD_conj : set -> (set -> prop) -> (set -> set) -> (set -> set) -> set -> set.
(* Parameter conj_CSNo "f9e35ab050a51a27196d8b390e814e818302ed8a98f76b49e3126d2b643362f7" "f0317b853a5799dfcc8c1b80b61c63a878057a0cc57c6af584ed4cdd5a2eaf0f" *)
Parameter conj_CSNo : set -> set.
Definition conj_HSNo : set -> set :=
 CD_conj (Sing 3) CSNo minus_CSNo conj_CSNo.
(* Parameter CD_add "d429c24f936af1bb25bc557a30009af2fbbed57490e129c9faf2a4be3f0fa5cc" "7a5ff6ae3ec53ef0ca861a9a23a0849db2e922c9b8927dde4e2f9b8a94acda17" *)
Parameter CD_add : set -> (set -> prop) -> (set -> set -> set) -> set -> set -> set.
(* Parameter add_CSNo "ce57e9d433ea923a64c5407464e1f301a0771389be6c3ee536319b8514b2986d" "1c8cce54f37fca653d20d5415ed4bc13353c15f33bfd0589f5ec9ffc056ac705" *)
Parameter add_CSNo : set -> set -> set.
Definition add_HSNo : set -> set -> set :=
 CD_add (Sing 3) CSNo add_CSNo.
(* Parameter CD_mul "2d405f8176162a4b16698d239105daa816849bc04ed9b4112bd45755c4b80067" "f53b0eacc4048b311cad977680319e85147a1491bc6b63f6c57aafe79efe25b9" *)
Parameter CD_mul : set -> (set -> prop) -> (set -> set) -> (set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
(* Parameter mul_CSNo "087bc0449c1b773fd802d9657db96e9f7370c4b8290db0e6101861175948d90a" "fbcd2a31a3d887d7c161aa2314509f533c62f1962052dc5160d2ce16b45844e4" *)
Parameter mul_CSNo : set -> set -> set.
Definition mul_HSNo : set -> set -> set :=
 CD_mul (Sing 3) CSNo minus_CSNo conj_CSNo add_CSNo mul_CSNo.
(* Parameter CD_exp_nat "2f68668d950ae4b31a36622c9395f9129a99cbaf960a62d9b333bff96e32521b" "7fdc79d0bbcb8e25212e6590e58e780616267925d89e75438662efe2e5f1651d" *)
Parameter CD_exp_nat : set -> (set -> prop) -> (set -> set) -> (set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
Definition exp_HSNo_nat : set -> set -> set :=
 CD_exp_nat (Sing 3) CSNo minus_CSNo conj_CSNo add_CSNo mul_CSNo.
Axiom CSNo_Complex_i : CSNo Complex_i.
Theorem HSNo_Complex_i : HSNo Complex_i.
admit.
Qed.
Theorem HSNo_Quaternion_j : HSNo Quaternion_j.
admit.
Qed.
Theorem HSNo_Quaternion_k : HSNo Quaternion_k.
admit.
Qed.
Axiom CD_minus_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, CD_carr x0 x1 x3 -> CD_carr x0 x1 (CD_minus x0 x1 x2 x3)))).
Axiom CSNo_minus_CSNo : (forall x0, CSNo x0 -> CSNo (minus_CSNo x0)).
Theorem HSNo_minus_HSNo : (forall x0, HSNo x0 -> HSNo (minus_HSNo x0)).
admit.
Qed.
Axiom CD_minus_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, CD_carr x0 x1 x3 -> CD_proj0 x0 x1 (CD_minus x0 x1 x2 x3) = x2 (CD_proj0 x0 x1 x3)))).
Theorem minus_HSNo_proj0 : (forall x0, HSNo x0 -> HSNo_proj0 (minus_HSNo x0) = minus_CSNo (HSNo_proj0 x0)).
admit.
Qed.
Axiom CD_minus_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, CD_carr x0 x1 x3 -> CD_proj1 x0 x1 (CD_minus x0 x1 x2 x3) = x2 (CD_proj1 x0 x1 x3)))).
Theorem minus_HSNo_proj1 : (forall x0, HSNo x0 -> HSNo_proj1 (minus_HSNo x0) = minus_CSNo (HSNo_proj1 x0)).
admit.
Qed.
Axiom CD_conj_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3 : set -> set, (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_carr x0 x1 (CD_conj x0 x1 x2 x3 x4))))).
Axiom CSNo_conj_CSNo : (forall x0, CSNo x0 -> CSNo (conj_CSNo x0)).
Theorem HSNo_conj_HSNo : (forall x0, HSNo x0 -> HSNo (conj_HSNo x0)).
admit.
Qed.
Axiom CD_conj_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3 : set -> set, (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_proj0 x0 x1 (CD_conj x0 x1 x2 x3 x4) = x3 (CD_proj0 x0 x1 x4))))).
Theorem conj_HSNo_proj0 : (forall x0, HSNo x0 -> HSNo_proj0 (conj_HSNo x0) = conj_CSNo (HSNo_proj0 x0)).
admit.
Qed.
Axiom CD_conj_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3 : set -> set, (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_proj1 x0 x1 (CD_conj x0 x1 x2 x3 x4) = x2 (CD_proj1 x0 x1 x4))))).
Theorem conj_HSNo_proj1 : (forall x0, HSNo x0 -> HSNo_proj1 (conj_HSNo x0) = minus_CSNo (HSNo_proj1 x0)).
admit.
Qed.
Axiom CD_add_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_carr x0 x1 (CD_add x0 x1 x2 x3 x4)))).
Axiom CSNo_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (add_CSNo x0 x1)).
Theorem HSNo_add_HSNo : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo (add_HSNo x0 x1)).
admit.
Qed.
Axiom CD_add_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_proj0 x0 x1 (CD_add x0 x1 x2 x3 x4) = x2 (CD_proj0 x0 x1 x3) (CD_proj0 x0 x1 x4)))).
Theorem add_HSNo_proj0 : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo_proj0 (add_HSNo x0 x1) = add_CSNo (HSNo_proj0 x0) (HSNo_proj0 x1)).
admit.
Qed.
Axiom CD_add_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_proj1 x0 x1 (CD_add x0 x1 x2 x3 x4) = x2 (CD_proj1 x0 x1 x3) (CD_proj1 x0 x1 x4)))).
Theorem add_HSNo_proj1 : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo_proj1 (add_HSNo x0 x1) = add_CSNo (HSNo_proj1 x0) (HSNo_proj1 x1)).
admit.
Qed.
Axiom CD_mul_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_carr x0 x1 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7)))).
Axiom CSNo_mul_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (mul_CSNo x0 x1)).
Theorem HSNo_mul_HSNo : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo (mul_HSNo x0 x1)).
admit.
Qed.
Axiom CD_mul_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_proj0 x0 x1 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) = x4 (x5 (CD_proj0 x0 x1 x6) (CD_proj0 x0 x1 x7)) (x2 (x5 (x3 (CD_proj1 x0 x1 x7)) (CD_proj1 x0 x1 x6)))))).
Theorem mul_HSNo_proj0 : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo_proj0 (mul_HSNo x0 x1) = add_CSNo (mul_CSNo (HSNo_proj0 x0) (HSNo_proj0 x1)) (minus_CSNo (mul_CSNo (conj_CSNo (HSNo_proj1 x1)) (HSNo_proj1 x0)))).
admit.
Qed.
Axiom CD_mul_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_proj1 x0 x1 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) = x4 (x5 (CD_proj1 x0 x1 x7) (CD_proj0 x0 x1 x6)) (x5 (CD_proj1 x0 x1 x6) (x3 (CD_proj0 x0 x1 x7)))))).
Theorem mul_HSNo_proj1 : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo_proj1 (mul_HSNo x0 x1) = add_CSNo (mul_CSNo (HSNo_proj1 x1) (HSNo_proj0 x0)) (mul_CSNo (HSNo_proj1 x0) (conj_CSNo (HSNo_proj0 x1)))).
admit.
Qed.
Axiom CD_proj0_F : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> x1 0 -> (forall x2, x1 x2 -> CD_proj0 x0 x1 x2 = x2)).
Theorem CSNo_HSNo_proj0 : (forall x0, CSNo x0 -> HSNo_proj0 x0 = x0).
admit.
Qed.
Axiom CD_proj1_F : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> x1 0 -> (forall x2, x1 x2 -> CD_proj1 x0 x1 x2 = 0)).
Theorem CSNo_HSNo_proj1 : (forall x0, CSNo x0 -> HSNo_proj1 x0 = 0).
admit.
Qed.
Theorem HSNo_p0_0 : HSNo_proj0 0 = 0.
admit.
Qed.
Theorem HSNo_p1_0 : HSNo_proj1 0 = 0.
admit.
Qed.
Theorem HSNo_p0_1 : HSNo_proj0 1 = 1.
admit.
Qed.
Theorem HSNo_p1_1 : HSNo_proj1 1 = 0.
admit.
Qed.
Theorem HSNo_p0_i : HSNo_proj0 Complex_i = Complex_i.
admit.
Qed.
Theorem HSNo_p1_i : HSNo_proj1 Complex_i = 0.
admit.
Qed.
Theorem HSNo_p0_j : HSNo_proj0 Quaternion_j = 0.
admit.
Qed.
Theorem HSNo_p1_j : HSNo_proj1 Quaternion_j = 1.
admit.
Qed.
Theorem HSNo_p0_k : HSNo_proj0 Quaternion_k = 0.
admit.
Qed.
Theorem HSNo_p1_k : HSNo_proj1 Quaternion_k = Complex_i.
admit.
Qed.
Axiom CD_minus_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, x1 0 -> x2 0 = 0 -> (forall x3, x1 x3 -> CD_minus x0 x1 x2 x3 = x2 x3))).
Axiom minus_CSNo_0 : minus_CSNo 0 = 0.
Theorem minus_HSNo_minus_CSNo : (forall x0, CSNo x0 -> minus_HSNo x0 = minus_CSNo x0).
admit.
Qed.
Theorem minus_HSNo_0 : minus_HSNo 0 = 0.
admit.
Qed.
Axiom CD_conj_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, x1 0 -> x2 0 = 0 -> (forall x3 : set -> set, forall x4, x1 x4 -> CD_conj x0 x1 x2 x3 x4 = x3 x4))).
Theorem conj_HSNo_conj_CSNo : (forall x0, CSNo x0 -> conj_HSNo x0 = conj_CSNo x0).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom SNo_CSNo : (forall x0, SNo x0 -> CSNo x0).
Axiom conj_CSNo_id_SNo : (forall x0, SNo x0 -> conj_CSNo x0 = x0).
Theorem conj_HSNo_id_SNo : (forall x0, SNo x0 -> conj_HSNo x0 = x0).
admit.
Qed.
Axiom conj_CSNo_0 : conj_CSNo 0 = 0.
Theorem conj_HSNo_0 : conj_HSNo 0 = 0.
admit.
Qed.
Axiom conj_CSNo_1 : conj_CSNo 1 = 1.
Theorem conj_HSNo_1 : conj_HSNo 1 = 1.
admit.
Qed.
Axiom CD_add_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, x1 0 -> x2 0 0 = 0 -> (forall x3 x4, x1 x3 -> x1 x4 -> CD_add x0 x1 x2 x3 x4 = x2 x3 x4))).
Axiom add_CSNo_0L : (forall x0, CSNo x0 -> add_CSNo 0 x0 = x0).
Theorem add_HSNo_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> add_HSNo x0 x1 = add_CSNo x0 x1).
admit.
Qed.
Axiom CD_mul_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> x2 0 = 0 -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6 x7, x1 x6 -> x1 x7 -> CD_mul x0 x1 x2 x3 x4 x5 x6 x7 = x5 x6 x7))).
Axiom add_CSNo_0R : (forall x0, CSNo x0 -> add_CSNo x0 0 = x0).
Axiom mul_CSNo_0L : (forall x0, CSNo x0 -> mul_CSNo 0 x0 = 0).
Axiom mul_CSNo_0R : (forall x0, CSNo x0 -> mul_CSNo x0 0 = 0).
Theorem mul_HSNo_mul_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_HSNo x0 x1 = mul_CSNo x0 x1).
admit.
Qed.
Axiom CD_minus_invol : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, x1 x3 -> x2 (x2 x3) = x3) -> (forall x3, CD_carr x0 x1 x3 -> CD_minus x0 x1 x2 (CD_minus x0 x1 x2 x3) = x3))).
Axiom minus_CSNo_invol : (forall x0, CSNo x0 -> minus_CSNo (minus_CSNo x0) = x0).
Theorem minus_HSNo_invol : (forall x0, HSNo x0 -> minus_HSNo (minus_HSNo x0) = x0).
admit.
Qed.
Axiom CD_conj_invol : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, x1 x4 -> x2 (x2 x4) = x4) -> (forall x4, x1 x4 -> x3 (x3 x4) = x4) -> (forall x4, CD_carr x0 x1 x4 -> CD_conj x0 x1 x2 x3 (CD_conj x0 x1 x2 x3 x4) = x4))).
Axiom conj_CSNo_invol : (forall x0, CSNo x0 -> conj_CSNo (conj_CSNo x0) = x0).
Theorem conj_HSNo_invol : (forall x0, HSNo x0 -> conj_HSNo (conj_HSNo x0) = x0).
admit.
Qed.
Axiom CD_conj_minus : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, x1 x4 -> x3 (x2 x4) = x2 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_conj x0 x1 x2 x3 (CD_minus x0 x1 x2 x4) = CD_minus x0 x1 x2 (CD_conj x0 x1 x2 x3 x4)))).
Axiom conj_minus_CSNo : (forall x0, CSNo x0 -> conj_CSNo (minus_CSNo x0) = minus_CSNo (conj_CSNo x0)).
Theorem conj_minus_HSNo : (forall x0, HSNo x0 -> conj_HSNo (minus_HSNo x0) = minus_HSNo (conj_HSNo x0)).
admit.
Qed.
Axiom CD_minus_add : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, forall x3 : set -> set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4 x5, x1 x4 -> x1 x5 -> x1 (x3 x4 x5)) -> (forall x4 x5, x1 x4 -> x1 x5 -> x2 (x3 x4 x5) = x3 (x2 x4) (x2 x5)) -> (forall x4 x5, CD_carr x0 x1 x4 -> CD_carr x0 x1 x5 -> CD_minus x0 x1 x2 (CD_add x0 x1 x3 x4 x5) = CD_add x0 x1 x3 (CD_minus x0 x1 x2 x4) (CD_minus x0 x1 x2 x5)))).
Axiom minus_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> minus_CSNo (add_CSNo x0 x1) = add_CSNo (minus_CSNo x0) (minus_CSNo x1)).
Theorem minus_add_HSNo : (forall x0 x1, HSNo x0 -> HSNo x1 -> minus_HSNo (add_HSNo x0 x1) = add_HSNo (minus_HSNo x0) (minus_HSNo x1)).
admit.
Qed.
Axiom CD_conj_add : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 : set -> set -> set, (forall x5, x1 x5 -> x1 (x2 x5)) -> (forall x5, x1 x5 -> x1 (x3 x5)) -> (forall x5 x6, x1 x5 -> x1 x6 -> x1 (x4 x5 x6)) -> (forall x5 x6, x1 x5 -> x1 x6 -> x2 (x4 x5 x6) = x4 (x2 x5) (x2 x6)) -> (forall x5 x6, x1 x5 -> x1 x6 -> x3 (x4 x5 x6) = x4 (x3 x5) (x3 x6)) -> (forall x5 x6, CD_carr x0 x1 x5 -> CD_carr x0 x1 x6 -> CD_conj x0 x1 x2 x3 (CD_add x0 x1 x4 x5 x6) = CD_add x0 x1 x4 (CD_conj x0 x1 x2 x3 x5) (CD_conj x0 x1 x2 x3 x6)))).
Axiom conj_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> conj_CSNo (add_CSNo x0 x1) = add_CSNo (conj_CSNo x0) (conj_CSNo x1)).
Theorem conj_add_HSNo : (forall x0 x1, HSNo x0 -> HSNo x1 -> conj_HSNo (add_HSNo x0 x1) = add_HSNo (conj_HSNo x0) (conj_HSNo x1)).
admit.
Qed.
Axiom CD_add_com : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x2 x3 x4 = x2 x4 x3) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_add x0 x1 x2 x3 x4 = CD_add x0 x1 x2 x4 x3))).
Axiom add_CSNo_com : (forall x0 x1, CSNo x0 -> CSNo x1 -> add_CSNo x0 x1 = add_CSNo x1 x0).
Theorem add_HSNo_com : (forall x0 x1, HSNo x0 -> HSNo x1 -> add_HSNo x0 x1 = add_HSNo x1 x0).
admit.
Qed.
Axiom CD_add_assoc : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4 x5, x1 x3 -> x1 x4 -> x1 x5 -> x2 (x2 x3 x4) x5 = x2 x3 (x2 x4 x5)) -> (forall x3 x4 x5, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_carr x0 x1 x5 -> CD_add x0 x1 x2 (CD_add x0 x1 x2 x3 x4) x5 = CD_add x0 x1 x2 x3 (CD_add x0 x1 x2 x4 x5)))).
Axiom add_CSNo_assoc : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo (add_CSNo x0 x1) x2 = add_CSNo x0 (add_CSNo x1 x2)).
Theorem add_HSNo_assoc : (forall x0 x1 x2, HSNo x0 -> HSNo x1 -> HSNo x2 -> add_HSNo (add_HSNo x0 x1) x2 = add_HSNo x0 (add_HSNo x1 x2)).
admit.
Qed.
Axiom CD_add_0L : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, x1 0 -> (forall x3, x1 x3 -> x2 0 x3 = x3) -> (forall x3, CD_carr x0 x1 x3 -> CD_add x0 x1 x2 0 x3 = x3))).
Theorem add_HSNo_0L : (forall x0, HSNo x0 -> add_HSNo 0 x0 = x0).
admit.
Qed.
Axiom CD_add_0R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, x1 0 -> (forall x3, x1 x3 -> x2 x3 0 = x3) -> (forall x3, CD_carr x0 x1 x3 -> CD_add x0 x1 x2 x3 0 = x3))).
Theorem add_HSNo_0R : (forall x0, HSNo x0 -> add_HSNo x0 0 = x0).
admit.
Qed.
Axiom CD_add_minus_linv : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, forall x3 : set -> set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x3 (x2 x4) x4 = 0) -> (forall x4, CD_carr x0 x1 x4 -> CD_add x0 x1 x3 (CD_minus x0 x1 x2 x4) x4 = 0))).
Axiom add_CSNo_minus_CSNo_linv : (forall x0, CSNo x0 -> add_CSNo (minus_CSNo x0) x0 = 0).
Theorem add_HSNo_minus_HSNo_linv : (forall x0, HSNo x0 -> add_HSNo (minus_HSNo x0) x0 = 0).
admit.
Qed.
Axiom CD_add_minus_rinv : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, forall x3 : set -> set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x3 x4 (x2 x4) = 0) -> (forall x4, CD_carr x0 x1 x4 -> CD_add x0 x1 x3 x4 (CD_minus x0 x1 x2 x4) = 0))).
Axiom add_CSNo_minus_CSNo_rinv : (forall x0, CSNo x0 -> add_CSNo x0 (minus_CSNo x0) = 0).
Theorem add_HSNo_minus_HSNo_rinv : (forall x0, HSNo x0 -> add_HSNo x0 (minus_HSNo x0) = 0).
admit.
Qed.
Axiom CD_mul_0R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x2 0 = 0 -> x3 0 = 0 -> x4 0 0 = 0 -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 x6 0 = 0))).
Theorem mul_HSNo_0R : (forall x0, HSNo x0 -> mul_HSNo x0 0 = 0).
admit.
Qed.
Axiom CD_mul_0L : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> (forall x6, x1 x6 -> x1 (x3 x6)) -> x2 0 = 0 -> x4 0 0 = 0 -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 0 x6 = 0))).
Theorem mul_HSNo_0L : (forall x0, HSNo x0 -> mul_HSNo 0 x0 = 0).
admit.
Qed.
Axiom CD_mul_1R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> x2 0 = 0 -> x3 0 = 0 -> x3 1 = 1 -> (forall x6, x1 x6 -> x4 0 x6 = x6) -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 x6 1 = x6))).
Axiom mul_CSNo_1R : (forall x0, CSNo x0 -> mul_CSNo x0 1 = x0).
Theorem mul_HSNo_1R : (forall x0, HSNo x0 -> mul_HSNo x0 1 = x0).
admit.
Qed.
Axiom CD_mul_1L : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> (forall x6, x1 x6 -> x1 (x3 x6)) -> x2 0 = 0 -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6, x1 x6 -> x5 1 x6 = x6) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 1 x6 = x6))).
Axiom mul_CSNo_1L : (forall x0, CSNo x0 -> mul_CSNo 1 x0 = x0).
Theorem mul_HSNo_1L : (forall x0, HSNo x0 -> mul_HSNo 1 x0 = x0).
admit.
Qed.
Axiom CD_conj_mul : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6, x1 x6 -> x2 (x2 x6) = x6) -> (forall x6, x1 x6 -> x3 (x3 x6) = x6) -> (forall x6, x1 x6 -> x3 (x2 x6) = x2 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x3 (x4 x6 x7) = x4 (x3 x6) (x3 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x4 x6 x7 = x4 x7 x6) -> (forall x6 x7, x1 x6 -> x1 x7 -> x3 (x5 x6 x7) = x5 (x3 x7) (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 x6 (x2 x7) = x2 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 (x2 x6) x7 = x2 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_conj x0 x1 x2 x3 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) = CD_mul x0 x1 x2 x3 x4 x5 (CD_conj x0 x1 x2 x3 x7) (CD_conj x0 x1 x2 x3 x6)))).
Axiom conj_mul_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> conj_CSNo (mul_CSNo x0 x1) = mul_CSNo (conj_CSNo x1) (conj_CSNo x0)).
Axiom minus_mul_CSNo_distrR : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 (minus_CSNo x1) = minus_CSNo (mul_CSNo x0 x1)).
Axiom minus_mul_CSNo_distrL : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo (minus_CSNo x0) x1 = minus_CSNo (mul_CSNo x0 x1)).
Theorem conj_mul_HSNo : (forall x0 x1, HSNo x0 -> HSNo x1 -> conj_HSNo (mul_HSNo x0 x1) = mul_HSNo (conj_HSNo x1) (conj_HSNo x0)).
admit.
Qed.
Axiom CD_add_mul_distrL : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x3 (x4 x6 x7) = x4 (x3 x6) (x3 x7)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x4 (x4 x6 x7) x8 = x4 x6 (x4 x7 x8)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x4 x6 x7 = x4 x7 x6) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 x6 (x4 x7 x8) = x4 (x5 x6 x7) (x5 x6 x8)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 (x4 x6 x7) x8 = x4 (x5 x6 x8) (x5 x7 x8)) -> (forall x6 x7 x8, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_carr x0 x1 x8 -> CD_mul x0 x1 x2 x3 x4 x5 x6 (CD_add x0 x1 x4 x7 x8) = CD_add x0 x1 x4 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) (CD_mul x0 x1 x2 x3 x4 x5 x6 x8)))).
Axiom mul_CSNo_distrL : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (add_CSNo x1 x2) = add_CSNo (mul_CSNo x0 x1) (mul_CSNo x0 x2)).
Axiom mul_CSNo_distrR : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo (add_CSNo x0 x1) x2 = add_CSNo (mul_CSNo x0 x2) (mul_CSNo x1 x2)).
Theorem mul_HSNo_distrL : (forall x0 x1 x2, HSNo x0 -> HSNo x1 -> HSNo x2 -> mul_HSNo x0 (add_HSNo x1 x2) = add_HSNo (mul_HSNo x0 x1) (mul_HSNo x0 x2)).
admit.
Qed.
Axiom CD_add_mul_distrR : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x4 (x4 x6 x7) x8 = x4 x6 (x4 x7 x8)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x4 x6 x7 = x4 x7 x6) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 x6 (x4 x7 x8) = x4 (x5 x6 x7) (x5 x6 x8)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 (x4 x6 x7) x8 = x4 (x5 x6 x8) (x5 x7 x8)) -> (forall x6 x7 x8, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_carr x0 x1 x8 -> CD_mul x0 x1 x2 x3 x4 x5 (CD_add x0 x1 x4 x6 x7) x8 = CD_add x0 x1 x4 (CD_mul x0 x1 x2 x3 x4 x5 x6 x8) (CD_mul x0 x1 x2 x3 x4 x5 x7 x8)))).
Theorem mul_HSNo_distrR : (forall x0 x1 x2, HSNo x0 -> HSNo x1 -> HSNo x2 -> mul_HSNo (add_HSNo x0 x1) x2 = add_HSNo (mul_HSNo x0 x2) (mul_HSNo x1 x2)).
admit.
Qed.
Axiom CD_minus_mul_distrR : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6, x1 x6 -> x3 (x2 x6) = x2 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 x6 (x2 x7) = x2 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 (x2 x6) x7 = x2 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_mul x0 x1 x2 x3 x4 x5 x6 (CD_minus x0 x1 x2 x7) = CD_minus x0 x1 x2 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7)))).
Theorem minus_mul_HSNo_distrR : (forall x0 x1, HSNo x0 -> HSNo x1 -> mul_HSNo x0 (minus_HSNo x1) = minus_HSNo (mul_HSNo x0 x1)).
admit.
Qed.
Axiom CD_minus_mul_distrL : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 x6 (x2 x7) = x2 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 (x2 x6) x7 = x2 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_mul x0 x1 x2 x3 x4 x5 (CD_minus x0 x1 x2 x6) x7 = CD_minus x0 x1 x2 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7)))).
Theorem minus_mul_HSNo_distrL : (forall x0 x1, HSNo x0 -> HSNo x1 -> mul_HSNo (minus_HSNo x0) x1 = minus_HSNo (mul_HSNo x0 x1)).
admit.
Qed.
Axiom CD_exp_nat_0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, forall x6, forall x7 : set -> set -> prop, x7 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 0) 1 -> x7 1 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 0))).
Theorem exp_HSNo_nat_0 : (forall x0, forall x1 : set -> set -> prop, x1 (exp_HSNo_nat x0 0) 1 -> x1 1 (exp_HSNo_nat x0 0)).
admit.
Qed.
Axiom CD_exp_nat_S : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, forall x6 x7, nat_p x7 -> CD_exp_nat x0 x1 x2 x3 x4 x5 x6 (ordsucc x7) = CD_mul x0 x1 x2 x3 x4 x5 x6 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 x7))).
Theorem exp_HSNo_nat_S : (forall x0 x1, nat_p x1 -> exp_HSNo_nat x0 (ordsucc x1) = mul_HSNo x0 (exp_HSNo_nat x0 x1)).
admit.
Qed.
Axiom CD_exp_nat_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> x2 0 = 0 -> x3 0 = 0 -> x3 1 = 1 -> (forall x6, x1 x6 -> x4 0 x6 = x6) -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_exp_nat x0 x1 x2 x3 x4 x5 x6 1 = x6))).
Theorem exp_HSNo_nat_1 : (forall x0, HSNo x0 -> exp_HSNo_nat x0 1 = x0).
admit.
Qed.
Axiom CD_exp_nat_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> x2 0 = 0 -> x3 0 = 0 -> x3 1 = 1 -> (forall x6, x1 x6 -> x4 0 x6 = x6) -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_exp_nat x0 x1 x2 x3 x4 x5 x6 2 = CD_mul x0 x1 x2 x3 x4 x5 x6 x6))).
Theorem exp_HSNo_nat_2 : (forall x0, HSNo x0 -> exp_HSNo_nat x0 2 = mul_HSNo x0 x0).
admit.
Qed.
Axiom CD_exp_nat_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> x1 0 -> x1 1 -> (forall x6, CD_carr x0 x1 x6 -> (forall x7, nat_p x7 -> CD_carr x0 x1 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 x7))))).
Theorem HSNo_exp_HSNo_nat : (forall x0, HSNo x0 -> (forall x1, nat_p x1 -> HSNo (exp_HSNo_nat x0 x1))).
admit.
Qed.
Theorem add_CSNo_com_3b_1_2 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo (add_CSNo x0 x1) x2 = add_CSNo (add_CSNo x0 x2) x1).
admit.
Qed.
Theorem add_CSNo_com_4_inner_mid : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> add_CSNo (add_CSNo x0 x1) (add_CSNo x2 x3) = add_CSNo (add_CSNo x0 x2) (add_CSNo x1 x3)).
admit.
Qed.
Theorem add_CSNo_rotate_4_0312 : (forall x0 x1 x2 x3, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo x3 -> add_CSNo (add_CSNo x0 x1) (add_CSNo x2 x3) = add_CSNo (add_CSNo x0 x3) (add_CSNo x1 x2)).
admit.
Qed.
Axiom Complex_i_sqr : mul_CSNo Complex_i Complex_i = minus_CSNo 1.
Theorem Quaternion_i_sqr : mul_HSNo Complex_i Complex_i = minus_HSNo 1.
admit.
Qed.
Theorem Quaternion_j_sqr : mul_HSNo Quaternion_j Quaternion_j = minus_HSNo 1.
admit.
Qed.
Axiom conj_CSNo_i : conj_CSNo Complex_i = minus_CSNo Complex_i.
Theorem Quaternion_k_sqr : mul_HSNo Quaternion_k Quaternion_k = minus_HSNo 1.
admit.
Qed.
Theorem Quaternion_i_j : mul_HSNo Complex_i Quaternion_j = Quaternion_k.
admit.
Qed.
Axiom SNo_0 : SNo 0.
Theorem Quaternion_j_k : mul_HSNo Quaternion_j Quaternion_k = Complex_i.
admit.
Qed.
Theorem Quaternion_k_i : mul_HSNo Quaternion_k Complex_i = Quaternion_j.
admit.
Qed.
Theorem Quaternion_j_i : mul_HSNo Quaternion_j Complex_i = minus_HSNo Quaternion_k.
admit.
Qed.
Axiom SNo_1 : SNo 1.
Theorem Quaternion_k_j : mul_HSNo Quaternion_k Quaternion_j = minus_HSNo Complex_i.
admit.
Qed.
Theorem Quaternion_i_k : mul_HSNo Complex_i Quaternion_k = minus_HSNo Quaternion_j.
admit.
Qed.
Theorem add_CSNo_rotate_3_1 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo x0 (add_CSNo x1 x2) = add_CSNo x2 (add_CSNo x0 x1)).
admit.
Qed.
Axiom mul_CSNo_com : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 x1 = mul_CSNo x1 x0).
Axiom mul_CSNo_assoc : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo (mul_CSNo x0 x1) x2).
Theorem mul_CSNo_rotate_3_1 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo x2 (mul_CSNo x0 x1)).
admit.
Qed.
Theorem conj_HSNo_i : conj_HSNo Complex_i = minus_HSNo Complex_i.
admit.
Qed.
Theorem conj_HSNo_j : conj_HSNo Quaternion_j = minus_HSNo Quaternion_j.
admit.
Qed.
Theorem conj_HSNo_k : conj_HSNo Quaternion_k = minus_HSNo Quaternion_k.
admit.
Qed.
