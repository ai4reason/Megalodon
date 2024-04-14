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
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
(* Parameter SNoLt "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" "46e7ed0ee512360f08f5e5f9fc40a934ff27cfd0c79d3c2384e6fb16d461bd95" *)
Parameter SNoLt : set -> set -> prop.
Axiom SNoLtLe_or : (forall x0 x1, SNo x0 -> SNo x1 -> or (SNoLt x0 x1) (SNoLe x1 x0)).
Axiom SNo_0 : SNo Empty.
Axiom SNoLtLe : (forall x0 x1, SNoLt x0 x1 -> SNoLe x0 x1).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 Empty = Empty).
Axiom neg_mul_SNo_Lt : (forall x0 x1 x2, SNo x0 -> SNoLt x0 Empty -> SNo x1 -> SNo x2 -> SNoLt x2 x1 -> SNoLt (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom nonneg_mul_SNo_Le : (forall x0 x1 x2, SNo x0 -> SNoLe Empty x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (mul_SNo x0 x1) (mul_SNo x0 x2)).
Theorem SNo_sqr_nonneg : (forall x0, SNo x0 -> SNoLe Empty (mul_SNo x0 x0)).
admit.
Qed.
Axiom SNoLt_trichotomy_or_impred : (forall x0 x1, SNo x0 -> SNo x1 -> (forall x2 : prop, (SNoLt x0 x1 -> x2) -> (x0 = x1 -> x2) -> (SNoLt x1 x0 -> x2) -> x2)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom mul_SNo_neg_neg : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt x0 Empty -> SNoLt x1 Empty -> SNoLt Empty (mul_SNo x0 x1)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom mul_SNo_pos_pos : (forall x0 x1, SNo x0 -> SNo x1 -> SNoLt Empty x0 -> SNoLt Empty x1 -> SNoLt Empty (mul_SNo x0 x1)).
Theorem SNo_zero_or_sqr_pos : (forall x0, SNo x0 -> or (x0 = Empty) (SNoLt Empty (mul_SNo x0 x0))).
admit.
Qed.
(* Parameter CSNo "4a34d6ddf18af8c0c2f637afb2ddadaa240273c85b9410fcb82cd0782bab13d7" "c35281fa7c11775a593d536c7fec2695f764921632445fa772f3a2a45bdf4257" *)
Parameter CSNo : set -> prop.
(* Parameter CSNo_Re "1be0cda46d38c27e57488fdb9a2e54ccd2b8f9c133cbfc27af57bf54206ada12" "9481cf9deb6efcbb12eccc74f82acf453997c8e75adb5cd83311956bcc85d828" *)
Parameter CSNo_Re : set -> set.
(* Parameter SNo_pair "42f58f2a7ea537e615b65875895df2f1fc42b140b7652f8ea8e9c6893053be73" "0c801be26da5c0527e04f5b1962551a552dab2d2643327b86105925953cf3b06" *)
Parameter SNo_pair : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
(* Parameter CSNo_Im "8bf86a17c9a6ce157ed3de4762edc8cbee3acc11e18b41f458f34ca9d1983803" "5dad3f55c3f3177e2d18188b94536551b7bfd38a80850f4314ba8abb3fd78138" *)
Parameter CSNo_Im : set -> set.
Definition minus_CSNo : set -> set :=
 (fun x0 : set => SNo_pair (minus_SNo (CSNo_Re x0)) (minus_SNo (CSNo_Im x0))).
Axiom CSNo_Re2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Re (SNo_pair x0 x1) = x0).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Axiom CSNo_ReR : (forall x0, CSNo x0 -> SNo (CSNo_Re x0)).
Axiom CSNo_ImR : (forall x0, CSNo x0 -> SNo (CSNo_Im x0)).
Theorem missingprop_b3da9c8705efa35c67169a2e2027e4447fcfab350671212d3a9a4c69902c0e94 : (forall x0, CSNo x0 -> CSNo_Re (minus_CSNo x0) = minus_SNo (CSNo_Re x0)).
admit.
Qed.
Axiom CSNo_Im2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Im (SNo_pair x0 x1) = x1).
Theorem missingprop_efd7dfcd3e80202ffcc3e685b73692d3dd99f31e27f878a9cd3b14c55287909a : (forall x0, CSNo x0 -> CSNo_Im (minus_CSNo x0) = minus_SNo (CSNo_Im x0)).
admit.
Qed.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Definition add_CSNo : set -> set -> set :=
 (fun x0 x1 : set => SNo_pair (add_SNo (CSNo_Re x0) (CSNo_Re x1)) (add_SNo (CSNo_Im x0) (CSNo_Im x1))).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Theorem missingprop_af0b151803c2dc4bc6691b166645c0a8471b89f2da30fa0948427517708d6da0 : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re (add_CSNo x0 x1) = add_SNo (CSNo_Re x0) (CSNo_Re x1)).
