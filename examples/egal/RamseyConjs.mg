Definition False : prop := forall p:prop, p.

Definition not : prop -> prop := fun A:prop => A -> False.

(* Unicode ~ "00ac" *)
Prefix ~ 700 := not.

Definition and : prop -> prop -> prop := fun A B:prop => forall p:prop, (A -> B -> p) -> p.

(* Unicode /\ "2227" *)
Infix /\ 780 left := and.

Definition or : prop -> prop -> prop := fun A B:prop => forall p:prop, (A -> p) -> (B -> p) -> p.

(* Unicode \/ "2228" *)
Infix \/ 785 left := or.

Section Eq.
Variable A:SType.
Definition eq : A->A->prop := fun x y:A => forall Q:A->A->prop, Q x y -> Q y x.
Definition neq : A->A->prop := fun x y:A => ~ eq x y.
End Eq.

Infix = 502 := eq.
(* Unicode <> "2260" *)
Infix <> 502 := neq.

Section Ex.
Variable A:SType.
Definition ex : (A->prop)->prop := fun Q:A->prop => forall P:prop, (forall x:A, Q x -> P) -> P.
End Ex.

(* Unicode exists "2203" *)
Binder+ exists , := ex.

Parameter In:set->set->prop.

Definition Subq : set -> set -> prop := fun A B => forall x :e A, x :e B.

Binder+ exists , := ex; and.

(* Unicode Power "1D4AB" *)
Parameter Power : set->set.

Parameter Empty : set.

