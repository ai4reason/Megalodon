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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
Axiom Sigma_mon : (forall x0 x1, x0 c= x1 -> (forall x2 x3 : set -> set, (forall x4, x4 :e x0 -> x2 x4 c= x3 x4) -> lam x0 x2 c= lam x1 x3)).
Theorem setprod_mon : (forall x0 x1, x0 c= x1 -> (forall x2 x3, x2 c= x3 -> setprod x0 x2 c= setprod x1 x3)).
admit.
Qed.
Axiom Sigma_mon0 : (forall x0 x1, x0 c= x1 -> (forall x2 : set -> set, lam x0 x2 c= lam x1 x2)).
Theorem setprod_mon0 : (forall x0 x1, x0 c= x1 -> (forall x2, setprod x0 x2 c= setprod x1 x2)).
admit.
Qed.
Axiom Subq_ref : (forall x0, x0 c= x0).
Theorem setprod_mon1 : (forall x0 x1 x2, x1 c= x2 -> setprod x0 x1 c= setprod x0 x2).
admit.
Qed.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter proj0 "877ee30615a1a7b24a60726a1cf1bff24d7049b80efb464ad22a6a9c9c4f6738" "21a4888a1d196a26c9a88401c9f2b73d991cc569a069532cb5b119c4538a99d7" *)
Parameter proj0 : set -> set.
Axiom proj0_ap_0 : (forall x0, forall x1 : set -> set -> prop, x1 (proj0 x0) (ap x0 0) -> x1 (ap x0 0) (proj0 x0)).
(* Parameter proj1 "dc75c4d622b258b96498f307f3988491e6ba09fbf1db56d36317e5c18aa5cac6" "7aba21bd28932bfdd0b1a640f09b1b836264d10ccbba50d568dea8389d2f8c9d" *)
Parameter proj1 : set -> set.
Axiom proj1_ap_1 : (forall x0, forall x1 : set -> set -> prop, x1 (proj1 x0) (ap x0 1) -> x1 (ap x0 1) (proj1 x0)).
Axiom pair_eta_Subq_proj : (forall x0, setsum (proj0 x0) (proj1 x0) c= x0).
Theorem pair_eta_Subq : (forall x0, setsum (ap x0 0) (ap x0 1) c= x0).
admit.
Qed.
Axiom proj_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> setsum (proj0 x2) (proj1 x2) = x2).
Theorem Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> setsum (ap x2 0) (ap x2 1) = x2).
admit.
Qed.
Axiom ReplEq_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> Repl x0 x1 = Repl x0 x2).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem ReplEq_setprod_ext : (forall x0 x1, forall x2 x3 : set -> set -> set, (forall x4, x4 :e x0 -> (forall x5, x5 :e x1 -> x2 x4 x5 = x3 x4 x5)) -> {x2 (ap x5 0) (ap x5 1) | x5 :e setprod x0 x1} = {x3 (ap x5 0) (ap x5 1) | x5 :e setprod x0 x1}).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition tuple_p : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, x2 = setsum x4 x6 -> x5) -> x5) -> x3) -> x3)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom exandE_i : (forall x0 x1 : set -> prop, (forall x2 : prop, (forall x3, and (x0 x3) (x1 x3) -> x2) -> x2) -> (forall x2 : prop, (forall x3, x0 x3 -> x1 x3 -> x2) -> x2)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom lamE : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, and (x6 :e x1 x4) (x2 = setsum x4 x6) -> x5) -> x5) -> x3) -> x3)).
Theorem tuple_p_3_tuple : (forall x0 x1 x2, tuple_p 3 (lam 3 (fun x3 : set => If_i (x3 = 0) x0 (If_i (x3 = 1) x1 x2)))).
admit.
Qed.
Theorem tuple_p_4_tuple : (forall x0 x1 x2 x3, tuple_p 4 (lam 4 (fun x4 : set => If_i (x4 = 0) x0 (If_i (x4 = 1) x1 (If_i (x4 = 2) x2 x3))))).
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Axiom PowerI : (forall x0 x1, x1 c= x0 -> x1 :e Power x0).
Axiom In_0_1 : 0 :e 1.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom Empty_eq : (forall x0, (forall x1, nIn x1 x0) -> x0 = 0).
Definition pair_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> set -> prop, x1 (setsum (ap x0 0) (ap x0 1)) x0 -> x1 x0 (setsum (ap x0 0) (ap x0 1))).
Axiom PiE : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> and (forall x3, x3 :e x2 -> and (pair_p x3) (ap x3 0 :e x0)) (forall x3, x3 :e x0 -> ap x2 x3 :e x1 x3)).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom EmptyE : (forall x0, nIn x0 0).
Axiom apI : (forall x0 x1 x2, setsum x1 x2 :e x0 -> x2 :e ap x0 x1).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom Subq_1_Sing0 : 1 c= Sing 0.
Axiom PowerE : (forall x0 x1, x1 :e Power x0 -> x1 c= x0).
Theorem Pi_Power_1 : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e Power 1) -> Pi x0 x1 :e Power 1).
admit.
Qed.
Axiom PiI : (forall x0, forall x1 : set -> set, forall x2, (forall x3, x3 :e x2 -> and (pair_p x3) (ap x3 0 :e x0)) -> (forall x3, x3 :e x0 -> ap x2 x3 :e x1 x3) -> x2 :e Pi x0 x1).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom beta0 : (forall x0, forall x1 : set -> set, forall x2, nIn x2 x0 -> ap (lam x0 x1) x2 = 0).
Theorem Pi_0_dom_mon : (forall x0 x1, forall x2 : set -> set, x0 c= x1 -> (forall x3, x3 :e x1 -> nIn x3 x0 -> 0 :e x2 x3) -> Pi x0 x2 c= Pi x1 x2).
admit.
Qed.
Theorem Pi_cod_mon : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 c= x2 x3) -> Pi x0 x1 c= Pi x0 x2).
admit.
Qed.
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Theorem Pi_0_mon : (forall x0 x1, forall x2 x3 : set -> set, (forall x4, x4 :e x0 -> x2 x4 c= x3 x4) -> x0 c= x1 -> (forall x4, x4 :e x1 -> nIn x4 x0 -> 0 :e x3 x4) -> Pi x0 x2 c= Pi x1 x3).
admit.
Qed.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom and3E : (forall x0 x1 x2 : prop, and (and x0 x1) x2 -> (forall x3 : prop, (x0 -> x1 -> x2 -> x3) -> x3)).
Axiom Sigma_eta_proj0_proj1 : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> and (and (setsum (proj0 x2) (proj1 x2) = x2) (proj0 x2 :e x0)) (proj1 x2 :e x1 (proj0 x2))).
Axiom tuple_pair : (forall x0 x1, forall x2 : set -> set -> prop, x2 (setsum x0 x1) (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) (setsum x0 x1)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom If_i_or : (forall x0 : prop, forall x1 x2, or (If_i x0 x1 x2 = x1) (If_i x0 x1 x2 = x2)).
Axiom lamI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> setsum x2 x3 :e lam x0 x1)).
Axiom In_0_2 : 0 :e 2.
Axiom In_1_2 : 1 :e 2.
Axiom pair_p_I2 : (forall x0, (forall x1, x1 :e x0 -> and (pair_p x1) (ap x1 0 :e 2)) -> pair_p x0).
Theorem setexp_2_eq : (forall x0, forall x1 : set -> set -> prop, x1 (setprod x0 x0) (setexp x0 2) -> x1 (setexp x0 2) (setprod x0 x0)).
admit.
Qed.
Theorem setexp_0_dom_mon : (forall x0, 0 :e x0 -> (forall x1 x2, x1 c= x2 -> setexp x0 x1 c= setexp x0 x2)).
admit.
Qed.
Theorem setexp_0_mon : (forall x0 x1 x2 x3, 0 :e x3 -> x2 c= x3 -> x0 c= x1 -> setexp x2 x0 c= setexp x3 x1).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Theorem nat_in_setexp_mon : (forall x0, 0 :e x0 -> (forall x1, nat_p x1 -> (forall x2, x2 :e x1 -> setexp x0 x2 c= setexp x0 x1))).
admit.
Qed.
Axiom pair_tuple_fun : setsum = (fun x1 x2 : set => lam 2 (fun x3 : set => If_i (x3 = 0) x1 x2)).
Axiom pairI0 : (forall x0 x1 x2, x2 :e x0 -> setsum 0 x2 :e setsum x0 x1).
Theorem tupleI0 : (forall x0 x1 x2, x2 :e x0 -> lam 2 (fun x3 : set => If_i (x3 = 0) 0 x2) :e lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)).
admit.
Qed.
Axiom pairI1 : (forall x0 x1 x2, x2 :e x1 -> setsum 1 x2 :e setsum x0 x1).
Theorem tupleI1 : (forall x0 x1 x2, x2 :e x1 -> lam 2 (fun x3 : set => If_i (x3 = 0) 1 x2) :e lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)).
admit.
Qed.
Axiom pairE : (forall x0 x1 x2, x2 :e setsum x0 x1 -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = setsum 0 x4) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = setsum 1 x4) -> x3) -> x3)).
Theorem tupleE : (forall x0 x1 x2, x2 :e lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1) -> or (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = lam 2 (fun x6 : set => If_i (x6 = 0) 0 x4)) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e x1) (x2 = lam 2 (fun x6 : set => If_i (x6 = 0) 1 x4)) -> x3) -> x3)).
admit.
Qed.
Axiom tuple_2_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e lam x0 x1)).
Theorem tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
admit.
Qed.
Theorem tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
admit.
Qed.
Theorem apI2 : (forall x0 x1 x2, lam 2 (fun x3 : set => If_i (x3 = 0) x1 x2) :e x0 -> x2 :e ap x0 x1).
admit.
Qed.
Axiom apE : (forall x0 x1 x2, x2 :e ap x0 x1 -> setsum x1 x2 :e x0).
Theorem apE2 : (forall x0 x1 x2, x2 :e ap x0 x1 -> lam 2 (fun x3 : set => If_i (x3 = 0) x1 x2) :e x0).
admit.
Qed.
Axiom Empty_Subq_eq : (forall x0, x0 c= 0 -> x0 = 0).
Theorem ap_const_0 : (forall x0, forall x1 : set -> set -> prop, x1 (ap 0 x0) 0 -> x1 0 (ap 0 x0)).
admit.
Qed.
Axiom tuple_2_eta : (forall x0 x1, forall x2 : set -> set -> prop, x2 (lam 2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)))) (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) -> x2 (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) (lam 2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1))))).
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Theorem tuple_2_in_A_2 : (forall x0 x1 x2, x0 :e x2 -> x1 :e x2 -> lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1) :e setexp x2 2).
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Axiom PigeonHole_nat_bij : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e x0) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> bij x0 x0 x1)).
Axiom nat_2 : nat_p 2.
Theorem tuple_2_bij_2 : (forall x0 x1, x0 :e 2 -> x1 :e 2 -> (x0 = x1 -> (forall x2 : prop, x2)) -> bij 2 2 (ap (lam 2 (fun x2 : set => If_i (x2 = 0) x0 x1)))).
admit.
Qed.
