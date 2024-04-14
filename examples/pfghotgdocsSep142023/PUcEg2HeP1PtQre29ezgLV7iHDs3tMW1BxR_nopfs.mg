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
(* Parameter complex "56777e38d2e61f4aca06e46182df4c21e138c0590748bbfd66ae8cc7a67be5d6" "c599eedebd96cbafc70f07b3b25e3b11bb302cfb3f90733acf663afbb7ac8d9a" *)
Parameter complex : set.
(* Parameter pair_tag "48390061c2181aba77cfa1d5de61c61404ac9ae0a65b3484b17cdb949b4f84ea" "abc4d9a02036ca6bb03da383ad06177224b45cf7aa024b008a587b0088f0cb63" *)
Parameter pair_tag : set -> set -> set -> set.
(* Parameter CD_proj0 "0f0c33ee510e1a6616dae9740b87813905ab9c81cd7bba0430bb93ed78b7f32e" "e6d3c908403e809d0499044c6327107f48e159032f5d408db7c9a005219d76c5" *)
Parameter CD_proj0 : set -> (set -> prop) -> set -> set.
(* Parameter CD_proj1 "0e60a25c698581d33ab462b7d2f97fb3428f8ae674a065695d8fe89cdf0f35a2" "934eedf1ea050179b5169b28a60315fede0e4412cfff04a00c8c4a41e918fb4a" *)
Parameter CD_proj1 : set -> (set -> prop) -> set -> set.
Definition CD_conj : set -> (set -> prop) -> (set -> set) -> (set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 x3 : set -> set => fun x4 : set => pair_tag x0 (x3 (CD_proj0 x0 x1 x4)) (x2 (CD_proj1 x0 x1 x4))).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition conj_CSNo : set -> set :=
 CD_conj (Sing 2) SNo minus_SNo (fun x0 : set => x0).
Definition CSNo_Im : set -> set :=
 CD_proj1 (Sing 2) SNo.
Definition CSNo_Re : set -> set :=
 CD_proj0 (Sing 2) SNo.
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
Definition SNo_pair : set -> set -> set :=
 pair_tag (Sing 2).
Axiom complex_I : (forall x0, x0 :e real -> (forall x1, x1 :e real -> SNo_pair x0 x1 :e complex)).
Axiom complex_Re_real : (forall x0, x0 :e complex -> CSNo_Re x0 :e real).
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Axiom complex_Im_real : (forall x0, x0 :e complex -> CSNo_Im x0 :e real).
Theorem complex_conj_CSNo : (forall x0, x0 :e complex -> conj_CSNo x0 :e complex).
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
Definition CSNo_pair : set -> set -> set :=
 pair_tag (Sing 3).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition quaternion : set :=
 {CSNo_pair (ap x0 0) (ap x0 1) | x0 :e setprod complex complex}.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Theorem quaternion_I : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> CSNo_pair x0 x1 :e quaternion)).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem quaternion_E : (forall x0, x0 :e quaternion -> (forall x1 : prop, (forall x2, x2 :e complex -> (forall x3, x3 :e complex -> x0 = CSNo_pair x2 x3 -> x1)) -> x1)).
admit.
Qed.
(* Parameter HSNo "1c628f7af39a04e6bfe8d8c0d795c1631fdd70d0438d3e5060c6375b4c1ac72e" "1e7352259c54690fd5b8c99e1d05b70933b3c6ee6dddfc492998c305f0aec7f2" *)
Parameter HSNo : set -> prop.
(* Parameter CSNo "b678d9e153d06cf44cf447be611c0e745893b20351d0f79af5de8da0d58ac866" "4235a7ec116097b786860fa05ca09197cbbcea5e520801a717b25d8a21008ee1" *)
Parameter CSNo : set -> prop.
Axiom HSNo_I : (forall x0 x1, CSNo x0 -> CSNo x1 -> HSNo (CSNo_pair x0 x1)).
Axiom complex_CSNo : (forall x0, x0 :e complex -> CSNo x0).
Theorem quaternion_HSNo : (forall x0, x0 :e quaternion -> HSNo x0).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom CSNo_pair_0 : (forall x0, forall x1 : set -> set -> prop, x1 (CSNo_pair x0 0) x0 -> x1 x0 (CSNo_pair x0 0)).
Axiom complex_0 : 0 :e complex.
Theorem complex_quaternion : complex c= quaternion.
admit.
Qed.
Theorem quaternion_0 : 0 :e quaternion.
admit.
Qed.
Axiom complex_1 : 1 :e complex.
Theorem quaternion_1 : 1 :e quaternion.
admit.
Qed.
(* Parameter Complex_i "b46d1faaae35e838de0e9479314a37044791cb438ba6f794b98027b5ec829dbe" "ace1d58e185110764e46cbc1f7da7b426c20caebe3e3b0030d5dade0868711a1" *)
Parameter Complex_i : set.
Axiom complex_i : Complex_i :e complex.
Theorem quaternion_i : Complex_i :e quaternion.
admit.
Qed.
Definition Quaternion_j : set :=
 CSNo_pair 0 1.
