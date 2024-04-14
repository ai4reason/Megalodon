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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Axiom nat_12 : nat_p 12.
Theorem nat_13 : nat_p 13.
admit.
Qed.
Theorem nat_14 : nat_p 14.
admit.
Qed.
Theorem nat_15 : nat_p 15.
admit.
Qed.
Theorem nat_16 : nat_p 16.
admit.
Qed.
Theorem nat_17 : nat_p 17.
admit.
Qed.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_65854e80dcdfdaad216d9278c1826bfa6e412eacf7818f3d49e43d93a23f7bcf : (forall x0 x1, nat_p x1 -> x0 :e ordsucc (add_nat x0 x1)).
admit.
Qed.
Axiom nat_0 : nat_p 0.
Theorem missingprop_6e522a8d6c2c21411a1f6892eda5e9e1011183dabdf353829bb130057f8fb7ab : add_nat 23 1 = 24.
admit.
Qed.
Axiom nat_1 : nat_p 1.
Theorem missingprop_ce69cebe79088a6585ff795a65ba13cf6426d1636b1bc3098a8876653d3436e8 : add_nat 23 2 = 25.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Theorem missingprop_668a3d5744c9ccc7cd57b0cb136cdcea660bf142953e5128607d689b8007d835 : add_nat 23 3 = 26.
admit.
Qed.
Axiom nat_3 : nat_p 3.
Theorem missingprop_fc2dff20c418d315ed1ee1a90297f8fa2b8024f22a977c86a170aa4e20bb32ea : add_nat 23 4 = 27.
admit.
Qed.
Axiom nat_4 : nat_p 4.
Theorem missingprop_37a92659c834135ae38285da53e3655ed23741ed33e554d83bd74e4837cf2085 : add_nat 23 5 = 28.
admit.
Qed.
Axiom nat_5 : nat_p 5.
Theorem missingprop_871e0fd22ad232d9b57c50a753f21fb2765a1d18c9b261d6507e25ddb29c0adb : add_nat 23 6 = 29.
admit.
Qed.
Axiom nat_6 : nat_p 6.
Theorem missingprop_0ee4fa6dcc95212d2cb99e26434cded17dc43098a534e31c835c593428bcb471 : add_nat 23 7 = 30.
admit.
Qed.
Axiom nat_7 : nat_p 7.
Theorem missingprop_1a8ef7119409201047d8cb04fc57c6c2b31fe9c149f99c6d6378838840c55565 : add_nat 23 8 = 31.
admit.
Qed.
Axiom nat_8 : nat_p 8.
Theorem missingprop_17f884ddc3f039c0d5a0568a967dbdbf216b15afe5c273c30b000f89c3e3142a : 23 :e 32.
admit.
Qed.
Theorem missingprop_1c99b17bc3dafa3f7f36288d2a286fc6170243f799e7185e2205cd7ab766d27f : add_nat 24 1 = 25.
admit.
Qed.
Theorem missingprop_132569bc8d1f2bbf6051dff0240f643b4eb8610cef8ec4f8c4e4e476a414f68f : add_nat 24 2 = 26.
admit.
Qed.
Theorem missingprop_7c5e75e5d893b4e29b1d5799bf0f9a1bc22e9cfe4b384ba66b72dea99d0b71e6 : add_nat 24 3 = 27.
admit.
Qed.
Theorem missingprop_43b9f7fa7f82ec089df5e7d46e18af08cb514641b76895a5a980ea67ef937a0b : add_nat 24 4 = 28.
admit.
Qed.
Theorem missingprop_eb5b7295a54216d8a4505aa2a1878d55376736ed53e9558ac48494481ed4949d : add_nat 24 5 = 29.
admit.
Qed.
Theorem missingprop_53b5d6a493506e855393f47f611cdb01725e1da6599106a059647b3426c60f8b : add_nat 24 6 = 30.
admit.
Qed.
Theorem missingprop_0ab0f3bd8351c27d763063f15ec4b3e9dd38d8c64505f2de3a82cb8384f460b9 : add_nat 24 7 = 31.
admit.
Qed.
Theorem missingprop_517d6d8aecf883bffffb5e65645f1bfa2f40dec14b5ac3b5b3dc9b93db3c1ef5 : 24 :e 32.
admit.
Qed.