admit.
Qed.
Theorem missingprop_7f97cbea1b316ccd537155d989f2889dd5c3074e8edefbeca1dbc06c62876158 : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Im (add_CSNo x0 x1) = add_SNo (CSNo_Im x0) (CSNo_Im x1)).
admit.
Qed.
Axiom CSNo_ReIm_split : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re x0 = CSNo_Re x1 -> CSNo_Im x0 = CSNo_Im x1 -> x0 = x1).
Axiom CSNo_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (add_CSNo x0 x1)).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Theorem missingprop_6df04587a59e9b54f0549c96144213d94328d0b365474f739b895e743839c817 : (forall x0 x1, CSNo x0 -> CSNo x1 -> add_CSNo x0 x1 = add_CSNo x1 x0).
admit.
Qed.
Axiom f_eq_i : (forall x0 : set -> set, forall x1 x2, x1 = x2 -> x0 x1 = x0 x2).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Theorem missingprop_4dacc39fbff2a1eb7f64c88eae888b40bdb7083a731b4cd05ad435e42f13fcba : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo x0 (add_CSNo x1 x2) = add_CSNo (add_CSNo x0 x1) x2).
admit.
Qed.
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Theorem add_SNo_rotate_4_0312 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x3) (add_SNo x1 x2)).
admit.
Qed.
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem missingprop_49f3cf70b605b44eb2822fe91c57bca94bae304f4b9278fa190485d2a33fdf59 : (forall x0 x1, CSNo x0 -> CSNo x1 -> SNo (add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Re x1)) (minus_SNo (mul_SNo (CSNo_Im x0) (CSNo_Im x1))))).
admit.
Qed.
Theorem missingprop_57767f805436b599e99b8ac6663fa6b7758904d24620ff860a059bb817bebc7c : (forall x0 x1, CSNo x0 -> CSNo x1 -> SNo (add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Im x1)) (mul_SNo (CSNo_Im x0) (CSNo_Re x1)))).
admit.
Qed.
Definition mul_CSNo : set -> set -> set :=
 (fun x0 x1 : set => SNo_pair (add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Re x1)) (minus_SNo (mul_SNo (CSNo_Im x0) (CSNo_Im x1)))) (add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Im x1)) (mul_SNo (CSNo_Im x0) (CSNo_Re x1)))).
