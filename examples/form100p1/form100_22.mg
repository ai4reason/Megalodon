Theorem form100_22_v1: ~equip omega (Power omega).
Admitted.

Theorem form100_22_v2: forall f:set -> set, ~inj (Power omega) omega f.
Admitted.

Theorem form100_22_v3: forall g:set -> set, ~surj omega (Power omega) g.
Admitted.

Theorem form100_22_v4: ~equip omega (2 :^: omega).
Admitted.

Theorem form100_22_v5: forall f:set -> set, ~inj (2 :^: omega) omega f.
Admitted.

Theorem form100_22_v6: forall g:set -> set, ~surj omega (2 :^: omega) g.
Admitted.

Section explicit_Nats_zero.

Variable N : set.
Variable zero : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_zero_plus N zero S.
Infix * 355 right := explicit_Nats_zero_mult N zero S.

Hypothesis HN: explicit_Nats N zero S.

Theorem form100_22_v7: ~equip N (Power N).
Admitted.

Theorem form100_22_v8: forall f:set -> set, ~inj (Power N) N f.
Admitted.

Theorem form100_22_v9: forall g:set -> set, ~surj N (Power N) g.
Admitted.

Theorem form100_22_v10: ~equip N (2 :^: N).
Admitted.

Theorem form100_22_v11: forall f:set -> set, ~inj (2 :^: N) N f.
Admitted.

Theorem form100_22_v12: forall g:set -> set, ~surj N (2 :^: N) g.
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

Theorem form100_22_v13: ~equip N (Power N).
Admitted.

Theorem form100_22_v14: forall f:set -> set, ~inj (Power N) N f.
Admitted.

Theorem form100_22_v15: forall g:set -> set, ~surj N (Power N) g.
Admitted.

Theorem form100_22_v16: ~equip N (2 :^: N).
Admitted.

Theorem form100_22_v17: forall f:set -> set, ~inj (Power N) N f.
Admitted.

Theorem form100_22_v18: forall g:set -> set, ~surj N (Power N) g.
Admitted.

End explicit_Nats_one.