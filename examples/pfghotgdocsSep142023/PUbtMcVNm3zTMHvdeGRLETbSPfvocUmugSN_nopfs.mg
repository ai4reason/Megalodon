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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom In_0_2 : 0 :e 2.
Axiom In_1_2 : 1 :e 2.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Theorem missingprop_1ed5dd31a6893031cedd523796162cde72ae1a08553971825f2baf17c474b9eb : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, (forall x9, x9 :e x8 -> (forall x10 : set -> prop, x10 x0 -> x10 x1 -> x10 x2 -> x10 x3 -> x10 x4 -> x10 x5 -> x10 x6 -> x10 x7 -> x10 x9)) -> (forall x9, x9 c= x8 -> atleastp 2 x9 -> (forall x10 : prop, (x0 :e x9 -> x1 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x5 :e x9 -> x10) -> (x2 :e x9 -> x5 :e x9 -> x10) -> (x3 :e x9 -> x5 :e x9 -> x10) -> (x4 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x6 :e x9 -> x10) -> (x3 :e x9 -> x6 :e x9 -> x10) -> (x4 :e x9 -> x6 :e x9 -> x10) -> (x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x7 :e x9 -> x10) -> (x4 :e x9 -> x7 :e x9 -> x10) -> (x5 :e x9 -> x7 :e x9 -> x10) -> (x6 :e x9 -> x7 :e x9 -> x10) -> x10))).
admit.
Qed.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom In_2_3 : 2 :e 3.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom setminusI : (forall x0 x1 x2, x2 :e x0 -> nIn x2 x1 -> x2 :e setminus x0 x1).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom nat_3 : nat_p 3.
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom setminus_Subq : (forall x0 x1, setminus x0 x1 c= x0).
Theorem missingprop_5ec2a42239da54515a499b976316dfe7e7383ee177e7a32ce22f1b4b1bf14b9c : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, (forall x9, x9 :e x8 -> (forall x10 : set -> prop, x10 x0 -> x10 x1 -> x10 x2 -> x10 x3 -> x10 x4 -> x10 x5 -> x10 x6 -> x10 x7 -> x10 x9)) -> (forall x9, x9 c= x8 -> atleastp 3 x9 -> (forall x10 : prop, (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x4 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> x10))).
admit.
Qed.
Axiom In_3_4 : 3 :e 4.
Axiom nat_4 : nat_p 4.
Theorem missingprop_588e79272611c60a352b7dba244bb249c0313cc91d2c075de4434370a6777385 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8, (forall x9, x9 :e x8 -> (forall x10 : set -> prop, x10 x0 -> x10 x1 -> x10 x2 -> x10 x3 -> x10 x4 -> x10 x5 -> x10 x6 -> x10 x7 -> x10 x9)) -> (forall x9, x9 c= x8 -> atleastp 4 x9 -> (forall x10 : prop, (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x2 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x3 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x4 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x5 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x1 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x2 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x2 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x3 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x3 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x3 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x4 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x0 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x1 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x2 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x3 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> (x4 :e x9 -> x5 :e x9 -> x6 :e x9 -> x7 :e x9 -> x10) -> x10))).
admit.
Qed.