Theorem quaternion_j : Quaternion_j :e quaternion.
admit.
Qed.
Definition Quaternion_k : set :=
 CSNo_pair 0 Complex_i.
Theorem quaternion_k : Quaternion_k :e quaternion.
admit.
Qed.
Definition HSNo_proj0 : set -> set :=
 CD_proj0 (Sing 3) CSNo.
Axiom HSNo_proj0_2 : (forall x0 x1, CSNo x0 -> CSNo x1 -> HSNo_proj0 (CSNo_pair x0 x1) = x0).
Theorem quaternion_p0_eq : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> HSNo_proj0 (CSNo_pair x0 x1) = x0)).
admit.
Qed.
Definition HSNo_proj1 : set -> set :=
 CD_proj1 (Sing 3) CSNo.
Axiom HSNo_proj1_2 : (forall x0 x1, CSNo x0 -> CSNo x1 -> HSNo_proj1 (CSNo_pair x0 x1) = x1).
Theorem quaternion_p1_eq : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> HSNo_proj1 (CSNo_pair x0 x1) = x1)).
admit.
Qed.
Theorem quaternion_p0_complex : (forall x0, x0 :e quaternion -> HSNo_proj0 x0 :e complex).
admit.
Qed.
Theorem quaternion_p1_complex : (forall x0, x0 :e quaternion -> HSNo_proj1 x0 :e complex).
admit.
Qed.
Axiom HSNo_proj0proj1_split : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo_proj0 x0 = HSNo_proj0 x1 -> HSNo_proj1 x0 = HSNo_proj1 x1 -> x0 = x1).
Theorem quaternion_proj0proj1_split : (forall x0, x0 :e quaternion -> (forall x1, x1 :e quaternion -> HSNo_proj0 x0 = HSNo_proj0 x1 -> HSNo_proj1 x0 = HSNo_proj1 x1 -> x0 = x1)).
admit.
Qed.
Definition CD_minus : set -> (set -> prop) -> (set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set -> set => fun x3 : set => pair_tag x0 (x2 (CD_proj0 x0 x1 x3)) (x2 (CD_proj1 x0 x1 x3))).
(* Parameter minus_CSNo "4f92a9e0271ddb1267597c692d8047b29044e7c0c576fb35221fc05e8cc2e169" "84edf6250efa183daa5d97710793416c455289f25e5c4ff24b9316496cb3edcc" *)
Parameter minus_CSNo : set -> set.
Definition minus_HSNo : set -> set :=
 CD_minus (Sing 3) CSNo minus_CSNo.
Axiom complex_minus_CSNo : (forall x0, x0 :e complex -> minus_CSNo x0 :e complex).
Theorem quaternion_minus_HSNo : (forall x0, x0 :e quaternion -> minus_HSNo x0 :e quaternion).
admit.
Qed.
Definition conj_HSNo : set -> set :=
 CD_conj (Sing 3) CSNo minus_CSNo conj_CSNo.
Theorem quaternion_conj_HSNo : (forall x0, x0 :e quaternion -> conj_HSNo x0 :e quaternion).
admit.
Qed.
Definition CD_add : set -> (set -> prop) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 : set -> set -> set => fun x3 x4 : set => pair_tag x0 (x2 (CD_proj0 x0 x1 x3) (CD_proj0 x0 x1 x4)) (x2 (CD_proj1 x0 x1 x3) (CD_proj1 x0 x1 x4))).
(* Parameter add_CSNo "ce57e9d433ea923a64c5407464e1f301a0771389be6c3ee536319b8514b2986d" "1c8cce54f37fca653d20d5415ed4bc13353c15f33bfd0589f5ec9ffc056ac705" *)
Parameter add_CSNo : set -> set -> set.
Definition add_HSNo : set -> set -> set :=
 CD_add (Sing 3) CSNo add_CSNo.
