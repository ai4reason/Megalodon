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
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Definition lam : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => famunion x0 (fun x2 : set => Repl (x1 x2) (setsum x2))).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem lamI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> setsum x2 x3 :e lam x0 x1)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter proj0 "877ee30615a1a7b24a60726a1cf1bff24d7049b80efb464ad22a6a9c9c4f6738" "21a4888a1d196a26c9a88401c9f2b73d991cc569a069532cb5b119c4538a99d7" *)
Parameter proj0 : set -> set.
(* Parameter proj1 "dc75c4d622b258b96498f307f3988491e6ba09fbf1db56d36317e5c18aa5cac6" "7aba21bd28932bfdd0b1a640f09b1b836264d10ccbba50d568dea8389d2f8c9d" *)
Parameter proj1 : set -> set.
Axiom exandE_i : (forall x0 x1 : set -> prop, (forall x2 : prop, (forall x3, and (x0 x3) (x1 x3) -> x2) -> x2) -> (forall x2 : prop, (forall x3, x0 x3 -> x1 x3 -> x2) -> x2)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom proj0_pair_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (proj0 (setsum x0 x1)) x0 -> x2 x0 (proj0 (setsum x0 x1))).
Axiom proj1_pair_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (proj1 (setsum x0 x1)) x1 -> x2 x1 (proj1 (setsum x0 x1))).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom famunionE : (forall x0, forall x1 : set -> set, forall x2, x2 :e famunion x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 :e x1 x4) -> x3) -> x3)).
Theorem Sigma_eta_proj0_proj1 : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> and (and (setsum (proj0 x2) (proj1 x2) = x2) (proj0 x2 :e x0)) (proj1 x2 :e x1 (proj0 x2))).
admit.
Qed.
Axiom and3E : (forall x0 x1 x2 : prop, and (and x0 x1) x2 -> (forall x3 : prop, (x0 -> x1 -> x2 -> x3) -> x3)).
Theorem proj_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> setsum (proj0 x2) (proj1 x2) = x2).
admit.
Qed.
Theorem proj0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> proj0 x2 :e x0).
admit.
Qed.
Theorem proj1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> proj1 x2 :e x1 (proj0 x2)).
admit.
Qed.
Theorem pair_Sigma_E0 : (forall x0, forall x1 : set -> set, forall x2 x3, setsum x2 x3 :e lam x0 x1 -> x2 :e x0).
admit.
Qed.
Theorem pair_Sigma_E1 : (forall x0, forall x1 : set -> set, forall x2 x3, setsum x2 x3 :e lam x0 x1 -> x3 :e x1 x2).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem lamE : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, and (x6 :e x1 x4) (x2 = setsum x4 x6) -> x5) -> x5) -> x3) -> x3)).
admit.
Qed.
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem lamEq : (forall x0, forall x1 : set -> set, forall x2, iff (x2 :e lam x0 x1) (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, and (x6 :e x1 x4) (x2 = setsum x4 x6) -> x5) -> x5) -> x3) -> x3)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Theorem Sigma_mon : (forall x0 x1, x0 c= x1 -> (forall x2 x3 : set -> set, (forall x4, x4 :e x0 -> x2 x4 c= x3 x4) -> lam x0 x2 c= lam x1 x3)).
admit.
Qed.
Axiom Subq_ref : (forall x0, x0 c= x0).
Theorem Sigma_mon0 : (forall x0 x1, x0 c= x1 -> (forall x2 : set -> set, lam x0 x2 c= lam x1 x2)).
admit.
Qed.
Theorem Sigma_mon1 : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 c= x2 x3) -> lam x0 x1 c= lam x0 x2).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Axiom In_0_1 : 0 :e 1.
Axiom setsum_0_0 : setsum 0 0 = 0.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom Subq_1_Sing0 : 1 c= Sing 0.
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Theorem Sigma_Power_1 : (forall x0, x0 :e Power 1 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e Power 1) -> lam x0 x1 :e Power 1)).
admit.
Qed.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
Theorem pair_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> setsum x2 x3 :e setprod x0 x1)).
admit.
Qed.
Theorem proj0_setprod : (forall x0 x1 x2, x2 :e setprod x0 x1 -> proj0 x2 :e x0).
admit.
Qed.
Theorem proj1_setprod : (forall x0 x1 x2, x2 :e setprod x0 x1 -> proj1 x2 :e x1).
admit.
Qed.
Theorem pair_setprod_E0 : (forall x0 x1 x2 x3, setsum x2 x3 :e setprod x0 x1 -> x2 :e x0).
admit.
Qed.
Theorem pair_setprod_E1 : (forall x0 x1 x2 x3, setsum x2 x3 :e setprod x0 x1 -> x3 :e x1).
admit.
Qed.
(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set -> (set -> prop) -> (set -> set) -> set.
Definition ap : set -> set -> set :=
 (fun x0 x1 : set => ReplSep x0 (fun x2 : set => forall x3 : prop, (forall x4, x2 = setsum x1 x4 -> x3) -> x3) proj1).
Axiom ReplSepI : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e x0 -> x1 x3 -> x2 x3 :e ReplSep x0 x1 x2).
Theorem apI : (forall x0 x1 x2, setsum x1 x2 :e x0 -> x2 :e ap x0 x1).
admit.
Qed.
Axiom ReplSepE_impred : (forall x0, forall x1 : set -> prop, forall x2 : set -> set, forall x3, x3 :e ReplSep x0 x1 x2 -> (forall x4 : prop, (forall x5, x5 :e x0 -> x1 x5 -> x3 = x2 x5 -> x4) -> x4)).
Theorem apE : (forall x0 x1 x2, x2 :e ap x0 x1 -> setsum x1 x2 :e x0).
admit.
Qed.
Theorem apEq : (forall x0 x1 x2, iff (x2 :e ap x0 x1) (setsum x1 x2 :e x0)).
admit.
Qed.
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Theorem beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Theorem beta0 : (forall x0, forall x1 : set -> set, forall x2, nIn x2 x0 -> ap (lam x0 x1) x2 = 0).
admit.
Qed.
Axiom proj0E : (forall x0 x1, x1 :e proj0 x0 -> setsum 0 x1 :e x0).
Axiom proj0I : (forall x0 x1, setsum 0 x1 :e x0 -> x1 :e proj0 x0).
Theorem proj0_ap_0 : (forall x0, forall x1 : set -> set -> prop, x1 (proj0 x0) (ap x0 0) -> x1 (ap x0 0) (proj0 x0)).
admit.
Qed.
Axiom proj1E : (forall x0 x1, x1 :e proj1 x0 -> setsum 1 x1 :e x0).
Axiom proj1I : (forall x0 x1, setsum 1 x1 :e x0 -> x1 :e proj1 x0).
Theorem proj1_ap_1 : (forall x0, forall x1 : set -> set -> prop, x1 (proj1 x0) (ap x0 1) -> x1 (ap x0 1) (proj1 x0)).
admit.
Qed.
Theorem pair_ap_0 : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (setsum x0 x1) 0) x0 -> x2 x0 (ap (setsum x0 x1) 0)).
admit.
Qed.
Theorem pair_ap_1 : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (setsum x0 x1) 1) x1 -> x2 x1 (ap (setsum x0 x1) 1)).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom pairE : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = setsum 0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = setsum 1 x4) -> x3) -> x3)).
Axiom pair_inj : (forall x0 x1 x2 x3, setsum x0 x1 = setsum x2 x3 -> and (x0 = x2) (x1 = x3)).
Axiom In_0_2 : 0 :e 2.
Axiom In_1_2 : 1 :e 2.
Theorem pair_ap_n2 : (forall x0 x1 x2, nIn x2 2 -> ap (setsum x0 x1) x2 = 0).
admit.
Qed.
Theorem ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
admit.
Qed.
Theorem ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
admit.
Qed.
Definition pair_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> set -> prop, x1 (setsum (ap x0 0) (ap x0 1)) x0 -> x1 x0 (setsum (ap x0 0) (ap x0 1))).
Theorem pair_p_I : (forall x0 x1, pair_p (setsum x0 x1)).
admit.
Qed.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
Axiom pairI0 : (forall x0 x1 x2, x2 :e x0 -> setsum 0 x2 :e setsum x0 x1).
Axiom pairI1 : (forall x0 x1 x2, x2 :e x1 -> setsum 1 x2 :e setsum x0 x1).
Axiom Subq_2_UPair01 : 2 c= UPair 0 1.
Theorem pair_p_I2 : (forall x0, (forall x1, x1 :e x0 -> and (pair_p x1) (ap x1 0 :e 2)) -> pair_p x0).
admit.
Qed.
Theorem pair_p_In_ap : (forall x0 x1, pair_p x0 -> x0 :e x1 -> ap x0 1 :e ap x1 (ap x0 0)).
admit.
Qed.
Definition tuple_p : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, x2 = setsum x4 x6 -> x5) -> x5) -> x3) -> x3)).
Axiom pred_ext_2 : (forall x0 x1 : set -> prop, (forall x2, x0 x2 -> x1 x2) -> (forall x2, x1 x2 -> x0 x2) -> x0 = x1).
Theorem pair_p_tuple2 : pair_p = tuple_p 2.
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Theorem tuple_p_2_tuple : (forall x0 x1, tuple_p 2 (lam 2 (fun x2 : set => If_i (x2 = 0) x0 x1))).
admit.
Qed.
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Theorem tuple_pair : (forall x0 x1, forall x2 : set -> set -> prop, x2 (setsum x0 x1) (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) (setsum x0 x1)).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition Pi : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => Sep (Power (lam x0 (fun x2 : set => Union (x1 x2)))) (fun x2 : set => forall x3, x3 :e x0 -> ap x2 x3 :e x1 x3)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom UnionI : (forall x0 x1 x2, x1 :e x2 -> x2 :e x0 -> x1 :e Union x0).
Theorem PiI : (forall x0, forall x1 : set -> set, forall x2, (forall x3, x3 :e x2 -> and (pair_p x3) (ap x3 0 :e x0)) -> (forall x3, x3 :e x0 -> ap x2 x3 :e x1 x3) -> x2 :e Pi x0 x1).
admit.
Qed.
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Theorem PiE : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> and (forall x3, x3 :e x2 -> and (pair_p x3) (ap x3 0 :e x0)) (forall x3, x3 :e x0 -> ap x2 x3 :e x1 x3)).
admit.
Qed.
Theorem PiEq : (forall x0, forall x1 : set -> set, forall x2, iff (x2 :e Pi x0 x1) (and (forall x3, x3 :e x2 -> and (pair_p x3) (ap x3 0 :e x0)) (forall x3, x3 :e x0 -> ap x2 x3 :e x1 x3))).
admit.
Qed.
Theorem lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
admit.
Qed.
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Theorem ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
admit.
Qed.
Theorem Pi_ext_Subq : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> (forall x3, x3 :e Pi x0 x1 -> (forall x4, x4 :e x0 -> ap x2 x4 c= ap x3 x4) -> x2 c= x3)).
admit.
Qed.
Theorem Pi_ext : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> (forall x3, x3 :e Pi x0 x1 -> (forall x4, x4 :e x0 -> ap x2 x4 = ap x3 x4) -> x2 = x3)).
admit.
Qed.
Theorem Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
admit.
Qed.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Theorem pair_tuple_fun : setsum = (fun x1 x2 : set => lam 2 (fun x3 : set => If_i (x3 = 0) x1 x2)).
admit.
Qed.
Theorem tuple_2_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e lam x0 x1)).
admit.
Qed.
Theorem lamE2 : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, and (x6 :e x1 x4) (x2 = lam 2 (fun x8 : set => If_i (x8 = 0) x4 x6)) -> x5) -> x5) -> x3) -> x3)).
admit.
Qed.
Theorem tuple_2_inj : (forall x0 x1 x2 x3, lam 2 (fun x5 : set => If_i (x5 = 0) x0 x1) = lam 2 (fun x5 : set => If_i (x5 = 0) x2 x3) -> and (x0 = x2) (x1 = x3)).
admit.
Qed.
Theorem tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
admit.
Qed.
Theorem tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
admit.
Qed.
Definition Sep2 : set -> (set -> set) -> (set -> set -> prop) -> set :=
 (fun x0 : set => fun x1 : set -> set => fun x2 : set -> set -> prop => Sep (lam x0 x1) (fun x3 : set => x2 (ap x3 0) (ap x3 1))).