Theorem missingprop_6c208b2fed212d981bc839a7f70f9c484483dc6ca9daee237131093290c06c64 : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re (mul_CSNo x0 x1) = add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Re x1)) (minus_SNo (mul_SNo (CSNo_Im x0) (CSNo_Im x1)))).
admit.
Qed.
Theorem missingprop_f8168dc7675423b30fd1f30a7c39b8d4f1ba18bd99e8df15949f136f95eea4c7 : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Im (mul_CSNo x0 x1) = add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Im x1)) (mul_SNo (CSNo_Im x0) (CSNo_Re x1))).
admit.
Qed.
Axiom CSNo_I : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo (SNo_pair x0 x1)).
Theorem missingprop_3ecd982cbc53bc522aff3fa68eac8a88bfce787ef3776f0dfe2618ef278e2daf : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (mul_CSNo x0 x1)).
admit.
Qed.
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Theorem missingprop_4be0565ac5b41f138f7a30d0a9f34a5d126bb341d2eeaa545aa7f0c1552b9722 : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 x1 = mul_CSNo x1 x0).
admit.
Qed.
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Axiom SNo_mul_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (mul_SNo x0 (mul_SNo x1 x2))).
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Theorem missingprop_f134758f39278620c60cfac6676dbfce170f8cc0cce849e07ba3004e259a9bbb : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo (mul_CSNo x0 x1) x2).
admit.
Qed.
Axiom SNo_CSNo : (forall x0, SNo x0 -> CSNo x0).
Theorem missingprop_85a866d410bbf26b260c37246259122da00d151df84a9a2a98da7e65f3fcf36a : CSNo Empty.
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom SNo_1 : SNo 1.
Theorem missingprop_33594f786441fb94cfa9c7be2034d88216fac0dbcbe9e223f18185e2cf6cb053 : CSNo 1.
admit.
Qed.
Axiom SNo_pair_0 : (forall x0, forall x1 : set -> set -> prop, x1 (SNo_pair x0 0) x0 -> x1 x0 (SNo_pair x0 0)).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Theorem missingprop_0d9bf92aa5eb4d4ae6bc10fbd993cadc9f48c429c82304b11a917b483aee3888 : (forall x0, CSNo x0 -> mul_CSNo 1 x0 = x0).
admit.
Qed.
Theorem missingprop_1a3b6d576749bdb66b853eab2e35cc4332be69b97fdfebcc7e17a4a552a3d204 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (add_CSNo x1 x2) = add_CSNo (mul_CSNo x0 x1) (mul_CSNo x0 x2)).
admit.
Qed.
Theorem missingprop_8e63a35ced1c21572795aec3dca7302bd96cc84c909ac1e26265b0a88a4ddf7f : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo (add_CSNo x0 x1) x2 = add_CSNo (mul_CSNo x0 x2) (mul_CSNo x1 x2)).
admit.
Qed.
Axiom SNo_Re : (forall x0, SNo x0 -> CSNo_Re x0 = x0).
Axiom SNo_Im : (forall x0, SNo x0 -> CSNo_Im x0 = 0).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Theorem missingprop_e8fe572c395c46aa7a6d67f7a8cd850bf647261d6b3677aecbf3b7ddfa5a7193 : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_CSNo x0 x1).
admit.
Qed.
Definition Complex_i : set :=
 SNo_pair 0 1.
Axiom SNo_Complex_i : CSNo Complex_i.
Axiom CSNo_minus_CSNo : (forall x0, CSNo x0 -> CSNo (minus_CSNo x0)).
Axiom Re_i : CSNo_Re Complex_i = 0.
Axiom Im_i : CSNo_Im Complex_i = 1.
Axiom Re_1 : CSNo_Re 1 = 1.
Axiom Im_1 : CSNo_Im 1 = 0.
Theorem missingprop_5796014feba5197b3bf8ba040a6b1b81462d5deb0d9ee802d5b425665678e22a : mul_CSNo Complex_i Complex_i = minus_CSNo 1.
admit.
Qed.
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Axiom mul_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo x1 (mul_SNo x0 x2)).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Theorem missingprop_6e4ff8bfdd7e4242c7b35f24e0c26f0a68d5c96066694498c27244212d696bbd : (forall x0, CSNo x0 -> (forall x1, SNo x1 -> mul_SNo (add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Re x0)) (mul_SNo (CSNo_Im x0) (CSNo_Im x0))) x1 = 1 -> mul_CSNo x0 (add_CSNo (mul_CSNo x1 (CSNo_Re x0)) (minus_CSNo (mul_CSNo Complex_i (mul_CSNo x1 (CSNo_Im x0))))) = 1)).
admit.
Qed.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition complex : set :=
 {SNo_pair (ap x0 0) (ap x0 1) | x0 :e setprod real real}.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Theorem complex_I : (forall x0, x0 :e real -> (forall x1, x1 :e real -> SNo_pair x0 x1 :e complex)).
