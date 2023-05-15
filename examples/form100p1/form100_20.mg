Infix + 360 right := add_nat.
Infix * 355 right := mul_nat.

Definition equiv_nat_mod_old : set -> set -> set -> prop
  := fun m k n => m :e omega /\ k :e omega /\ n :e omega
       /\ ((exists q :e omega, m + q * n = k)
        \/ (exists q :e omega, k + q * n = m)).

Theorem form100_20_v1_old: forall p :e omega, prime_nat p -> equiv_nat_mod_old p 1 4 -> exists a b :e omega, p = a * a + b * b.
Admitted.

Theorem form100_20_v1: forall p :e omega, prime_nat p -> equiv_nat_mod p 1 4 -> exists a b :e omega, p = a * a + b * b.
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

Definition explicit_Nats_one_divides : set -> set -> prop
 := fun m n => m :e N /\ n :e N /\ exists q :e N, q * m = n.

Definition explicit_Nats_one_prime : set -> prop
 := fun p => p :e N /\ forall n :e N, explicit_Nats_one_divides n p -> n = one \/ n = p.

Theorem form100_20_v2 : forall p :e N, explicit_Nats_one_prime p -> exists a b :e N, p = a ^ two + b ^ two.
Admitted.

End explicit_Nats_one.