Axiom complex_add_CSNo : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> add_CSNo x0 x1 :e complex)).
Theorem quaternion_add_HSNo : (forall x0, x0 :e quaternion -> (forall x1, x1 :e quaternion -> add_HSNo x0 x1 :e quaternion)).
admit.
Qed.
Definition CD_mul : set -> (set -> prop) -> (set -> set) -> (set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 x3 : set -> set => fun x4 x5 : set -> set -> set => fun x6 x7 : set => pair_tag x0 (x4 (x5 (CD_proj0 x0 x1 x6) (CD_proj0 x0 x1 x7)) (x2 (x5 (x3 (CD_proj1 x0 x1 x7)) (CD_proj1 x0 x1 x6)))) (x4 (x5 (CD_proj1 x0 x1 x7) (CD_proj0 x0 x1 x6)) (x5 (CD_proj1 x0 x1 x6) (x3 (CD_proj0 x0 x1 x7))))).
(* Parameter mul_CSNo "087bc0449c1b773fd802d9657db96e9f7370c4b8290db0e6101861175948d90a" "fbcd2a31a3d887d7c161aa2314509f533c62f1962052dc5160d2ce16b45844e4" *)
Parameter mul_CSNo : set -> set -> set.
Definition mul_HSNo : set -> set -> set :=
 CD_mul (Sing 3) CSNo minus_CSNo conj_CSNo add_CSNo mul_CSNo.
Axiom complex_mul_CSNo : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> mul_CSNo x0 x1 :e complex)).
Theorem quaternion_mul_HSNo : (forall x0, x0 :e quaternion -> (forall x1, x1 :e quaternion -> mul_HSNo x0 x1 :e quaternion)).
admit.
Qed.
Theorem complex_p0_eq : (forall x0, x0 :e complex -> HSNo_proj0 x0 = x0).
admit.
Qed.
Theorem complex_p1_eq : (forall x0, x0 :e complex -> HSNo_proj1 x0 = 0).
admit.
Qed.
Definition HSNo_pair : set -> set -> set :=
 pair_tag (Sing 4).
Definition octonion : set :=
 {HSNo_pair (ap x0 0) (ap x0 1) | x0 :e setprod quaternion quaternion}.
Theorem octonion_I : (forall x0, x0 :e quaternion -> (forall x1, x1 :e quaternion -> HSNo_pair x0 x1 :e octonion)).
admit.
Qed.
Theorem octonion_E : (forall x0, x0 :e octonion -> (forall x1 : prop, (forall x2, x2 :e quaternion -> (forall x3, x3 :e quaternion -> x0 = HSNo_pair x2 x3 -> x1)) -> x1)).
admit.
Qed.
(* Parameter OSNo "8265e2106dc17292e7892c7129b9559aecfd6607d4bd00983ccc92c9af5abd9e" "fbe4469ee9b8b98f19e7c00cbb1fc993f1f1cb148a3d20451054cd28d12ed148" *)
Parameter OSNo : set -> prop.
Axiom OSNo_I : (forall x0 x1, HSNo x0 -> HSNo x1 -> OSNo (HSNo_pair x0 x1)).
Theorem octonion_OSNo : (forall x0, x0 :e octonion -> OSNo x0).
admit.
Qed.
Axiom HSNo_pair_0 : (forall x0, forall x1 : set -> set -> prop, x1 (HSNo_pair x0 0) x0 -> x1 x0 (HSNo_pair x0 0)).
Theorem quaternion_octonion : quaternion c= octonion.
admit.
Qed.
Theorem octonion_0 : 0 :e octonion.
admit.
Qed.
Theorem octonion_1 : 1 :e octonion.
admit.
Qed.
Theorem octonion_i : Complex_i :e octonion.
admit.
Qed.
Theorem octonion_j : Quaternion_j :e octonion.
admit.
Qed.
Theorem octonion_k : Quaternion_k :e octonion.
admit.
Qed.
Definition Octonion_i0 : set :=
 HSNo_pair 0 1.