(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set->set.

Notation Nat Empty ordsucc.

Definition bij : set->set->(set->set)->prop :=
  fun X Y f =>
  (forall u :e X, f u :e Y)
  /\
  (forall u v :e X, f u = f v -> u = v)
  /\
  (forall w :e Y, exists u :e X, f u = w).

Definition equip : set -> set -> prop
 := fun X Y : set => exists f : set -> set, bij X Y f.

Definition TwoRamseyProp : set -> set -> set -> prop
 := fun M N V =>
      forall R:set -> set -> prop,
        (forall x y, R x y -> R y x)
       -> ((exists X c= V, equip M X /\ (forall x y :e X, x <> y -> R x y))
        \/ (exists Y c= V, equip N Y /\ (forall x y :e Y, x <> y -> ~R x y))).

Theorem not_TwoRamseyProp_3_3_5 : ~TwoRamseyProp 3 3 5.
Admitted.

Theorem TwoRamseyProp_3_3_6: TwoRamseyProp 3 3 6.
Admitted.

Theorem not_TwoRamseyProp_3_4_8 : ~TwoRamseyProp 3 4 8.
Admitted.

Theorem not_TwoRamseyProp_3_5_13 : ~TwoRamseyProp 3 5 13.
Admitted.

Theorem not_TwoRamseyProp_3_6_17 : ~TwoRamseyProp 3 6 17.
Admitted.

Theorem not_TwoRamseyProp_3_7_22 : ~TwoRamseyProp 3 7 22.
Admitted.

Theorem not_TwoRamseyProp_3_8_27 : ~TwoRamseyProp 3 8 27.
Admitted.

Theorem not_TwoRamseyProp_3_9_35 : ~TwoRamseyProp 3 9 35.
Admitted.

Theorem not_TwoRamseyProp_3_10_39 : ~TwoRamseyProp 3 10 39.
Admitted.

Theorem not_TwoRamseyProp_4_4_17 : ~TwoRamseyProp 4 4 17.
Admitted.

Theorem not_TwoRamseyProp_4_5_24 : ~TwoRamseyProp 4 5 24.
Admitted.

Theorem not_TwoRamseyProp_4_6_35 : ~TwoRamseyProp 4 6 35.
Admitted.

Theorem not_TwoRamseyProp_4_7_48 : ~TwoRamseyProp 4 7 48.
Admitted.

Theorem not_TwoRamseyProp_4_8_58 : ~TwoRamseyProp 4 8 58.
Admitted.

Theorem not_TwoRamseyProp_4_9_72 : ~TwoRamseyProp 4 9 72.
Admitted.

Theorem not_TwoRamseyProp_5_5_42 : ~TwoRamseyProp 5 5 42.
Admitted.

Theorem not_TwoRamseyProp_5_6_57 : ~TwoRamseyProp 5 6 57.
Admitted.

Theorem not_TwoRamseyProp_5_7_79 : ~TwoRamseyProp 5 7 79.
Admitted.

Theorem not_TwoRamseyProp_5_8_100 : ~TwoRamseyProp 5 8 100.
Admitted.

Theorem not_TwoRamseyProp_6_6_101 : ~TwoRamseyProp 6 6 101.
Admitted.

Theorem not_TwoRamseyProp_6_7_114 : ~TwoRamseyProp 6 7 114.
Admitted.

Theorem TwoRamseyProp_3_4_9 : TwoRamseyProp 3 4 9.
Admitted.

Theorem TwoRamseyProp_3_5_14 : TwoRamseyProp 3 5 14.
Admitted.

Theorem TwoRamseyProp_3_6_18 : TwoRamseyProp 3 6 18.
Admitted.

Theorem TwoRamseyProp_3_7_23 : TwoRamseyProp 3 7 23.
Admitted.

Theorem TwoRamseyProp_3_8_28 : TwoRamseyProp 3 8 28.
Admitted.

Theorem TwoRamseyProp_3_9_36 : TwoRamseyProp 3 9 36.
Admitted.

Theorem TwoRamseyProp_3_10_42 : TwoRamseyProp 3 10 42.
Admitted.

Theorem TwoRamseyProp_4_4_18 : TwoRamseyProp 4 4 18.
Admitted.

Theorem TwoRamseyProp_4_5_25 : TwoRamseyProp 4 5 25.
Admitted.

Theorem TwoRamseyProp_4_6_41 : TwoRamseyProp 4 6 41.
Admitted.

Theorem TwoRamseyProp_4_7_61 : TwoRamseyProp 4 7 61.
Admitted.

Theorem TwoRamseyProp_4_8_84 : TwoRamseyProp 4 8 84.
Admitted.

Theorem TwoRamseyProp_4_9_115 : TwoRamseyProp 4 9 115.
Admitted.

Theorem TwoRamseyProp_5_5_48 : TwoRamseyProp 5 5 48.
Admitted.

Theorem TwoRamseyProp_5_6_87 : TwoRamseyProp 5 6 87.
Admitted.

Theorem TwoRamseyProp_5_7_143 : TwoRamseyProp 5 7 143.
Admitted.

Theorem TwoRamseyProp_5_8_216 : TwoRamseyProp 5 8 216.
Admitted.

Theorem TwoRamseyProp_6_6_165 : TwoRamseyProp 6 6 165.
Admitted.

Theorem TwoRamseyProp_6_7_298 : TwoRamseyProp 6 7 298.
Admitted.

Theorem not_TwoRamseyProp_3_5_Power_3 : ~TwoRamseyProp 3 5 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_3_6_Power_3 : ~TwoRamseyProp 3 6 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_3_6_Power_4 : ~TwoRamseyProp 3 6 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_3_7_Power_3 : ~TwoRamseyProp 3 7 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_3_7_Power_4 : ~TwoRamseyProp 3 7 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_3_8_Power_3 : ~TwoRamseyProp 3 8 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_3_8_Power_4 : ~TwoRamseyProp 3 8 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_3_9_Power_3 : ~TwoRamseyProp 3 9 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_3_9_Power_4 : ~TwoRamseyProp 3 9 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_3_9_Power_5 : ~TwoRamseyProp 3 9 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_3_10_Power_3 : ~TwoRamseyProp 3 10 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_3_10_Power_4 : ~TwoRamseyProp 3 10 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_3_10_Power_5 : ~TwoRamseyProp 3 10 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_4_4_Power_3 : ~TwoRamseyProp 4 4 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_4_4_Power_4 : ~TwoRamseyProp 4 4 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_4_5_Power_3 : ~TwoRamseyProp 4 5 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_4_5_Power_4 : ~TwoRamseyProp 4 5 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_4_6_Power_3 : ~TwoRamseyProp 4 6 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_4_6_Power_4 : ~TwoRamseyProp 4 6 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_4_6_Power_5 : ~TwoRamseyProp 4 6 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_4_7_Power_3 : ~TwoRamseyProp 4 7 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_4_7_Power_4 : ~TwoRamseyProp 4 7 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_4_7_Power_5 : ~TwoRamseyProp 4 7 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_4_8_Power_3 : ~TwoRamseyProp 4 8 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_4_8_Power_4 : ~TwoRamseyProp 4 8 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_4_8_Power_5 : ~TwoRamseyProp 4 8 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_4_9_Power_3 : ~TwoRamseyProp 4 9 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_4_9_Power_4 : ~TwoRamseyProp 4 9 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_4_9_Power_5 : ~TwoRamseyProp 4 9 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_4_9_Power_6 : ~TwoRamseyProp 4 9 (Power 6).
Admitted.

Theorem not_TwoRamseyProp_5_5_Power_3 : ~TwoRamseyProp 5 5 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_5_5_Power_4 : ~TwoRamseyProp 5 5 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_5_5_Power_5 : ~TwoRamseyProp 5 5 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_5_6_Power_3 : ~TwoRamseyProp 5 6 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_5_6_Power_4 : ~TwoRamseyProp 5 6 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_5_6_Power_5 : ~TwoRamseyProp 5 6 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_5_7_Power_3 : ~TwoRamseyProp 5 7 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_5_7_Power_4 : ~TwoRamseyProp 5 7 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_5_7_Power_5 : ~TwoRamseyProp 5 7 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_5_7_Power_6 : ~TwoRamseyProp 5 7 (Power 6).
Admitted.

Theorem not_TwoRamseyProp_5_8_Power_3 : ~TwoRamseyProp 5 8 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_5_8_Power_4 : ~TwoRamseyProp 5 8 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_5_8_Power_5 : ~TwoRamseyProp 5 8 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_5_8_Power_6 : ~TwoRamseyProp 5 8 (Power 6).
Admitted.

Theorem not_TwoRamseyProp_6_6_Power_3 : ~TwoRamseyProp 6 6 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_6_6_Power_4 : ~TwoRamseyProp 6 6 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_6_6_Power_5 : ~TwoRamseyProp 6 6 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_6_6_Power_6 : ~TwoRamseyProp 6 6 (Power 6).
Admitted.

Theorem not_TwoRamseyProp_6_7_Power_3 : ~TwoRamseyProp 6 7 (Power 3).
Admitted.

Theorem not_TwoRamseyProp_6_7_Power_4 : ~TwoRamseyProp 6 7 (Power 4).
Admitted.

Theorem not_TwoRamseyProp_6_7_Power_5 : ~TwoRamseyProp 6 7 (Power 5).
Admitted.

Theorem not_TwoRamseyProp_6_7_Power_6 : ~TwoRamseyProp 6 7 (Power 6).
Admitted.

Theorem TwoRamseyProp_3_4_Power_4 : TwoRamseyProp 3 4 (Power 4).
Admitted.

Theorem TwoRamseyProp_3_4_Power_5 : TwoRamseyProp 3 4 (Power 5).
Admitted.

Theorem TwoRamseyProp_3_4_Power_6 : TwoRamseyProp 3 4 (Power 6).
Admitted.

Theorem TwoRamseyProp_3_4_Power_7 : TwoRamseyProp 3 4 (Power 7).
Admitted.

Theorem TwoRamseyProp_3_4_Power_8 : TwoRamseyProp 3 4 (Power 8).
Admitted.

Theorem TwoRamseyProp_3_5_Power_4 : TwoRamseyProp 3 5 (Power 4).
Admitted.

Theorem TwoRamseyProp_3_5_Power_5 : TwoRamseyProp 3 5 (Power 5).
Admitted.

Theorem TwoRamseyProp_3_5_Power_6 : TwoRamseyProp 3 5 (Power 6).
Admitted.

Theorem TwoRamseyProp_3_5_Power_7 : TwoRamseyProp 3 5 (Power 7).
Admitted.

Theorem TwoRamseyProp_3_5_Power_8 : TwoRamseyProp 3 5 (Power 8).
Admitted.

Theorem TwoRamseyProp_3_6_Power_5 : TwoRamseyProp 3 6 (Power 5).
Admitted.

Theorem TwoRamseyProp_3_6_Power_6 : TwoRamseyProp 3 6 (Power 6).
Admitted.

Theorem TwoRamseyProp_3_6_Power_7 : TwoRamseyProp 3 6 (Power 7).
Admitted.

Theorem TwoRamseyProp_3_6_Power_8 : TwoRamseyProp 3 6 (Power 8).
Admitted.

Theorem TwoRamseyProp_3_7_Power_5 : TwoRamseyProp 3 7 (Power 5).
Admitted.

Theorem TwoRamseyProp_3_7_Power_6 : TwoRamseyProp 3 7 (Power 6).
Admitted.

Theorem TwoRamseyProp_3_7_Power_7 : TwoRamseyProp 3 7 (Power 7).
Admitted.

Theorem TwoRamseyProp_3_7_Power_8 : TwoRamseyProp 3 7 (Power 8).
Admitted.

Theorem TwoRamseyProp_3_8_Power_5 : TwoRamseyProp 3 8 (Power 5).
Admitted.

Theorem TwoRamseyProp_3_8_Power_6 : TwoRamseyProp 3 8 (Power 6).
Admitted.

Theorem TwoRamseyProp_3_8_Power_7 : TwoRamseyProp 3 8 (Power 7).
Admitted.

Theorem TwoRamseyProp_3_8_Power_8 : TwoRamseyProp 3 8 (Power 8).
Admitted.

Theorem TwoRamseyProp_3_9_Power_6 : TwoRamseyProp 3 9 (Power 6).
Admitted.

Theorem TwoRamseyProp_3_9_Power_7 : TwoRamseyProp 3 9 (Power 7).
Admitted.

Theorem TwoRamseyProp_3_9_Power_8 : TwoRamseyProp 3 9 (Power 8).
Admitted.

Theorem TwoRamseyProp_3_10_Power_6 : TwoRamseyProp 3 10 (Power 6).
Admitted.

Theorem TwoRamseyProp_3_10_Power_7 : TwoRamseyProp 3 10 (Power 7).
Admitted.

Theorem TwoRamseyProp_3_10_Power_8 : TwoRamseyProp 3 10 (Power 8).
Admitted.

Theorem TwoRamseyProp_4_4_Power_5 : TwoRamseyProp 4 4 (Power 5).
Admitted.

Theorem TwoRamseyProp_4_4_Power_6 : TwoRamseyProp 4 4 (Power 6).
Admitted.

Theorem TwoRamseyProp_4_4_Power_7 : TwoRamseyProp 4 4 (Power 7).
Admitted.

Theorem TwoRamseyProp_4_4_Power_8 : TwoRamseyProp 4 4 (Power 8).
Admitted.

Theorem TwoRamseyProp_4_5_Power_5 : TwoRamseyProp 4 5 (Power 5).
Admitted.

Theorem TwoRamseyProp_4_5_Power_6 : TwoRamseyProp 4 5 (Power 6).
Admitted.

Theorem TwoRamseyProp_4_5_Power_7 : TwoRamseyProp 4 5 (Power 7).
Admitted.

Theorem TwoRamseyProp_4_5_Power_8 : TwoRamseyProp 4 5 (Power 8).
Admitted.

Theorem TwoRamseyProp_4_6_Power_6 : TwoRamseyProp 4 6 (Power 6).
Admitted.

Theorem TwoRamseyProp_4_6_Power_7 : TwoRamseyProp 4 6 (Power 7).
Admitted.

Theorem TwoRamseyProp_4_6_Power_8 : TwoRamseyProp 4 6 (Power 8).
Admitted.

Theorem TwoRamseyProp_4_7_Power_6 : TwoRamseyProp 4 7 (Power 6).
Admitted.

Theorem TwoRamseyProp_4_7_Power_7 : TwoRamseyProp 4 7 (Power 7).
Admitted.

Theorem TwoRamseyProp_4_7_Power_8 : TwoRamseyProp 4 7 (Power 8).
Admitted.

Theorem TwoRamseyProp_4_8_Power_7 : TwoRamseyProp 4 8 (Power 7).
Admitted.

Theorem TwoRamseyProp_4_8_Power_8 : TwoRamseyProp 4 8 (Power 8).
Admitted.

Theorem TwoRamseyProp_4_9_Power_7 : TwoRamseyProp 4 9 (Power 7).
Admitted.

Theorem TwoRamseyProp_4_9_Power_8 : TwoRamseyProp 4 9 (Power 8).
Admitted.

Theorem TwoRamseyProp_5_5_Power_6 : TwoRamseyProp 5 5 (Power 6).
Admitted.

Theorem TwoRamseyProp_5_5_Power_7 : TwoRamseyProp 5 5 (Power 7).
Admitted.

Theorem TwoRamseyProp_5_5_Power_8 : TwoRamseyProp 5 5 (Power 8).
Admitted.

Theorem TwoRamseyProp_5_6_Power_7 : TwoRamseyProp 5 6 (Power 7).
Admitted.

Theorem TwoRamseyProp_5_6_Power_8 : TwoRamseyProp 5 6 (Power 8).
Admitted.

Theorem TwoRamseyProp_5_7_Power_8 : TwoRamseyProp 5 7 (Power 8).
Admitted.

Theorem TwoRamseyProp_5_8_Power_8 : TwoRamseyProp 5 8 (Power 8).
Admitted.

Theorem TwoRamseyProp_6_6_Power_8 : TwoRamseyProp 6 6 (Power 8).
Admitted.

Theorem TwoRamseyProp_3_10_40 : TwoRamseyProp 3 10 40.
Admitted.

Theorem TwoRamseyProp_3_10_41 : TwoRamseyProp 3 10 41.
Admitted.

Theorem TwoRamseyProp_4_6_36 : TwoRamseyProp 4 6 36.
Admitted.

Theorem TwoRamseyProp_4_6_40 : TwoRamseyProp 4 6 40.
Admitted.

Theorem TwoRamseyProp_4_7_49 : TwoRamseyProp 4 7 49.
Admitted.

Theorem TwoRamseyProp_4_7_60 : TwoRamseyProp 4 7 60.
Admitted.

Theorem TwoRamseyProp_4_8_59 : TwoRamseyProp 4 8 59.
Admitted.

Theorem TwoRamseyProp_4_8_83 : TwoRamseyProp 4 8 83.
Admitted.

Theorem TwoRamseyProp_4_9_73 : TwoRamseyProp 4 9 73.
Admitted.

Theorem TwoRamseyProp_4_9_114 : TwoRamseyProp 4 9 114.
Admitted.

Theorem TwoRamseyProp_5_5_43 : TwoRamseyProp 5 5 43.
Admitted.

Theorem TwoRamseyProp_5_5_47 : TwoRamseyProp 5 5 47.
Admitted.

Theorem TwoRamseyProp_5_6_58 : TwoRamseyProp 5 6 58.
Admitted.

Theorem TwoRamseyProp_5_6_86 : TwoRamseyProp 5 6 86.
Admitted.

Theorem TwoRamseyProp_5_7_80 : TwoRamseyProp 5 7 80.
Admitted.

Theorem TwoRamseyProp_5_7_142 : TwoRamseyProp 5 7 142.
Admitted.

Theorem TwoRamseyProp_5_8_101 : TwoRamseyProp 5 8 101.
Admitted.

Theorem TwoRamseyProp_5_8_215 : TwoRamseyProp 5 8 215.
Admitted.

Theorem TwoRamseyProp_6_6_102 : TwoRamseyProp 6 6 102.
Admitted.

Theorem TwoRamseyProp_6_6_164 : TwoRamseyProp 6 6 164.
Admitted.

Theorem TwoRamseyProp_6_7_115 : TwoRamseyProp 6 7 115.
Admitted.

Theorem TwoRamseyProp_6_7_297 : TwoRamseyProp 6 7 297.
Admitted.
