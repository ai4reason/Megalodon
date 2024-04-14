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
Definition TwoRamseyGraph_4_6_Church6_squared_a : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set => fun x4 x5 : set => x0 (x1 (x2 (x3 x4 x5 x4 x5 x4 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x4 x4 x5 x4 x5) (x3 x5 x5 x4 x4 x5 x5) (x3 x4 x5 x4 x4 x5 x4)) (x2 (x3 x5 x4 x5 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x5 x4 x4 x5 x4) (x3 x4 x5 x5 x4 x5 x4) (x3 x5 x5 x4 x4 x5 x5) (x3 x5 x4 x4 x4 x5 x4)) (x2 (x3 x4 x5 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x4 x5 x5 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x5) (x3 x4 x4 x4 x5 x5 x4)) (x2 (x3 x5 x4 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x4 x4 x5 x4 x5) (x3 x4 x4 x5 x5 x5 x5) (x3 x4 x4 x5 x4 x5 x4)) (x2 (x3 x4 x5 x5 x4 x4 x5) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x5 x5 x4 x4 x4) (x3 x4 x5 x5 x4 x4 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x5 x5 x5 x5 x4 x4)) (x2 (x3 x5 x4 x4 x5 x5 x4) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x4 x4 x5 x4 x4) (x3 x5 x4 x4 x5 x4 x4) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x5 x5 x5 x4 x4))) (x1 (x2 (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x5 x4 x5 x5 x4) (x3 x4 x5 x5 x5 x4 x5) (x3 x5 x4 x4 x4 x4 x5) (x3 x5 x4 x4 x5 x5 x4) (x3 x5 x4 x5 x5 x5 x4)) (x2 (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x4 x5 x4 x4 x5) (x3 x5 x4 x5 x5 x5 x4) (x3 x4 x5 x4 x4 x5 x4) (x3 x4 x5 x5 x4 x4 x5) (x3 x4 x5 x5 x5 x5 x4)) (x2 (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x4 x5 x5 x4) (x3 x5 x5 x4 x5 x4 x5) (x3 x4 x4 x5 x4 x5 x4) (x3 x4 x5 x5 x4 x5 x4) (x3 x5 x5 x5 x4 x5 x4)) (x2 (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x5 x4 x4 x5) (x3 x5 x5 x5 x4 x5 x4) (x3 x4 x4 x4 x5 x4 x5) (x3 x5 x4 x4 x5 x4 x5) (x3 x5 x5 x4 x5 x5 x4)) (x2 (x3 x4 x5 x4 x5 x5 x5) (x3 x5 x4 x5 x4 x4 x4) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x5 x4) (x3 x5 x4 x5 x4 x4 x4)) (x2 (x3 x5 x4 x5 x4 x5 x5) (x3 x4 x5 x4 x5 x4 x4) (x3 x4 x5 x4 x5 x5 x5) (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x4 x5) (x3 x4 x5 x4 x5 x4 x4))) (x1 (x2 (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x5 x5 x5 x4) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x4 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x5 x5) (x3 x5 x5 x4 x5 x4 x4)) (x2 (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x5 x5 x4 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x5 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x5) (x3 x5 x5 x5 x4 x4 x4)) (x2 (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x5 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x5 x4 x4 x5) (x3 x4 x4 x5 x5 x5 x5) (x3 x4 x5 x5 x5 x4 x4)) (x2 (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x5 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x4 x5 x5 x4) (x3 x4 x4 x5 x5 x5 x5) (x3 x5 x4 x5 x5 x4 x4)) (x2 (x3 x4 x5 x4 x5 x4 x4) (x3 x4 x5 x4 x5 x5 x5) (x3 x4 x5 x4 x5 x4 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x5 x5 x5 x5 x4)) (x2 (x3 x5 x4 x5 x4 x4 x4) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x4 x5 x4 x4 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x4 x5 x5 x5) (x3 x5 x5 x5 x5 x5 x4))) (x1 (x2 (x3 x5 x4 x4 x5 x4 x5) (x3 x5 x4 x4 x4 x5 x5) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x5 x4 x5 x5 x4) (x3 x4 x4 x5 x5 x4 x4)) (x2 (x3 x4 x5 x5 x4 x5 x4) (x3 x4 x5 x4 x4 x5 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x5 x5 x4 x4 x5) (x3 x4 x4 x5 x5 x4 x4)) (x2 (x3 x4 x5 x5 x4 x5 x4) (x3 x4 x4 x5 x4 x5 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x4 x5 x5 x5 x5 x4) (x3 x5 x5 x4 x4 x4 x4)) (x2 (x3 x5 x4 x4 x5 x4 x5) (x3 x4 x4 x4 x5 x5 x5) (x3 x5 x4 x4 x5 x5 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x4 x5 x5 x4 x5) (x3 x5 x5 x4 x4 x4 x4)) (x2 (x3 x4 x5 x5 x4 x4 x4) (x3 x4 x5 x5 x4 x4 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x5 x5 x4 x4 x5) (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x4 x5 x5 x4)) (x2 (x3 x5 x4 x4 x5 x4 x4) (x3 x5 x4 x4 x5 x4 x4) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x4 x4 x5 x5 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x5 x4 x5 x4))) (x1 (x2 (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x5 x4 x5 x5 x5) (x3 x4 x5 x4 x4 x5 x4) (x3 x4 x4 x5 x5 x5 x4)) (x2 (x3 x5 x5 x4 x4 x4 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x5 x5 x4 x5 x5) (x3 x5 x4 x4 x4 x4 x5) (x3 x4 x4 x5 x5 x5 x4)) (x2 (x3 x4 x4 x5 x5 x4 x5) (x3 x4 x5 x5 x4 x5 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x5 x5 x5 x5 x5) (x3 x4 x4 x4 x5 x5 x4) (x3 x5 x5 x4 x4 x5 x4)) (x2 (x3 x4 x4 x5 x5 x5 x4) (x3 x5 x4 x4 x5 x5 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x5 x4 x5 x5 x5 x5) (x3 x4 x4 x5 x4 x4 x5) (x3 x5 x5 x4 x4 x5 x4)) (x2 (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x5 x4 x5 x4) (x3 x5 x5 x5 x5 x5 x5) (x3 x5 x4 x5 x4 x5 x5) (x3 x5 x4 x5 x4 x4 x5) (x3 x4 x4 x4 x4 x4 x4)) (x2 (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x4 x5 x4 x5) (x3 x5 x5 x5 x5 x5 x5) (x3 x4 x5 x4 x5 x5 x5) (x3 x4 x5 x4 x5 x5 x4) (x3 x4 x4 x4 x4 x4 x4))) (x1 (x2 (x3 x4 x5 x4 x4 x5 x5) (x3 x5 x4 x5 x5 x5 x4) (x3 x5 x5 x4 x5 x5 x5) (x3 x4 x4 x5 x5 x5 x4) (x3 x4 x4 x5 x5 x4 x4) (x3 x4 x5 x5 x4 x5 x4)) (x2 (x3 x5 x4 x4 x4 x5 x5) (x3 x4 x5 x5 x5 x4 x5) (x3 x5 x5 x5 x4 x5 x5) (x3 x4 x4 x5 x5 x4 x5) (x3 x4 x4 x5 x5 x4 x4) (x3 x5 x4 x4 x5 x5 x4)) (x2 (x3 x4 x4 x4 x5 x5 x5) (x3 x5 x5 x5 x4 x5 x4) (x3 x4 x5 x5 x5 x5 x5) (x3 x5 x5 x4 x4 x4 x5) (x3 x5 x5 x4 x4 x4 x4) (x3 x5 x4 x4 x5 x5 x4)) (x2 (x3 x4 x4 x5 x4 x5 x5) (x3 x5 x5 x4 x5 x4 x5) (x3 x5 x4 x5 x5 x5 x5) (x3 x5 x5 x4 x4 x5 x4) (x3 x5 x5 x4 x4 x4 x4) (x3 x4 x5 x5 x4 x5 x4)) (x2 (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x4 x4) (x3 x4 x4 x4 x4 x5 x5) (x3 x4 x4 x4 x4 x5 x5) (x3 x5 x5 x5 x5 x4 x4) (x3 x5 x5 x5 x5 x4 x4)) (x2 (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4) (x3 x4 x4 x4 x4 x4 x4)))).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
Theorem missingprop_47da0888016e4abdf776e90f0c4d8acdbc20378a540bacd2cfd7afa4885f61a8 : (forall x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> Church6_p x1 -> Church6_p x2 -> Church6_p x3 -> TwoRamseyGraph_4_6_Church6_squared_a x0 x1 x2 x3 = (fun x5 x6 : set => x5) -> TwoRamseyGraph_4_6_Church6_squared_a x2 x3 x0 x1 = (fun x5 x6 : set => x5)).
admit.
Qed.
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
(* Parameter nth_6_tuple "368935f3a5f424f35961c43f39985442e0a4fe403f656e92d8a87b20af68c0d7" "d45c1fe6a3dff7795ce0a3b891aea8946efc8dceebae3c8b8977b41878b0e841" *)
Parameter nth_6_tuple : set -> set -> set -> set -> set -> set -> set -> set.
Definition TwoRamseyGraph_4_6_35_a : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => forall x4 : (set -> set -> set) -> (set -> set -> set) -> prop, x4 (TwoRamseyGraph_4_6_Church6_squared_a (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3)) (fun x5 x6 : set => x5) -> x4 (fun x5 x6 : set => x5) (TwoRamseyGraph_4_6_Church6_squared_a (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3))).
Axiom missingprop_90460311f4fb47844a8dd0d64a1306416f6a25ac4d465fc1811061f42791aace : (forall x0, x0 :e u6 -> Church6_p (nth_6_tuple x0)).
Theorem missingprop_e965020877de1572e3db7225f6e8e02cfdbb951b9add60ee17a78d890a36e854 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> TwoRamseyGraph_4_6_35_a x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_a x2 x3 x0 x1)))).
admit.
Qed.
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Theorem missingprop_b6a84b7ebbaa8d69766794784087726007c18055bd8d30fb9a04f65a21b0d61a : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> not (TwoRamseyGraph_4_6_35_a x0 x1 x2 x3) -> not (TwoRamseyGraph_4_6_35_a x2 x3 x0 x1))))).
admit.
Qed.
