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
(* Parameter SNoLe "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" "ddf7d378c4df6fcdf73e416f8d4c08965e38e50abe1463a0312048d3dd7ac7e9" *)
Parameter SNoLe : set -> set -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter sqrt_SNo_nonneg "83d279e5aa419fbbd248d65c78365bc07f35773623616e9f2ff1cab03bb53e87" "71d15253c75b86e7fa4727323f2048ac8eeb6097cdf84c78a32c8477edd521d4" *)
Parameter sqrt_SNo_nonneg : set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Axiom SNoLev_ind : (forall x0 : set -> prop, (forall x1, SNo x1 -> (forall x2, x2 :e SNoS_ (SNoLev x1) -> x0 x2) -> x0 x1) -> (forall x1, SNo x1 -> x0 x1)).
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter SNo_sqrtaux "31cfe8bdf5bca31fe1fb3502f567a96e73b06cc4c16d250940c5552ab44bcc3e" "e233df2b059547d5f25a53cb536493018adade8d5c4cdd7e88857b49c4b5fbf8" *)
Parameter SNo_sqrtaux : set -> (set -> set) -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom sqrt_SNo_nonneg_eq : (forall x0, SNo x0 -> sqrt_SNo_nonneg x0 = SNoCut (famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 0)) (famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 1))).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Definition SNoCutP : set -> set -> prop :=
 (fun x0 x1 : set => and (and (forall x2, x2 :e x0 -> SNo x2) (forall x2, x2 :e x1 -> SNo x2)) (forall x2, x2 :e x0 -> (forall x3, x3 :e x1 -> SNoLt x2 x3))).
