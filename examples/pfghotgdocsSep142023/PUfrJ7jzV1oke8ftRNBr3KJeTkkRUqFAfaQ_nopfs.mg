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
(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom int_SNo_cases : (forall x0 : set -> prop, (forall x1, x1 :e omega -> x0 x1) -> (forall x1, x1 :e omega -> x0 (minus_SNo x1)) -> (forall x1, x1 :e int -> x0 x1)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_inv_impred : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Theorem int_3_cases : (forall x0, x0 :e int -> (forall x1 : prop, (forall x2, x2 :e omega -> x0 = minus_SNo (ordsucc x2) -> x1) -> (x0 = 0 -> x1) -> (forall x2, x2 :e omega -> x0 = ordsucc x2 -> x1) -> x1)).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter recip_SNo_pos "88ed11f2dead5b0e5f3c28c04f2c1d5ed89566ba1ab8122ea402434686300b1d" "88641a4cbed44079b02973dc08db05881974114238c1bedb4afc7abc752722a4" *)
Parameter recip_SNo_pos : set -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter SNo_recipaux "50206d8bf968870ba6e40f410263f57c7e932249403e412af22a5842cdcd0a3b" "8cdbea31ba7f300b7b64e1fdc6f995f00082140d74cb44f43504c4085fa3b3d5" *)
Parameter SNo_recipaux : set -> (set -> set) -> set -> set.
(* Parameter SNoS_ "7df1da8a4be89c3e696aebe0cabd8b8f51f0c9e350e3396209ee4a31203ddcab" "d5069aa583583f8fbe5d4de1ba560cc89ea048cae55ea56270ec3dea15e52ca0" *)
Parameter SNoS_ : set -> set.
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Axiom SNoLev_ind : (forall x0 : set -> prop, (forall x1, SNo x1 -> (forall x2, x2 :e SNoS_ (SNoLev x1) -> x0 x2) -> x0 x1) -> (forall x1, SNo x1 -> x0 x1)).
(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Parameter abs_SNo : set -> set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter eps_ "1334e1f799a3bc4df3f30aff55240fb64bdadbf61b47f37dcd8b8efae8f50607" "5e992a3fe0c82d03dd3d5c5fbd76ae4e09c16d4ce8a8f2bbff757c1617d1cb0b" *)
Parameter eps_ : set -> set.
Axiom real_E : (forall x0, x0 :e real -> (forall x1 : prop, (SNo x0 -> SNoLev x0 :e ordsucc omega -> x0 :e SNoS_ (ordsucc omega) -> SNoLt (minus_SNo omega) x0 -> SNoLt x0 omega -> (forall x2, x2 :e SNoS_ omega -> (forall x3, x3 :e omega -> SNoLt (abs_SNo (add_SNo x2 (minus_SNo x0))) (eps_ x3)) -> x2 = x0) -> (forall x2, x2 :e omega -> (forall x3 : prop, (forall x4, and (x4 :e SNoS_ omega) (and (SNoLt x4 x0) (SNoLt x0 (add_SNo x4 (eps_ x2)))) -> x3) -> x3)) -> x1) -> x1)).
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
(* Parameter SNoCutP "b102ccc5bf572aba76b2c5ff3851795ba59cb16151277dbee9ce5a1aad694334" "c083d829a4633f1bc9aeab80859255a8d126d7c6824bf5fd520d6daabfbbe976" *)
Parameter SNoCutP : set -> set -> prop.
(* Parameter SNoCut "0e3071dce24dfee0112b8d48d9e9fc53f835e6a5b50de4c25d1dfd053ad33bf1" "ec849efeaf83b2fcdbc828ebb9af38820604ea420adf2ef07bb54a73d0fcb75b" *)
Parameter SNoCut : set -> set -> set.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter SNoEq_ "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" "5f11e279df04942220c983366e2a199b437dc705dac74495e76bc3123778dd86" *)
Parameter SNoEq_ : set -> set -> set -> prop.
Axiom SNoCutP_SNoCut_impred : (forall x0 x1, SNoCutP x0 x1 -> (forall x2 : prop, (SNo (SNoCut x0 x1) -> SNoLev (SNoCut x0 x1) :e ordsucc (binunion (famunion x0 (fun x3 : set => ordsucc (SNoLev x3))) (famunion x1 (fun x3 : set => ordsucc (SNoLev x3)))) -> (forall x3, x3 :e x0 -> SNoLt x3 (SNoCut x0 x1)) -> (forall x3, x3 :e x1 -> SNoLt (SNoCut x0 x1) x3) -> (forall x3, SNo x3 -> (forall x4, x4 :e x0 -> SNoLt x4 x3) -> (forall x4, x4 :e x1 -> SNoLt x3 x4) -> and (SNoLev (SNoCut x0 x1) c= SNoLev x3) (SNoEq_ (SNoLev (SNoCut x0 x1)) (SNoCut x0 x1) x3)) -> x2) -> x2)).
Axiom SNo_recipaux_lem2 : (forall x0, SNo x0 -> SNoLt 0 x0 -> (forall x1 : set -> set, (forall x2, x2 :e SNoS_ (SNoLev x0) -> SNoLt 0 x2 -> and (SNo (x1 x2)) (mul_SNo x2 (x1 x2) = 1)) -> SNoCutP (famunion omega (fun x2 : set => ap (SNo_recipaux x0 x1 x2) 0)) (famunion omega (fun x2 : set => ap (SNo_recipaux x0 x1 x2) 1)))).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Axiom recip_SNo_pos_eps_ : (forall x0, nat_p x0 -> recip_SNo_pos (eps_ x0) = exp_SNo_nat 2 x0).
Axiom SNoS_omega_real : SNoS_ omega c= real.
Axiom omega_SNoS_omega : omega c= SNoS_ omega.
Axiom nat_exp_SNo_nat : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_SNo_nat x0 x1))).
Axiom nat_2 : nat_p 2.
Axiom recip_SNo_pos_2 : recip_SNo_pos 2 = eps_ 1.
Axiom SNo_eps_SNoS_omega : (forall x0, x0 :e omega -> eps_ x0 :e SNoS_ omega).
Axiom nat_1 : nat_p 1.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter SNoL "08c87b1a5ce6404b103275d893aba544e498d2abfb545b46ce0e00ad2bb85cd5" "8cd812b65c6c466abea8433d21a39d35b8d8427ee973f9bb93567a1402705384" *)
Parameter SNoL : set -> set.
Definition SNoL_pos : set -> set :=
 (fun x0 : set => Sep (SNoL x0) (SNoLt 0)).
