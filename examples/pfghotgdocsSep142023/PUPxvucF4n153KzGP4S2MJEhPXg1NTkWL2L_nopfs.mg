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
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
(* Parameter TwoRamseyGraph_4_6_Church6_squared_b "f0613075cf2c8e12b3b9b185e03d97ed180930a161841752b5dd6458da73341b" "e73271112c979d5c0e9c9345f7d93a63015c1e7231d69df1ea1f24bf25f50380" *)
Parameter TwoRamseyGraph_4_6_Church6_squared_b : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set.
(* Parameter nth_6_tuple "368935f3a5f424f35961c43f39985442e0a4fe403f656e92d8a87b20af68c0d7" "d45c1fe6a3dff7795ce0a3b891aea8946efc8dceebae3c8b8977b41878b0e841" *)
Parameter nth_6_tuple : set -> set -> set -> set -> set -> set -> set -> set.
Definition TwoRamseyGraph_4_6_35_b : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => x0 :e u6 -> x1 :e u6 -> x2 :e u6 -> x3 :e u6 -> TwoRamseyGraph_4_6_Church6_squared_b (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3) = (fun x5 x6 : set => x5)).
(* Parameter Church6_p "d674aae9b36429b77aa0beac613e8e3128541a54504e9f2add615405e55adb13" "d09d227a13baf82dd9fb97506200eec56009ace6e9b5e539a544c04594b1dd10" *)
Parameter Church6_p : (set -> set -> set -> set -> set -> set -> set) -> prop.
(* Parameter Church6_to_u6 "f4d68b947c391fb202fb8df5218ea17bcff67d9bbb507885bfc603a34fd5f054" "eb5db5f738ad7aa7a16e5fd9f1201ca51305373920f987771a6afffbc5cda3de" *)
Parameter Church6_to_u6 : (set -> set -> set -> set -> set -> set -> set) -> set.
Axiom missingprop_4c4a30cb28bcd21744eec16e4ab4637f15035a845cbbb0ffbe052be5f3b1352d : (forall x0, x0 :e u6 -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set -> set -> set, Church6_p x2 -> x0 = Church6_to_u6 x2 -> x1) -> x1)).
Axiom missingprop_1df6cb25245842ac80f846f984ad1ab224979cc48aebddb9e27917721a4b0bdb : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> nth_6_tuple (Church6_to_u6 x0) = x0).
Axiom missingprop_a6b94d39e112543346fd3d628055520b18b2a8c0ff7c088a719d9dfd3d3e8e01 : (forall x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> Church6_p x1 -> Church6_p x2 -> Church6_p x3 -> TwoRamseyGraph_4_6_Church6_squared_b x0 x1 x2 x3 = (fun x5 x6 : set => x5) -> TwoRamseyGraph_4_6_Church6_squared_b x2 x3 x0 x1 = (fun x5 x6 : set => x5)).
Theorem missingprop_aeea293981c3c9af6808280e398d9e4b6ef422e5dcd2713bbb45b479ee30e903 : (forall x0 x1 x2 x3, TwoRamseyGraph_4_6_35_b x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_b x2 x3 x0 x1).
admit.
Qed.
