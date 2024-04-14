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
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter PNoLt "2336eb45d48549dd8a6a128edc17a8761fd9043c180691483bcf16e1acc9f00a" "8f57a05ce4764eff8bc94b278352b6755f1a46566cd7220a5488a4a595a47189" *)
Parameter PNoLt : set -> (set -> prop) -> set -> (set -> prop) -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter PNoEq_ "ac96e86902ef72d5c44622f4a1ba3aaf673377d32cc26993c04167cc9f22067f" "d7d95919a06c44c69c724884cd5a474ea8f909ef85aae19ffe4a0ce816fa65fd" *)
Parameter PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop.
Definition PNoLe : set -> (set -> prop) -> set -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set => fun x3 : set -> prop => or (PNoLt x0 x1 x2 x3) (and (x0 = x2) (PNoEq_ x0 x1 x3))).
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Definition SNoLe : set -> set -> prop :=
 (fun x0 x1 : set => PNoLe (SNoLev x0) (fun x2 : set => x2 :e x0) (SNoLev x1) (fun x2 : set => x2 :e x1)).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter SNo_sqrtaux "31cfe8bdf5bca31fe1fb3502f567a96e73b06cc4c16d250940c5552ab44bcc3e" "e233df2b059547d5f25a53cb536493018adade8d5c4cdd7e88857b49c4b5fbf8" *)
