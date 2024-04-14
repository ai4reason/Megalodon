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
Definition False : prop :=
 (forall x0 : prop, x0).
(* Parameter TwoRamseyGraph_4_6_Church6_squared_b "f0613075cf2c8e12b3b9b185e03d97ed180930a161841752b5dd6458da73341b" "e73271112c979d5c0e9c9345f7d93a63015c1e7231d69df1ea1f24bf25f50380" *)
Parameter TwoRamseyGraph_4_6_Church6_squared_b : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set.
(* Parameter TwoRamseyGraph_4_6_Church6_squared_a "70b68c440811243759b8b58f10e212c73c46e3d1fee29b1b7f1e5816ea8880f0" "e4c128d492933589c3cc92b565612fcec0e08141b66eea664bfaaeae59632b46" *)
Parameter TwoRamseyGraph_4_6_Church6_squared_a : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set.
(* Parameter missingname_a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772 "19018c380b66420394ca729649acf033fd428b60774d2c01e275f9300c6ad13c" "a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772" *)
Parameter missingname_a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772 : (set -> set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_b69dc6904f90dc392130f5cffb35724befc3edb7a85b57a79e7c523ca2900cb0 : (forall x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set, missingname_a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772 x0 -> Church6_p x1 -> Church6_p x2 -> Church6_p x3 -> (x2 = (fun x5 x6 x7 x8 x9 x10 : set => x10) -> x3 = (fun x5 x6 x7 x8 x9 x10 : set => x10) -> False) -> TwoRamseyGraph_4_6_Church6_squared_b x0 x1 x2 x3 = (fun x5 x6 : set => x5) -> TwoRamseyGraph_4_6_Church6_squared_a x0 x1 x2 x3 = (fun x5 x6 : set => x5)).
Axiom missingprop_b4d57e27d2e512a451dc25211a8e223b40ed9465fc8a3c8bd751dba0d369c058 : missingname_a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772 (fun x0 x1 x2 x3 x4 x5 : set => x0).
Axiom missingprop_f7c46973e8e993d589db2c7d2cbf123c412a9a004aa6a11277cf54d2a8c9b340 : missingname_a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772 (fun x0 x1 x2 x3 x4 x5 : set => x1).
Axiom missingprop_9e2647f605c0822439f82a64518aaad84df1ad743ac9deb222cb2ddb0fdd623d : missingname_a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772 (fun x0 x1 x2 x3 x4 x5 : set => x2).
Axiom missingprop_663da7d7e8a8abafb7c1a9461e9654cb1837513857a382d39546c7d9ed1c7389 : missingname_a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772 (fun x0 x1 x2 x3 x4 x5 : set => x3).
Axiom missingprop_f25dbc6efc9a35279a230530bfe7a44106f41d1b34b13f2451c96a7a5cd07bae : missingname_a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772 (fun x0 x1 x2 x3 x4 x5 : set => x4).
Axiom missingprop_e3f167e77ed4aabd6ed10c7578d487253aea4e3590616bc69f7594dde1efc576 : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set, missingname_a3f36bad79e57c9081031632e8600480e309d3c9330d5a15f3c8b4bec7c2d772 x0 -> Church6_p x1 -> Church6_p x2 -> (x1 = (fun x4 x5 x6 x7 x8 x9 : set => x9) -> x2 = (fun x4 x5 x6 x7 x8 x9 : set => x9) -> False) -> TwoRamseyGraph_4_6_Church6_squared_b (fun x4 x5 x6 x7 x8 x9 : set => x9) x0 x1 x2 = (fun x4 x5 : set => x4) -> TwoRamseyGraph_4_6_Church6_squared_a (fun x4 x5 x6 x7 x8 x9 : set => x9) x0 x1 x2 = (fun x4 x5 : set => x4)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
Theorem missingprop_f2d48ee9534d86444c35e60a86dde436b9e38736c69ef2e4a50b6b67dd56fe3d : (forall x0 x1 x2 x3 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> Church6_p x1 -> Church6_p x2 -> Church6_p x3 -> (x0 = (fun x5 x6 x7 x8 x9 x10 : set => x10) -> x1 = (fun x5 x6 x7 x8 x9 x10 : set => x10) -> False) -> (x2 = (fun x5 x6 x7 x8 x9 x10 : set => x10) -> x3 = (fun x5 x6 x7 x8 x9 x10 : set => x10) -> False) -> TwoRamseyGraph_4_6_Church6_squared_b x0 x1 x2 x3 = (fun x5 x6 : set => x5) -> TwoRamseyGraph_4_6_Church6_squared_a x0 x1 x2 x3 = (fun x5 x6 : set => x5)).
admit.
Qed.
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
(* Parameter u5 "2a783d5aa30540222437cf12bcd2250d09379447bbcfb2424ca047f449bf06b4" "81fa4107fe53377c8e9932359ab17b6be1f49b6646daa701ee0c5525e8489bca" *)
Parameter u5 : set.
(* Parameter nth_6_tuple "368935f3a5f424f35961c43f39985442e0a4fe403f656e92d8a87b20af68c0d7" "d45c1fe6a3dff7795ce0a3b891aea8946efc8dceebae3c8b8977b41878b0e841" *)
Parameter nth_6_tuple : set -> set -> set -> set -> set -> set -> set -> set.
Definition TwoRamseyGraph_4_6_35_b : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => x0 :e u6 -> x1 :e u6 -> x2 :e u6 -> x3 :e u6 -> TwoRamseyGraph_4_6_Church6_squared_b (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3) = (fun x5 x6 : set => x5)).
Definition TwoRamseyGraph_4_6_35_a : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => forall x4 : (set -> set -> set) -> (set -> set -> set) -> prop, x4 (TwoRamseyGraph_4_6_Church6_squared_a (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3)) (fun x5 x6 : set => x5) -> x4 (fun x5 x6 : set => x5) (TwoRamseyGraph_4_6_Church6_squared_a (nth_6_tuple x0) (nth_6_tuple x1) (nth_6_tuple x2) (nth_6_tuple x3))).
Axiom missingprop_90460311f4fb47844a8dd0d64a1306416f6a25ac4d465fc1811061f42791aace : (forall x0, x0 :e u6 -> Church6_p (nth_6_tuple x0)).
Axiom missingprop_d1ab6c05d827ab2f0497648eeb2e74b0b0260f4e004a74cbc06a5c0a175e4a2a : nth_6_tuple u5 = (fun x1 x2 x3 x4 x5 x6 : set => x6).
Axiom missingprop_c75cff31880a89a656c47e80c0af1903547ace73a8cd84857ca0750f4ef54c4b : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> nth_6_tuple x0 = nth_6_tuple x1 -> x0 = x1)).
Axiom In_5_6 : u5 :e u6.
Theorem missingprop_dd555d0d79f097ab12a5874ff70f768fa00c860d0a4c1ec86afe8fd5fdd1d3bf : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> (x0 = u5 -> x1 = u5 -> False) -> (x2 = u5 -> x3 = u5 -> False) -> TwoRamseyGraph_4_6_35_b x0 x1 x2 x3 -> TwoRamseyGraph_4_6_35_a x0 x1 x2 x3)))).
admit.
Qed.