Theorem Sep2I : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, forall x3, x3 :e x0 -> (forall x4, x4 :e x1 x3 -> x2 x3 x4 -> lam 2 (fun x5 : set => If_i (x5 = 0) x3 x4) :e Sep2 x0 x1 x2)).
admit.
Qed.
Theorem Sep2E : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, forall x3, x3 :e Sep2 x0 x1 x2 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (forall x6 : prop, (forall x7, and (x7 :e x1 x5) (and (x3 = lam 2 (fun x9 : set => If_i (x9 = 0) x5 x7)) (x2 x5 x7)) -> x6) -> x6) -> x4) -> x4)).
admit.
Qed.
Theorem Sep2E' : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, forall x3 x4, lam 2 (fun x5 : set => If_i (x5 = 0) x3 x4) :e Sep2 x0 x1 x2 -> and (and (x3 :e x0) (x4 :e x1 x3)) (x2 x3 x4)).
admit.
Qed.
Theorem Sep2E'1 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, forall x3 x4, lam 2 (fun x5 : set => If_i (x5 = 0) x3 x4) :e Sep2 x0 x1 x2 -> x3 :e x0).
admit.
Qed.
Theorem Sep2E'2 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, forall x3 x4, lam 2 (fun x5 : set => If_i (x5 = 0) x3 x4) :e Sep2 x0 x1 x2 -> x4 :e x1 x3).
admit.
Qed.
Theorem Sep2E'3 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, forall x3 x4, lam 2 (fun x5 : set => If_i (x5 = 0) x3 x4) :e Sep2 x0 x1 x2 -> x2 x3 x4).
admit.
Qed.
Definition set_of_pairs : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> (forall x2 : prop, (forall x3, (forall x4 : prop, (forall x5, x1 = lam 2 (fun x7 : set => If_i (x7 = 0) x3 x5) -> x4) -> x4) -> x2) -> x2)).
Theorem set_of_pairs_ext : (forall x0 x1, set_of_pairs x0 -> set_of_pairs x1 -> (forall x2 x3, iff (lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e x0) (lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e x1)) -> x0 = x1).
admit.
Qed.
Theorem Sep2_set_of_pairs : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, set_of_pairs (Sep2 x0 x1 x2)).
admit.
Qed.
Theorem Sep2_ext : (forall x0, forall x1 : set -> set, forall x2 x3 : set -> set -> prop, (forall x4, x4 :e x0 -> (forall x5, x5 :e x1 x4 -> iff (x2 x4 x5) (x3 x4 x5))) -> Sep2 x0 x1 x2 = Sep2 x0 x1 x3).
admit.
Qed.
Theorem lam_ext_sub : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 c= lam x0 x2).
admit.
Qed.
Theorem encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
admit.
Qed.
Theorem lam_eta : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (lam x0 (ap (lam x0 x1))) (lam x0 x1) -> x2 (lam x0 x1) (lam x0 (ap (lam x0 x1)))).
admit.
Qed.
Theorem tuple_2_eta : (forall x0 x1, forall x2 : set -> set -> prop, x2 (lam 2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)))) (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) (lam 2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1))))).
admit.
Qed.
Definition lam2 : set -> (set -> set) -> (set -> set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => fun x2 : set -> set -> set => lam x0 (fun x3 : set => lam (x1 x3) (x2 x3))).
Theorem beta2 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> set, forall x3, x3 :e x0 -> (forall x4, x4 :e x1 x3 -> ap (ap (lam2 x0 x1 x2) x3) x4 = x2 x3 x4)).
admit.
Qed.
Theorem lam2_ext : (forall x0, forall x1 : set -> set, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x0 -> (forall x5, x5 :e x1 x4 -> x2 x4 x5 = x3 x4 x5)) -> lam2 x0 x1 x2 = lam2 x0 x1 x3).
admit.
Qed.
Definition encode_b : set -> (set -> set -> set) -> set :=
 (fun x0 : set => lam2 x0 (fun x1 : set => x0)).