Parameter SNo_sqrtaux : set -> (set -> set) -> set -> set.
(* Parameter sqrt_SNo_nonneg "83d279e5aa419fbbd248d65c78365bc07f35773623616e9f2ff1cab03bb53e87" "71d15253c75b86e7fa4727323f2048ac8eeb6097cdf84c78a32c8477edd521d4" *)
Parameter sqrt_SNo_nonneg : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
Axiom SNoCut_0_0 : SNoCut 0 0 = 0.
Axiom SNoCut_Le : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4, x4 :e x0 -> SNoLt x4 (SNoCut x2 x3)) -> (forall x4, x4 :e x3 -> SNoLt (SNoCut x0 x1) x4) -> SNoLe (SNoCut x0 x1) (SNoCut x2 x3)).
Axiom SNoCutP_0_0 : SNoCutP 0 0.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom SNo_0 : SNo 0.
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Theorem sqrt_SNo_nonneg_prop1c : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNoCutP (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)) -> (forall x1, x1 :e famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 1) -> (forall x2 : prop, (SNo x1 -> SNoLe 0 x1 -> SNoLt x0 (mul_SNo x1 x1) -> x2) -> x2)) -> SNoLe 0 (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)))).
admit.
Qed.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom SNoLtE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 x1 -> (forall x2 : prop, (forall x3, SNo x3 -> SNoLev x3 :e binintersect (SNoLev x0) (SNoLev x1) -> SNoEq_ (SNoLev x3) x3 x0 -> SNoEq_ (SNoLev x3) x3 x1 -> SNoLt x0 x3 -> SNoLt x3 x1 -> nIn (SNoLev x3) x0 -> SNoLev x3 :e x1 -> x2) -> (SNoLev x0 :e SNoLev x1 -> SNoEq_ (SNoLev x0) x0 x1 -> SNoLev x0 :e x1 -> x2) -> (SNoLev x1 :e SNoLev x0 -> SNoEq_ (SNoLev x1) x0 x1 -> nIn (SNoLev x1) x0 -> x2) -> x2)).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
Axiom binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
Axiom nonneg_mul_SNo_Le2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe x0 x2 -> SNoLe x1 x3 -> SNoLe (mul_SNo x0 x1) (mul_SNo x2 x3)).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_0 : nat_p 0.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
Definition SNoL_nonneg : set -> set :=
 (fun x0 : set => Sep (SNoL x0) (SNoLe 0)).
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom SNo_sqrtaux_0 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (SNo_sqrtaux x0 x1 0) (lam 2 (fun x3 : set => If_i (x3 = 0) (Repl (SNoL_nonneg x0) x1) (Repl (SNoR x0) x1))) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) (Repl (SNoL_nonneg x0) x1) (Repl (SNoR x0) x1))) (SNo_sqrtaux x0 x1 0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom SNoLeLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom SNo_nonneg_sqr_uniq : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe 0 x1 -> mul_SNo x0 x0 = mul_SNo x1 x1 -> x0 = x1).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Axiom mul_SNo_SNoCut_SNoR_interpolate_impred : (forall x0 x1 x2 x3, SNoCutP x0 x1 -> SNoCutP x2 x3 -> (forall x4 x5, x4 = SNoCut x0 x1 -> x5 = SNoCut x2 x3 -> (forall x6, x6 :e SNoR (mul_SNo x4 x5) -> (forall x7 : prop, (forall x8, x8 :e x0 -> (forall x9, x9 :e x3 -> SNoLe (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x9)) (add_SNo x6 (mul_SNo x8 x9)) -> x7)) -> (forall x8, x8 :e x1 -> (forall x9, x9 :e x2 -> SNoLe (add_SNo (mul_SNo x8 x5) (mul_SNo x4 x9)) (add_SNo x6 (mul_SNo x8 x9)) -> x7)) -> x7)))).
Axiom SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom sqrt_SNo_nonneg_prop1a : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLe 0 x1 -> and (and (SNo (sqrt_SNo_nonneg x1)) (SNoLe 0 (sqrt_SNo_nonneg x1))) (mul_SNo (sqrt_SNo_nonneg x1) (sqrt_SNo_nonneg x1) = x1)) -> (forall x1, nat_p x1 -> and (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt (mul_SNo x2 x2) x0)) (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt x0 (mul_SNo x2 x2))))).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom famunionE : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 :e x1 x4) -> x3) -> x3)).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_linear : (forall x0 x1, ordinal x0 -> ordinal x1 -> or (x0 c= x1) (x1 c= x0)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom SNo_sqrtaux_mon : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> (forall x3, nat_p x3 -> x2 c= x3 -> and (ap (SNo_sqrtaux x0 x1 x2) 0 c= ap (SNo_sqrtaux x0 x1 x3) 0) (ap (SNo_sqrtaux x0 x1 x2) 1 c= ap (SNo_sqrtaux x0 x1 x3) 1))).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
(* Parameter div_SNo "27f4b5fe59b60da9c8b15247476d431fa3e527c47c22bad7c6d8cb3c2668e2e0" "a77cc83b548d1c105523434377d695400e899aad3044b9efb16632cbba12c5d6" *)
Parameter div_SNo : set -> set -> set.
Axiom mul_div_SNo_invL : (forall x0 x1, SNo x0 -> SNo x1 -> (x1 = 0 -> (forall x2 : prop, x2)) -> mul_SNo (div_SNo x0 x1) x1 = x0).
Axiom pos_mul_SNo_Lt' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x2 -> SNoLt x0 x1 -> SNoLt (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom SNo_div_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (div_SNo x0 x1)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
(* Parameter SNo_sqrtauxset "68b7df36646d2eda255314a2e43c4cdd64b4c655e5fb64be90d4363f70dd25dd" "211c641d3a706d9a991fc306cd3b4f60b97678881c6943c492699443fd2aa1de" *)
Parameter SNo_sqrtauxset : set -> set -> set -> set.
Axiom SNo_sqrtaux_S : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> SNo_sqrtaux x0 x1 (ordsucc x2) = lam 2 (fun x4 : set => If_i (x4 = 0) (binunion (ap (SNo_sqrtaux x0 x1 x2) 0) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)) (binunion (binunion (ap (SNo_sqrtaux x0 x1 x2) 1) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 0) x0)) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 1) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)))).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SNo_sqrtauxset_I : (forall x0 x1 x2 x3, x3 :e x0 -> (forall x4, x4 :e x1 -> SNoLt 0 (add_SNo x3 x4) -> div_SNo (add_SNo x2 (mul_SNo x3 x4)) (add_SNo x3 x4) :e SNo_sqrtauxset x0 x1 x2)).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom mul_SNo_nonneg_nonneg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe 0 x0 -> SNoLe 0 x1 -> SNoLe 0 (mul_SNo x0 x1)).
Theorem sqrt_SNo_nonneg_prop1d : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLe 0 x1 -> and (and (SNo (sqrt_SNo_nonneg x1)) (SNoLe 0 (sqrt_SNo_nonneg x1))) (mul_SNo (sqrt_SNo_nonneg x1) (sqrt_SNo_nonneg x1) = x1)) -> SNoCutP (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)) -> SNoLe 0 (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))) -> SNoLt (mul_SNo (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))) (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)))) x0 -> False).
admit.
Qed.
