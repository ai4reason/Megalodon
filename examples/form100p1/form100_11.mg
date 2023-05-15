Theorem form100_11_v1: infinite {p :e omega | prime_nat p}.
Admitted.

Theorem form100_11_v2: equip omega {p :e omega | prime_nat p}.
Admitted.

Theorem form100_11_v3: forall n :e omega, forall f:set -> set, (forall p :e omega, prime_nat p -> f p :e n) -> exists p q :e omega, prime_nat p /\ prime_nat q /\ f p = f q.
Admitted.

Section explicit_Nats_one.

Variable N : set.
Variable one : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_one_plus N one S.
Infix * 355 right := explicit_Nats_one_mult N one S.
Infix ^ 342 right := explicit_Nats_one_exp N one S.

Definition explicit_Nats_one_divides : set -> set -> prop
 := fun m n => m :e N /\ n :e N /\ exists q :e N, q * m = n.

Definition explicit_Nats_one_prime : set -> prop
 := fun p => p :e N /\ forall n :e N, explicit_Nats_one_divides n p -> n = one \/ n = p.

Hypothesis HN: explicit_Nats N one S.

Theorem form100_11_v4: infinite {p :e N | explicit_Nats_one_prime p}.
Admitted.

Theorem form100_11_v5: equip omega {p :e N | explicit_Nats_one_prime p}.
Admitted.

Theorem form100_11_v6: forall n :e omega, forall f:set -> set, (forall p :e N, explicit_Nats_one_prime p -> f p :e n) -> exists p q :e N, explicit_Nats_one_prime p /\ explicit_Nats_one_prime q /\ f p = f q.
Admitted.

End explicit_Nats_one.