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
Definition Church6_p : (set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x7) -> x1 x0).
Definition Church6_lt4p : (set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x5) -> x1 x0).
Definition permargs_i_1_0_3_2_4_5 : (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 : set => x0 x2 x1 x4 x3).
Definition Church6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set => fun x2 x3 x4 x5 x6 x7 : set => x0 (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_1_0_3_2_4_5 x1 x2 x3 x4 x5 x6 x7)).
Axiom missingprop_82a18ab52f7ac6281a607a1820c9620c483afb6be383087b7d72855319e580f5 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x0 -> Church6_lt4p (permargs_i_1_0_3_2_4_5 x0)).
Axiom missingprop_995579645b8886904e46af0dc0ac8e19ee3cd4af7d78809ff698344ead396f5a : Church6_lt4p (fun x0 x1 x2 x3 x4 x5 : set => x1).
Axiom missingprop_56ce56513a8af1327555b873c1c6ce07e295bb2d93a34f831bbfdb3328f2809b : Church6_lt4p (fun x0 x1 x2 x3 x4 x5 : set => x0).
Axiom missingprop_9ab406e767d5138f84eceb89ae815ef2f93656cc034576ca18ab84af7a608607 : Church6_lt4p (fun x0 x1 x2 x3 x4 x5 : set => x3).
Axiom missingprop_bd8f81a1227d0cc25cea7c364f7541293f70705efd4999ad0dba8cf8857226a9 : Church6_lt4p (fun x0 x1 x2 x3 x4 x5 : set => x2).
Theorem missingprop_22158d08c0231978b15c89a0a71d14470c178b70c2d5d41c68c1853923802bd9 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> (forall x1 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x1 -> Church6_lt4p (Church6_squared_permutation__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5__1_0_3_2_4_5 x0 x1))).
admit.
Qed.
Definition permargs_i_2_3_0_1_4_5 : (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 : set => x0 x3 x4 x1 x2).
Definition Church6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set => fun x2 x3 x4 x5 x6 x7 : set => x0 (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_2_3_0_1_4_5 x1 x2 x3 x4 x5 x6 x7)).
Axiom missingprop_e4e4b3f2fb027bfa7e0d480fd7613c70f730d2ef7d2b0b335a19a8b751f04a2c : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x0 -> Church6_lt4p (permargs_i_2_3_0_1_4_5 x0)).
Theorem missingprop_e2935f3c5b2b7574d7a820d14c9b741161118c1a3930acb8b78305f98a602198 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> (forall x1 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x1 -> Church6_lt4p (Church6_squared_permutation__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5__2_3_0_1_4_5 x0 x1))).
admit.
Qed.
Definition permargs_i_3_2_1_0_4_5 : (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => fun x1 x2 x3 x4 : set => x0 x4 x3 x2 x1).
Definition Church6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set => fun x2 x3 x4 x5 x6 x7 : set => x0 (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x6 x7) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x7 x6) (permargs_i_3_2_1_0_4_5 x1 x2 x3 x4 x5 x6 x7)).
Axiom missingprop_03dd63d746fcacdd2139f1b753227929c56f1868867976a2dfb9db401b403f8a : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x0 -> Church6_lt4p (permargs_i_3_2_1_0_4_5 x0)).
Theorem missingprop_2a3eaca129caad3fda8e1cc1010aa31d33436aa039f364b9e7e83665634185f2 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> (forall x1 : set -> set -> set -> set -> set -> set -> set, Church6_lt4p x1 -> Church6_lt4p (Church6_squared_permutation__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5__3_2_1_0_4_5 x0 x1))).
admit.
Qed.
