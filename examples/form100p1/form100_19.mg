Infix + 360 right := add_nat.
Infix * 355 right := mul_nat.

Theorem form100_19_v1: forall n :e omega, exists w x y z :e omega, n = w * w + x * x + y * y + z * z.
Admitted.

Infix ^ 342 right := exp_nat.

Theorem form100_19_v2: forall n :e omega, exists w x y z :e omega, n = w ^ 2 + x ^ 2 + y ^ 2 + z ^ 2.
Admitted.

(** finite cardinality version **)
Theorem form100_19_v3: forall N, finite N -> exists W X Y Z, finite W /\ finite X /\ finite Y /\ finite Z /\ equip N (W :^: 2 :+: X :^: 2 :+: Y :^: 2 :+: Z :^: 2).
Admitted.

Section explicit_Nats_zero.

Variable N : set.
Variable zero : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_zero_plus N zero S.
Infix * 355 right := explicit_Nats_zero_mult N zero S.

Hypothesis HN: explicit_Nats N zero S.

Theorem form100_19_v4 : forall n :e N, exists w x y z :e N, n = w * w + x * x + y * y + z * z.
Admitted.

End explicit_Nats_zero.

Section explicit_Nats_one.

Variable N : set.
Variable one : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_one_plus N one S.
Infix * 355 right := explicit_Nats_one_mult N one S.
Infix ^ 342 right := explicit_Nats_one_exp N one S.

Hypothesis HN: explicit_Nats N one S.

Let two := S one.

Theorem form100_19_v5 : forall n :e N, exists w x y z :e N, n = w ^ two + x ^ two + y ^ two + z ^ two.
Admitted.

End explicit_Nats_one.
