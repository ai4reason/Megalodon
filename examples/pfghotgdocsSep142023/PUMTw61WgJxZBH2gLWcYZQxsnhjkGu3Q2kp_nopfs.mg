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
(* Parameter HSNo "1c628f7af39a04e6bfe8d8c0d795c1631fdd70d0438d3e5060c6375b4c1ac72e" "1e7352259c54690fd5b8c99e1d05b70933b3c6ee6dddfc492998c305f0aec7f2" *)
Parameter HSNo : set -> prop.
(* Parameter mul_HSNo "b4f4bbad0e0782b76ff5fe9db6db1f014008c73a4621305aded53211a748cc80" "e7bde6cc611a758824b863427bda5e1566e45d33c8746fad0c691e30e638e117" *)
Parameter mul_HSNo : set -> set -> set.
(* Parameter CSNo "b678d9e153d06cf44cf447be611c0e745893b20351d0f79af5de8da0d58ac866" "4235a7ec116097b786860fa05ca09197cbbcea5e520801a717b25d8a21008ee1" *)
Parameter CSNo : set -> prop.
(* Parameter HSNo_proj0 "2f59acdd1d22c04befbab21f663c740736ae7926c08eb22dd0d1fe63adcc3385" "93f0b6567a81c8b8fc0c4f392d30c7fdb28db53a85ee66a71cf310b5651ec026" *)
Parameter HSNo_proj0 : set -> set.
(* Parameter HSNo_proj1 "81f5dae94fac49982af4a0c462b3e9d69eb02246477a1551e3be564464718944" "bc3d4dcee444855807cb47ee5a8459dfdb0aec041c60bf915f6dbbb700f497e1" *)
Parameter HSNo_proj1 : set -> set.
(* Parameter conj_CSNo "f9e35ab050a51a27196d8b390e814e818302ed8a98f76b49e3126d2b643362f7" "f0317b853a5799dfcc8c1b80b61c63a878057a0cc57c6af584ed4cdd5a2eaf0f" *)
Parameter conj_CSNo : set -> set.
(* Parameter mul_CSNo "087bc0449c1b773fd802d9657db96e9f7370c4b8290db0e6101861175948d90a" "fbcd2a31a3d887d7c161aa2314509f533c62f1962052dc5160d2ce16b45844e4" *)
Parameter mul_CSNo : set -> set -> set.
(* Parameter minus_CSNo "4f92a9e0271ddb1267597c692d8047b29044e7c0c576fb35221fc05e8cc2e169" "84edf6250efa183daa5d97710793416c455289f25e5c4ff24b9316496cb3edcc" *)
Parameter minus_CSNo : set -> set.
(* Parameter add_CSNo "ce57e9d433ea923a64c5407464e1f301a0771389be6c3ee536319b8514b2986d" "1c8cce54f37fca653d20d5415ed4bc13353c15f33bfd0589f5ec9ffc056ac705" *)
Parameter add_CSNo : set -> set -> set.
Axiom HSNo_proj0proj1_split : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo_proj0 x0 = HSNo_proj0 x1 -> HSNo_proj1 x0 = HSNo_proj1 x1 -> x0 = x1).
Axiom mul_HSNo_proj0 : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo_proj0 (mul_HSNo x0 x1) = add_CSNo (mul_CSNo (HSNo_proj0 x0) (HSNo_proj0 x1)) (minus_CSNo (mul_CSNo (conj_CSNo (HSNo_proj1 x1)) (HSNo_proj1 x0)))).
Axiom mul_HSNo_proj1 : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo_proj1 (mul_HSNo x0 x1) = add_CSNo (mul_CSNo (HSNo_proj1 x1) (HSNo_proj0 x0)) (mul_CSNo (HSNo_proj1 x0) (conj_CSNo (HSNo_proj0 x1)))).
Axiom add_CSNo_assoc : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo (add_CSNo x0 x1) x2 = add_CSNo x0 (add_CSNo x1 x2)).
Axiom mul_CSNo_distrL : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (add_CSNo x1 x2) = add_CSNo (mul_CSNo x0 x1) (mul_CSNo x0 x2)).
Axiom minus_mul_CSNo_distrR : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 (minus_CSNo x1) = minus_CSNo (mul_CSNo x0 x1)).
Axiom conj_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> conj_CSNo (add_CSNo x0 x1) = add_CSNo (conj_CSNo x0) (conj_CSNo x1)).
Axiom conj_mul_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> conj_CSNo (mul_CSNo x0 x1) = mul_CSNo (conj_CSNo x1) (conj_CSNo x0)).
Axiom conj_CSNo_invol : (forall x0, CSNo x0 -> conj_CSNo (conj_CSNo x0) = x0).
Axiom mul_CSNo_distrR : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo (add_CSNo x0 x1) x2 = add_CSNo (mul_CSNo x0 x2) (mul_CSNo x1 x2)).
Axiom mul_CSNo_assoc : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo (mul_CSNo x0 x1) x2).
Axiom minus_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> minus_CSNo (add_CSNo x0 x1) = add_CSNo (minus_CSNo x0) (minus_CSNo x1)).
Axiom add_CSNo_rotate_3_1 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo x0 (add_CSNo x1 x2) = add_CSNo x2 (add_CSNo x0 x1)).
Axiom mul_CSNo_rotate_3_1 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo x2 (mul_CSNo x0 x1)).
Axiom minus_mul_CSNo_distrL : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo (minus_CSNo x0) x1 = minus_CSNo (mul_CSNo x0 x1)).
Axiom conj_minus_CSNo : (forall x0, CSNo x0 -> conj_CSNo (minus_CSNo x0) = minus_CSNo (conj_CSNo x0)).
Axiom mul_CSNo_com : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 x1 = mul_CSNo x1 x0).
Axiom CSNo_minus_CSNo : (forall x0, CSNo x0 -> CSNo (minus_CSNo x0)).
Axiom CSNo_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (add_CSNo x0 x1)).
Axiom CSNo_mul_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (mul_CSNo x0 x1)).
Axiom CSNo_conj_CSNo : (forall x0, CSNo x0 -> CSNo (conj_CSNo x0)).
Axiom HSNo_proj1R : (forall x0, HSNo x0 -> CSNo (HSNo_proj1 x0)).
Axiom HSNo_proj0R : (forall x0, HSNo x0 -> CSNo (HSNo_proj0 x0)).
Axiom HSNo_mul_HSNo : (forall x0 x1, HSNo x0 -> HSNo x1 -> HSNo (mul_HSNo x0 x1)).
Theorem mul_HSNo_assoc : (forall x0 x1 x2, HSNo x0 -> HSNo x1 -> HSNo x2 -> mul_HSNo x0 (mul_HSNo x1 x2) = mul_HSNo (mul_HSNo x0 x1) x2).
admit.
Qed.