Definition decode_b : set -> set -> set -> set :=
 (fun x0 x1 : set => ap (ap x0 x1)).
Definition decode_p : set -> set -> prop :=
 (fun x0 x1 : set => x1 :e x0).
Definition encode_r : set -> (set -> set -> prop) -> set :=
 (fun x0 : set => Sep2 x0 (fun x1 : set => x0)).
Definition decode_r : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => lam 2 (fun x3 : set => If_i (x3 = 0) x1 x2) :e x0).
Definition encode_c : set -> ((set -> prop) -> prop) -> set :=
 (fun x0 : set => fun x1 : (set -> prop) -> prop => Sep (Power x0) (fun x2 : set => x1 (fun x3 : set => x3 :e x2))).
Definition decode_c : set -> (set -> prop) -> prop :=
 (fun x0 : set => fun x1 : set -> prop => forall x2 : prop, (forall x3, and (forall x4, iff (x1 x4) (x4 :e x3)) (x3 :e x0) -> x2) -> x2).
Theorem decode_encode_b : (forall x0, forall x1 : set -> set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> decode_b (encode_b x0 x1) x2 x3 = x1 x2 x3)).
admit.
Qed.
Theorem encode_b_ext : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> encode_b x0 x1 = encode_b x0 x2).
admit.
Qed.
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Theorem decode_encode_p : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> decode_p (Sep x0 x1) x2 = x1 x2).
admit.
Qed.
Theorem encode_p_ext : (forall x0, forall x1 x2 : set -> prop, (forall x3, x3 :e x0 -> iff (x1 x3) (x2 x3)) -> Sep x0 x1 = Sep x0 x2).
admit.
Qed.
Theorem decode_encode_r : (forall x0, forall x1 : set -> set -> prop, forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> decode_r (encode_r x0 x1) x2 x3 = x1 x2 x3)).
admit.
Qed.
Theorem encode_r_ext : (forall x0, forall x1 x2 : set -> set -> prop, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> iff (x1 x3 x4) (x2 x3 x4))) -> encode_r x0 x1 = encode_r x0 x2).
admit.
Qed.
Axiom Sep_In_Power : (forall x0, forall x1 : set -> prop, Sep x0 x1 :e Power x0).
Theorem decode_encode_c : (forall x0, forall x1 : (set -> prop) -> prop, forall x2 : set -> prop, (forall x3, x2 x3 -> x3 :e x0) -> decode_c (encode_c x0 x1) x2 = x1 x2).
admit.
Qed.
Theorem encode_c_ext : (forall x0, forall x1 x2 : (set -> prop) -> prop, (forall x3 : set -> prop, (forall x4, x3 x4 -> x4 :e x0) -> iff (x1 x3) (x2 x3)) -> encode_c x0 x1 = encode_c x0 x2).
admit.
Qed.
