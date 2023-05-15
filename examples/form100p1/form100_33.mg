Infix + 360 right := add_nat.
Infix * 355 right := mul_nat.
Infix ^ 342 right := exp_nat.

Theorem FermatsLastTheorem_v1: forall x y z n :e omega, 0 :e x -> 0 :e y -> 0 :e z -> 2 :e n -> x ^ n + y ^ n <> z ^ n.
Admitted.

Section explicit_Nats_one.

Variable N : set.
Variable one : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_one_plus N one S.
Infix * 355 right := explicit_Nats_one_mult N one S.
Infix ^ 342 right := explicit_Nats_one_exp N one S.

Hypothesis HN: explicit_Nats N one S.

Let two := S one.

Theorem FermatsLastTheorem_v2_buggy: forall x y z n :e N, two < n -> x ^ n + y ^ n <> z ^ n.
Admitted.

Infix < 490 := explicit_Nats_one_lt N one S.

Theorem FermatsLastTheorem_v2: forall x y z n :e N, two < n -> x ^ n + y ^ n <> z ^ n.
Admitted.

End explicit_Nats_one.