admit.
Qed.
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem complex_E : (forall x0, x0 :e complex -> (forall x1 : prop, (forall x2, x2 :e real -> (forall x3, x3 :e real -> x0 = SNo_pair x2 x3 -> x1)) -> x1)).
admit.
Qed.
Axiom real_SNo : (forall x0, x0 :e real -> SNo x0).
Theorem complex_CSNo : (forall x0, x0 :e complex -> CSNo x0).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom real_0 : 0 :e real.
Theorem real_complex : real c= complex.
admit.
Qed.
Theorem complex_0 : 0 :e complex.
admit.
Qed.
Axiom real_1 : 1 :e real.
Theorem complex_1 : 1 :e complex.
admit.
Qed.
Theorem complex_i : Complex_i :e complex.
admit.
Qed.
Theorem complex_Re_eq : (forall x0, x0 :e real -> (forall x1, x1 :e real -> CSNo_Re (SNo_pair x0 x1) = x0)).
admit.
Qed.
Theorem complex_Im_eq : (forall x0, x0 :e real -> (forall x1, x1 :e real -> CSNo_Im (SNo_pair x0 x1) = x1)).
admit.
Qed.
Axiom CSNo_ReIm : (forall x0, CSNo x0 -> x0 = SNo_pair (CSNo_Re x0) (CSNo_Im x0)).
Theorem missingprop_e771c3f853ed69506e210e908718a0f1cce6d31f77df2d719fa9be3a4416923f : (forall x0, x0 :e complex -> x0 = SNo_pair (CSNo_Re x0) (CSNo_Im x0)).
admit.
Qed.
Theorem complex_Re_real : (forall x0, x0 :e complex -> CSNo_Re x0 :e real).
admit.
Qed.
Theorem complex_Im_real : (forall x0, x0 :e complex -> CSNo_Im x0 :e real).
admit.
Qed.
Theorem complex_ReIm_split : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> CSNo_Re x0 = CSNo_Re x1 -> CSNo_Im x0 = CSNo_Im x1 -> x0 = x1)).
admit.
Qed.
Axiom real_minus_SNo : (forall x0, x0 :e real -> minus_SNo x0 :e real).
Theorem complex_minus_CSNo : (forall x0, x0 :e complex -> minus_CSNo x0 :e complex).
admit.
Qed.
Axiom real_add_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_SNo x0 x1 :e real)).
Theorem complex_add_CSNo : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> add_CSNo x0 x1 :e complex)).
admit.
Qed.
Axiom real_mul_SNo : (forall x0, x0 :e real -> (forall x1, x1 :e real -> mul_SNo x0 x1 :e real)).
Theorem complex_mul_CSNo : (forall x0, x0 :e complex -> (forall x1, x1 :e complex -> mul_CSNo x0 x1 :e complex)).
admit.
Qed.
Theorem real_Re_eq : (forall x0, x0 :e real -> CSNo_Re x0 = x0).
admit.
Qed.
Theorem real_Im_eq : (forall x0, x0 :e real -> CSNo_Im x0 = 0).
admit.
Qed.
Theorem mul_i_real_eq : (forall x0, x0 :e real -> mul_CSNo Complex_i x0 = SNo_pair 0 x0).
admit.
Qed.
Theorem real_Re_i_eq : (forall x0, x0 :e real -> CSNo_Re (mul_CSNo Complex_i x0) = 0).
admit.
Qed.
Theorem real_Im_i_eq : (forall x0, x0 :e real -> CSNo_Im (mul_CSNo Complex_i x0) = x0).
admit.
Qed.
Theorem complex_eta : (forall x0, x0 :e complex -> x0 = add_CSNo (CSNo_Re x0) (mul_CSNo Complex_i (CSNo_Im x0))).
admit.
Qed.
Theorem missingprop_dae74e9fbfec008e009f554293c6c0acaa9d0a05d6e5de60e79ca7c00a1910f3 : (forall x0, x0 :e real -> (forall x1, x1 :e real -> add_CSNo x0 (mul_CSNo Complex_i x1) :e complex)).
admit.
Qed.
Theorem missingprop_03f29d5772de0fe7f52f03585deb4d373fa3ec2b24f9e643f39d595d1443eef4 : (forall x0, x0 :e complex -> (forall x1 : prop, (forall x2, x2 :e real -> (forall x3, x3 :e real -> x0 = add_CSNo x2 (mul_CSNo Complex_i x3) -> x1)) -> x1)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom nonzero_real_recip_ex : (forall x0, x0 :e real -> (x0 = 0 -> (forall x1 : prop, x1)) -> (forall x1 : prop, (forall x2, and (x2 :e real) (mul_SNo x0 x2 = 1) -> x1) -> x1)).
Axiom Re_0 : CSNo_Re 0 = 0.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom SNoLt_irref : (forall x0, not (SNoLt x0 x0)).
Axiom SNoLtLe_tra : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLt x0 x1 -> SNoLe x1 x2 -> SNoLt x0 x2).
Axiom add_SNo_Le2 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x1 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x0 x2)).
Axiom Im_0 : CSNo_Im 0 = 0.
Axiom add_SNo_Le1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNoLe x0 x2 -> SNoLe (add_SNo x0 x1) (add_SNo x2 x1)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem nonzero_complex_recip_ex : (forall x0, x0 :e complex -> (x0 = 0 -> (forall x1 : prop, x1)) -> (forall x1 : prop, (forall x2, and (x2 :e complex) (mul_CSNo x0 x2 = 1) -> x1) -> x1)).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Theorem complex_real_set_eq : real = Sep complex (fun x1 : set => forall x2 : set -> set -> prop, x2 (CSNo_Re x1) x1 -> x2 x1 (CSNo_Re x1)).
admit.
Qed.
(* Parameter explicit_Field "b2707c82b8b416a22264d2934d5221d1115ea55732f96cbb6663fbf7e945d3e3" "32dcc27d27b5003a86f8b13ba9ca16ffaec7168a11c5d9850940847c48148591" *)
Parameter explicit_Field : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
Axiom explicit_Field_I : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x3 x5 (x3 x6 x7) = x3 (x3 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x3 x5 x6 = x3 x6 x5)) -> x1 :e x0 -> (forall x5, x5 :e x0 -> x3 x1 x5 = x5) -> (forall x5, x5 :e x0 -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x3 x5 x7 = x1) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 :e x0)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x4 x6 x7) = x4 (x4 x5 x6) x7))) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> x4 x5 x6 = x4 x6 x5)) -> x2 :e x0 -> (x2 = x1 -> (forall x5 : prop, x5)) -> (forall x5, x5 :e x0 -> x4 x2 x5 = x5) -> (forall x5, x5 :e x0 -> (x5 = x1 -> (forall x6 : prop, x6)) -> (forall x6 : prop, (forall x7, and (x7 :e x0) (x4 x5 x7 = x2) -> x6) -> x6)) -> (forall x5, x5 :e x0 -> (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x4 x5 (x3 x6 x7) = x3 (x4 x5 x6) (x4 x5 x7)))) -> explicit_Field x0 x1 x2 x3 x4).
Axiom add_CSNo_0L : (forall x0, CSNo x0 -> add_CSNo 0 x0 = x0).
Axiom add_CSNo_minus_CSNo_rinv : (forall x0, CSNo x0 -> add_CSNo x0 (minus_CSNo x0) = 0).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Theorem missingprop_3160270a6b7a6c6cbcf3fa0f7866a594ab49f62759e7107cbcc2c897c14f9a79 : explicit_Field complex 0 1 add_CSNo mul_CSNo.
admit.
Qed.
(* Parameter explicit_Complex "552d05a240b7958c210e990f72c4938aa612373e1d79a5d97fa37f80e3d844b3" "bacb8536bbb356aa59ba321fb8eade607d1654d8a7e0b33887be9afbcfa5c504" *)
Parameter explicit_Complex : set -> (set -> set) -> (set -> set) -> set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> prop.
(* Parameter explicit_Reals "e5dee14fc7a24a63555de85859904de8dc1b462044060d68dbb06cc9a590bc38" "2c81615a11c9e3e301f3301ec7862ba122acea20bfe1c120f7bdaf5a2e18faf4" *)
Parameter explicit_Reals : set -> set -> set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop.
Axiom explicit_Complex_I : (forall x0, forall x1 x2 : set -> set, forall x3 x4 x5, forall x6 x7 : set -> set -> set, explicit_Field x0 x3 x4 x6 x7 -> (forall x8 : prop, (forall x9 : set -> set -> prop, explicit_Reals (Sep x0 (fun x10 : set => forall x11 : set -> set -> prop, x11 (x1 x10) x10 -> x11 x10 (x1 x10))) x3 x4 x6 x7 x9 -> x8) -> x8) -> (forall x8, x8 :e x0 -> x2 x8 :e Sep x0 (fun x9 : set => forall x10 : set -> set -> prop, x10 (x1 x9) x9 -> x10 x9 (x1 x9))) -> x5 :e x0 -> (forall x8, x8 :e x0 -> x1 x8 :e x0) -> (forall x8, x8 :e x0 -> x2 x8 :e x0) -> (forall x8, x8 :e x0 -> x8 = x6 (x1 x8) (x7 x5 (x2 x8))) -> (forall x8, x8 :e x0 -> (forall x9, x9 :e x0 -> x1 x8 = x1 x9 -> x2 x8 = x2 x9 -> x8 = x9)) -> x6 (x7 x5 x5) x4 = x3 -> explicit_Complex x0 x1 x2 x3 x4 x5 x6 x7).
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
(* Parameter iff "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" "98aaaf225067eca7b3f9af03e4905bbbf48fc0ccbe2b4777422caed3e8d4dfb9" *)
Parameter iff : prop -> prop -> prop.
Axiom explicit_Reals_transfer : (forall x0 x1 x2, forall x3 x4 : set -> set -> set, forall x5 : set -> set -> prop, forall x6 x7 x8, forall x9 x10 : set -> set -> set, forall x11 : set -> set -> prop, forall x12 : set -> set, explicit_Reals x0 x1 x2 x3 x4 x5 -> bij x0 x6 x12 -> x12 x1 = x7 -> x12 x2 = x8 -> (forall x13, x13 :e x0 -> (forall x14, x14 :e x0 -> x12 (x3 x13 x14) = x9 (x12 x13) (x12 x14))) -> (forall x13, x13 :e x0 -> (forall x14, x14 :e x0 -> x12 (x4 x13 x14) = x10 (x12 x13) (x12 x14))) -> (forall x13, x13 :e x0 -> (forall x14, x14 :e x0 -> iff (x5 x13 x14) (x11 (x12 x13) (x12 x14)))) -> explicit_Reals x6 x7 x8 x9 x10 x11).
Axiom explicit_Reals_real : explicit_Reals real 0 1 add_SNo mul_SNo SNoLe.
Axiom bij_id : (forall x0, bij x0 x0 (fun x1 : set => x1)).
Axiom add_SNo_add_CSNo : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_CSNo x0 x1).
Axiom iff_refl : (forall x0 : prop, iff x0 x0).
Axiom add_CSNo_minus_CSNo_linv : (forall x0, CSNo x0 -> add_CSNo (minus_CSNo x0) x0 = 0).
Theorem missingprop_5a43bfa75dc2b70480ca37db4197f0571e7701c41a97c56cb0b1a8885bac9ee8 : explicit_Complex complex CSNo_Re CSNo_Im 0 1 Complex_i add_CSNo mul_CSNo.
admit.
Qed.