Theorem octonion_i0 : Octonion_i0 :e octonion.
admit.
Qed.
Definition Octonion_i3 : set :=
 HSNo_pair 0 (minus_HSNo Complex_i).
Theorem octonion_i3 : Octonion_i3 :e octonion.
admit.
Qed.
Definition Octonion_i5 : set :=
 HSNo_pair 0 (minus_HSNo Quaternion_k).
Theorem octonion_i5 : Octonion_i5 :e octonion.
admit.
Qed.
Definition Octonion_i6 : set :=
 HSNo_pair 0 (minus_HSNo Quaternion_j).
Theorem octonion_i6 : Octonion_i6 :e octonion.
admit.
Qed.
Definition OSNo_proj0 : set -> set :=
 CD_proj0 (Sing 4) HSNo.
Axiom OSNo_proj0_2 : (forall x0 x1, HSNo x0 -> HSNo x1 -> OSNo_proj0 (HSNo_pair x0 x1) = x0).
Theorem octonion_p0_eq : (forall x0, x0 :e quaternion -> (forall x1, x1 :e quaternion -> OSNo_proj0 (HSNo_pair x0 x1) = x0)).
admit.
Qed.
Definition OSNo_proj1 : set -> set :=
 CD_proj1 (Sing 4) HSNo.
Axiom OSNo_proj1_2 : (forall x0 x1, HSNo x0 -> HSNo x1 -> OSNo_proj1 (HSNo_pair x0 x1) = x1).
Theorem octonion_p1_eq : (forall x0, x0 :e quaternion -> (forall x1, x1 :e quaternion -> OSNo_proj1 (HSNo_pair x0 x1) = x1)).
admit.
Qed.
Theorem octonion_p0_quaternion : (forall x0, x0 :e octonion -> OSNo_proj0 x0 :e quaternion).
admit.
Qed.
Theorem octonion_p1_quaternion : (forall x0, x0 :e octonion -> OSNo_proj1 x0 :e quaternion).
admit.
Qed.
Axiom OSNo_proj0proj1_split : (forall x0 x1, OSNo x0 -> OSNo x1 -> OSNo_proj0 x0 = OSNo_proj0 x1 -> OSNo_proj1 x0 = OSNo_proj1 x1 -> x0 = x1).
Theorem octonion_proj0proj1_split : (forall x0, x0 :e octonion -> (forall x1, x1 :e octonion -> OSNo_proj0 x0 = OSNo_proj0 x1 -> OSNo_proj1 x0 = OSNo_proj1 x1 -> x0 = x1)).
admit.
Qed.
Definition minus_OSNo : set -> set :=
 CD_minus (Sing 4) HSNo minus_HSNo.
Theorem octonion_minus_OSNo : (forall x0, x0 :e octonion -> minus_OSNo x0 :e octonion).
admit.
Qed.
Definition conj_OSNo : set -> set :=
 CD_conj (Sing 4) HSNo minus_HSNo conj_HSNo.
Theorem octonion_conj_OSNo : (forall x0, x0 :e octonion -> conj_OSNo x0 :e octonion).
admit.
Qed.
Definition add_OSNo : set -> set -> set :=
 CD_add (Sing 4) HSNo add_HSNo.
Theorem octonion_add_OSNo : (forall x0, x0 :e octonion -> (forall x1, x1 :e octonion -> add_OSNo x0 x1 :e octonion)).
admit.
Qed.
Definition mul_OSNo : set -> set -> set :=
 CD_mul (Sing 4) HSNo minus_HSNo conj_HSNo add_HSNo mul_HSNo.
Theorem octonion_mul_OSNo : (forall x0, x0 :e octonion -> (forall x1, x1 :e octonion -> mul_OSNo x0 x1 :e octonion)).
admit.
Qed.
Theorem quaternion_p0_eq' : (forall x0, x0 :e quaternion -> OSNo_proj0 x0 = x0).
admit.
Qed.
Theorem quaternion_p1_eq' : (forall x0, x0 :e quaternion -> OSNo_proj1 x0 = 0).
admit.
Qed.