Axiom pos_real_left_approx_double : (forall x0, x0 :e real -> SNoLt 0 x0 -> (x0 = 2 -> (forall x1 : prop, x1)) -> (forall x1, x1 :e omega -> x0 = eps_ x1 -> (forall x2 : prop, x2)) -> (forall x1 : prop, (forall x2, and (x2 :e SNoL_pos x0) (SNoLt x0 (mul_SNo 2 x2)) -> x1) -> x1)).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SNoL_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoL x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x1 x0 -> x2) -> x2))).
(* Parameter recip_SNo "eb3c2afcb0fc017514672f7e4bb05a93fb8aa03fbeac55c207f299b0a6c23b32" "aa96a290f83ded9b33662ccb13b56cc27eb5c09a09b36ee3890691b04cc8386c" *)
Parameter recip_SNo : set -> set.
Definition div_SNo : set -> set -> set :=
 (fun x0 x1 : set => mul_SNo x0 (recip_SNo x1)).
Axiom recip_SNo_pos_eq : (forall x0, SNo x0 -> recip_SNo_pos x0 = SNoCut (famunion omega (fun x2 : set => ap (SNo_recipaux x0 recip_SNo_pos x2) 0)) (famunion omega (fun x2 : set => ap (SNo_recipaux x0 recip_SNo_pos x2) 1))).
Axiom real_SNoCut : (forall x0, x0 c= real -> (forall x1, x1 c= real -> SNoCutP x0 x1 -> (x0 = 0 -> (forall x2 : prop, x2)) -> (x1 = 0 -> (forall x2 : prop, x2)) -> (forall x2, x2 :e x0 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (SNoLt x2 x4) -> x3) -> x3)) -> (forall x2, x2 :e x1 -> (forall x3 : prop, (forall x4, and (x4 :e x1) (SNoLt x4 x2) -> x3) -> x3)) -> SNoCut x0 x1 :e real)).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom nat_0 : nat_p 0.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom SNo_recipaux_0 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (SNo_recipaux x0 x1 0) (lam 2 (fun x3 : set => If_i (x3 = 0) (Sing 0) 0)) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) (Sing 0) 0)) (SNo_recipaux x0 x1 0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom div_SNo_pos_LtR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt (mul_SNo x2 x1) x0 -> SNoLt x2 (div_SNo x0 x1)).
Axiom SNo_add_SNo_4 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo (add_SNo x0 (add_SNo x1 (add_SNo x2 x3)))).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom add_SNo_Lt2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x1 x2 -> SNoLt (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom SNo_0 : SNo 0.
Axiom SNo_add_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (add_SNo x0 (add_SNo x1 x2))).
Axiom add_SNo_minus_Lt2b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x3 x2) (add_SNo x0 x1) -> SNoLt x3 (add_SNo x0 (add_SNo x1 (minus_SNo x2)))).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Axiom mul_SNo_Lt : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt x2 x0 -> SNoLt x3 x1 -> SNoLt (add_SNo (mul_SNo x2 x1) (mul_SNo x0 x3)) (add_SNo (mul_SNo x0 x1) (mul_SNo x2 x3))).
Axiom SNo_1 : SNo 1.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom div_SNo_pos_LtR' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt x2 (div_SNo x0 x1) -> SNoLt (mul_SNo x2 x1) x0).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom SNo_recip_SNo : (forall x0, SNo x0 -> SNo (recip_SNo x0)).
Axiom recip_SNo_poscase : (forall x0, SNoLt 0 x0 -> recip_SNo x0 = recip_SNo_pos x0).
Axiom real_SNo : (forall x0, x0 :e real -> SNo x0).
Axiom div_SNo_pos_LtL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt x0 (mul_SNo x2 x1) -> SNoLt (div_SNo x0 x1) x2).
Axiom add_SNo_minus_Lt1b3 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNoLt (add_SNo x0 x1) (add_SNo x3 x2) -> SNoLt (add_SNo x0 (add_SNo x1 (minus_SNo x2))) x3).
Axiom div_SNo_pos_LtL' : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt 0 x1 -> SNoLt (div_SNo x0 x1) x2 -> SNoLt x0 (mul_SNo x2 x1)).
Axiom mul_div_SNo_nonzero_eq : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> (x1 = 0 -> (forall x3 : prop, x3)) -> x0 = mul_SNo x1 x2 -> div_SNo x0 x1 = x2).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom add_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo x1 (add_SNo x0 x2)).
Axiom add_SNo_1_1_2 : add_SNo 1 1 = 2.
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Axiom minus_add_SNo_distr_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> minus_SNo (add_SNo x0 (add_SNo x1 x2)) = add_SNo (minus_SNo x0) (add_SNo (minus_SNo x1) (minus_SNo x2))).
Axiom mul_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo x1 (mul_SNo x0 x2)).
Axiom add_SNo_assoc_4 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo x0 (add_SNo x1 (add_SNo x2 x3)) = add_SNo (add_SNo x0 (add_SNo x1 x2)) x3).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom mul_SNo_minus_minus : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) (minus_SNo x1) = mul_SNo x0 x1).
Axiom recip_SNo_pos_invR : (forall x0, SNo x0 -> SNoLt 0 x0 -> mul_SNo x0 (recip_SNo_pos x0) = 1).
Axiom SNo_2 : SNo 2.
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt 0 x0 -> SNoLt 0 x1 -> SNoLt 0 (mul_SNo x0 x1)).
Axiom famunionE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 :e x1 x4 -> x3) -> x3)).
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
(* Parameter SNo_recipauxset "a28ab2600cf271dad5d12bf60b3830be9e01661b89c5d2c6ed686565245fe8d8" "f6355f7c2b5890f51931103d82c0953090a191b4f5d52616f5fb346ccef11b4a" *)
Parameter SNo_recipauxset : set -> set -> set -> (set -> set) -> set.
(* Parameter SNoR "df0c7f1a5ed1eb8adafd81d6ecc1616d8afbec6fb8f400245c819ce49365279f" "73b2b912e42098857a1a0d2fc878581a3c1dcc1ca3769935edb92613cf441876" *)
Parameter SNoR : set -> set.
Axiom SNo_recipaux_S : (forall x0, forall x1 : set -> set, forall x2, nat_p x2 -> SNo_recipaux x0 x1 (ordsucc x2) = lam 2 (fun x4 : set => If_i (x4 = 0) (binunion (binunion (ap (SNo_recipaux x0 x1 x2) 0) (SNo_recipauxset (ap (SNo_recipaux x0 x1 x2) 0) x0 (SNoR x0) x1)) (SNo_recipauxset (ap (SNo_recipaux x0 x1 x2) 1) x0 (SNoL_pos x0) x1)) (binunion (binunion (ap (SNo_recipaux x0 x1 x2) 1) (SNo_recipauxset (ap (SNo_recipaux x0 x1 x2) 0) x0 (SNoL_pos x0) x1)) (SNo_recipauxset (ap (SNo_recipaux x0 x1 x2) 1) x0 (SNoR x0) x1)))).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SNo_recipauxset_I : (forall x0 x1 x2, forall x3 : set -> set, forall x4, x4 :e x0 -> (forall x5, x5 :e x2 -> mul_SNo (add_SNo 1 (mul_SNo (add_SNo x5 (minus_SNo x1)) x4)) (x3 x5) :e SNo_recipauxset x0 x1 x2 x3)).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom SNo_recip_SNo_pos : (forall x0, SNo x0 -> SNoLt 0 x0 -> SNo (recip_SNo_pos x0)).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
(* Parameter SNo_ "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" "4ab7e4afd8b51df80f04ef3dd42ae08c530697f7926635e26c92eb55ae427224" *)
Parameter SNo_ : set -> set -> prop.
Axiom SNoS_E2 : (forall x0, ordinal x0 -> (forall x1, x1 :e SNoS_ x0 -> (forall x2 : prop, (SNoLev x1 :e x0 -> ordinal (SNoLev x1) -> SNo x1 -> SNo_ (SNoLev x1) x1 -> x2) -> x2))).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom recip_SNo_pos_prop1 : (forall x0, SNo x0 -> SNoLt 0 x0 -> and (SNo (recip_SNo_pos x0)) (mul_SNo x0 (recip_SNo_pos x0) = 1)).
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom real_0 : 0 :e real.
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom binunionE' : (forall x0 x1 x2, forall x3 : prop, (x2 :e x0 -> x3) -> (x2 :e x1 -> x3) -> x2 :e binunion x0 x1 -> x3).
Axiom SNo_recipauxset_E : (forall x0 x1 x2, forall x3 : set -> set, forall x4, x4 :e SNo_recipauxset x0 x1 x2 x3 -> (forall x5 : prop, (forall x6, x6 :e x0 -> (forall x7, x7 :e x2 -> x4 = mul_SNo (add_SNo 1 (mul_SNo (add_SNo x7 (minus_SNo x1)) x6)) (x3 x7) -> x5)) -> x5)).
Axiom SNoR_E : (forall x0, SNo x0 -> (forall x1, x1 :e SNoR x0 -> (forall x2 : prop, (SNo x1 -> SNoLev x1 :e SNoLev x0 -> SNoLt x0 x1 -> x2) -> x2))).
Axiom SNoS_I2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLev x0 :e SNoLev x1 -> x0 :e SNoS_ (SNoLev x1)).
Axiom SNoLt_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLt x1 x2 -> SNoLt x0 x2).
Axiom real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
Axiom real_add_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_SNo x0 x1 :e real)).
Axiom real_1 : 1 :e real.
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Axiom SNoS_I : (forall x0, ordinal x0 -> (forall x1 x2, x2 :e x0 -> SNo_ x2 x1 -> x1 :e SNoS_ x0)).
Axiom omega_ordinal : ordinal omega.
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Theorem real_recip_SNo_lem1 : (forall x0, SNo x0 -> x0 :e real -> SNoLt 0 x0 -> and (recip_SNo_pos x0 :e real) (forall x1, nat_p x1 -> and (ap (SNo_recipaux x0 recip_SNo_pos x1) 0 c= real) (ap (SNo_recipaux x0 recip_SNo_pos x1) 1 c= real))).
admit.
Qed.
Theorem real_recip_SNo_pos : (forall x0, x0 :e real -> SNoLt 0 x0 -> recip_SNo_pos x0 :e real).
admit.
Qed.
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom recip_SNo_negcase : (forall x0, SNo x0 -> SNoLt x0 0 -> recip_SNo x0 = minus_SNo (recip_SNo_pos (minus_SNo x0))).
Axiom minus_SNo_Lt_contra2 : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 (minus_SNo x1) -> SNoLt x1 (minus_SNo x0)).
Axiom recip_SNo_0 : recip_SNo 0 = 0.
Theorem real_recip_SNo : (forall x0, x0 :e real -> recip_SNo x0 :e real).
admit.
Qed.
Theorem real_div_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> div_SNo x0 x1 :e real)).
admit.
Qed.