Axiom sqrt_SNo_nonneg_prop1b : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, nat_p x1 -> and (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt (mul_SNo x2 x2) x0)) (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt x0 (mul_SNo x2 x2)))) -> SNoCutP (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))).
Axiom sqrt_SNo_nonneg_prop1a : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLe 0 x1 -> and (and (SNo (sqrt_SNo_nonneg x1)) (SNoLe 0 (sqrt_SNo_nonneg x1))) (mul_SNo (sqrt_SNo_nonneg x1) (sqrt_SNo_nonneg x1) = x1)) -> (forall x1, nat_p x1 -> and (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt (mul_SNo x2 x2) x0)) (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt x0 (mul_SNo x2 x2))))).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom sqrt_SNo_nonneg_prop1c : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNoCutP (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)) -> (forall x1, x1 :e famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 1) -> (forall x2 : prop, (SNo x1 -> SNoLe 0 x1 -> SNoLt x0 (mul_SNo x1 x1) -> x2) -> x2)) -> SNoLe 0 (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)))).
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom sqrt_SNo_nonneg_prop1d : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLe 0 x1 -> and (and (SNo (sqrt_SNo_nonneg x1)) (SNoLe 0 (sqrt_SNo_nonneg x1))) (mul_SNo (sqrt_SNo_nonneg x1) (sqrt_SNo_nonneg x1) = x1)) -> SNoCutP (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)) -> SNoLe 0 (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))) -> SNoLt (mul_SNo (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))) (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)))) x0 -> False).
Axiom sqrt_SNo_nonneg_prop1e : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, x1 :e SNoS_ (SNoLev x0) -> SNoLe 0 x1 -> and (and (SNo (sqrt_SNo_nonneg x1)) (SNoLe 0 (sqrt_SNo_nonneg x1))) (mul_SNo (sqrt_SNo_nonneg x1) (sqrt_SNo_nonneg x1) = x1)) -> SNoCutP (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)) -> SNoLe 0 (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))) -> SNoLt x0 (mul_SNo (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))) (SNoCut (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1)))) -> False).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Theorem sqrt_SNo_nonneg_prop1 : (forall x0, SNo x0 -> SNoLe 0 x0 -> and (and (SNo (sqrt_SNo_nonneg x0)) (SNoLe 0 (sqrt_SNo_nonneg x0))) (mul_SNo (sqrt_SNo_nonneg x0) (sqrt_SNo_nonneg x0) = x0)).
admit.
Qed.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Theorem SNo_sqrtaux_0_1_prop : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, nat_p x1 -> and (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt (mul_SNo x2 x2) x0)) (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt x0 (mul_SNo x2 x2))))).
admit.
Qed.
Theorem SNo_sqrtaux_0_prop : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, nat_p x1 -> (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt (mul_SNo x2 x2) x0)))).
admit.
Qed.
Theorem SNo_sqrtaux_1_prop : (forall x0, SNo x0 -> SNoLe 0 x0 -> (forall x1, nat_p x1 -> (forall x2, x2 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1 -> and (and (SNo x2) (SNoLe 0 x2)) (SNoLt x0 (mul_SNo x2 x2))))).
admit.
Qed.
Theorem SNo_sqrt_SNo_SNoCutP : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNoCutP (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 0)) (famunion omega (fun x1 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x1) 1))).
admit.
Qed.
Theorem SNo_sqrt_SNo_nonneg : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNo (sqrt_SNo_nonneg x0)).
admit.
Qed.
Theorem sqrt_SNo_nonneg_nonneg : (forall x0, SNo x0 -> SNoLe 0 x0 -> SNoLe 0 (sqrt_SNo_nonneg x0)).
admit.
Qed.
Theorem sqrt_SNo_nonneg_sqr : (forall x0, SNo x0 -> SNoLe 0 x0 -> mul_SNo (sqrt_SNo_nonneg x0) (sqrt_SNo_nonneg x0) = x0).
admit.
Qed.
Axiom SNo_0 : SNo 0.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom SNoCut_0_0 : SNoCut 0 0 = 0.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
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
Axiom SNoL_nonneg_0 : SNoL_nonneg 0 = 0.
Axiom Repl_Empty : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (Repl 0 x0) 0 -> x1 0 (Repl 0 x0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom SNoR_0 : SNoR 0 = 0.
(* Parameter SNo_sqrtauxset "68b7df36646d2eda255314a2e43c4cdd64b4c655e5fb64be90d4363f70dd25dd" "211c641d3a706d9a991fc306cd3b4f60b97678881c6943c492699443fd2aa1de" *)
Parameter SNo_sqrtauxset : set -> set -> set -> set.
Axiom SNo_sqrtaux_S : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> SNo_sqrtaux x0 x1 (ordsucc x2) = lam 2 (fun x4 : set => If_i (x4 = 0) (binunion (ap (SNo_sqrtaux x0 x1 x2) 0) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)) (binunion (binunion (ap (SNo_sqrtaux x0 x1 x2) 1) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 0) (ap (SNo_sqrtaux x0 x1 x2) 0) x0)) (SNo_sqrtauxset (ap (SNo_sqrtaux x0 x1 x2) 1) (ap (SNo_sqrtaux x0 x1 x2) 1) x0)))).
Axiom SNo_sqrtauxset_0 : (forall x0 x1, forall x2 : set -> set -> prop, x2 (SNo_sqrtauxset 0 x0 x1) 0 -> x2 0 (SNo_sqrtauxset 0 x0 x1)).
Axiom binunion_idl : (forall x0, forall x1 : set -> set -> prop, x1 (binunion 0 x0) x0 -> x1 x0 (binunion 0 x0)).
Theorem sqrt_SNo_nonneg_0 : sqrt_SNo_nonneg 0 = 0.
admit.
Qed.
Axiom SNo_1 : SNo 1.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_0 : nat_p 0.
Axiom In_0_1 : 0 :e 1.
Axiom SNoL_1 : SNoL 1 = 1.
Axiom SNoR_1 : SNoR 1 = 0.
Axiom SNo_eta : (forall x0, SNo x0 -> x0 = SNoCut (SNoL x0) (SNoR x0)).
Axiom SNoL_nonneg_1 : SNoL_nonneg 1 = 1.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom SNo_sqrtauxset_0' : (forall x0 x1, forall x2 : set -> set -> prop, x2 (SNo_sqrtauxset x0 0 x1) 0 -> x2 0 (SNo_sqrtauxset x0 0 x1)).
Axiom binunion_idr : (forall x0, forall x1 : set -> set -> prop, x1 (binunion x0 0) x0 -> x1 x0 (binunion x0 0)).
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter div_SNo "27f4b5fe59b60da9c8b15247476d431fa3e527c47c22bad7c6d8cb3c2668e2e0" "a77cc83b548d1c105523434377d695400e899aad3044b9efb16632cbba12c5d6" *)
Parameter div_SNo : set -> set -> set.
Axiom SNo_sqrtauxset_E : (forall x0 x1 x2 x3, x3 :e SNo_sqrtauxset x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> (forall x6, x6 :e x1 -> SNoLt 0 (add_SNo x5 x6) -> x3 = div_SNo (add_SNo x2 (mul_SNo x5 x6)) (add_SNo x5 x6) -> x4)) -> x4)).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Theorem sqrt_SNo_nonneg_1 : sqrt_SNo_nonneg 1 = 1.
admit.
Qed.
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SNoL_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x1 :e SNoL x0)).
Axiom SNoLev_0 : SNoLev 0 = 0.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom SNoLeE : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLe x0 x1 -> or (SNoLt x0 x1) (x0 = x1)).
Axiom SNoLe_ref : (forall x0, SNoLe x0 x0).
Theorem sqrt_SNo_nonneg_0inL0 : (forall x0, SNo x0 -> SNoLe 0 x0 -> 0 :e SNoLev x0 -> 0 :e ap (SNo_sqrtaux x0 sqrt_SNo_nonneg 0) 0).
admit.
Qed.
Theorem sqrt_SNo_nonneg_Lnonempty : (forall x0, SNo x0 -> SNoLe 0 x0 -> 0 :e SNoLev x0 -> famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 0) = 0 -> (forall x1 : prop, x1)).
admit.
Qed.
Axiom SNoR_I : (forall x0, SNo x0 -> (forall x1, SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x1 :e SNoR x0)).
Axiom ordinal_SNoLev : (forall x0, ordinal x0 -> SNoLev x0 = x0).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_1 : nat_p 1.
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SNo_sqrtauxset_I : (forall x0 x1 x2 x3, x3 :e x0 -> (forall x4, x4 :e x1 -> SNoLt 0 (add_SNo x3 x4) -> div_SNo (add_SNo x2 (mul_SNo x3 x4)) (add_SNo x3 x4) :e SNo_sqrtauxset x0 x1 x2)).
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom SNoLt_0_1 : SNoLt 0 1.
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom ordinal_TransSet : (forall x0, ordinal x0 -> TransSet x0).
Theorem sqrt_SNo_nonneg_Rnonempty : (forall x0, SNo x0 -> SNoLe 0 x0 -> 1 :e SNoLev x0 -> famunion omega (fun x2 : set => ap (SNo_sqrtaux x0 sqrt_SNo_nonneg x2) 1) = 0 -> (forall x1 : prop, x1)).
admit.
Qed.
